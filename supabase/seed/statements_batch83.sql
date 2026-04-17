-- Batch 83: Educação, cultura, ciência e política indígena (Jan 2023 – Abr 2026)
-- Parte 2: guerra cultural na educação, cortes no MCTI, crises Yanomami,
-- cotas, ENEM, ProUni, FIES, Carnaval, universidades e ciência sob ataque
-- 100 declarações

DO $$
DECLARE
  v_cam UUID; v_luc UUID; v_mar UUID; v_son UUID; v_ani UUID;
  v_nis UUID; v_sil UUID; v_cid UUID; v_pte UUID; v_mma UUID;
  v_est UUID; v_teb UUID; v_msi UUID; v_lul UUID; v_had UUID;
  v_gle UUID; v_rui UUID; v_apa UUID; v_wdi UUID; v_jai UUID;
  v_nik UUID; v_mvh UUID; v_kim UUID; v_adv UUID; v_tab UUID;
  v_eri UUID; v_sam UUID; v_osi UUID; v_cha UUID; v_jan UUID;
  v_tpe UUID; v_lin UUID; v_rsa UUID; v_dam UUID; v_mfe UUID;
  v_bia UUID;
  c_des UUID; c_odi UUID; c_abu UUID; c_irr UUID; c_neg UUID;
  c_rac UUID; c_xen UUID; c_itr UUID; c_con UUID; c_aut UUID;
  c_obs UUID; c_ame UUID;
