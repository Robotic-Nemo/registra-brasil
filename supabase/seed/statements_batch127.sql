-- Batch 127: Eleições municipais 2024 - Campanhas, debates e pós-eleição (Mar 2024 - Dez 2024)
DO $$
DECLARE
  v_nun UUID; v_pae UUID; v_fua UUID; v_joa UUID; v_bru UUID;
  v_sar UUID; v_dav UUID; v_mel UUID; v_gre UUID; v_top UUID;
  v_pab UUID; v_bou UUID; v_bop UUID; v_tab UUID; v_eri UUID;
  v_sam UUID; v_jan UUID; v_nik UUID; v_jai UUID; v_edu UUID;
  v_fla UUID; v_mic UUID; v_tar UUID; v_lul UUID; v_gle UUID;
  v_ran UUID; v_lin UUID; v_hum UUID; v_fel UUID; v_kic UUID;
  v_dam UUID; v_mor UUID; v_ram UUID;
  c_des UUID; c_odi UUID; c_vio UUID; c_abu UUID; c_aut UUID;
  c_hom UUID; c_mis UUID; c_mac UUID; c_rac UUID; c_xen UUID;
  c_ame UUID; c_neg UUID; c_irr UUID; c_int UUID; c_con UUID;
  c_ant UUID;
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
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';

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
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal ataca rivais em primeiro pronunciamento como pré-candidato à PMSP.', 'Os políticos tradicionais são tudo igual, vim para quebrar esse sistema.', 'Entrevista em podcast após anúncio da pré-candidatura.', 'verified', true, '2024-03-28', 'https://www1.folha.uol.com.br/poder/2024/03/marcal-ataques-primeiro-pronunciamento.shtml', 'news_article', 3, 'São Paulo', 'Pré-campanha PMSP', 'marcal-ataca-rivais-primeiro-b127-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes evita citar Bolsonaro em evento do PL em São Paulo.', 'Nossa gestão é voltada para resultados, não para ideologias.', 'Evento do PL na zona norte de São Paulo.', 'verified', false, '2024-04-18', 'https://www1.folha.uol.com.br/poder/2024/04/nunes-evita-bolsonaro.shtml', 'news_article', 2, 'São Paulo', 'Evento PL', 'nunes-evita-bolsonaro-b127-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos apresenta plano de habitação em ato na Zona Leste de SP.', 'Vou colocar as famílias nas casas, essa é a minha prioridade.', 'Ato de campanha na Zona Leste de São Paulo.', 'verified', false, '2024-05-04', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/05/04/boulos-plano-habitacao.ghtml', 'news_article', 1, 'São Paulo', 'Ato habitação', 'boulos-plano-habitacao-b127-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal insinua sem provas que Boulos usou drogas em juventude.', 'O Boulos tem um passado que ele esconde, o povo precisa saber.', 'Entrevista em podcast divulgada em redes sociais.', 'verified', true, '2024-06-12', 'https://www1.folha.uol.com.br/poder/2024/06/marcal-insinua-boulos-drogas.shtml', 'news_article', 4, 'Redes sociais', 'Entrevista podcast', 'marcal-insinua-boulos-drogas-b127-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos processa Marçal por declarações falsas sobre drogas.', 'Não vou tolerar mais mentiras, vou à Justiça contra a desinformação.', 'Ação movida na Justiça Eleitoral.', 'verified', true, '2024-06-14', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/06/14/boulos-processa-marcal.ghtml', 'news_article', 2, 'São Paulo', 'Ação judicial', 'boulos-processa-marcal-b127-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata cobra postura firme de Nunes contra Marçal em evento.', 'É preciso enfrentar Marçal, o silêncio é cumplicidade.', 'Evento do PSB em São Paulo.', 'verified', false, '2024-07-10', 'https://www1.folha.uol.com.br/poder/2024/07/tabata-cobra-nunes-marcal.shtml', 'news_article', 2, 'São Paulo', 'Evento PSB', 'tabata-cobra-nunes-b127-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal exibe laudo médico falso contra Boulos em debate.', 'Aqui está o laudo que prova tudo sobre o Boulos.', 'Debate da Band com candidatos à Prefeitura de São Paulo.', 'verified', true, '2024-09-08', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/08/marcal-laudo-falso-boulos.ghtml', 'news_article', 5, 'São Paulo', 'Debate Band', 'marcal-laudo-falso-b127-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos reage e desmente laudo falso apresentado por Marçal.', 'Isso é uma farsa criminosa, ele inventa laudo para enganar eleitor.', 'Debate da Band com candidatos à Prefeitura de São Paulo.', 'verified', true, '2024-09-08', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/08/boulos-desmente-laudo-marcal.ghtml', 'news_article', 2, 'São Paulo', 'Debate Band', 'boulos-desmente-laudo-b127-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal agride com cadeira José Luiz Datena em debate histórico.', 'Não vou aceitar ofensa sem responder.', 'Debate da TV Cultura com candidatos à Prefeitura de SP.', 'verified', true, '2024-09-15', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/15/marcal-agride-datena-cadeira.ghtml', 'news_article', 5, 'São Paulo', 'Debate TV Cultura cadeirada', 'marcal-cadeirada-datena-b127-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal defende agressão com cadeira como legítima defesa.', 'Foi legítima defesa, ele partiu para cima de mim antes.', 'Entrevista após debate da TV Cultura.', 'verified', true, '2024-09-16', 'https://www1.folha.uol.com.br/poder/2024/09/marcal-defende-cadeirada.shtml', 'news_article', 5, 'São Paulo', 'Coletiva pós-debate', 'marcal-defende-cadeirada-b127-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes condena agressão de Marçal a Datena em debate.', 'Violência não pode ser normalizada na política.', 'Declaração à imprensa após o debate da TV Cultura.', 'verified', true, '2024-09-16', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/16/nunes-condena-marcal-cadeirada.ghtml', 'news_article', 1, 'São Paulo', 'Reação debate', 'nunes-condena-cadeirada-b127-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos chama Marçal de covarde após agressão com cadeira.', 'Covarde, agride quem não pode revidar e foge.', 'Declaração no dia seguinte ao debate.', 'verified', true, '2024-09-16', 'https://www1.folha.uol.com.br/poder/2024/09/boulos-chama-marcal-covarde.shtml', 'news_article', 2, 'São Paulo', 'Reação debate', 'boulos-chama-marcal-covarde-b127-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata classifica cadeirada de Marçal como sintoma do bolsonarismo.', 'A violência do Marçal é consequência direta da política de ódio.', 'Entrevista à CBN em SP.', 'verified', false, '2024-09-17', 'https://cbn.globoradio.globo.com/media/audio/404502/tabata-amaral-sobre-cadeirada-marcal.htm', 'news_article', 2, 'São Paulo', 'Entrevista CBN', 'tabata-cadeirada-sintoma-b127-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton critica relativização da violência na eleição de SP.', 'Normalizar agressão física é convite para mais violência política.', 'Publicação em redes sociais após a cadeirada.', 'verified', false, '2024-09-16', 'https://www.camara.leg.br/noticias/2024/09/erika-violencia-eleicao-sp', 'diario_oficial', 2, 'Redes sociais', 'Publicação redes', 'erika-violencia-relativizacao-b127-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal chama Boulos de vagabundo em debate da Globo.', 'Boulos é um vagabundo que nunca trabalhou na vida.', 'Debate da Rede Globo com candidatos à Prefeitura de SP.', 'verified', true, '2024-10-03', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/03/debate-globo-marcal-boulos.ghtml', 'news_article', 4, 'São Paulo', 'Debate Globo', 'marcal-chama-boulos-vagabundo-b127-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes adota discurso religioso em propaganda de TV.', 'Sou homem de fé, família tradicional e valores cristãos.', 'Propaganda eleitoral em cadeia de TV.', 'verified', false, '2024-09-22', 'https://www1.folha.uol.com.br/poder/2024/09/nunes-discurso-religioso-tv.shtml', 'news_article', 2, 'São Paulo', 'Propaganda TV', 'nunes-religioso-tv-b127-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio faz campanha intensa por Nunes na reta final.', 'São Paulo não pode perder para a esquerda radical.', 'Caminhada com Nunes na zona sul de São Paulo.', 'verified', false, '2024-09-28', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/28/tarcisio-campanha-nunes.ghtml', 'news_article', 2, 'São Paulo', 'Caminhada campanha', 'tarcisio-campanha-nunes-b127-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz ato com Boulos na Zona Leste de São Paulo.', 'Boulos é o candidato do povo, merece nosso voto.', 'Ato de campanha na Zona Leste de São Paulo.', 'verified', true, '2024-09-29', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2024/09/lula-boulos-zona-leste', 'diario_oficial', 1, 'São Paulo', 'Ato Zona Leste', 'lula-boulos-zona-leste-b127-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal divulga fake news sobre urnas em vídeo viral.', 'As urnas foram programadas para dar vitória à esquerda.', 'Vídeo viralizou em grupos de WhatsApp na véspera do 1º turno.', 'verified', true, '2024-10-05', 'https://www1.folha.uol.com.br/poder/2024/10/marcal-fake-news-urnas.shtml', 'news_article', 4, 'Redes sociais', 'Fake news urnas', 'marcal-fake-urnas-b127-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina remoção de vídeos de Marçal sobre urnas.', 'Ataques infundados ao sistema eleitoral não serão tolerados.', 'Decisão monocrática no TSE.', 'verified', true, '2024-10-05', 'https://www.tse.jus.br/comunicacao/noticias/2024/Outubro/moraes-remove-videos-marcal', 'diario_oficial', 1, 'Brasília', 'Decisão TSE', 'moraes-remove-videos-marcal-b127-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes lidera 1º turno em São Paulo e vai ao 2º turno com Boulos.', 'O povo de São Paulo reconheceu nosso trabalho.', 'Pronunciamento após resultado do 1º turno.', 'verified', true, '2024-10-06', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/06/nunes-lidera-primeiro-turno-sp.ghtml', 'news_article', 1, 'São Paulo', 'Resultado 1º turno', 'nunes-lidera-primeiro-turno-b127-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos comemora ida ao 2º turno contra Nunes em São Paulo.', 'Estamos no segundo turno e vamos virar esse jogo.', 'Pronunciamento em comitê de campanha.', 'verified', true, '2024-10-06', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/06/boulos-segundo-turno-sp.ghtml', 'news_article', 1, 'São Paulo', 'Resultado 1º turno', 'boulos-segundo-turno-b127-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal fica em 3º e ataca TSE após derrota.', 'O sistema me roubou essa eleição.', 'Declaração após não avançar ao 2º turno.', 'verified', true, '2024-10-06', 'https://www1.folha.uol.com.br/poder/2024/10/marcal-ataca-tse-derrota.shtml', 'news_article', 4, 'São Paulo', 'Derrota 1º turno', 'marcal-ataca-tse-derrota-b127-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes vence no 1º turno no Rio e evita o 2º turno.', 'O Rio escolheu a continuidade e o diálogo.', 'Pronunciamento após vitória em primeiro turno no Rio.', 'verified', true, '2024-10-06', 'https://oglobo.globo.com/rio/eleicoes/noticia/2024/10/06/paes-vence-primeiro-turno.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Vitória 1º turno', 'paes-vence-primeiro-turno-b127-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos reelege em primeiro turno em Recife com recorde de votos.', 'Recife nos deu um mandato claro para continuar transformando.', 'Pronunciamento após vitória em Recife.', 'verified', true, '2024-10-06', 'https://g1.globo.com/pe/pernambuco/eleicoes/2024/noticia/2024/10/06/joao-campos-vitoria-recife.ghtml', 'news_article', 1, 'Recife', 'Vitória 1º turno Recife', 'joao-campos-vitoria-recife-b127-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis vence em primeiro turno em Salvador.', 'Salvador validou o caminho que começamos em 2020.', 'Pronunciamento em comitê de campanha em Salvador.', 'verified', true, '2024-10-06', 'https://www.correio24horas.com.br/politica/bruno-reis-vitoria-salvador-1006', 'news_article', 1, 'Salvador', 'Vitória 1º turno Salvador', 'bruno-reis-vitoria-salvador-b127-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman vai ao 2º turno em BH contra Bruno Engler (PL).', 'BH escolherá entre o diálogo e o extremismo.', 'Pronunciamento após resultado do 1º turno.', 'verified', true, '2024-10-06', 'https://www.em.com.br/politica/2024/10/fuad-noman-segundo-turno-engler.html', 'news_article', 2, 'Belo Horizonte', 'Resultado 1º turno BH', 'fuad-segundo-turno-engler-b127-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarto é derrotado no 1º turno em Fortaleza e fica fora do 2º turno.', 'Respeitamos a decisão das urnas.', 'Pronunciamento após derrota em Fortaleza.', 'verified', false, '2024-10-06', 'https://diariodonordeste.verdesmares.com.br/politica/sarto-derrota-fortaleza-1.3604512', 'news_article', 1, 'Fortaleza', 'Derrota Sarto 1º turno', 'sarto-derrota-fortaleza-b127-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'David Almeida é reeleito em 1º turno em Manaus.', 'Manaus disse sim à continuidade do nosso projeto.', 'Pronunciamento em comitê de campanha em Manaus.', 'verified', false, '2024-10-06', 'https://g1.globo.com/am/amazonas/eleicoes/2024/noticia/2024/10/06/david-almeida-reeleito-manaus.ghtml', 'news_article', 1, 'Manaus', 'Reeleição 1º turno', 'david-almeida-reeleito-b127-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gre, 'Rafael Greca apoia Eduardo Pimentel em 2º turno em Curitiba.', 'Pimentel representa a continuidade do nosso projeto.', 'Gravação de campanha do sucessor.', 'verified', false, '2024-10-10', 'https://www.gazetadopovo.com.br/politica/eleicoes/2024/greca-apoia-pimentel-curitiba/', 'news_article', 1, 'Curitiba', 'Apoio 2º turno', 'greca-apoia-pimentel-b127-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topázio Silveira é derrotado no 1º turno em Florianópolis.', 'Vamos respeitar a decisão dos florianopolitanos.', 'Pronunciamento após derrota.', 'verified', false, '2024-10-06', 'https://www.nsctotal.com.br/noticias/topazio-derrota-florianopolis', 'news_article', 1, 'Florianópolis', 'Derrota 1º turno', 'topazio-derrota-floripa-b127-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Sebastião Melo vai ao 2º turno em Porto Alegre após enchentes.', 'Vamos reconstruir Porto Alegre juntos.', 'Pronunciamento após resultado do 1º turno.', 'verified', false, '2024-10-06', 'https://gauchazh.clicrbs.com.br/politica/eleicoes-2024/noticia/2024/10/melo-segundo-turno-poa.html', 'news_article', 1, 'Porto Alegre', 'Resultado 1º turno POA', 'melo-segundo-turno-poa-b127-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes diz que foi agredido em ato na Zona Sul e acusa militância do PSOL.', 'Fomos agredidos pela militância petista e psolista.', 'Declaração após caminhada em bairro da Zona Sul.', 'verified', false, '2024-10-13', 'https://www1.folha.uol.com.br/poder/2024/10/nunes-denuncia-agressao-ato.shtml', 'news_article', 3, 'São Paulo', 'Caminhada Zona Sul', 'nunes-denuncia-agressao-b127-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos anuncia apoio de Marina Silva em 2º turno em SP.', 'A agenda ambiental estará no coração da nossa gestão.', 'Ato em São Paulo com Marina Silva.', 'verified', false, '2024-10-14', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/14/boulos-marina-silva-apoio.ghtml', 'news_article', 1, 'São Paulo', 'Apoio Marina Silva', 'boulos-marina-apoio-b127-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio faz blitz por Nunes em bairros populares de SP.', 'Nunes é o único capaz de barrar a volta do PT ao poder em SP.', 'Visita a bairros da zona leste com Nunes.', 'verified', false, '2024-10-18', 'https://www1.folha.uol.com.br/poder/2024/10/tarcisio-blitz-nunes.shtml', 'news_article', 2, 'São Paulo', 'Blitz campanha', 'tarcisio-blitz-nunes-b127-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro grava vídeo com Nunes e pede voto em SP.', 'Vote em Nunes para salvar São Paulo da esquerda.', 'Vídeo gravado em Brasília para campanha de Nunes.', 'verified', true, '2024-10-19', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/19/bolsonaro-video-nunes.ghtml', 'news_article', 3, 'Brasília', 'Vídeo campanha', 'bolsonaro-video-nunes-b127-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes vence 2º turno em SP e derrota Boulos.', 'São Paulo escolheu a continuidade e a responsabilidade.', 'Pronunciamento no comitê em SP após vitória.', 'verified', true, '2024-10-27', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/27/nunes-vence-segundo-turno-sp.ghtml', 'news_article', 1, 'São Paulo', 'Vitória 2º turno SP', 'nunes-vence-2t-sp-b127-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos reconhece derrota em SP e promete continuar na política.', 'Perdemos a eleição mas não a luta pela cidade.', 'Pronunciamento em comitê de campanha.', 'verified', true, '2024-10-27', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/27/boulos-reconhece-derrota.ghtml', 'news_article', 1, 'São Paulo', 'Reconhecimento derrota', 'boulos-reconhece-derrota-b127-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman vence 2º turno em BH e derrota Engler (PL).', 'BH rejeitou o extremismo e optou pela serenidade.', 'Pronunciamento após vitória em Belo Horizonte.', 'verified', true, '2024-10-27', 'https://www.em.com.br/politica/2024/10/fuad-noman-vitoria-bh.html', 'news_article', 2, 'Belo Horizonte', 'Vitória 2º turno BH', 'fuad-vence-engler-b127-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Sebastião Melo é reeleito em Porto Alegre em 2º turno.', 'Porto Alegre vai ser reconstruída com coragem.', 'Pronunciamento após vitória em Porto Alegre.', 'verified', false, '2024-10-27', 'https://gauchazh.clicrbs.com.br/politica/eleicoes-2024/noticia/2024/10/melo-reeleito-poa.html', 'news_article', 1, 'Porto Alegre', 'Reeleição Melo', 'melo-reeleito-poa-b127-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comenta derrota de Boulos e avalia cenário das eleições municipais.', 'A eleição mostra que o centro saiu fortalecido.', 'Entrevista após o 2º turno.', 'verified', true, '2024-10-28', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/entrevistas/2024/10/lula-derrota-boulos', 'diario_oficial', 1, 'Brasília', 'Entrevista pós-eleição', 'lula-avalia-eleicoes-b127-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann faz balanço de eleição difícil para o PT.', 'Precisamos reconhecer que o PT teve dificuldades nessa eleição.', 'Entrevista na sede do PT em SP.', 'verified', false, '2024-10-28', 'https://www.pt.org.br/gleisi-balanco-eleicao-2024/', 'other', 1, 'São Paulo', 'Balanço PT', 'gleisi-balanco-eleicao-b127-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio comemora vitória de Nunes e projeta 2026.', 'Agora vamos trabalhar para reconquistar o Brasil em 2026.', 'Entrevista após vitória de Nunes em SP.', 'verified', true, '2024-10-28', 'https://www1.folha.uol.com.br/poder/2024/10/tarcisio-comemora-nunes-2026.shtml', 'news_article', 2, 'São Paulo', 'Entrevista pós-eleição', 'tarcisio-comemora-nunes-2026-b127-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal anuncia intenção de disputar presidência em 2026.', 'Em 2026 vou disputar a presidência do Brasil.', 'Publicação em redes sociais após derrota em SP.', 'verified', true, '2024-10-30', 'https://g1.globo.com/politica/noticia/2024/10/30/marcal-presidencia-2026.ghtml', 'news_article', 3, 'Redes sociais', 'Anúncio 2026', 'marcal-anuncia-2026-b127-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos dá início a segundo mandato em Recife com agenda social.', 'Vamos avançar ainda mais em políticas sociais para Recife.', 'Entrevista coletiva sobre plano para 2º mandato.', 'verified', false, '2024-11-08', 'https://g1.globo.com/pe/pernambuco/noticia/2024/11/08/joao-campos-plano-segundo-mandato.ghtml', 'news_article', 1, 'Recife', 'Entrevista coletiva', 'joao-campos-plano-segundo-mandato-b127-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis planeja reforma administrativa em Salvador.', 'O segundo mandato terá foco em modernização da gestão.', 'Entrevista coletiva em Salvador.', 'verified', false, '2024-11-10', 'https://www.correio24horas.com.br/politica/bruno-reis-reforma-administrativa-1110', 'news_article', 1, 'Salvador', 'Coletiva Salvador', 'bruno-reforma-administrativa-b127-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman diz que gestão terá enfrentamento a extremismo em BH.', 'Vamos governar para todos, sem espaço para o extremismo.', 'Entrevista em Belo Horizonte.', 'verified', false, '2024-11-15', 'https://www.em.com.br/politica/2024/11/fuad-gestao-enfrentamento-extremismo.html', 'news_article', 2, 'Belo Horizonte', 'Entrevista gestão', 'fuad-enfrentamento-extremismo-b127-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas tenta capitalizar apoio de Bolsonaro para 2026 após eleições.', 'O bolsonarismo é mais forte do que nunca em MG.', 'Entrevista a rádio em Belo Horizonte.', 'verified', false, '2024-11-12', 'https://www.em.com.br/politica/2024/11/nikolas-bolsonarismo-mg.html', 'news_article', 3, 'Belo Horizonte', 'Entrevista rádio', 'nikolas-bolsonarismo-2026-b127-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro celebra vitórias do PL em várias capitais.', 'O PL se consolidou como principal partido do país.', 'Entrevista no Senado.', 'verified', false, '2024-10-28', 'https://www12.senado.leg.br/noticias/materias/2024/10/28/flavio-pl-capitais-vitoria', 'diario_oficial', 2, 'Senado Federal', 'Entrevista Senado', 'flavio-pl-vitoria-capitais-b127-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal volta a atacar TSE e Moraes após derrota.', 'Alexandre de Moraes é o ditador que me impediu de vencer.', 'Entrevista em podcast bolsonarista.', 'verified', true, '2024-11-05', 'https://www.metropoles.com/politica/marcal-ataca-moraes-derrota', 'news_article', 4, 'São Paulo', 'Entrevista podcast', 'marcal-ataca-moraes-derrota-b127-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton é reeleita para deputada federal com votação recorde.', 'Nossa luta continua no Congresso com força ainda maior.', 'Pronunciamento após eleição municipal.', 'verified', false, '2024-11-20', 'https://www.camara.leg.br/noticias/2024/11/erika-hilton-atuacao', 'diario_oficial', 2, 'Câmara dos Deputados', 'Atuação pós eleição', 'erika-atuacao-pos-eleicao-b127-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim critica campanha de violência nas eleições de 2024.', 'Tivemos a eleição mais violenta da história recente.', 'Entrevista na Câmara dos Deputados.', 'verified', false, '2024-11-05', 'https://www.camara.leg.br/noticias/2024/11/samia-eleicoes-violentas', 'diario_oficial', 2, 'Câmara dos Deputados', 'Entrevista pós eleição', 'samia-eleicoes-violentas-b127-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'André Janones critica estratégia do PT em São Paulo.', 'O PT precisa rever sua estratégia de comunicação nacional.', 'Entrevista ao podcast Flow.', 'verified', false, '2024-11-02', 'https://www.cnnbrasil.com.br/politica/janones-critica-estrategia-pt/', 'news_article', 2, 'São Paulo', 'Entrevista podcast', 'janones-critica-pt-b127-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata encerra terceiro lugar em SP com discurso de renovação.', 'Chegamos em terceiro, mas consolidamos uma alternativa.', 'Entrevista após 1º turno em São Paulo.', 'verified', false, '2024-10-07', 'https://www1.folha.uol.com.br/poder/2024/10/tabata-terceiro-lugar-sp.shtml', 'news_article', 1, 'São Paulo', 'Encerramento 1º turno', 'tabata-terceiro-sp-b127-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes é criticado por não debater frontalmente com Marçal no 1º turno.', 'Não me provoquem, respondo com gestão.', 'Entrevista em rádio de São Paulo.', 'verified', false, '2024-09-12', 'https://www1.folha.uol.com.br/poder/2024/09/nunes-nao-debater-marcal.shtml', 'news_article', 2, 'São Paulo', 'Entrevista rádio', 'nunes-nao-debater-marcal-b127-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal ataca Tabata com misoginia em debate da Band.', 'A Tabata é uma sonsa, finge ser boa mas não engana ninguém.', 'Debate da Band com candidatos à Prefeitura de SP.', 'verified', true, '2024-08-08', 'https://www1.folha.uol.com.br/poder/2024/08/marcal-misoginia-tabata-band.shtml', 'news_article', 4, 'São Paulo', 'Debate Band', 'marcal-misoginia-tabata-b127-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata reage a ataque misógino de Marçal em debate.', 'Não vou tolerar ataque machista, isso diminui a política.', 'Debate da Band com candidatos à Prefeitura de SP.', 'verified', false, '2024-08-08', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/08/08/tabata-reage-marcal-debate.ghtml', 'news_article', 2, 'São Paulo', 'Debate Band', 'tabata-reage-machismo-b127-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal faz comentários homofóbicos sobre Boulos durante entrevista.', 'O Boulos é afeminado, não tem a pegada de homem.', 'Entrevista em podcast com influencer bolsonarista.', 'verified', true, '2024-08-22', 'https://www1.folha.uol.com.br/poder/2024/08/marcal-homofobia-boulos.shtml', 'news_article', 4, 'Redes sociais', 'Entrevista podcast', 'marcal-homofobia-boulos-b127-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal chama moradores de rua de vagabundos em vídeo.', 'Morador de rua em São Paulo é vagabundo mesmo, gosta de droga.', 'Vídeo publicado em redes sociais do candidato.', 'verified', true, '2024-07-25', 'https://www1.folha.uol.com.br/poder/2024/07/marcal-moradores-rua-vagabundos.shtml', 'news_article', 4, 'Redes sociais', 'Publicação redes', 'marcal-moradores-rua-b127-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos rebate fala de Marçal sobre moradores de rua.', 'Moradores de rua merecem respeito e políticas públicas, não desprezo.', 'Reação em evento de campanha na Cracolândia.', 'verified', false, '2024-07-26', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/07/26/boulos-moradores-de-rua.ghtml', 'news_article', 2, 'São Paulo', 'Ato Cracolândia', 'boulos-rebate-marcal-rua-b127-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes multa Marçal em R$ 500 mil por desinformação eleitoral.', 'Fake news deliberada em período eleitoral não será tolerada.', 'Decisão monocrática no TSE.', 'verified', true, '2024-09-20', 'https://www.tse.jus.br/comunicacao/noticias/2024/Setembro/moraes-multa-marcal', 'diario_oficial', 1, 'Brasília', 'Multa TSE', 'moraes-multa-marcal-b127-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal chama decisão do TSE de censura.', 'Isso é censura pura, o TSE está perseguindo nossa campanha.', 'Entrevista após multa do TSE.', 'verified', true, '2024-09-20', 'https://g1.globo.com/politica/noticia/2024/09/20/marcal-tse-censura.ghtml', 'news_article', 4, 'São Paulo', 'Reação multa', 'marcal-tse-censura-b127-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes recebe apoio de Michelle Bolsonaro em ato com mulheres.', 'Temos o apoio das mulheres de bem contra a esquerda.', 'Ato com Michelle na zona norte de São Paulo.', 'verified', false, '2024-10-20', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/20/nunes-michelle-bolsonaro.ghtml', 'news_article', 2, 'São Paulo', 'Ato mulheres', 'nunes-michelle-ato-b127-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro ataca Boulos em ato por Nunes.', 'Boulos é inimigo da família e dos valores cristãos.', 'Discurso em ato pela campanha de Nunes.', 'verified', false, '2024-10-20', 'https://www1.folha.uol.com.br/poder/2024/10/michelle-ataca-boulos-ato.shtml', 'news_article', 3, 'São Paulo', 'Ato mulheres', 'michelle-ataca-boulos-b127-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman diz que Bruno Engler representa extremismo em BH.', 'O extremismo que Engler representa não é caminho para BH.', 'Entrevista em Belo Horizonte em 2º turno.', 'verified', false, '2024-10-15', 'https://www.em.com.br/politica/2024/10/fuad-engler-extremismo.html', 'news_article', 2, 'Belo Horizonte', 'Entrevista 2º turno', 'fuad-engler-extremismo-b127-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz campanha intensa por Bruno Engler em BH.', 'BH precisa de Engler para acabar com a velha política.', 'Caminhada com Engler em Belo Horizonte.', 'verified', false, '2024-10-19', 'https://www.em.com.br/politica/2024/10/nikolas-campanha-engler.html', 'news_article', 2, 'Belo Horizonte', 'Caminhada campanha', 'nikolas-campanha-engler-b127-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe critica campanha tóxica em São Paulo.', 'A eleição de SP foi marcada pela agressividade e violência.', 'Pronunciamento no Senado após o 2º turno.', 'verified', false, '2024-10-29', 'https://www12.senado.leg.br/noticias/materias/2024/10/29/randolfe-critica-campanha-sp', 'diario_oficial', 1, 'Senado Federal', 'Pronunciamento Senado', 'randolfe-campanha-toxica-b127-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa lamenta resultado do PT e defende autocrítica.', 'O PT precisa fazer uma profunda autocrítica após essa eleição.', 'Entrevista ao Senado.', 'verified', false, '2024-10-30', 'https://www12.senado.leg.br/noticias/materias/2024/10/30/humberto-autocritica-pt', 'diario_oficial', 1, 'Senado Federal', 'Entrevista Senado', 'humberto-autocritica-pt-b127-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro comemora vitória do PL em dezenas de cidades em 2024.', 'O PL é hoje o maior partido das eleições municipais.', 'Entrevista a imprensa em sua casa em Brasília.', 'verified', true, '2024-10-28', 'https://g1.globo.com/politica/noticia/2024/10/28/bolsonaro-pl-cidades-2024.ghtml', 'news_article', 2, 'Brasília', 'Entrevista imprensa', 'bolsonaro-pl-cidades-b127-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano afirma que evangélicos foram decisivos em SP.', 'O voto evangélico decidiu a eleição em São Paulo.', 'Entrevista em rádio após 2º turno.', 'verified', false, '2024-10-29', 'https://www.metropoles.com/politica/feliciano-voto-evangelico-sp', 'news_article', 2, 'São Paulo', 'Entrevista rádio', 'feliciano-evangelicos-sp-b127-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes anuncia equipe de transição para segundo mandato em SP.', 'Vamos iniciar a transição com diálogo e continuidade.', 'Anúncio de equipe de transição em SP.', 'verified', false, '2024-11-05', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/11/05/nunes-transicao-segundo-mandato.ghtml', 'news_article', 1, 'São Paulo', 'Transição', 'nunes-transicao-b127-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Eduardo Paes planeja Rio em preparação para o G20 pós-eleição.', 'O Rio sediará o G20 e mostrará ao mundo sua força.', 'Coletiva pré-G20 no Rio.', 'verified', false, '2024-11-10', 'https://oglobo.globo.com/rio/noticia/2024/11/10/paes-g20-rio.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Coletiva G20', 'paes-g20-rio-b127-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal é alvo de investigação por propaganda irregular após eleição.', 'Quero a cabeça do Alexandre de Moraes.', 'Live de Marçal após derrota.', 'verified', true, '2024-11-03', 'https://www1.folha.uol.com.br/poder/2024/11/marcal-investigacao-propaganda.shtml', 'news_article', 4, 'Redes sociais', 'Live pós-eleição', 'marcal-investigacao-pos-eleicao-b127-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes abre inquérito contra Marçal por ataque a ministros do TSE.', 'Ataques a magistrados serão investigados com rigor.', 'Decisão de abertura de inquérito.', 'verified', true, '2024-11-08', 'https://www.tse.jus.br/comunicacao/noticias/2024/Novembro/moraes-inquerito-marcal', 'diario_oficial', 1, 'Brasília', 'Inquérito TSE', 'moraes-inquerito-marcal-b127-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis articula com União Brasil para apoiar candidato em 2026.', 'O União Brasil precisa ter protagonismo no próximo ciclo.', 'Reunião do União Brasil em Salvador.', 'verified', false, '2024-11-20', 'https://www.correio24horas.com.br/politica/bruno-reis-uniao-brasil-2026', 'news_article', 1, 'Salvador', 'Reunião União Brasil', 'bruno-uniao-brasil-2026-b127-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos articula PSB para ser oposição propositiva em PE.', 'O PSB será fortalecido em 2026 em nível nacional.', 'Entrevista em Recife.', 'verified', false, '2024-11-25', 'https://g1.globo.com/pe/pernambuco/noticia/2024/11/25/joao-campos-psb-2026.ghtml', 'news_article', 1, 'Recife', 'Entrevista PSB', 'joao-campos-psb-2026-b127-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio projeta palanque unificado com Nunes em 2026.', 'São Paulo terá palanque unificado em 2026.', 'Entrevista em São Paulo.', 'verified', false, '2024-11-15', 'https://www1.folha.uol.com.br/poder/2024/11/tarcisio-palanque-unificado.shtml', 'news_article', 2, 'São Paulo', 'Entrevista imprensa', 'tarcisio-palanque-unificado-b127-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos retoma mandato de deputado federal e prepara atuação na Câmara.', 'Volto fortalecido ao Congresso para defender São Paulo e o povo.', 'Pronunciamento na volta à Câmara.', 'verified', false, '2024-11-05', 'https://www.camara.leg.br/noticias/2024/11/boulos-retorno-camara', 'diario_oficial', 1, 'Câmara dos Deputados', 'Retorno à Câmara', 'boulos-retorno-camara-b127-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh faz balanço das eleições e defende unidade na esquerda.', 'Temos que unir o campo progressista para 2026.', 'Entrevista na Câmara.', 'verified', false, '2024-11-04', 'https://www.camara.leg.br/noticias/2024/11/lindbergh-unidade-esquerda', 'diario_oficial', 1, 'Câmara dos Deputados', 'Entrevista Câmara', 'lindbergh-unidade-esquerda-b127-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares comemora vitória de candidatos bolsonaristas em cidades do DF.', 'A direita mostrou sua força nas eleições municipais.', 'Pronunciamento no Senado.', 'verified', false, '2024-10-28', 'https://www12.senado.leg.br/noticias/materias/2024/10/28/damares-direita-eleicoes', 'diario_oficial', 2, 'Senado Federal', 'Pronunciamento Senado', 'damares-direita-eleicoes-b127-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis celebra vitórias do PL em Minas Gerais.', 'MG mostrou que é estado bolsonarista.', 'Publicação em redes sociais.', 'verified', false, '2024-10-27', 'https://www.metropoles.com/politica/kicis-mg-bolsonarista', 'news_article', 2, 'Redes sociais', 'Publicação redes', 'kicis-mg-bolsonarista-b127-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal chama Nunes de fraco e prevê derrota no 2º turno.', 'Nunes é fraco e vai perder no 2º turno para o Boulos.', 'Live de Marçal após 1º turno.', 'verified', true, '2024-10-08', 'https://www1.folha.uol.com.br/poder/2024/10/marcal-chama-nunes-fraco.shtml', 'news_article', 3, 'Redes sociais', 'Live pós 1º turno', 'marcal-chama-nunes-fraco-b127-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal nega apoio formal a Nunes no 2º turno em SP.', 'Não vou formalmente apoiar ninguém, cada um decide.', 'Entrevista em redes sociais sobre 2º turno.', 'verified', false, '2024-10-12', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/12/marcal-apoio-nunes-2t.ghtml', 'news_article', 2, 'Redes sociais', 'Entrevista 2º turno', 'marcal-nega-apoio-nunes-b127-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes recebe apoio tardio de Pablo Marçal em 2º turno.', 'Todo apoio contra o PT é bem-vindo.', 'Entrevista em São Paulo.', 'verified', false, '2024-10-22', 'https://www1.folha.uol.com.br/poder/2024/10/nunes-apoio-marcal-2t.shtml', 'news_article', 2, 'São Paulo', 'Entrevista imprensa', 'nunes-apoio-marcal-b127-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos chama Nunes de fraco e acusa aliança com Marçal.', 'Nunes aceita apoio de quem agrediu fisicamente em debate.', 'Declaração em ato em São Paulo.', 'verified', false, '2024-10-23', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/23/boulos-nunes-alianca-marcal.ghtml', 'news_article', 2, 'São Paulo', 'Ato 2º turno', 'boulos-nunes-alianca-marcal-b127-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal ataca sistema eleitoral em live após eleições.', 'O sistema precisa cair, as urnas eletrônicas são uma fraude.', 'Live publicada em redes sociais.', 'verified', true, '2024-11-02', 'https://www1.folha.uol.com.br/poder/2024/11/marcal-sistema-eleitoral-fraude.shtml', 'news_article', 4, 'Redes sociais', 'Live pós-eleição', 'marcal-sistema-fraude-b127-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes nomeia equipe para reforma tributária municipal em SP.', 'Vamos modernizar a arrecadação com inteligência.', 'Entrevista coletiva em São Paulo.', 'verified', false, '2024-11-18', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/11/18/nunes-reforma-tributaria-sp.ghtml', 'news_article', 1, 'São Paulo', 'Coletiva imprensa', 'nunes-reforma-tributaria-b127-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes assume protagonismo em reuniões de preparação do G20 no Rio.', 'O Rio mostrará ao mundo sua organização e beleza.', 'Reunião com líderes mundiais no Rio.', 'verified', false, '2024-11-18', 'https://oglobo.globo.com/rio/noticia/2024/11/18/paes-g20-lideres.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Reunião G20', 'paes-protagonismo-g20-b127-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman apresenta plano de governo para segundo mandato em BH.', 'Vamos enfrentar os grandes desafios da cidade com responsabilidade.', 'Apresentação do plano em BH.', 'verified', false, '2024-12-02', 'https://www.em.com.br/politica/2024/12/fuad-plano-segundo-mandato-bh.html', 'news_article', 1, 'Belo Horizonte', 'Apresentação plano', 'fuad-plano-segundo-mandato-b127-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis anuncia secretários para segundo mandato em Salvador.', 'A nova equipe trará experiência e inovação.', 'Anúncio em Salvador da equipe do segundo mandato.', 'verified', false, '2024-12-10', 'https://www.correio24horas.com.br/politica/bruno-reis-secretarios-1210', 'news_article', 1, 'Salvador', 'Anúncio equipe', 'bruno-reis-secretarios-b127-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos anuncia equipe renovada para gestão em Recife.', 'Renovamos a equipe sem perder a essência do projeto.', 'Anúncio em Recife da nova equipe.', 'verified', false, '2024-12-12', 'https://g1.globo.com/pe/pernambuco/noticia/2024/12/12/joao-campos-equipe-recife.ghtml', 'news_article', 1, 'Recife', 'Anúncio equipe', 'joao-campos-equipe-b127-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Eduardo Paes é eleito presidente do PSD municipal do Rio.', 'Vamos fortalecer o PSD no Rio para 2026.', 'Reunião do PSD no Rio.', 'verified', false, '2024-12-15', 'https://oglobo.globo.com/rio/noticia/2024/12/15/paes-psd-rio-presidencia.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Reunião PSD', 'paes-psd-rio-b127-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal é processado por empresário por danos em debate.', 'Não tenho nada a temer, é mais uma perseguição.', 'Reação a processo movido por empresário.', 'verified', false, '2024-12-05', 'https://www1.folha.uol.com.br/poder/2024/12/marcal-processo-empresario.shtml', 'news_article', 3, 'São Paulo', 'Reação a processo', 'marcal-processo-empresario-b127-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz balanço do ano eleitoral em entrevista de final de 2024.', 'Perdemos algumas, ganhamos outras. A democracia funcionou.', 'Entrevista em cadeia nacional.', 'verified', true, '2024-12-20', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/entrevistas/2024/12/lula-balanco-2024', 'diario_oficial', 1, 'Brasília', 'Cadeia nacional', 'lula-balanco-2024-b127-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio avalia postular presidência em 2026 após vitória de Nunes.', 'Vou avaliar o cenário para 2026 com a aliança da direita.', 'Entrevista ao final de 2024.', 'verified', false, '2024-12-18', 'https://www1.folha.uol.com.br/poder/2024/12/tarcisio-presidencia-2026.shtml', 'news_article', 2, 'São Paulo', 'Entrevista final ano', 'tarcisio-presidencia-2026-b127-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes toma posse para segundo mandato em São Paulo.', 'Assumo com humildade e responsabilidade com os paulistanos.', 'Discurso de posse na Câmara Municipal.', 'verified', true, '2025-01-01', 'https://www.prefeitura.sp.gov.br/cidade/secretarias/imprensa/noticias/nunes-posse-2025', 'other', 1, 'São Paulo', 'Posse 2025', 'nunes-posse-segundo-mandato-b127-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fua, 'Fuad Noman toma posse em Belo Horizonte para segundo mandato.', 'Vou cuidar de BH com afeto e responsabilidade.', 'Discurso de posse em BH.', 'verified', false, '2025-01-01', 'https://www.em.com.br/politica/2025/01/fuad-posse-bh.html', 'news_article', 1, 'Belo Horizonte', 'Posse 2025', 'fuad-posse-bh-b127-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Campos toma posse para segundo mandato em Recife.', 'Recife terá um mandato ainda mais transformador.', 'Discurso de posse em Recife.', 'verified', false, '2025-01-01', 'https://g1.globo.com/pe/pernambuco/noticia/2025/01/01/joao-campos-posse-recife.ghtml', 'news_article', 1, 'Recife', 'Posse 2025', 'joao-campos-posse-recife-b127-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis toma posse para segundo mandato em Salvador.', 'Salvador está preparada para um novo ciclo de avanços.', 'Discurso de posse em Salvador.', 'verified', false, '2025-01-01', 'https://www.correio24horas.com.br/politica/bruno-reis-posse-2025', 'news_article', 1, 'Salvador', 'Posse 2025', 'bruno-reis-posse-b127-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes encerra ano com balanço do TSE e alerta sobre 2026.', 'Já estamos trabalhando para que 2026 seja igualmente seguro.', 'Encerramento do ano judiciário no TSE.', 'verified', false, '2024-12-19', 'https://www.tse.jus.br/comunicacao/noticias/2024/Dezembro/moraes-balanco-2024', 'diario_oficial', 1, 'Brasília', 'Encerramento TSE', 'moraes-balanco-tse-2024-b127-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
