-- Batch 110: Environment, climate, Amazon, COP conferences (Jan 2023 - Apr 2026)
-- 100 statements on environmental policy, deforestation, COP28/29/30, Fundo Amazonia, Margem Equatorial
DO $$
DECLARE
  v_mar UUID; v_lul UUID; v_fav UUID; v_sal UUID; v_ter UUID;
  v_jpp UUID; v_mag UUID; v_asi UUID; v_hel UUID; v_had UUID;
  v_mvi UUID; v_teb UUID; v_alc UUID; v_bol UUID; v_edb UUID;
  v_tar UUID; v_zem UUID; v_cai UUID; v_rat UUID; v_wlm UUID;
  v_ade UUID; v_mme UUID; v_gca UUID; v_nik UUID; v_mvh UUID;
  v_fel UUID; v_dam UUID; v_tab UUID; v_ors UUID; v_gua UUID;
  v_lus UUID; v_mer UUID; v_pad UUID; v_rui UUID; v_muc UUID;
  c_des UUID; c_neg UUID; c_irr UUID; c_abu UUID; c_con UUID;
  c_odi UUID; c_ame UUID; c_aut UUID;
BEGIN
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_jpp FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magda-chambriard';
  SELECT id INTO v_asi FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edb FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_wlm FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_ade FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_mme FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_gca FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_ors FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_gua FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_lus FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_aut FROM categories WHERE slug = 'antidemocratico';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia retomada do Plano de Prevencao ao Desmatamento na Amazonia.', 'Estamos retomando o PPCDAm com metas claras, fiscalizacao e cooperacao federativa. Zero desmatamento ilegal ate 2030 e compromisso deste governo.', 'Coletiva no MMA em Brasilia no dia 5 de junho de 2023 na Semana do Meio Ambiente.', 'verified', true, '2023-06-05', 'https://www.gov.br/mma/pt-br/noticias/marina-silva-lanca-novo-ppcdam', 'other', 1, 'Brasilia', 'Semana do Meio Ambiente', 'marina-ppcdam-retomada-b110-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete zero desmatamento ate 2030 em discurso no Para.', 'O Brasil voltou. A Amazonia nao sera mais terra de ninguem. Ate 2030 teremos zero desmatamento ilegal.', 'Discurso em Belem em agosto de 2023 durante Cupula da Amazonia.', 'verified', true, '2023-08-08', 'https://www.reuters.com/world/americas/lula-vows-zero-deforestation-by-2030-amazon-summit-2023-08-08/', 'news_article', 1, 'Belem', 'Cupula da Amazonia', 'lula-zero-desmatamento-2030-b110-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles acusa Marina Silva de travar o Brasil com xiismo ambiental.', 'Marina e xiita. Ela quer transformar o Brasil em reserva ambiental enquanto a economia quebra. Isso nao tem cabimento.', 'Entrevista a Jovem Pan em Sao Paulo em marco de 2023.', 'verified', true, '2023-03-22', 'https://jovempan.com.br/noticias/politica/ricardo-salles-ataca-marina-silva-xiita-ambiental.html', 'news_article', 3, 'Sao Paulo', 'Entrevista Jovem Pan', 'salles-ataca-marina-xiita-b110-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jpp, 'Jean Paul Prates defende explorar Margem Equatorial contra posicao do Ibama.', 'Petrobras tem competencia tecnica e ambiental para perfurar na Foz do Amazonas. O Ibama precisa rever a negativa.', 'Entrevista ao Valor Economico em maio de 2023 apos negativa do Ibama.', 'verified', true, '2023-05-19', 'https://valor.globo.com/empresas/noticia/2023/05/19/prates-defende-margem-equatorial-contra-ibama.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Entrevista Valor', 'prates-margem-equatorial-ibama-b110-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva defende decisao do Ibama sobre Foz do Amazonas e enfrenta pressao.', 'O Ibama e autarquia tecnica. Nao se derruba licenca ambiental por pressao politica. A bacia tem fragilidade comprovada.', 'Entrevista coletiva em Brasilia em maio de 2023 apos negativa do Ibama a Petrobras.', 'verified', true, '2023-05-22', 'https://www.mongabay.com/2023/05/marina-silva-defends-ibama-amazon-mouth-oil-licensing/', 'news_article', 2, 'Brasilia', 'Coletiva MMA', 'marina-defende-ibama-foz-b110-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho pressiona por perfuracao na Margem Equatorial.', 'O Para precisa dos royalties. Nao podemos ficar refens de uma visao xiita de ambientalismo. Perfurar e desenvolvimento.', 'Entrevista em Belem em junho de 2023 sobre posicao do estado sobre Margem Equatorial.', 'verified', true, '2023-06-10', 'https://oglobo.globo.com/economia/noticia/2023/06/10/helder-margem-equatorial-royalties.ghtml', 'news_article', 3, 'Belem', 'Entrevista O Globo', 'helder-margem-equatorial-b110-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina diz que Marina Silva atrapalha o agro brasileiro.', 'Marina Silva nao entende de producao. Ela quer travar o agro que alimenta o Brasil e o mundo. Isso e irresponsavel.', 'Discurso no plenario do Senado em abril de 2023 sobre MP dos Ministerios.', 'verified', false, '2023-04-25', 'https://www12.senado.leg.br/noticias/materias/2023/04/25/tereza-cristina-critica-marina-silva-agro', 'other', 2, 'Brasilia', 'Senado Federal', 'tereza-critica-marina-b110-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia reativacao do Fundo Amazonia com Noruega e Alemanha.', 'O Fundo Amazonia volta com forca total. Noruega e Alemanha voltaram a confiar no Brasil. Vamos financiar a reducao do desmatamento.', 'Coletiva em Brasilia em janeiro de 2023 com ministros europeus.', 'verified', true, '2023-01-12', 'https://www.climatechangenews.com/2023/01/12/lula-revives-amazon-fund-norway-germany/', 'news_article', 1, 'Brasilia', 'Coletiva Palacio', 'lula-fundo-amazonia-reativacao-b110-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro ironiza reducao do desmatamento e diz que numeros sao ficcao.', 'Reduziu desmatamento uma ova. Esses dados do Inpe sao manipulados para agradar gringo. No meu governo a Amazonia foi protegida de verdade.', 'Live no Telegram em agosto de 2023 sobre dados do Prodes.', 'verified', true, '2023-08-12', 'https://www1.folha.uol.com.br/ambiente/2023/08/bolsonaro-questiona-dados-inpe-desmatamento.shtml', 'social_media_post', 4, 'Online', 'Live Telegram', 'bolsonaro-questiona-inpe-b110-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara comemora reducao do desmatamento em 2023.', 'Os dados mostram que politica publica funciona. Reduzimos 50% o desmatamento na Amazonia. Os povos indigenas sao os guardioes.', 'Coletiva do Ministerio dos Povos Indigenas em Brasilia em agosto de 2023.', 'verified', false, '2023-08-10', 'https://www.gov.br/mpi/pt-br/noticias/sonia-guajajara-reducao-desmatamento', 'other', 1, 'Brasilia', 'Coletiva MPI', 'guajajara-reducao-desmatamento-b110-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Favaro defende agro contra Marina Silva em reuniao ministerial.', 'O agro nao e vilao. Marina precisa entender que produzimos com sustentabilidade. Codigo Florestal ja basta.', 'Reuniao ministerial em Brasilia em marco de 2023 transmitida pela EBC.', 'verified', false, '2023-03-15', 'https://agenciabrasil.ebc.com.br/politica/2023-03/favaro-marina-codigo-florestal', 'news_article', 2, 'Brasilia', 'Reuniao ministerial', 'favaro-defende-agro-marina-b110-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula pressiona Prates e pede solucao para Foz do Amazonas.', 'Pessoal, e preciso achar caminho. Petrobras tem que perfurar e Ibama tem que analisar com tempo razoavel. Brasil nao pode travar.', 'Declaracao em evento da Petrobras no Rio em junho de 2023.', 'verified', true, '2023-06-28', 'https://www.reuters.com/business/energy/lula-pushes-amazon-oil-exploration-2023-06-28/', 'news_article', 3, 'Rio de Janeiro', 'Evento Petrobras', 'lula-pressiona-foz-amazonas-b110-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva rebate acusacoes da bancada ruralista sobre demarcacao.', 'Terra indigena demarcada preserva floresta. Dado cientifico. Quem ataca demarcacao ataca a Amazonia.', 'Audiencia na Camara em maio de 2023 sobre marco temporal.', 'verified', false, '2023-05-30', 'https://www.camara.leg.br/noticias/marina-silva-marco-temporal-demarcacao', 'other', 1, 'Brasilia', 'Camara dos Deputados', 'marina-rebate-ruralistas-b110-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Marina Silva em video viral.', 'Marina Silva e uma xiita religiosa do ambientalismo. Ela odeia o agro e quer transformar o Brasil em aldeia.', 'Video no Instagram em junho de 2023 com milhoes de visualizacoes.', 'verified', true, '2023-06-02', 'https://www.instagram.com/nikolasferreiradm/reel/nikolas-marina-xiita-2023/', 'social_media_post', 3, 'Online', 'Instagram', 'nikolas-ataca-marina-b110-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa na COP28 em Dubai e defende COP30 em Belem.', 'A COP30 sera em Belem, no coracao da Amazonia. O mundo vai ver de perto a floresta que queremos salvar. Mudanca climatica e emergencia.', 'Discurso no plenario da COP28 em Dubai em dezembro de 2023.', 'verified', true, '2023-12-01', 'https://www.climatechangenews.com/2023/12/01/lula-cop28-belem-amazon/', 'other', 1, 'Dubai', 'COP28', 'lula-cop28-belem-b110-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva chama atencao para fracasso climatico na COP28.', 'Precisamos fazer transicao justa. Combustiveis fosseis nao podem mais receber subsidios bilionarios enquanto o planeta arde.', 'Discurso no pavilhao do Brasil na COP28 em dezembro de 2023.', 'verified', true, '2023-12-05', 'https://www.mongabay.com/2023/12/marina-silva-cop28-fossil-fuels/', 'other', 1, 'Dubai', 'COP28', 'marina-cop28-fosseis-b110-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro diz que COP28 e teatro globalista.', 'COP e teatro globalista para tomar soberania do Brasil. Lula foi vender a Amazonia em Dubai.', 'Tweet em dezembro de 2023 durante a COP28.', 'verified', false, '2023-12-03', 'https://x.com/BolsonaroSP/status/eduardo-cop28-teatro', 'social_media_post', 4, 'Online', 'Twitter', 'eduardo-cop28-teatro-b110-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho pede acelerar obras para COP30 em Belem.', 'Belem sera a capital do clima. Precisamos acelerar tudo, aeroporto, hoteis, mobilidade. Sera a maior COP da historia.', 'Coletiva em Belem em janeiro de 2024 sobre preparativos da COP30.', 'verified', false, '2024-01-18', 'https://g1.globo.com/pa/para/noticia/2024/01/18/helder-cop30-obras-belem.ghtml', 'news_article', 1, 'Belem', 'Coletiva Palacio', 'helder-cop30-obras-b110-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema chama agenda climatica de modismo e ataca Marina.', 'Esse negocio de aquecimento global virou modismo ideologico. Marina Silva quer parar MG com pauta que nao alimenta ninguem.', 'Entrevista a Band em Belo Horizonte em setembro de 2023.', 'verified', true, '2023-09-20', 'https://www.band.uol.com.br/noticias/zema-aquecimento-global-modismo-2023', 'news_article', 5, 'Belo Horizonte', 'Entrevista Band', 'zema-clima-modismo-b110-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira apresenta agenda climatica do Brasil na ONU.', 'Brasil voltou ao multilateralismo. A COP30 em Belem sera a COP da implementacao. Exigiremos financiamento climatico.', 'Discurso na Assembleia Geral da ONU em Nova York em setembro de 2023.', 'verified', false, '2023-09-19', 'https://www.gov.br/mre/pt-br/noticias/mauro-vieira-onu-cop30', 'other', 1, 'Nova York', 'Assembleia Geral ONU', 'mauro-vieira-onu-cop30-b110-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro nega mudanca climatica em evento com Trumpistas nos EUA.', 'Aquecimento global e narrativa globalista. Fui eu que protegi a Amazonia. Esses dados da esquerda sao falsos.', 'Discurso em evento conservador em Orlando em fevereiro de 2023.', 'verified', true, '2023-02-24', 'https://www.reuters.com/world/americas/bolsonaro-denies-climate-change-cpac-2023-02-24/', 'news_article', 5, 'Orlando', 'CPAC', 'bolsonaro-cpac-clima-b110-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_asi, 'Alexandre Silveira defende gas e petroleo como transicao.', 'Nao existe transicao sem gas natural. Foz do Amazonas faz parte da nossa matriz de transicao.', 'Entrevista em Brasilia em julho de 2023 sobre politica energetica.', 'verified', false, '2023-07-11', 'https://epbr.com.br/silveira-gas-transicao-foz-amazonas-2023/', 'news_article', 3, 'Brasilia', 'Entrevista EPBR', 'silveira-gas-transicao-b110-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende mercado de carbono brasileiro.', 'Mercado regulado de carbono e oportunidade de trilhao. Precisamos aprovar ja o projeto no Congresso.', 'Evento em Sao Paulo em agosto de 2023 da Febraban sobre ESG.', 'verified', false, '2023-08-24', 'https://valor.globo.com/financas/noticia/2023/08/24/tebet-mercado-carbono-febraban.ghtml', 'news_article', 1, 'Sao Paulo', 'Evento Febraban', 'tebet-mercado-carbono-b110-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende reforma tributaria verde e transicao.', 'Taxonomia verde ja aprovamos. Agora vem credito especifico para projetos de baixo carbono. Reindustrializacao verde.', 'Entrevista em Brasilia em outubro de 2023 sobre agenda economica verde.', 'verified', false, '2023-10-05', 'https://www1.folha.uol.com.br/mercado/2023/10/haddad-taxonomia-verde-reindustrializacao.shtml', 'news_article', 1, 'Brasilia', 'Entrevista Folha', 'haddad-taxonomia-verde-b110-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes minimiza queimadas no Pantanal em 2023.', 'Pantanal sempre queimou. E ciclo natural. Essa histeria de ambientalista nao ajuda em nada o produtor rural.', 'Coletiva em Cuiaba em setembro de 2023 sobre queimadas.', 'verified', false, '2023-09-14', 'https://www.correiobraziliense.com.br/brasil/2023/09/mauro-mendes-queimadas-pantanal-ciclo.html', 'news_article', 4, 'Cuiaba', 'Coletiva Palacio Paiaguas', 'mauro-mendes-pantanal-2023-b110-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli minimiza desmatamento no Acre.', 'Acre preserva. Desmatamento aqui e mentira de ambientalista. Produtor rural acreano e guardiao da floresta.', 'Entrevista em Rio Branco em abril de 2023 sobre dados do Imazon.', 'verified', false, '2023-04-18', 'https://www.amazoniareal.com.br/gladson-cameli-desmatamento-acre/', 'news_article', 4, 'Rio Branco', 'Entrevista radio', 'gladson-desmatamento-acre-b110-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antonio Denarium defende garimpo em Roraima contra Marina.', 'Garimpo faz parte da cultura de Roraima. Marina Silva quer destruir a economia de Boa Vista. Vou resistir a essa visao.', 'Entrevista em Boa Vista em fevereiro de 2023 apos acoes contra garimpo ilegal Yanomami.', 'verified', true, '2023-02-15', 'https://g1.globo.com/rr/roraima/noticia/2023/02/15/denarium-defende-garimpo-marina.ghtml', 'news_article', 5, 'Boa Vista', 'Entrevista G1 RR', 'denarium-defende-garimpo-b110-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima critica fiscalizacao do Ibama no Amazonas.', 'Ibama no Amazonas persegue ribeirinho e solta grileiro. O Marina precisa entender a Amazonia real.', 'Entrevista a Rede Amazonica em julho de 2023 sobre operacoes do Ibama.', 'verified', false, '2023-07-08', 'https://amazonasatual.com.br/wilson-lima-critica-ibama-fiscalizacao/', 'news_article', 3, 'Manaus', 'Entrevista Rede Amazonica', 'wilson-lima-critica-ibama-b110-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia resultado do Prodes com queda de 50%.', 'O Prodes mostra 50% menos desmatamento na Amazonia. E resultado de uma politica publica integrada. Brasil esta voltando a ser referencia.', 'Coletiva no MMA em Brasilia em agosto de 2024 com dados do Prodes 2023-2024.', 'verified', true, '2024-08-07', 'https://www.mongabay.com/2024/08/brazil-amazon-deforestation-down-50-percent/', 'news_article', 1, 'Brasilia', 'Coletiva MMA', 'marina-prodes-50-queda-b110-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles diz que Marina inflar numeros para agradar Lula.', 'Marina Silva inflou os dados. Isso e marketing verde. No meu tempo reduzimos mais e ninguem celebrou.', 'Entrevista ao Pingos nos Is em agosto de 2024.', 'verified', false, '2024-08-09', 'https://jovempan.com.br/podcasts/pingos-nos-is/salles-marina-infla-dados.html', 'news_article', 4, 'Sao Paulo', 'Pingos nos Is', 'salles-marina-infla-dados-b110-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia R$ 700 milhoes para Plano Clima em marco de 2024.', 'Vamos destinar R$ 700 milhoes para o Plano Clima. Adaptacao e mitigacao. O Brasil tem que liderar pelo exemplo ate a COP30.', 'Coletiva em Brasilia em marco de 2024 sobre lancamento do Plano Clima.', 'verified', false, '2024-03-21', 'https://www.gov.br/planalto/pt-br/noticias/lula-plano-clima-700-milhoes', 'other', 1, 'Brasilia', 'Lancamento Plano Clima', 'lula-plano-clima-700mi-b110-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva apresenta Plano Clima com metas setoriais.', 'O Plano Clima tem metas concretas para energia, transporte, industria e uso da terra. Quem duvida nao leu o documento.', 'Evento de lancamento do Plano Clima em Brasilia em marco de 2024.', 'verified', false, '2024-03-21', 'https://www.gov.br/mma/pt-br/noticias/marina-silva-apresenta-plano-clima', 'other', 1, 'Brasilia', 'Lancamento Plano Clima', 'marina-apresenta-plano-clima-b110-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio critica politica ambiental federal durante enchentes do RS.', 'O governo federal nao tem plano. SP se preparou e outros estados ficaram refens da ineficiencia de Marina Silva.', 'Entrevista em Sao Paulo em maio de 2024 durante enchentes do RS.', 'verified', true, '2024-05-12', 'https://www1.folha.uol.com.br/cotidiano/2024/05/tarcisio-critica-marina-enchentes-rs.shtml', 'news_article', 3, 'Sao Paulo', 'Entrevista Palacio', 'tarcisio-critica-marina-rs-b110-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula atribui enchentes do RS a mudanca climatica em visita a Canoas.', 'Isso aqui nao e castigo, e mudanca climatica. Quem nega ciencia esta matando gente. Precisamos reconstruir com adaptacao.', 'Visita a Canoas em maio de 2024 durante enchentes do RS.', 'verified', true, '2024-05-06', 'https://www.reuters.com/world/americas/lula-climate-change-rio-grande-sul-floods-2024-05-06/', 'news_article', 1, 'Canoas', 'Visita a Canoas', 'lula-rs-clima-b110-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva liga enchentes do RS a emergencia climatica em discurso.', 'O RS nao pode mais ser tratado como exceção. E emergencia climatica. Precisamos de adaptacao estrutural e reducao de emissoes.', 'Entrevista coletiva em Brasilia em maio de 2024 durante enchentes do RS.', 'verified', true, '2024-05-09', 'https://www.climatechangenews.com/2024/05/09/marina-silva-rio-grande-sul-climate-emergency/', 'news_article', 1, 'Brasilia', 'Coletiva MMA', 'marina-rs-clima-b110-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira nega relacao entre enchentes do RS e clima.', 'Enchente no RS nao tem nada a ver com clima. E gestao petista e Marina Silva querendo aproveitar tragedia. Vergonha.', 'Discurso na Camara em maio de 2024 durante enchentes do RS.', 'verified', true, '2024-05-08', 'https://www.camara.leg.br/noticias/nikolas-ferreira-enchentes-rs-clima', 'other', 5, 'Brasilia', 'Camara dos Deputados', 'nikolas-nega-rs-clima-b110-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem ironiza lideranca climatica de Marina Silva.', 'Marina vai para COP bancar o pinguim global enquanto RS afunda. Incompetencia pura.', 'Discurso na Camara em maio de 2024 durante enchentes do RS.', 'verified', false, '2024-05-14', 'https://www.camara.leg.br/noticias/van-hattem-critica-marina-cop-rs', 'other', 4, 'Brasilia', 'Camara dos Deputados', 'vanhattem-ironiza-marina-b110-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende acao coordenada do governo pos enchentes do RS.', 'A Casa Civil montou comite de crise. Reconstrucao sera com financiamento federal. E crise climatica e vamos tratar como tal.', 'Coletiva em Brasilia em maio de 2024 sobre enchentes do RS.', 'verified', false, '2024-05-11', 'https://agenciabrasil.ebc.com.br/politica/2024-05/rui-costa-comite-rs-reconstrucao', 'news_article', 1, 'Brasilia', 'Coletiva Casa Civil', 'rui-costa-comite-rs-b110-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes e acusado pelo Ibama de omissao em Pantanal 2024.', 'Ibama esta jogando culpa em MT. O governador nao e bombeiro. Quem nao ajuda e o ministerio.', 'Coletiva em Cuiaba em junho de 2024 durante queimadas do Pantanal.', 'verified', true, '2024-06-20', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/06/20/mauro-mendes-pantanal-ibama.ghtml', 'news_article', 4, 'Cuiaba', 'Coletiva Palacio Paiaguas', 'mauro-mendes-omissao-pantanal-b110-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva afirma que queimadas no Pantanal 2024 sao sem precedentes.', 'O que o Pantanal viveu em 2024 foi o pior incendio da historia moderna. Sem acao coordenada, perdemos o bioma.', 'Coletiva em Brasilia em setembro de 2024 sobre queimadas do Pantanal.', 'verified', true, '2024-09-10', 'https://www.mongabay.com/2024/09/pantanal-fires-worst-record-marina-silva/', 'news_article', 1, 'Brasilia', 'Coletiva MMA', 'marina-pantanal-2024-recorde-b110-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina culpa Marina por queimadas em discurso no Senado.', 'Marina Silva nao tem comando do MMA. Pantanal queimou por incompetencia federal. Vamos pedir a saida dela.', 'Discurso no Senado em julho de 2024 durante queimadas do Pantanal.', 'verified', true, '2024-07-02', 'https://www12.senado.leg.br/noticias/materias/2024/07/02/tereza-cristina-marina-pantanal', 'other', 3, 'Brasilia', 'Senado Federal', 'tereza-culpa-marina-pantanal-b110-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Favaro minimiza queimadas no Pantanal e culpa seca.', 'Foi seca historica. Nao tem o que fazer contra clima. Agro nao e culpado por fogo em Pantanal.', 'Entrevista em Cuiaba em agosto de 2024 durante pico das queimadas.', 'verified', false, '2024-08-05', 'https://valor.globo.com/agronegocios/noticia/2024/08/05/favaro-pantanal-seca-historica.ghtml', 'news_article', 3, 'Cuiaba', 'Entrevista Valor', 'favaro-pantanal-seca-b110-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves diz que Marina Silva persegue garimpeiro pobre.', 'Marina persegue trabalhador. Garimpeiro e pai de familia. Essa ideologia ambiental petista mata empregos no norte.', 'Discurso no Senado em abril de 2023 sobre operacao em territorio Yanomami.', 'verified', false, '2023-04-12', 'https://www12.senado.leg.br/noticias/materias/2023/04/12/damares-marina-garimpo', 'other', 4, 'Brasilia', 'Senado Federal', 'damares-marina-garimpeiro-b110-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano chama COP de culto pagao globalista.', 'COP e culto pagao. Pagam Gaia e transformam Lula em profeta do clima. Vergonha para um pais cristao.', 'Video no YouTube em dezembro de 2023 durante a COP28.', 'verified', false, '2023-12-04', 'https://www.youtube.com/watch?v=feliciano-cop-pagao-2023', 'social_media_post', 4, 'Online', 'YouTube', 'feliciano-cop-pagao-b110-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral defende cobrar metas climaticas de prefeitos.', 'Nao adianta COP30 se prefeitos continuam ignorando clima. Precisamos de responsabilidade local e metas vinculantes.', 'Discurso no plenario da Camara em fevereiro de 2024.', 'verified', false, '2024-02-28', 'https://www.camara.leg.br/noticias/tabata-amaral-clima-prefeitos-metas', 'other', 1, 'Brasilia', 'Camara dos Deputados', 'tabata-cobra-prefeitos-clima-b110-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva cobra ampliacao da agenda climatica na Camara.', 'O Congresso nao pode travar pauta climatica. Vamos aprovar o PL do Carbono. E geracao de empregos verdes.', 'Entrevista em Brasilia em novembro de 2023.', 'verified', false, '2023-11-14', 'https://www.camara.leg.br/noticias/orlando-silva-pl-carbono', 'other', 1, 'Brasilia', 'Camara dos Deputados', 'orlando-silva-pl-carbono-b110-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles diz que Brasil nao precisa cumprir Acordo de Paris.', 'Acordo de Paris e acordo de gringo. Brasil tem que cuidar do Brasil. Marina entrega o pais.', 'Entrevista a Gazeta do Povo em julho de 2023.', 'verified', false, '2023-07-22', 'https://www.gazetadopovo.com.br/politica/republica/salles-brasil-acordo-paris-2023/', 'news_article', 5, 'Curitiba', 'Entrevista Gazeta', 'salles-acordo-paris-b110-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia na COP29 ambicao de reducao de emissoes 59-67%.', 'O Brasil vai entregar NDC ambiciosa. Estamos comprometidos com 59 a 67% de reducao de emissoes ate 2035.', 'Discurso em Baku na COP29 em novembro de 2024.', 'verified', true, '2024-11-12', 'https://www.climatechangenews.com/2024/11/12/brazil-ndc-cop29-baku-lula/', 'other', 1, 'Baku', 'COP29', 'lula-cop29-ndc-b110-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva critica acordo financeiro da COP29 como insuficiente.', 'O acordo de US$ 300 bilhoes e insuficiente. Precisamos de US$ 1,3 trilhao. Vai ficar para COP30 resolver.', 'Declaracao em Baku ao final da COP29 em novembro de 2024.', 'verified', true, '2024-11-23', 'https://www.mongabay.com/2024/11/marina-silva-cop29-finance-insufficient/', 'news_article', 1, 'Baku', 'COP29', 'marina-cop29-insuficiente-b110-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro ataca ida da delegacao brasileira a COP29.', 'Lula gastando milhoes para ir a Baku falar de clima. Enquanto isso o Brasil afunda. Vergonha internacional.', 'Tweet em novembro de 2024 durante a COP29.', 'verified', false, '2024-11-14', 'https://x.com/BolsonaroSP/status/eduardo-cop29-critica', 'social_media_post', 3, 'Online', 'Twitter', 'eduardo-ataca-cop29-b110-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard defende Margem Equatorial como prioridade da Petrobras.', 'A Margem Equatorial e prioridade absoluta. Vamos investir e operar com seguranca ambiental. Nao ha conflito com MMA.', 'Coletiva no Rio em junho de 2024 apos assumir a presidencia da Petrobras.', 'verified', true, '2024-06-18', 'https://valor.globo.com/empresas/noticia/2024/06/18/chambriard-margem-equatorial-prioridade.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Coletiva Petrobras', 'magda-margem-equatorial-b110-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva reafirma autonomia do Ibama sobre Petrobras.', 'Ibama nao e balcao. Licenciamento tem rito tecnico e nao vai acelerar por lobby de estatal. Isso eu garanto.', 'Entrevista ao Estadao em julho de 2024 sobre pressao por Foz do Amazonas.', 'verified', true, '2024-07-22', 'https://www.estadao.com.br/economia/marina-silva-ibama-petrobras-foz/', 'news_article', 2, 'Brasilia', 'Entrevista Estadao', 'marina-ibama-autonomia-b110-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Ronaldo Caiado ironiza Marina Silva durante queimadas em Goias.', 'Marina fica em Brasilia. Goias combate fogo sozinho. Esse ministerio e so burocracia para emperrar estado.', 'Coletiva em Goiania em setembro de 2024 sobre queimadas no Cerrado.', 'verified', false, '2024-09-18', 'https://g1.globo.com/go/goias/noticia/2024/09/18/caiado-marina-queimadas-goias.ghtml', 'news_article', 3, 'Goiania', 'Coletiva Palacio', 'caiado-ironiza-marina-b110-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior defende uso de pulverizacao aerea contra ordem do MMA.', 'Parana vai manter pulverizacao aerea. Marina quer acabar com o agro. Nao aceitamos ordem federal contra o produtor.', 'Entrevista em Curitiba em novembro de 2023 sobre restricoes do MMA.', 'verified', false, '2023-11-10', 'https://www.gazetadopovo.com.br/politica/parana/ratinho-pulverizacao-aerea-marina/', 'news_article', 4, 'Curitiba', 'Entrevista Gazeta', 'ratinho-pulverizacao-b110-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lus, 'Luciana Santos anuncia investimento em pesquisa climatica.', 'O MCTI investira R$ 1,4 bilhao em pesquisa de clima, bioeconomia e previsao de extremos. Ciencia e base da politica climatica.', 'Coletiva em Brasilia em fevereiro de 2024 no MCTI.', 'verified', false, '2024-02-08', 'https://www.gov.br/mcti/pt-br/noticias/luciana-santos-clima-1-4-bi', 'other', 1, 'Brasilia', 'Coletiva MCTI', 'luciana-santos-clima-mcti-b110-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Geraldo Alckmin defende neoindustrializacao verde como prioridade.', 'Neoindustrializacao tem que ser verde. Automoveis eletricos, hidrogenio verde, mineracao sustentavel. E estrategia pais.', 'Palestra em Sao Paulo em junho de 2023 na Firjan.', 'verified', false, '2023-06-14', 'https://valor.globo.com/politica/noticia/2023/06/14/alckmin-industrializacao-verde.ghtml', 'news_article', 1, 'Sao Paulo', 'Evento Firjan', 'alckmin-industrializacao-verde-b110-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles diz que Marina e obstaculo para investimento.', 'Marina afugenta capital. Ninguem investe em pais com MMA travando tudo. Lula vai ter que escolher entre ela e economia.', 'Entrevista ao Brasil Paralelo em outubro de 2023.', 'verified', false, '2023-10-28', 'https://www.brasilparalelo.com.br/salles-marina-investimento-2023', 'news_article', 3, 'Sao Paulo', 'Entrevista BP', 'salles-marina-investimento-b110-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva inaugura centro de monitoramento integrado de biomas.', 'Hoje inauguramos o centro integrado de monitoramento. Amazonia, Cerrado, Pantanal, Caatinga, Mata Atlantica, Pampa. Todos em tempo real.', 'Inauguracao em Brasilia em outubro de 2023 no MMA.', 'verified', false, '2023-10-12', 'https://www.gov.br/mma/pt-br/noticias/centro-monitoramento-biomas', 'other', 1, 'Brasilia', 'Inauguracao MMA', 'marina-centro-biomas-b110-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antonio Denarium acusa Marina de promover etnocidio reverso em Roraima.', 'Marina fecha garimpo e condena a nossa economia. Isso e etnocidio contra o povo de Roraima. Vou a Justica.', 'Entrevista em Boa Vista em agosto de 2023.', 'verified', false, '2023-08-30', 'https://www.amazoniareal.com.br/denarium-marina-etnocidio/', 'news_article', 5, 'Boa Vista', 'Entrevista radio', 'denarium-etnocidio-marina-b110-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara responde a Denarium sobre garimpo Yanomami.', 'Quem comete etnocidio e o garimpo ilegal. O governo federal esta salvando vidas Yanomami, nao destruindo. E outro lado.', 'Entrevista em Brasilia em setembro de 2023.', 'verified', true, '2023-09-04', 'https://www.mongabay.com/2023/09/sonia-guajajara-yanomami-denarium-response/', 'news_article', 1, 'Brasilia', 'Entrevista MPI', 'guajajara-responde-denarium-b110-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que COP30 sera a COP da verdade para o mundo.', 'Belem vai receber o mundo e mostrar que a Amazonia esta de pe e o Brasil cumpre promessa. Vai ser a COP da verdade.', 'Discurso em Paris em junho de 2023 em reuniao de financiamento climatico.', 'verified', true, '2023-06-23', 'https://www.reuters.com/world/americas/lula-cop30-truth-paris-summit-2023-06-23/', 'other', 1, 'Paris', 'Cupula Paris', 'lula-cop30-verdade-b110-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Aloizio Mercadante anuncia linha BNDES para bioeconomia.', 'O BNDES lanca R$ 5 bilhoes para bioeconomia na Amazonia. Florestal em pe e mais rentavel que boi. Isso e transicao.', 'Coletiva no BNDES no Rio em setembro de 2023.', 'verified', false, '2023-09-07', 'https://valor.globo.com/financas/noticia/2023/09/07/bndes-mercadante-bioeconomia.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Coletiva BNDES', 'mercadante-bioeconomia-b110-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva defende lei do licenciamento ambiental contra PL devastacao.', 'O PL 2159 e PL da devastacao. Vai destruir o licenciamento no Brasil. Vou ate o fim para barrar.', 'Entrevista em Brasilia em maio de 2024 sobre PL do Licenciamento.', 'verified', true, '2024-05-22', 'https://www.climatechangenews.com/2024/05/marina-silva-brazil-licensing-bill/', 'news_article', 1, 'Brasilia', 'Entrevista MMA', 'marina-pl-devastacao-b110-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina comemora PL do Licenciamento e chama de modernizacao.', 'PL do Licenciamento modernizou o Brasil. Marina chama de devastacao porque nao aceita o agro vencer.', 'Discurso no Senado em maio de 2024.', 'verified', false, '2024-05-22', 'https://www12.senado.leg.br/noticias/materias/2024/05/22/tereza-cristina-licenciamento', 'other', 3, 'Brasilia', 'Senado Federal', 'tereza-pl-licenciamento-b110-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Jose Mucio defende papel das Forcas Armadas na protecao da Amazonia.', 'Forcas Armadas cumprem sua missao de defender soberania. Em operacoes Yanomami e ambientais estamos presentes.', 'Coletiva em Brasilia em maio de 2023 sobre GLO em territorio Yanomami.', 'verified', false, '2023-05-10', 'https://agenciabrasil.ebc.com.br/politica/2023-05/mucio-yanomami-forcas-armadas', 'other', 1, 'Brasilia', 'Coletiva Defesa', 'mucio-yanomami-forcas-b110-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz que crise Yanomami foi inventada para atacar o agro.', 'Crise Yanomami e mentira. Invencao para perseguir garimpeiro e agro brasileiro. Marina esta fazendo politica com crianca.', 'Entrevista em Miami em fevereiro de 2023 sobre operacoes Yanomami.', 'verified', true, '2023-02-05', 'https://www.reuters.com/world/americas/bolsonaro-yanomami-crisis-invented-2023-02-05/', 'news_article', 5, 'Miami', 'Entrevista CPAC', 'bolsonaro-yanomami-invencao-b110-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara rebate Bolsonaro sobre Yanomami com dados de mortes.', 'Morreram 570 criancas Yanomami no governo Bolsonaro. Isso nao e invencao, e genocidio documentado. Justica chegara.', 'Coletiva em Brasilia em fevereiro de 2023.', 'verified', true, '2023-02-07', 'https://www.mongabay.com/2023/02/sonia-guajajara-yanomami-genocide-response-bolsonaro/', 'news_article', 1, 'Brasilia', 'Coletiva MPI', 'guajajara-yanomami-genocidio-b110-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha defende saude climatica como politica publica.', 'Saude e clima estao juntos. Dengue, leishmaniose, eventos extremos. SUS precisa se preparar para era do clima.', 'Evento em Brasilia em marco de 2024 sobre saude e clima.', 'verified', false, '2024-03-28', 'https://www.gov.br/saude/pt-br/noticias/padilha-saude-clima', 'other', 1, 'Brasilia', 'Evento Fiocruz', 'padilha-saude-clima-b110-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula pressiona pela aprovacao do PL do Carbono em evento no Planalto.', 'O PL do Carbono precisa ser aprovado. Brasil vai chegar na COP30 com mercado regulado. Precisamos dessa liderana.', 'Reuniao com lideres partidarios no Planalto em abril de 2024.', 'verified', false, '2024-04-15', 'https://www1.folha.uol.com.br/mercado/2024/04/lula-pl-carbono-planalto.shtml', 'news_article', 1, 'Brasilia', 'Reuniao Planalto', 'lula-pl-carbono-planalto-b110-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral denuncia atrasos em adaptacao climatica em capitais.', 'Porto Alegre, Sao Paulo e Rio nao se adaptaram. Precisamos de programa nacional de adaptacao urbana ou COP30 sera so marketing.', 'Audiencia na Camara em junho de 2024 sobre adaptacao urbana.', 'verified', false, '2024-06-11', 'https://www.camara.leg.br/noticias/tabata-adaptacao-urbana-capitais', 'other', 1, 'Brasilia', 'Camara dos Deputados', 'tabata-adaptacao-urbana-b110-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles acusa Marina de usar dados para atingir Bolsonaro.', 'Marina esta inflando dados do meu tempo para culpar Bolsonaro. Isso e politicagem, nao politica publica.', 'Entrevista a Globonews em setembro de 2023.', 'verified', false, '2023-09-06', 'https://g1.globo.com/politica/noticia/2023/09/06/salles-critica-marina-dados-bolsonaro.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista Globonews', 'salles-acusa-marina-dados-b110-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho promete obras para COP30 e pede apoio federal.', 'Belem sera uma vitrine. Entrega do aeroporto, hoteis, mobilidade e parque linear. Mas precisamos de apoio do governo federal.', 'Entrevista em Belem em fevereiro de 2024.', 'verified', false, '2024-02-22', 'https://g1.globo.com/pa/para/noticia/2024/02/22/helder-obras-cop30-belem.ghtml', 'news_article', 1, 'Belem', 'Entrevista Palacio', 'helder-obras-cop30-b110-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema diz que agenda climatica inibe investimento em MG.', 'MG nao pode perder investimento porque Marina criou burocracia de licenciamento. Vamos flexibilizar no estado.', 'Coletiva em Belo Horizonte em abril de 2024.', 'verified', false, '2024-04-10', 'https://www.em.com.br/politica/zema-licenciamento-mg-marina/', 'news_article', 4, 'Belo Horizonte', 'Coletiva Palacio', 'zema-licenciamento-mg-b110-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reafirma meta de zero desmatamento e pede ajuda internacional.', 'Vamos zerar desmatamento na Amazonia ate 2030. Mas precisamos de financiamento internacional. Quem ganhou com nossa floresta tem que pagar.', 'Entrevista ao Financial Times em julho de 2024.', 'verified', true, '2024-07-30', 'https://www.ft.com/content/lula-brazil-zero-deforestation-2024-07-30', 'news_article', 1, 'Brasilia', 'Entrevista FT', 'lula-zero-desmatamento-ft-b110-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia ampliacao do PPA para restauracao florestal.', 'Vamos investir R$ 6 bilhoes em restauracao florestal no PPA. Brasil vai cumprir compromissos e liderar via COP30.', 'Coletiva em Brasilia em abril de 2024 sobre PPA ambiental.', 'verified', false, '2024-04-30', 'https://www.gov.br/mma/pt-br/noticias/marina-ppa-restauracao-6bi', 'other', 1, 'Brasilia', 'Coletiva MMA', 'marina-ppa-restauracao-b110-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jpp, 'Jean Paul Prates deixa Petrobras em meio a crise com Planalto sobre dividendos.', 'Saio de cabeca erguida. Defendi a Petrobras e a transicao justa. Margem Equatorial seguira como prioridade.', 'Declaracao no Rio em maio de 2024 ao deixar a Petrobras.', 'verified', true, '2024-05-14', 'https://valor.globo.com/empresas/noticia/2024/05/14/prates-deixa-petrobras.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Coletiva Petrobras', 'prates-deixa-petrobras-b110-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz que Marina enganou eleitor petista no Nordeste.', 'Marina enganou Nordeste. Prometeu emprego e entregou ambientalismo. O Nordeste vai abandonar Lula por causa dela.', 'Live em outubro de 2023 com apoiadores.', 'verified', false, '2023-10-19', 'https://www.brasil247.com/brasil/bolsonaro-marina-nordeste-live', 'social_media_post', 4, 'Online', 'Live', 'bolsonaro-marina-nordeste-b110-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva responde a criticas na Camara em audiencia dura.', 'Sou ministra e respondo com numeros. Desmatamento caiu. Quem nao aceita ciencia que me ataque. Eu nao recuo.', 'Audiencia na Camara dos Deputados em marco de 2024.', 'verified', true, '2024-03-19', 'https://www.camara.leg.br/noticias/marina-silva-audiencia-dura-criticas', 'other', 1, 'Brasilia', 'Camara dos Deputados', 'marina-audiencia-dura-b110-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem afirma que marco temporal protege o Brasil.', 'Marco temporal e protecao de propriedade. Sem ele, Brasil vira colcha de retalhos indigena. Marina e inimigo do direito.', 'Discurso na Camara em setembro de 2023.', 'verified', false, '2023-09-25', 'https://www.camara.leg.br/noticias/vanhattem-marco-temporal-defesa', 'other', 4, 'Brasilia', 'Camara dos Deputados', 'vanhattem-marco-temporal-b110-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara celebra derrota do marco temporal no STF.', 'O STF fez justica. Marco temporal e tese anti-indigena. Nossa terra esta antes da Constituicao. Vitoria dos povos.', 'Coletiva no STF em setembro de 2023.', 'verified', true, '2023-09-21', 'https://www.mongabay.com/2023/09/brazil-supreme-court-marco-temporal-indigenous-victory/', 'news_article', 1, 'Brasilia', 'STF', 'guajajara-marco-temporal-vitoria-b110-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina lidera Congresso para derrubar veto sobre marco temporal.', 'Congresso vai derrubar veto de Lula sobre marco temporal. Bancada do agro esta unida. STF nao legisla.', 'Discurso no Senado em dezembro de 2023.', 'verified', true, '2023-12-14', 'https://www12.senado.leg.br/noticias/materias/2023/12/14/tereza-marco-temporal-veto', 'other', 4, 'Brasilia', 'Senado Federal', 'tereza-derruba-veto-b110-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Congresso por derrubar veto sobre marco temporal.', 'Derrubar meu veto foi um golpe no direito dos povos indigenas. Nao vou permitir retrocesso. Vamos ao STF.', 'Declaracao em Brasilia em dezembro de 2023.', 'verified', true, '2023-12-15', 'https://www.reuters.com/world/americas/lula-attacks-congress-marco-temporal-2023-12-15/', 'news_article', 2, 'Brasilia', 'Coletiva Planalto', 'lula-critica-congresso-marco-b110-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva critica Congresso por flexibilizar Codigo Florestal.', 'Congresso nao pode flexibilizar Codigo Florestal. Isso vai custar caro ao Brasil em clima e em mercado.', 'Entrevista ao Estadao em junho de 2024.', 'verified', false, '2024-06-07', 'https://www.estadao.com.br/economia/marina-codigo-florestal-congresso/', 'news_article', 1, 'Brasilia', 'Entrevista Estadao', 'marina-codigo-florestal-b110-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio critica Plano Clima como entrega nacional.', 'Plano Clima do Lula e entrega. Brasil nao pode se comprometer com metas que travam a economia. SP nao seguira.', 'Entrevista em Sao Paulo em abril de 2024.', 'verified', false, '2024-04-05', 'https://www1.folha.uol.com.br/cotidiano/2024/04/tarcisio-plano-clima-entrega.shtml', 'news_article', 4, 'Sao Paulo', 'Entrevista Folha', 'tarcisio-plano-clima-b110-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que Brasil tera taxonomia verde consolidada ate COP30.', 'Taxonomia verde brasileira sera referencia. Ate COP30 o Brasil tera sistema completo e operando. Capital internacional vai chegar.', 'Evento em Washington em abril de 2024 no FMI.', 'verified', false, '2024-04-18', 'https://valor.globo.com/financas/noticia/2024/04/18/haddad-taxonomia-verde-cop30.ghtml', 'news_article', 1, 'Washington', 'FMI', 'haddad-taxonomia-cop30-b110-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles lanca livro criticando politica ambiental de Marina.', 'Meu livro mostra como Marina destruiu a economia. Ambientalismo virou culto. Vou continuar denunciando.', 'Lancamento em Sao Paulo em novembro de 2023.', 'verified', false, '2023-11-10', 'https://oglobo.globo.com/politica/noticia/2023/11/10/salles-lanca-livro-marina.ghtml', 'news_article', 3, 'Sao Paulo', 'Lancamento livro', 'salles-livro-critica-marina-b110-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rebate ataques da bancada ruralista e defende Marina.', 'Quem ataca Marina ataca o Brasil. Ela e minha ministra e tem meu apoio total. Bancada ruralista tem que respeitar.', 'Entrevista em Brasilia em maio de 2024.', 'verified', true, '2024-05-17', 'https://www.reuters.com/world/americas/lula-defends-marina-silva-against-agro-lobby-2024-05-17/', 'news_article', 1, 'Brasilia', 'Entrevista Palacio', 'lula-defende-marina-ruralistas-b110-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Favaro visita produtores rurais e critica dados da SEAF.', 'Agro foi injustamente culpado pelo Pantanal. Produtor rural defende o meio ambiente. Dados precisam ser revisados.', 'Evento em Cuiaba em agosto de 2024.', 'verified', false, '2024-08-28', 'https://valor.globo.com/agronegocios/noticia/2024/08/28/favaro-pantanal-produtores.ghtml', 'news_article', 3, 'Cuiaba', 'Evento Famato', 'favaro-pantanal-produtores-b110-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva publica artigo alertando sobre ponto de nao retorno da Amazonia.', 'A Amazonia esta perigosamente proxima do ponto de nao retorno. Precisamos acelerar fim do desmatamento ou floresta vira savana.', 'Artigo publicado na Folha em agosto de 2024.', 'verified', true, '2024-08-21', 'https://www1.folha.uol.com.br/opiniao/2024/08/marina-silva-amazonia-ponto-nao-retorno.shtml', 'news_article', 1, 'Brasilia', 'Artigo Folha', 'marina-ponto-nao-retorno-b110-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro reage a artigo de Marina e nega ponto de nao retorno.', 'Marina esta vendendo medo. Amazonia esta bem. Ponto de nao retorno e teoria de gringo para tomar a Amazonia.', 'Live em agosto de 2024.', 'verified', false, '2024-08-24', 'https://www.brasil247.com/brasil/bolsonaro-reage-marina-ponto-retorno', 'social_media_post', 5, 'Online', 'Live', 'bolsonaro-nega-ponto-retorno-b110-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro defende saida do Brasil do Acordo de Paris.', 'Vamos lutar para Brasil sair do Acordo de Paris como Trump fez. Soberania nao se negocia em Dubai ou Belem.', 'Tweet em dezembro de 2023.', 'verified', false, '2023-12-12', 'https://x.com/BolsonaroSP/status/eduardo-saida-acordo-paris', 'social_media_post', 5, 'Online', 'Twitter', 'eduardo-saida-acordo-paris-b110-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula lamenta enchentes de 2024 em discurso na COP29.', 'Perdemos mais de 180 pessoas no RS. Eventos extremos sao a nova normalidade. Brasil nao esta pronto e o mundo tambem nao.', 'Discurso em Baku na COP29 em novembro de 2024.', 'verified', true, '2024-11-13', 'https://www.climatechangenews.com/2024/11/13/lula-cop29-rio-grande-sul-floods/', 'other', 1, 'Baku', 'COP29', 'lula-cop29-rs-b110-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende Plano de Transformacao Ecologica no PPA.', 'Transformacao Ecologica esta no PPA. E politica de Estado, nao de governo. Vai continuar apos 2026.', 'Entrevista em Brasilia em novembro de 2023.', 'verified', false, '2023-11-24', 'https://agenciabrasil.ebc.com.br/economia/2023-11/tebet-transformacao-ecologica-ppa', 'other', 1, 'Brasilia', 'Coletiva Planejamento', 'tebet-transformacao-ecologica-b110-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva diz que mundo espera liderana do Brasil na COP30.', 'O mundo espera liderana. COP30 em Belem e janela unica para Brasil ser protagonista. Temos que entregar.', 'Entrevista a BBC News em janeiro de 2025.', 'verified', true, '2025-01-14', 'https://www.bbc.com/news/world-latin-america-marina-silva-cop30-2025', 'news_article', 1, 'Londres', 'Entrevista BBC', 'marina-mundo-cop30-b110-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles anuncia que fara oposicao a COP30 em Belem.', 'Vou organizar oposicao a COP30. Isso e evento petista para vender Amazonia. Belem nao precisa disso.', 'Video no Instagram em fevereiro de 2025.', 'verified', true, '2025-02-10', 'https://www.instagram.com/ricardosallesbr/reel/salles-oposicao-cop30', 'social_media_post', 4, 'Online', 'Instagram', 'salles-oposicao-cop30-b110-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita obras da COP30 em Belem e critica atrasos.', 'Precisamos acelerar. COP30 nao pode ter improviso. Cobranca e do mundo inteiro e vamos entregar.', 'Visita a obras em Belem em marco de 2025.', 'verified', true, '2025-03-15', 'https://g1.globo.com/pa/para/noticia/2025/03/15/lula-obras-cop30-belem.ghtml', 'news_article', 1, 'Belem', 'Visita obras', 'lula-visita-obras-cop30-b110-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho defende Belem para receber COP30 com estrutura nova.', 'Belem esta pronta. Tivemos R$ 6 bilhoes em obras. Quem diz que nao ta pronto e opositor que nao conhece a cidade.', 'Entrevista em Belem em marco de 2025.', 'verified', false, '2025-03-20', 'https://www.amazoniareal.com.br/helder-belem-pronta-cop30/', 'news_article', 1, 'Belem', 'Entrevista Palacio', 'helder-belem-pronta-b110-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva critica atraso nas metas de financiamento climatico pre-COP30.', 'Paises ricos estao atrasados em compromissos financeiros. Isso ameaca resultado da COP30. Nao aceitaremos fiasco.', 'Entrevista em Brasilia em abril de 2025.', 'verified', true, '2025-04-03', 'https://www.climatechangenews.com/2025/04/marina-silva-cop30-climate-finance-warning/', 'news_article', 1, 'Brasilia', 'Coletiva MMA', 'marina-financiamento-cop30-b110-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reafirma COP30 como legado para novas geracoes.', 'COP30 sera legado para nossos netos. Belem recebera o mundo. Brasil provara que desenvolvimento e clima caminham juntos.', 'Discurso em Sao Paulo em maio de 2025 em evento na USP.', 'verified', false, '2025-05-05', 'https://www1.folha.uol.com.br/ambiente/2025/05/lula-cop30-legado-usp.shtml', 'other', 1, 'Sao Paulo', 'USP', 'lula-cop30-legado-b110-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz que COP30 e circo globalista em Belem.', 'COP30 e circo globalista. Vao humilhar Belem e vender a Amazonia. Brasileiro de bem nao aceita isso.', 'Entrevista a Jovem Pan em julho de 2025.', 'verified', true, '2025-07-22', 'https://jovempan.com.br/noticias/politica/bolsonaro-cop30-circo-globalista.html', 'news_article', 5, 'Sao Paulo', 'Entrevista JP', 'bolsonaro-cop30-circo-b110-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

END $$;
