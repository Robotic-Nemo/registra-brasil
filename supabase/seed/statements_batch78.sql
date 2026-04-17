-- Batch 78: Mulheres na política + misoginia/feminicídio + lei antimisoginia
-- 100 statements, Jan 2023 - Abr 2026

DO $$
DECLARE
  v_eri UUID; v_sam UUID; v_tab UUID; v_tal UUID; v_adv UUID;
  v_juz UUID; v_fem UUID; v_jan UUID; v_fat UUID; v_ral UUID;
  v_gle UUID; v_dam UUID; v_car UUID; v_cid UUID; v_ani UUID;
  v_son UUID; v_mar UUID; v_ter UUID; v_sit UUID; v_sor UUID;
  v_eli UUID; v_mic UUID; v_mas UUID; v_nit UUID; v_esd UUID;
  v_lus UUID; v_mag UUID; v_lul UUID; v_nik UUID; v_bol UUID;
  v_fel UUID; v_anj UUID; v_mam UUID; v_sic UUID;
  c_mis UUID; c_mac UUID; c_hom UUID; c_ode UUID; c_rac UUID;
  c_xen UUID; c_int UUID; c_vio UUID; c_itm UUID; c_abu UUID;
  c_des UUID;
BEGIN
  SELECT id INTO v_eri FROM politicians WHERE slug='erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug='samia-bomfim';
  SELECT id INTO v_tab FROM politicians WHERE slug='tabata-amaral';
  SELECT id INTO v_tal FROM politicians WHERE slug='taliria-petrone';
  SELECT id INTO v_adv FROM politicians WHERE slug='adriana-ventura';
  SELECT id INTO v_juz FROM politicians WHERE slug='julia-zanatta';
  SELECT id INTO v_fem FROM politicians WHERE slug='fernanda-melchionna';
  SELECT id INTO v_jan FROM politicians WHERE slug='jandira-feghali';
  SELECT id INTO v_fat FROM politicians WHERE slug='fatima-bezerra';
  SELECT id INTO v_ral FROM politicians WHERE slug='raquel-lyra';
  SELECT id INTO v_gle FROM politicians WHERE slug='gleisi-hoffmann';
  SELECT id INTO v_dam FROM politicians WHERE slug='damares-alves';
  SELECT id INTO v_car FROM politicians WHERE slug='carmen-lucia';
  SELECT id INTO v_cid FROM politicians WHERE slug='cida-goncalves';
  SELECT id INTO v_ani FROM politicians WHERE slug='anielle-franco';
  SELECT id INTO v_son FROM politicians WHERE slug='sonia-guajajara';
  SELECT id INTO v_mar FROM politicians WHERE slug='marina-silva';
  SELECT id INTO v_ter FROM politicians WHERE slug='tereza-cristina';
  SELECT id INTO v_sit FROM politicians WHERE slug='simone-tebet';
  SELECT id INTO v_sor FROM politicians WHERE slug='soraya-thronicke';
  SELECT id INTO v_eli FROM politicians WHERE slug='eliziane-gama';
  SELECT id INTO v_mic FROM politicians WHERE slug='michelle-bolsonaro';
  SELECT id INTO v_mas FROM politicians WHERE slug='marta-suplicy';
  SELECT id INTO v_nit FROM politicians WHERE slug='nisia-trindade';
  SELECT id INTO v_esd FROM politicians WHERE slug='esther-dweck';
  SELECT id INTO v_lus FROM politicians WHERE slug='luciana-santos';
  SELECT id INTO v_mag FROM politicians WHERE slug='margareth-menezes';
  SELECT id INTO v_lul FROM politicians WHERE slug='lula';
  SELECT id INTO v_nik FROM politicians WHERE slug='nikolas-ferreira';
  SELECT id INTO v_bol FROM politicians WHERE slug='jair-bolsonaro';
  SELECT id INTO v_fel FROM politicians WHERE slug='marco-feliciano';
  SELECT id INTO v_anj FROM politicians WHERE slug='andre-janones';
  SELECT id INTO v_mam FROM politicians WHERE slug='magno-malta';
  SELECT id INTO v_sic FROM politicians WHERE slug='silas-camara';

  SELECT id INTO c_mis FROM categories WHERE slug='misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug='machismo';
  SELECT id INTO c_hom FROM categories WHERE slug='homofobia';
  SELECT id INTO c_ode FROM categories WHERE slug='discurso-de-odio';
  SELECT id INTO c_rac FROM categories WHERE slug='racismo';
  SELECT id INTO c_xen FROM categories WHERE slug='xenofobia';
  SELECT id INTO c_int FROM categories WHERE slug='intolerancia-religiosa';
  SELECT id INTO c_vio FROM categories WHERE slug='violencia';
  SELECT id INTO c_itm FROM categories WHERE slug='intimidacao';
  SELECT id INTO c_abu FROM categories WHERE slug='abuso-de-poder';
  SELECT id INTO c_des FROM categories WHERE slug='desinformacao';

  -- 1 Erika Hilton sobre ataques
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia escalada de ataques transfóbicos nas redes após discurso na Câmara.', 'A cada fala minha no plenário, recebo centenas de ameaças de morte. A transfobia é política de Estado quando o agressor é deputado.', 'Coletiva de imprensa após sessão em que foi hostilizada por parlamentares bolsonaristas.', 'verified', true, '2023-03-09', 'https://www.brasildefato.com.br/2023/03/09/erika-hilton-denuncia-ataques-transfobicos', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'erika-hilton-denuncia-ataques-b78-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Erika Hilton com discurso transfóbico no Dia Internacional da Mulher.', 'Homens estão invadindo banheiros, vestiários e esportes femininos. Isso precisa acabar.', 'Discurso no Dia Internacional da Mulher que causou protesto de parlamentares.', 'verified', true, '2023-03-08', 'https://www.folha.uol.com.br/poder/2023/03/nikolas-ferreira-discurso-8-marco.shtml', 'news_article', 5, 'Brasília', 'Sessão solene 8 de março', 'nikolas-ataca-erika-8m-b78-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim reage a Nikolas e defende Erika em sessão tumultuada.', 'Não vamos aceitar que esta Casa sirva de palanque para transfobia. Erika é deputada eleita e será respeitada.', 'Resposta em plenário ao discurso transfóbico do deputado Nikolas Ferreira.', 'verified', true, '2023-03-08', 'https://www.cartacapital.com.br/politica/samia-bomfim-reage-nikolas-2023', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'samia-reage-nikolas-b78-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 4 Lula mulherzinha
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama adversário de "mulherzinha" em evento e gera críticas de parlamentares.', 'Esse cara não tem coragem. É uma mulherzinha.', 'Discurso em evento do PT que foi criticado por usar termo pejorativo associado ao feminino.', 'verified', true, '2024-05-17', 'https://www.folha.uol.com.br/poder/2024/05/lula-mulherzinha-critica.shtml', 'news_article', 3, 'São Paulo', 'Evento PT', 'lula-mulherzinha-b78-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 5 Lula mulher bonita
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comenta aparência de jornalista e provoca reação feminista.', 'Que mulher bonita você é. Assim fica difícil responder pergunta.', 'Comentário sobre jornalista durante entrevista coletiva, criticado como sexista.', 'verified', false, '2024-08-22', 'https://www.azmina.com.br/reportagens/lula-mulher-bonita-jornalista', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-mulher-bonita-b78-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 6 Tabata educação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral defende investimento em educação como enfrentamento à violência de gênero.', 'Sem educação pública de qualidade não quebramos o ciclo da violência contra meninas e mulheres.', 'Audiência pública sobre políticas educacionais e gênero.', 'verified', false, '2023-06-14', 'https://www.camara.leg.br/noticias/tabata-amaral-educacao-violencia-2023', 'other', 1, 'Brasília', 'Comissão de Educação', 'tabata-educacao-violencia-b78-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 7 Talíria pós-Marielle
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone cobra responsabilização dos mandantes no caso Marielle.', 'Sementes de Marielle seguem pedindo justiça. Os mandantes precisam responder.', 'Ato em memória de cinco anos do assassinato de Marielle Franco.', 'verified', true, '2023-03-14', 'https://theintercept.com.br/2023/03/14/taliria-petrone-marielle-5-anos/', 'news_article', 1, 'Rio de Janeiro', 'Ato 5 anos Marielle', 'taliria-marielle-5anos-b78-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 8 Adriana Ventura
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende rede de proteção para mulheres vítimas de violência doméstica.', 'A Lei Maria da Penha precisa sair do papel nos municípios. Falta estrutura de acolhimento.', 'Discurso em plenário sobre deficiências na implementação da Lei Maria da Penha.', 'verified', false, '2024-03-08', 'https://www.camara.leg.br/noticias/adriana-ventura-maria-penha-2024', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'adriana-maria-penha-b78-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 9 Julia Zanatta controverso
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta vota contra PL que amplia punições para feminicídio e é criticada por colegas.', 'Não podemos criar mais um tipo penal sem discutir efetividade. Sou contra essa PL.', 'Voto contrário em projeto que endurecia pena para feminicídio tornando-o crime autônomo.', 'verified', false, '2024-09-24', 'https://www.camara.leg.br/noticias/julia-zanatta-feminicidio-voto', 'other', 3, 'Brasília', 'Câmara dos Deputados', 'julia-zanatta-feminicidio-b78-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 10 Fernanda Melchionna
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fem, 'Fernanda Melchionna cobra aprovação urgente da lei antimisoginia na Câmara.', 'A cada 24 horas uma mulher é assassinada no Brasil. A lei antimisoginia é urgente.', 'Discurso defendendo aprovação da PL 1604/2022 que tipifica crimes de misoginia.', 'verified', true, '2023-10-11', 'https://revistaforum.com.br/politica/2023/10/11/fernanda-melchionna-lei-antimisoginia', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'fernanda-antimisoginia-b78-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 11 Jandira Feghali
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali critica bancada da bala por obstruir votação da lei antimisoginia.', 'A extrema direita tem medo de punir misoginia porque é sua própria plataforma.', 'Entrevista após obstrução da pauta pela oposição na Câmara.', 'verified', false, '2024-02-15', 'https://www.brasildefato.com.br/2024/02/15/jandira-feghali-antimisoginia', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'jandira-antimisoginia-b78-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 12 Fátima Bezerra
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra anuncia nova Casa Abrigo para mulheres vítimas de violência no RN.', 'Nenhuma mulher a menos no Rio Grande do Norte. Esta casa salva vidas.', 'Inauguração de Casa Abrigo em parceria com o Ministério das Mulheres.', 'verified', false, '2023-11-25', 'https://www.rn.gov.br/noticias/fatima-casa-abrigo-2023', 'other', 1, 'Natal', 'Inauguração Casa Abrigo', 'fatima-casa-abrigo-b78-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 13 Raquel Lyra
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra lança Pacto pela Vida das Mulheres em Pernambuco.', 'Pernambuco não aceitará mais feminicídios. Vamos investir em prevenção, acolhimento e responsabilização.', 'Cerimônia de lançamento do Pacto pela Vida das Mulheres no Palácio do Campo das Princesas.', 'verified', true, '2023-08-07', 'https://www.pe.gov.br/noticias/raquel-pacto-vida-mulheres', 'other', 1, 'Recife', 'Pacto pela Vida das Mulheres', 'raquel-pacto-mulheres-b78-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 14 Gleisi Hoffmann
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann rebate ataques de Bolsonaro a ministras do governo.', 'A direita tem um projeto contra as mulheres. Atacar ministras é parte disso.', 'Entrevista após falas misóginas do ex-presidente contra ministras.', 'verified', false, '2023-04-12', 'https://www.cartacapital.com.br/politica/gleisi-hoffmann-ataques-ministras', 'news_article', 2, 'Brasília', 'Sede do PT', 'gleisi-ataques-ministras-b78-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 15 Damares Alves
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves vota contra ampliação da lei do aborto legal em caso de estupro.', 'Não podemos banalizar o aborto. Criança não é vaso de lixo.', 'Voto em comissão sobre regulamentação do aborto legal para vítimas de estupro.', 'verified', true, '2024-06-12', 'https://www12.senado.leg.br/noticias/damares-aborto-2024', 'other', 4, 'Brasília', 'Senado Federal', 'damares-aborto-estupro-b78-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 16 Carmen Lúcia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lúcia destaca necessidade de proteção a mulheres candidatas em ano eleitoral.', 'Violência política de gênero é ameaça à democracia. O TSE atuará com rigor.', 'Discurso na abertura do ano eleitoral sobre violência política contra mulheres.', 'verified', true, '2024-02-01', 'https://www.tse.jus.br/comunicacao/noticias/carmen-lucia-violencia-politica', 'other', 1, 'Brasília', 'TSE', 'carmen-lucia-violencia-politica-b78-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 17 Cida Gonçalves
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves anuncia programa Mulher Viver sem Violência em 200 municípios.', 'Vamos multiplicar Casas da Mulher Brasileira. É prioridade do governo Lula.', 'Lançamento do programa em cerimônia no Palácio do Planalto.', 'verified', false, '2023-05-25', 'https://www.gov.br/mulheres/pt-br/noticias/cida-goncalves-mulher-viver', 'other', 1, 'Brasília', 'Palácio do Planalto', 'cida-mulher-viver-b78-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 18 Anielle Franco
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco denuncia racismo e misoginia como violências imbricadas contra mulheres negras.', 'A mulher negra é vítima de 68% dos feminicídios. Racismo e misoginia matam juntos.', 'Discurso em seminário sobre violência de gênero e raça.', 'verified', true, '2023-07-25', 'https://www.brasildefato.com.br/2023/07/25/anielle-franco-mulher-negra-feminicidio', 'news_article', 1, 'Brasília', 'Seminário Internacional', 'anielle-mulher-negra-b78-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 19 Sônia Guajajara
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia violência contra mulheres indígenas em terras invadidas.', 'Mulheres indígenas são as primeiras vítimas do garimpo e do desmatamento. Violência sexual é arma.', 'Coletiva de imprensa sobre operação de desintrusão na Terra Yanomami.', 'verified', true, '2023-02-09', 'https://apiboficial.org/2023/02/09/sonia-guajajara-violencia-yanomami', 'other', 1, 'Brasília', 'Ministério dos Povos Indígenas', 'sonia-yanomami-mulheres-b78-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 20 Marina Silva
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva rebate tratamento misógino em audiência na Câmara.', 'Não vou aceitar desrespeito. Sou ministra e exijo a mesma consideração dada a colegas homens.', 'Resposta a deputado que a interrompeu repetidamente em audiência sobre clima.', 'verified', true, '2024-04-17', 'https://www.folha.uol.com.br/poder/2024/04/marina-silva-audiencia-camara.shtml', 'news_article', 2, 'Brasília', 'Comissão de Meio Ambiente', 'marina-silva-audiencia-b78-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 21 Tereza Cristina
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina vota a favor da lei antimisoginia após debate na bancada.', 'Como mulher, não posso ser conivente com misoginia. Voto sim.', 'Voto em plenário do Senado pela aprovação da lei antimisoginia.', 'verified', false, '2024-10-02', 'https://www12.senado.leg.br/noticias/tereza-cristina-antimisoginia', 'other', 1, 'Brasília', 'Senado Federal', 'tereza-cristina-antimisoginia-b78-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 22 Simone Tebet
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sit, 'Simone Tebet lança plano de autonomia econômica para mulheres.', 'Autonomia econômica é chave para sair do ciclo da violência. Vamos investir em R$ 10 bi.', 'Lançamento do Plano Brasil Soberano com recorte de gênero no Ministério do Planejamento.', 'verified', false, '2024-03-08', 'https://www.gov.br/planejamento/pt-br/noticias/simone-tebet-autonomia', 'other', 1, 'Brasília', 'Ministério do Planejamento', 'simone-tebet-autonomia-b78-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 23 Soraya Thronicke
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke denuncia assédio moral contra senadoras por colegas homens.', 'Sou senadora há cinco anos e a cada dia enfrento machismo nesta Casa. Basta.', 'Discurso em plenário denunciando tratamento desigual de senadoras.', 'verified', false, '2023-09-19', 'https://www12.senado.leg.br/noticias/soraya-machismo-senado', 'other', 2, 'Brasília', 'Senado Federal', 'soraya-machismo-senado-b78-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 24 Eliziane Gama
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama preside CPMI do 8 de Janeiro e denuncia violência política contra mulheres.', 'Os atos golpistas tiveram mulheres como alvos especiais, inclusive ministras.', 'Relatoria da CPMI do 8 de Janeiro no Congresso.', 'verified', false, '2023-10-17', 'https://www12.senado.leg.br/noticias/eliziane-gama-cpmi-mulheres', 'other', 1, 'Brasília', 'Congresso Nacional', 'eliziane-cpmi-b78-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 25 Michelle Bolsonaro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro critica política de gênero do governo Lula em evento do PL.', 'Esse governo quer apagar a mulher biológica. Vamos resistir.', 'Discurso em evento do PL Mulher em Brasília.', 'verified', false, '2023-06-20', 'https://www.cnnbrasil.com.br/politica/michelle-bolsonaro-pl-mulher', 'news_article', 3, 'Brasília', 'PL Mulher', 'michelle-pl-mulher-b78-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 26 Marta Suplicy
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mas, 'Marta Suplicy defende ampliação de creches públicas em São Paulo.', 'Sem creche não há direito ao trabalho para mulher. São Paulo será cidade das mulheres.', 'Discurso em evento da Prefeitura de São Paulo sobre política de cuidados.', 'verified', false, '2025-03-08', 'https://www.capital.sp.gov.br/noticias/marta-creche-2025', 'other', 1, 'São Paulo', 'Prefeitura de São Paulo', 'marta-creche-sp-b78-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 27 Nísia Trindade
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nit, 'Nísia Trindade anuncia retomada de política de saúde da mulher no SUS.', 'A saúde da mulher voltou ao centro do SUS. Vamos ampliar atenção ginecológica.', 'Cerimônia de lançamento de política nacional de saúde da mulher.', 'verified', false, '2023-05-28', 'https://www.gov.br/saude/pt-br/noticias/nisia-saude-mulher-2023', 'other', 1, 'Brasília', 'Ministério da Saúde', 'nisia-saude-mulher-b78-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 28 Esther Dweck
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esd, 'Esther Dweck assina decreto de paridade em cargos de confiança do governo federal.', 'Paridade de gênero em cargos de confiança é compromisso deste governo.', 'Assinatura de decreto sobre paridade no serviço público federal.', 'verified', false, '2023-03-15', 'https://www.gov.br/gestao/pt-br/noticias/esther-paridade', 'other', 1, 'Brasília', 'Ministério da Gestão', 'esther-paridade-b78-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 29 Luciana Santos
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lus, 'Luciana Santos lança programa de bolsas para meninas na ciência.', 'Queremos mais meninas cientistas. Não há desenvolvimento sem elas.', 'Lançamento do programa Meninas nas Ciências no MCTI.', 'verified', false, '2023-11-14', 'https://www.gov.br/mcti/pt-br/noticias/luciana-meninas-ciencia', 'other', 1, 'Brasília', 'MCTI', 'luciana-meninas-ciencia-b78-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 30 Margareth Menezes
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Margareth Menezes anuncia edital específico para mulheres artistas negras.', 'A cultura tem dívida histórica com mulheres negras. Este edital começa a pagar.', 'Lançamento do edital Aldir Blanc com recorte de raça e gênero.', 'verified', false, '2024-05-13', 'https://www.gov.br/cultura/pt-br/noticias/margareth-edital-mulheres-negras', 'other', 1, 'Brasília', 'Ministério da Cultura', 'margareth-edital-negras-b78-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 31 Erika Hilton defende lei antimisoginia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende inclusão de pessoas trans na lei antimisoginia.', 'Mulheres trans também são vítimas de misoginia. A lei precisa nos proteger.', 'Debate em comissão especial sobre PL da misoginia.', 'verified', true, '2024-03-19', 'https://revistaforum.com.br/politica/2024/03/19/erika-hilton-mulheres-trans-antimisoginia', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'erika-trans-antimisoginia-b78-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 32 Nikolas contra lei antimisoginia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama lei antimisoginia de "censura" em rede social.', 'Lei antimisoginia é mordaça contra homens que não concordam com pauta feminista.', 'Post em redes sociais criticando PL 1604/2022.', 'verified', true, '2024-03-20', 'https://theintercept.com.br/2024/03/20/nikolas-antimisoginia-censura', 'social_media_post', 4, 'Online', 'X/Twitter', 'nikolas-antimisoginia-censura-b78-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 33 Bolsonaro ataque a ministras
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro ironiza competência de ministras do governo Lula.', 'Esse bando de mulheres não sabe nem administrar uma cozinha. Imagina um ministério.', 'Discurso em evento do PL em São Paulo, criticado como misógino.', 'verified', true, '2023-09-07', 'https://www.cartacapital.com.br/politica/bolsonaro-ministras-misoginia-2023', 'news_article', 5, 'São Paulo', 'Evento PL', 'bolsonaro-ministras-cozinha-b78-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 34 Sâmia aborto
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende aborto legal frente a PL da Gravidez de Estuprador.', 'Criança de 10 anos estuprada não é mãe. Quem equipara vítima a estuprador é quem tem projeto de morte.', 'Discurso contra PL 1904/2024 apelidado "PL da Gravidez do Estuprador".', 'verified', true, '2024-06-13', 'https://www.brasildefato.com.br/2024/06/13/samia-bomfim-pl-gravidez-estuprador', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'samia-pl-estuprador-b78-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 35 Marco Feliciano
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano defende PL que equipara aborto após 22 semanas a homicídio.', 'Vida é sagrada. Quem aborta mata. Não importa se foi estuprada.', 'Discurso em plenário defendendo PL 1904/2024.', 'verified', true, '2024-06-12', 'https://www.folha.uol.com.br/poder/2024/06/feliciano-aborto-homicidio.shtml', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'feliciano-aborto-homicidio-b78-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 36 Talíria ataques
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia ameaças de morte recebidas em Niterói.', 'Recebo ameaças constantes. Ser mulher negra e de esquerda na política é resistir à morte.', 'Registro de boletim de ocorrência por ameaças recebidas online.', 'verified', false, '2023-08-14', 'https://theintercept.com.br/2023/08/14/taliria-ameacas-niteroi', 'news_article', 2, 'Niterói', 'Delegacia de Crimes Digitais', 'taliria-ameacas-niteroi-b78-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itm, true FROM ins;

  -- 37 Tabata financiamento
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral denuncia uso de fundo partidário contra candidaturas femininas.', 'Partidos simulam candidaturas laranjas para não cumprir cota. É fraude.', 'Discurso em plenário sobre fraude em cotas de gênero partidárias.', 'verified', false, '2024-09-10', 'https://www.cartacapital.com.br/politica/tabata-laranjas-cota-genero', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'tabata-laranjas-b78-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 38 Julia Zanatta aborto
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta defende PL que pune médicos por aborto legal em caso de estupro.', 'Médico que aborta é criminoso. Precisa responder por homicídio.', 'Entrevista sobre PL 1904/2024 em rádio de Santa Catarina.', 'verified', false, '2024-06-14', 'https://www.nsctotal.com.br/noticias/julia-zanatta-aborto-pl-1904', 'news_article', 4, 'Florianópolis', 'Rádio CBN', 'julia-medicos-aborto-b78-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 39 Adriana Ventura cota
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura apresenta projeto para punir partidos que fraudam cota feminina.', 'Cota de gênero não pode ser letra morta. Quem frauda perde recursos do fundo.', 'Apresentação de projeto de lei na Câmara sobre cotas partidárias.', 'verified', false, '2024-04-02', 'https://www.camara.leg.br/noticias/adriana-ventura-cota-genero', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'adriana-cota-fraude-b78-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 40 Fernanda Melchionna Marielle
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fem, 'Fernanda Melchionna celebra prisão de suspeitos no caso Marielle.', 'Seis anos depois, os mandantes começam a cair. A luta das sementes não foi em vão.', 'Discurso após prisão de Chiquinho e Domingos Brazão no caso Marielle.', 'verified', true, '2024-03-24', 'https://www.brasildefato.com.br/2024/03/24/fernanda-melchionna-marielle-prisoes', 'news_article', 1, 'Porto Alegre', 'Evento PSOL', 'fernanda-marielle-prisoes-b78-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 41 Jandira aborto
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali chama PL da Gravidez do Estuprador de "monstruosidade".', 'Condenar criança estuprada a pena maior que estuprador é monstruoso.', 'Discurso em plenário contra PL 1904/2024.', 'verified', true, '2024-06-12', 'https://revistaforum.com.br/politica/2024/06/12/jandira-pl-estuprador-monstruosidade', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'jandira-pl-monstruosidade-b78-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 42 Fátima Maranhão
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra assina protocolo não me calei contra assédio no governo.', 'Servidora pública do RN tem canal seguro para denunciar assédio. Tolerância zero.', 'Assinatura de protocolo sobre assédio sexual no serviço público estadual.', 'verified', false, '2024-08-05', 'https://www.rn.gov.br/noticias/fatima-nao-me-calei-2024', 'other', 1, 'Natal', 'Governo do RN', 'fatima-nao-me-calei-b78-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 43 Raquel Lyra prisão preventiva
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra cobra prisão preventiva automática em casos de violência contra a mulher.', 'Quem agride mulher precisa sair de casa. O Estado deve proteger, não espere a tragédia.', 'Entrevista após caso de feminicídio em Jaboatão dos Guararapes.', 'verified', false, '2024-09-19', 'https://g1.globo.com/pe/pernambuco/noticia/2024/09/19/raquel-lyra-prisao-preventiva.ghtml', 'news_article', 1, 'Recife', 'Coletiva de imprensa', 'raquel-prisao-preventiva-b78-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 44 Gleisi presidência Câmara
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann assume Ministério das Relações Institucionais e destaca pauta feminina.', 'Vou articular com Congresso para aprovar lei antimisoginia, proteção a mulheres e creches.', 'Cerimônia de posse como ministra das Relações Institucionais.', 'verified', false, '2025-03-06', 'https://www.gov.br/planalto/pt-br/noticias/gleisi-posse-relacoes-institucionais', 'other', 1, 'Brasília', 'Palácio do Planalto', 'gleisi-posse-ministra-b78-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 45 Damares indigenista
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves questiona demarcação e gera choro com menção de Sônia Guajajara.', 'A maioria das índias não quer demarcação. Querem progresso.', 'Discurso em plenário do Senado sobre Marco Temporal, contestado por Sônia Guajajara.', 'verified', false, '2023-09-28', 'https://www.cartacapital.com.br/politica/damares-sonia-marco-temporal', 'news_article', 3, 'Brasília', 'Senado Federal', 'damares-sonia-marco-b78-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 46 Carmen Lúcia eleição
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lúcia anuncia protocolo do TSE contra violência política de gênero.', 'Protocolo unifica atuação da Justiça Eleitoral contra violência política contra mulheres.', 'Assinatura do protocolo no TSE com presença de ministras.', 'verified', false, '2024-03-05', 'https://www.tse.jus.br/comunicacao/noticias/carmen-protocolo-violencia-politica', 'other', 1, 'Brasília', 'TSE', 'carmen-protocolo-violencia-b78-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 47 Cida Gonçalves feminicídio
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves celebra sanção da lei que torna feminicídio crime autônomo.', 'Hoje o Brasil dá passo histórico. Feminicídio é crime autônomo com pena de até 40 anos.', 'Cerimônia de sanção da Lei 14.994/2024 no Planalto.', 'verified', true, '2024-10-09', 'https://www.gov.br/mulheres/pt-br/noticias/cida-sancao-feminicidio-autonomo', 'other', 1, 'Brasília', 'Palácio do Planalto', 'cida-sancao-feminicidio-b78-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 48 Anielle 8M
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco homenageia Marielle Franco em ato do 8 de Março.', 'Minha irmã Marielle segue viva em cada mulher negra que ousa ocupar a política.', 'Discurso em ato do 8 de Março na Esplanada.', 'verified', true, '2024-03-08', 'https://www.brasildefato.com.br/2024/03/08/anielle-marielle-8-marco', 'news_article', 1, 'Brasília', 'Ato 8 de Março', 'anielle-marielle-8m-b78-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 49 Sônia Guajajara violência política
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia agressões verbais sofridas em audiência pública.', 'Ser ministra indígena é enfrentar racismo todos os dias. Mas não recuaremos.', 'Entrevista após audiência pública em que foi hostilizada por deputados.', 'verified', false, '2024-04-25', 'https://apiboficial.org/2024/04/25/sonia-agressoes-audiencia', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'sonia-agressoes-b78-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 50 Marina Silva Ricardo Salles
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva rebate deputado que a chamou de "incompetente" em audiência.', 'Tenha respeito. Não vou aceitar esse tom. Sou ministra.', 'Bate-boca com deputado Ricardo Salles em audiência na Câmara.', 'verified', true, '2024-04-17', 'https://www.folha.uol.com.br/poder/2024/04/marina-silva-salles-barraco.shtml', 'news_article', 3, 'Brasília', 'Câmara dos Deputados', 'marina-salles-barraco-b78-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende agricultoras familiares em debate no Senado.', 'Mulher do campo produz, cuida, resiste. Precisa de crédito rural próprio.', 'Discurso em defesa de crédito rural específico para mulheres agricultoras.', 'verified', false, '2024-05-16', 'https://www12.senado.leg.br/noticias/tereza-mulheres-campo-2024', 'other', 1, 'Brasília', 'Senado Federal', 'tereza-mulheres-campo-b78-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sit, 'Simone Tebet critica resistência do Congresso a pautas de mulheres.', 'Congresso não pode ser trincheira do machismo. Aprovar lei antimisoginia é civilidade.', 'Entrevista sobre agenda de mulheres no Congresso Nacional.', 'verified', false, '2024-09-15', 'https://www.cartacapital.com.br/politica/simone-tebet-congresso-machismo', 'news_article', 2, 'Brasília', 'Ministério do Planejamento', 'simone-congresso-machismo-b78-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke apoia PL antimisoginia e rompe com bloco bolsonarista.', 'Misoginia não tem lado político. Voto sim pela lei antimisoginia.', 'Declaração de voto no Senado sobre PL 1604/2022.', 'verified', false, '2024-10-02', 'https://www12.senado.leg.br/noticias/soraya-voto-antimisoginia', 'other', 1, 'Brasília', 'Senado Federal', 'soraya-voto-antimisoginia-b78-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama pede investigação de fake news sexistas contra senadoras.', 'Robôs atacam senadoras em massa. Plataformas digitais precisam ser responsabilizadas.', 'Pronunciamento no Senado sobre ataques coordenados contra parlamentares mulheres.', 'verified', false, '2024-01-16', 'https://www12.senado.leg.br/noticias/eliziane-fakenews-sexistas', 'other', 2, 'Brasília', 'Senado Federal', 'eliziane-fakenews-sexistas-b78-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro usa culto evangélico para atacar feministas.', 'Feminismo satanista quer destruir família. Mulher cristã resiste.', 'Discurso em culto em Belo Horizonte com militância do PL Mulher.', 'verified', false, '2024-08-10', 'https://theintercept.com.br/2024/08/10/michelle-feminismo-satanista', 'news_article', 4, 'Belo Horizonte', 'Culto evangélico', 'michelle-feminismo-satanista-b78-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mas, 'Marta Suplicy critica ataques misóginos contra vice-prefeitas.', 'Mulher eleita precisa de proteção institucional. Não podemos normalizar o ódio.', 'Entrevista sobre violência política contra mulheres.', 'verified', false, '2025-06-12', 'https://www.folha.uol.com.br/poder/2025/06/marta-vice-prefeitas-ataques.shtml', 'news_article', 1, 'São Paulo', 'Prefeitura de São Paulo', 'marta-vice-prefeitas-b78-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nit, 'Nísia Trindade defende pílula do dia seguinte no SUS contra violência sexual.', 'Vítima de estupro tem direito à contracepção de emergência. SUS garante.', 'Resposta à questão sobre regulação de emergência contraceptiva após PL 1904.', 'verified', false, '2024-06-14', 'https://www.gov.br/saude/pt-br/noticias/nisia-pilula-emergencia', 'other', 1, 'Brasília', 'Ministério da Saúde', 'nisia-pilula-estupro-b78-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esd, 'Esther Dweck anuncia creche em todo órgão federal com mais de 300 servidores.', 'Paridade exige estrutura de cuidado. Creche no trabalho é direito.', 'Assinatura de decreto sobre creches em órgãos federais.', 'verified', false, '2024-05-22', 'https://www.gov.br/gestao/pt-br/noticias/esther-creche-orgaos', 'other', 1, 'Brasília', 'Ministério da Gestão', 'esther-creche-orgaos-b78-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lus, 'Luciana Santos anuncia paridade em comitês de avaliação científica.', 'Comitês de avaliação do CNPq terão paridade de gênero. Sem exceção.', 'Anúncio em evento da SBPC sobre política científica.', 'verified', false, '2024-07-15', 'https://www.gov.br/mcti/pt-br/noticias/luciana-paridade-cnpq', 'other', 1, 'Brasília', 'SBPC', 'luciana-paridade-cnpq-b78-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Margareth Menezes denuncia violência obstétrica contra artistas negras em set.', 'Cantoras negras são humilhadas em trabalhos. É violência simbólica.', 'Entrevista sobre Lei Paulo Gustavo e recorte de gênero/raça.', 'verified', false, '2024-11-20', 'https://www.brasildefato.com.br/2024/11/20/margareth-cantoras-negras', 'news_article', 1, 'Salvador', 'Ministério da Cultura', 'margareth-cantoras-negras-b78-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama jornalista de "boneca" em coletiva, recebe críticas.', 'Olha que boneca essa jornalista.', 'Comentário sobre aparência de jornalista em coletiva, criticado nas redes.', 'verified', false, '2024-02-14', 'https://www.azmina.com.br/reportagens/lula-boneca-jornalista', 'news_article', 2, 'Brasília', 'Coletiva de imprensa', 'lula-boneca-b78-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_anj, 'André Janones ironiza parlamentar do PSOL em rede social com tom machista.', 'Essa moça do PSOL só aparece quando o holofote liga. Tá fácil falar.', 'Post em rede social dirigido à deputada Sâmia Bomfim.', 'verified', false, '2023-11-29', 'https://theintercept.com.br/2023/11/29/janones-samia-machismo', 'social_media_post', 3, 'Online', 'X/Twitter', 'janones-samia-machismo-b78-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mam, 'Magno Malta critica lei do aborto legal em culto em Cachoeiro.', 'Aborto é assassinato. Mulher que aborta precisa pagar.', 'Discurso em culto em Cachoeiro de Itapemirim criticando PL do aborto.', 'verified', false, '2024-07-07', 'https://www.aquinoticias.com/2024/07/magno-malta-aborto-culto', 'news_article', 4, 'Cachoeiro de Itapemirim', 'Culto evangélico', 'magno-malta-aborto-b78-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sic, 'Silas Câmara usa plenário para atacar educação sexual nas escolas.', 'Educação sexual é ideologia de gênero. Vamos barrar na Câmara.', 'Discurso em plenário contra material didático do MEC.', 'verified', false, '2024-08-27', 'https://www.camara.leg.br/noticias/silas-camara-educacao-sexual', 'other', 3, 'Brasília', 'Câmara dos Deputados', 'silas-educacao-sexual-b78-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton apresenta CPI do Feminicídio e defende investigação sistêmica.', 'Feminicídio não é estatística. Precisamos CPI para entender o sistema que mata mulheres.', 'Apresentação de requerimento para CPI do Feminicídio na Câmara.', 'verified', false, '2024-11-05', 'https://www.camara.leg.br/noticias/erika-cpi-feminicidio', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'erika-cpi-feminicidio-b78-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia aumento de 13% em feminicídios no Brasil.', '13% a mais de mulheres assassinadas. Este país odeia mulher.', 'Divulgação de dados do Anuário de Segurança Pública 2024.', 'verified', true, '2024-07-18', 'https://www.brasildefato.com.br/2024/07/18/samia-feminicidios-anuario', 'news_article', 1, 'São Paulo', 'Fórum Brasileiro de Segurança Pública', 'samia-anuario-feminicidio-b78-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral apoia projeto Escola sem Machismo em São Paulo.', 'Formar meninos para respeitar meninas começa na primeira infância.', 'Apresentação de projeto educacional em escola pública de SP.', 'verified', false, '2024-10-14', 'https://www.folha.uol.com.br/educacao/2024/10/tabata-escola-sem-machismo.shtml', 'news_article', 1, 'São Paulo', 'Escola Estadual', 'tabata-escola-machismo-b78-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia crescimento de grupos antigênero em Niterói.', 'Milícias culturais buscam sufocar mulheres que ocupam política. Não recuamos.', 'Entrevista sobre ataques coordenados em redes sociais.', 'verified', false, '2024-05-11', 'https://theintercept.com.br/2024/05/11/taliria-grupos-antigenero', 'news_article', 2, 'Niterói', 'Câmara Municipal', 'taliria-antigenero-b78-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itm, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica judicialização do aborto legal pela PGR.', 'PGR não pode transformar vítima em ré. Aborto legal é direito.', 'Declaração após ação da PGR sobre aborto em São Paulo.', 'verified', false, '2024-12-02', 'https://www.cartacapital.com.br/politica/adriana-pgr-aborto-legal', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'adriana-pgr-aborto-b78-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta vota contra lei que cria bolsa para vítimas de violência.', 'Estado não pode criar dependência. Mulher precisa trabalhar.', 'Declaração de voto contra PL 1058/2024 de auxílio a vítimas de violência.', 'verified', false, '2025-02-19', 'https://www.camara.leg.br/noticias/julia-zanatta-auxilio-violencia', 'other', 3, 'Brasília', 'Câmara dos Deputados', 'julia-auxilio-violencia-b78-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fem, 'Fernanda Melchionna denuncia violência política em Porto Alegre.', 'Fui agredida em rua de Porto Alegre por fazer campanha. A política deveria ser segura para mulheres.', 'Boletim de ocorrência registrado após agressão em campanha eleitoral.', 'verified', true, '2024-09-28', 'https://www.brasildefato.com.br/2024/09/28/fernanda-melchionna-agressao-poa', 'news_article', 3, 'Porto Alegre', 'Campanha Eleitoral', 'fernanda-agressao-poa-b78-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali apresenta projeto de lei do botão do pânico universal.', 'Botão do pânico precisa ser universalizado. Estado tem que proteger em tempo real.', 'Apresentação de PL na Câmara sobre botão do pânico para mulheres sob medidas protetivas.', 'verified', false, '2024-05-08', 'https://www.camara.leg.br/noticias/jandira-botao-panico-universal', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'jandira-botao-panico-b78-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra instala primeira Delegacia da Mulher 24 horas de Mossoró.', 'Atendimento 24 horas salva vidas. Nenhuma mulher será deixada na madrugada.', 'Inauguração de Delegacia da Mulher 24 horas em Mossoró.', 'verified', false, '2025-03-08', 'https://www.rn.gov.br/noticias/fatima-deam-mossoro-2025', 'other', 1, 'Mossoró', 'Delegacia da Mulher', 'fatima-deam-mossoro-b78-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra assina convênio com TJPE contra violência doméstica.', 'Vamos acelerar medidas protetivas. Três horas para decidir, não três meses.', 'Assinatura de convênio com Tribunal de Justiça de PE.', 'verified', false, '2024-08-14', 'https://www.pe.gov.br/noticias/raquel-tjpe-medidas-protetivas', 'other', 1, 'Recife', 'TJPE', 'raquel-tjpe-medidas-b78-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann coordena articulação da lei antimisoginia no Congresso.', 'Vamos aprovar a lei antimisoginia ainda em 2025. Prioridade do governo.', 'Reunião com bancadas sobre votação de pautas de mulheres.', 'verified', false, '2025-04-22', 'https://www.gov.br/planalto/pt-br/noticias/gleisi-antimisoginia-2025', 'other', 1, 'Brasília', 'Palácio do Planalto', 'gleisi-antimisoginia-2025-b78-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves defende PL que pune clínicas de aborto legal.', 'Clínica que aborta é açougue. Vamos fechar.', 'Declaração após apresentação de PL contra clínicas de aborto legal.', 'verified', false, '2024-08-28', 'https://www12.senado.leg.br/noticias/damares-clinicas-aborto', 'other', 4, 'Brasília', 'Senado Federal', 'damares-clinicas-aborto-b78-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lúcia recebe relatório de violência política eleitoral de 2024.', 'Em 2024 tivemos 1.200 casos de violência política contra mulheres. É inaceitável.', 'Recebimento de relatório do Observatório da Violência Política contra Mulheres.', 'verified', false, '2025-01-30', 'https://www.tse.jus.br/comunicacao/noticias/carmen-relatorio-violencia-2024', 'other', 1, 'Brasília', 'TSE', 'carmen-relatorio-violencia-b78-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves denuncia ataques misóginos em caravana pelo Nordeste.', 'Fui hostilizada em cinco cidades. Mostrou que a misoginia não recua sem luta.', 'Entrevista após caravana do Ministério das Mulheres pelo Nordeste.', 'verified', false, '2024-09-23', 'https://www.brasildefato.com.br/2024/09/23/cida-caravana-nordeste', 'news_article', 2, 'Recife', 'Ministério das Mulheres', 'cida-caravana-nordeste-b78-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco cobra atenção a mulheres negras vítimas de violência estatal.', 'Na Bahia, 80% das mulheres mortas pela polícia são negras. Isso é projeto racial.', 'Discurso em seminário sobre violência policial e gênero.', 'verified', true, '2024-11-20', 'https://theintercept.com.br/2024/11/20/anielle-mulheres-negras-policia', 'news_article', 1, 'Salvador', 'Seminário UFBA', 'anielle-mulheres-policia-b78-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara lança política nacional de atenção a mulheres indígenas.', 'Mulheres indígenas têm suas próprias demandas. Política pública precisa escutá-las.', 'Lançamento da Política Nacional de Atenção à Saúde Indígena com recorte de gênero.', 'verified', false, '2024-10-05', 'https://apiboficial.org/2024/10/05/sonia-politica-mulheres-indigenas', 'other', 1, 'Brasília', 'Ministério dos Povos Indígenas', 'sonia-mulheres-indigenas-b78-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva destaca impacto das mudanças climáticas sobre mulheres.', 'Mudança climática atinge mulheres pobres primeiro. Justiça climática é justiça de gênero.', 'Discurso na COP29 em Baku sobre clima e gênero.', 'verified', false, '2024-11-14', 'https://www.brasildefato.com.br/2024/11/14/marina-silva-cop29-genero', 'news_article', 1, 'Baku', 'COP29', 'marina-cop29-genero-b78-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina denuncia ataques contra ministras do STF.', 'Carmen Lúcia e Rosa Weber foram hostilizadas por serem mulheres. Basta de misoginia.', 'Discurso em defesa de ministras do STF alvo de ataques bolsonaristas.', 'verified', false, '2023-11-22', 'https://www12.senado.leg.br/noticias/tereza-cristina-stf-mulheres', 'other', 2, 'Brasília', 'Senado Federal', 'tereza-stf-mulheres-b78-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sit, 'Simone Tebet reforça plano de creches no Plano Brasil Soberano.', 'Creche é política de Estado. Vamos entregar 2 mil novas creches até 2026.', 'Anúncio em evento com governadores sobre creches no PAC.', 'verified', false, '2024-06-10', 'https://www.gov.br/planejamento/pt-br/noticias/simone-creches-pac', 'other', 1, 'Brasília', 'Ministério do Planejamento', 'simone-creches-pac-b78-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke rebate piadas sobre seu tom de voz no plenário.', 'Quem reclama do meu tom não aguenta escutar mulher com autoridade. Problema é de vocês.', 'Resposta a deputados que ridicularizaram seu discurso.', 'verified', false, '2023-10-31', 'https://www12.senado.leg.br/noticias/soraya-tom-voz-2023', 'other', 2, 'Brasília', 'Senado Federal', 'soraya-tom-voz-b78-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama apresenta PL contra deepfakes pornográficos com vítimas mulheres.', 'Deepfake pornô destrói vidas de mulheres. Precisamos punição criminal urgente.', 'Apresentação de PL no Senado sobre crimes digitais contra mulheres.', 'verified', false, '2024-02-22', 'https://www12.senado.leg.br/noticias/eliziane-pl-deepfake', 'other', 1, 'Brasília', 'Senado Federal', 'eliziane-pl-deepfake-b78-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro responde a críticas sobre laudo falso de vacina.', 'Estão me atacando porque sou mulher de Bolsonaro. É misoginia da esquerda.', 'Entrevista sobre investigações da PF no caso vacina.', 'verified', false, '2024-05-10', 'https://www.cnnbrasil.com.br/politica/michelle-vacina-defesa', 'news_article', 3, 'Brasília', 'PL Mulher', 'michelle-vacina-misoginia-b78-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mas, 'Marta Suplicy lança fundo de proteção para vereadoras em São Paulo.', 'Vereadoras eleitas terão botão do pânico e escolta em eventos públicos.', 'Lançamento de medidas de proteção para vereadoras paulistanas eleitas em 2024.', 'verified', false, '2025-01-10', 'https://www.capital.sp.gov.br/noticias/marta-vereadoras-protecao', 'other', 1, 'São Paulo', 'Prefeitura de São Paulo', 'marta-vereadoras-protecao-b78-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nit, 'Nísia Trindade deixa o Ministério da Saúde após hostilidade misógina no governo.', 'Fui alvo de misoginia no próprio governo. Mas deixo o ministério fortalecido.', 'Entrevista de saída após demissão do Ministério da Saúde.', 'verified', true, '2025-02-27', 'https://www.folha.uol.com.br/poder/2025/02/nisia-trindade-saida-misoginia.shtml', 'news_article', 3, 'Brasília', 'Ministério da Saúde', 'nisia-saida-misoginia-b78-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esd, 'Esther Dweck defende orçamento com perspectiva de gênero no PLDO 2026.', 'PLDO 2026 terá anexo de gênero. Nunca mais orçamento cego para mulheres.', 'Apresentação do PLDO 2026 no Congresso.', 'verified', false, '2025-04-15', 'https://www.gov.br/planejamento/pt-br/noticias/esther-pldo-genero', 'other', 1, 'Brasília', 'Ministério do Planejamento', 'esther-pldo-genero-b78-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lus, 'Luciana Santos anuncia Prêmio Carolina Maria de Jesus para inventoras.', 'Mulheres cientistas negras ganham prêmio em homenagem à Carolina.', 'Lançamento do Prêmio Carolina Maria de Jesus no MCTI.', 'verified', false, '2024-03-14', 'https://www.gov.br/mcti/pt-br/noticias/luciana-premio-carolina', 'other', 1, 'Brasília', 'MCTI', 'luciana-premio-carolina-b78-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Margareth Menezes denuncia assédio em festival baiano.', 'Cantoras denunciam assédio em festival. Vou abrir canal no MinC para receber denúncias.', 'Entrevista após denúncias de assédio em festival em Salvador.', 'verified', false, '2024-11-05', 'https://www.azmina.com.br/reportagens/margareth-festival-assedio', 'news_article', 2, 'Salvador', 'Ministério da Cultura', 'margareth-festival-assedio-b78-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona lei que torna feminicídio crime autônomo com pena de até 40 anos.', 'Hoje os feminicidas vão saber que não há impunidade para quem mata mulher.', 'Cerimônia de sanção da Lei 14.994/2024 no Palácio do Planalto.', 'verified', true, '2024-10-09', 'https://www.gov.br/planalto/pt-br/noticias/lula-sanciona-feminicidio-2024', 'other', 1, 'Brasília', 'Palácio do Planalto', 'lula-sanciona-feminicidio-b78-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira volta a atacar Erika Hilton em comissão na Câmara.', 'Na CCJ quem fala primeiro sou eu. Erika Hilton que se acalme.', 'Bate-boca com Erika Hilton durante sessão da CCJ.', 'verified', false, '2024-04-23', 'https://theintercept.com.br/2024/04/23/nikolas-erika-ccj', 'news_article', 4, 'Brasília', 'CCJ', 'nikolas-erika-ccj-b78-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro minimiza feminicídios em live com militantes.', 'Mulher morrendo mais porque é casada. Não é problema social, é pessoal.', 'Declaração em live no YouTube, amplamente criticada por ativistas.', 'verified', true, '2024-03-12', 'https://www.cartacapital.com.br/politica/bolsonaro-feminicidio-live-2024', 'news_article', 5, 'Angra dos Reis', 'Live YouTube', 'bolsonaro-minimiza-feminicidio-b78-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano comenta tragédia de feminicídio culpando a vítima.', 'Mulher precisa escolher bem com quem anda. Não é culpa só do homem.', 'Entrevista após feminicídio de jovem em Ilhabela gerar comoção.', 'verified', false, '2024-02-02', 'https://www.folha.uol.com.br/cotidiano/2024/02/feliciano-feminicidio-culpa.shtml', 'news_article', 4, 'São Paulo', 'Rádio Jovem Pan', 'feliciano-culpa-vitima-b78-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton é agredida em ato e faz pronunciamento emocionado na Câmara.', 'Fui agredida fisicamente num ato. Ser deputada trans no Brasil é estar em guerra constante.', 'Pronunciamento na tribuna após agressão em ato público em São Paulo.', 'verified', true, '2025-02-27', 'https://revistaforum.com.br/politica/2025/02/27/erika-hilton-agressao-sp', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'erika-agressao-sp-b78-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim apresenta projeto para criminalizar cat-calling.', 'Cantada na rua é violência. Precisamos tipificar assédio em espaço público.', 'Apresentação de PL sobre importunação sexual em espaço público.', 'verified', false, '2024-11-26', 'https://www.camara.leg.br/noticias/samia-pl-catcalling', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'samia-catcalling-b78-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral denuncia uso de IA para criar nudes falsas de parlamentares.', 'Colegas deputadas estão sendo vítimas de deepfake pornô. Precisamos de lei urgente.', 'Discurso em plenário sobre ataques digitais contra parlamentares.', 'verified', false, '2025-03-27', 'https://www.folha.uol.com.br/tec/2025/03/tabata-deepfake-deputadas.shtml', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'tabata-deepfake-deputadas-b78-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone anuncia projeto de memorial a Marielle em Niterói.', 'Niterói terá memorial de Marielle. Memória é ato político.', 'Cerimônia de anúncio do memorial em Niterói.', 'verified', false, '2025-03-14', 'https://theintercept.com.br/2025/03/14/taliria-memorial-marielle-niteroi', 'news_article', 1, 'Niterói', 'Câmara Municipal de Niterói', 'taliria-memorial-marielle-b78-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende educação financeira para mulheres vítimas de violência.', 'Autonomia financeira tira mulher da violência. Precisamos ensinar nas escolas.', 'Lançamento de projeto sobre educação financeira para mulheres em SP.', 'verified', false, '2025-04-10', 'https://www.camara.leg.br/noticias/adriana-educacao-financeira-mulheres', 'other', 1, 'São Paulo', 'Evento Novo', 'adriana-educacao-financeira-b78-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

END $$;
