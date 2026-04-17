-- Batch 80: Evangelical caucus (bancada evangélica) & religious politics
-- Marco Feliciano, Damares Alves, Magno Malta, Silas Câmara, Bia Kicis
-- Religious freedom, abortion, LGBTQ+ opposition, Lula & evangelicals,
-- Janja religious events, CPMI INSS igrejas, IURD, prosperity theology
-- Jan 2023 – Apr 2026
-- 100 statements
DO $$
DECLARE
  v_mfe UUID; v_dam UUID; v_mag UUID; v_sil UUID; v_bia UUID;
  v_nik UUID; v_mic UUID; v_pab UUID; v_zan UUID; v_amd UUID;
  v_mou UUID; v_edu UUID; v_fla UUID; v_jair UUID; v_gir UUID;
  v_jul UUID; v_san UUID; v_fil UUID; v_cgi UUID; v_mej UUID;
  v_esp UUID; v_lul UUID; v_gle UUID; v_sog UUID; v_ani UUID;
  v_car UUID; v_eri UUID; v_sam UUID; v_jaf UUID; v_orl UUID;
  v_chi UUID; v_tal UUID; v_fer UUID; v_bou UUID;
  c_int UUID; c_hom UUID; c_mis UUID; c_odi UUID; c_mac UUID;
  c_des UUID; c_neg UUID; c_con UUID; c_abu UUID; c_nep UUID;
  c_cor UUID;
