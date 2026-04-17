-- Batch 126: Eleições municipais 2024 - Campanhas capitais (Mar 2024 - Ago 2024)
DO $$
DECLARE
  v_nun UUID; v_pae UUID; v_fua UUID; v_joa UUID; v_bru UUID;
  v_sar UUID; v_dav UUID; v_mel UUID; v_gre UUID; v_top UUID;
  v_pab UUID; v_bou UUID; v_bop UUID; v_tab UUID; v_eri UUID;
  v_sam UUID; v_jan UUID; v_nik UUID; v_jai UUID; v_edu UUID;
  v_fla UUID; v_mic UUID; v_tar UUID; v_zem UUID; v_cai UUID;
  v_lul UUID; v_had UUID; v_gle UUID; v_pad UUID; v_rui UUID;
  v_fre UUID; v_hel UUID; v_ran UUID; v_orl UUID; v_jaf UUID;
  c_des UUID; c_odi UUID; c_vio UUID; c_abu UUID; c_aut UUID;
  c_hom UUID; c_mis UUID; c_mac UUID; c_rac UUID; c_xen UUID;
  c_ame UUID; c_neg UUID; c_irr UUID; c_int UUID; c_con UUID;
BEGIN
  SELECT id INTO v_nun FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_pae FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_fua FROM politicians WHERE slug = 'fuad-noman';
  SELECT id INTO v_joa FROM politicians WHERE slug = 'joao-campos';
  SELECT id INTO v_bru FROM politicians WHERE slug = 'bruno-reis';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarto';
  SELECT id INTO v_dav FROM politicians WHERE slug = 'david-almeida';
  SELECT id INTO v_mel FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_gre FROM politicians WHERE slug = 'rafael-greca';
  SELECT id INTO v_top FROM politicians WHERE slug = 'topazio-silveira';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_bop FROM politicians WHERE slug = 'boulos-prefeito';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_fre FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_jaf FROM politicians WHERE slug = 'jandira-feghali';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos lança pré-candidatura à Prefeitura de São Paulo em ato do PSOL.', 'São Paulo precisa de um prefeito que cuide das pessoas e não só dos ricos.', 'Ato de lançamento da pré-candidatura no Sindicato dos Metalúrgicos do ABC.', 'verified', true, '2024-03-10', 'https://www1.folha.uol.com.br/poder/2024/03/boulos-lanca-pre-candidatura-em-sp.shtml', 'news_article', 1, 'São Paulo', 'Lançamento de pré-candidatura', 'boulos-lanca-pre-candidatura-b126-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Ricardo Nunes recebe apoio de Tarcísio e do PL em ato na Zona Leste.', 'Nossa aliança com o governador Tarcísio e o presidente Bolsonaro é a garantia de continuidade para São Paulo.', 'Evento de pré-campanha com a presença de Tarcísio e lideranças do PL.', 'verified', false, '2024-03-24', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/03/24/ricardo-nunes-apoio-pl-tarcisio.ghtml', 'news_article', 2, 'São Paulo', 'Ato de pré-campanha', 'nunes-apoio-pl-tarcisio-b126-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal anuncia filiação ao PRTB para disputar a Prefeitura de São Paulo.', 'Vim para quebrar tudo. A política tradicional acabou, agora é a era do coach.', 'Evento de filiação ao PRTB em São Paulo.', 'verified', true, '2024-04-02', 'https://www.cnnbrasil.com.br/politica/pablo-marcal-prtb-sao-paulo/', 'news_article', 3, 'São Paulo', 'Filiação partidária', 'marcal-prtb-sao-paulo-b126-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral é lançada pré-candidata do PSB à Prefeitura de São Paulo.', 'São Paulo merece uma gestão séria, técnica e humana, longe dos extremos.', 'Evento do PSB no Centro de São Paulo oficializa candidatura.', 'verified', false, '2024-04-15', 'https://www1.folha.uol.com.br/poder/2024/04/tabata-amaral-pre-candidata-sp.shtml', 'news_article', 1, 'São Paulo', 'Lançamento PSB', 'tabata-psb-sao-paulo-b126-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal publica vídeo com acusações sem provas contra Boulos em invasão.', 'Boulos é um invasor profissional, vive de tomar a propriedade dos outros.', 'Publicação em redes sociais durante pré-campanha.', 'verified', true, '2024-05-08', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/05/08/marcal-acusa-boulos-invasor.ghtml', 'news_article', 3, 'Redes sociais', 'Ataque em redes', 'marcal-ataca-boulos-invasor-b126-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Eduardo Paes lança reeleição no Rio com apoio do PSD e aliança com Lula.', 'O Rio precisa continuar avançando com diálogo entre estado e município.', 'Convenção partidária do PSD no Rio de Janeiro.', 'verified', false, '2024-08-03', 'https://oglobo.globo.com/rio/noticia/2024/08/paes-lanca-reeleicao-rio.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Convenção PSD', 'paes-reeleicao-rio-b126-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman oficializa candidatura à reeleição em Belo Horizonte.', 'Vou continuar cuidando das pessoas de BH com responsabilidade e afeto.', 'Convenção do PSD em Belo Horizonte.', 'verified', false, '2024-08-05', 'https://www.em.com.br/politica/2024/08/fuad-noman-reeleicao-bh.html', 'news_article', 1, 'Belo Horizonte', 'Convenção PSD', 'fuad-reeleicao-bh-b126-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos oficializa candidatura à reeleição em Recife.', 'Recife vive um novo ciclo e vamos aprofundar as transformações.', 'Convenção do PSB no Recife.', 'verified', false, '2024-08-04', 'https://g1.globo.com/pe/pernambuco/eleicoes/2024/noticia/2024/08/04/joao-campos-reeleicao-recife.ghtml', 'news_article', 1, 'Recife', 'Convenção PSB', 'joao-campos-reeleicao-recife-b126-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis oficializa candidatura à reeleição em Salvador pelo União Brasil.', 'Salvador está no caminho certo e não podemos parar agora.', 'Convenção União Brasil em Salvador.', 'verified', false, '2024-08-05', 'https://www.correio24horas.com.br/politica/bruno-reis-reeleicao-salvador-0824', 'news_article', 1, 'Salvador', 'Convenção União Brasil', 'bruno-reis-reeleicao-salvador-b126-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarto oficializa reeleição em Fortaleza após racha com o PT.', 'Fortaleza escolheu o caminho da independência e vamos seguir.', 'Convenção do PDT em Fortaleza com ausência de ministros do PT.', 'verified', false, '2024-08-05', 'https://diariodonordeste.verdesmares.com.br/politica/sarto-reeleicao-fortaleza-1.3547823', 'news_article', 2, 'Fortaleza', 'Convenção PDT', 'sarto-reeleicao-fortaleza-b126-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'David Almeida oficializa reeleição em Manaus pelo Avante.', 'Manaus precisa continuar com a transformação que começamos.', 'Convenção Avante em Manaus.', 'verified', false, '2024-08-05', 'https://g1.globo.com/am/amazonas/eleicoes/2024/noticia/2024/08/05/david-almeida-reeleicao-manaus.ghtml', 'news_article', 1, 'Manaus', 'Convenção Avante', 'david-almeida-reeleicao-manaus-b126-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Sebastião Melo oficializa reeleição em Porto Alegre após enchentes de maio.', 'Vamos reconstruir Porto Alegre juntos, mais forte do que antes.', 'Convenção MDB em Porto Alegre.', 'verified', false, '2024-08-03', 'https://gauchazh.clicrbs.com.br/politica/eleicoes/noticia/2024/08/melo-reeleicao-porto-alegre.html', 'news_article', 2, 'Porto Alegre', 'Convenção MDB', 'melo-reeleicao-poa-b126-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gre, 'Greca lança Eduardo Pimentel como seu sucessor em Curitiba.', 'Eduardo é o herdeiro natural do nosso projeto para Curitiba.', 'Convenção PSD em Curitiba ungindo candidato da continuidade.', 'verified', false, '2024-08-04', 'https://g1.globo.com/pr/parana/eleicoes/2024/noticia/2024/08/04/greca-lanca-pimentel-curitiba.ghtml', 'news_article', 1, 'Curitiba', 'Convenção PSD', 'greca-lanca-pimentel-b126-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topázio Silveira oficializa candidatura à Prefeitura de Florianópolis.', 'Floripa merece uma gestão moderna e conectada com as novas gerações.', 'Convenção do MDB em Florianópolis.', 'verified', false, '2024-08-05', 'https://ndmais.com.br/politica/eleicoes-2024/topazio-candidatura-floripa/', 'news_article', 1, 'Florianópolis', 'Convenção MDB', 'topazio-floripa-b126-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal ataca Boulos com termo homofóbico durante pré-campanha.', 'Esse cara é um maconheiro, viciado, não pode governar a cidade.', 'Ataque em evento de pré-campanha em São Paulo.', 'verified', true, '2024-06-10', 'https://noticias.uol.com.br/eleicoes/2024/06/10/marcal-ataca-boulos-maconheiro.htm', 'news_article', 4, 'São Paulo', 'Evento de pré-campanha', 'marcal-ataca-boulos-maconheiro-b126-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos rebate Marçal e promete ação judicial por calúnia.', 'Esse coach mentiroso vai responder na Justiça por cada mentira que espalha.', 'Coletiva em resposta aos ataques de Marçal.', 'verified', false, '2024-06-11', 'https://www1.folha.uol.com.br/poder/2024/06/boulos-processa-marcal.shtml', 'news_article', 2, 'São Paulo', 'Coletiva de imprensa', 'boulos-processa-marcal-b126-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio confirma que fará campanha ativa por Ricardo Nunes.', 'Vou estar junto com o Ricardo em todas as agendas possíveis.', 'Declaração em entrevista ao Bandeirantes.', 'verified', false, '2024-07-12', 'https://www.band.uol.com.br/noticias/tarcisio-campanha-nunes-16775920', 'news_article', 2, 'São Paulo', 'Entrevista Band', 'tarcisio-campanha-nunes-b126-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro grava apoio a Nunes e pede voto contra Boulos em SP.', 'Quem quer São Paulo livre do comunismo vota Ricardo Nunes.', 'Vídeo de apoio gravado para campanha de Nunes.', 'verified', true, '2024-07-20', 'https://www.cnnbrasil.com.br/politica/bolsonaro-apoio-nunes-sao-paulo/', 'news_article', 3, 'São Paulo', 'Vídeo de campanha', 'bolsonaro-apoio-nunes-b126-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula declara apoio público a Boulos em São Paulo e Paes no Rio.', 'São Paulo precisa do Boulos e o Rio do Paes, duas cidades que merecem cuidado.', 'Entrevista coletiva no Palácio do Planalto.', 'verified', true, '2024-07-25', 'https://g1.globo.com/politica/noticia/2024/07/25/lula-apoio-boulos-paes.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-apoio-boulos-paes-b126-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal faz campanha com cortes virais e ataques coordenados no TikTok.', 'A gente vence na internet, a TV não manda mais nada.', 'Entrevista a podcast de política digital.', 'verified', false, '2024-08-10', 'https://www.estadao.com.br/politica/marcal-tiktok-campanha-sp/', 'news_article', 3, 'São Paulo', 'Podcast', 'marcal-tiktok-campanha-b126-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Fuad Noman e compara BH a gestão socialista.', 'BH virou laboratório da esquerda, o Fuad é marionete do Lula.', 'Live nas redes sociais durante pré-campanha.', 'verified', true, '2024-08-12', 'https://www.em.com.br/politica/2024/08/nikolas-ataca-fuad-bh.html', 'news_article', 3, 'Belo Horizonte', 'Live em redes sociais', 'nikolas-ataca-fuad-b126-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia ataques transfóbicos em campanha municipal.', 'As candidaturas trans estão sob ataque coordenado nessas eleições.', 'Coletiva no Congresso Nacional sobre violência política.', 'verified', true, '2024-08-14', 'https://www.cartacapital.com.br/politica/erika-hilton-ataques-eleicoes-2024/', 'news_article', 4, 'Brasília', 'Coletiva', 'erika-ataques-transfobicos-b126-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia avanço da extrema direita em câmaras municipais.', 'Temos visto crescimento absurdo de candidatos que defendem o autoritarismo.', 'Entrevista ao portal Brasil de Fato.', 'verified', false, '2024-08-16', 'https://www.brasildefato.com.br/2024/08/16/samia-bomfim-direita-eleicoes', 'news_article', 2, 'Brasília', 'Entrevista', 'samia-direita-municipios-b126-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal espalha desinformação sobre fraude nas urnas antes do 1º turno.', 'Se eu não ganhar, é fraude, todo mundo sabe que as urnas são manipuladas.', 'Live no YouTube durante pré-campanha.', 'verified', true, '2024-08-20', 'https://www1.folha.uol.com.br/poder/2024/08/marcal-fraude-urnas.shtml', 'news_article', 4, 'São Paulo', 'Live YouTube', 'marcal-fraude-urnas-b126-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes evita se posicionar sobre Bolsonaro em debate da Band.', 'Minha campanha é para São Paulo, não vou discutir pautas nacionais.', 'Resposta durante debate promovido pela Band.', 'verified', false, '2024-08-08', 'https://www.band.uol.com.br/noticias/debate-sp-nunes-bolsonaro-16776890', 'news_article', 2, 'São Paulo', 'Debate Band', 'nunes-evita-bolsonaro-debate-b126-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos apresenta plano de moradia popular com 50 mil unidades.', 'Vamos destravar a moradia popular que a cidade precisa há décadas.', 'Lançamento do plano habitacional em Heliópolis.', 'verified', false, '2024-08-22', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/08/22/boulos-plano-moradia.ghtml', 'news_article', 1, 'São Paulo', 'Lançamento de plano', 'boulos-plano-moradia-b126-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata critica polarização entre Nunes e Boulos em debate.', 'Paulistanos estão fartos dessa escolha entre dois extremos.', 'Debate organizado pela TV Cultura.', 'verified', false, '2024-08-25', 'https://tvcultura.com.br/noticias/debate-prefeitura-sp-tabata', 'news_article', 2, 'São Paulo', 'Debate TV Cultura', 'tabata-critica-polarizacao-b126-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes ironiza oponentes bolsonaristas no Rio em ato de campanha.', 'Esses candidatos bolsonaristas só sabem gritar, não sabem administrar.', 'Ato de campanha em Bangu.', 'verified', false, '2024-08-28', 'https://oglobo.globo.com/rio/eleicoes/noticia/2024/08/28/paes-ironiza-bolsonaristas.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Ato de campanha', 'paes-ironiza-bolsonaristas-b126-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones critica Marçal por ataques pessoais e uso de redes sociais.', 'Marçal representa o que há de pior no debate público brasileiro.', 'Entrevista ao canal Jovem Pan News.', 'verified', false, '2024-08-30', 'https://jovempan.com.br/noticias/politica/janones-marcal-ataques.html', 'news_article', 2, 'São Paulo', 'Entrevista Jovem Pan', 'janones-critica-marcal-b126-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos diz que Marçal representa ameaça à democracia municipal.', 'Esse candidato trata eleição como show, flerta com fascismo todo dia.', 'Entrevista ao Roda Viva.', 'verified', true, '2024-09-02', 'https://tvcultura.com.br/noticias/roda-viva-boulos-marcal', 'news_article', 3, 'São Paulo', 'Roda Viva', 'boulos-marcal-ameaca-b126-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal divulga laudo médico falso contra Boulos em rede social.', 'Recebi laudo mostrando que Boulos é viciado em substâncias ilícitas.', 'Publicação em redes sociais depois derrubada pela Justiça Eleitoral.', 'verified', true, '2024-09-20', 'https://www1.folha.uol.com.br/poder/2024/09/marcal-laudo-falso-boulos.shtml', 'news_article', 5, 'Redes sociais', 'Publicação em campanha', 'marcal-laudo-falso-boulos-b126-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal agride Datena com cadeirada em debate da TV Cultura.', 'O Datena me provocou, eu só reagi, é merecido.', 'Após ser chamado de mentiroso, Datena acertou Marçal com cadeira; Marçal devolveu gesto em debate subsequente.', 'verified', true, '2024-09-15', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/15/debate-cadeirada-marcal-datena.ghtml', 'news_article', 5, 'São Paulo', 'Debate TV Cultura', 'marcal-cadeirada-datena-b126-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes evita confronto direto com Marçal após cadeirada em Datena.', 'Violência não tem lugar na política, isso prejudica o debate.', 'Coletiva após debate da TV Cultura.', 'verified', false, '2024-09-16', 'https://www1.folha.uol.com.br/poder/2024/09/nunes-cadeirada-debate.shtml', 'news_article', 2, 'São Paulo', 'Coletiva', 'nunes-cadeirada-debate-b126-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos condena violência em debate e cobra sanções a Marçal.', 'O que aconteceu é fascismo na prática, precisa ter consequência.', 'Coletiva de imprensa após debate da TV Cultura.', 'verified', true, '2024-09-16', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/16/boulos-condena-violencia-debate.ghtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'boulos-condena-violencia-b126-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata classifica debate com cadeirada como vergonha nacional.', 'São Paulo está sendo ridicularizada no mundo inteiro por causa dessa cena.', 'Pronunciamento em rede social.', 'verified', false, '2024-09-16', 'https://www.cnnbrasil.com.br/politica/tabata-debate-vergonha/', 'news_article', 2, 'Redes sociais', 'Pronunciamento', 'tabata-debate-vergonha-b126-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'TSE multa Marçal por propaganda irregular e desinformação.', 'O TSE está perseguindo minha candidatura, é censura pura.', 'Reação a decisão do TSE que determinou multa e remoção de conteúdos.', 'verified', true, '2024-09-22', 'https://www.conjur.com.br/2024-set-22/tse-multa-marcal-propaganda-irregular/', 'news_article', 3, 'São Paulo', 'Declaração à imprensa', 'marcal-tse-multa-b126-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad denuncia ataques misóginos e etaristas em campanha BH.', 'Tenho sofrido ataques por ter 77 anos, isso é preconceito com o idoso.', 'Entrevista na Rádio Itatiaia.', 'verified', false, '2024-09-10', 'https://www.itatiaia.com.br/podcast/fuad-noman-entrevista-2024', 'news_article', 2, 'Belo Horizonte', 'Rádio Itatiaia', 'fuad-ataques-etarismo-b126-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz campanha agressiva contra Fuad em Belo Horizonte.', 'Precisamos tirar esse esquerdista decrépito da prefeitura.', 'Comício de Engler em BH com presença de Nikolas.', 'verified', true, '2024-09-18', 'https://www.em.com.br/politica/2024/09/nikolas-campanha-engler-fuad.html', 'news_article', 4, 'Belo Horizonte', 'Comício Engler', 'nikolas-ataca-fuad-comicio-b126-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos critica adversário por ataques à sua família em Recife.', 'Podem me atacar, mas deixem minha família fora disso.', 'Entrevista ao Jornal do Commercio.', 'verified', false, '2024-09-12', 'https://jc.ne10.uol.com.br/politica/2024/09/joao-campos-ataques-familia.html', 'news_article', 2, 'Recife', 'Entrevista', 'joao-campos-ataques-familia-b126-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis sofre ataques de bolsonaristas por aliança com ACM Neto.', 'Nossa aliança é plural, não vou me curvar a radicalismo.', 'Entrevista à TV Bahia.', 'verified', false, '2024-09-14', 'https://g1.globo.com/ba/bahia/eleicoes/2024/noticia/2024/09/14/bruno-reis-alianca-acm.ghtml', 'news_article', 2, 'Salvador', 'TV Bahia', 'bruno-reis-alianca-acm-b126-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarto acusa Evandro Leitão de mentir sobre gestão em Fortaleza.', 'Evandro distorce dados, mente descaradamente sobre minha gestão.', 'Debate promovido pela TV Verdes Mares.', 'verified', false, '2024-09-20', 'https://diariodonordeste.verdesmares.com.br/politica/debate-sarto-evandro-1.3560001', 'news_article', 3, 'Fortaleza', 'Debate TV Verdes Mares', 'sarto-acusa-evandro-mentir-b126-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'David Almeida ataca Amom Mandel em debate em Manaus.', 'Esse menino não tem estrutura emocional para governar Manaus.', 'Debate promovido pela TV A Crítica.', 'verified', true, '2024-09-22', 'https://g1.globo.com/am/amazonas/eleicoes/2024/noticia/2024/09/22/debate-david-amom-manaus.ghtml', 'news_article', 3, 'Manaus', 'Debate TV A Crítica', 'david-ataca-amom-debate-b126-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Sebastião Melo é criticado por omissão durante enchentes e reage em debate.', 'Ninguém previu tragédia daquela magnitude, fizemos o possível.', 'Debate RBS TV em Porto Alegre.', 'verified', true, '2024-09-24', 'https://gauchazh.clicrbs.com.br/politica/eleicoes/noticia/2024/09/debate-rbs-melo.html', 'news_article', 3, 'Porto Alegre', 'Debate RBS', 'melo-enchentes-debate-b126-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topázio faz acusações infundadas sobre Pedrita em Florianópolis.', 'Pedrita tem ligações suspeitas que ainda vão aparecer.', 'Debate da NSC TV em Florianópolis.', 'verified', false, '2024-09-26', 'https://ndmais.com.br/politica/debate-floripa-topazio/', 'news_article', 3, 'Florianópolis', 'Debate NSC TV', 'topazio-acusacoes-pedrita-b126-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal faz comentários machistas contra jornalista em debate.', 'Essa repórter só me ataca porque é petista militante.', 'Ataque em debate televisivo.', 'verified', true, '2024-09-28', 'https://noticias.uol.com.br/eleicoes/2024/09/28/marcal-ataca-jornalista-machismo.htm', 'news_article', 4, 'São Paulo', 'Debate', 'marcal-ataque-jornalista-b126-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes é acusado de usar máquina pública em campanha à reeleição.', 'Não há uso de máquina, tudo foi feito dentro da lei.', 'Reação a representação apresentada pela coligação de Boulos no TRE.', 'verified', false, '2024-09-18', 'https://www1.folha.uol.com.br/poder/2024/09/nunes-maquina-publica-campanha.shtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'nunes-maquina-publica-b126-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos é vítima de campanha de desinformação em WhatsApp.', 'Estão espalhando montagens com meu rosto dizendo coisas que nunca disse.', 'Coletiva sobre fake news em campanha.', 'verified', true, '2024-09-30', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/30/boulos-fake-news-whatsapp.ghtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'boulos-fake-news-whatsapp-b126-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio participa de atos de Nunes e usa imagem de governador.', 'Estou aqui como cidadão paulista apoiando nosso prefeito.', 'Ato em Itaquera com multidão e uso de estrutura pública.', 'verified', false, '2024-10-02', 'https://www.estadao.com.br/politica/tarcisio-nunes-itaquera-2024/', 'news_article', 3, 'São Paulo', 'Ato em Itaquera', 'tarcisio-nunes-itaquera-b126-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula grava vídeo para Boulos e pede voto em São Paulo.', 'São Paulo precisa do Boulos, um homem honesto e trabalhador.', 'Vídeo veiculado na propaganda eleitoral gratuita.', 'verified', true, '2024-09-25', 'https://g1.globo.com/politica/noticia/2024/09/25/lula-grava-video-boulos.ghtml', 'news_article', 2, 'Brasília', 'Propaganda eleitoral', 'lula-video-boulos-b126-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro faz campanha em SP ao lado de Nunes e Marçal.', 'Precisamos votar em candidatos que defendam a família brasileira.', 'Ato evangélico em São Paulo com apoio misto.', 'verified', false, '2024-09-28', 'https://www.cnnbrasil.com.br/politica/michelle-campanha-sp-nunes/', 'news_article', 3, 'São Paulo', 'Ato evangélico', 'michelle-campanha-sp-b126-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal incita seguidores a hostilizar jornalistas em eventos.', 'Se encontrar repórter da Globo na rua, pode vaiar.', 'Chamado feito em live nas redes sociais.', 'verified', true, '2024-09-29', 'https://www1.folha.uol.com.br/poder/2024/09/marcal-incita-jornalistas.shtml', 'news_article', 4, 'Redes sociais', 'Live YouTube', 'marcal-incita-jornalistas-b126-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede voto em Nunes e Marçal em ato.', 'Qualquer um menos o Boulos, esse é o recado.', 'Ato da direita em São Paulo na véspera do 1º turno.', 'verified', false, '2024-10-04', 'https://noticias.uol.com.br/politica/2024/10/eduardo-bolsonaro-acto-sp.htm', 'news_article', 2, 'São Paulo', 'Ato de direita', 'eduardo-ato-sp-nunes-b126-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fre, 'Marcelo Freixo critica onda bolsonarista em eleições municipais.', 'O bolsonarismo tenta se capilarizar nas câmaras, é perigoso.', 'Entrevista à Carta Capital.', 'verified', false, '2024-09-15', 'https://www.cartacapital.com.br/politica/freixo-bolsonarismo-municipal-2024/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'freixo-bolsonarismo-municipal-b126-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema participa de agenda com Engler em BH contra Fuad.', 'BH merece gestão de direita, basta da esquerda fracassada.', 'Ato de campanha em Contagem com Engler.', 'verified', false, '2024-09-22', 'https://www.em.com.br/politica/2024/09/zema-engler-bh-campanha.html', 'news_article', 2, 'Belo Horizonte', 'Ato Engler', 'zema-engler-campanha-b126-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado pede apoio a candidatos aliados em Goiás com críticas a Lula.', 'Nossos candidatos vão barrar a agenda petista nos municípios.', 'Ato em Anápolis com candidatos aliados.', 'verified', false, '2024-09-20', 'https://www.opopular.com.br/politica/caiado-anapolis-eleicoes-2024', 'news_article', 2, 'Anápolis', 'Ato regional', 'caiado-candidatos-goias-b126-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi critica estratégia de Marçal em entrevista à GloboNews.', 'Marçal é símbolo da degradação política que vivemos.', 'Entrevista à GloboNews.', 'verified', false, '2024-09-24', 'https://g1.globo.com/politica/noticia/2024/09/24/gleisi-marcal-globonews.ghtml', 'news_article', 2, 'Brasília', 'GloboNews', 'gleisi-marcal-degradacao-b126-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende candidatura de Boulos em evento em São Paulo.', 'Boulos representa a esperança de virar a página em São Paulo.', 'Evento de mobilização em São Mateus.', 'verified', false, '2024-09-29', 'https://www1.folha.uol.com.br/poder/2024/09/padilha-boulos-mobilizacao.shtml', 'news_article', 1, 'São Paulo', 'Evento de mobilização', 'padilha-boulos-sao-mateus-b126-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa participa de ato em apoio a Bruno Reis em Salvador.', 'Salvador precisa continuar avançando com boa gestão.', 'Ato de campanha em Salvador.', 'verified', false, '2024-09-25', 'https://www.correio24horas.com.br/politica/rui-costa-bruno-reis-ato-salvador', 'news_article', 1, 'Salvador', 'Ato de campanha', 'rui-bruno-reis-salvador-b126-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho apoia Igor Normando para Prefeitura de Belém.', 'Igor é o futuro de Belém, vai continuar o que transformamos.', 'Ato em Belém com Igor Normando.', 'verified', false, '2024-09-27', 'https://g1.globo.com/pa/para/eleicoes/2024/noticia/2024/09/27/helder-igor-normando-belem.ghtml', 'news_article', 1, 'Belém', 'Ato de campanha', 'helder-igor-normando-b126-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues defende candidatos governistas em eleições locais.', 'O governo Lula precisa de base municipal sólida.', 'Entrevista à Band News.', 'verified', false, '2024-09-18', 'https://www.band.uol.com.br/noticias/randolfe-eleicoes-municipais-16778234', 'news_article', 1, 'Brasília', 'Band News', 'randolfe-base-municipal-b126-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva faz campanha para PCdoB no interior paulista.', 'Nossa militância está nas ruas, defendendo direitos.', 'Caravana do PCdoB no interior de SP.', 'verified', false, '2024-09-10', 'https://vermelho.org.br/2024/09/orlando-silva-caravana-pcdob-sp/', 'news_article', 1, 'São Paulo', 'Caravana partidária', 'orlando-caravana-pcdob-b126-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaf, 'Jandira Feghali apoia chapa do PCdoB no Rio de Janeiro.', 'Temos candidatos de luta em todas as comunidades.', 'Ato em Madureira no Rio.', 'verified', false, '2024-09-14', 'https://oglobo.globo.com/rio/eleicoes/noticia/2024/09/14/jandira-madureira-pcdob.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Ato em Madureira', 'jandira-madureira-pcdob-b126-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal nega derrota e questiona pesquisas antes do 1º turno.', 'Todas as pesquisas estão viciadas, eu estou no segundo turno.', 'Live nas redes sociais na véspera do 1º turno.', 'verified', true, '2024-10-05', 'https://www.cnnbrasil.com.br/politica/marcal-nega-pesquisas-vespera/', 'news_article', 3, 'Redes sociais', 'Live véspera', 'marcal-nega-pesquisas-b126-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos faz caminhada em Paraisópolis na reta final do 1º turno.', 'As periferias são o coração da nossa campanha.', 'Caminhada em Paraisópolis.', 'verified', false, '2024-10-03', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/03/boulos-paraisopolis-caminhada.ghtml', 'news_article', 1, 'São Paulo', 'Caminhada', 'boulos-paraisopolis-b126-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes faz agenda em adensamentos populares com Tarcísio.', 'Nossa gestão é para todos os paulistanos, sem distinção.', 'Agenda em Brasilândia com Tarcísio.', 'verified', false, '2024-10-04', 'https://www.estadao.com.br/politica/nunes-brasilandia-tarcisio/', 'news_article', 1, 'São Paulo', 'Agenda em Brasilândia', 'nunes-brasilandia-tarcisio-b126-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes vence 1º turno no Rio com mais de 60% dos votos.', 'Vitória em primeiro turno é mandato para seguir transformando o Rio.', 'Pronunciamento de vitória no Rio.', 'verified', true, '2024-10-06', 'https://oglobo.globo.com/rio/eleicoes/noticia/2024/10/06/paes-vence-primeiro-turno-rio.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Pronunciamento vitória', 'paes-vence-1turno-rio-b126-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos vence 1º turno no Recife com ampla vantagem.', 'A população endossou nosso projeto para continuar transformando Recife.', 'Pronunciamento após vitória.', 'verified', true, '2024-10-06', 'https://g1.globo.com/pe/pernambuco/eleicoes/2024/noticia/2024/10/06/joao-campos-vence-recife.ghtml', 'news_article', 1, 'Recife', 'Pronunciamento vitória', 'joao-campos-vence-recife-b126-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis vence 1º turno em Salvador com mais de 70%.', 'Salvador confiou em nossa continuidade, vamos entregar mais.', 'Pronunciamento após vitória.', 'verified', true, '2024-10-06', 'https://www.correio24horas.com.br/politica/bruno-reis-vence-salvador-1turno', 'news_article', 1, 'Salvador', 'Pronunciamento vitória', 'bruno-reis-vence-salvador-b126-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Ricardo Nunes vai ao 2º turno em São Paulo contra Boulos.', 'Agora é a batalha decisiva, vamos manter nossa cidade no rumo certo.', 'Pronunciamento após 1º turno em SP.', 'verified', true, '2024-10-06', 'https://www1.folha.uol.com.br/poder/2024/10/nunes-segundo-turno-sp.shtml', 'news_article', 2, 'São Paulo', 'Pronunciamento', 'nunes-2turno-sp-b126-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos vai ao 2º turno em São Paulo e mira virada contra Nunes.', 'A cidade escolheu mudança, vamos ao segundo turno para vencer.', 'Pronunciamento após 1º turno.', 'verified', true, '2024-10-06', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/06/boulos-2-turno.ghtml', 'news_article', 2, 'São Paulo', 'Pronunciamento', 'boulos-2turno-sp-b126-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal fica fora do 2º turno e alega fraude eleitoral sem provas.', 'Fui eliminado por decisões judiciais arbitrárias, isso é golpe eleitoral.', 'Live após apuração do 1º turno.', 'verified', true, '2024-10-06', 'https://www.cnnbrasil.com.br/politica/marcal-fora-2-turno-fraude/', 'news_article', 4, 'São Paulo', 'Live YouTube', 'marcal-fora-2turno-fraude-b126-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata declara apoio a Boulos no 2º turno em São Paulo.', 'Entre Nunes e Boulos, escolho a defesa da democracia.', 'Coletiva em São Paulo.', 'verified', true, '2024-10-08', 'https://www1.folha.uol.com.br/poder/2024/10/tabata-apoia-boulos-2-turno.shtml', 'news_article', 2, 'São Paulo', 'Coletiva', 'tabata-apoia-boulos-b126-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman vai ao 2º turno em BH contra Engler.', 'BH não merece retrocesso bolsonarista, vamos virar.', 'Pronunciamento após 1º turno.', 'verified', true, '2024-10-06', 'https://www.em.com.br/politica/2024/10/fuad-2-turno-bh-engler.html', 'news_article', 2, 'Belo Horizonte', 'Pronunciamento', 'fuad-2turno-bh-b126-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarto fica fora do 2º turno em Fortaleza e Evandro avança.', 'Respeito a decisão das urnas, foi uma campanha difícil.', 'Pronunciamento após resultado em Fortaleza.', 'verified', false, '2024-10-06', 'https://diariodonordeste.verdesmares.com.br/politica/sarto-fora-segundo-turno-1.3575234', 'news_article', 1, 'Fortaleza', 'Pronunciamento', 'sarto-fora-2turno-b126-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Melo vai ao 2º turno em Porto Alegre contra Maria do Rosário.', 'Vamos derrotar o PT no 2º turno e manter POA no rumo.', 'Pronunciamento após resultado.', 'verified', true, '2024-10-06', 'https://gauchazh.clicrbs.com.br/politica/eleicoes/noticia/2024/10/melo-2-turno-poa.html', 'news_article', 2, 'Porto Alegre', 'Pronunciamento', 'melo-2turno-poa-b126-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'David Almeida vai ao 2º turno em Manaus contra Amom Mandel.', 'Manaus vai reeleger a gestão que trouxe progresso.', 'Pronunciamento após 1º turno.', 'verified', false, '2024-10-06', 'https://g1.globo.com/am/amazonas/eleicoes/2024/noticia/2024/10/06/david-2-turno-manaus.ghtml', 'news_article', 2, 'Manaus', 'Pronunciamento', 'david-2turno-manaus-b126-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topázio vence 1º turno em Florianópolis e vai ao 2º turno.', 'Floripa deu recado claro, vamos consolidar no 2º turno.', 'Pronunciamento após resultado.', 'verified', false, '2024-10-06', 'https://ndmais.com.br/politica/topazio-2-turno-floripa/', 'news_article', 1, 'Florianópolis', 'Pronunciamento', 'topazio-2turno-floripa-b126-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro comemora desempenho do PL como maior partido em eleições.', 'O PL é o maior partido do Brasil, a direita venceu as eleições.', 'Live no dia seguinte ao 1º turno.', 'verified', true, '2024-10-07', 'https://www.cnnbrasil.com.br/politica/bolsonaro-pl-maior-partido-2024/', 'news_article', 2, 'Brasília', 'Live rede social', 'bolsonaro-pl-maior-partido-b126-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que PT reduziu perdas e está pronto para 2º turno.', 'O PT manteve posições, agora vamos ao segundo turno com força.', 'Coletiva no Alvorada.', 'verified', false, '2024-10-07', 'https://g1.globo.com/politica/noticia/2024/10/07/lula-pt-1-turno-resultado.ghtml', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-pt-1turno-b126-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad avalia cenário eleitoral e minimiza impacto para governo.', 'As eleições municipais não ditam rumo nacional.', 'Entrevista à imprensa.', 'verified', false, '2024-10-08', 'https://www1.folha.uol.com.br/poder/2024/10/haddad-avaliacao-municipal.shtml', 'news_article', 1, 'Brasília', 'Entrevista', 'haddad-avaliacao-municipal-b126-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal se recusa a apoiar oficialmente Nunes no 2º turno.', 'Meu apoio a Nunes depende de condições, não é automático.', 'Live após 1º turno.', 'verified', true, '2024-10-09', 'https://www1.folha.uol.com.br/poder/2024/10/marcal-condiciona-apoio-nunes.shtml', 'news_article', 3, 'Redes sociais', 'Live', 'marcal-condiciona-apoio-nunes-b126-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes articula apoio de Marçal e ala bolsonarista no 2º turno.', 'Vamos unir toda a centro-direita contra Boulos.', 'Reunião com lideranças do PL e PRTB.', 'verified', true, '2024-10-10', 'https://www.cnnbrasil.com.br/politica/nunes-articulacao-marcal-2-turno/', 'news_article', 2, 'São Paulo', 'Reunião política', 'nunes-articula-marcal-b126-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos reforça agenda nas periferias na reta final.', 'Nossa campanha é pela periferia, pelos que são invisibilizados.', 'Caminhada em Capão Redondo.', 'verified', false, '2024-10-15', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/15/boulos-capao-redondo.ghtml', 'news_article', 1, 'São Paulo', 'Caminhada', 'boulos-capao-redondo-b126-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas intensifica ataques a Fuad em Belo Horizonte no 2º turno.', 'Fuad é decrépito, não tem forças para governar BH.', 'Live nas redes sociais.', 'verified', true, '2024-10-12', 'https://www.em.com.br/politica/2024/10/nikolas-ataques-fuad-2-turno.html', 'news_article', 4, 'Belo Horizonte', 'Live', 'nikolas-ataques-fuad-2turno-b126-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad responde a ataques etaristas de bolsonaristas em BH.', 'Aos 77 anos, tenho lucidez e experiência para servir BH.', 'Entrevista à rádio CBN BH.', 'verified', false, '2024-10-14', 'https://www.cbnbh.com.br/politica/fuad-etarismo-campanha', 'news_article', 2, 'Belo Horizonte', 'Rádio CBN', 'fuad-responde-etarismo-b126-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton é reeleita deputada e comemora resultado no PSOL.', 'Nossa reeleição é resposta ao ódio com que tentam nos calar.', 'Pronunciamento em comitê do PSOL.', 'verified', true, '2024-10-07', 'https://www.cartacapital.com.br/politica/erika-hilton-reeleita-2024/', 'news_article', 1, 'São Paulo', 'Comitê PSOL', 'erika-reeleita-2024-b126-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal ataca Boulos com ataques homofóbicos em rede social.', 'Boulos representa uma agenda LGBT imposta à força.', 'Publicação em X (Twitter).', 'verified', true, '2024-10-18', 'https://noticias.uol.com.br/eleicoes/2024/10/marcal-ataques-homofobicos-boulos.htm', 'news_article', 4, 'Redes sociais', 'Publicação X', 'marcal-homofobia-boulos-b126-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Melo acusa Maria do Rosário de ligação com Lula em debate do 2º turno.', 'Maria do Rosário é instrumento do PT para POA.', 'Debate da RBS TV.', 'verified', false, '2024-10-20', 'https://gauchazh.clicrbs.com.br/politica/eleicoes/noticia/2024/10/debate-melo-2-turno.html', 'news_article', 2, 'Porto Alegre', 'Debate RBS', 'melo-ataca-maria-rosario-b126-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'David Almeida intensifica ataques contra Amom Mandel no 2º turno.', 'Esse menino não tem capacidade de gerir Manaus.', 'Debate da Rede Amazônica.', 'verified', true, '2024-10-22', 'https://g1.globo.com/am/amazonas/eleicoes/2024/noticia/2024/10/22/david-amom-debate-2-turno.ghtml', 'news_article', 3, 'Manaus', 'Debate Rede Amazônica', 'david-ataques-amom-2turno-b126-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topázio ataca Pedrita em debate do 2º turno em Florianópolis.', 'Pedrita não tem experiência nenhuma para comandar a capital.', 'Debate NSC TV 2º turno.', 'verified', false, '2024-10-24', 'https://ndmais.com.br/politica/debate-2-turno-topazio-pedrita/', 'news_article', 2, 'Florianópolis', 'Debate NSC', 'topazio-ataca-pedrita-2turno-b126-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes usa cadeirada para associar Boulos a extremismo em propaganda.', 'Entre o extremismo e a sensatez, São Paulo escolherá o equilíbrio.', 'Propaganda eleitoral na TV de 2º turno.', 'verified', true, '2024-10-22', 'https://www1.folha.uol.com.br/poder/2024/10/nunes-propaganda-extremismo.shtml', 'news_article', 3, 'São Paulo', 'Propaganda TV', 'nunes-propaganda-extremismo-b126-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos denuncia uso de fake news por Nunes na propaganda do 2º turno.', 'Nunes espalha mentiras sobre meu projeto para a cidade.', 'Coletiva de imprensa.', 'verified', false, '2024-10-24', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/24/boulos-fake-news-nunes.ghtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'boulos-fake-news-nunes-b126-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio participa de caminhadas com Nunes no 2º turno.', 'Vou estar junto do Ricardo até o último minuto.', 'Caminhada em Itaim Paulista.', 'verified', false, '2024-10-25', 'https://www.estadao.com.br/politica/tarcisio-nunes-caminhada-itaim/', 'news_article', 2, 'São Paulo', 'Caminhada Itaim', 'tarcisio-nunes-itaim-b126-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro grava vídeo final para Nunes na reta do 2º turno.', 'Votem Nunes, salvem São Paulo do comunismo de Boulos.', 'Vídeo de campanha no 2º turno.', 'verified', true, '2024-10-24', 'https://www.cnnbrasil.com.br/politica/bolsonaro-video-nunes-2-turno/', 'news_article', 3, 'São Paulo', 'Vídeo propaganda', 'bolsonaro-video-nunes-2turno-b126-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz caminhada com Boulos em São Paulo no 2º turno.', 'São Paulo precisa virar a página e escolher Boulos.', 'Caminhada em São Miguel Paulista com Lula.', 'verified', true, '2024-10-22', 'https://www1.folha.uol.com.br/poder/2024/10/lula-caminhada-boulos-2-turno.shtml', 'news_article', 2, 'São Paulo', 'Caminhada Lula', 'lula-caminhada-boulos-b126-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal declara voto em Nunes às vésperas do 2º turno.', 'Vou votar em Nunes, mas com ressalvas, ele não é minha escolha ideal.', 'Live na rede social.', 'verified', false, '2024-10-25', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/25/marcal-voto-nunes.ghtml', 'news_article', 2, 'Redes sociais', 'Live', 'marcal-voto-nunes-b126-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones critica articulação bolsonarista por Nunes no 2º turno.', 'A extrema direita se uniu para tentar vencer em SP.', 'Entrevista na Jovem Pan.', 'verified', false, '2024-10-23', 'https://jovempan.com.br/noticias/politica/janones-bolsonarismo-nunes-sp.html', 'news_article', 2, 'São Paulo', 'Jovem Pan', 'janones-bolsonarismo-nunes-b126-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad apresenta plano final para 2º turno em BH com foco social.', 'Vamos ampliar saúde básica e mobilidade urbana.', 'Coletiva no comitê em BH.', 'verified', false, '2024-10-20', 'https://www.em.com.br/politica/2024/10/fuad-plano-2-turno-bh.html', 'news_article', 1, 'Belo Horizonte', 'Coletiva', 'fuad-plano-2turno-b126-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes comemora reeleição em 1º turno e diz que Rio aprovou gestão.', 'O Rio demonstrou confiança na nossa forma de governar.', 'Entrevista após vitória.', 'verified', false, '2024-10-07', 'https://oglobo.globo.com/rio/eleicoes/noticia/2024/10/07/paes-reeleito-avaliacao.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Entrevista', 'paes-comemora-reeleicao-b126-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos fecha 1º turno com maior votação para prefeito no NE.', 'Recife está com a gestão que merece.', 'Entrevista ao DP.', 'verified', false, '2024-10-08', 'https://www.diariodepernambuco.com.br/noticia/politica/2024/10/joao-campos-maior-votacao-ne.html', 'news_article', 1, 'Recife', 'Entrevista DP', 'joao-campos-maior-votacao-b126-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

END $$;