BEGIN
  SELECT id INTO v_cam FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_luc FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'margareth-menezes';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_pte FROM politicians WHERE slug = 'paulo-teixeira';
  SELECT id INTO v_mma FROM politicians WHERE slug = 'marcio-macedo';
  SELECT id INTO v_est FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_msi FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_apa FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_wdi FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_osi FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_tpe FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_rsa FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo celebra primeira turma do Pé-de-Meia a concluir ensino médio.', 'A primeira turma que recebeu Pé-de-Meia vai se formar. É a prova de que dinheiro na conta do jovem pobre transforma vida.', 'Cerimônia em escola pública do Ceará com a primeira turma beneficiada.', 'verified', false, '2025-12-05', 'https://novaescola.org.br/conteudo/25500/camilo-pe-de-meia-primeira-turma', 'news_article', 1, 'Fortaleza', 'Formatura Escola Estadual', 'camilo-pe-de-meia-turma-b83-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Ministro rebate boato de que MEC ensinaria "sexo" a crianças.', 'Isso é mentira deslavada. O MEC não publica nada disso. Quem inventa essas mentiras está traindo as próprias crianças.', 'Coletiva após vídeo viral de parlamentar bolsonarista distorcer material didático.', 'verified', true, '2024-09-18', 'https://www1.folha.uol.com.br/educacao/2024/09/camilo-boato-sexo-criancas-mec.shtml', 'news_article', 2, 'Brasília', 'Coletiva MEC', 'camilo-boato-sexo-criancas-b83-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo anuncia Política Nacional de Educação Digital.', 'O Brasil precisa garantir conectividade em todas as escolas. Sem banda larga, não há ensino contemporâneo possível.', 'Lançamento da política em parceria com o Ministério das Comunicações.', 'verified', false, '2023-10-17', 'https://valor.globo.com/brasil/educacao/noticia/2023/10/17/camilo-educacao-digital-politica.ghtml', 'news_article', 1, 'Brasília', 'Lançamento PNED', 'camilo-educacao-digital-politica-b83-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo anuncia compra emergencial de livros após atraso do PNLD.', 'Nenhuma criança vai começar o ano letivo sem livro didático. É compromisso e é execução.', 'Coletiva após denúncias sobre atraso na distribuição do PNLD 2024.', 'verified', false, '2024-01-30', 'https://g1.globo.com/educacao/noticia/2024/01/30/camilo-pnld-2024-compra.ghtml', 'news_article', 1, 'Brasília', 'Coletiva MEC', 'camilo-pnld-2024-compra-b83-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo defende regra do 30% para cotas em concursos federais.', 'Cota é reparação histórica. O Estado brasileiro precisa se parecer com o povo brasileiro, e isso passa por cotas.', 'Declaração após revisão da Lei de Cotas no Senado.', 'verified', false, '2023-10-05', 'https://folha.uol.com.br/educacao/2023/10/camilo-cotas-reparacao-historica.shtml', 'news_article', 1, 'Brasília', 'Entrevista à Folha', 'camilo-cotas-reparacao-b83-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo recebe IDHE e diz que educação ainda é desigual.', 'O IDHE 2024 mostra que avançamos, mas a desigualdade regional persiste. O desafio da educação brasileira é ser federativa de fato.', 'Entrevista após divulgação do Índice de Desenvolvimento Humano na Educação.', 'verified', false, '2025-03-18', 'https://novaescola.org.br/conteudo/25700/camilo-idhe-2024-desigualdade', 'news_article', 1, 'Brasília', 'Divulgação IDHE', 'camilo-idhe-2024-b83-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Ministro condena ataque armado em escola de Goiás.', 'Não há palavras para descrever a dor. Vamos intensificar o plano nacional de prevenção à violência nas escolas.', 'Coletiva após ataque em escola estadual de Goiás.', 'verified', true, '2023-10-25', 'https://g1.globo.com/go/goias/noticia/2023/10/25/camilo-ataque-escola-goias.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MEC', 'camilo-ataque-escola-goias-b83-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo defende regulamentação de celulares em sala de aula.', 'Celular não é aliado na sala de aula. A pesquisa mostra que restringir ajuda na aprendizagem. Vamos apoiar estados que legislam.', 'Entrevista sobre lei que restringe uso de celulares em escolas públicas.', 'verified', false, '2025-01-13', 'https://valor.globo.com/brasil/educacao/noticia/2025/01/13/camilo-celulares-escola.ghtml', 'news_article', 1, 'Brasília', 'Entrevista Valor', 'camilo-celulares-escola-b83-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos convoca adesão ao programa Ciência no Enem.', 'Queremos que cada bolsista do CNPq dê uma aula aberta a alunos do ensino médio. A ciência precisa sair dos muros.', 'Anúncio do programa Ciência no Enem.', 'verified', false, '2024-09-20', 'https://agenciabrasil.ebc.com.br/educacao/noticia/2024-09/luciana-ciencia-enem-programa', 'news_article', 1, 'Brasília', 'Lançamento programa', 'luciana-ciencia-no-enem-b83-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana critica a retirada de recursos do PAC Ciência.', 'Precisamos de um PAC da Ciência. Não podemos esperar crise climática para investir em tecnologia.', 'Discurso em audiência no Senado sobre o PAC.', 'verified', false, '2024-02-14', 'https://valor.globo.com/brasil/ciencia/noticia/2024/02/14/luciana-pac-ciencia.ghtml', 'news_article', 2, 'Senado Federal', 'Audiência PAC', 'luciana-pac-ciencia-b83-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Ministra anuncia bolsa de pós-graduação com valor reajustado.', 'Depois de 10 anos congelada, a bolsa da pós volta a ser digna. Ciência não pode depender do boa vontade de quem é rico.', 'Coletiva após reajuste do valor de bolsas da Capes e CNPq.', 'verified', true, '2023-03-03', 'https://g1.globo.com/ciencia/noticia/2023/03/03/luciana-reajuste-bolsas-capes-cnpq.ghtml', 'news_article', 1, 'Brasília', 'Coletiva MCTI', 'luciana-reajuste-bolsas-b83-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana rebate ataques de Kim Kataguiri a instituto de pesquisa.', 'O deputado Kim debocha do Inpe. É o mesmo Inpe que salvou vidas ao monitorar enchentes no Sul. Respeito à ciência é mínimo.', 'Postagem em rede social após Kim Kataguiri criticar orçamento do Inpe.', 'verified', false, '2024-05-27', 'https://oglobo.globo.com/politica/luciana-kim-inpe-2024.ghtml', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'luciana-kim-inpe-b83-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana anuncia centros de excelência em IA nas universidades.', 'Seis universidades recebem R$ 500 milhões para montar centros de excelência em IA. Isso é soberania.', 'Anúncio dos centros em cerimônia com reitores.', 'verified', false, '2025-04-23', 'https://valor.globo.com/brasil/tecnologia/noticia/2025/04/23/luciana-centros-ia-universidades.ghtml', 'news_article', 1, 'Brasília', 'Anúncio MCTI', 'luciana-centros-ia-b83-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth Menezes cria Sistema Nacional de Cultura.', 'O SNC é a redistribuição do poder cultural. Não é Brasília que decide, é cada município que sabe o que é prioridade.', 'Sanção da lei do SNC em cerimônia no Palácio do Planalto.', 'verified', false, '2023-06-29', 'https://oglobo.globo.com/cultura/noticia/2023/06/margareth-sistema-nacional-cultura.ghtml', 'news_article', 1, 'Brasília', 'Sanção SNC', 'margareth-sistema-nacional-cultura-b83-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth defende abertura de Museu Nacional após reconstrução.', 'A reabertura do Museu Nacional é a vitória do Brasil sobre o abandono. Cultura não morre.', 'Visita às obras de reconstrução do Museu Nacional do Rio.', 'verified', false, '2024-09-02', 'https://valor.globo.com/eu-e/cultura/noticia/2024/09/02/margareth-museu-nacional-reconstrucao.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Visita Museu Nacional', 'margareth-museu-nacional-b83-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth responde ataques sobre samba-enredo crítico ao governo.', 'Samba é livre. Escola de samba critica presidente? Ótimo, é democracia. Nosso MinC não tem medo de crítica nenhuma.', 'Declaração após críticas de políticos da esquerda a samba-enredo em 2025.', 'verified', false, '2025-02-28', 'https://folha.uol.com.br/ilustrada/2025/02/margareth-samba-enredo-critica.shtml', 'news_article', 1, 'Rio de Janeiro', 'Entrevista Carnaval 2025', 'margareth-samba-enredo-critica-b83-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia denuncia aumento de ataques armados a territórios indígenas.', 'Grupos de garimpeiros estão armados a serviço de interesses econômicos. Estamos tratando como crime organizado.', 'Coletiva após tiroteio em terra indígena Munduruku.', 'verified', false, '2024-07-30', 'https://g1.globo.com/pa/para/noticia/2024/07/30/sonia-ataques-terras-indigenas-munduruku.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-ataques-munduruku-b83-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Guajajara critica projeto de anistia ao garimpo ilegal.', 'Anistia ao garimpo é anistia ao genocídio. O Congresso não pode se tornar cúmplice da morte Yanomami.', 'Entrevista sobre PL que flexibilizava o licenciamento mineral.', 'verified', true, '2024-03-20', 'https://oglobo.globo.com/politica/sonia-anistia-garimpo-2024.ghtml', 'news_article', 2, 'Brasília', 'Entrevista à CBN', 'sonia-anistia-garimpo-b83-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia celebra STF derrubando Marco Temporal pela terceira vez.', 'O STF confirma: não existe Marco Temporal. Agora o Congresso precisa respeitar a Constituição.', 'Declaração após decisão do STF que derrubou mais uma tentativa legislativa.', 'verified', true, '2024-12-05', 'https://folha.uol.com.br/poder/2024/12/sonia-stf-marco-temporal-terceira.shtml', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-stf-marco-temporal-terceira-b83-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Guajajara defende Bolsa Verde para povos indígenas.', 'Bolsa Verde remunera quem cuida da floresta. Quem cuida melhor da Amazônia que povos originários?', 'Anúncio do programa Bolsa Verde ampliado para aldeias.', 'verified', false, '2024-05-10', 'https://agenciabrasil.ebc.com.br/meio-ambiente/noticia/2024-05/sonia-bolsa-verde-aldeias', 'news_article', 1, 'Manaus', 'Lançamento Bolsa Verde', 'sonia-bolsa-verde-aldeias-b83-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco lança Mês da Consciência Negra 2024.', 'Consciência negra não é só data, é prática diária. Que a cada 20 de novembro o Brasil se olhe no espelho.', 'Discurso no Palácio do Planalto em 20 de novembro de 2024.', 'verified', false, '2024-11-20', 'https://g1.globo.com/politica/noticia/2024/11/20/anielle-20-novembro-consciencia-negra.ghtml', 'news_article', 1, 'Brasília', 'Ato 20 de Novembro', 'anielle-consciencia-negra-2024-b83-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle responde injúrias de bolsonarista em rede social.', 'Ofensa racista a ministra negra não é opinião, é crime. Vou ao Ministério Público.', 'Após série de ataques racistas a Anielle nas redes em 2024.', 'verified', true, '2024-06-21', 'https://folha.uol.com.br/poder/2024/06/anielle-racismo-redes-denuncia.shtml', 'news_article', 2, 'Brasília', 'Postagem em rede social', 'anielle-racismo-redes-denuncia-b83-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle celebra nova Lei de Cotas revisada.', 'A nova Lei de Cotas é mais ampla e mais justa. Ganha a educação, ganha o Brasil.', 'Sanção da nova Lei de Cotas que ampliou critérios para baixa renda.', 'verified', true, '2023-11-13', 'https://g1.globo.com/educacao/noticia/2023/11/13/anielle-lei-cotas-revisada-sancao.ghtml', 'news_article', 1, 'Brasília', 'Sanção Lei 14.723/2023', 'anielle-lei-cotas-revisada-b83-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca escolas que "doutrinam" sobre 8 de janeiro.', 'Escolas que fazem redação sobre 8 de janeiro estão doutrinando. Vamos apresentar PL para proibir política partidária em sala.', 'Vídeo em rede social durante aniversário do 8 de janeiro.', 'verified', true, '2024-01-08', 'https://www.metropoles.com/brasil/politica-br/nikolas-8-janeiro-escola-doutrinacao', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-8-janeiro-escola-b83-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas promove "Escola Sem Partido" 2.0.', 'A escola brasileira precisa de uma nova Escola Sem Partido. Professor não pode mais usar aluno como palanque.', 'Apresentação de PL na Câmara restringindo debate político em sala de aula.', 'verified', true, '2024-06-05', 'https://www.poder360.com.br/congresso/nikolas-escola-sem-partido-2-0/', 'news_article', 4, 'Câmara dos Deputados', 'Apresentação de PL', 'nikolas-escola-sem-partido-b83-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que professores são "inimigos da família".', 'O professor de esquerda se tornou inimigo da família brasileira. Ele entra na sua casa pela caderneta do seu filho.', 'Vídeo em canal bolsonarista sobre "grooming político" em escolas.', 'verified', true, '2024-08-02', 'https://folha.uol.com.br/educacao/2024/08/nikolas-professores-inimigos-familia.shtml', 'social_media_post', 5, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-professores-inimigos-b83-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo classifica fala de Nikolas como "ataque à escola pública".', 'Dizer que professor é inimigo da família é chamar o Brasil de inimigo do Brasil. Professor merece respeito, não ódio.', 'Entrevista em resposta a Nikolas Ferreira.', 'verified', true, '2024-08-03', 'https://g1.globo.com/educacao/noticia/2024/08/03/camilo-nikolas-professores-inimigos.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'camilo-responde-nikolas-professores-b83-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama professores de universidades de "parasitas".', 'Tem universidade em que professor dá 8 horas por semana e ganha R$ 20 mil. Isso é parasitismo.', 'Discurso no plenário defendendo reforma do estatuto docente.', 'verified', false, '2024-10-09', 'https://oglobo.globo.com/politica/bia-kicis-professores-parasitas-2024.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'bia-kicis-professores-parasitas-b83-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende fim do ensino de "gênero" no PNLD.', 'Não queremos nossos filhos lendo sobre gênero na escola. Pais têm o direito de proteger a infância.', 'Audiência no Senado sobre livros do PNLD 2025.', 'verified', true, '2024-11-04', 'https://www1.folha.uol.com.br/educacao/2024/11/damares-pnld-genero.shtml', 'news_article', 4, 'Senado Federal', 'Audiência CDH', 'damares-pnld-genero-b83-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ameaça ações contra professores evangélicos que ensinam "evolução".', 'Professor evangélico não precisa ensinar evolucionismo como única verdade. Criacionismo é opção legítima na sala.', 'Culto transmitido em rede de TV cristã.', 'verified', false, '2023-08-28', 'https://www.metropoles.com/brasil/politica-br/feliciano-evolucao-criacionismo-escola', 'news_article', 4, 'São Paulo', 'Culto Catedral do Avivamento', 'feliciano-evolucao-criacionismo-b83-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que Camilo Santana "está destruindo" educação do país.', 'O MEC de Lula está destruindo a educação brasileira. Se eu voltar, acabo com o Pé-de-Meia e a doutrinação.', 'Entrevista em canal bolsonarista durante campanha municipal.', 'verified', true, '2024-09-23', 'https://folha.uol.com.br/poder/2024/09/bolsonaro-camilo-mec-destruicao.shtml', 'news_article', 4, 'São Paulo', 'Canal bolsonarista', 'bolsonaro-camilo-destruicao-b83-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro propõe privatizar universidades federais em evento.', 'Universidade federal virou feudo do PT. Se voltar, privatizo a UFBA e a UFMG. Vai ter mérito, não panfletagem.', 'Fala em evento do PL com empresários.', 'verified', true, '2024-10-14', 'https://oglobo.globo.com/politica/bolsonaro-privatizar-ufba-ufmg-2024.ghtml', 'news_article', 5, 'São Paulo', 'Evento PL empresarial', 'bolsonaro-privatizar-universidades-b83-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles defende fim do Ministério dos Povos Indígenas.', 'MPI é estrutura supérflua. Devia ser secretaria, não ministério. Cortem esse gasto imediatamente.', 'Entrevista a rádio conservadora após cortes orçamentários.', 'verified', false, '2024-02-26', 'https://www.poder360.com.br/governo/salles-fim-mpi-ministerio/', 'news_article', 3, 'São Paulo', 'Entrevista rádio', 'salles-fim-mpi-b83-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel propõe CPI do PNLD para "checar viés ideológico".', 'PNLD virou propaganda ideológica paga com dinheiro público. Precisa de CPI urgente.', 'Apresentação de requerimento de CPI na Câmara.', 'verified', false, '2024-07-04', 'https://www.poder360.com.br/congresso/van-hattem-cpi-pnld-viés/', 'news_article', 3, 'Câmara dos Deputados', 'Requerimento de CPI', 'van-hattem-cpi-pnld-b83-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende "meritocracia" contra cotas.', 'A revisão das cotas foi covardia do Senado. Deveríamos caminhar para a meritocracia, não para o assistencialismo racial.', 'Coluna no Estadão após aprovação da nova Lei de Cotas.', 'verified', false, '2023-11-16', 'https://www.estadao.com.br/opiniao/kim-meritocracia-cotas-2023/', 'news_article', 3, 'São Paulo', 'Coluna Estadão', 'kim-meritocracia-cotas-b83-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica Camilo por reajuste a professores.', 'Reajuste sem produtividade só infla custo. Precisa de meritocracia docente antes de mais aumento.', 'Entrevista em programa econômico sobre piso salarial.', 'verified', false, '2024-01-20', 'https://valor.globo.com/politica/noticia/2024/01/20/adriana-ventura-reajuste-piso-professores.ghtml', 'news_article', 2, 'São Paulo', 'Entrevista Valor', 'adriana-reajuste-piso-b83-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata apoia Pé-de-Meia mas critica execução do MEC.', 'O conceito do Pé-de-Meia está certo. Mas o MEC está atrasado com pagamentos e dados. Não basta boa intenção.', 'Pronunciamento sobre relatório da CGU sobre o programa.', 'verified', false, '2025-03-04', 'https://novaescola.org.br/conteudo/25800/tabata-pe-de-meia-cgu', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'tabata-pe-de-meia-cgu-b83-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende cotas para trans em federais.', 'Vagas para travestis e trans nas universidades são reparação. Não estamos pedindo favor, exigindo direito.', 'Pronunciamento em plenário por lei que regulamenta cotas trans.', 'verified', false, '2024-11-27', 'https://g1.globo.com/educacao/noticia/2024/11/27/erika-cotas-trans-universidades.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Plenário', 'erika-cotas-trans-b83-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia bloqueio de recursos para IFs.', 'O contingenciamento do IFRJ é um crime. Jovens de escola técnica federal estão em risco por falta de bandejão.', 'Pronunciamento em plenário após denúncias de institutos federais.', 'verified', false, '2024-08-07', 'https://oglobo.globo.com/educacao/noticia/2024/08/samia-ifrj-contingenciamento-2024.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Plenário', 'samia-ifrj-contingenciamento-b83-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_osi, 'Orlando Silva defende educação midiática obrigatória.', 'A melhor vacina contra fake news é educação midiática. Precisa ser disciplina obrigatória a partir do fundamental II.', 'Audiência pública sobre educação midiática no Senado.', 'verified', false, '2024-05-09', 'https://www1.folha.uol.com.br/educacao/2024/05/orlando-silva-educacao-midiatica.shtml', 'news_article', 1, 'Senado Federal', 'Audiência pública', 'orlando-educacao-midiatica-b83-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar defende museu Bispo do Rosário após ameaça de fechamento.', 'Museu Bispo do Rosário é patrimônio. Quem tenta fechar não entende cultura, entende só custo.', 'Manifestação em defesa do museu em Jacarepaguá.', 'verified', false, '2024-01-11', 'https://oglobo.globo.com/cultura/noticia/2024/01/chico-bispo-rosario-museu.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Ato no Museu Bispo do Rosário', 'chico-bispo-rosario-b83-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira defende FIES contra proposta de fim.', 'Fim do FIES é fim do sonho de milhões. Programa precisa de reforma, não de extinção.', 'Debate sobre reformulação do FIES na Câmara.', 'verified', false, '2023-07-04', 'https://valor.globo.com/brasil/educacao/noticia/2023/07/04/jandira-fies-debate.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Debate FIES', 'jandira-fies-debate-b83-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tpe, 'Talíria Petrone denuncia racismo em livros paradidáticos.', 'Alguns livros ainda retratam pessoas negras como objeto, não como sujeito. MEC precisa vigiar o PNLD.', 'Audiência na Câmara sobre racismo em materiais escolares.', 'verified', false, '2024-04-16', 'https://folha.uol.com.br/educacao/2024/04/taliria-racismo-livros-paradidaticos.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Audiência pública', 'taliria-racismo-livros-b83-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh critica corte de emendas para universidades.', 'Cortar emendas de universidade federal é cortar ciência no Brasil. Parem com esse cabo de guerra.', 'Pronunciamento em plenário sobre LDO.', 'verified', false, '2025-02-19', 'https://valor.globo.com/politica/noticia/2025/02/19/lindbergh-emendas-universidades.ghtml', 'news_article', 1, 'Senado Federal', 'Plenário', 'lindbergh-emendas-universidades-b83-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade anuncia plano de saúde indígena permanente.', 'Saúde Yanomami não pode ser crise recorrente. Estamos criando estrutura permanente, não emergencial.', 'Lançamento do plano de saúde indígena reestruturado.', 'verified', false, '2024-01-20', 'https://agenciabrasil.ebc.com.br/saude/noticia/2024-01/nisia-plano-saude-yanomami', 'news_article', 1, 'Brasília', 'Lançamento plano', 'nisia-plano-saude-yanomami-b83-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia rebate parlamentares que chamam Mais Médicos de "propaganda".', 'Mais Médicos salva vidas em 5.300 municípios. Quem chama de propaganda é quem nunca foi atendido no SUS.', 'Coletiva sobre Mais Médicos.', 'verified', false, '2023-07-12', 'https://g1.globo.com/saude/noticia/2023/07/12/nisia-mais-medicos-coletiva.ghtml', 'news_article', 1, 'Brasília', 'Coletiva MS', 'nisia-mais-medicos-coletiva-b83-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida defende política de escola sem violência.', 'Escola precisa ser santuário. Cada tiroteio em escola é falha de Estado. Prevenção é política de direitos humanos.', 'Entrevista após série de ataques em escolas no primeiro semestre de 2023.', 'verified', false, '2023-04-06', 'https://folha.uol.com.br/cotidiano/2023/04/silvio-almeida-escolas-violencia.shtml', 'news_article', 1, 'Brasília', 'Entrevista à Folha', 'silvio-escolas-violencia-b83-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves lança programa Mulheres na Ciência.', 'Mulheres são 53% das universidades mas apenas 33% dos cientistas seniores. Precisamos mudar essa conta.', 'Lançamento com Luciana Santos em Brasília.', 'verified', false, '2024-03-08', 'https://valor.globo.com/brasil/noticia/2024/03/08/cida-mulheres-ciencia-programa.ghtml', 'news_article', 1, 'Brasília', 'Dia Internacional da Mulher', 'cida-mulheres-ciencia-b83-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pte, 'Paulo Teixeira responde ataques a escolas do MST.', 'Escola do MST é escola do Brasil. Quem ataca é quem tem medo de camponês ensinando seu próprio filho.', 'Entrevista após ataques a escolas em acampamentos do MST.', 'verified', false, '2024-02-08', 'https://oglobo.globo.com/politica/paulo-teixeira-escola-mst-2024.ghtml', 'news_article', 2, 'Brasília', 'Entrevista à CBN', 'paulo-teixeira-escola-mst-b83-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mma, 'Márcio Macedo defende orçamento do MinC em articulação.', 'Fechar a Aldir Blanc é fechar cultura de periferia. Meu papel é articular cada ministério em defesa disso.', 'Entrevista sobre articulação política do governo em torno da cultura.', 'verified', false, '2024-08-23', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-08/marcio-macedo-aldir-blanc', 'news_article', 1, 'Brasília', 'Entrevista Secretaria-Geral', 'marcio-aldir-blanc-articulacao-b83-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_est, 'Esther Dweck anuncia concurso nacional para o MEC.', 'CNU 2 terá 8 mil vagas para educação. Inep, MEC e universidades vão recompor quadros técnicos essenciais.', 'Anúncio do segundo Concurso Nacional Unificado.', 'verified', false, '2025-02-05', 'https://valor.globo.com/brasil/concurso/noticia/2025/02/05/esther-cnu-2-educacao.ghtml', 'news_article', 1, 'Brasília', 'Anúncio CNU 2', 'esther-cnu-2-educacao-b83-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende ciência em debate com deputado bolsonarista.', 'Quem desprezou ciência na pandemia deveria ter vergonha de falar em orçamento de MCTI. A conta da Terra plana é alta.', 'Embate em comissão do Senado sobre orçamento.', 'verified', false, '2024-11-13', 'https://g1.globo.com/politica/noticia/2024/11/13/tebet-ciencia-debate-bolsonarista.ghtml', 'news_article', 2, 'Senado Federal', 'Comissão de Orçamento', 'tebet-ciencia-debate-b83-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina Silva defende educação ambiental em escolas.', 'Toda escola precisa falar sobre clima. Gerar uma geração ambientalmente letrada é investimento em sobrevivência.', 'Palestra em universidade federal sobre COP30 e educação.', 'verified', false, '2025-03-22', 'https://novaescola.org.br/conteudo/25900/marina-educacao-ambiental-cop30', 'news_article', 1, 'Belém', 'Evento COP30 educação', 'marina-educacao-ambiental-cop30-b83-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia aumento recorde do orçamento da educação para 2025.', 'Educação tem o maior orçamento da história. Professores e alunos do Brasil merecem esse respeito.', 'Anúncio em cerimônia em janeiro de 2025.', 'verified', false, '2025-01-31', 'https://valor.globo.com/brasil/educacao/noticia/2025/01/31/lula-orcamento-educacao-2025.ghtml', 'news_article', 1, 'Brasília', 'Pronunciamento presidencial', 'lula-orcamento-educacao-2025-b83-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende investimento em ciência como âncora fiscal.', 'Inovação não é gasto, é investimento. Cada real no MCTI volta multiplicado ao longo da vida.', 'Palestra em evento da Febraban sobre orçamento.', 'verified', false, '2024-06-06', 'https://valor.globo.com/brasil/economia/noticia/2024/06/06/haddad-ciencia-ancora-fiscal.ghtml', 'news_article', 1, 'São Paulo', 'Febraban Tech', 'haddad-ciencia-ancora-fiscal-b83-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi critica Nikolas Ferreira após ataques ao MEC.', 'Nikolas mente sobre educação e a extrema direita compra. Mas dados do MEC desmentem cada mentira.', 'Postagem em rede social em defesa de Camilo Santana.', 'verified', false, '2024-05-23', 'https://oglobo.globo.com/politica/gleisi-nikolas-mec-2024.ghtml', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'gleisi-nikolas-mec-b83-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa articula aumento do FNDE.', 'O FNDE vai receber reforço orçamentário. Merenda escolar vai manter qualidade mesmo com inflação.', 'Coletiva Casa Civil sobre execução orçamentária.', 'verified', false, '2025-03-10', 'https://valor.globo.com/politica/noticia/2025/03/10/rui-fnde-orcamento-merenda.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Casa Civil', 'rui-fnde-merenda-b83-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_apa, 'Padilha articula defesa de Sônia Guajajara no Congresso.', 'Nosso papel é defender a ministra Sônia, que enfrenta ataques racistas todos os dias no Congresso.', 'Entrevista sobre articulação política em defesa do MPI.', 'verified', false, '2024-04-04', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-04/padilha-sonia-guajajara-defesa', 'news_article', 1, 'Brasília', 'Entrevista Alexandre Padilha', 'padilha-defesa-sonia-b83-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdi, 'Wellington Dias detalha sinergia entre Bolsa Família e Pé-de-Meia.', 'Bolsa Família e Pé-de-Meia conversam. O primeiro mantém a criança na escola, o segundo garante que ela chegue à universidade.', 'Entrevista sobre integração de programas sociais.', 'verified', false, '2024-03-17', 'https://valor.globo.com/brasil/noticia/2024/03/17/wellington-bolsa-familia-pe-de-meia.ghtml', 'news_article', 1, 'Brasília', 'Entrevista Valor', 'wellington-bolsa-familia-pe-de-meia-b83-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Pé-de-Meia de "compra de voto".', 'Pé-de-Meia é compra de voto mascarada de política educacional. Gente séria não aceita isso.', 'Entrevista a programa bolsonarista durante campanha municipal 2024.', 'verified', true, '2024-10-03', 'https://folha.uol.com.br/poder/2024/10/bolsonaro-pe-de-meia-compra-voto.shtml', 'news_article', 4, 'Rio de Janeiro', 'Canal bolsonarista', 'bolsonaro-pe-de-meia-compra-voto-b83-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas associa Pé-de-Meia a "subsídio para maconha".', 'Pé-de-Meia pode virar bolsa maconha na mão errada. Mas o MEC de Lula não tá nem aí.', 'Postagem em rede social; afirmação desmentida por checadores e sem base em dados.', 'verified', true, '2024-04-11', 'https://oglobo.globo.com/politica/nikolas-pe-de-meia-maconha-checagem-2024.ghtml', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-pe-de-meia-maconha-b83-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo processa Nikolas Ferreira por calúnia em caso do Pé-de-Meia.', 'Mentir sobre política pública com milhões em jogo é crime. Estou entrando com queixa-crime contra o deputado.', 'Anúncio de queixa-crime contra Nikolas Ferreira.', 'verified', true, '2024-04-15', 'https://g1.globo.com/politica/noticia/2024/04/15/camilo-nikolas-calunia-pe-de-meia.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MEC', 'camilo-queixa-nikolas-b83-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara em COP30 convoca proteção de floresta e educação indígena.', 'Não há COP sem indígena. Educação bilíngue nas aldeias é tão estratégica quanto demarcação.', 'Fala na COP30 em Belém.', 'verified', true, '2025-11-12', 'https://valor.globo.com/brasil/cop30/noticia/2025/11/12/sonia-cop30-educacao-indigena.ghtml', 'news_article', 1, 'Belém', 'COP30', 'sonia-cop30-educacao-indigena-b83-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo anuncia programa Conectividade em Aldeia.', 'Escola indígena precisa de internet. Parceria com MCTI e MPI vai levar banda larga a 800 aldeias.', 'Lançamento em parceria com Luciana Santos e Sônia Guajajara.', 'verified', false, '2025-05-06', 'https://novaescola.org.br/conteudo/26000/camilo-conectividade-aldeia-mec', 'news_article', 1, 'Brasília', 'Lançamento conjunto', 'camilo-conectividade-aldeia-b83-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth Menezes defende ocupação cultural em Brumadinho.', 'Lugar da tragédia precisa virar lugar de memória. Cultura reconstrói onde a economia destruiu.', 'Discurso em Brumadinho no aniversário da tragédia.', 'verified', false, '2024-01-25', 'https://oglobo.globo.com/cultura/noticia/2024/01/margareth-brumadinho-memoria.ghtml', 'news_article', 1, 'Brumadinho', 'Aniversário da tragédia', 'margareth-brumadinho-memoria-b83-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana rebate declaração de Ricardo Salles sobre Inpe.', 'Salles fala de Inpe sem nunca ter lido um relatório sério. Ciência não aceita achismo.', 'Resposta a Ricardo Salles que havia criticado dados do Inpe.', 'verified', false, '2024-08-15', 'https://agenciabrasil.ebc.com.br/ciencia-e-tecnologia/noticia/2024-08/luciana-salles-inpe', 'news_article', 2, 'Brasília', 'Postagem em rede social', 'luciana-salles-inpe-b83-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles questiona Inpe e chama cientistas de "militantes".', 'O Inpe se tornou instrumento de ativismo. Os números sobre queimadas são inflados para fazer narrativa anti-Brasil.', 'Postagem em rede social sobre relatório de queimadas.', 'verified', true, '2024-08-14', 'https://www1.folha.uol.com.br/ambiente/2024/08/ricardo-salles-inpe-militantes.shtml', 'social_media_post', 4, 'São Paulo', 'Postagem em rede social', 'salles-inpe-militantes-b83-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle defende lei contra racismo religioso em escolas.', 'Toda criança deve aprender sobre as religiões de matriz africana como patrimônio, não como "macumba".', 'Lançamento de programa de combate ao racismo religioso em escolas.', 'verified', false, '2024-08-08', 'https://folha.uol.com.br/educacao/2024/08/anielle-racismo-religioso-escola.shtml', 'news_article', 2, 'Salvador', 'Evento MIR Bahia', 'anielle-racismo-religioso-escola-b83-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ataca programa de religiões afro-brasileiras em escolas.', 'Macumba na sala de aula é um crime contra a fé cristã. Pais, resistam.', 'Culto em rede de TV após programa anunciado por Anielle Franco.', 'verified', true, '2024-08-11', 'https://www.metropoles.com/brasil/politica-br/feliciano-macumba-escola-anielle', 'news_article', 4, 'São Paulo', 'Culto Catedral do Avivamento', 'feliciano-macumba-escola-b83-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle denuncia Feliciano à PGR por intolerância religiosa.', 'Chamar religião afro-brasileira de crime é intolerância religiosa. Estou denunciando à PGR.', 'Anúncio de representação contra Marco Feliciano.', 'verified', true, '2024-08-12', 'https://oglobo.globo.com/politica/anielle-denuncia-feliciano-pgr-2024.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MIR', 'anielle-denuncia-feliciano-b83-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana celebra aumento do Ideb em 2024.', 'O Ideb confirma que estamos na direção certa. Agora é investir em alfabetização para ampliar o ritmo.', 'Divulgação do Ideb 2024.', 'verified', false, '2024-09-19', 'https://novaescola.org.br/conteudo/26100/camilo-ideb-2024', 'news_article', 1, 'Brasília', 'Divulgação Ideb', 'camilo-ideb-2024-b83-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata cobra metas claras para alfabetização no MEC.', 'Precisamos de prazo. Quando toda criança brasileira sairá alfabetizada na idade certa? O MEC precisa fixar data.', 'Coluna no Valor Educação.', 'verified', false, '2025-05-02', 'https://valor.globo.com/eu-e/coluna/tabata-alfabetizacao-metas-mec.ghtml', 'news_article', 2, 'São Paulo', 'Coluna Valor', 'tabata-alfabetizacao-metas-b83-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo anuncia Compromisso Nacional Criança Alfabetizada 2.0.', 'Vamos dobrar o compromisso com alfabetização. Cada criança do 2° ano precisa sair lendo textos.', 'Lançamento da segunda fase do CNCA.', 'verified', false, '2025-06-09', 'https://g1.globo.com/educacao/noticia/2025/06/09/camilo-crianca-alfabetizada-2-0.ghtml', 'news_article', 1, 'Brasília', 'Lançamento CNCA 2', 'camilo-crianca-alfabetizada-2-b83-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia parlamentar por injúria racial.', 'Ser chamada de "índio" no diminutivo na tribuna é racismo. Vou acionar a Corregedoria do Congresso.', 'Após declaração ofensiva de parlamentar bolsonarista.', 'verified', true, '2024-07-03', 'https://folha.uol.com.br/poder/2024/07/sonia-denuncia-parlamentar-injuria-racial.shtml', 'news_article', 2, 'Brasília', 'Tribuna do Congresso', 'sonia-injuria-racial-parlamentar-b83-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis afirma que Sônia "parece turista" no cargo.', 'A ministra Sônia parece turista no cargo. Vai a todo evento indígena mas não resolve um único problema Yanomami.', 'Discurso em plenário com tom racista identificado por parlamentares.', 'verified', true, '2024-07-09', 'https://oglobo.globo.com/politica/bia-kicis-sonia-turista-ataque-2024.ghtml', 'news_article', 4, 'Câmara dos Deputados', 'Plenário', 'bia-kicis-sonia-turista-b83-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende Sônia Guajajara e critica ataques racistas.', 'Quem ataca a ministra Sônia é a cara do Brasil racista que não aceitamos. Governo não vai tolerar.', 'Declaração após ataques crescentes à ministra.', 'verified', true, '2024-07-12', 'https://g1.globo.com/politica/noticia/2024/07/12/lula-defende-sonia-ataques-racistas.ghtml', 'news_article', 2, 'Brasília', 'Pronunciamento', 'lula-defende-sonia-racismo-b83-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton apresenta PL contra bullying LGBT em escolas.', 'Uma criança trans tem quatro vezes mais chance de tentar suicídio. PL contra bullying LGBTI é política de salvar vidas.', 'Apresentação de PL sobre acolhimento em escolas.', 'verified', false, '2024-05-17', 'https://folha.uol.com.br/cotidiano/2024/05/erika-pl-bullying-lgbt-escola.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Apresentação de PL', 'erika-pl-bullying-lgbt-b83-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica bolsas para pesquisa em humanidades.', 'Capes paga tese sobre "performatividade queer" com dinheiro do povo. Urge revisar carteira de bolsas.', 'Coluna no Estadão sobre orçamento da Capes.', 'verified', false, '2024-10-22', 'https://www.estadao.com.br/opiniao/kim-capes-humanidades-2024/', 'news_article', 3, 'São Paulo', 'Coluna Estadão', 'kim-capes-humanidades-b83-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana rebate Kim Kataguiri sobre bolsas da Capes.', 'Debochar de tese de humanidades é coisa de quem nunca abriu livro. A Capes financia o pensamento crítico brasileiro.', 'Postagem em rede social em resposta a Kim Kataguiri.', 'verified', false, '2024-10-23', 'https://oglobo.globo.com/politica/luciana-kim-capes-2024.ghtml', 'social_media_post', 1, 'Brasília', 'Postagem em rede social', 'luciana-kim-capes-b83-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem chama cientistas de "mamadores do Estado".', 'Cientista federal ganha bolsa com dinheiro público para ficar sete anos no doutorado. São mamadores do Estado.', 'Discurso em comissão de orçamento.', 'verified', false, '2024-11-19', 'https://www.poder360.com.br/congresso/van-hattem-cientistas-mamadores/', 'news_article', 4, 'Câmara dos Deputados', 'Comissão de Orçamento', 'van-hattem-cientistas-mamadores-b83-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade responde negacionismo vacinal na volta do sarampo.', 'A volta do sarampo é a prova. Cada criança que não se vacina é um perigo à saúde pública. Negacionismo tem consequência.', 'Coletiva após casos de sarampo ressurgirem.', 'verified', true, '2024-10-04', 'https://g1.globo.com/saude/noticia/2024/10/04/nisia-sarampo-negacionismo.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MS', 'nisia-sarampo-negacionismo-b83-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro volta a questionar vacina infantil de Covid-19.', 'Vacinar criança de Covid é loucura. Filho meu nunca tomou e nunca tomará.', 'Entrevista em podcast mesmo com parecer científico favorável à vacina.', 'verified', true, '2024-04-22', 'https://www1.folha.uol.com.br/poder/2024/04/bolsonaro-vacina-crianca-covid-negacionismo.shtml', 'news_article', 4, 'Brasília', 'Podcast bolsonarista', 'bolsonaro-vacina-crianca-covid-b83-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares questiona dados do MS sobre vacinação infantil.', 'Estatísticas do Ministério da Saúde não são confiáveis. Estão inflando para justificar obrigatoriedade.', 'Discurso no Senado questionando cobertura vacinal.', 'verified', false, '2024-10-18', 'https://www.poder360.com.br/senado/damares-vacinacao-estatisticas-ms/', 'news_article', 4, 'Senado Federal', 'Plenário Senado', 'damares-vacinacao-estatisticas-b83-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves lança cartilha para combater violência política de gênero.', 'Parlamentar mulher sofre três vezes mais ataques. A cartilha da Secretaria é a defesa institucional das nossas representantes.', 'Lançamento em evento no Congresso.', 'verified', false, '2024-07-25', 'https://valor.globo.com/politica/noticia/2024/07/25/cida-cartilha-violencia-politica-genero.ghtml', 'news_article', 1, 'Brasília', 'Evento Ministério das Mulheres', 'cida-cartilha-violencia-politica-b83-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida defende educação em direitos humanos após polêmicas.', 'Retirar direitos humanos do currículo é retirar Constituição da escola. Não dá para aceitar.', 'Pronunciamento em defesa do MDHC durante crise orçamentária.', 'verified', false, '2024-05-21', 'https://oglobo.globo.com/politica/silvio-direitos-humanos-escola-orcamento-2024.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MDHC', 'silvio-direitos-humanos-orcamento-b83-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth assina decreto para retomar acervos saqueados no MinC.', 'Vamos devolver aos museus o que foi levado. Restauração não é nostalgia, é reparação institucional.', 'Decreto sobre acervos federais em museus.', 'verified', false, '2023-09-05', 'https://folha.uol.com.br/ilustrada/2023/09/margareth-acervos-museus-retomada.shtml', 'news_article', 1, 'Brasília', 'Assinatura de decreto', 'margareth-acervos-museus-b83-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia lança primeiro Plano Nacional de Educação Escolar Indígena.', 'Pela primeira vez, o Brasil terá plano de educação indígena construído com indígenas. Ponto final.', 'Lançamento em evento com MEC e MPI.', 'verified', false, '2024-10-29', 'https://g1.globo.com/educacao/noticia/2024/10/29/sonia-plano-educacao-indigena.ghtml', 'news_article', 1, 'Brasília', 'Lançamento conjunto MEC-MPI', 'sonia-plano-educacao-indigena-b83-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco anuncia centros de memória da escravidão em 10 estados.', 'Escravidão é parte da nossa história e não pode ficar invisível. Dez centros de memória vão mudar isso.', 'Lançamento em Salvador em novembro de 2025.', 'verified', false, '2025-11-19', 'https://valor.globo.com/eu-e/cultura/noticia/2025/11/19/anielle-centros-memoria-escravidao.ghtml', 'news_article', 1, 'Salvador', 'Lançamento 20 de Novembro', 'anielle-centros-memoria-escravidao-b83-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo inaugura novo campus de universidade federal no Amazonas.', 'Universidade na Amazônia é soberania. Este campus vai formar professores, cientistas e agentes de saúde locais.', 'Inauguração de campus federal em Tabatinga.', 'verified', false, '2025-08-14', 'https://g1.globo.com/am/amazonas/noticia/2025/08/14/camilo-campus-federal-tabatinga.ghtml', 'news_article', 1, 'Tabatinga', 'Inauguração campus', 'camilo-campus-tabatinga-b83-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth rebate ataques bolsonaristas a bloco carioca com sátira ao presidente.', 'Bloco satirizou o Bolsonaro. Ótimo. Cultura é livre. Quem teme sátira política é autoritário.', 'Declaração durante o Carnaval 2024 após polêmica.', 'verified', false, '2024-02-10', 'https://oglobo.globo.com/cultura/carnaval/2024/margareth-bloco-satira-bolsonaro.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Coletiva MinC', 'margareth-bloco-satira-carnaval-b83-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata celebra aprovação do fundo para educação infantil.', 'O fundo de creche é fundamental. Dezenas de milhares de crianças de 0 a 3 agora têm chance de vaga.', 'Sanção de lei de apoio à educação infantil.', 'verified', false, '2024-12-18', 'https://novaescola.org.br/conteudo/26300/tabata-fundo-educacao-infantil', 'news_article', 1, 'Brasília', 'Sanção de lei', 'tabata-fundo-infantil-b83-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana lança plano de quantum e fotônica em universidades.', 'O Brasil entra na fronteira da computação quântica. UFSC, UFRJ e UFPE lideram com laboratórios próprios.', 'Anúncio em evento MCTI.', 'verified', false, '2025-07-29', 'https://valor.globo.com/brasil/tecnologia/noticia/2025/07/29/luciana-plano-quantum-fotonica.ghtml', 'news_article', 1, 'Brasília', 'Lançamento MCTI', 'luciana-quantum-fotonica-b83-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana comemora aumento de aprovados negros em medicina.', 'Cotas raciais fizeram a faculdade de medicina voltar a se parecer com o Brasil. Não tem retrocesso.', 'Divulgação de dados do Sisu 2025.', 'verified', false, '2025-02-06', 'https://folha.uol.com.br/educacao/2025/02/camilo-cotas-medicina-sisu.shtml', 'news_article', 1, 'Brasília', 'Divulgação Sisu', 'camilo-cotas-medicina-sisu-b83-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara abre encontro mundial indígena no Rio.', 'O mundo precisa ouvir os povos originários antes de decidir sobre clima. Esse encontro muda a geopolítica.', 'Abertura do Fórum Indígena Global no Rio.', 'verified', false, '2025-10-14', 'https://oglobo.globo.com/politica/sonia-forum-indigena-global-rio-2025.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Fórum Indígena Global', 'sonia-forum-indigena-global-b83-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco defende mandato firme contra racismo digital.', 'Racismo digital é crime. Quem compartilha montagem ofensiva paga por isso na Justiça.', 'Discurso em seminário sobre violência online.', 'verified', false, '2025-05-14', 'https://novaescola.org.br/conteudo/26400/anielle-racismo-digital-lei', 'news_article', 2, 'Brasília', 'Seminário Direitos Humanos', 'anielle-racismo-digital-b83-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth defende Oscar de Fernanda Torres como vitória cultural.', 'O Oscar de Fernanda Torres é vitória de uma política cultural que reergue o audiovisual brasileiro.', 'Discurso após prêmio de "Ainda Estou Aqui".', 'verified', true, '2025-03-02', 'https://folha.uol.com.br/ilustrada/2025/03/margareth-oscar-fernanda-torres.shtml', 'news_article', 1, 'Brasília', 'Coletiva Oscar 2025', 'margareth-oscar-fernanda-torres-b83-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira tenta boicote a "Ainda Estou Aqui" nas escolas.', 'Não levem seus filhos para ver filme que faz apologia à esquerda. O Oscar é mais um tapa do globalismo.', 'Postagem em rede social após o Oscar de "Ainda Estou Aqui".', 'verified', true, '2025-03-03', 'https://www.metropoles.com/brasil/politica-br/nikolas-ainda-estou-aqui-oscar-boicote', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-ainda-estou-aqui-boicote-b83-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar celebra universidade pública diante de ataques.', 'Defender UFRJ e UFSC é defender o Brasil. A universidade pública é patrimônio inegociável.', 'Pronunciamento em defesa das universidades em 2026.', 'verified', false, '2026-02-18', 'https://valor.globo.com/politica/noticia/2026/02/18/chico-universidades-defesa-2026.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Plenário', 'chico-universidades-defesa-2026-b83-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo comemora inscrições recorde no ENEM 2025.', 'Tivemos mais de 5,3 milhões de inscritos no ENEM 2025. É a confiança do Brasil na educação voltando.', 'Coletiva anunciando inscrições do ENEM 2025.', 'verified', false, '2025-06-04', 'https://g1.globo.com/educacao/enem/2025/noticia/2025/06/04/camilo-inscricoes-enem-2025.ghtml', 'news_article', 1, 'Brasília', 'Coletiva MEC', 'camilo-enem-2025-inscricoes-b83-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo faz balanço de três anos do MEC.', 'Em três anos, recompusemos orçamento, lançamos Pé-de-Meia, retomamos universidades e devolvemos ciência. O Brasil da educação voltou.', 'Balanço em pronunciamento em abril de 2026.', 'verified', true, '2026-04-08', 'https://valor.globo.com/brasil/educacao/noticia/2026/04/08/camilo-balanco-tres-anos-mec.ghtml', 'news_article', 1, 'Brasília', 'Pronunciamento MEC', 'camilo-balanco-tres-anos-b83-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