BEGIN
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_amd FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jul FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fil FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_mej FROM politicians WHERE slug = 'mecias-de-jesus';
  SELECT id INTO v_esp FROM politicians WHERE slug = 'esperidiao-amin';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_sog FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_jaf FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fer FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';

  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano afirma que bancada evangélica vai barrar qualquer avanço do aborto no Congresso.', 'Enquanto houver um evangélico nesta Casa, nenhuma lei que mate crianças no ventre será aprovada. Somos a voz de Deus neste parlamento.', 'Discurso em plenário da Câmara em reação ao PL do aborto em casos de estupro.', 'verified', true, '2024-06-13', 'https://www.gospelmais.com.br/marco-feliciano-bancada-evangelica-aborto-2024.html', 'news_article', 3, 'Câmara dos Deputados', 'Plenário — PL 1904', 'feliciano-bancada-aborto-b80-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves defende "pacto nacional pela família" com base em valores cristãos.', 'Precisamos de um pacto nacional pela família brasileira, construído sobre o temor a Deus e não sobre ideologias importadas que destroem nossos lares.', 'Pronunciamento no Senado em defesa de projeto que restringe políticas de gênero em escolas.', 'verified', false, '2023-05-10', 'https://www12.senado.leg.br/noticias/materias/2023/05/10/damares-pacto-familia', 'news_article', 3, 'Senado Federal', 'Plenário — debate sobre famílias', 'damares-pacto-familia-b80-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que o Brasil precisa se libertar de "pragas" e voltar a Deus.', 'O Brasil está tomado por pragas morais e só a volta a Deus pode libertar essa nação. Não tem conversa, não tem meio termo: é Jesus ou o caos.', 'Fala em culto político-evangélico em Vitória transmitido por rádios gospel.', 'verified', false, '2023-09-17', 'https://www.gospelmais.com.br/magno-malta-brasil-deus-pragas-2023.html', 'news_article', 3, 'Vitória (ES)', 'Culto político Rede Paz', 'magno-malta-pragas-brasil-b80-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara anuncia reunião da Frente Parlamentar Evangélica para barrar pautas LGBTQ+.', 'A Frente Parlamentar Evangélica está unida e não permitirá que a pauta LGBT avance neste Congresso. Vamos defender a família tradicional até o fim.', 'Coletiva da FPE após audiência com lideranças religiosas em Brasília.', 'verified', true, '2023-03-22', 'https://www.plenonews.com/politica/silas-camara-fpe-lgbt-2023/', 'news_article', 3, 'Brasília', 'Coletiva da Frente Parlamentar Evangélica', 'silas-camara-fpe-lgbt-b80-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis afirma que ideologia de gênero é "arma do demônio" contra as crianças.', 'A ideologia de gênero é uma arma do demônio contra as nossas crianças. Estamos aqui para defender a inocência e a palavra de Deus.', 'Discurso em plenário após apresentar projeto contra "ideologia de gênero" nas escolas.', 'verified', true, '2023-04-18', 'https://www.revistaoeste.com/politica/bia-kicis-ideologia-genero-demonio/', 'news_article', 4, 'Câmara dos Deputados', 'Plenário — PL Escola sem Gênero', 'bia-kicis-genero-demonio-b80-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira afirma que Lula "persegue igrejas" ao criar grupo de trabalho sobre religiões.', 'O governo Lula criou um grupo para perseguir nossas igrejas. Querem calar os pastores, censurar os cultos e acabar com a liberdade religiosa.', 'Vídeo em redes sociais após criação de grupo de trabalho no Ministério dos Direitos Humanos sobre liberdade religiosa.', 'verified', true, '2023-07-05', 'https://jovempan.com.br/noticias/politica/nikolas-ferreira-lula-perseguicao-igrejas.html', 'social_media_post', 4, 'Redes sociais', 'Vídeo no Instagram', 'nikolas-lula-persegue-igrejas-b80-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro convoca mulheres evangélicas a "orar pela libertação do Brasil".', 'Mulheres de Deus, precisamos orar pela libertação do Brasil das trevas que tomaram conta de Brasília. Nossa guerra é espiritual.', 'Encontro PL Mulher em culto evangélico no Rio de Janeiro.', 'verified', true, '2023-08-26', 'https://www.gospelmais.com.br/michelle-bolsonaro-pl-mulher-rio-2023.html', 'news_article', 3, 'Rio de Janeiro', 'Culto PL Mulher', 'michelle-orar-libertacao-b80-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal se apresenta como "ungido" e promete "reinar sobre o inimigo" em culto em São Paulo.', 'Deus me ungiu para reinar sobre o inimigo. Eu não vim para brincar, eu vim para governar em nome do Pai.', 'Fala em culto da Igreja Bola de Neve durante pré-campanha à prefeitura de SP.', 'verified', true, '2024-07-21', 'https://www.folha.uol.com.br/poder/2024/07/pablo-marcal-ungido-igreja-bola-de-neve.shtml', 'news_article', 3, 'São Paulo', 'Culto Igreja Bola de Neve', 'marcal-ungido-bola-de-neve-b80-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amd, 'André Mendonça, "terrivelmente evangélico", declara que laicidade não impede fé de juiz.', 'Ser evangélico e ser ministro do Supremo não são coisas incompatíveis. Minha fé é pessoal, mas não renego quem eu sou.', 'Entrevista a emissora gospel após acalorado debate sobre decisões do STF envolvendo pauta moral.', 'verified', false, '2024-02-14', 'https://www.plenonews.com/politica/andre-mendonca-fe-stf-2024/', 'news_article', 2, 'Brasília', 'Entrevista à Rede Gospel', 'mendonca-fe-stf-b80-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "respeita todas as religiões" mas critica uso político da fé.', 'Eu respeito evangélicos, católicos, umbandistas, ateus, todo mundo. O que não dá é transformar culto em comício para atacar o governo.', 'Entrevista coletiva no Planalto após encontro com lideranças religiosas.', 'verified', true, '2024-03-15', 'https://www1.folha.uol.com.br/poder/2024/03/lula-religiao-politica.shtml', 'news_article', 1, 'Brasília', 'Coletiva no Planalto', 'lula-respeita-religioes-b80-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano chama religiões de matriz africana de "seita" em culto em São Paulo.', 'Essas práticas de matriz africana não são religião, são seita que precisa ser combatida pela palavra de Deus.', 'Culto na Assembleia de Deus Catedral do Avivamento, amplamente repercutido em redes.', 'verified', true, '2023-11-09', 'https://www1.folha.uol.com.br/cotidiano/2023/11/feliciano-religioes-africanas-seita.shtml', 'news_article', 5, 'São Paulo', 'Culto Catedral do Avivamento', 'feliciano-seita-africana-b80-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares acusa governo Lula de "ataque às igrejas" por fiscalização do INSS.', 'O governo Lula usa a CPMI do INSS como desculpa para atacar igrejas que não votaram nele. É perseguição religiosa disfarçada.', 'Discurso no Senado durante CPMI sobre descontos irregulares do INSS que atingiu igrejas.', 'verified', true, '2025-09-10', 'https://www12.senado.leg.br/noticias/materias/2025/09/10/damares-cpmi-inss-igrejas', 'news_article', 3, 'Senado Federal', 'CPMI dos descontos do INSS', 'damares-cpmi-inss-igrejas-b80-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta afirma que "homossexualidade é pecado" em sessão solene do Senado.', 'Homossexualidade é pecado, e pecado mata. É a palavra de Deus que fala, não sou eu. Não vou mudar a Bíblia para agradar ninguém.', 'Sessão solene em homenagem a pastores evangélicos no Senado.', 'verified', true, '2023-11-23', 'https://www12.senado.leg.br/noticias/materias/2023/11/23/magno-malta-pecado', 'news_article', 4, 'Senado Federal', 'Sessão solene — pastores evangélicos', 'magno-malta-homossexualidade-pecado-b80-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende isenção fiscal ampliada para igrejas em reforma tributária.', 'Não se taxa a fé, não se taxa o altar. As igrejas levam assistência onde o Estado não chega. Reforma tributária não pode atingir a obra de Deus.', 'Discurso em plenário durante votação da reforma tributária.', 'verified', false, '2023-12-15', 'https://www.camara.leg.br/noticias/1020345-silas-camara-reforma-tributaria-igrejas', 'news_article', 2, 'Câmara dos Deputados', 'Plenário — reforma tributária', 'silas-camara-reforma-igrejas-b80-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis diz que "feminismo é coisa do diabo" em live com Nikolas.', 'Esse feminismo radical é coisa do diabo mesmo. Querem destruir a mulher, destruir a família. A mulher cristã tem que resistir.', 'Live com Nikolas Ferreira transmitida por redes sociais.', 'verified', false, '2024-03-08', 'https://www.revistaoeste.com/politica/bia-kicis-feminismo-diabo-live/', 'social_media_post', 4, 'Internet', 'Live com Nikolas Ferreira', 'bia-kicis-feminismo-diabo-b80-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira diz que "Deus escreveu a Constituição" em discurso na Câmara.', 'A Constituição brasileira foi escrita sob a proteção de Deus, e é a Ele que devemos prestar contas. Quem rejeita Deus rejeita o Brasil.', 'Discurso em sessão do Dia do Evangélico na Câmara.', 'verified', true, '2024-06-30', 'https://www.gospelmais.com.br/nikolas-ferreira-dia-evangelico-camara.html', 'news_article', 3, 'Câmara dos Deputados', 'Sessão Dia do Evangélico', 'nikolas-deus-constituicao-b80-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano defende "cura gay" como liberdade religiosa.', 'Se um homossexual procura a igreja porque quer mudar, ele tem o direito, isso é liberdade religiosa. Não existe homofobia em oferecer Cristo.', 'Entrevista à Rádio Transamérica sobre resoluções do Conselho Federal de Psicologia.', 'verified', true, '2023-10-20', 'https://www.gospelmais.com.br/feliciano-cura-gay-liberdade-religiosa-2023.html', 'news_article', 4, 'São Paulo', 'Rádio Transamérica', 'feliciano-cura-gay-b80-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia bancada evangélica por "legislar contra a existência de pessoas trans".', 'A bancada evangélica legisla contra a minha existência, contra a existência de pessoas trans e LGBTQIA+. Isso não é fé, é ódio institucionalizado.', 'Discurso em plenário em reação a PL que restringe uso do nome social.', 'verified', true, '2024-05-17', 'https://www.cartacapital.com.br/politica/erika-hilton-bancada-evangelica-trans/', 'news_article', 2, 'Câmara dos Deputados', 'Plenário — Dia contra a LGBTfobia', 'erika-hilton-bancada-evangelica-b80-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim afirma que bancada evangélica "tenta impor teocracia" no Brasil.', 'O que a bancada evangélica está fazendo é tentar impor uma teocracia ao Brasil. Estado laico não se negocia.', 'Entrevista à Carta Capital após aprovação de PL sobre "estatuto da família tradicional".', 'verified', false, '2024-04-22', 'https://www.cartacapital.com.br/politica/samia-bomfim-teocracia-bancada/', 'news_article', 2, 'Brasília', 'Entrevista à Carta Capital', 'samia-teocracia-b80-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que aborto é "sacrifício humano moderno".', 'O aborto é o sacrifício humano moderno, é uma religião de morte. Nós somos a resistência, somos os que escolhemos a vida.', 'Marcha pela Vida em Brasília.', 'verified', true, '2024-05-25', 'https://www.gospelmais.com.br/damares-marcha-pela-vida-2024-aborto-sacrificio.html', 'news_article', 3, 'Brasília', 'Marcha pela Vida 2024', 'damares-aborto-sacrificio-b80-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta convoca evangélicos para "tomar" as eleições de 2024.', 'Evangélico que não vota é evangélico que trai a Cristo. Precisamos tomar as câmaras de vereadores, tomar as prefeituras em nome do Senhor.', 'Culto da Igreja Rede Paz, Vila Velha.', 'verified', false, '2024-06-02', 'https://www.plenonews.com/politica/magno-malta-evangelicos-eleicoes-2024/', 'news_article', 3, 'Vila Velha (ES)', 'Culto Rede Paz', 'magno-malta-tomar-eleicoes-b80-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara responde a CPMI do INSS negando participação de igrejas em fraudes.', 'Nenhuma igreja séria participou desse esquema. O que houve foi desvio isolado, e quem tenta criminalizar a fé está errando feio.', 'Coletiva da Frente Parlamentar Evangélica após relatório preliminar da CPMI.', 'verified', false, '2025-10-07', 'https://www.plenonews.com/politica/silas-camara-cpmi-inss-igrejas/', 'news_article', 3, 'Brasília', 'Coletiva FPE — CPMI INSS', 'silas-cpmi-inss-igrejas-b80-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama pastora Henrique Vieira de "lobo em pele de cordeiro".', 'Esse pastor Henrique Vieira é um lobo em pele de cordeiro. Usa o nome de Jesus para defender aborto e LGBT. É a perdição.', 'Post em redes sociais em reação a fala do deputado do PSOL em plenário.', 'verified', false, '2024-08-14', 'https://www.revistaoeste.com/politica/bia-kicis-henrique-vieira/', 'social_media_post', 3, 'Redes sociais', 'Post no X', 'bia-kicis-henrique-vieira-b80-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira comemora derrota de PL do aborto atribuindo vitória "a Deus".', 'Derrotamos o PL do aborto. A vitória é de Deus, é da bancada evangélica e da família brasileira que orou.', 'Vídeo publicado no Instagram após retirada de pauta do PL 1904.', 'verified', true, '2024-06-14', 'https://www.band.uol.com.br/noticias/politica/nikolas-pl-aborto-deus-vitoria.html', 'social_media_post', 2, 'Redes sociais', 'Instagram', 'nikolas-pl-aborto-deus-b80-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita Santuário de Aparecida e pede "união entre fé e democracia".', 'Sou católico e respeito os evangélicos. Mas política se faz com projeto para o povo, não usando o nome de Deus em vão.', 'Missa em Aparecida no Dia da Padroeira do Brasil.', 'verified', true, '2023-10-12', 'https://www.oglobo.globo.com/politica/lula-aparecida-2023-fe-democracia.ghtml', 'news_article', 1, 'Aparecida (SP)', 'Missa do Dia da Padroeira', 'lula-aparecida-fe-democracia-b80-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano diz que "Brasil é um país cristão" e rejeita laicidade plena.', 'O Brasil é um país cristão, fundado sobre Cristo. Quem não gostar, pode mudar de país. Essa ideia de laicidade é para calar o evangelho.', 'Sessão solene do Dia da Bíblia na Câmara.', 'verified', true, '2023-12-14', 'https://www.gospelmais.com.br/feliciano-brasil-cristao-dia-biblia.html', 'news_article', 4, 'Câmara dos Deputados', 'Sessão Dia da Bíblia', 'feliciano-brasil-cristao-b80-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia "fundamentalismo cristão" como ameaça à democracia.', 'O fundamentalismo cristão é hoje a maior ameaça à democracia brasileira, e usa o nome de Jesus para pregar ódio contra mulheres, negros e LGBTs.', 'Audiência pública na Comissão de Direitos Humanos.', 'verified', false, '2024-07-18', 'https://www.cartacapital.com.br/politica/taliria-fundamentalismo-cristao-democracia/', 'news_article', 2, 'Câmara dos Deputados', 'Comissão de Direitos Humanos', 'taliria-fundamentalismo-b80-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que "povo evangélico elegerá presidente em 2026".', 'O povo evangélico, unido, elegerá o próximo presidente do Brasil em 2026. Vamos resgatar o país do socialismo e devolvê-lo a Deus.', 'Congresso Mulher PL em Brasília.', 'verified', true, '2025-08-15', 'https://www.plenonews.com/politica/damares-mulher-pl-evangelicos-2026/', 'news_article', 3, 'Brasília', 'Congresso Mulher PL', 'damares-evangelicos-2026-b80-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que "Lula odeia evangélico" em culto transmitido pela Record.', 'Lula odeia evangélico, faz cara feia quando entra em igreja. Ele é um lobo que veste pele de crente só em ano eleitoral.', 'Culto em Vitória transmitido pela Record News.', 'verified', true, '2024-02-25', 'https://www.gospelmais.com.br/magno-malta-lula-odeia-evangelico.html', 'news_article', 3, 'Vitória (ES)', 'Culto Rede Paz — Record News', 'magno-malta-lula-odeia-evangelico-b80-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann rebate ataques dizendo que PT "dialoga com evangélicos de bem".', 'O PT dialoga com os evangélicos de bem, aqueles que querem emprego, saúde e educação, não os que transformam a igreja em palanque.', 'Entrevista à Folha em reação ao movimento da bancada evangélica contra o governo.', 'verified', false, '2024-04-10', 'https://www1.folha.uol.com.br/poder/2024/04/gleisi-pt-evangelicos.shtml', 'news_article', 1, 'Brasília', 'Entrevista à Folha', 'gleisi-pt-evangelicos-b80-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro participa de culto com Janja na base militar e depois critica "primeira-dama petista".', 'Janja foi a um culto, mas continua apoiando aborto e ideologia de gênero. A fé dela é de fachada, a nossa é verdadeira.', 'Live no Instagram após cerimônia ecumênica com a primeira-dama.', 'verified', false, '2023-09-07', 'https://www.revistaoeste.com/politica/michelle-janja-culto-aborto/', 'social_media_post', 3, 'Redes sociais', 'Live no Instagram', 'michelle-janja-fe-fachada-b80-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sog, 'Sonia Guajajara denuncia ataques da bancada evangélica a religiões indígenas.', 'A bancada evangélica ataca nossos pajés, nossas religiões de matriz indígena como se fossem "demônios". Isso é racismo religioso.', 'Coletiva no Ministério dos Povos Indígenas após PL de evangelização indígena.', 'verified', true, '2024-03-20', 'https://www.cartacapital.com.br/politica/sonia-guajajara-racismo-religioso-indigena/', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-racismo-religioso-indigena-b80-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco afirma que intolerância contra religiões afro cresceu com a bancada evangélica.', 'Terreiros de umbanda e candomblé estão sendo atacados no Brasil inteiro, e isso tem nome: racismo religioso alimentado por discursos de ódio da bancada evangélica.', 'Audiência na Comissão de Direitos Humanos do Senado.', 'verified', true, '2024-01-19', 'https://www1.folha.uol.com.br/cotidiano/2024/01/anielle-racismo-religioso-terreiros.shtml', 'news_article', 2, 'Senado Federal', 'Audiência CDH — racismo religioso', 'anielle-terreiros-b80-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano compara movimento LGBT à "praga do Egito".', 'Esse movimento LGBT é uma praga, uma praga do Egito que caiu sobre o Brasil. Mas Deus é maior e vai livrar esse povo.', 'Pregação em congresso da Assembleia de Deus em Goiânia.', 'verified', true, '2023-07-08', 'https://www.gospelmais.com.br/feliciano-lgbt-praga-egito.html', 'news_article', 5, 'Goiânia', 'Congresso Assembleia de Deus', 'feliciano-lgbt-praga-b80-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis apresenta PL que obriga ensino de "criação divina" em escolas.', 'Se pode ensinar Darwin, pode ensinar Gênesis. A criação divina é ciência, não religião, e as crianças têm direito de conhecer.', 'Apresentação de PL na Câmara dos Deputados.', 'verified', false, '2023-06-27', 'https://www.camara.leg.br/noticias/989012-bia-kicis-pl-criacionismo', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação de PL', 'bia-kicis-criacionismo-b80-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara se reúne com bispo Macedo para articular apoio da Universal a Tarcísio.', 'Conversamos com o bispo Macedo e a Universal está atenta. O projeto de Tarcísio é o projeto das famílias evangélicas.', 'Coletiva após reunião na sede da Igreja Universal em São Paulo.', 'verified', false, '2025-11-12', 'https://www.folha.uol.com.br/poder/2025/11/silas-camara-universal-tarcisio.shtml', 'news_article', 3, 'São Paulo', 'Sede Universal do Reino de Deus', 'silas-universal-tarcisio-b80-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que "Deus colocou Bolsonaro" e "só Deus o tira da prisão".', 'Foi Deus que colocou Bolsonaro na Presidência, e é Deus que vai tirá-lo dessa injustiça. Ninguém derrota o plano do Senhor.', 'Culto Lagoinha em BH após condenação de Bolsonaro no STF.', 'verified', true, '2025-09-12', 'https://www.plenonews.com/politica/damares-bolsonaro-deus-prisao/', 'news_article', 4, 'Belo Horizonte', 'Culto Igreja Batista da Lagoinha', 'damares-deus-bolsonaro-prisao-b80-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira compara STF à "sinédrio que matou Jesus".', 'O STF de hoje é como o Sinédrio que condenou Jesus: julga em nome da lei, mas por dentro está cheio de ódio.', 'Discurso em plenário em reação a condenação de Jair Bolsonaro.', 'verified', true, '2025-09-11', 'https://www.gospelmais.com.br/nikolas-stf-sinedrio-jesus.html', 'news_article', 4, 'Câmara dos Deputados', 'Plenário — reação ao julgamento', 'nikolas-stf-sinedrio-b80-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta afirma que "arma na mão do pastor protege a família cristã".', 'Pastor também pode ter arma, pastor também precisa se defender. Arma na mão do pastor protege a família cristã.', 'Evento em apoio ao PL do armamento em Vila Velha.', 'verified', false, '2023-08-05', 'https://www.gospelmais.com.br/magno-malta-pastor-arma-familia.html', 'news_article', 4, 'Vila Velha (ES)', 'Evento PL armamento', 'magno-malta-pastor-arma-b80-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano diz que "Janja é do mal" após participar de cerimônia de umbanda.', 'Janja participou de ritual de umbanda, agora tudo se explica. Essa mulher é do mal e está corrompendo o Brasil.', 'Post em redes após Janja visitar terreiro em São Paulo.', 'verified', true, '2023-11-02', 'https://www.revistaoeste.com/politica/feliciano-janja-umbanda-mal/', 'social_media_post', 5, 'Redes sociais', 'Post no X', 'feliciano-janja-umbanda-b80-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaf, 'Jandira Feghali denuncia discurso de Feliciano como "incitação à violência religiosa".', 'Marco Feliciano incita violência contra religiões de matriz africana. Isso é crime e tem que ser tratado como tal pelo Ministério Público.', 'Coletiva no Congresso cobrando investigação.', 'verified', false, '2023-11-03', 'https://www.cartacapital.com.br/politica/jandira-feliciano-violencia-religiosa/', 'news_article', 2, 'Brasília', 'Coletiva Federação Brasil da Esperança', 'jandira-feliciano-violencia-b80-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal vende curso "Jejum dos 21 dias" misturando prosperidade e política.', 'Quem faz o jejum dos 21 dias com fé entra numa nova dimensão financeira. Deus prospera quem obedece.', 'Vídeo publicado em canal do Telegram durante pré-campanha em SP.', 'verified', true, '2024-06-25', 'https://www1.folha.uol.com.br/mercado/2024/06/marcal-jejum-21-dias-curso.shtml', 'social_media_post', 3, 'Internet', 'Telegram de Pablo Marçal', 'marcal-jejum-21-dias-b80-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar alerta sobre "teologia da prosperidade" como golpe religioso-político.', 'A teologia da prosperidade é um golpe: tira dinheiro dos pobres prometendo bênção e ainda elege políticos que aprovam leis contra esses mesmos pobres.', 'Audiência pública sobre fraudes religiosas na Alerj.', 'verified', false, '2024-09-10', 'https://www.cartacapital.com.br/politica/chico-alencar-teologia-prosperidade/', 'news_article', 2, 'Rio de Janeiro', 'Audiência Alerj', 'chico-alencar-prosperidade-b80-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano defende criação de ministério da Família e Valores Cristãos.', 'O Brasil precisa de um Ministério da Família e dos Valores Cristãos. Chega de ministério de direitos humanos que só defende bandido.', 'Proposta apresentada em reunião da FPE.', 'verified', false, '2024-10-22', 'https://www.plenonews.com/politica/feliciano-ministerio-valores-cristaos/', 'news_article', 3, 'Brasília', 'Reunião FPE', 'feliciano-ministerio-cristao-b80-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara nega irregularidade em TV Brasil Cristão após reportagem da Folha.', 'A TV Brasil Cristão é uma iniciativa evangelística, não empresa política. Folha de São Paulo persegue nosso trabalho cristão.', 'Coletiva em Manaus após reportagem sobre concessão de rádio.', 'verified', false, '2024-02-08', 'https://www1.folha.uol.com.br/poder/2024/02/silas-camara-tv-brasil-cristao.shtml', 'news_article', 3, 'Manaus', 'Coletiva em escritório parlamentar', 'silas-tv-brasil-cristao-b80-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende que "marcha para Jesus é mais legítima que o 7 de setembro oficial".', 'A Marcha para Jesus é o verdadeiro 7 de Setembro do povo brasileiro. O resto é manipulação da esquerda.', 'Participação na Marcha para Jesus em São Paulo.', 'verified', true, '2024-05-30', 'https://www.gospelmais.com.br/bia-kicis-marcha-para-jesus-2024.html', 'news_article', 3, 'São Paulo', 'Marcha para Jesus 2024', 'bia-kicis-marcha-jesus-b80-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula participa da Marcha para Jesus e é vaiado por setores evangélicos.', 'Eu vim aqui respeitar vocês. Sou cristão, fui criado assim. Presidente da República é presidente de todos, evangélicos ou não.', 'Participação na Marcha para Jesus em São Paulo sob vaias.', 'verified', true, '2023-06-08', 'https://www1.folha.uol.com.br/poder/2023/06/lula-marcha-para-jesus-vaia.shtml', 'news_article', 1, 'São Paulo', 'Marcha para Jesus 2023', 'lula-marcha-jesus-vaia-b80-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta ataca Padre Fábio de Melo por apoio a políticas LGBTQ+.', 'Esse Padre Fábio de Melo virou apóstolo da esquerda, defende LGBT, defende aborto. Não é padre, é militante.', 'Culto na Rede Paz em Vitória, trecho viralizou.', 'verified', false, '2024-07-14', 'https://www.gospelmais.com.br/magno-malta-padre-fabio-melo.html', 'news_article', 3, 'Vitória (ES)', 'Culto Rede Paz', 'magno-malta-padre-fabio-b80-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva acusa bancada evangélica de usar fake news contra o governo Lula.', 'A bancada evangélica é a principal produtora de fake news religiosa no Brasil. Espalham que Lula vai fechar igrejas, o que é absolutamente falso.', 'Entrevista à Band quando ministro das Comunicações.', 'verified', false, '2023-04-28', 'https://www.band.uol.com.br/noticias/politica/orlando-silva-bancada-fake-news-igrejas.html', 'news_article', 2, 'Brasília', 'Entrevista à Band', 'orlando-silva-bancada-fake-b80-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares revela áudio vazado em que diz "ungir" Bolsonaro para 2026.', 'Deus me mostrou em sonho: Bolsonaro volta. Unjo ele para 2026, mesmo que o sistema queira impedir.', 'Áudio vazado de grupo de WhatsApp de líderes evangélicas.', 'disputed', true, '2025-10-15', 'https://www.uol.com.br/eleicoes/2025/10/damares-audio-ungir-bolsonaro.htm', 'leaked_audio', 4, 'Brasília', 'Áudio vazado — grupo de líderes evangélicas', 'damares-audio-ungir-bolsonaro-b80-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão diz que "Brasil precisa de presidente que tema a Deus".', 'O próximo presidente do Brasil tem que temer a Deus. Sem temor a Deus, não há ética, não há patriotismo.', 'Evento militar-evangélico em Natal.', 'verified', false, '2024-04-11', 'https://www.plenonews.com/politica/general-girao-presidente-deus/', 'news_article', 2, 'Natal (RN)', 'Evento militar-evangélico', 'girao-presidente-deus-b80-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta defende PL que criminaliza "discurso anti-cristão".', 'Temos um PL para criminalizar discurso anti-cristão. Cristãos são perseguidos no Brasil e no mundo, e vamos proteger a fé.', 'Apresentação de PL na Câmara.', 'verified', false, '2024-08-01', 'https://www.revistaoeste.com/politica/julia-zanatta-pl-anti-cristao/', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação de PL', 'julia-zanatta-pl-anti-cristao-b80-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson afirma que "polícia cristã é garantia da ordem".', 'Polícia cristã, que teme a Deus, é o que garante a ordem do Brasil. Polícia sem Deus vira milícia.', 'Evento em Porto Alegre com policiais evangélicos.', 'verified', false, '2023-10-03', 'https://www.gospelmais.com.br/sanderson-policia-crista-ordem.html', 'news_article', 3, 'Porto Alegre', 'Encontro policiais evangélicos', 'sanderson-policia-crista-b80-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fil, 'Filipe Barros defende "Estado laico mas cristão" em debate universitário.', 'Laicidade não é ateísmo de Estado. O Brasil é laico, mas é cristão em sua essência, e isso está na Constituição.', 'Debate na UEL (Londrina).', 'verified', false, '2023-05-19', 'https://www.plenonews.com/politica/filipe-barros-uel-laico-cristao/', 'news_article', 2, 'Londrina (PR)', 'Debate UEL', 'filipe-barros-laico-cristao-b80-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto chama Lula de "ímpio" em sessão solene.', 'Esse presidente ímpio que aí está entregou o Brasil ao STF e às feitiçarias. Deus o retirará a seu tempo.', 'Sessão solene do Dia da Bíblia na Câmara.', 'verified', true, '2024-12-12', 'https://www.revistaoeste.com/politica/cabo-gilberto-lula-impio/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão Dia da Bíblia', 'cabo-gilberto-lula-impio-b80-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mej, 'Mecias de Jesus articula bancada evangélica para barrar demarcação como "ameaça espiritual".', 'Demarcar terras sem evangelização é jogar comunidade indígena na escuridão espiritual. Precisamos de missões, não de marcos.', 'Audiência no Senado sobre marco temporal.', 'verified', false, '2023-09-20', 'https://www12.senado.leg.br/noticias/materias/2023/09/20/mecias-evangelizacao-indigena', 'news_article', 3, 'Senado Federal', 'Audiência — marco temporal', 'mecias-marco-temporal-b80-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esp, 'Esperidião Amin articula apoio católico-conservador à bancada evangélica.', 'Católicos e evangélicos são a mesma trincheira contra o avanço do aborto e da ideologia de gênero no Brasil.', 'Reunião da Frente Parlamentar Mista em Defesa da Vida.', 'verified', false, '2024-05-08', 'https://www12.senado.leg.br/noticias/materias/2024/05/08/amin-catolicos-evangelicos', 'news_article', 2, 'Brasília', 'FP Mista em Defesa da Vida', 'amin-catolicos-evangelicos-b80-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin vota contra restrição total ao aborto em caso de estupro.', 'O direito ao aborto em caso de estupro está consolidado há décadas no direito brasileiro e não pode ser retrocedido por maioria moralista.', 'Voto em plenário do STF sobre ADPF do aborto.', 'verified', true, '2024-09-25', 'https://www1.folha.uol.com.br/poder/2024/09/zanin-voto-aborto-estupro-adpf.shtml', 'news_article', 1, 'Brasília', 'Plenário STF', 'zanin-aborto-estupro-b80-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia alerta sobre "instrumentalização da fé" por parlamentares.', 'A liberdade religiosa é sagrada, mas usar o púlpito para atacar instituições do Estado é corromper a própria fé.', 'Discurso em evento do TSE sobre desinformação religiosa em eleições.', 'verified', true, '2024-07-30', 'https://www.oglobo.globo.com/politica/carmen-lucia-fe-desinformacao-tse-2024.ghtml', 'news_article', 1, 'Brasília', 'TSE — Seminário desinformação', 'carmen-lucia-fe-tse-b80-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano chama Erika Hilton de "confusão espiritual" em plenário.', 'Erika Hilton é uma confusão espiritual viva. Homem querendo ser mulher, mulher querendo ser homem. Deus não se engana.', 'Discurso em plenário amplamente criticado.', 'verified', true, '2024-04-04', 'https://www1.folha.uol.com.br/cotidiano/2024/04/feliciano-erika-hilton-plenario.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Plenário', 'feliciano-erika-hilton-b80-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton responde Feliciano: "Não sou sua presa espiritual".', 'Marco Feliciano, não sou sua presa espiritual. O que há de confuso aqui é um parlamentar usando o cargo para atacar minorias e violar o decoro.', 'Réplica em plenário.', 'verified', true, '2024-04-04', 'https://www.cartacapital.com.br/politica/erika-hilton-resposta-feliciano/', 'news_article', 1, 'Câmara dos Deputados', 'Plenário', 'erika-responde-feliciano-b80-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares associa aborto a "pacto satânico" em pregação.', 'Onde existe aborto, existe pacto satânico. Altares de sangue estão sendo erguidos neste país, e nós seremos a barreira.', 'Pregação em congresso Fé e Vida em Goiânia.', 'verified', true, '2023-06-17', 'https://www.gospelmais.com.br/damares-aborto-pacto-satanico.html', 'news_article', 5, 'Goiânia', 'Congresso Fé e Vida', 'damares-aborto-satanico-b80-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lança campanha "Igreja na Urna" convocando voto evangélico.', 'Em 2026 a Igreja vai à urna. Cada irmão levando dez, vamos derrotar a esquerda abortista e LGBTista. Não é sugestão, é missão.', 'Live com pastores em todo o Brasil.', 'verified', true, '2025-11-20', 'https://www.plenonews.com/politica/nikolas-igreja-na-urna-2026/', 'social_media_post', 3, 'Internet', 'Live nacional de pastores', 'nikolas-igreja-urna-2026-b80-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Hamilton Mourão critica radicalização religiosa na direita.', 'Direita não pode ser refém de pastor que prega ódio. Conservadorismo cristão é diferente de fanatismo.', 'Entrevista à CNN Brasil.', 'verified', false, '2024-03-28', 'https://www.cnnbrasil.com.br/politica/mourao-radicalizacao-religiosa/', 'news_article', 1, 'Brasília', 'CNN Brasil', 'mourao-radicalizacao-religiosa-b80-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que "cristãos são perseguidos no Brasil" em fala nos EUA.', 'Christians are being persecuted in Brazil. The STF persecutes pastors, the government persecutes churches. We need international support.', 'Fala em evento da NatCon em Washington.', 'verified', true, '2024-07-10', 'https://www.revistaoeste.com/politica/eduardo-bolsonaro-cristaos-perseguidos-natcon/', 'news_article', 4, 'Washington (EUA)', 'NatCon 2024', 'eduardo-cristaos-perseguidos-b80-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro articula com bancada evangélica voto no Senado contra Lewandowski.', 'Conversei com líderes evangélicos: Ricardo Lewandowski não tem perfil para o Ministério. Ele já votou contra a vida e contra a família.', 'Plenário do Senado na sabatina.', 'verified', false, '2024-02-01', 'https://www12.senado.leg.br/noticias/materias/2024/02/01/flavio-bancada-lewandowski', 'news_article', 2, 'Senado Federal', 'Sabatina Lewandowski', 'flavio-bancada-lewandowski-b80-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Jair Bolsonaro, em prisão domiciliar, envia mensagem a congresso evangélico.', 'Irmãos, continuo firme na fé. Deus é maior que qualquer juiz. Em 2026 retornaremos vitoriosos em nome do Senhor.', 'Mensagem em áudio lida em congresso da Assembleia de Deus em Camaçari.', 'verified', true, '2025-07-22', 'https://www.gospelmais.com.br/bolsonaro-audio-assembleia-deus-camacari.html', 'news_article', 3, 'Camaçari (BA)', 'Congresso Assembleia de Deus', 'bolsonaro-audio-camacari-b80-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano é denunciado por racismo religioso pelo MP-SP.', 'Não cometi crime algum. Preguei a palavra, e isso a Constituição garante. É perseguição dos delegados petistas.', 'Coletiva após denúncia do MP por declaração sobre religiões africanas.', 'verified', true, '2024-01-30', 'https://www1.folha.uol.com.br/cotidiano/2024/01/feliciano-mp-sp-racismo-religioso.shtml', 'news_article', 4, 'São Paulo', 'Coletiva na Assembleia Legislativa', 'feliciano-mp-sp-denuncia-b80-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara nomeia filho como assessor e alega "missão familiar".', 'Meu filho está comigo porque Deus constitui a família como unidade. Não é nepotismo, é missão familiar no serviço público.', 'Entrevista a rádio gospel após reportagem da Folha.', 'verified', false, '2024-03-12', 'https://www1.folha.uol.com.br/poder/2024/03/silas-camara-filho-assessor.shtml', 'news_article', 3, 'Brasília', 'Rádio Transamérica', 'silas-filho-assessor-b80-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama comunidade científica de "ateia militante".', 'A comunidade científica brasileira virou um clube de ateus militantes que odeia tudo que seja cristão. Precisamos ciência com Deus.', 'Live em canal de YouTube conservador.', 'verified', false, '2023-11-28', 'https://www.revistaoeste.com/politica/bia-kicis-cientistas-ateus/', 'social_media_post', 3, 'Internet', 'Live em canal de YouTube', 'bia-kicis-cientistas-ateus-b80-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fer, 'Fernanda Melchionna denuncia uso eleitoral de igrejas por deputados da bancada.', 'Transformaram a igreja em palanque e o dízimo em campanha eleitoral. A Justiça Eleitoral precisa agir.', 'Representação no TSE contra abuso de poder religioso.', 'verified', false, '2024-09-02', 'https://www.cartacapital.com.br/politica/melchionna-tse-igrejas-campanha/', 'news_article', 2, 'Brasília', 'Protocolo de representação no TSE', 'melchionna-tse-igrejas-b80-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Guilherme Boulos diz que "Jesus estaria com os pobres, não com a bancada do boi".', 'Se Jesus voltasse hoje, estaria com os sem-teto, com os trabalhadores precarizados, não com a bancada do boi e os pastores milionários.', 'Comício em São Paulo durante campanha municipal de 2024.', 'verified', false, '2024-09-15', 'https://www1.folha.uol.com.br/poder/2024/09/boulos-jesus-pobres-campanha.shtml', 'news_article', 1, 'São Paulo', 'Comício — campanha municipal', 'boulos-jesus-pobres-b80-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta nega relação com casa de apostas após doação de pastor.', 'Não tenho relação com bet nenhuma. Doação que recebi foi de irmão em Cristo, e ponto final.', 'Coletiva após reportagem de O Globo sobre doações cruzadas.', 'verified', false, '2025-03-18', 'https://www.oglobo.globo.com/politica/magno-malta-bet-pastor-doacao.ghtml', 'news_article', 3, 'Vitória (ES)', 'Coletiva em gabinete', 'magno-malta-bet-pastor-b80-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares critica Janja por gesto em terreiro: "isso não é Brasil cristão".', 'A primeira-dama do Brasil não pode se curvar a orixá. Isso não é o Brasil cristão que conhecemos.', 'Discurso em plenário do Senado.', 'verified', true, '2023-11-06', 'https://www12.senado.leg.br/noticias/materias/2023/11/06/damares-janja-terreiro', 'news_article', 4, 'Senado Federal', 'Plenário', 'damares-janja-terreiro-b80-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rebate Damares: "Brasil é de todas as religiões".', 'O Brasil é de católicos, evangélicos, umbandistas, candomblecistas, espíritas, ateus. Ninguém tem monopólio de Deus.', 'Entrevista à Rádio Clube do Pará.', 'verified', true, '2023-11-10', 'https://www.oglobo.globo.com/politica/lula-brasil-todas-religioes-rebate-damares-2023.ghtml', 'news_article', 1, 'Belém (PA)', 'Rádio Clube do Pará', 'lula-brasil-todas-religioes-b80-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano participa de ato no RJ e chama ministros do STF de "inimigos de Deus".', 'Esses onze ministros do STF são inimigos de Deus, inimigos da família brasileira, e Deus os julgará.', 'Ato "Liberdade Religiosa" em Copacabana.', 'verified', true, '2025-02-25', 'https://www.plenonews.com/politica/feliciano-stf-inimigos-de-deus/', 'news_article', 5, 'Rio de Janeiro', 'Ato Liberdade Religiosa — Copacabana', 'feliciano-stf-inimigos-deus-b80-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lê Bíblia em plenário durante discurso de Erika Hilton.', 'Enquanto ela fala besteira, eu leio a palavra de Deus. Romanos 1 explica tudo que está acontecendo nesse Congresso.', 'Episódio em plenário que viralizou.', 'verified', true, '2024-04-04', 'https://www1.folha.uol.com.br/cotidiano/2024/04/nikolas-biblia-erika-hilton.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'nikolas-biblia-erika-b80-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro é ovacionada em congresso da Assembleia de Deus.', 'Vou te dizer: a mulher do Bolsonaro está na guerra espiritual pelo Brasil. Em 2026 Deus vai nos surpreender.', 'Mensagem em Convenção da Assembleia de Deus em Goiânia.', 'verified', true, '2025-04-26', 'https://www.gospelmais.com.br/michelle-bolsonaro-ad-goiania-2025.html', 'news_article', 3, 'Goiânia', 'Convenção AD Ministério Madureira', 'michelle-ad-goiania-b80-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal diz que seus "perseguidores têm demônios".', 'Quem me persegue não é só gente, é demônio atrás. Mas Deus tem planos maiores, e eu continuo firme.', 'Live no Kwai durante campanha.', 'verified', false, '2024-09-04', 'https://www.uol.com.br/eleicoes/2024/09/marcal-perseguidores-demonios-kwai.htm', 'social_media_post', 3, 'Internet', 'Live no Kwai', 'marcal-perseguidores-demonios-b80-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende "estado confessional brando" e critica laicidade.', 'O estado laico puro não existe. Todo país tem valores, e os nossos são cristãos. Somos um estado confessional brando.', 'Palestra em seminário evangélico-jurídico em Brasília.', 'verified', false, '2024-06-28', 'https://www.plenonews.com/politica/damares-estado-confessional/', 'news_article', 4, 'Brasília', 'Seminário evangélico-jurídico', 'damares-estado-confessional-b80-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano classifica decisão do STF sobre porte para uso pessoal como "heresia jurídica".', 'Liberar droga é heresia jurídica e afronta aos valores bíblicos. Evangélicos não aceitam o Brasil virando colônia de maconheiros.', 'Pronunciamento em plenário após decisão do STF.', 'verified', false, '2024-06-27', 'https://www.gospelmais.com.br/feliciano-stf-maconha-heresia.html', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'feliciano-stf-maconha-heresia-b80-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que "transgeneridade é transtorno, não identidade".', 'Transgeneridade não é identidade, é transtorno. A ciência real diz isso. Não é homofobia, é verdade.', 'Entrevista à Jovem Pan News.', 'verified', true, '2024-05-17', 'https://jovempan.com.br/noticias/politica/magno-malta-transgeneridade-transtorno.html', 'news_article', 4, 'São Paulo', 'Jovem Pan News', 'magno-malta-trans-transtorno-b80-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara pressiona Lula por ministério exclusivo da Liberdade Religiosa.', 'Esse governo precisa acordar: evangélicos são mais de um terço do país. Exigimos ministério próprio para liberdade religiosa, com ministro evangélico.', 'Reunião no Palácio do Planalto com lideranças da FPE.', 'verified', false, '2024-01-24', 'https://www.plenonews.com/politica/silas-camara-ministerio-liberdade-religiosa/', 'news_article', 3, 'Brasília', 'Reunião no Planalto', 'silas-ministerio-religioso-b80-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis critica ministra do STF por decisão sobre descriminalização.', 'Ministra do STF decide contra a Bíblia, contra a família, contra o Brasil. Evangélico que votar na esquerda traiu a Cristo.', 'Post no X após decisão do STF.', 'verified', false, '2024-06-26', 'https://www.revistaoeste.com/politica/bia-kicis-stf-ministra-biblia/', 'social_media_post', 4, 'Redes sociais', 'Post no X', 'bia-kicis-stf-ministra-biblia-b80-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que "Deus não mudou de opinião sobre o casamento" ao criticar decisão do CNJ.', 'O CNJ reconheceu poliamor como família. Deus não mudou de opinião sobre o casamento, só o homem mudou, e mal.', 'Publicação em Instagram após resolução do CNJ.', 'verified', false, '2023-07-19', 'https://www.gospelmais.com.br/nikolas-cnj-poliamor-casamento.html', 'social_media_post', 3, 'Redes sociais', 'Instagram', 'nikolas-cnj-poliamor-b80-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares vincula violência sexual a "ausência de Deus nas famílias".', 'O aumento da violência contra crianças tem uma raiz só: a ausência de Deus nas famílias. Sem Deus, tudo se corrompe.', 'Pronunciamento no Senado em comissão da infância.', 'verified', false, '2024-04-15', 'https://www12.senado.leg.br/noticias/materias/2024/04/15/damares-violencia-ausencia-deus', 'news_article', 3, 'Senado Federal', 'Comissão de Direitos da Infância', 'damares-violencia-ausencia-deus-b80-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano culpa "feminismo radical" por crise demográfica.', 'O Brasil está envelhecendo porque o feminismo radical ensinou nossas mulheres a odiar ser mãe. Isso é coisa do diabo.', 'Discurso em seminário pró-natalidade em São Paulo.', 'verified', false, '2024-10-19', 'https://www.revistaoeste.com/politica/feliciano-feminismo-demografia/', 'news_article', 4, 'São Paulo', 'Seminário pró-natalidade', 'feliciano-feminismo-demografia-b80-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta propõe CPI das "religiões esquerdistas".', 'Proponho CPI para investigar as religiões esquerdistas no Brasil, essas que defendem aborto, LGBT e droga. Isso não é religião, é militância.', 'Entrevista à Band News.', 'verified', true, '2025-01-16', 'https://www.band.uol.com.br/noticias/politica/magno-malta-cpi-religioes-esquerdistas.html', 'news_article', 4, 'Brasília', 'Band News — entrevista', 'magno-malta-cpi-religioes-esquerdistas-b80-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara afirma que "PT perdeu o evangélico para sempre".', 'PT pode fazer o que for, não volta a ter o voto evangélico. Perderam pela pauta de costumes. Ponto.', 'Entrevista à Folha sobre estratégia eleitoral de 2026.', 'verified', false, '2025-12-01', 'https://www1.folha.uol.com.br/poder/2025/12/silas-camara-pt-evangelico-2026.shtml', 'news_article', 2, 'Brasília', 'Folha — entrevista', 'silas-pt-perdeu-evangelico-b80-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle pede "jejum nacional" para libertação de Bolsonaro.', 'Convoco todas as mulheres cristãs a um jejum nacional de sete dias pela libertação do meu marido e pela restauração do Brasil.', 'Culto PL Mulher em Brasília, transmitido pela CNT.', 'verified', true, '2025-11-30', 'https://www.gospelmais.com.br/michelle-jejum-nacional-bolsonaro.html', 'news_article', 4, 'Brasília', 'Culto PL Mulher — CNT', 'michelle-jejum-nacional-b80-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal arrecada milhões em "culto de campanha" à prefeitura.', 'Quem semear na minha campanha colhe cem vezes mais. Deus multiplica a oferta do servo fiel. Essa é a lei espiritual.', 'Culto-comício em arena lotada em SP.', 'verified', true, '2024-08-25', 'https://www.folha.uol.com.br/poder/2024/08/marcal-culto-campanha-arena-sp.shtml', 'news_article', 3, 'São Paulo', 'Culto-comício Arena SP', 'marcal-culto-campanha-arena-b80-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que ex-ministério pró-vida foi desmontado por "lobby abortista".', 'O Ministério da Mulher foi desmontado pelo lobby abortista que tomou o Planalto. Mas seguimos firmes pela vida.', 'Entrevista à Record News.', 'verified', false, '2023-02-14', 'https://www.gospelmais.com.br/damares-ministerio-mulher-lobby-abortista.html', 'news_article', 3, 'Brasília', 'Record News — entrevista', 'damares-lobby-abortista-b80-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas compara a escola pública a "campo missionário".', 'A escola pública é hoje um campo missionário. Nossos filhos precisam estar lá para resgatar o Brasil da ideologia.', 'Vídeo em seu canal do YouTube.', 'verified', false, '2023-03-14', 'https://www.plenonews.com/politica/nikolas-escola-campo-missionario/', 'social_media_post', 3, 'Internet', 'YouTube — canal Nikolas Ferreira', 'nikolas-escola-missionario-b80-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano afirma que "evangélicos vão reescrever a Constituição" em 2026.', 'Se Deus nos der a maioria em 2026, vamos reescrever partes da Constituição para proteger a vida desde a concepção e a família tradicional.', 'Pré-convenção PL em São Paulo.', 'verified', true, '2026-02-15', 'https://www.revistaoeste.com/politica/feliciano-reescrever-constituicao-2026/', 'news_article', 5, 'São Paulo', 'Pré-convenção PL', 'feliciano-reescrever-constituicao-b80-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos chama Pablo Marçal de "mercador do templo".', 'Pablo Marçal é o mercador do templo que Jesus expulsou. Vende cura, vende prosperidade, vende candidatura.', 'Debate eleitoral em SP em 2024.', 'verified', true, '2024-09-30', 'https://www1.folha.uol.com.br/poder/2024/09/boulos-marcal-mercador-templo-debate.shtml', 'news_article', 1, 'São Paulo', 'Debate eleitoral Band', 'boulos-marcal-mercador-b80-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara vai à CPI do INSS e nega uso de igreja como fachada para descontos.', 'Minha igreja não é fachada de nada. Folha e UOL perseguem a obra de Deus porque não podem entender.', 'Depoimento na CPMI dos descontos do INSS.', 'verified', true, '2025-09-23', 'https://www.uol.com.br/noticias/cpmi-inss/2025/09/silas-camara-depoimento.htm', 'news_article', 4, 'Senado Federal', 'CPMI dos descontos do INSS', 'silas-camara-cpmi-depoimento-b80-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta afirma que "pastor não mente, imprensa sim".', 'Pastor de Deus não mente. Quem mente é imprensa petista. Entre crer em jornalista ou em pastor, eu fico com pastor.', 'Culto na Assembleia de Deus em Campos dos Goytacazes.', 'verified', false, '2024-06-01', 'https://www.gospelmais.com.br/magno-malta-pastor-mente-imprensa.html', 'news_article', 3, 'Campos dos Goytacazes (RJ)', 'Culto AD', 'magno-malta-pastor-imprensa-b80-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que quer ser "primeira mulher presidente cristã em 2030".', 'Se Deus quiser, em 2030 serei a primeira mulher cristã a presidir o Brasil. Mas antes, em 2026, precisamos devolver o país à direita.', 'Entrevista ao programa "Faustão" em edição especial política.', 'verified', true, '2026-03-05', 'https://www.band.uol.com.br/noticias/politica/damares-candidatura-2030-faustao.html', 'news_article', 3, 'São Paulo', 'Faustão — edição política', 'damares-candidatura-2030-b80-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano convoca "cristãos a pegar em armas simbolicamente" em culto.', 'Pega sua Bíblia como espada, pega sua fé como escudo, e vai para a batalha eleitoral. Essa guerra é espiritual e a gente não recua.', 'Culto na Catedral do Avivamento transmitido pela RedeTV Religioso.', 'verified', true, '2025-08-03', 'https://www.gospelmais.com.br/feliciano-biblia-espada-batalha.html', 'news_article', 3, 'São Paulo', 'Culto Catedral do Avivamento', 'feliciano-biblia-espada-b80-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe 60 pastores no Planalto e anuncia programa "Bolsa Família das Igrejas".', 'Anuncio hoje o programa de assistência social em parceria com igrejas de todas as denominações. Não vou brigar com a fé do povo.', 'Encontro com líderes religiosos no Palácio do Planalto.', 'verified', true, '2024-11-22', 'https://www.oglobo.globo.com/politica/lula-pastores-planalto-programa-bolsa-familia-igrejas-2024.ghtml', 'news_article', 1, 'Brasília', 'Encontro com líderes religiosos — Planalto', 'lula-pastores-planalto-b80-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

END $$;
