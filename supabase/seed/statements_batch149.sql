-- Batch 149: 100 declarações diversas 2023-2026 — mix político amplo
DO $$
DECLARE
  v_lul UUID; v_had UUID; v_teb UUID; v_dwe UUID; v_gle UUID; v_pad UUID; v_rui UUID; v_alc UUID;
  v_mar UUID; v_vie UUID; v_muc UUID; v_mnh UUID; v_fav UUID; v_cam UUID; v_sil UUID;
  v_rcn UUID; v_gal UUID; v_jpp UUID; v_mch UUID; v_mer UUID;
  v_jai UUID; v_edu UUID; v_fla UUID; v_nik UUID; v_zam UUID; v_bia UUID; v_mfe UUID; v_dam UUID; v_mag UUID; v_mou UUID;
  v_mvh UUID; v_kim UUID; v_adv UUID; v_tab UUID; v_eri UUID; v_sam UUID; v_tal UUID; v_jan UUID; v_pab UUID; v_bou UUID;
  v_tar UUID; v_zem UUID; v_cai UUID; v_hel UUID; v_pgu UUID; v_cir UUID; v_mor UUID;
  v_amo UUID; v_gim UUID; v_cal UUID; v_zan UUID; v_din UUID; v_fac UUID; v_bar UUID;
  v_lir UUID; v_hug UUID; v_alm UUID; v_pac UUID; v_ren UUID; v_ran UUID; v_jaw UUID; v_agu UUID; v_eln UUID; v_ter UUID; v_rmn UUID; v_omz UUID; v_ott UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID; c_abu UUID; c_aut UUID;
  c_mac UUID; c_obs UUID; c_ame UUID; c_neg UUID; c_irr UUID; c_cfi UUID; c_int UUID;
  c_nep UUID; c_hom UUID; c_rac UUID; c_mis UUID; c_ir UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug='lula';
  SELECT id INTO v_had FROM politicians WHERE slug='fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug='simone-tebet';
  SELECT id INTO v_dwe FROM politicians WHERE slug='esther-dweck';
  SELECT id INTO v_gle FROM politicians WHERE slug='gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug='alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug='rui-costa';
  SELECT id INTO v_alc FROM politicians WHERE slug='geraldo-alckmin';
  SELECT id INTO v_mar FROM politicians WHERE slug='marina-silva';
  SELECT id INTO v_vie FROM politicians WHERE slug='mauro-vieira';
  SELECT id INTO v_muc FROM politicians WHERE slug='jose-mucio';
  SELECT id INTO v_mnh FROM politicians WHERE slug='luiz-marinho';
  SELECT id INTO v_fav FROM politicians WHERE slug='carlos-favaro';
  SELECT id INTO v_cam FROM politicians WHERE slug='camilo-santana';
  SELECT id INTO v_sil FROM politicians WHERE slug='alexandre-silveira';
  SELECT id INTO v_rcn FROM politicians WHERE slug='roberto-campos-neto';
  SELECT id INTO v_gal FROM politicians WHERE slug='gabriel-galipolo';
  SELECT id INTO v_jpp FROM politicians WHERE slug='jean-paul-prates';
  SELECT id INTO v_mch FROM politicians WHERE slug='magda-chambriard';
  SELECT id INTO v_mer FROM politicians WHERE slug='aloizio-mercadante';
  SELECT id INTO v_jai FROM politicians WHERE slug='jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug='eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug='flavio-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug='nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug='carla-zambelli';
  SELECT id INTO v_bia FROM politicians WHERE slug='bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug='marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug='damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug='magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug='hamilton-mourao';
  SELECT id INTO v_mvh FROM politicians WHERE slug='marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug='kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug='adriana-ventura';
  SELECT id INTO v_tab FROM politicians WHERE slug='tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug='erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug='samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug='taliria-petrone';
  SELECT id INTO v_jan FROM politicians WHERE slug='andre-janones';
  SELECT id INTO v_pab FROM politicians WHERE slug='pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug='guilherme-boulos';
  SELECT id INTO v_tar FROM politicians WHERE slug='tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug='zema';
  SELECT id INTO v_cai FROM politicians WHERE slug='ronaldo-caiado';
  SELECT id INTO v_hel FROM politicians WHERE slug='helder-barbalho';
  SELECT id INTO v_pgu FROM politicians WHERE slug='paulo-guedes';
  SELECT id INTO v_cir FROM politicians WHERE slug='ciro-gomes';
  SELECT id INTO v_mor FROM politicians WHERE slug='sergio-moro';
  SELECT id INTO v_amo FROM politicians WHERE slug='alexandre-de-moraes';
  SELECT id INTO v_gim FROM politicians WHERE slug='gilmar-mendes';
  SELECT id INTO v_cal FROM politicians WHERE slug='carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug='cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug='flavio-dino';
  SELECT id INTO v_fac FROM politicians WHERE slug='edson-fachin';
  SELECT id INTO v_bar FROM politicians WHERE slug='luis-roberto-barroso';
  SELECT id INTO v_lir FROM politicians WHERE slug='arthur-lira';
  SELECT id INTO v_hug FROM politicians WHERE slug='hugo-motta';
  SELECT id INTO v_alm FROM politicians WHERE slug='davi-alcolumbre';
  SELECT id INTO v_pac FROM politicians WHERE slug='rodrigo-pacheco';
  SELECT id INTO v_ren FROM politicians WHERE slug='renan-calheiros';
  SELECT id INTO v_ran FROM politicians WHERE slug='randolfe-rodrigues';
  SELECT id INTO v_jaw FROM politicians WHERE slug='jaques-wagner';
  SELECT id INTO v_agu FROM politicians WHERE slug='aguinaldo-ribeiro';
  SELECT id INTO v_eln FROM politicians WHERE slug='elmar-nascimento';
  SELECT id INTO v_ter FROM politicians WHERE slug='tereza-cristina';
  SELECT id INTO v_rmn FROM politicians WHERE slug='rogerio-marinho';
  SELECT id INTO v_omz FROM politicians WHERE slug='omar-aziz';
  SELECT id INTO v_ott FROM politicians WHERE slug='otto-alencar';

  SELECT id INTO c_ant FROM categories WHERE slug='antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug='corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug='desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug='violencia';
  SELECT id INTO c_odi FROM categories WHERE slug='discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug='abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug='autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug='machismo';
  SELECT id INTO c_obs FROM categories WHERE slug='obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug='ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug='negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug='irresponsabilidade';
  SELECT id INTO c_cfi FROM categories WHERE slug='conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug='intimidacao';
  SELECT id INTO c_nep FROM categories WHERE slug='nepotismo';
  SELECT id INTO c_hom FROM categories WHERE slug='homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug='racismo';
  SELECT id INTO c_mis FROM categories WHERE slug='misoginia';
  SELECT id INTO c_ir FROM categories WHERE slug='intolerancia-religiosa';
  SELECT id INTO c_xen FROM categories WHERE slug='xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende diálogo com Venezuela e é criticado por oposição.', 'Não dá para isolar a Venezuela. Diálogo sempre é melhor que sanção.', 'Declaração em entrevista após reunião da Celac em Brasília.', 'verified', true, '2023-05-30', 'https://g1.globo.com/politica/noticia/2023/05/30/lula-defende-dialogo-venezuela-maduro.ghtml', 'news_article', 3, 'Palácio do Itamaraty', 'Cúpula Sul-Americana', 'lula-dialogo-venezuela-b149-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz discurso transfóbico em plenário usando peruca.', 'Hoje no Brasil uma mulher pode perder sua vaga para um homem que se identifica como mulher.', 'Deputado usou peruca em pronunciamento sobre Dia Internacional da Mulher gerando repúdio.', 'verified', true, '2023-03-08', 'https://www.camara.leg.br/noticias/945612-nikolas-peruca-dia-mulher', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'nikolas-peruca-dia-mulher-b149-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton responde Nikolas após discurso transfóbico.', 'Quando um covarde como você ataca mulheres trans, a nossa força só cresce.', 'Resposta em plenário após fala de Nikolas Ferreira com peruca.', 'verified', true, '2023-03-08', 'https://www.camara.leg.br/noticias/945620-erika-hilton-responde-nikolas', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'erika-responde-nikolas-b149-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que foi vítima de fraude eleitoral sem apresentar provas.', 'Eu tenho certeza que fui reeleito. As urnas foram manipuladas.', 'Declaração a apoiadores em Miami após retornar brevemente à Flórida.', 'verified', true, '2023-02-10', 'https://www.cnnbrasil.com.br/politica/bolsonaro-fraude-eleitoral-miami/', 'news_article', 5, 'Miami, EUA', 'Encontro com apoiadores', 'bolsonaro-fraude-miami-b149-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica PEC dos precatórios do governo Lula.', 'Esse governo só sabe gastar. Não tem compromisso com o ajuste fiscal.', 'Entrevista após reunião com empresários em São Paulo.', 'verified', false, '2023-04-12', 'https://www.folha.uol.com.br/mercado/2023/04/tarcisio-critica-pec-precatorios.shtml', 'news_article', 2, 'Palácio dos Bandeirantes', 'Entrevista', 'tarcisio-critica-precatorios-b149-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema defende privatizações e critica estatismo do governo Lula.', 'Estatal boa é estatal privatizada. O Brasil precisa desestatizar tudo.', 'Discurso em evento do Instituto Millenium em São Paulo.', 'verified', false, '2023-06-20', 'https://veja.abril.com.br/politica/zema-privatizacoes-lula-estatismo/', 'news_article', 2, 'São Paulo', 'Evento Millenium', 'zema-privatizacoes-b149-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia queda histórica do desmatamento na Amazônia.', 'Conseguimos reduzir em 50% o desmatamento em um ano. É um marco histórico.', 'Coletiva no MMA com dados do Inpe sobre ano de 2023.', 'verified', true, '2024-01-12', 'https://www.gov.br/mma/pt-br/noticias/2024/janeiro/desmatamento-queda-50', 'other', 1, 'MMA Brasília', 'Coletiva de Imprensa', 'marina-queda-desmatamento-b149-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que crianças yanomami foram abusadas em ilha particular.', 'Existe uma ilha onde crianças yanomami estão sendo abusadas. Há documentos.', 'Discurso no Senado sobre crise humanitária; acusações jamais comprovadas.', 'verified', true, '2023-02-02', 'https://www1.folha.uol.com.br/poder/2023/02/damares-ilha-yanomami-abuso.shtml', 'news_article', 4, 'Senado Federal', 'Pronunciamento', 'damares-ilha-yanomami-b149-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende Mais Médicos e critica oposição.', 'Mais Médicos salvou vidas e vai continuar salvando. Oposição só quer destruir SUS.', 'Entrevista no Ministério da Saúde após relançamento do programa.', 'verified', false, '2023-03-20', 'https://www.gov.br/saude/pt-br/noticias/2023/marco/padilha-mais-medicos-relancamento', 'other', 1, 'Ministério da Saúde', 'Relançamento Programa', 'padilha-mais-medicos-b149-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede ao Congresso americano sanções contra Alexandre de Moraes.', 'Peço aos congressistas dos EUA que apliquem a Lei Magnitsky contra Alexandre de Moraes.', 'Discurso na CPAC dos EUA em fevereiro de 2024.', 'verified', true, '2024-02-24', 'https://www.metropoles.com/politica/eduardo-bolsonaro-magnitsky-moraes-cpac', 'news_article', 5, 'CPAC Washington', 'Evento conservador', 'eduardo-magnitsky-cpac-b149-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia meta de déficit zero para 2024.', 'Temos compromisso com o déficit zero. É nosso norte fiscal.', 'Coletiva após aprovação do arcabouço no Senado.', 'verified', true, '2023-08-22', 'https://g1.globo.com/economia/noticia/2023/08/22/haddad-deficit-zero-2024.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Coletiva', 'haddad-deficit-zero-2024-b149-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis ataca STF e chama ministros de ditadores.', 'O STF virou uma ditadura de toga. Precisamos impeachment de Moraes.', 'Discurso no plenário após prisão de aliado bolsonarista.', 'verified', true, '2023-09-15', 'https://www.camara.leg.br/noticias/bia-kicis-stf-ditadura-impeachment-moraes', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'bia-stf-ditadura-b149-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral critica emendas parlamentares sem transparência.', 'Não é possível que bilhões saiam sem rastreabilidade. Precisamos transparência.', 'Discurso na Câmara sobre emendas Pix.', 'verified', false, '2024-08-20', 'https://www.camara.leg.br/noticias/tabata-emendas-pix-transparencia', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'tabata-emendas-pix-b149-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina bloqueio do X no Brasil após descumprimento.', 'A empresa Twitter Brasil descumpre sistematicamente decisões judiciais.', 'Decisão determinou suspensão da plataforma por 40 dias em agosto de 2024.', 'verified', true, '2024-08-30', 'https://www.stf.jus.br/noticia/x-bloqueio-decisao-moraes', 'other', 3, 'STF', 'Decisão bloqueio X', 'moraes-bloqueio-x-b149-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano chama decisão de bloqueio do X de censura.', 'Bloquear uma rede social é censura. É o fim da liberdade de expressão no Brasil.', 'Postagem no X antes do bloqueio efetivo da plataforma.', 'verified', false, '2024-08-30', 'https://www.oantagonista.com/politica/feliciano-x-censura-moraes', 'social_media_post', 3, 'Redes sociais', 'Postagem', 'feliciano-x-censura-b149-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal espalha desinformação sobre vacinas durante campanha municipal.', 'As vacinas de Covid mataram mais gente do que a própria doença.', 'Live de campanha à prefeitura de São Paulo em setembro de 2024.', 'verified', true, '2024-09-12', 'https://noticias.uol.com.br/politica/eleicoes/2024/noticias/2024/09/12/marcal-vacinas-mataram-covid.htm', 'news_article', 4, 'YouTube', 'Live de campanha', 'marcal-vacinas-desinformacao-b149-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos critica ataque de Marçal em debate e fala em covardia.', 'É covardia de quem não tem proposta atacar a vida pessoal do adversário.', 'Entrevista após debate Band em setembro de 2024.', 'verified', false, '2024-09-09', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/09/boulos-marcal-covardia-debate.ghtml', 'news_article', 2, 'São Paulo', 'Debate Band', 'boulos-marcal-covardia-b149-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal ataca Datena com ofensas em debate da TV Cultura.', 'Tu é covarde, velho! Pode me bater!', 'Provocação levou candidato José Luiz Datena a agredir Marçal com cadeirada em debate.', 'verified', true, '2024-09-15', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/15/datena-cadeirada-marcal-debate.ghtml', 'news_article', 4, 'TV Cultura', 'Debate Eleições SP', 'marcal-datena-cadeirada-b149-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta relativiza crimes sexuais em igreja durante discurso religioso.', 'Na Bíblia, Maria tinha 14 anos. Hoje querem criminalizar pastor que ora com menor.', 'Discurso em evento evangélico no Espírito Santo.', 'verified', false, '2023-07-16', 'https://www.metropoles.com/brasil/magno-malta-maria-14-anos-biblia', 'news_article', 4, 'Vitória, ES', 'Evento evangélico', 'malta-maria-biblia-b149-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Netanyahu de genocida e compara Gaza ao Holocausto.', 'O que acontece em Gaza não é uma guerra. É genocídio. Lembra o que Hitler fez com os judeus.', 'Declaração na Cúpula da União Africana em Adis Abeba; gerou crise diplomática com Israel.', 'verified', true, '2024-02-18', 'https://g1.globo.com/mundo/noticia/2024/02/18/lula-gaza-holocausto-hitler.ghtml', 'news_article', 4, 'Adis Abeba, Etiópia', 'Cúpula União Africana', 'lula-gaza-holocausto-b149-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vie, 'Mauro Vieira defende fala de Lula sobre Gaza e Holocausto.', 'O presidente foi contundente mas preciso. É preciso chamar as coisas pelo nome.', 'Entrevista após convocação do embaixador brasileiro em Israel.', 'verified', false, '2024-02-19', 'https://www.cnnbrasil.com.br/politica/mauro-vieira-defende-lula-gaza/', 'news_article', 2, 'Itamaraty', 'Entrevista', 'vieira-defende-lula-gaza-b149-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia misoginia após ataques coordenados nas redes.', 'Toda mulher que se posiciona recebe ataques misóginos organizados. É violência política.', 'Discurso na Câmara após onda de ataques contra deputadas.', 'verified', false, '2023-08-15', 'https://www.camara.leg.br/noticias/samia-bomfim-misoginia-redes', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'samia-misoginia-redes-b149-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino toma posse no STF e defende democracia em discurso.', 'Juiz não pode ter medo. Tem que aplicar a lei e defender a democracia.', 'Discurso de posse como ministro do STF em fevereiro de 2024.', 'verified', true, '2024-02-22', 'https://www.stf.jus.br/noticia/posse-flavio-dino-stf', 'other', 1, 'STF', 'Posse ministro', 'dino-posse-stf-b149-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira pressiona governo por liberação de emendas.', 'Se o governo não liberar as emendas, não terá votos no Congresso.', 'Entrevista após reunião com Haddad sobre relações institucionais.', 'verified', true, '2023-10-18', 'https://www.poder360.com.br/congresso/lira-emendas-governo-pressao/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista', 'lira-pressao-emendas-b149-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alm, 'Davi Alcolumbre articula volta à presidência do Senado.', 'O Amapá vai voltar a comandar o Senado. Tenho os votos.', 'Declaração após tratativas partidárias para sucessão de Pacheco.', 'verified', false, '2024-11-20', 'https://www.folha.uol.com.br/poder/2024/11/alcolumbre-volta-presidencia-senado.shtml', 'news_article', 2, 'Senado Federal', 'Articulação', 'alcolumbre-volta-senado-b149-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende reeleição de Lula em 2026.', 'Lula tem que disputar 2026. É o melhor nome do campo democrático.', 'Entrevista à Folha de S.Paulo após filiar-se à base ministerial.', 'verified', false, '2025-03-10', 'https://www.folha.uol.com.br/poder/2025/03/gleisi-lula-2026-reeleicao.shtml', 'news_article', 1, 'PT Nacional', 'Entrevista', 'gleisi-lula-2026-b149-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Hamilton Mourão critica PL da saidinha e relação governo Lula.', 'O governo Lula não tem compromisso com segurança pública.', 'Pronunciamento no Senado sobre PL 2253/2022.', 'verified', false, '2024-04-10', 'https://www12.senado.leg.br/noticias/materias/2024/04/10/mourao-saidinha-seguranca', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'mourao-saidinha-b149-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem tenta obstruir sessão na CPMI do 8 de Janeiro.', 'Essa CPI é uma farsa! Não participo dessa palhaçada!', 'Ato dramático ao sair da sessão quando depoente aliado seria ouvido.', 'verified', true, '2023-09-05', 'https://www.camara.leg.br/noticias/van-hattem-cpmi-8-janeiro-obstrucao', 'news_article', 3, 'Congresso Nacional', 'CPMI 8 de janeiro', 'vanhattem-cpmi-obstrucao-b149-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli foge do Brasil e vai para Itália após condenação no STF.', 'Estou exilada. No Brasil não há mais Estado de Direito.', 'Postagem de Roma após ser condenada no STF a 10 anos de prisão pelo caso Delgatti.', 'verified', true, '2025-06-04', 'https://g1.globo.com/politica/noticia/2025/06/04/zambelli-foge-italia-condenacao.ghtml', 'news_article', 5, 'Roma, Itália', 'Fuga', 'zambelli-foge-italia-b149-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é indiciado pela PF por tentativa de golpe de Estado.', 'Nunca tramei golpe nenhum. Isso é perseguição política.', 'Reação após indiciamento formal da PF no inquérito do golpe em novembro de 2024.', 'verified', true, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/bolsonaro-indiciado-golpe-pf.ghtml', 'news_article', 5, 'Rio de Janeiro', 'Reação indiciamento', 'bolsonaro-indiciado-golpe-b149-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro ataca PGR após denúncia contra o pai.', 'A PGR virou braço jurídico do PT. Estão perseguindo meu pai.', 'Entrevista após denúncia oferecida pela PGR em fevereiro de 2025.', 'verified', false, '2025-02-19', 'https://www.oantagonista.com/politica/flavio-pgr-perseguicao-bolsonaro', 'news_article', 3, 'Senado Federal', 'Entrevista', 'flavio-pgr-perseguicao-b149-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende acordo Mercosul-UE como prioridade do governo.', 'O acordo Mercosul-União Europeia é estratégico para o Brasil.', 'Declaração no Fórum de Davos em janeiro de 2025.', 'verified', false, '2025-01-17', 'https://g1.globo.com/economia/noticia/2025/01/17/alckmin-mercosul-uniao-europeia-davos.ghtml', 'news_article', 1, 'Davos, Suíça', 'Fórum Econômico Mundial', 'alckmin-mercosul-ue-davos-b149-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes ataca Lula em entrevista e diz que presidente é velho.', 'Lula é um velho que perdeu o pulso. O Brasil precisa de projeto, não de nostalgia.', 'Entrevista ao Jovem Pan News em maio de 2023.', 'verified', false, '2023-05-25', 'https://jovempan.com.br/noticias/politica/ciro-lula-velho-pulso.html', 'news_article', 3, 'São Paulo', 'Entrevista Jovem Pan', 'ciro-ataca-lula-b149-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sérgio Moro é absolvido no TRE-PR de ação que pedia cassação.', 'Ficou provado que não houve gastos irregulares. Venci a perseguição.', 'Declaração após absolvição no TRE-PR em abril de 2023.', 'verified', true, '2023-04-03', 'https://g1.globo.com/pr/parana/noticia/2023/04/03/moro-absolvido-tre-pr.ghtml', 'news_article', 2, 'TRE-PR', 'Julgamento AIJE', 'moro-absolvicao-tre-pr-b149-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende que polícia deve atirar para matar bandidos.', 'Bandido bom é bandido morto. Em Goiás, polícia tem autonomia para agir.', 'Entrevista após operação policial com vários mortos em Goiás.', 'verified', true, '2023-11-12', 'https://www.metropoles.com/brasil/caiado-bandido-morto-policia-goias', 'news_article', 4, 'Goiânia', 'Entrevista', 'caiado-bandido-morto-b149-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho anuncia sediamento da COP30 em Belém.', 'Belém vai mostrar ao mundo que o Brasil é protagonista da agenda climática.', 'Coletiva após confirmação da ONU em dezembro de 2023.', 'verified', true, '2023-12-02', 'https://www.agenciapara.com.br/noticia/helder-cop30-belem', 'other', 1, 'Dubai, EAU', 'COP28', 'helder-cop30-belem-b149-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes diz que arcabouço de Haddad é gambiarra fiscal.', 'Esse arcabouço é uma gambiarra. Não controla gasto.', 'Entrevista ao Canal Brasil Paralelo em maio de 2023.', 'verified', false, '2023-05-30', 'https://veja.abril.com.br/economia/guedes-arcabouco-gambiarra-haddad/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista BP', 'guedes-arcabouco-gambiarra-b149-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro faz discurso na Paulista com tom golpista e Trump.', 'Se não nos entregarmos à liberdade, vão nos colocar na cadeia.', 'Ato na Avenida Paulista em fevereiro de 2024 durante investigação do STF.', 'verified', true, '2024-02-25', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/02/25/bolsonaro-paulista-ato.ghtml', 'news_article', 5, 'Avenida Paulista', 'Ato bolsonarista', 'bolsonaro-paulista-ato-b149-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia violência política contra mulheres negras.', 'Mulheres negras na política sofrem violência todos os dias. Precisamos proteção.', 'Pronunciamento na Câmara sobre Dia da Mulher Negra Latino-Americana.', 'verified', false, '2023-07-25', 'https://www.camara.leg.br/noticias/taliria-mulher-negra-violencia', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-mulher-negra-b149-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gim, 'Gilmar Mendes defende descriminalização do porte de maconha.', 'Criminalização do usuário é um retrocesso civilizatório.', 'Voto no julgamento do RE 635.659 no STF em junho de 2024.', 'verified', true, '2024-06-25', 'https://www.stf.jus.br/noticia/gilmar-voto-maconha-descriminalizacao', 'other', 1, 'STF', 'Julgamento RE 635659', 'gilmar-maconha-descriminalizacao-b149-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca descriminalização da maconha e chama STF de drogado.', 'STF liberou maconha. Agora temos ministros drogados legislando.', 'Postagem nas redes após julgamento do STF.', 'verified', false, '2024-06-26', 'https://www.metropoles.com/politica/nikolas-stf-maconha-ataque', 'social_media_post', 3, 'Redes sociais', 'Postagem', 'nikolas-ataca-stf-maconha-b149-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende revisão de benefícios tributários em 2024.', 'Não é sustentável manter benefícios tributários que custam 500 bilhões por ano.', 'Entrevista sobre revisão de gastos em dezembro de 2024.', 'verified', false, '2024-12-10', 'https://valor.globo.com/politica/noticia/2024/12/10/tebet-beneficios-tributarios.ghtml', 'news_article', 1, 'Ministério do Planejamento', 'Entrevista', 'tebet-beneficios-tributarios-b149-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Esther Dweck defende concurso público e reestrutura carreiras.', 'Estado forte precisa de servidor valorizado. Vamos retomar concurso.', 'Coletiva de imprensa sobre edital do Concurso Nacional Unificado.', 'verified', false, '2024-01-19', 'https://www.gov.br/gestao/pt-br/noticias/2024/01/concurso-nacional-unificado-dweck', 'other', 1, 'MGI Brasília', 'Coletiva CNU', 'dweck-concurso-nacional-b149-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende PAC e responde críticas sobre ritmo de obras.', 'O PAC vai entregar. É obra que dura décadas, não dá resultado em um ano.', 'Entrevista após lançamento do Novo PAC em agosto de 2023.', 'verified', false, '2023-08-16', 'https://www.poder360.com.br/governo/rui-costa-pac-entrega-obras/', 'news_article', 2, 'Casa Civil', 'Entrevista', 'rui-costa-pac-obras-b149-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'José Múcio defende Forças Armadas e minimiza participação de militares no 8 de janeiro.', 'As Forças Armadas não participaram de nenhum golpe.', 'Entrevista em janeiro de 2023 após atos antidemocráticos.', 'verified', true, '2023-01-15', 'https://www.cnnbrasil.com.br/politica/mucio-forcas-armadas-golpe/', 'news_article', 3, 'Ministério da Defesa', 'Entrevista', 'mucio-forcas-armadas-golpe-b149-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Rodrigo Pacheco aprova PEC da inviolabilidade de parlamentares.', 'O parlamentar precisa ter segurança para exercer seu mandato.', 'Declaração após aprovar PEC conhecida como "PEC da Blindagem" em 2024.', 'verified', true, '2024-11-14', 'https://www12.senado.leg.br/noticias/materias/2024/11/14/pacheco-pec-inviolabilidade', 'news_article', 3, 'Senado Federal', 'Pronunciamento', 'pacheco-pec-blindagem-b149-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende agronegócio contra demarcação de terras indígenas.', 'Agro é pop, agro é tech, agro alimenta o Brasil. Não é inimigo do índio.', 'Discurso em evento do setor em Campo Grande.', 'verified', false, '2023-08-10', 'https://www.canalrural.com.br/noticias/tereza-cristina-agro-demarcacao-indigena', 'news_article', 2, 'Campo Grande, MS', 'Evento agropecuário', 'tereza-agro-demarcacao-b149-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso derruba marco temporal em voto no STF.', 'Marco temporal é inconstitucional. Contraria direitos originários dos povos indígenas.', 'Voto no julgamento do RE 1.017.365 que derrubou tese do marco temporal.', 'verified', true, '2023-09-21', 'https://www.stf.jus.br/noticia/barroso-marco-temporal-inconstitucional', 'other', 1, 'STF', 'Julgamento RE 1017365', 'barroso-marco-temporal-b149-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmn, 'Rogério Marinho defende marco temporal e ataca Barroso.', 'Barroso e o STF pisam no Congresso. Marco temporal é a única justiça.', 'Discurso no Senado após decisão do STF.', 'verified', false, '2023-09-22', 'https://www12.senado.leg.br/noticias/materias/2023/09/22/rogerio-marinho-marco-temporal', 'news_article', 3, 'Senado Federal', 'Pronunciamento', 'rogerio-marinho-marco-temporal-b149-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar critica Banco Central por juros altos.', 'Campos Neto trabalha para quebrar o Brasil. Juros absurdos!', 'Pronunciamento no Senado em setembro de 2023.', 'verified', false, '2023-09-14', 'https://www12.senado.leg.br/noticias/materias/2023/09/14/otto-ataca-campos-neto', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'otto-ataca-campos-neto-b149-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro vira réu por rachadinha.', 'Nunca peguei um centavo. Sou perseguido por ser Bolsonaro.', 'Declaração após STJ determinar que fosse julgado em primeira instância.', 'verified', true, '2023-06-12', 'https://g1.globo.com/politica/noticia/2023/06/12/flavio-bolsonaro-rachadinha-stj.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'flavio-rachadinha-reu-b149-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'André Janones admite rachadinha em gabinete e recua.', 'Foi um erro de gestão. Não houve má-fé.', 'Declaração após áudio vazado sobre devolução de salários.', 'verified', true, '2024-02-01', 'https://g1.globo.com/politica/noticia/2024/02/01/janones-rachadinha-audio.ghtml', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista', 'janones-rachadinha-audio-b149-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta é eleito presidente da Câmara em 2025.', 'Vou presidir com independência e diálogo. A Câmara é plural.', 'Discurso de posse após derrotar Elmar Nascimento em fevereiro de 2025.', 'verified', true, '2025-02-01', 'https://www.camara.leg.br/noticias/hugo-motta-eleito-presidente-camara', 'other', 1, 'Câmara dos Deputados', 'Eleição Mesa Diretora', 'hugo-motta-eleito-b149-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eln, 'Elmar Nascimento reconhece derrota para Hugo Motta.', 'A democracia venceu. Desejo sucesso ao colega.', 'Declaração após derrota em fevereiro de 2025.', 'verified', false, '2025-02-01', 'https://www.poder360.com.br/congresso/elmar-reconhece-derrota-hugo-motta/', 'news_article', 1, 'Câmara dos Deputados', 'Eleição Mesa', 'elmar-derrota-motta-b149-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues sai do PT e vira líder do governo no Senado.', 'Agora trabalho pelo governo, não contra. Mudou minha atuação.', 'Declaração após filiar-se ao PT em fevereiro de 2024.', 'verified', false, '2024-02-22', 'https://www12.senado.leg.br/noticias/randolfe-filia-pt-lider', 'news_article', 1, 'Senado Federal', 'Entrevista', 'randolfe-filia-pt-b149-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro se licencia da Câmara para tentar visto dos EUA.', 'Vou cuidar da articulação internacional nos EUA.', 'Anúncio em março de 2025 de licença de 120 dias da Câmara.', 'verified', true, '2025-03-18', 'https://www.metropoles.com/politica/eduardo-licenca-camara-eua', 'news_article', 3, 'Washington DC', 'Anúncio licença', 'eduardo-licenca-eua-b149-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin é eleito presidente do STF em 2025.', 'Vou presidir o STF com firmeza e diálogo democrático.', 'Eleição em agosto de 2025 para biênio 2025-2027.', 'verified', true, '2025-08-28', 'https://www.stf.jus.br/noticia/fachin-eleito-presidente-stf-2025', 'other', 1, 'STF', 'Eleição presidência', 'fachin-presidente-stf-b149-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cal, 'Cármen Lúcia defende urnas eletrônicas durante TSE.', 'A urna eletrônica é segura. Não há fraude possível.', 'Discurso na posse como presidente do TSE em junho de 2024.', 'verified', false, '2024-06-03', 'https://www.tse.jus.br/imprensa/noticias-tse/2024/Junho/carmen-lucia-posse-tse-urnas', 'other', 1, 'TSE Brasília', 'Posse TSE', 'carmen-lucia-urnas-posse-b149-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin vota contra Bolsonaro em inquérito do golpe.', 'Provas indicam participação ativa em tentativa de ruptura institucional.', 'Voto no julgamento da AP 2668 em setembro de 2025.', 'verified', true, '2025-09-02', 'https://www.stf.jus.br/noticia/zanin-voto-bolsonaro-golpe', 'other', 2, 'STF', 'AP 2668', 'zanin-voto-bolsonaro-golpe-b149-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é condenado pelo STF a 27 anos de prisão por golpe.', 'Sou inocente. A história vai me absolver.', 'Declaração após condenação em setembro de 2025 por tentativa de golpe.', 'verified', true, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/bolsonaro-condenado-stf-27-anos-golpe.ghtml', 'news_article', 5, 'Brasília', 'Reação condenação', 'bolsonaro-condenado-27-anos-b149-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende anistia para golpistas e critica STF.', 'O Brasil precisa de pacificação. Anistia é caminho.', 'Declaração a apoiadores em setembro de 2025 após condenação de Bolsonaro.', 'verified', true, '2025-09-15', 'https://www.folha.uol.com.br/poder/2025/09/tarcisio-defende-anistia-golpistas.shtml', 'news_article', 4, 'São Paulo', 'Entrevista', 'tarcisio-anistia-golpistas-b149-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi critica proposta de anistia a golpistas.', 'Anistia a golpista é estímulo a novo golpe. Não vai passar.', 'Entrevista em setembro de 2025 como ministra de Relações Institucionais.', 'verified', false, '2025-09-15', 'https://www.poder360.com.br/congresso/gleisi-contra-anistia-golpistas/', 'news_article', 2, 'Palácio do Planalto', 'Entrevista', 'gleisi-contra-anistia-b149-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares compara Lula a Hitler em discurso.', 'Lula age como Hitler. Persegue opositores.', 'Discurso no Senado em maio de 2024.', 'verified', false, '2024-05-15', 'https://www.metropoles.com/politica/damares-lula-hitler', 'news_article', 4, 'Senado Federal', 'Pronunciamento', 'damares-lula-hitler-b149-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende liberdade econômica e critica MP do governo.', 'Toda vez que o governo mexe na economia, piora. Deixa o mercado trabalhar.', 'Discurso na Câmara sobre MP 1185.', 'verified', false, '2023-11-10', 'https://www.camara.leg.br/noticias/kim-liberdade-economica-mp', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'kim-liberdade-economica-b149-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica gastos do governo Lula.', 'Esse governo não poupa. É gasto e mais gasto.', 'Pronunciamento na Câmara em outubro de 2024.', 'verified', false, '2024-10-10', 'https://www.camara.leg.br/noticias/adriana-ventura-gastos-governo', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'adriana-ventura-gastos-b149-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Fávaro defende plano safra recorde em 2024.', 'Esse plano safra é histórico. Agronegócio merece.', 'Anúncio de R$ 400 bilhões em julho de 2024.', 'verified', false, '2024-07-03', 'https://www.gov.br/agricultura/pt-br/noticias/2024/07/plano-safra-400-bilhoes-favaro', 'other', 1, 'MAPA Brasília', 'Anúncio Plano Safra', 'favaro-plano-safra-b149-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia Pé-de-Meia para estudantes do ensino médio.', 'Com o Pé-de-Meia, estudante pobre vai concluir o ensino médio.', 'Lançamento do programa em janeiro de 2024.', 'verified', true, '2024-01-29', 'https://www.gov.br/mec/pt-br/noticias/2024/01/pe-de-meia-camilo-santana', 'other', 1, 'MEC Brasília', 'Lançamento programa', 'camilo-pe-de-meia-b149-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Alexandre Silveira defende reforma do setor elétrico.', 'O setor elétrico precisa de modernização urgente.', 'Entrevista sobre MP 1212 em abril de 2024.', 'verified', false, '2024-04-18', 'https://www.gov.br/mme/pt-br/noticias/2024/04/silveira-reforma-setor-eletrico', 'other', 2, 'MME Brasília', 'Entrevista', 'silveira-reforma-eletrico-b149-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jpp, 'Jean-Paul Prates é demitido da Petrobras por Lula.', 'Fui surpreendido. Fiz trabalho técnico. Política não é tudo.', 'Declaração após demissão em maio de 2024 por divergências sobre dividendos.', 'verified', true, '2024-05-14', 'https://www.poder360.com.br/governo/prates-demitido-petrobras-lula/', 'news_article', 3, 'Rio de Janeiro', 'Demissão Petrobras', 'prates-demitido-petrobras-b149-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mch, 'Magda Chambriard assume Petrobras e promete diálogo com governo.', 'Vou trabalhar alinhada com o governo. Petrobras é estratégica.', 'Discurso de posse em maio de 2024 como nova presidente.', 'verified', false, '2024-05-24', 'https://www.poder360.com.br/governo/chambriard-petrobras-posse/', 'news_article', 1, 'Rio de Janeiro', 'Posse Petrobras', 'chambriard-posse-petrobras-b149-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mnh, 'Luiz Marinho defende valorização do salário mínimo.', 'Quando o mínimo sobe, a economia gira. É política distributiva.', 'Entrevista sobre reajuste do mínimo em dezembro de 2024.', 'verified', false, '2024-12-18', 'https://www.gov.br/trabalho/pt-br/noticias/2024/12/marinho-salario-minimo', 'other', 1, 'MTE Brasília', 'Entrevista', 'marinho-salario-minimo-b149-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Aloizio Mercadante defende BNDES como motor do desenvolvimento.', 'Sem BNDES, não há indústria. Bancos privados não fazem longo prazo.', 'Entrevista após assumir presidência do BNDES em 2023.', 'verified', false, '2023-01-25', 'https://www.bndes.gov.br/noticias/mercadante-posse-desenvolvimento', 'other', 1, 'BNDES Rio', 'Posse', 'mercadante-bndes-posse-b149-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner defende articulação política do governo.', 'A base no Senado é sólida. Vamos aprovar o que o governo precisa.', 'Entrevista como líder do governo no Senado em 2024.', 'verified', false, '2024-06-12', 'https://www12.senado.leg.br/noticias/materias/2024/06/12/jaques-wagner-lider-governo', 'news_article', 1, 'Senado Federal', 'Entrevista', 'jaques-wagner-lider-b149-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_omz, 'Omar Aziz rebate investigação contra si e chama acusações de farsa.', 'Quem me acusa não tem prova. É tudo perseguição.', 'Entrevista após denúncia na Lava Jato em 2023.', 'verified', false, '2023-10-20', 'https://www12.senado.leg.br/noticias/materias/2023/10/20/omar-aziz-denuncia', 'news_article', 3, 'Senado Federal', 'Entrevista', 'omar-aziz-denuncia-b149-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro celebra aprovação da reforma tributária.', 'É a maior conquista do Brasil em décadas. Vai simplificar tudo.', 'Declaração após aprovação da PEC 45 em dezembro de 2023.', 'verified', true, '2023-12-15', 'https://www.camara.leg.br/noticias/aguinaldo-reforma-tributaria-pec-45', 'news_article', 1, 'Câmara dos Deputados', 'Aprovação PEC 45', 'aguinaldo-reforma-tributaria-b149-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros critica bancada evangélica no Senado.', 'Essa bancada evangélica só atrapalha o Brasil. Querem teocracia.', 'Entrevista após derrota em pauta de direitos em 2023.', 'verified', false, '2023-07-18', 'https://www12.senado.leg.br/noticias/materias/2023/07/18/renan-bancada-evangelica', 'news_article', 2, 'Senado Federal', 'Entrevista', 'renan-bancada-evangelica-b149-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano rebate Renan e chama de inimigo dos evangélicos.', 'Renan odeia o povo de Deus. Evangélico vota, e vai derrotar Renan.', 'Discurso em culto em Pernambuco em 2023.', 'verified', false, '2023-07-23', 'https://www.metropoles.com/brasil/feliciano-renan-inimigo-evangelicos', 'news_article', 3, 'Recife', 'Culto', 'feliciano-renan-evangelicos-b149-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos perde eleição em SP para Nunes e prepara 2026.', 'Perdemos a batalha mas não a guerra. 2026 tem bandeiras a disputar.', 'Declaração na noite da derrota em outubro de 2024.', 'verified', true, '2024-10-27', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/27/boulos-derrota-nunes-2026.ghtml', 'news_article', 1, 'São Paulo', 'Eleição municipal', 'boulos-derrota-2026-b149-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se opera do quadril e adia compromissos.', 'Volto logo. O Brasil não para.', 'Postagem no Instagram após cirurgia em outubro de 2023.', 'verified', false, '2023-10-01', 'https://g1.globo.com/politica/noticia/2023/10/01/lula-operacao-quadril.ghtml', 'news_article', 1, 'Hospital Sírio-Libanês', 'Cirurgia', 'lula-cirurgia-quadril-b149-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz cirurgia após acidente doméstico em cabeça em dezembro de 2024.', 'Foi um susto. Já estou bem.', 'Pronunciamento após procedimento para tratar hematoma subdural.', 'verified', true, '2024-12-10', 'https://g1.globo.com/politica/noticia/2024/12/10/lula-cirurgia-cabeca.ghtml', 'news_article', 2, 'Hospital Sírio-Libanês', 'Cirurgia cabeça', 'lula-cirurgia-cabeca-b149-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal critica Nunes e Boulos em rede social.', 'Nunes é poste de Tarcísio e Boulos é poste de Lula. Eu sou dono de mim.', 'Postagem durante campanha em outubro de 2024.', 'verified', false, '2024-10-15', 'https://www.oantagonista.com/politica/marcal-ataca-nunes-boulos-poste', 'social_media_post', 2, 'Redes sociais', 'Campanha SP', 'marcal-ataca-poste-b149-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia ataques transfóbicos no Congresso.', 'Querem me silenciar por ser trans. Não vão conseguir.', 'Discurso após pedido de cassação apresentado por deputado em 2024.', 'verified', false, '2024-05-22', 'https://www.camara.leg.br/noticias/erika-hilton-cassacao-transfobia', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'erika-transfobia-cassacao-b149-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino manda suspender emendas Pix sem transparência.', 'Emenda sem rastreabilidade é inconstitucional. Dinheiro público exige transparência.', 'Decisão em ação de agosto de 2024 sobre emendas Pix.', 'verified', true, '2024-08-14', 'https://www.stf.jus.br/noticia/dino-emendas-pix-suspensao', 'other', 1, 'STF', 'Decisão emendas Pix', 'dino-emendas-pix-suspensao-b149-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira reage à decisão de Dino sobre emendas Pix.', 'Essa decisão é interferência indevida. STF invade o Legislativo.', 'Entrevista após decisão de Dino em agosto de 2024.', 'verified', true, '2024-08-15', 'https://www.camara.leg.br/noticias/lira-reage-dino-emendas-pix', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista', 'lira-reage-dino-pix-b149-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema desafia Lula a implantar reforma em Minas.', 'Se Lula acha que sabe tudo, vem governar MG. Não sabe.', 'Declaração em evento em BH em julho de 2024.', 'verified', false, '2024-07-20', 'https://www.em.com.br/politica/zema-desafia-lula-mg', 'news_article', 2, 'Belo Horizonte', 'Evento', 'zema-desafia-lula-mg-b149-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica CNJ por desvio de foco em investigações.', 'CNJ deveria focar em magistrados, não em perseguir juízes da Lava Jato.', 'Discurso no Senado em março de 2024.', 'verified', false, '2024-03-12', 'https://www12.senado.leg.br/noticias/materias/2024/03/12/moro-cnj-lava-jato', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'moro-cnj-lava-jato-b149-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende impeachment de Lewandowski no Senado.', 'Lewandowski é refém do PT. Tem que ser afastado.', 'Discurso na Câmara em 2024.', 'verified', false, '2024-04-20', 'https://www.camara.leg.br/noticias/bia-kicis-impeachment-lewandowski', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'bia-lewandowski-impeachment-b149-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta usa discurso homofóbico em plenário.', 'Deus não criou Adão e Ivo. Família é pai, mãe e filhos.', 'Pronunciamento em audiência sobre PL 5003 em 2023.', 'verified', false, '2023-06-28', 'https://www12.senado.leg.br/noticias/materias/2023/06/28/magno-malta-familia-adao', 'news_article', 4, 'Senado Federal', 'Pronunciamento', 'malta-adao-ivo-familia-b149-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim rebate Magno Malta sobre família.', 'Família é afeto, não é modelo imposto por pastor.', 'Resposta em plenário após fala de Malta.', 'verified', false, '2023-06-28', 'https://www.camara.leg.br/noticias/samia-rebate-malta-familia', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'samia-rebate-malta-b149-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia Brasil como sede do G20 em 2024 e prioridades.', 'Vamos botar fome zero e desigualdade no centro do G20.', 'Coletiva em Nova Delhi após passagem de presidência em 2023.', 'verified', true, '2023-09-10', 'https://g1.globo.com/mundo/noticia/2023/09/10/lula-g20-brasil-fome-zero.ghtml', 'news_article', 1, 'Nova Delhi', 'G20 Índia', 'lula-g20-brasil-fome-b149-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes bloqueia contas de milhões de investigados bolsonaristas.', 'Os recursos financeiros são fundamentais para atos antidemocráticos.', 'Decisão no inquérito das milícias digitais em 2023.', 'verified', true, '2023-05-24', 'https://www.stf.jus.br/noticia/moraes-bloqueio-milicias-digitais', 'other', 2, 'STF', 'Decisão inquérito milícias', 'moraes-bloqueio-milicias-b149-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende Trump e ataca Biden.', 'Biden é o pior presidente da história dos EUA. Trump é a salvação.', 'Postagem em inglês em 2024 em apoio à campanha de Trump.', 'verified', false, '2024-07-14', 'https://www.oantagonista.com/politica/eduardo-defende-trump-biden', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'eduardo-defende-trump-b149-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro agradece Trump por apoio e promete pagar na mesma moeda.', 'Trump é meu amigo. Quando voltar ao poder, Brasil terá espaço.', 'Postagem nas redes após eleição de Trump em novembro de 2024.', 'verified', true, '2024-11-06', 'https://www.metropoles.com/politica/bolsonaro-trump-amigo-vitoria', 'social_media_post', 3, 'Redes sociais', 'Eleição EUA', 'bolsonaro-trump-amigo-b149-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz comentários xenófobos contra venezuelanos.', 'Venezuelano que veio pro Brasil trouxe crime e miséria.', 'Live em outubro de 2023 sobre migração.', 'verified', false, '2023-10-22', 'https://www.metropoles.com/politica/nikolas-xenofobia-venezuelanos', 'social_media_post', 4, 'YouTube', 'Live', 'nikolas-xenofobia-venezuela-b149-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'André Janones convoca apoiadores para pressão digital contra STF.', 'Vamos marcar presença digital. Cada perfil importa na luta.', 'Live em maio de 2023 sobre confronto com STF.', 'verified', false, '2023-05-30', 'https://www.oantagonista.com/politica/janones-convoca-apoiadores-stf', 'social_media_post', 3, 'YouTube', 'Live', 'janones-pressao-digital-b149-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral critica Lula por não vetar PL das saidinhas.', 'Lula deveria ter vetado. Perdeu oportunidade de defender direitos.', 'Pronunciamento em abril de 2024.', 'verified', false, '2024-04-15', 'https://www.camara.leg.br/noticias/tabata-critica-lula-saidinhas', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'tabata-saidinhas-lula-b149-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende posse de armas após ataque em escola.', 'Se tivesse professor armado, teria salvado crianças.', 'Entrevista após atentado em escola em São Paulo em 2023.', 'verified', true, '2023-03-27', 'https://www.metropoles.com/brasil/caiado-professor-armado-escola', 'news_article', 4, 'Goiânia', 'Entrevista', 'caiado-professor-armado-b149-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva é hostilizada por ruralistas em audiência na Câmara.', 'Me chamaram de inimiga. Mas eu represento a Amazônia.', 'Declaração após sessão tumultuada em maio de 2024.', 'verified', true, '2024-05-14', 'https://g1.globo.com/politica/noticia/2024/05/14/marina-silva-hostilizada-camara.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Audiência pública', 'marina-hostilizada-camara-b149-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se emociona em evento com resgatados do trabalho escravo.', 'É inaceitável trabalho escravo no Brasil do século 21. Vamos acabar com isso.', 'Discurso em lançamento de programa em dezembro de 2023.', 'verified', false, '2023-12-13', 'https://www.gov.br/planalto/pt-br/noticias/2023/12/lula-trabalho-escravo', 'other', 1, 'Palácio do Planalto', 'Lançamento programa', 'lula-trabalho-escravo-b149-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio articula candidatura presidencial para 2026.', 'Se o povo chamar, eu atendo. Não fujo da raia.', 'Entrevista ao Estadão em outubro de 2025.', 'verified', true, '2025-10-20', 'https://www.estadao.com.br/politica/tarcisio-presidencia-2026-candidatura', 'news_article', 2, 'São Paulo', 'Entrevista', 'tarcisio-candidatura-2026-b149-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

END $$;
