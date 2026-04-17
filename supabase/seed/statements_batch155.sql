-- Batch 155: Social media controversies, deepfakes and memes 2023-2026
DO $$
DECLARE
  v_nik UUID; v_jan UUID; v_pab UUID; v_zam UUID; v_edu UUID;
  v_car UUID; v_fla UUID; v_mic UUID; v_jai UUID; v_bia UUID;
  v_mfe UUID; v_dam UUID; v_gir UUID; v_jul UUID; v_san UUID;
  v_fib UUID; v_cgi UUID; v_gpe UUID; v_adv UUID; v_mvh UUID;
  v_kim UUID; v_eri UUID; v_sam UUID; v_tab UUID; v_tal UUID;
  v_orl UUID; v_rom UUID; v_lul UUID; v_gle UUID; v_had UUID;
  v_mor UUID; v_din UUID; v_lew UUID;
  c_des UUID; c_int UUID; c_dis UUID; c_vio UUID; c_rac UUID;
  c_mac UUID; c_mis UUID; c_hom UUID; c_xen UUID; c_abu UUID;
  c_irr UUID; c_neg UUID; c_con UUID; c_itr UUID;
BEGIN
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jul FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fib FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpe FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_dis FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas publica vídeo com peruca para atacar PL sobre identidade de gênero.', 'Hoje me sinto mulher. Reconheçam-me como tal ou serão cancelados.', 'Discurso na tribuna da Câmara com peruca para ironizar PL sobre identidade de gênero trans no Dia Internacional da Mulher.', 'verified', true, '2023-03-08', 'https://g1.globo.com/politica/noticia/2023/03/08/nikolas-ferreira-peruca-camara-dia-internacional-mulher.ghtml', 'news_article', 4, 'Câmara dos Deputados', 'Sessão Dia da Mulher', 'nikolas-peruca-camara-b155-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones admite uso de fake news como estratégia na campanha 2022.', 'Fake news deles, fake news nossas. A gente responde na mesma moeda.', 'Áudio vazado em grupo de aliados admitindo estratégia digital agressiva durante campanha.', 'verified', true, '2023-04-14', 'https://www1.folha.uol.com.br/poder/2023/04/janones-audio-fake-news.shtml', 'news_article', 4, 'WhatsApp', 'Áudio vazado', 'janones-audio-fake-news-b155-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal compartilha deepfake de Datena para atingir adversário.', 'Olha o que o Datena anda fazendo nos bastidores. O povo precisa saber a verdade.', 'Vídeo manipulado com voz sintética publicado em perfil oficial durante eleição municipal de SP 2024.', 'verified', true, '2024-09-15', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/15/marcal-deepfake-datena.ghtml', 'news_article', 4, 'X/Twitter', 'Campanha SP 2024', 'marcal-deepfake-datena-b155-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli publica imagem gerada por IA retratando Lula preso.', 'O futuro está chegando. Apenas adiantando o desfecho.', 'Post em rede social com imagem sintética de Lula algemado. TSE determinou remoção.', 'verified', true, '2023-05-22', 'https://www.conjur.com.br/2023-mai-22/tse-manda-zambelli-apagar-imagem-ia-lula-preso/', 'news_article', 4, 'X/Twitter', 'Publicação sancionada pelo TSE', 'zambelli-ia-lula-preso-b155-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro chama jornalistas de lixo da imprensa em post.', 'Esse lixo da imprensa tem que ser tratado como lixo mesmo.', 'Publicação no X após reportagem sobre gabinete do ódio.', 'verified', true, '2023-06-10', 'https://www.poder360.com.br/midia/carlos-bolsonaro-ataca-jornalistas-lixo/', 'news_article', 3, 'X/Twitter', 'Ataque à imprensa', 'carlos-bolsonaro-lixo-imprensa-b155-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro espalha teoria da conspiração sobre voto impresso.', 'Se não tem nada a esconder, por que não aceitam voto impresso auditável?', 'Post no Instagram reiterando narrativa sobre urnas apesar de decisões do STF.', 'verified', false, '2023-07-30', 'https://www1.folha.uol.com.br/poder/2023/07/eduardo-bolsonaro-voto-impresso-instagram.shtml', 'news_article', 4, 'Instagram', 'Publicação pós-eleitoral', 'eduardo-voto-impresso-insta-b155-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas viraliza com ataque ao Bradesco sobre conta bloqueada.', 'Bradesco me bloqueou porque sou de direita. Boicote já.', 'Vídeo com 40 milhões de views; banco depois esclareceu tratar-se de erro operacional.', 'verified', true, '2023-08-05', 'https://g1.globo.com/economia/noticia/2023/08/05/nikolas-bradesco-conta-bloqueada-video.ghtml', 'news_article', 3, 'Instagram', 'Polêmica Bradesco', 'nikolas-bradesco-boicote-b155-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis divulga corrente de WhatsApp com fake news sobre vacina.', 'Vacinados estão morrendo mais. Olha os gráficos que a mídia esconde.', 'Áudio em grupos de WhatsApp com dados fabricados sobre mortes pós-vacinação.', 'verified', false, '2023-09-12', 'https://www.aosfatos.org/noticias/bia-kicis-audio-whatsapp-vacina-mortes/', 'news_article', 5, 'WhatsApp', 'Corrente anti-vacina', 'bia-kicis-whatsapp-vacina-b155-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ataca cantora Ludmilla chamando de demoníaca.', 'Essa gente que canta funk está servindo a Satanás e corrompendo a juventude.', 'Pregação em culto transmitida no YouTube atacando artistas.', 'verified', false, '2023-10-20', 'https://www.metropoles.com/celebridades/feliciano-ludmilla-funk-demoniaco', 'news_article', 3, 'YouTube', 'Pregação em culto', 'feliciano-ludmilla-demoniaco-b155-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares repete teoria da conspiração sobre ilhas de Marajó desmentida.', 'Naquela ilha, crianças têm os dentes arrancados para servirem a pedófilos.', 'Discurso no Senado reafirmando acusação sem provas apesar de investigação do MP ter descartado.', 'verified', true, '2023-11-16', 'https://www.conjur.com.br/2023-nov-16/damares-repete-marajo-sem-provas/', 'news_article', 4, 'Senado Federal', 'Discurso plenário', 'damares-marajo-repete-b155-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão compara STF à ditadura em vídeo viral.', 'Vivemos uma ditadura togada. Piores que os militares em 64.', 'Vídeo gravado no gabinete e replicado em canais bolsonaristas no Telegram.', 'verified', false, '2023-12-01', 'https://www.poder360.com.br/congresso/girao-stf-ditadura-togada/', 'news_article', 3, 'Telegram', 'Vídeo viral', 'girao-stf-ditadura-b155-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Júlia Zanatta usa TikTok para atacar ministras do STF.', 'Ministras do STF querem legalizar aborto para matar mais bebês.', 'Vídeo no TikTok sobre julgamento da descriminalização do aborto.', 'verified', false, '2024-01-22', 'https://www.metropoles.com/politica/julia-zanatta-tiktok-aborto-ministras', 'news_article', 3, 'TikTok', 'Campanha digital', 'julia-tiktok-aborto-stf-b155-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson posta imagem com arma ameaçando invasores do MST.', 'Invadir propriedade privada em Brasília tem consequência. Estamos armados.', 'Foto com fuzil postada em X após manifestação do MST.', 'verified', true, '2024-02-14', 'https://g1.globo.com/df/distrito-federal/noticia/2024/02/14/sanderson-foto-fuzil-mst.ghtml', 'news_article', 5, 'X/Twitter', 'Ameaça a MST', 'sanderson-fuzil-mst-b155-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros apaga post com deepfake de Lula bêbado após notificação.', 'Era só uma brincadeira, pessoal. Tirem o cabresto.', 'Post removido após TSE notificar sobre vídeo manipulado com IA.', 'verified', false, '2024-03-05', 'https://www.tse.jus.br/comunicacao/noticias/2024/Marco/filipe-barros-deepfake-lula', 'news_article', 4, 'X/Twitter', 'Deepfake removido', 'filipe-barros-deepfake-lula-b155-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto faz live agressiva contra ministro Alexandre de Moraes.', 'Moraes vai pagar. A hora dele vai chegar e será doloroso.', 'Transmissão ao vivo no Instagram após decisão do STF sobre investigação.', 'verified', true, '2024-04-11', 'https://www.conjur.com.br/2024-abr-11/cabo-gilberto-ameaca-moraes-live/', 'news_article', 5, 'Instagram Live', 'Ameaça a ministro', 'cabo-gilberto-live-moraes-b155-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto publica foto com arma em alusão a adversários políticos.', 'Tô preparado. Quem quiser que venha buscar.', 'Foto postada no Instagram gerou pedido de cassação na Câmara.', 'verified', false, '2024-05-03', 'https://www.camara.leg.br/noticias/guiga-peixoto-arma-foto-instagram', 'news_article', 4, 'Instagram', 'Foto com arma', 'guiga-arma-instagram-b155-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ganha milhões com corte de live alegando censura no YouTube.', 'YouTube me censurou porque não querem a verdade. Vamos pro Rumble.', 'Alegação de censura após vídeo ter sido removido por violar regras da plataforma.', 'verified', true, '2024-06-18', 'https://www.poder360.com.br/midia/nikolas-youtube-censura-rumble/', 'news_article', 3, 'YouTube', 'Polêmica censura', 'nikolas-youtube-censura-b155-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia ataques transfóbicos coordenados em plataformas.', 'Recebo 500 mensagens de ódio por dia. Isso não é debate, é terrorismo digital.', 'Coletiva de imprensa apresentando dossiê de ataques ao Ministério Público.', 'verified', true, '2024-07-02', 'https://g1.globo.com/politica/noticia/2024/07/02/erika-hilton-dossie-ataques-transfobicos.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Coletiva', 'erika-hilton-dossie-b155-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal promove curso milionário durante campanha eleitoral.', 'Você pode ser milionário em 90 dias seguindo meu método. Garantido.', 'Conteúdo publicitário em reels durante horário eleitoral gratuito.', 'verified', true, '2024-08-10', 'https://www1.folha.uol.com.br/mercado/2024/08/marcal-curso-campanha.shtml', 'news_article', 3, 'Instagram', 'Campanha SP 2024', 'marcal-curso-campanha-b155-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal publica falsa certidão de internação psiquiátrica de Datena.', 'Pessoal, olha isso aqui. O Datena tem histórico grave.', 'Documento falsificado compartilhado em live que fez TSE suspender perfil temporariamente.', 'verified', true, '2024-09-25', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/25/marcal-falsa-certidao-datena.ghtml', 'news_article', 5, 'X/Twitter', 'Campanha SP 2024', 'marcal-falsa-certidao-b155-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro compartilha meme que associa Lula a ditaduras.', 'Brasil virou a nova Venezuela. Obrigado, companheiros.', 'Repost de meme em X durante crise econômica com crescimento de 3%.', 'verified', false, '2024-10-15', 'https://www.poder360.com.br/governo/flavio-bolsonaro-meme-venezuela/', 'news_article', 2, 'X/Twitter', 'Post em rede social', 'flavio-meme-venezuela-b155-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro publica vídeo em campanha digital questionando gênero de atleta.', 'Mulher é mulher. Homem é homem. Simples assim.', 'Vídeo sobre polêmica olímpica da boxeadora Imane Khelif, com informação incorreta.', 'verified', true, '2024-08-02', 'https://www.metropoles.com/olimpiadas/michelle-bolsonaro-imane-khelif-video', 'news_article', 3, 'Instagram', 'Olimpíadas Paris 2024', 'michelle-imane-khelif-b155-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro retorna ao X e publica ataque a Moraes em primeira postagem.', 'Estou de volta. Moraes não vai me calar.', 'Após retorno ao X, primeira postagem questiona atuação do ministro.', 'verified', true, '2024-11-08', 'https://www1.folha.uol.com.br/poder/2024/11/bolsonaro-retorno-x-moraes.shtml', 'news_article', 3, 'X/Twitter', 'Retorno ao X', 'bolsonaro-retorno-x-b155-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende regulamentação de deepfakes em debates.', 'Eleição via IA é atentado à democracia. Precisamos de lei.', 'Discurso em plenário defendendo aprovação do PL da IA.', 'verified', false, '2024-11-20', 'https://www.camara.leg.br/noticias/adriana-ventura-pl-ia-deepfake', 'news_article', 1, 'Câmara dos Deputados', 'Debate PL da IA', 'adriana-ventura-pl-ia-b155-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri polemiza com post afirmando que cotas são racistas.', 'Cotas raciais são racismo institucional. Meritocracia é a saída.', 'Thread no X durante debate sobre revisão da Lei de Cotas.', 'verified', true, '2024-12-10', 'https://www.poder360.com.br/congresso/kim-kataguiri-cotas-racismo-institucional/', 'news_article', 3, 'X/Twitter', 'Debate sobre cotas', 'kim-cotas-racismo-institucional-b155-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia campanha de misoginia organizada contra ela.', 'Há uma milícia digital contra mulheres parlamentares de esquerda.', 'Entrevista à Carta Capital apresentando dados sobre ataques coordenados.', 'verified', false, '2025-01-15', 'https://www.cartacapital.com.br/politica/samia-bomfim-milicia-digital-mulheres', 'news_article', 2, 'Carta Capital', 'Entrevista', 'samia-milicia-digital-b155-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem viraliza com discurso inflamado no Congresso.', 'Cadê o dinheiro do Novo PAC? Cadê, ministro? Cadê?', 'Discurso que gerou milhões de visualizações após ministro ter deixado o plenário.', 'verified', true, '2025-02-18', 'https://www.camara.leg.br/noticias/van-hattem-cade-dinheiro-novo-pac', 'news_article', 2, 'Câmara dos Deputados', 'Discurso viral', 'van-hattem-cade-dinheiro-b155-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama rede social de terra sem lei em discurso.', 'Não dá para aceitar que redes sociais sejam terra sem lei. Vai ter regulação.', 'Discurso em evento sobre regulação de big techs no Palácio do Planalto.', 'verified', true, '2025-03-10', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/03/lula-redes-sociais-terra-sem-lei', 'other', 1, 'Palácio do Planalto', 'Evento sobre regulação', 'lula-terra-sem-lei-b155-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad responde a memes sobre imposto do Pix com ironia.', 'Não existe imposto do Pix. É fake news bolsonarista.', 'Coletiva desmentindo onda de mensagens em WhatsApp sobre suposto imposto.', 'verified', true, '2025-01-08', 'https://g1.globo.com/politica/noticia/2025/01/08/haddad-imposto-pix-fake-news.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Coletiva', 'haddad-imposto-pix-b155-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lidera campanha de desinformação sobre Pix de Haddad.', 'Vai taxar o seu Pix sim. Não caia em conversa de petista.', 'Reels viralizado gerou tumulto em agências bancárias; banco central desmentiu.', 'verified', true, '2025-01-10', 'https://www.bcb.gov.br/detalhenoticia/nikolas-pix-desmentido', 'other', 5, 'Instagram', 'Campanha desinformação Pix', 'nikolas-desinfo-pix-b155-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino anuncia investigação contra fake news do Pix.', 'Quem difundiu mentira dolosamente vai responder criminalmente.', 'Despacho no STF mandando PF investigar origem da campanha contra o Pix.', 'verified', true, '2025-01-14', 'https://www.conjur.com.br/2025-jan-14/dino-investigacao-fake-pix/', 'news_article', 2, 'STF', 'Decisão judicial', 'dino-investiga-fake-pix-b155-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone expõe mensagens com ameaças recebidas.', 'Foram 300 ameaças de morte em uma semana. Isso é democracia?', 'Coletiva apresentando print de mensagens ao Ministério da Justiça.', 'verified', true, '2025-04-02', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2025/04/02/taliria-petrone-ameacas-morte.ghtml', 'news_article', 2, 'Brasília', 'Coletiva ameaças', 'taliria-ameacas-coletiva-b155-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro chama jornalista mulher de velhaca feia em post.', 'Essa velhaca feia ainda tem coragem de me criticar.', 'Ataque pessoal no X a repórter após reportagem investigativa.', 'verified', false, '2025-04-18', 'https://www.poder360.com.br/midia/carlos-bolsonaro-ataque-jornalista-mulher/', 'news_article', 4, 'X/Twitter', 'Ataque a jornalista', 'carlos-velhaca-feia-b155-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton reage a deepfake pornográfico fabricado com sua imagem.', 'Criaram vídeo pornô com meu rosto usando IA. Isso é violência de gênero.', 'Coletiva após circular em grupos de WhatsApp vídeo manipulado.', 'verified', true, '2025-05-06', 'https://g1.globo.com/politica/noticia/2025/05/06/erika-hilton-deepfake-pornografico.ghtml', 'news_article', 2, 'Brasília', 'Coletiva deepfake', 'erika-deepfake-porno-b155-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal usa IA para simular conversa inventada com Lula.', 'Olha o que o presidente me disse quando ninguém estava ouvindo.', 'Áudio sintético publicado em canal do Telegram foi desmentido horas depois.', 'verified', false, '2025-05-20', 'https://www.metropoles.com/politica/marcal-audio-ia-lula', 'news_article', 4, 'Telegram', 'Áudio sintético', 'marcal-ia-lula-audio-b155-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli publica vídeo de bar ameaçando reporter com revólver.', 'Sai daqui antes que eu perca a paciência.', 'Áudio de conversa em bar sendo gravado em que parlamentar ameaça jornalista.', 'verified', false, '2025-06-12', 'https://www1.folha.uol.com.br/poder/2025/06/zambelli-ameaca-jornalista-bar.shtml', 'news_article', 5, 'Bar em Brasília', 'Áudio vazado', 'zambelli-ameaca-bar-b155-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros insiste em fake news sobre urnas em podcast bolsonarista.', 'Uma prova técnica que mostra que as urnas podem ser fraudadas.', 'Entrevista em podcast bolsonarista repetindo narrativa derrubada por auditorias.', 'verified', false, '2025-06-25', 'https://www.poder360.com.br/eleicoes/filipe-barros-podcast-urnas/', 'news_article', 4, 'Podcast', 'Entrevista', 'filipe-podcast-urnas-b155-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva apresenta relatório final do PL das Fake News.', 'Não é PL da censura, é PL da responsabilidade digital.', 'Relatório final apresentado na Câmara após dois anos de tramitação.', 'verified', true, '2025-07-03', 'https://www.camara.leg.br/noticias/orlando-silva-relatorio-fake-news-final', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação relatório', 'orlando-relatorio-final-pl-b155-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama PL das Fake News de PL da mordaça.', 'PL da mordaça vai calar a direita. Lutaremos até o fim.', 'Vídeo no Instagram mobilizando seguidores contra relatório de Orlando Silva.', 'verified', true, '2025-07-05', 'https://www.metropoles.com/politica/nikolas-pl-mordaca-video', 'news_article', 3, 'Instagram', 'Mobilização anti-PL', 'nikolas-pl-mordaca-b155-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones provoca Nikolas em vídeo satírico viralizado.', 'Olha o chorão com medo da lei. Nem consegue dormir direito.', 'Vídeo com 20 milhões de views satirizando adversário no Instagram.', 'verified', false, '2025-07-10', 'https://www.poder360.com.br/midia/janones-nikolas-chorao-video/', 'news_article', 2, 'Instagram', 'Vídeo satírico', 'janones-chorao-nikolas-b155-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral propõe regulação específica para plataformas contra jovens.', 'Crianças e adolescentes precisam de proteção online. O digital mata.', 'Apresentação de PL sobre proteção infantojuvenil no ambiente digital.', 'verified', false, '2025-08-05', 'https://www.camara.leg.br/noticias/tabata-pl-criancas-plataformas-digital', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação PL', 'tabata-pl-criancas-digital-b155-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rom, 'Romário critica uso político de esporte em redes sociais.', 'Esporte não é palanque eleitoral. Parem de usar a seleção.', 'Post no Instagram criticando políticos usando imagem da seleção em campanha.', 'verified', false, '2025-08-18', 'https://globoesporte.globo.com/futebol/noticia/2025/08/18/romario-esporte-palanque-eleitoral.ghtml', 'news_article', 1, 'Instagram', 'Post em rede social', 'romario-esporte-palanque-b155-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro publica meme racista contra ministra Anielle Franco.', 'A qualificação dela é só a cor da pele. Lamentável.', 'Post no X gerou ações judiciais por racismo; perfil removeu conteúdo após 24h.', 'verified', true, '2025-09-02', 'https://www1.folha.uol.com.br/poder/2025/09/eduardo-bolsonaro-meme-anielle.shtml', 'news_article', 5, 'X/Twitter', 'Ataque racista', 'eduardo-meme-anielle-b155-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia campanha contra PT em redes sociais.', 'Há uma indústria bilionária de ódio contra o PT. Vamos derrubar.', 'Apresentação de dossiê à PF sobre perfis coordenados contra o partido.', 'verified', false, '2025-09-15', 'https://pt.org.br/gleisi-dossie-pf-campanha-ptbrasil', 'other', 1, 'PT', 'Coletiva dossiê', 'gleisi-dossie-pf-ptbrasil-b155-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson chama Lula de gângster em post com montagem.', 'O maior gângster do Brasil voltou ao poder. Gente de bem, reajam.', 'Montagem de Lula com terno listrado estilo máfia viralizou no X.', 'verified', false, '2025-09-22', 'https://www.poder360.com.br/governo/sanderson-lula-gangster-montagem/', 'news_article', 3, 'X/Twitter', 'Post com montagem', 'sanderson-lula-gangster-b155-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Júlia Zanatta viraliza com ataque a militância feminista no TikTok.', 'Feminazis querem destruir a família. Nós, mulheres de direita, não aceitamos.', 'Vídeo com 10 milhões de views atacando movimento feminista.', 'verified', false, '2025-10-05', 'https://www.metropoles.com/politica/julia-zanatta-tiktok-feminismo-familia', 'news_article', 3, 'TikTok', 'Vídeo viral', 'julia-tiktok-feminazi-b155-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina bloqueio de contas por deepfakes eleitorais.', 'O uso de IA para fraudar eleição será punido com rigor máximo.', 'Despacho determinando bloqueio de 50 contas que propagaram deepfakes em 2024.', 'verified', true, '2025-10-12', 'https://www.conjur.com.br/2025-out-12/moraes-bloqueio-contas-deepfake-eleicoes/', 'news_article', 2, 'STF', 'Despacho judicial', 'moraes-bloqueio-deepfakes-b155-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama Moraes de ditador em live com 2 milhões de views.', 'Moraes é o ditador do Brasil. Precisamos nos libertar.', 'Live no Instagram durante audiência pública virou caso polícia.', 'verified', true, '2025-10-20', 'https://www.poder360.com.br/congresso/bia-kicis-moraes-ditador-live/', 'news_article', 4, 'Instagram Live', 'Live com ataque', 'bia-moraes-ditador-live-b155-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão publica meme que sugere intervenção militar.', 'Os quarteis estão de olho. Respeitem a Constituição.', 'Meme com imagem de tanque de guerra postado no X.', 'verified', false, '2025-11-05', 'https://g1.globo.com/politica/noticia/2025/11/05/girao-meme-intervencao-tanque.ghtml', 'news_article', 5, 'X/Twitter', 'Meme ameaça', 'girao-meme-tanque-b155-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski apresenta plano contra desinformação eleitoral.', 'Desinformação em eleição é crime contra a democracia.', 'Lançamento do plano nacional do Ministério da Justiça contra fake news.', 'verified', false, '2025-11-18', 'https://www.gov.br/mj/pt-br/noticias/2025/11/lewandowski-plano-desinformacao-eleitoral', 'other', 1, 'Ministério da Justiça', 'Lançamento plano', 'lewandowski-plano-desinfo-b155-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal anuncia pré-candidatura a presidente em live com IA.', 'Apresento meu Brasil do futuro. Sou o candidato da nova era.', 'Live com uso intensivo de IA para simulações apocalípticas do atual governo.', 'verified', true, '2025-12-02', 'https://www1.folha.uol.com.br/poder/2025/12/marcal-pre-candidato-presidente-live.shtml', 'news_article', 3, 'YouTube', 'Live pré-candidatura', 'marcal-pre-candidato-live-b155-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lança canal no YouTube com 5 milhões de inscritos em um dia.', 'Vamos combater a censura da grande mídia. Direita unida.', 'Lançamento de canal com produção profissional e equipe de 30 pessoas.', 'verified', true, '2025-12-15', 'https://www.metropoles.com/midia/nikolas-canal-youtube-5-milhoes', 'news_article', 2, 'YouTube', 'Lançamento de canal', 'nikolas-canal-youtube-b155-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli publica de Miami áudio chamando Moraes de terrorista.', 'Moraes é o maior terrorista do Brasil. Fugi por minha vida.', 'Áudio gravado em Miami após fuga da justiça foi amplamente compartilhado.', 'verified', true, '2025-06-30', 'https://www1.folha.uol.com.br/poder/2025/06/zambelli-miami-audio-moraes.shtml', 'news_article', 5, 'Telegram', 'Áudio de Miami', 'zambelli-miami-audio-b155-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto posta meme armado em contexto de julgamento do 8 de janeiro.', 'Se tocarem em quem está preso, vão responder. Estamos prontos.', 'Publicação em X com armas durante julgamento de réus do 8 de janeiro.', 'verified', true, '2026-01-10', 'https://www.conjur.com.br/2026-jan-10/cabo-gilberto-meme-armas-8-janeiro/', 'news_article', 5, 'X/Twitter', 'Julgamento 8/1', 'cabo-gilberto-armas-8jan-b155-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ataca religiões afro em live durante culto.', 'Macumba, umbanda, tudo isso é obra do diabo. Não chamem de religião.', 'Transmissão ao vivo do culto na Assembleia de Deus foi denunciada ao MP.', 'verified', false, '2026-01-25', 'https://www.metropoles.com/religiao/feliciano-religioes-afro-ataque', 'news_article', 5, 'YouTube', 'Pregação', 'feliciano-afro-diabo-b155-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares compartilha thread com teoria do globalismo.', 'Elite globalista Soros-ONU quer destruir a família brasileira.', 'Thread no X com 500 mil curtidas misturando conspirações.', 'verified', false, '2026-02-05', 'https://www.poder360.com.br/congresso/damares-globalismo-soros-thread/', 'news_article', 3, 'X/Twitter', 'Thread conspiratória', 'damares-globalismo-thread-b155-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro usa áudio com voz clonada por IA em defesa própria.', 'Meu filho, eu nunca falei isso. É tudo manipulação.', 'Alegação defensiva em investigação sobre áudio autêntico que foi atribuído a ele.', 'verified', true, '2026-02-18', 'https://g1.globo.com/politica/noticia/2026/02/18/bolsonaro-audio-ia-defesa.ghtml', 'news_article', 4, 'X/Twitter', 'Defesa por post', 'bolsonaro-audio-ia-defesa-b155-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro acusa mídia de perseguir a família em live.', 'Tudo é contra os Bolsonaro. A mídia não descansa.', 'Live no Instagram após mais uma reportagem do Uol sobre rachadinha.', 'verified', false, '2026-03-01', 'https://www.metropoles.com/politica/flavio-live-midia-perseguicao-familia', 'news_article', 2, 'Instagram Live', 'Live defesa', 'flavio-live-midia-b155-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle publica vídeo retórico sobre ateísmo no Instagram.', 'Ateus estão perdidos. Precisam de Cristo.', 'Vídeo com 3 milhões de views atacando não religiosos.', 'verified', false, '2026-03-10', 'https://www.poder360.com.br/politica/michelle-ateus-video-instagram/', 'news_article', 3, 'Instagram', 'Vídeo religioso', 'michelle-ateus-video-b155-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro quebra silêncio em X com teoria sobre esquerda assassina.', 'Nosso vice sabia. Mataram por isso. Lula a seguir.', 'Post com teoria conspiratória sobre morte do vice-presidente do Chile.', 'verified', false, '2026-03-22', 'https://www1.folha.uol.com.br/poder/2026/03/carlos-bolsonaro-teoria-conspiratoria.shtml', 'news_article', 5, 'X/Twitter', 'Teoria conspiratória', 'carlos-teoria-conspiratoria-b155-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas mistura religião com política em vídeo de Páscoa.', 'Jesus era de direita. Isso é fato bíblico.', 'Vídeo de Páscoa com 8 milhões de views distorcendo teologia.', 'verified', false, '2026-04-05', 'https://www.metropoles.com/politica/nikolas-jesus-direita-pascoa', 'news_article', 2, 'Instagram', 'Post de Páscoa', 'nikolas-jesus-direita-b155-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones admite em podcast que criou perfis falsos em 2022.', 'Criei, sim, uns perfis fake. Foi estratégia. Ganhamos.', 'Admissão em podcast causou investigação do MP-MG e quebra com aliados.', 'verified', true, '2023-05-18', 'https://www.poder360.com.br/eleicoes/janones-admite-perfis-fake-podcast/', 'news_article', 4, 'Podcast', 'Entrevista podcast', 'janones-perfis-fake-podcast-b155-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro tieta Elon Musk em post sobre Twitter.', 'Elon Musk é o salvador da liberdade de expressão mundial.', 'Post apaixonado após visita a Musk no Texas.', 'verified', false, '2023-07-05', 'https://www.poder360.com.br/midia/eduardo-bolsonaro-musk-twitter/', 'news_article', 2, 'X/Twitter', 'Post sobre Musk', 'eduardo-musk-salvador-b155-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca atriz Paola Oliveira em post por defender aborto.', 'Tem mulher que merece o inferno, e essa é uma delas.', 'Post no X após entrevista da atriz foi denunciado por misoginia.', 'verified', false, '2023-09-25', 'https://www.metropoles.com/celebridades/nikolas-ataca-paola-oliveira-aborto', 'news_article', 4, 'X/Twitter', 'Ataque a atriz', 'nikolas-paola-oliveira-b155-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim recebe e expõe ameaça de estupro em post.', 'Veja o que esse fascista escreveu. Isso não pode passar impune.', 'Print de mensagem com ameaça grave postado publicamente gerou prisão.', 'verified', true, '2023-10-08', 'https://g1.globo.com/politica/noticia/2023/10/08/samia-bomfim-ameaca-estupro-post.ghtml', 'news_article', 3, 'X/Twitter', 'Exposição de ameaça', 'samia-ameaca-estupro-b155-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson circula vídeo falso do MST invadindo escola.', 'MST invadiu escola e amedrontou crianças. Abajur já.', 'Vídeo de 2019 reciclado e apresentado como recente gerou pânico.', 'verified', false, '2023-11-12', 'https://www.aosfatos.org/noticias/sanderson-mst-escola-video-antigo/', 'news_article', 4, 'X/Twitter', 'Vídeo reciclado', 'sanderson-mst-video-falso-b155-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem publica vídeo com mentiras sobre ônibus hospital.', 'Ônibus SUS custou o dobro de um hospital novo. Lula quebrou.', 'Vídeo com dados falsos desmentido por Ministério da Saúde em 24h.', 'verified', false, '2024-02-28', 'https://www.aosfatos.org/noticias/van-hattem-onibus-hospital-mentira/', 'news_article', 3, 'Instagram', 'Vídeo desmentido', 'van-hattem-onibus-mentira-b155-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal filma briga com Datena em debate e viraliza o golpe.', 'Deixou o velho louco. Olha a violência deles.', 'Após Datena atingi-lo com cadeira, Marçal produziu reels com 50 milhões de views.', 'verified', true, '2024-09-15', 'https://www1.folha.uol.com.br/poder/2024/09/marcal-datena-cadeira-debate.shtml', 'news_article', 4, 'TV Cultura', 'Debate municipal SP', 'marcal-datena-cadeira-b155-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis aperta botão e viraliza vídeo querendo fechar STF.', 'Fecha esse STF. Nada a fazer lá.', 'Manifestação em plenário foi editada e viralizou em grupos bolsonaristas.', 'verified', false, '2024-07-02', 'https://www.camara.leg.br/noticias/bia-kicis-fechar-stf-plenario', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bia-fechar-stf-b155-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros repete mentira sobre orçamento secreto em X.', 'Lula gasta o dobro do Bolsonaro com orçamento secreto.', 'Informação desmentida por relatório do Tesouro Nacional.', 'verified', false, '2024-06-14', 'https://www.aosfatos.org/noticias/filipe-barros-orcamento-secreto-desmentido/', 'news_article', 3, 'X/Twitter', 'Post desmentido', 'filipe-orcamento-secreto-desmentido-b155-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto hostiliza ciclista feminista em vídeo viral.', 'Tira essa mulher maluca da rua. Vai cozinhar.', 'Vídeo gravado em carro com ciclista mulher viralizou por misoginia.', 'verified', false, '2024-08-30', 'https://www.metropoles.com/politica/guiga-peixoto-ciclista-mulher-video', 'news_article', 4, 'Instagram', 'Vídeo em carro', 'guiga-ciclista-mulher-b155-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura denuncia deepfake pornô com mulheres parlamentares.', 'A IA virou arma contra mulheres na política. Precisamos de lei.', 'Relatório apresentado em CPI da IA apontando 20 deputadas com conteúdo falso.', 'verified', true, '2025-04-22', 'https://www.camara.leg.br/noticias/adriana-ventura-relatorio-deepfake-pornografico', 'news_article', 2, 'Câmara dos Deputados', 'CPI da IA', 'adriana-relatorio-deepfake-b155-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton vence ação contra Nikolas por danos morais digitais.', 'Vencemos. Ódio online tem responsabilização.', 'Sentença condenou Nikolas a indenizar por publicações transfóbicas.', 'verified', true, '2025-07-20', 'https://www.conjur.com.br/2025-jul-20/erika-hilton-vence-acao-nikolas/', 'news_article', 2, 'TJMG', 'Sentença', 'erika-vence-acao-nikolas-b155-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri volta a defender Movimento Brasil Livre em post.', 'O MBL foi o maior movimento democrático que já existiu.', 'Post resgatando histórico após críticas ao partido Novo.', 'verified', false, '2025-08-28', 'https://www.poder360.com.br/congresso/kim-mbl-democratico-post/', 'news_article', 1, 'X/Twitter', 'Post sobre MBL', 'kim-mbl-democratico-b155-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula vira meme em vídeo falando bateu martelo da moeda.', 'Bateu o martelo. Agora é lei.', 'Discurso virou meme e gerou uso satírico em redes; Lula comentou com humor.', 'verified', false, '2025-10-15', 'https://www.metropoles.com/politica/lula-bateu-martelo-meme-moeda', 'news_article', 1, 'Palácio do Planalto', 'Discurso viral', 'lula-bateu-martelo-b155-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi responde agressivamente a jornalistas por post viral.', 'Jornalista que ataca o governo é lacaio da extrema-direita.', 'Post no X após cobertura considerada desfavorável pela ministra.', 'verified', false, '2025-11-25', 'https://www.poder360.com.br/governo/gleisi-jornalista-lacaio-post/', 'news_article', 3, 'X/Twitter', 'Post a jornalistas', 'gleisi-jornalista-lacaio-b155-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro posta vídeo antigo editado como se fosse atual.', 'Estou forte, saudável e pronto para voltar. Solta Bolsonaro.', 'Vídeo de 2022 recontextualizado durante julgamento no STF.', 'verified', true, '2025-12-20', 'https://www.aosfatos.org/noticias/bolsonaro-video-editado-saude/', 'news_article', 3, 'Instagram', 'Vídeo editado', 'bolsonaro-video-editado-b155-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas posta deepfake de Lula dizendo que roubou.', 'Escuta aí o que o próprio Lula admitiu.', 'Áudio sintético divulgado em canal viralizou antes de ser removido.', 'verified', true, '2026-01-05', 'https://www.tse.jus.br/comunicacao/noticias/2026/Janeiro/nikolas-deepfake-lula-audio', 'other', 5, 'Instagram', 'Deepfake removido', 'nikolas-deepfake-lula-audio-b155-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone viraliza em resposta a ataques em live.', 'Vocês não vão me calar. Mulher negra resiste.', 'Live em resposta a onda de racismo e misoginia digital teve 5 milhões de views.', 'verified', false, '2026-02-12', 'https://g1.globo.com/politica/noticia/2026/02/12/taliria-live-resposta-racismo.ghtml', 'news_article', 1, 'Instagram Live', 'Live resposta', 'taliria-live-resposta-b155-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares publica vídeo atacando aulas de educação sexual.', 'Ideologia de gênero na escola é estupro cultural dos nossos filhos.', 'Vídeo no Instagram sobre MEC gerou reação de educadores.', 'verified', false, '2026-03-18', 'https://www.metropoles.com/educacao/damares-video-educacao-sexual-mec', 'news_article', 3, 'Instagram', 'Vídeo sobre MEC', 'damares-video-educacao-b155-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Júlia Zanatta viraliza chamando Janja de rainha.', 'Janja virou a rainha do lacre. Custa caro pro Brasil.', 'Vídeo satirizando agenda internacional da primeira-dama.', 'verified', false, '2026-03-25', 'https://www.poder360.com.br/governo/julia-zanatta-janja-rainha-lacre/', 'news_article', 2, 'TikTok', 'Vídeo satírico', 'julia-janja-rainha-b155-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva propõe emenda para criminalizar deepfakes.', 'Deepfake eleitoral é crime. Ponto final.', 'Apresentação de emenda ao PL da IA na Câmara.', 'verified', false, '2026-04-02', 'https://www.camara.leg.br/noticias/orlando-silva-emenda-criminalizar-deepfake', 'news_article', 1, 'Câmara dos Deputados', 'Emenda PL', 'orlando-emenda-deepfake-b155-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle anuncia canal no YouTube com 2 milhões de inscritos.', 'Vou falar sobre fé, família e política. Deus abençoe o Brasil.', 'Lançamento de canal com produção profissional para alcance feminino.', 'verified', true, '2023-09-15', 'https://www.metropoles.com/politica/michelle-bolsonaro-canal-youtube-lancamento', 'news_article', 2, 'YouTube', 'Lançamento canal', 'michelle-canal-youtube-b155-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro brinca com meme sobre Queiroz em entrevista.', 'Queiroz era só assessor. Meme é meme.', 'Fala em podcast sobre ex-assessor condenado gerou crítica.', 'verified', false, '2024-04-20', 'https://www1.folha.uol.com.br/poder/2024/04/flavio-queiroz-meme-podcast.shtml', 'news_article', 2, 'Podcast', 'Entrevista podcast', 'flavio-queiroz-meme-b155-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli publica meme de si mesma na cadeia sendo heroína.', 'Presa por defender a democracia. Isso é o legado.', 'Meme criado pela assessoria durante julgamento no STF.', 'verified', false, '2025-08-12', 'https://www.metropoles.com/politica/zambelli-meme-cadeia-heroina', 'news_article', 3, 'X/Twitter', 'Autopromoção', 'zambelli-meme-cadeia-b155-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral denuncia anúncios políticos em plataformas.', 'Plataformas lucram com desinformação. Isso tem que acabar.', 'Discurso em audiência pública sobre regulação de plataformas.', 'verified', false, '2025-05-15', 'https://www.camara.leg.br/noticias/tabata-audiencia-plataformas-anuncios', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'tabata-audiencia-plataformas-b155-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão ataca repórter em live do Instagram.', 'Jornalistas comunistas não pertencem ao Brasil.', 'Live transmitida ao vivo quando jornalista tentou fazer pergunta.', 'verified', false, '2024-05-10', 'https://www.poder360.com.br/midia/girao-jornalista-comunista-live/', 'news_article', 3, 'Instagram Live', 'Live ataque', 'girao-jornalista-comunista-b155-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad brinca com IA gerando meme de si mesmo.', 'Até a IA sabe que Pix não será taxado.', 'Post do ministro usando ferramenta de IA para desmentir fake news.', 'verified', false, '2025-02-08', 'https://www.gov.br/fazenda/pt-br/acompanhe-ministerio/noticias/2025/02/haddad-ia-meme-pix', 'other', 1, 'Ministério da Fazenda', 'Post em rede', 'haddad-ia-meme-pix-b155-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson posta story ameaçando civis em manifestação.', 'Se invadirem prédios públicos, é tiro. Sem aviso.', 'Story no Instagram com apagado após notificação da PF.', 'verified', false, '2024-10-22', 'https://g1.globo.com/df/distrito-federal/noticia/2024/10/22/sanderson-story-ameaca-manifestacao.ghtml', 'news_article', 5, 'Instagram Stories', 'Ameaça em story', 'sanderson-story-manifestacao-b155-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano publica vídeo atacando Madonna em show no Rio.', 'Show de Satanás no Rio. Cristãos precisam rezar.', 'Vídeo publicado antes do show histórico da cantora em Copacabana.', 'verified', false, '2024-05-03', 'https://www.metropoles.com/celebridades/feliciano-madonna-satanas-rio', 'news_article', 3, 'Instagram', 'Pregação', 'feliciano-madonna-satanas-b155-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal anuncia vender NFT de suas falas polêmicas.', 'Cada mimimi vale ouro. NFT já à venda.', 'Lançamento de NFTs com recortes polêmicos para monetização.', 'verified', false, '2024-11-28', 'https://www.poder360.com.br/midia/marcal-nft-falas-polemicas/', 'news_article', 2, 'OpenSea', 'Lançamento NFT', 'marcal-nft-falas-b155-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas dança no TikTok antes de votação de CPMI.', 'Boa noite, galera. Vamos expor os maus.', 'Vídeo no TikTok horas antes de votação de processo de cassação.', 'verified', false, '2023-11-08', 'https://www.metropoles.com/politica/nikolas-tiktok-danca-cpmi', 'news_article', 1, 'TikTok', 'Vídeo TikTok', 'nikolas-tiktok-cpmi-b155-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto compartilha meme que chama Lula de bandido.', 'Bandido no poder é assim mesmo. Brasil acima.', 'Post com meme grosseiro foi removido por violar regras.', 'verified', false, '2024-12-05', 'https://www.poder360.com.br/congresso/cabo-gilberto-lula-bandido-meme/', 'news_article', 3, 'X/Twitter', 'Meme ataque', 'cabo-gilberto-lula-bandido-b155-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton viraliza em resposta bem-humorada a ataque.', 'Se esses haters viessem pro meu gabinete, aprenderiam humanidade.', 'Resposta a ataque viral teve 30 milhões de views.', 'verified', false, '2026-02-25', 'https://www.metropoles.com/politica/erika-hilton-resposta-haters-viral', 'news_article', 1, 'Instagram', 'Resposta viral', 'erika-resposta-haters-b155-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro usa TikTok para falar com jovens em 2025.', 'Olá, jovens. Agora estou no TikTok. Brasil acima de tudo.', 'Primeira postagem de Bolsonaro no TikTok durante inelegibilidade.', 'verified', true, '2025-03-28', 'https://www1.folha.uol.com.br/poder/2025/03/bolsonaro-tiktok-jovens-primeiro.shtml', 'news_article', 2, 'TikTok', 'Primeiro post TikTok', 'bolsonaro-tiktok-jovens-b155-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi fala mal da CNN em post generalista.', 'CNN é mídia coxinha. Não dá para levar a sério.', 'Post no X após cobertura considerada crítica ao governo.', 'verified', false, '2026-03-05', 'https://www.poder360.com.br/midia/gleisi-cnn-coxinha-post/', 'news_article', 2, 'X/Twitter', 'Post a mídia', 'gleisi-cnn-coxinha-b155-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares publica vídeo com teoria sobre banheiros unissex.', 'Querem obrigar meninas a banheiro com homens. Não vai passar.', 'Vídeo com informação falsa sobre proposta do MEC viralizou.', 'verified', false, '2023-08-22', 'https://www.aosfatos.org/noticias/damares-banheiros-unissex-mec-falsa/', 'news_article', 3, 'Instagram', 'Vídeo desmentido', 'damares-banheiros-unissex-b155-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro tieta Trump e posta foto com bandeira.', 'Trump venceu. O globalismo perdeu. Brasil é o próximo.', 'Post após vitória de Trump em 2024 mobilizando apoiadores.', 'verified', true, '2024-11-06', 'https://www.metropoles.com/politica/eduardo-bolsonaro-trump-globalismo', 'news_article', 3, 'X/Twitter', 'Post sobre Trump', 'eduardo-trump-globalismo-b155-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rom, 'Romário grava vídeo criticando uso de IA em futebol.', 'Robô não marca gol. Deixem o futebol em paz.', 'Vídeo bem-humorado criticando uso de IA em análise esportiva.', 'verified', false, '2025-06-18', 'https://globoesporte.globo.com/futebol/noticia/2025/06/18/romario-critica-ia-futebol-video.ghtml', 'news_article', 1, 'Instagram', 'Vídeo esporte', 'romario-ia-futebol-b155-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas confirma maior alcance do ano em retrospectiva.', 'Fomos os maiores comunicadores da direita. 500 milhões de views.', 'Post de fim de ano 2025 celebrando alcance de conteúdos.', 'verified', true, '2025-12-30', 'https://www.poder360.com.br/midia/nikolas-retrospectiva-500-milhoes-2025/', 'news_article', 2, 'Instagram', 'Retrospectiva anual', 'nikolas-retrospectiva-2025-b155-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
