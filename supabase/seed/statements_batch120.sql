-- Batch 120: Fake news, platform regulation, Musk/X, PL 2630 (Jan 2023 - Apr 2026)
DO $$
DECLARE
  v_orl UUID; v_mor UUID; v_gil UUID; v_car UUID; v_bar UUID;
  v_zan UUID; v_din UUID; v_fac UUID; v_num UUID; v_men UUID;
  v_jai UUID; v_edu UUID; v_fla UUID; v_cab UUID; v_nik UUID;
  v_zam UUID; v_ram UUID; v_bia UUID; v_mvh UUID; v_kim UUID;
  v_adv UUID; v_gir UUID; v_lul UUID; v_had UUID; v_gle UUID;
  v_pad UUID; v_rui UUID; v_mes UUID; v_lew UUID; v_tab UUID;
  v_eri UUID; v_sam UUID; v_tal UUID; v_jan UUID; v_chi UUID;
  v_mot UUID; v_alc UUID; v_lir UUID;
  c_des UUID; c_ant UUID; c_ame UUID; c_obs UUID; c_abu UUID;
  c_aut UUID; c_odi UUID; c_int UUID; c_con UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_num FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_men FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_cab FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva apresenta texto substitutivo do PL das Fake News na Câmara.', 'Precisamos regular as plataformas digitais para proteger a democracia da desinformação.', 'Relator do PL 2630 apresenta novo texto após meses de negociação com partidos e plataformas.', 'verified', true, '2023-04-27', 'https://g1.globo.com/politica/noticia/2023/04/27/orlando-silva-pl-fake-news-texto.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Apresentação substitutivo PL 2630', 'orlando-pl-fake-news-texto-b120-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira lidera obstrução contra PL das Fake News.', 'Isso é PL da censura. Vamos derrubar esse projeto que ameaça a liberdade de expressão.', 'Durante sessão para votar urgência do PL 2630, oposição trava a votação.', 'verified', true, '2023-05-02', 'https://www.poder360.com.br/congresso/nikolas-obstrucao-pl-fake-news/', 'news_article', 3, 'Câmara dos Deputados', 'Obstrução PL 2630', 'nikolas-obstrucao-pl-fake-news-b120-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira retira PL 2630 da pauta após pressão de plataformas.', 'Não há acordo para votação hoje. Vou retirar o projeto da pauta.', 'Presidente da Câmara recua da votação depois de campanha do Google contra o projeto.', 'verified', true, '2023-05-02', 'https://www1.folha.uol.com.br/poder/2023/05/lira-retira-pl-fake-news-pauta.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Retirada PL 2630 da pauta', 'lira-retira-pl-fake-news-b120-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva denuncia lobby do Google contra PL das Fake News.', 'O Google fez campanha explícita contra o projeto, é uma interferência inaceitável.', 'Relator denuncia campanha das Big Techs em entrevista após adiamento da votação.', 'verified', false, '2023-05-03', 'https://www.cnnbrasil.com.br/politica/orlando-silva-google-lobby-pl-fake-news/', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'orlando-google-lobby-b120-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis compara PL 2630 à "Lei da Mordaça" da Venezuela.', 'Esse PL é a versão brasileira da lei de Maduro. Vão silenciar a direita no Brasil.', 'Discurso em plenário contra o PL das Fake News durante semana de mobilização.', 'verified', false, '2023-05-09', 'https://oglobo.globo.com/politica/bia-kicis-pl-fake-news-venezuela/', 'news_article', 3, 'Câmara dos Deputados', 'Discurso plenário', 'bia-kicis-pl-venezuela-b120-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes defende regulação de plataformas no julgamento do Marco Civil.', 'A liberdade de expressão não protege discurso antidemocrático e desinformação dolosa.', 'Voto do ministro no julgamento sobre responsabilização de plataformas pelo STF.', 'verified', true, '2023-11-28', 'https://g1.globo.com/politica/noticia/2023/11/28/moraes-voto-marco-civil-plataformas.ghtml', 'news_article', 2, 'STF', 'Julgamento Marco Civil da Internet', 'moraes-voto-marco-civil-b120-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede nos EUA que Musk compre o Twitter para salvar "direita brasileira".', 'Precisamos que o Elon Musk compre o Twitter e liberte a direita brasileira do cerco de Moraes.', 'Declaração em evento conservador em Washington antes da compra do Twitter.', 'verified', false, '2023-02-15', 'https://www.metropoles.com/brasil/politica-br/eduardo-musk-twitter-direita', 'news_article', 3, 'Washington, EUA', 'Evento CPAC', 'eduardo-musk-twitter-b120-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cab, 'Carlos Bolsonaro celebra reativação de contas bolsonaristas no X.', 'Musk está libertando o Twitter das amarras da esquerda global.', 'Postagens do vereador após Musk reativar contas suspensas de aliados do PL.', 'verified', false, '2023-01-28', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/01/28/carlos-bolsonaro-musk-twitter.htm', 'social_media_post', 2, 'Rio de Janeiro', 'Postagens em rede social', 'carlos-musk-reativacao-b120-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli afirma que foi alvo de espionagem pela Abin "reversa" e nega uso.', 'Eu nunca usei ferramenta da Abin para espionar ninguém. Essa é mais uma armação.', 'Declaração após PF apontar uso de spyware FirstMile em perseguidos pelo bolsonarismo.', 'verified', true, '2024-01-25', 'https://www1.folha.uol.com.br/poder/2024/01/zambelli-abin-spyware-firstmile.shtml', 'news_article', 4, 'São Paulo', 'Entrevista após operação PF', 'zambelli-abin-spyware-b120-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem é indiciado por uso da Abin para espionar adversários e rede social.', 'Tudo o que fiz na Abin foi dentro da legalidade para proteger o Estado brasileiro.', 'Ex-diretor da Abin responde a indiciamento da PF sobre Abin paralela e FirstMile.', 'verified', true, '2024-03-15', 'https://g1.globo.com/politica/noticia/2024/03/15/ramagem-abin-paralela-indiciamento.ghtml', 'news_article', 5, 'Brasília', 'Pronunciamento após indiciamento', 'ramagem-abin-paralela-b120-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes intima Musk após X desafiar decisão do STF sobre bloqueio de contas.', 'Nenhuma empresa, por mais poderosa, está acima da Constituição brasileira.', 'Decisão do ministro após Musk anunciar publicamente que não cumpriria ordens do STF.', 'verified', true, '2024-04-07', 'https://www.theverge.com/2024/4/7/24123456/elon-musk-brazil-x-moraes-defiance', 'news_article', 3, 'STF', 'Decisão Inquérito das Milícias Digitais', 'moraes-intima-musk-b120-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama Musk de "herói da liberdade" ao desafiar STF.', 'Elon Musk está fazendo o que deputados brasileiros têm medo de fazer: enfrentar a ditadura do STF.', 'Postagem em rede social após Musk dizer publicamente que descumpriria ordens de Moraes.', 'verified', true, '2024-04-07', 'https://www.poder360.com.br/tecnologia/nikolas-musk-heroi-liberdade/', 'social_media_post', 4, 'Brasília', 'Postagem no X', 'nikolas-musk-heroi-b120-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pede a Musk que "liberte o Brasil" do STF.', 'Elon, o Brasil precisa de você. Não recue diante da tirania do Supremo.', 'Postagem em inglês no X marcando Musk durante conflito com STF em abril de 2024.', 'verified', true, '2024-04-08', 'https://restofworld.org/2024/eduardo-bolsonaro-musk-brazil-stf/', 'social_media_post', 4, 'Miami, EUA', 'Postagem em rede social', 'eduardo-musk-liberte-brasil-b120-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes multa Musk e X por descumprimento de ordens judiciais.', 'Multas diárias serão aplicadas enquanto as plataformas descumprirem ordens legítimas.', 'Decisão aplicando multa pessoal a Elon Musk no Inquérito das Fake News.', 'verified', true, '2024-04-08', 'https://www.bloomberg.com/news/articles/2024-04-08/musk-x-brazil-moraes-fines', 'news_article', 2, 'STF', 'Inquérito Fake News', 'moraes-multa-musk-b120-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula apoia decisões do STF contra Musk e defende soberania brasileira.', 'Ninguém, nenhum bilionário estrangeiro, vai ditar as regras no Brasil.', 'Entrevista a emissoras de rádio sobre conflito entre Musk e Moraes.', 'verified', true, '2024-04-09', 'https://g1.globo.com/politica/noticia/2024/04/09/lula-musk-soberania-brasil.ghtml', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'lula-musk-soberania-b120-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende Musk e ataca Moraes no Senado.', 'O Moraes virou carcereiro de presos políticos e agora quer calar o mundo todo.', 'Discurso do senador no plenário atacando decisões contra a plataforma X.', 'verified', false, '2024-04-10', 'https://www12.senado.leg.br/noticias/materias/2024/04/10/flavio-bolsonaro-moraes-musk', 'news_article', 3, 'Senado Federal', 'Discurso plenário', 'flavio-moraes-musk-b120-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem articula convite a Musk no Congresso brasileiro.', 'Queremos ouvir Elon Musk na CPI sobre a perseguição do STF às redes sociais.', 'Líder do Novo protocola convite durante crise entre X e Moraes.', 'verified', false, '2024-04-10', 'https://www.cnnbrasil.com.br/politica/marcel-van-hattem-musk-cpi-stf/', 'news_article', 2, 'Câmara dos Deputados', 'Requerimento de convite', 'marcel-musk-cpi-b120-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino defende regulação de plataformas como ministro da Justiça.', 'Precisamos de marco legal para proteger crianças, democracia e direitos nas redes.', 'Discurso do ministro na abertura de seminário sobre plataformas digitais.', 'verified', false, '2023-07-20', 'https://www.gov.br/mj/pt-br/assuntos/noticias/flavio-dino-regulacao-plataformas', 'other', 1, 'Brasília', 'Seminário MJSP sobre plataformas', 'dino-regulacao-plataformas-b120-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica PL das Fake News como "censura disfarçada".', 'O PL 2630 não resolve desinformação, cria burocracia para calar opositores.', 'Discurso em plenário da Câmara durante debate sobre o projeto.', 'verified', false, '2023-04-28', 'https://www.poder360.com.br/congresso/kim-kataguiri-pl-fake-news-censura/', 'news_article', 2, 'Câmara dos Deputados', 'Discurso plenário PL 2630', 'kim-pl-fake-news-censura-b120-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende PL das Fake News com ajustes para proteger jornalismo.', 'Queremos proteção a crianças e à democracia, sem ameaçar jornalismo independente.', 'Declaração da deputada após reunião com Orlando Silva sobre texto final.', 'verified', false, '2023-05-01', 'https://g1.globo.com/politica/noticia/2023/05/01/tabata-amaral-pl-fake-news.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'tabata-pl-fake-news-b120-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha desinformação sobre PIX atribuindo taxação falsa ao governo.', 'Lula quer taxar seu PIX. É mais um confisco disfarçado.', 'Vídeo viral do deputado sobre falsa taxação do PIX pela Receita Federal.', 'verified', true, '2025-01-13', 'https://www.metropoles.com/brasil/politica-br/nikolas-pix-desinformacao', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-pix-desinformacao-b120-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad desmente fake news sobre taxação do PIX e aponta ataque coordenado.', 'Não há taxação nenhuma do PIX. É desinformação organizada para atacar o governo.', 'Entrevista coletiva do ministro da Fazenda durante crise da IN 2219/2024.', 'verified', true, '2025-01-15', 'https://www1.folha.uol.com.br/mercado/2025/01/haddad-pix-fake-news.shtml', 'news_article', 1, 'Brasília', 'Coletiva sobre IN Receita', 'haddad-pix-fake-news-b120-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula revoga IN do PIX após ataque de desinformação.', 'Vamos revogar a norma para acabar com essa mentira que espalharam sobre o PIX.', 'Anúncio presidencial após escalada de fake news sobre taxação do PIX.', 'verified', true, '2025-01-15', 'https://g1.globo.com/politica/noticia/2025/01/15/lula-revoga-in-pix.ghtml', 'news_article', 1, 'Brasília', 'Pronunciamento sobre PIX', 'lula-revoga-pix-b120-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia ataques coordenados de deepfake contra parlamentares.', 'Sou alvo diário de deepfakes que usam IA para incitar ódio. Precisamos regular.', 'Denúncia da deputada no plenário da Câmara sobre ataques de IA.', 'verified', false, '2024-06-12', 'https://www.cnnbrasil.com.br/politica/erika-hilton-deepfake-ataques/', 'news_article', 2, 'Câmara dos Deputados', 'Discurso plenário', 'erika-deepfake-ataques-b120-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina bloqueio do X no Brasil após descumprimento reiterado.', 'A rede social X deverá ser suspensa em todo território nacional.', 'Decisão histórica suspendendo a plataforma por descumprir ordens judiciais sobre contas bolsonaristas.', 'verified', true, '2024-08-30', 'https://www.theverge.com/2024/8/30/24230910/x-twitter-brazil-ban-moraes', 'news_article', 3, 'STF', 'Decisão sobre bloqueio do X', 'moraes-bloqueio-x-b120-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas critica bloqueio do X e convoca adoção em massa de VPN.', 'Baixem VPN! Não vamos aceitar essa censura ditatorial do Moraes.', 'Postagem e vídeo após decisão de Moraes que bloqueou a rede X no Brasil.', 'verified', true, '2024-08-30', 'https://www.poder360.com.br/tecnologia/nikolas-vpn-bloqueio-x/', 'social_media_post', 3, 'Brasília', 'Postagem após bloqueio', 'nikolas-vpn-bloqueio-x-b120-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes aplica multa a usuários que usarem VPN para acessar X bloqueado.', 'Quem burlar a decisão via VPN poderá sofrer multa de R$ 50 mil por dia.', 'Complemento à decisão de bloqueio do X, gerando polêmica internacional.', 'verified', true, '2024-08-31', 'https://www.bloomberg.com/news/articles/2024-08-31/brazil-vpn-ban-x-moraes', 'news_article', 2, 'STF', 'Decisão complementar sobre VPN', 'moraes-multa-vpn-b120-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro vai aos EUA pedir sanções após bloqueio do X.', 'Os EUA devem aplicar a Lei Magnitsky contra Alexandre de Moraes.', 'Declaração em encontro com congressistas republicanos em Washington.', 'verified', true, '2024-09-02', 'https://restofworld.org/2024/eduardo-bolsonaro-magnitsky-moraes/', 'news_article', 5, 'Washington, EUA', 'Reunião no Congresso EUA', 'eduardo-magnitsky-moraes-b120-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso defende bloqueio do X como resposta legítima à empresa.', 'Empresa que descumpre leis brasileiras está sujeita às sanções previstas.', 'Declaração do presidente do STF em evento jurídico após bloqueio do X.', 'verified', false, '2024-09-03', 'https://g1.globo.com/politica/noticia/2024/09/03/barroso-bloqueio-x-legitimo.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Evento jurídico FGV', 'barroso-bloqueio-x-b120-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes critica operação de bloqueio generalizado de VPN.', 'A punição não pode atingir usuários que buscam informação legítima.', 'Declaração em entrevista durante discussão sobre sanções a VPN.', 'verified', false, '2024-09-04', 'https://www.jota.info/stf/gilmar-mendes-bloqueio-vpn-x', 'news_article', 1, 'Brasília', 'Entrevista Jota', 'gilmar-bloqueio-vpn-b120-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin acompanha Moraes e valida bloqueio do X em recurso da empresa.', 'A decisão foi proporcional e se pauta no descumprimento sistemático.', 'Voto em recurso da Starlink e X contra decisão de bloqueio.', 'verified', false, '2024-09-05', 'https://oglobo.globo.com/politica/zanin-stf-bloqueio-x-recurso/', 'news_article', 1, 'STF', 'Julgamento recurso X', 'zanin-bloqueio-x-b120-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas compara Brasil à Coreia do Norte após bloqueio do X.', 'Brasil virou Coreia do Norte. Bloquearam a maior rede social de debate público.', 'Declaração em entrevista a canal conservador após suspensão do X.', 'verified', false, '2024-09-05', 'https://www.metropoles.com/brasil/nikolas-brasil-coreia-do-norte-x', 'news_article', 3, 'São Paulo', 'Entrevista Jovem Pan', 'nikolas-coreia-norte-x-b120-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem propõe PDL para derrubar decisão de Moraes sobre X.', 'O Congresso precisa barrar essa perseguição a uma empresa estrangeira.', 'Apresentação de projeto de decreto legislativo durante bloqueio do X.', 'verified', false, '2024-09-06', 'https://www.cnnbrasil.com.br/politica/marcel-pdl-x-moraes/', 'news_article', 2, 'Câmara dos Deputados', 'Apresentação PDL', 'marcel-pdl-x-moraes-b120-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica decisão do STF como desproporcional.', 'Bloqueio geral do X é como explodir um prédio para prender um ladrão.', 'Entrevista do deputado sobre decisão de Moraes.', 'verified', false, '2024-09-07', 'https://www.poder360.com.br/justica/kim-bloqueio-x-desproporcional/', 'news_article', 2, 'Brasília', 'Entrevista Poder360', 'kim-bloqueio-x-b120-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura propõe CPI das decisões judiciais contra redes sociais.', 'O Congresso precisa investigar o excesso do STF sobre plataformas.', 'Proposta da deputada do Novo durante crise do X.', 'verified', false, '2024-09-10', 'https://www12.senado.leg.br/radio/adriana-ventura-cpi-redes-sociais', 'news_article', 2, 'Câmara dos Deputados', 'Proposta CPI', 'adriana-cpi-redes-b120-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende decisão do STF sobre X em nota da AGU.', 'O Brasil é um Estado de Direito e empresas estrangeiras devem respeitar nossas leis.', 'Nota oficial da AGU após decisão de Moraes bloqueando o X.', 'verified', false, '2024-08-31', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/messias-x-soberania', 'other', 1, 'Brasília', 'Nota AGU', 'messias-agu-x-b120-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann acusa X e Musk de interferir na eleição brasileira.', 'Musk virou o Bannon digital, operando para extrema-direita no Brasil.', 'Declaração da presidente do PT sobre postagens de Musk.', 'verified', false, '2024-09-08', 'https://www.pt.org.br/gleisi-musk-interferencia-eleicao/', 'other', 2, 'São Paulo', 'Executiva PT', 'gleisi-musk-interferencia-b120-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende regulação e critica ataques ao STF.', 'Regular não é censurar. É garantir que a internet não seja esgoto de ódio.', 'Discurso em plenário em defesa do PL das Fake News.', 'verified', false, '2023-05-02', 'https://g1.globo.com/politica/noticia/2023/05/02/chico-alencar-regulacao.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Discurso plenário', 'chico-regulacao-plataformas-b120-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali denuncia assédio moral online contra mulheres na política.', 'Estamos sob ataque orquestrado de bots e perfis falsos pagos para nos silenciar.', 'Pronunciamento da deputada no plenário sobre ataques em rede.', 'verified', false, '2023-08-15', 'https://www.cnnbrasil.com.br/politica/jandira-assedio-online-mulheres/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento plenário', 'jandira-assedio-online-b120-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia ameaças após deepfake sexual em redes.', 'Sou alvo de deepfake sexual. Precisamos criminalizar com urgência esse crime.', 'Denúncia da deputada após circulação de deepfake íntimo falso.', 'verified', false, '2024-02-10', 'https://www.brasildefato.com.br/2024/02/10/taliria-petrone-deepfake-denuncia', 'news_article', 1, 'Rio de Janeiro', 'Entrevista coletiva', 'taliria-deepfake-b120-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende PL das Fake News com cláusula de proteção a mulheres.', 'Redes amplificam violência política de gênero. Precisamos reagir com lei.', 'Discurso no plenário durante debate sobre PL 2630.', 'verified', false, '2023-04-28', 'https://www.psol50.org.br/noticias/samia-pl-fake-news-mulheres/', 'other', 1, 'Câmara dos Deputados', 'Discurso plenário', 'samia-pl-fake-mulheres-b120-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão defende Telegram e TikTok como plataformas "livres da censura".', 'O TikTok e o Telegram ainda são livres, mas o Moraes já mira as duas.', 'Entrevista do deputado bolsonarista sobre regulação de plataformas.', 'verified', false, '2024-04-12', 'https://www.poder360.com.br/congresso/girao-telegram-tiktok-censura/', 'news_article', 2, 'Brasília', 'Entrevista Poder360', 'girao-telegram-tiktok-b120-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende o Rumble após plataforma ameaçar deixar o Brasil.', 'O Rumble é um bastião de liberdade. O Brasil não pode perder essa plataforma.', 'Declaração da deputada após notificação do STF contra o Rumble.', 'verified', false, '2024-02-22', 'https://www.techdirt.com/2024/02/22/rumble-brazil-moraes-threat/', 'news_article', 3, 'Brasília', 'Postagem em rede social', 'bia-rumble-liberdade-b120-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes aplica sanção ao Rumble por descumprir ordens sobre bolsonarista foragido.', 'Plataforma que abriga foragido da justiça brasileira terá suas operações suspensas.', 'Decisão do ministro suspendendo o Rumble após recusar bloquear conta de Allan dos Santos.', 'verified', true, '2024-02-21', 'https://www.theverge.com/2024/2/21/24078888/rumble-brazil-ban-moraes-allan', 'news_article', 2, 'STF', 'Decisão Inquérito Milícias Digitais', 'moraes-rumble-sancao-b120-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cab, 'Carlos Bolsonaro incentiva uso do Truth Social após suspensão do X.', 'Truth Social é a nova casa da liberdade no Brasil. Baixem agora!', 'Postagens do vereador migrando seguidores para plataforma de Donald Trump.', 'verified', false, '2024-08-31', 'https://noticias.uol.com.br/politica/2024/08/31/carlos-truth-social-x-bloqueio.htm', 'social_media_post', 3, 'Rio de Janeiro', 'Postagens em rede social', 'carlos-truth-social-b120-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro posta em Gab após bloqueio do X no Brasil.', 'Migrem para o Gab. É onde a direita brasileira vai se reorganizar.', 'Postagens do deputado migrando para rede social conservadora americana.', 'verified', false, '2024-09-01', 'https://www.metropoles.com/brasil/politica-br/eduardo-gab-x-bloqueio', 'social_media_post', 3, 'Miami, EUA', 'Postagem em rede social', 'eduardo-gab-bloqueio-b120-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz parceria comercial com canal conservador e ataca imprensa.', 'A imprensa tradicional está morta. Vão para canais independentes que temos parceria.', 'Declaração do deputado em canal conservador de YouTube com patrocínio.', 'verified', false, '2024-05-18', 'https://www.poder360.com.br/midia/nikolas-parceria-canal-conservador/', 'news_article', 3, 'Belo Horizonte', 'Canal YouTube', 'nikolas-parceria-canal-b120-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro celebra retorno ao X após Musk comprar plataforma.', 'Graças a Deus e ao Musk, estamos de volta.', 'Postagem do ex-presidente após reativação de sua conta pelo Twitter em novembro de 2022.', 'verified', false, '2023-01-02', 'https://g1.globo.com/politica/noticia/2023/01/02/bolsonaro-twitter-musk.ghtml', 'social_media_post', 1, 'Orlando, EUA', 'Postagem em rede social', 'bolsonaro-twitter-musk-b120-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes ordena quebra de sigilo de contas bolsonaristas no X em inquérito.', 'Os dados de contas utilizadas para atos antidemocráticos devem ser fornecidos à justiça.', 'Decisão do ministro em inquérito relativo a ataques ao 8 de janeiro.', 'verified', false, '2023-04-10', 'https://www.conjur.com.br/2023-abr-10/moraes-quebra-sigilo-contas-x/', 'news_article', 2, 'STF', 'Inquérito 8 de janeiro', 'moraes-quebra-sigilo-b120-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica desregulação extrema do X sob Musk.', 'A rede virou terra de ninguém com o Musk. É hora de regular.', 'Entrevista coletiva do presidente sobre redes sociais.', 'verified', false, '2023-06-20', 'https://www1.folha.uol.com.br/poder/2023/06/lula-musk-regulacao-redes.shtml', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'lula-musk-regulacao-b120-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende taxação das big techs como prioridade do governo.', 'Vamos taxar lucros das plataformas digitais como qualquer empresa no país.', 'Declaração em evento econômico sobre reforma tributária.', 'verified', false, '2023-09-12', 'https://www.reuters.com/markets/haddad-big-techs-tax-brazil-2023-09-12/', 'news_article', 1, 'São Paulo', 'Evento LIDE', 'haddad-tax-big-techs-b120-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta sinaliza retomada do PL das Fake News em nova versão.', 'Vamos buscar um meio-termo que regule plataformas sem censura.', 'Entrevista do presidente da Câmara sobre agenda digital em 2025.', 'verified', false, '2025-03-18', 'https://g1.globo.com/politica/noticia/2025/03/18/motta-pl-fake-news-retomada.ghtml', 'news_article', 1, 'Brasília', 'Coletiva presidência Câmara', 'motta-pl-fake-news-retomada-b120-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Davi Alcolumbre promete priorizar marco legal da IA no Senado.', 'O marco da IA é essencial para proteger direitos na era das deepfakes.', 'Discurso de posse na presidência do Senado em 2025.', 'verified', false, '2025-02-01', 'https://www12.senado.leg.br/noticias/materias/2025/02/01/alcolumbre-marco-ia', 'other', 1, 'Senado Federal', 'Posse presidência Senado', 'alcolumbre-marco-ia-b120-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral alerta para uso de IA em fraudes eleitorais em 2024.', 'Vamos enfrentar a primeira eleição com uso massivo de IA generativa.', 'Entrevista da deputada sobre campanha municipal de 2024.', 'verified', false, '2024-07-08', 'https://www.cnnbrasil.com.br/politica/tabata-ia-eleicoes-2024/', 'news_article', 1, 'São Paulo', 'Entrevista CNN', 'tabata-ia-eleicoes-b120-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha deepfake de Lula com fala falsa.', 'Vejam o que o Lula disse! Compartilhem antes que apaguem.', 'Postagem com deepfake claro de Lula dizendo frase inventada, alvo de ação no TSE.', 'verified', true, '2024-09-22', 'https://www.bbc.com/portuguese/articles/c72nk85xkw2o', 'news_article', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-deepfake-lula-b120-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes aplica multa a Nikolas por deepfake contra Lula.', 'Uso doloso de deepfake para desinformar é crime eleitoral.', 'Decisão do ministro no TSE sobre deepfake postado por Nikolas Ferreira.', 'verified', true, '2024-09-24', 'https://g1.globo.com/politica/noticia/2024/09/24/moraes-multa-nikolas-deepfake-lula.ghtml', 'news_article', 2, 'TSE', 'Decisão eleitoral', 'moraes-multa-nikolas-deepfake-b120-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia aprova resolução do TSE sobre IA nas eleições.', 'Não permitiremos que a inteligência artificial seja usada para fraudar a democracia.', 'Discurso da presidente do TSE ao aprovar resolução sobre IA eleitoral.', 'verified', true, '2024-02-27', 'https://www.conjur.com.br/2024-fev-27/carmen-lucia-tse-ia/', 'news_article', 1, 'TSE', 'Sessão plenária TSE', 'carmen-tse-ia-b120-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin propõe que TSE fiscalize IA generativa em campanhas.', 'A Justiça Eleitoral precisa de instrumentos para combater deepfakes.', 'Voto do ministro em resolução sobre IA durante as eleições municipais.', 'verified', false, '2024-02-27', 'https://www.jota.info/eleicoes/fachin-tse-ia-deepfake', 'news_article', 1, 'TSE', 'Resolução IA eleitoral', 'fachin-tse-ia-deepfake-b120-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_num, 'Nunes Marques diverge e defende autorregulação de plataformas.', 'A autorregulação pelas plataformas deve ser valorizada, sem ingerência estatal.', 'Voto vencido em julgamento sobre Marco Civil no STF.', 'verified', false, '2024-12-06', 'https://www.conjur.com.br/2024-dez-06/nunes-marques-autorregulacao-plataformas/', 'news_article', 2, 'STF', 'Julgamento Marco Civil', 'nunes-marques-autorregulacao-b120-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_men, 'André Mendonça vota contra responsabilização ampla de plataformas.', 'A responsabilização sem ordem judicial pode cercear a liberdade de expressão.', 'Voto do ministro em julgamento do Marco Civil.', 'verified', false, '2024-12-05', 'https://g1.globo.com/politica/noticia/2024/12/05/mendonca-voto-marco-civil.ghtml', 'news_article', 2, 'STF', 'Julgamento Marco Civil', 'mendonca-marco-civil-b120-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso vota por responsabilização das plataformas por conteúdo antidemocrático.', 'A liberdade de expressão não se confunde com liberdade de agredir a democracia.', 'Voto do presidente do STF no julgamento do Marco Civil em dezembro de 2024.', 'verified', true, '2024-12-11', 'https://www1.folha.uol.com.br/poder/2024/12/stf-marco-civil-barroso.shtml', 'news_article', 1, 'STF', 'Julgamento Marco Civil', 'barroso-marco-civil-b120-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin propõe critérios de moderação com dever de cuidado.', 'Plataformas devem ter dever de cuidado sobre conteúdos ilícitos.', 'Voto do ministro fixando tese no Tema 987 de repercussão geral.', 'verified', false, '2024-12-06', 'https://www.conjur.com.br/2024-dez-06/zanin-dever-cuidado-plataformas/', 'news_article', 1, 'STF', 'Julgamento Marco Civil', 'zanin-dever-cuidado-b120-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino como ministro do STF vota por regulação ampla de redes.', 'As redes sociais não são mais espaço neutro. Precisam responder pelo que impulsionam.', 'Primeiro voto do ministro Dino em julgamento sobre responsabilização de plataformas.', 'verified', true, '2024-12-11', 'https://oglobo.globo.com/politica/flavio-dino-stf-redes-sociais-voto/', 'news_article', 1, 'STF', 'Julgamento Marco Civil', 'dino-stf-redes-voto-b120-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski como ministro da Justiça cria GT sobre regulação digital.', 'Vamos trazer a sociedade civil para construir uma regulação equilibrada.', 'Anúncio do ministro da Justiça sobre grupo de trabalho sobre plataformas.', 'verified', false, '2024-04-15', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-gt-plataformas', 'other', 1, 'Brasília', 'Posse do ministro', 'lewandowski-gt-plataformas-b120-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha defende que SUS enfrente desinformação em saúde.', 'Vidas são perdidas por causa de fake news sobre vacinas. Não podemos tolerar.', 'Declaração do ministro na abertura de campanha de imunização.', 'verified', false, '2025-04-20', 'https://www.gov.br/saude/pt-br/assuntos/noticias/padilha-desinformacao-vacinas', 'other', 1, 'Brasília', 'Campanha de vacinação', 'padilha-desinformacao-vacinas-b120-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia observatório de desinformação no governo federal.', 'Teremos monitoramento integrado contra desinformação que afeta políticas públicas.', 'Anúncio do ministro da Casa Civil sobre nova estrutura em 2025.', 'verified', false, '2025-06-10', 'https://www.gov.br/casacivil/pt-br/noticias/rui-costa-observatorio-desinformacao', 'other', 1, 'Brasília', 'Evento Casa Civil', 'rui-costa-observatorio-b120-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas classifica observatório governamental como "ministério da verdade".', 'Lula cria o Ministério da Verdade para caçar opositores digitais.', 'Postagem do deputado atacando o novo observatório federal de desinformação.', 'verified', false, '2025-06-11', 'https://www.poder360.com.br/congresso/nikolas-observatorio-ministerio-verdade/', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'nikolas-ministerio-verdade-b120-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis participa de evento da Heritage Foundation contra "censura digital" no Brasil.', 'O Brasil se tornou laboratório global de censura digital sob o STF.', 'Fala da deputada em evento conservador nos Estados Unidos.', 'verified', false, '2024-10-15', 'https://www.heritage.org/events/bia-kicis-brazil-censorship', 'news_article', 3, 'Washington, EUA', 'Evento Heritage Foundation', 'bia-heritage-censura-b120-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede intervenção de Trump contra Moraes em 2025.', 'Com Trump, EUA vão sancionar Moraes e libertar redes sociais brasileiras.', 'Declaração após posse de Trump prevendo pressão americana sobre STF.', 'verified', true, '2025-01-22', 'https://restofworld.org/2025/eduardo-bolsonaro-trump-moraes/', 'news_article', 5, 'Washington, EUA', 'CPAC pós-posse Trump', 'eduardo-trump-moraes-b120-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro articula frente no Senado contra decisões do STF.', 'O Senado precisa reagir ao avanço do STF sobre a liberdade de expressão.', 'Declaração em reunião da bancada do PL no Senado.', 'verified', false, '2024-04-12', 'https://www12.senado.leg.br/noticias/flavio-frente-stf-liberdade', 'news_article', 3, 'Senado Federal', 'Reunião bancada PL', 'flavio-frente-stf-b120-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli espalha fake news sobre urnas antes das eleições de 2024.', 'As urnas podem ser hackeadas novamente. Exijam voto impresso.', 'Declaração da deputada antes das eleições municipais de 2024.', 'verified', true, '2024-09-15', 'https://g1.globo.com/politica/noticia/2024/09/15/zambelli-urnas-2024-fake-news.ghtml', 'news_article', 4, 'São Paulo', 'Entrevista Jovem Pan', 'zambelli-urnas-2024-b120-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem usa dados da Abin para atacar jornalistas da Folha.', 'Esses jornalistas são militantes disfarçados. Vocês vão ver com quem estão lidando.', 'Declaração do deputado após reportagens da Folha sobre Abin paralela.', 'verified', false, '2024-01-30', 'https://www1.folha.uol.com.br/poder/2024/01/ramagem-ataca-jornalistas-abin.shtml', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'ramagem-ataca-jornalistas-b120-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão compara Moraes a Xi Jinping após bloqueio do X.', 'Moraes está construindo o Grande Firewall do Brasil.', 'Postagem do deputado bolsonarista após bloqueio do X em agosto de 2024.', 'verified', false, '2024-08-31', 'https://www.metropoles.com/brasil/politica-br/girao-moraes-xi-jinping', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'girao-moraes-firewall-b120-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina retirada de conteúdo antidemocrático do TikTok.', 'Plataformas devem retirar imediatamente conteúdos que atentem contra a democracia.', 'Decisão do ministro mirando conteúdos bolsonaristas no TikTok.', 'verified', false, '2024-06-05', 'https://www.theverge.com/2024/6/5/24172222/tiktok-brazil-moraes-content', 'news_article', 2, 'STF', 'Inquérito Milícias Digitais', 'moraes-tiktok-conteudo-b120-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica regulação do TikTok e cita exemplo dos EUA.', 'O Brasil deve seguir a linha dos EUA e exigir transparência, não censura.', 'Discurso do deputado sobre regulação do TikTok no Brasil.', 'verified', false, '2024-07-20', 'https://www.cnnbrasil.com.br/politica/kim-tiktok-regulacao/', 'news_article', 2, 'Câmara dos Deputados', 'Debate regulação TikTok', 'kim-tiktok-regulacao-b120-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende taxação das plataformas para financiar jornalismo.', 'Precisamos remunerar conteúdo jornalístico que sustenta plataformas digitais.', 'Declaração do relator do PL 2630 sobre remuneração a veículos de imprensa.', 'verified', false, '2023-05-30', 'https://www.jota.info/legislativo/orlando-silva-remuneracao-jornalismo', 'news_article', 1, 'Brasília', 'Audiência pública', 'orlando-remuneracao-jornalismo-b120-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro reativa canais bolsonaristas em tour nos EUA e ataca STF via X.', 'Estamos voltando para a luta. Moraes não vai calar a direita brasileira.', 'Postagens do ex-presidente em tour americano após inelegibilidade.', 'verified', false, '2023-07-05', 'https://www.cnnbrasil.com.br/politica/bolsonaro-eua-ataca-stf/', 'social_media_post', 4, 'Miami, EUA', 'Postagens em rede social', 'bolsonaro-eua-ataca-stf-b120-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem classifica Marco Civil como "Marco da Censura".', 'O STF transformou o Marco Civil em Marco da Censura. É inaceitável.', 'Declaração do líder do Novo após julgamento do STF.', 'verified', false, '2024-12-12', 'https://www.poder360.com.br/congresso/marcel-marco-civil-censura/', 'news_article', 2, 'Câmara dos Deputados', 'Coletiva após julgamento', 'marcel-marco-censura-b120-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende modelo europeu DSA como alternativa.', 'Podemos inspirar em modelos como o DSA europeu, com transparência sem censura.', 'Debate da deputada do Novo sobre regulação de plataformas.', 'verified', false, '2023-08-03', 'https://www.jota.info/tecnologia/adriana-ventura-dsa-modelo', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública regulação', 'adriana-dsa-modelo-b120-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata articula PL sobre violência política de gênero online.', 'Precisamos responsabilizar quem impulsiona ataques coordenados contra mulheres.', 'Apresentação de projeto de lei da deputada em 2023.', 'verified', false, '2023-11-22', 'https://g1.globo.com/politica/noticia/2023/11/22/tabata-pl-violencia-politica-online.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação de PL', 'tabata-pl-violencia-genero-b120-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erI, 'Erika Hilton denuncia ataques transfóbicos organizados no X.', 'As redes viraram aparelho da extrema-direita para ataques transfóbicos.', 'Discurso da deputada no plenário sobre ataques em redes sociais.', 'verified', false, '2024-03-15', 'https://www.brasildefato.com.br/2024/03/15/erika-hilton-ataques-redes', 'news_article', 2, 'Câmara dos Deputados', 'Discurso plenário', 'erika-ataques-transfobicos-b120-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi defende responsabilização do X por interferência eleitoral.', 'O X virou arma política. Precisa responder pelo que impulsiona.', 'Declaração da presidente do PT durante campanha eleitoral de 2024.', 'verified', false, '2024-09-25', 'https://www.pt.org.br/gleisi-x-interferencia-eleitoral/', 'other', 1, 'São Paulo', 'Executiva PT', 'gleisi-x-interferencia-b120-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende regulação das big techs no G20.', 'O G20 precisa avançar na regulação global das plataformas digitais.', 'Discurso do presidente na cúpula do G20 no Rio de Janeiro.', 'verified', true, '2024-11-18', 'https://www.reuters.com/world/americas/lula-g20-big-techs-2024-11-18/', 'news_article', 1, 'Rio de Janeiro', 'Cúpula do G20', 'lula-g20-big-techs-b120-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes libera X no Brasil após cumprimento de exigências judiciais.', 'Cumpridas as determinações, a plataforma poderá voltar a operar no país.', 'Decisão do ministro liberando o X após 40 dias de bloqueio.', 'verified', true, '2024-10-08', 'https://www.bloomberg.com/news/articles/2024-10-08/brazil-x-unblocked-moraes-musk', 'news_article', 2, 'STF', 'Decisão de desbloqueio do X', 'moraes-libera-x-b120-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas celebra volta do X e ataca STF.', 'Voltamos! Agora é luta contra a ditadura togada que nos tirou do ar.', 'Postagem do deputado logo após o desbloqueio do X.', 'verified', false, '2024-10-08', 'https://noticias.uol.com.br/politica/2024/10/08/nikolas-volta-x-stf.htm', 'social_media_post', 3, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-volta-x-b120-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro sugere CPI do STF por censura digital.', 'Precisamos de CPI para investigar o excesso do STF sobre a liberdade digital.', 'Proposta do senador durante debate no Senado em 2024.', 'verified', false, '2024-09-12', 'https://www12.senado.leg.br/noticias/flavio-cpi-stf-censura', 'news_article', 3, 'Senado Federal', 'Requerimento de CPI', 'flavio-cpi-stf-b120-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que plataformas americanas "ignorem" decisões do STF.', 'As plataformas americanas não deveriam se curvar ao STF brasileiro.', 'Declaração em live ao vivo com aliados bolsonaristas após bloqueio do X.', 'verified', true, '2024-09-05', 'https://www1.folha.uol.com.br/poder/2024/09/bolsonaro-plataformas-ignorem-stf.shtml', 'news_article', 5, 'Brasília', 'Live em rede social', 'bolsonaro-plataformas-ignorem-b120-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro propõe Musk como "embaixador informal" dos EUA no Brasil.', 'Elon Musk poderia ser ponte entre o governo Trump e a direita brasileira.', 'Declaração em programa de podcast conservador americano.', 'verified', false, '2025-02-10', 'https://restofworld.org/2025/eduardo-musk-embaixador-brasil/', 'news_article', 3, 'Washington, EUA', 'Podcast conservador', 'eduardo-musk-embaixador-b120-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cab, 'Carlos Bolsonaro posta ameaças contra jornalistas do UOL.', 'Vocês vão pagar caro por cada ataque à minha família.', 'Postagens do vereador atacando jornalistas após reportagem sobre funcionários fantasmas.', 'verified', false, '2023-06-18', 'https://noticias.uol.com.br/politica/2023/06/18/carlos-bolsonaro-ameaca-jornalistas.htm', 'social_media_post', 4, 'Rio de Janeiro', 'Postagens em rede social', 'carlos-ameaca-jornalistas-b120-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ameaça jornalistas após reportagem sobre Abin spyware.', 'Essa jornalista da Folha é mentirosa e vai responder por calúnia.', 'Declaração da deputada após reportagem sobre espionagem com FirstMile.', 'verified', false, '2024-01-27', 'https://www1.folha.uol.com.br/poder/2024/01/zambelli-ameaca-jornalistas.shtml', 'news_article', 4, 'São Paulo', 'Entrevista a canal aliado', 'zambelli-ameaca-jornalistas-b120-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem tenta barrar diligências da PF via deputado federal.', 'A PF está fazendo perseguição política sob ordens do STF.', 'Declaração do ex-diretor da Abin após operações contra aliados.', 'verified', false, '2024-02-05', 'https://g1.globo.com/politica/noticia/2024/02/05/ramagem-pf-perseguicao-abin.ghtml', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'ramagem-pf-perseguicao-b120-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lidera campanha #ForaMoraes no X com ataques coordenados.', 'Fora Moraes! A hashtag vai virar o Brasil de ponta-cabeça.', 'Campanha do deputado bolsonarista contra o ministro do STF em 2024.', 'verified', true, '2024-04-15', 'https://www.cnnbrasil.com.br/politica/nikolas-fora-moraes-campanha/', 'social_media_post', 4, 'Brasília', 'Campanha em rede social', 'nikolas-fora-moraes-b120-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes abre investigação sobre lives de Bolsonaro e fake news eleitorais.', 'Lives que atacam a democracia e o TSE serão objeto de investigação.', 'Decisão do ministro autorizando inquérito sobre lives bolsonaristas.', 'verified', false, '2023-05-18', 'https://oglobo.globo.com/politica/moraes-investiga-lives-bolsonaro/', 'news_article', 2, 'STF', 'Inquérito Fake News', 'moraes-lives-bolsonaro-b120-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino, como ministro da Justiça, cria Operação PIX contra fake news.', 'Desinformação organizada sobre políticas públicas é crime contra a sociedade.', 'Coletiva do ministro apresentando investigação sobre fake news do PIX.', 'verified', true, '2024-02-20', 'https://www.gov.br/mj/pt-br/assuntos/noticias/dino-operacao-pix-fake-news', 'other', 1, 'Brasília', 'Coletiva MJSP', 'dino-operacao-pix-b120-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão compara PL 2630 a lei da Alemanha Oriental.', 'O PL das Fake News é uma Stasi brasileira. Vamos derrubar.', 'Discurso do deputado em plenário contra o PL 2630.', 'verified', false, '2023-05-02', 'https://www.poder360.com.br/congresso/girao-pl-fake-news-stasi/', 'news_article', 3, 'Câmara dos Deputados', 'Discurso plenário', 'girao-stasi-pl-b120-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva admite que PL 2630 não será votado antes das eleições de 2024.', 'O ambiente do Congresso não permite a votação do texto neste momento.', 'Declaração do relator em evento de mídia sobre fim da tentativa de votação.', 'verified', false, '2024-05-10', 'https://www.jota.info/legislativo/orlando-silva-pl-2630-adiado', 'news_article', 1, 'Brasília', 'Evento Abraji', 'orlando-pl-2630-adiado-b120-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Messias defende na AGU marco regulatório para plataformas.', 'A ausência de lei cria vácuo que só aumenta a judicialização.', 'Declaração do AGU em evento jurídico sobre regulação digital.', 'verified', false, '2024-06-22', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/messias-marco-plataformas', 'other', 1, 'Brasília', 'Evento jurídico AGU', 'messias-marco-plataformas-b120-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende regulação robusta após 8 de janeiro.', 'O 8 de janeiro começou nas redes. Regular é proteger a democracia.', 'Discurso do deputado no aniversário dos atos antidemocráticos.', 'verified', false, '2024-01-08', 'https://www.brasildefato.com.br/2024/01/08/chico-alencar-8-janeiro-redes', 'news_article', 1, 'Câmara dos Deputados', 'Sessão 8 de janeiro', 'chico-alencar-8j-redes-b120-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas defende Musk em audiência pública sobre redes sociais.', 'Elon Musk salvou a liberdade no Twitter. Deveria ser homenageado pelo Brasil.', 'Declaração do deputado em audiência pública sobre plataformas na Câmara.', 'verified', false, '2023-05-10', 'https://www.cnnbrasil.com.br/politica/nikolas-musk-audiencia-publica/', 'news_article', 2, 'Câmara dos Deputados', 'Audiência pública plataformas', 'nikolas-musk-audiencia-b120-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes sanciona deputados por ataques coordenados em rede social.', 'Ataques coordenados por parlamentares contra o STF serão punidos conforme a lei.', 'Decisão do ministro aplicando multas a parlamentares por desinformação sobre o STF.', 'verified', true, '2024-05-22', 'https://www1.folha.uol.com.br/poder/2024/05/moraes-multa-deputados-x.shtml', 'news_article', 2, 'STF', 'Inquérito Milícias Digitais', 'moraes-multa-deputados-b120-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

END $$;
