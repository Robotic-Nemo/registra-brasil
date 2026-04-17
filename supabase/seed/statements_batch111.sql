-- Batch 111: Environment, climate, COP30 Belem, Amazon, Margem Equatorial (Jan 2023 - Apr 2026)
-- 100 statements (continuation) on environmental policy, Fundo Amazonia, bioeconomia, oil
DO $$
DECLARE
  v_mar UUID; v_lul UUID; v_fav UUID; v_sal UUID; v_ter UUID;
  v_jpp UUID; v_mag UUID; v_asi UUID; v_hel UUID; v_had UUID;
  v_mvi UUID; v_teb UUID; v_alc UUID; v_bol UUID; v_edb UUID;
  v_wlm UUID; v_ade UUID; v_mme UUID; v_gca UUID; v_nik UUID;
  v_mvh UUID; v_fel UUID; v_dam UUID; v_tab UUID; v_ors UUID;
  v_gua UUID; v_mer UUID; v_pad UUID; v_rui UUID; v_muc UUID;
  v_lew UUID; v_cle UUID; v_wba UUID; v_eri UUID; v_sam UUID;
  v_tal UUID; v_cal UUID; v_jan UUID; v_lir UUID; v_mot UUID;
  v_mor UUID; v_gil UUID; v_car UUID; v_fac UUID; v_zan UUID;
  v_din UUID; v_nis UUID;
  c_des UUID; c_neg UUID; c_irr UUID; c_abu UUID; c_con UUID;
  c_odi UUID; c_ame UUID; c_aut UUID; c_aut2 UUID; c_cor UUID;
  c_vio UUID; c_rac UUID; c_obs UUID;
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
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_wba FROM politicians WHERE slug = 'wanderlei-barbosa';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_aut FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_aut2 FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia COP30 em Belem como momento historico para o Brasil.', 'Belem sera a capital do clima. Sera a COP da Amazonia, dos povos da floresta. O Brasil lidera de novo a agenda ambiental.', 'Discurso em Belem em janeiro de 2024 sobre preparativos da COP30.', 'verified', true, '2024-01-22', 'https://www.climatechangenews.com/2024/01/22/lula-belem-cop30-announcement/', 'other', 1, 'Belem', 'Coletiva COP30', 'lula-cop30-capital-clima-b111-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia reducao de 50% no desmatamento da Amazonia em 2024.', 'Os dados do Prodes confirmam reducao historica. Em 2024 reduzimos mais de 50% o desmatamento. Isso e politica publica funcionando.', 'Coletiva no MMA em agosto de 2024 com divulgacao do Prodes.', 'verified', true, '2024-08-07', 'https://www.mongabay.com/2024/08/brazil-deforestation-50-percent-drop-2024/', 'other', 1, 'Brasilia', 'MMA', 'marina-reducao-50-2024-b111-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz que aquecimento global e mito para subjugar o Brasil.', 'Esse aquecimento global e mito usado para subjugar pais soberano. No meu governo nao acreditamos nessa lenda. Lula vende o Brasil por cota.', 'Live em marco de 2024.', 'verified', true, '2024-03-10', 'https://www1.folha.uol.com.br/ambiente/2024/03/bolsonaro-aquecimento-global-mito.shtml', 'social_media_post', 5, 'Online', 'Live', 'bolsonaro-aquecimento-mito-b111-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard promete perfurar Margem Equatorial logo apos assumir Petrobras.', 'A Foz do Amazonas e prioridade. Vou garantir que perfuremos. O Brasil precisa dessa producao. Ibama tem que dar licenca.', 'Entrevista ao Valor em maio de 2024 apos posse.', 'verified', true, '2024-05-24', 'https://valor.globo.com/empresas/noticia/2024/05/24/magda-chambriard-foz-amazonas.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Petrobras', 'magda-foz-amazonas-b111-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva reage e cita independencia do Ibama.', 'O Ibama e tecnico. Ninguem manda licenciar contra a ciencia. Nem presidente nem presidente de estatal. E autarquia federal.', 'Coletiva no MMA em junho de 2024 apos fala de Magda.', 'verified', true, '2024-06-05', 'https://www.mongabay.com/2024/06/marina-defends-ibama-independence-2024/', 'other', 1, 'Brasilia', 'MMA', 'marina-ibama-independencia-b111-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_asi, 'Alexandre Silveira pressiona MMA a liberar Foz do Amazonas.', 'O Brasil nao pode perder essa janela de investimento. Energia e prioridade estrategica. Ibama tem que aprovar.', 'Entrevista em Brasilia em julho de 2024.', 'verified', false, '2024-07-22', 'https://www.gov.br/mme/pt-br/noticias/silveira-foz-amazonas', 'other', 3, 'Brasilia', 'MME', 'silveira-pressiona-foz-b111-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jpp, 'Jean Paul Prates, apos demissao, critica governo por falta de unidade.', 'Sai porque o governo nao tinha unidade sobre a Margem Equatorial. Ministros ambientais contra meu trabalho. Agora e tarde.', 'Entrevista ao Valor em junho de 2024 apos demissao da Petrobras.', 'verified', false, '2024-06-12', 'https://valor.globo.com/empresas/noticia/2024/06/12/prates-critica-governo-margem.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Entrevista Valor', 'prates-critica-governo-b111-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende perfurar Margem Equatorial mesmo sem licenca.', 'A Petrobras tem que perfurar. O Brasil nao e reserva ambiental. Precisamos produzir petroleo enquanto existe demanda mundial.', 'Entrevista a Globo em julho de 2024.', 'verified', true, '2024-07-26', 'https://g1.globo.com/politica/noticia/2024/07/26/lula-margem-equatorial-petroleo.ghtml', 'news_article', 4, 'Brasilia', 'Entrevista G1', 'lula-margem-perfurar-b111-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho pede perfuracao na Foz do Amazonas para royalties do Para.', 'Sem royalties do petroleo nao temos COP30 decente em Belem. Precisamos sim da Margem Equatorial. Visao xiita ambiental empobrece.', 'Entrevista em Belem em agosto de 2024.', 'verified', true, '2024-08-14', 'https://oglobo.globo.com/economia/noticia/2024/08/14/helder-margem-royalties-cop30.ghtml', 'news_article', 3, 'Belem', 'Palacio do Para', 'helder-royalties-cop30-b111-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles critica Marina Silva por suposto travamento da COP30.', 'Marina Silva trava a COP30 com ideologia. Deveria focar em infraestrutura e nao em agenda globalista. E xiismo de novo.', 'Podcast em outubro de 2024.', 'verified', false, '2024-10-18', 'https://www.youtube.com/watch?v=salles-critica-marina-cop30', 'social_media_post', 3, 'Online', 'Podcast', 'salles-critica-marina-cop30-b111-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende agronegocio na pre-COP30.', 'O agro brasileiro e o mais sustentavel do mundo. Nao vamos aceitar criticas injustas na COP30. Precisamos defender o produtor.', 'Discurso no Senado em novembro de 2024.', 'verified', false, '2024-11-05', 'https://www12.senado.leg.br/noticias/materias/2024/11/05/tereza-agro-cop30', 'other', 2, 'Brasilia', 'Senado', 'tereza-agro-cop30-b111-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia COP30 com foco em povos originarios.', 'A COP30 sera a COP da implementacao. Os povos originarios serao protagonistas. Colocaremos a natureza no centro.', 'Entrevista na Folha em fevereiro de 2024.', 'verified', false, '2024-02-15', 'https://www1.folha.uol.com.br/ambiente/2024/02/marina-cop30-povos.shtml', 'news_article', 1, 'Brasilia', 'MMA', 'marina-cop30-povos-b111-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro diz que COP30 e festival globalista.', 'A COP30 e festival globalista em Belem. Gastam bilhoes para agradar esquerda internacional enquanto brasileiro sofre.', 'Video no Instagram em outubro de 2024.', 'verified', false, '2024-10-20', 'https://www.instagram.com/bolsonarosp/p/eduardo-cop30-festival/', 'social_media_post', 4, 'Online', 'Instagram', 'eduardo-cop30-festival-b111-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha fake sobre gastos da COP30.', 'Governo Lula vai gastar R$ 10 bilhoes com CCOP30 para turismo. Povo passa fome enquanto eles fazem festa globalista.', 'Tweet em novembro de 2024, desmentido por agencia de checagem.', 'verified', true, '2024-11-10', 'https://www.aosfatos.org/noticias/nikolas-fake-cop30-gastos/', 'social_media_post', 4, 'Online', 'Twitter', 'nikolas-fake-gastos-cop30-b111-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa na COP29 em Baku e defende transicao justa.', 'Os paises ricos precisam assumir financiamento climatico. A COP30 em Belem vai cobrar. Nao aceitamos promessas vazias.', 'Discurso na COP29 em Baku em novembro de 2024.', 'verified', true, '2024-11-13', 'https://www.climatechangenews.com/2024/11/13/lula-cop29-baku-financiamento/', 'other', 1, 'Baku', 'COP29', 'lula-cop29-baku-b111-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva critica acordo da COP29 como insuficiente.', 'O acordo de Baku e decepcionante. 300 bilhoes sao insuficientes. Precisamos mais em Belem. Paises ricos tem divida climatica.', 'Coletiva apos COP29 em novembro de 2024.', 'verified', true, '2024-11-24', 'https://www.reuters.com/sustainability/climate-energy/marina-silva-cop29-disappointment-2024-11-24/', 'other', 1, 'Baku', 'COP29', 'marina-critica-cop29-b111-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes ataca Marina Silva sobre fogos no Pantanal.', 'Marina Silva e a culpada pelos incendios no Pantanal. Veta desmatamento, mas nao combate fogo. Precisa sair do MMA.', 'Entrevista em Cuiaba em setembro de 2024.', 'verified', true, '2024-09-25', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/09/25/mauro-mendes-marina-pantanal.ghtml', 'news_article', 3, 'Cuiaba', 'Entrevista', 'mauro-mendes-pantanal-marina-b111-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva responde Mauro Mendes sobre fogos no Pantanal.', 'O Mauro Mendes e um dos governadores que menos cooperaram. Seca historica e crime. Culpar MMA e desvio de foco.', 'Coletiva em Cuiaba em setembro de 2024.', 'verified', false, '2024-09-28', 'https://www.mongabay.com/2024/09/marina-silva-responds-pantanal-mauro-mendes/', 'news_article', 1, 'Cuiaba', 'Coletiva', 'marina-responde-mauro-pantanal-b111-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro celebra queimadas como obra da natureza.', 'Esse fogo no Pantanal e obra da natureza, nao do homem. Lula e Marina querem culpar pecuaristas. Mas a verdade incomoda.', 'Entrevista em setembro de 2024.', 'verified', true, '2024-09-15', 'https://www1.folha.uol.com.br/ambiente/2024/09/bolsonaro-pantanal-natureza.shtml', 'news_article', 5, 'Brasilia', 'Entrevista', 'bolsonaro-pantanal-natureza-b111-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara denuncia queimadas criminosas na Amazonia.', 'Essas queimadas nao sao naturais. Sao criminosas. Precisamos de operacoes federais nos estados que protegem fazendeiro.', 'Coletiva em Manaus em setembro de 2024.', 'verified', false, '2024-09-20', 'https://apiboficial.org/2024/09/20/queimadas-criminosas-guajajara/', 'other', 1, 'Manaus', 'MPI', 'guajajara-queimadas-criminosas-b111-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima minimiza fumaca que tomou Manaus em 2024.', 'Essa historia de fumaca e sensacionalismo. Manaus vive dessas estacoes de ano. Imprensa e MMA inflam a tragedia.', 'Coletiva em Manaus em outubro de 2024.', 'verified', false, '2024-10-05', 'https://g1.globo.com/am/amazonas/noticia/2024/10/05/wilson-lima-fumaca-manaus.ghtml', 'news_article', 4, 'Manaus', 'Palacio Amazonas', 'wilson-fumaca-minimiza-b111-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli defende queima de palha em acordo com agro.', 'Queimada controlada e parte da agricultura. Nao podemos demonizar o produtor acreano. Clima de guerra ao agro precisa acabar.', 'Entrevista em Rio Branco em agosto de 2024.', 'verified', false, '2024-08-18', 'https://ac24horas.com/2024/08/gladson-queimada-palha/', 'news_article', 3, 'Rio Branco', 'Entrevista', 'gladson-queima-palha-b111-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho anuncia obras de acesso a Belem para COP30.', 'As obras de acesso a Belem avancam. Aeroporto, hoteis, alca viaria. Belem estara pronta para receber o mundo em novembro.', 'Coletiva em Belem em janeiro de 2025.', 'verified', false, '2025-01-20', 'https://g1.globo.com/pa/para/noticia/2025/01/20/helder-obras-cop30.ghtml', 'news_article', 1, 'Belem', 'Palacio Para', 'helder-obras-acesso-cop30-b111-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Fernando Haddad lanca Plano de Transformacao Ecologica.', 'O Plano de Transformacao Ecologica sera o legado economico da COP30. Verde e desenvolvimento. Nao ha contradicao.', 'Coletiva do Ministerio da Fazenda em agosto de 2023.', 'verified', false, '2023-08-18', 'https://www.gov.br/fazenda/pt-br/noticias/haddad-transformacao-ecologica', 'other', 1, 'Brasilia', 'Fazenda', 'haddad-transformacao-ecologica-b111-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Geraldo Alckmin promete bioeconomia como motor da COP30.', 'Bioeconomia amazonica e agenda presidencial. Cacau, castanha, acai, farmacia da floresta. Vamos transformar em rota de desenvolvimento.', 'Evento em Manaus em maio de 2024.', 'verified', false, '2024-05-18', 'https://www.gov.br/mdic/pt-br/noticias/alckmin-bioeconomia-cop30', 'other', 1, 'Manaus', 'MDIC', 'alckmin-bioeconomia-motor-b111-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira anuncia diplomacia climatica como prioridade do Itamaraty.', 'O Itamaraty retomou agenda climatica. Clima e geopolitica. O Brasil volta a liderar negociacoes internacionais.', 'Coletiva no Itamaraty em marco de 2023.', 'verified', false, '2023-03-22', 'https://www.gov.br/mre/pt-br/canais_atendimento/imprensa/notas-a-imprensa/mauro-vieira-agenda-climatica', 'other', 1, 'Brasilia', 'Itamaraty', 'mauro-vieira-diplomacia-climatica-b111-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem diz que COP30 e farsa esquerdista.', 'COP30 e farsa. Vao gastar bilhoes com politica identitaria de indio e ONG. Enquanto isso, brasileiro nao tem saude.', 'Discurso na Camara em novembro de 2024.', 'verified', false, '2024-11-15', 'https://www.camara.leg.br/noticias/van-hattem-cop30-farsa', 'other', 3, 'Brasilia', 'Camara', 'van-hattem-cop30-farsa-b111-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves diz que COP30 vai atacar familia tradicional.', 'A COP30 vai trazer agenda globalista de genero e ideologia. Precisamos proteger familia tradicional. Vou monitorar.', 'Entrevista em Brasilia em junho de 2025.', 'verified', false, '2025-06-18', 'https://www12.senado.leg.br/noticias/materias/2025/06/18/damares-cop30-familia', 'other', 4, 'Brasilia', 'Senado', 'damares-cop30-familia-b111-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva lanca Plano Clima 2035 antes da COP30.', 'Apresentamos o Plano Clima 2035. Meta de 67% de reducao de emissoes ate 2035. E NDC ambiciosa, compativel com 1,5 grau.', 'Coletiva no MMA em setembro de 2025 antes da COP30.', 'verified', true, '2025-09-18', 'https://www.climatechangenews.com/2025/09/brazil-ndc-plano-clima-2035/', 'other', 1, 'Brasilia', 'MMA', 'marina-plano-clima-2035-b111-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula abre a COP30 em Belem em novembro de 2025.', 'Bem-vindos a Belem. Esta e a COP30, a COP da verdade. Aqui nao ha mais espaco para greenwashing. O mundo precisa entregar.', 'Discurso de abertura da COP30 em Belem em novembro de 2025.', 'verified', true, '2025-11-10', 'https://www.reuters.com/sustainability/climate-energy/lula-opens-cop30-belem-2025-11-10/', 'other', 1, 'Belem', 'COP30', 'lula-abre-cop30-b111-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia Fundo Florestas Tropicais na COP30.', 'O Fundo Florestas Tropicais Para Sempre e lancado hoje. Paises florestais unidos. 125 bilhoes para conservacao permanente.', 'Discurso na COP30 em Belem em novembro de 2025.', 'verified', true, '2025-11-12', 'https://www.climatechangenews.com/2025/11/tropical-forests-fund-cop30/', 'other', 1, 'Belem', 'COP30', 'marina-fundo-florestas-b111-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara discursa na COP30 pelos povos da floresta.', 'Sem nos nao ha COP. Os povos da floresta guardam o mundo. Nao aceitamos mais decisoes feitas sem indigenas na mesa.', 'Discurso na COP30 em Belem em novembro de 2025.', 'verified', true, '2025-11-11', 'https://www.survivalinternational.org/news/2025/guajajara-cop30-speech', 'other', 1, 'Belem', 'COP30', 'guajajara-cop30-discurso-b111-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende Plano Transformacao Ecologica na COP30.', 'Apresentamos agenda de investimentos verdes. Brasil pode ser hub global de bioeconomia. E oportunidade historica.', 'Discurso na COP30 em novembro de 2025.', 'verified', false, '2025-11-13', 'https://www.gov.br/mdic/pt-br/noticias/tebet-cop30-verde', 'other', 1, 'Belem', 'COP30', 'tebet-cop30-plano-verde-b111-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz que nao pisa em Belem durante COP30.', 'Eu nao piso em Belem enquanto tiver esse circo globalista. COP e farsa, vergonha para o Brasil. Lula se vende.', 'Live em novembro de 2025 durante a COP30.', 'verified', true, '2025-11-08', 'https://x.com/jairbolsonaro/status/bolsonaro-nao-pisa-belem-cop30', 'social_media_post', 4, 'Online', 'X Live', 'bolsonaro-nao-pisa-belem-b111-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro protesta nos EUA contra COP30.', 'Estou em Washington denunciando o roubo climatico do Lula. A COP30 em Belem e farsa, Brasil nao vai ser carbon vendor.', 'Video em novembro de 2025 em Washington.', 'verified', false, '2025-11-07', 'https://www.youtube.com/watch?v=eduardo-washington-cop30', 'social_media_post', 4, 'Washington', 'Video', 'eduardo-washington-cop30-b111-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva critica EUA por baixa ambicao climatica na COP30.', 'Os EUA precisam assumir lideranca. 1,5 grau exige mais. Nao aceitamos recuo de potencia historica. O mundo cobra.', 'Coletiva na COP30 em novembro de 2025.', 'verified', true, '2025-11-14', 'https://www.reuters.com/sustainability/climate-energy/marina-silva-us-cop30-2025-11-14/', 'other', 1, 'Belem', 'COP30', 'marina-critica-eua-cop30-b111-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral apoia agenda climatica na pre-COP30.', 'A pauta climatica e do Brasil inteiro. Apoio a COP30, mas o governo precisa entregar mais do que discurso. Paes federais faltam.', 'Entrevista em setembro de 2025.', 'verified', false, '2025-09-20', 'https://www1.folha.uol.com.br/ambiente/2025/09/tabata-cop30-apoio.shtml', 'news_article', 1, 'Sao Paulo', 'Folha', 'tabata-pre-cop30-b111-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton promove agenda LGBT+ na COP30.', 'COP30 deve incluir justica climatica e justica racial e de genero. LGBT+ tambem sofrem com crise climatica. Nao ficaremos invisiveis.', 'Evento na COP30 em novembro de 2025.', 'verified', false, '2025-11-15', 'https://www.survivalinternational.org/news/2025/erika-hilton-cop30-lgbt', 'other', 1, 'Belem', 'COP30', 'erika-hilton-cop30-lgbt-b111-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano critica agenda LGBT+ na COP30.', 'A COP30 ja virou festival de pauta LGBT. Esquerda quer aproveitar evento climatico para impor ideologia. Denuncio.', 'Discurso na Camara em novembro de 2025.', 'verified', false, '2025-11-18', 'https://www.camara.leg.br/noticias/feliciano-cop30-lgbt', 'other', 4, 'Brasilia', 'Camara', 'feliciano-cop30-lgbt-b111-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fecha acordo bilionario na COP30.', 'Saimos de Belem com 200 bilhoes em compromissos novos para florestas e transicao. Foi a COP mais concreta da historia.', 'Coletiva encerramento COP30 em novembro de 2025.', 'verified', true, '2025-11-21', 'https://www.reuters.com/sustainability/climate-energy/lula-cop30-deal-2025-11-21/', 'other', 1, 'Belem', 'COP30 Encerramento', 'lula-acordo-cop30-b111-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva diz que COP30 foi sucesso com ressalvas.', 'A COP30 entregou muito, mas nao tudo. Combustiveis fosseis ainda escaparam. Precisamos seguir lutando.', 'Coletiva em Belem em novembro de 2025.', 'verified', true, '2025-11-22', 'https://www.climatechangenews.com/2025/11/marina-silva-cop30-balance/', 'other', 1, 'Belem', 'COP30', 'marina-balanco-cop30-b111-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard comemora licenca Foz do Amazonas em 2025.', 'Finalmente Ibama liberou licenca para Foz do Amazonas. Vamos perfurar. E vitoria da Petrobras e do Brasil.', 'Coletiva no Rio em outubro de 2025 apos decisao do Ibama.', 'verified', true, '2025-10-20', 'https://valor.globo.com/empresas/noticia/2025/10/20/magda-licenca-foz-amazonas.ghtml', 'other', 4, 'Rio de Janeiro', 'Petrobras', 'magda-licenca-foz-2025-b111-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva critica perda de credibilidade com Foz do Amazonas.', 'Liberar Foz do Amazonas as vesperas da COP30 afeta nossa credibilidade. E contradicao. Vou continuar dizendo.', 'Entrevista ao Mongabay em outubro de 2025.', 'verified', true, '2025-10-25', 'https://www.mongabay.com/2025/10/marina-silva-foz-amazonas-credibility/', 'news_article', 2, 'Brasilia', 'MMA', 'marina-credibilidade-foz-b111-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho comemora licenca para Margem Equatorial.', 'Vitoria para o Para. Comecamos perfuracao na Margem Equatorial. Royalties chegam e a regiao se desenvolve com sustentabilidade.', 'Coletiva em Belem em outubro de 2025.', 'verified', true, '2025-10-22', 'https://g1.globo.com/pa/para/noticia/2025/10/22/helder-foz-licenca.ghtml', 'other', 3, 'Belem', 'Palacio Para', 'helder-licenca-foz-b111-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jpp, 'Jean Paul Prates defende legado em artigo.', 'Meu legado na Petrobras foi o combate ao desmatamento com P&D verde. Margem Equatorial nao foi minha obsessao. Foi tecnica.', 'Artigo de opiniao em outubro de 2025.', 'verified', false, '2025-10-28', 'https://valor.globo.com/opiniao/coluna/2025/10/28/prates-legado-petrobras.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Valor', 'prates-legado-artigo-b111-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende Operacao Escudo Ambiental.', 'A Operacao Escudo Ambiental protege a Amazonia. PF, Ibama, Forcas Armadas juntos. Garimpeiro e madeireiro nao tem tregua.', 'Coletiva no MJSP em junho de 2024.', 'verified', false, '2024-06-25', 'https://www.gov.br/mj/pt-br/noticias/lewandowski-escudo-ambiental', 'other', 1, 'Brasilia', 'MJSP', 'lewandowski-escudo-ambiental-b111-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Jose Mucio defende atuacao das Forcas Armadas na Amazonia.', 'As FA estao cumprindo missao constitucional na Amazonia. Protegem fronteiras, combatem garimpo ilegal. Nao aceitamos criticas injustas.', 'Coletiva no Min Defesa em setembro de 2024.', 'verified', false, '2024-09-08', 'https://www.gov.br/defesa/pt-br/noticias/mucio-fa-amazonia', 'other', 1, 'Brasilia', 'Defesa', 'mucio-fa-amazonia-b111-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Favaro defende PL que reduz areas de protecao.', 'O PL da Reserva Legal moderniza. Produtor ja preserva o suficiente. Nao podemos engessar o agro brasileiro.', 'Audiencia no Senado em abril de 2024.', 'verified', false, '2024-04-22', 'https://www12.senado.leg.br/noticias/materias/2024/04/22/favaro-reserva-legal-pl', 'other', 3, 'Brasilia', 'Senado', 'favaro-pl-reserva-legal-b111-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva critica PL do Licenciamento como desmonte.', 'O PL do Licenciamento Ambiental e desmonte. Liberacao automatica de licenca e irresponsavel. PCdoB vota contra.', 'Discurso na Camara em novembro de 2024.', 'verified', false, '2024-11-20', 'https://www.camara.leg.br/noticias/orlando-pl-licenciamento', 'other', 1, 'Brasilia', 'Camara', 'orlando-pl-licenciamento-b111-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira articula aprovacao do PL do Licenciamento em 2024.', 'Vamos aprovar o PL do Licenciamento. E demanda do setor produtivo. Nao podemos travar o Brasil por burocracia ambiental.', 'Entrevista em Brasilia em novembro de 2024.', 'verified', false, '2024-11-25', 'https://www.camara.leg.br/noticias/lira-pl-licenciamento', 'other', 3, 'Brasilia', 'Camara', 'lira-pl-licenciamento-b111-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Samia Bomfim ataca PL do Licenciamento como desmonte ambiental.', 'Esse PL do Licenciamento e o maior retrocesso ambiental em 40 anos. Congresso ruralista votou. Lula precisa vetar.', 'Discurso na Camara em marco de 2024.', 'verified', false, '2024-03-06', 'https://www.camara.leg.br/noticias/samia-bomfim-licenciamento', 'other', 1, 'Brasilia', 'Camara', 'samia-ataca-pl-licenciamento-b111-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula veta parcialmente PL do Licenciamento em 2025.', 'Vetei os pontos mais graves do PL do Licenciamento. Defendo licenciamento eficiente, mas nao desmonte. Meio ambiente continua protegido.', 'Coletiva em Brasilia em agosto de 2025.', 'verified', true, '2025-08-08', 'https://www.reuters.com/world/americas/lula-vetoes-parts-environmental-licensing-2025-08-08/', 'other', 1, 'Brasilia', 'Planalto', 'lula-veta-pl-licenciamento-b111-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta articula derrubada do veto de Lula em 2025.', 'Vamos derrubar o veto do Lula. O PL do Licenciamento e vontade do Congresso. STF e Planalto nao podem bloquear.', 'Entrevista em Brasilia em setembro de 2025.', 'verified', true, '2025-09-10', 'https://www.camara.leg.br/noticias/motta-derruba-veto-licenciamento', 'other', 3, 'Brasilia', 'Camara', 'motta-derruba-veto-licenciamento-b111-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva alerta para impacto de derrubada de veto.', 'Derrubar veto ao PL do Licenciamento seria tragedia ambiental. Parlamentares serao responsaveis historicamente.', 'Coletiva no MMA em setembro de 2025.', 'verified', true, '2025-09-15', 'https://www.mongabay.com/2025/09/marina-silva-vetoes-warning-licensing/', 'other', 1, 'Brasilia', 'MMA', 'marina-alerta-derrubada-veto-b111-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina lidera voto pela derrubada do veto no Senado.', 'O PL do Licenciamento e prioridade do agro. Vamos derrubar veto. O produtor nao pode mais esperar pela nova burocracia.', 'Sessao no Senado em setembro de 2025.', 'verified', true, '2025-09-22', 'https://www12.senado.leg.br/noticias/materias/2025/09/22/tereza-veto-licenciamento', 'other', 3, 'Brasilia', 'Senado', 'tereza-veto-licenciamento-b111-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia demissao ameacada apos derrubada em 2025.', 'Se derrubarem veto, minha posicao no governo fica insustentavel. Nao podemos aceitar desmonte ambiental.', 'Entrevista em Brasilia em setembro de 2025.', 'verified', true, '2025-09-25', 'https://www.reuters.com/world/americas/marina-silva-resignation-threat-licensing-2025-09-25/', 'news_article', 1, 'Brasilia', 'MMA', 'marina-ameaca-demissao-b111-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin suspende trechos do PL do Licenciamento.', 'Concedo liminar que suspende os trechos mais graves do PL do Licenciamento. Violam direito ao meio ambiente equilibrado.', 'Decisao monocratica no STF em outubro de 2025.', 'verified', true, '2025-10-10', 'https://www.stf.jus.br/portal/noticia/fachin-liminar-pl-licenciamento', 'other', 1, 'Brasilia', 'STF', 'fachin-suspende-pl-licenciamento-b111-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Fachin por liminar ambiental.', 'Fachin e ditador togado. Viola decisao do Congresso. STF passa dos limites. Vai fechar STF? O povo e soberano.', 'Tweet em outubro de 2025.', 'verified', false, '2025-10-12', 'https://x.com/nikolas_dm/status/nikolas-ataca-fachin-liminar', 'social_media_post', 4, 'Online', 'Twitter', 'nikolas-ataca-fachin-liminar-b111-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes defende decisao sobre licenciamento.', 'O STF cumpre funcao constitucional. Se lei viola direito fundamental ao meio ambiente, cabe intervencao. Nada de novo.', 'Entrevista em outubro de 2025.', 'verified', false, '2025-10-15', 'https://www.stf.jus.br/portal/noticia/moraes-licenciamento-entrevista', 'other', 1, 'Brasilia', 'STF', 'moraes-licenciamento-b111-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima promove expansao de hidrovias na Amazonia.', 'Amazonia precisa de desenvolvimento. Hidrovias sao essenciais. Nao aceitamos mais travas ambientais para porto e navegacao.', 'Entrevista em Manaus em agosto de 2024.', 'verified', false, '2024-08-30', 'https://g1.globo.com/am/amazonas/noticia/2024/08/30/wilson-lima-hidrovias.ghtml', 'news_article', 3, 'Manaus', 'Palacio Amazonas', 'wilson-hidrovias-b111-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clecio Luis anuncia primeiro parque solar comunitario do Amapa.', 'O Amapa lanca energia solar comunitaria em TI Uaca. Exemplo de transicao energetica justa. Indigenas protagonistas.', 'Coletiva em Macapa em outubro de 2024.', 'verified', false, '2024-10-15', 'https://g1.globo.com/ap/amapa/noticia/2024/10/15/clecio-solar-ti-uaca.ghtml', 'other', 1, 'Macapa', 'Palacio Amapa', 'clecio-solar-ti-b111-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wba, 'Wanderlei Barbosa critica restricoes ao cerrado.', 'O cerrado tocantinense nao pode virar reserva. Agro nacional depende do cerrado. Marina Silva nao entende.', 'Entrevista em Palmas em maio de 2025.', 'verified', false, '2025-05-10', 'https://g1.globo.com/to/tocantins/noticia/2025/05/10/wanderlei-cerrado.ghtml', 'news_article', 3, 'Palmas', 'Palacio Tocantins', 'wanderlei-cerrado-b111-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antonio Denarium ataca fundo climatico como chantagem.', 'Esse Fundo Florestas e chantagem. Querem controlar territorio nacional. Roraima nao vai ficar refem de fundo internacional.', 'Entrevista em Boa Vista em dezembro de 2025.', 'verified', false, '2025-12-10', 'https://www.reuters.com/world/americas/denarium-attacks-forests-fund-2025-12-10/', 'news_article', 4, 'Boa Vista', 'Entrevista', 'denarium-fundo-chantagem-b111-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli pede credito para madeireiras no Acre.', 'O Acre precisa de credito para madeireiras legais. Proibir nao resolve. Precisamos regularizar producao.', 'Entrevista em Rio Branco em marco de 2025.', 'verified', false, '2025-03-18', 'https://ac24horas.com/2025/03/gladson-credito-madeireiras/', 'news_article', 3, 'Rio Branco', 'Entrevista', 'gladson-credito-madeireiras-b111-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes defende derrubada em MT como progresso.', 'Mato Grosso e celeiro. Desmatamento controlado faz parte do progresso. Nao e crime, e economia.', 'Entrevista em Cuiaba em julho de 2025.', 'verified', false, '2025-07-08', 'https://g1.globo.com/mt/mato-grosso/noticia/2025/07/08/mauro-mendes-desmatamento-economia.ghtml', 'news_article', 4, 'Cuiaba', 'Palacio MT', 'mauro-desmatamento-economia-b111-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia mais 100 mil hectares de UCs em 2025.', 'Criamos mais 100 mil hectares de Unidades de Conservacao. E nossa contribuicao concreta para a COP30. Brasil cumpre.', 'Cerimonia em Brasilia em outubro de 2025.', 'verified', true, '2025-10-18', 'https://www.climatechangenews.com/2025/10/brazil-100k-hectares-conservation/', 'other', 1, 'Brasilia', 'Planalto', 'lula-100k-ucs-2025-b111-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Taliria Petrone apoia defesa de territorios quilombolas.', 'A pauta climatica inclui quilombolas. Seus territorios sao guardioes da biodiversidade. Precisamos titulacao urgente.', 'Discurso na Camara em junho de 2024.', 'verified', false, '2024-06-20', 'https://www.camara.leg.br/noticias/taliria-quilombolas', 'other', 1, 'Brasilia', 'Camara', 'taliria-quilombolas-b111-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cal, 'Chico Alencar defende Amazonia como patrimonio global.', 'Amazonia e patrimonio da humanidade, mas a soberania e brasileira. Devemos proteger, nao internacionalizar, mas tambem nao destruir.', 'Discurso na Camara em marco de 2024.', 'verified', false, '2024-03-15', 'https://www.camara.leg.br/noticias/chico-amazonia-patrimonio', 'other', 1, 'Brasilia', 'Camara', 'chico-amazonia-patrimonio-b111-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende BNDES verde no Congresso.', 'Apoiamos o BNDES verde. Transicao climatica precisa de financiamento publico robusto. PCdoB vota favoravel.', 'Discurso no Senado em outubro de 2024.', 'verified', false, '2024-10-28', 'https://www12.senado.leg.br/noticias/materias/2024/10/28/jandira-bndes-verde', 'other', 1, 'Brasilia', 'Senado', 'jandira-bndes-verde-b111-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_asi, 'Alexandre Silveira anuncia leilao de transmissao sustentavel.', 'O leilao de transmissao em 2024 foi o maior da historia. R$ 70 bilhoes em linhas renovaveis. Transicao energetica e prioridade.', 'Coletiva em Brasilia em outubro de 2024.', 'verified', false, '2024-10-30', 'https://www.gov.br/mme/pt-br/noticias/silveira-leilao-transmissao', 'other', 1, 'Brasilia', 'MME', 'silveira-leilao-transmissao-b111-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nisia Trindade liga clima e saude em preparacao COP30.', 'Clima e saude publica. Aumento de dengue, mortalidade por calor, fumaca. Na COP30 o SUS sera exemplo de adaptacao.', 'Seminario em Brasilia em maio de 2025.', 'verified', false, '2025-05-12', 'https://www.gov.br/saude/pt-br/noticias/nisia-clima-saude-cop30', 'other', 1, 'Brasilia', 'Saude', 'nisia-clima-saude-cop30-b111-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha articula agenda COP30 no Congresso.', 'Vamos dialogar com Congresso para garantir agenda positiva na COP30. Nao podemos ter recuos em meio a conferencia.', 'Entrevista em Brasilia em agosto de 2025.', 'verified', false, '2025-08-18', 'https://www.gov.br/secom/pt-br/noticias/padilha-agenda-cop30', 'other', 1, 'Brasilia', 'Planalto', 'padilha-agenda-cop30-b111-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende obras estruturais na Amazonia.', 'A Amazonia precisa de infraestrutura. PAC com Ferrograo, hidrovias e estradas. Tudo com licenca ambiental rigorosa.', 'Coletiva em Brasilia em setembro de 2024.', 'verified', false, '2024-09-15', 'https://www.gov.br/planalto/pt-br/noticias/rui-pac-amazonia', 'other', 2, 'Brasilia', 'Casa Civil', 'rui-pac-amazonia-b111-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Aloizio Mercadante destrava R$ 50 bi do BNDES para clima.', 'O BNDES libera R$ 50 bilhoes para transicao climatica. Energia renovavel, mobilidade verde, reflorestamento. Agenda ESG virou economia real.', 'Coletiva no BNDES em marco de 2025.', 'verified', false, '2025-03-08', 'https://www.bndes.gov.br/mercadante-50bi-clima', 'other', 1, 'Rio de Janeiro', 'BNDES', 'mercadante-50bi-clima-b111-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva sanciona politica nacional de bioeconomia em 2024.', 'Politica Nacional de Bioeconomia e lei. Vamos valorizar os produtos da floresta em pe. Castanha, cacau, acai tem mercado.', 'Cerimonia no Planalto em setembro de 2024.', 'verified', true, '2024-09-16', 'https://www.mongabay.com/2024/09/brazil-bioeconomy-law/', 'other', 1, 'Brasilia', 'Planalto', 'marina-bioeconomia-lei-b111-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz que fechara Fundo Amazonia se voltar.', 'Quando voltar, primeiro ato e fechar Fundo Amazonia. E dinheiro estrangeiro para invadir a soberania. Nao aceito.', 'Comicio em outubro de 2025.', 'verified', true, '2025-10-15', 'https://www1.folha.uol.com.br/poder/2025/10/bolsonaro-fechara-fundo-amazonia.shtml', 'other', 5, 'Rio de Janeiro', 'Comicio', 'bolsonaro-fechara-fundo-b111-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro ataca ONU e COP30 como globalismo.', 'ONU e COP30 sao projetos globalistas. Querem controlar Amazonia em nome de clima. E soft power gringo contra o Brasil.', 'Live em julho de 2025.', 'verified', false, '2025-07-22', 'https://x.com/BolsonaroSP/status/eduardo-onu-cop30-globalismo', 'social_media_post', 4, 'Online', 'Twitter', 'eduardo-onu-cop30-globalismo-b111-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin vota para manter obrigacoes de licenciamento.', 'Voto pela suspensao integral dos pontos que fragilizam o licenciamento. O meio ambiente esta na Constituicao.', 'Julgamento no STF em novembro de 2025.', 'verified', false, '2025-11-05', 'https://www.stf.jus.br/portal/noticia/zanin-licenciamento-voto', 'other', 1, 'Brasilia', 'STF', 'zanin-licenciamento-voto-b111-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes valida parte do PL do Licenciamento em voto.', 'Voto parcialmente para manter modernizacao do licenciamento. Ha pontos dos quais discordo. Nem tudo e inconstitucional.', 'Julgamento no STF em novembro de 2025.', 'verified', false, '2025-11-06', 'https://www.stf.jus.br/portal/noticia/gilmar-licenciamento-voto', 'other', 2, 'Brasilia', 'STF', 'gilmar-licenciamento-voto-b111-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lucia vota pela maxima protecao ambiental.', 'Voto pela integral protecao ambiental. Direito fundamental exige legislacao robusta. Congresso excedeu limites.', 'Julgamento no STF em novembro de 2025.', 'verified', false, '2025-11-06', 'https://www.stf.jus.br/portal/noticia/carmen-licenciamento-voto', 'other', 1, 'Brasilia', 'STF', 'carmen-licenciamento-voto-b111-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flavio Dino articula voto pela protecao ambiental no STF.', 'O direito ao meio ambiente equilibrado e intergeneracional. Constituicao nos obriga. Voto pela inconstitucionalidade das facilitacoes.', 'Julgamento no STF em novembro de 2025.', 'verified', false, '2025-11-07', 'https://www.stf.jus.br/portal/noticia/dino-licenciamento-voto', 'other', 1, 'Brasilia', 'STF', 'dino-licenciamento-voto-b111-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho recebe elogios por gestao da COP30 em Belem.', 'Belem entregou uma COP memoravel. O Para mostrou capacidade. Sera referencia para proximos eventos globais.', 'Coletiva em Belem em novembro de 2025.', 'verified', false, '2025-11-25', 'https://g1.globo.com/pa/para/noticia/2025/11/25/helder-balanco-cop30.ghtml', 'news_article', 1, 'Belem', 'Palacio Para', 'helder-balanco-cop30-b111-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia recorde de queda no desmatamento em 2025.', 'Desmatamento na Amazonia caiu 70% em relacao a 2022. Meta zero em 2030 esta ao alcance. Estado presente funciona.', 'Coletiva em Brasilia em agosto de 2025.', 'verified', true, '2025-08-07', 'https://www.reuters.com/sustainability/climate-energy/brazil-deforestation-70-percent-2025-08-07/', 'other', 1, 'Brasilia', 'Planalto', 'lula-recorde-queda-desmatamento-b111-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles questiona metodologia de dados do Inpe.', 'Esses numeros do Inpe sao ajustados. Ninguem mede desmatamento assim no mundo. E narrativa para agradar gringo.', 'Podcast em agosto de 2025.', 'verified', false, '2025-08-12', 'https://www.youtube.com/watch?v=salles-questiona-inpe-2025', 'social_media_post', 4, 'Online', 'Podcast', 'salles-questiona-inpe-2025-b111-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva defende metodologia do Prodes contra ataques.', 'O Prodes e referencia mundial. 40 anos de ciencia. Quem ataca o Inpe e contra o Brasil. Defendo nossa inteligencia ambiental.', 'Coletiva em setembro de 2025.', 'verified', false, '2025-09-02', 'https://www.mongabay.com/2025/09/marina-silva-defends-inpe-prodes/', 'other', 1, 'Brasilia', 'MMA', 'marina-defende-prodes-b111-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano ataca Marina por suposta pauta anticrista na COP30.', 'Marina Silva quer reeducar o brasileiro na pauta climatica. Isso e ideologia religiosa verde. Nao aceitamos.', 'Discurso em culto em marco de 2025.', 'verified', false, '2025-03-22', 'https://www.camara.leg.br/noticias/feliciano-ataca-marina-2025', 'other', 4, 'Brasilia', 'Culto', 'feliciano-ataca-marina-2025-b111-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral apoia mercado regulado de carbono.', 'O PL do mercado de carbono e avanco. Mas precisa proteger povos indigenas e quilombolas. Apoio com ajustes.', 'Discurso na Camara em novembro de 2024.', 'verified', false, '2024-11-28', 'https://www.camara.leg.br/noticias/tabata-mercado-carbono', 'other', 1, 'Brasilia', 'Camara', 'tabata-mercado-carbono-b111-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona Lei do Mercado de Carbono.', 'Sancionei a lei. O Brasil entra no mercado global de carbono. E oportunidade de bilhoes para florestas em pe.', 'Cerimonia no Planalto em dezembro de 2024.', 'verified', true, '2024-12-12', 'https://www.climatechangenews.com/2024/12/brazil-carbon-market-law/', 'other', 1, 'Brasilia', 'Planalto', 'lula-mercado-carbono-b111-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara pede salvaguardas a indigenas no mercado de carbono.', 'Mercado de carbono sem consulta a indigenas e violacao. Precisamos de salvaguardas em TIs. Nao aceitamos grilagem verde.', 'Coletiva em Brasilia em dezembro de 2024.', 'verified', true, '2024-12-15', 'https://apiboficial.org/2024/12/15/guajajara-carbono-salvaguardas/', 'other', 1, 'Brasilia', 'MPI', 'guajajara-carbono-salvaguardas-b111-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro afirma que clima e pauta de esquerda.', 'Essa pauta climatica e esquerda. Virou religiao de ateu. O brasileiro comum nao ve diferenca no tempo. E desculpa para taxar mais.', 'Entrevista em junho de 2025.', 'verified', true, '2025-06-18', 'https://www1.folha.uol.com.br/ambiente/2025/06/bolsonaro-clima-esquerda.shtml', 'news_article', 5, 'Sao Paulo', 'Entrevista', 'bolsonaro-clima-esquerda-b111-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende Carbono Zero Brasil para investidores.', 'O Carbono Zero Brasil atrai R$ 500 bi em investimentos ate 2030. Nao e ideologia, e economia. O mercado quer ESG.', 'Evento em Sao Paulo em julho de 2025.', 'verified', false, '2025-07-10', 'https://www.gov.br/mdic/pt-br/noticias/tebet-carbono-zero', 'other', 1, 'Sao Paulo', 'Fiesp', 'tebet-carbono-zero-b111-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Aloizio Mercadante apoia nova politica industrial verde.', 'A nova politica industrial brasileira e verde. Veiculo eletrico, hidrogenio verde, industria 4.0 sustentavel. BNDES na linha de frente.', 'Coletiva no BNDES em fevereiro de 2024.', 'verified', false, '2024-02-22', 'https://www.bndes.gov.br/mercadante-industria-verde', 'other', 1, 'Rio de Janeiro', 'BNDES', 'mercadante-industria-verde-b111-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_asi, 'Alexandre Silveira anuncia hidrogenio verde como prioridade.', 'Hidrogenio verde sera commodity brasileira. Pecem no Ceara lidera. Bilhoes em investimento atraidos. Transicao funciona.', 'Evento em Fortaleza em outubro de 2024.', 'verified', false, '2024-10-08', 'https://www.gov.br/mme/pt-br/noticias/silveira-hidrogenio-verde', 'other', 1, 'Fortaleza', 'MME', 'silveira-hidrogenio-verde-b111-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem critica programa de veiculos eletricos.', 'Esse programa de veiculo eletrico e caro e elitista. So beneficia Tesla e importados. Povo anda de onibus sucateado.', 'Discurso na Camara em agosto de 2024.', 'verified', false, '2024-08-15', 'https://www.camara.leg.br/noticias/van-hattem-veiculo-eletrico', 'other', 2, 'Brasilia', 'Camara', 'van-hattem-veiculo-eletrico-b111-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira zomba de carro eletrico em pauta de esquerda.', 'Lula quer obrigar o brasileiro a ter Tesla. Carro eletrico e luxo de rico. Isso e ideologia pagando conta do povo.', 'Tweet em julho de 2024.', 'verified', false, '2024-07-18', 'https://x.com/nikolas_dm/status/nikolas-tesla-pobre', 'social_media_post', 3, 'Online', 'Twitter', 'nikolas-tesla-pobre-b111-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comemora acordo Mercosul-UE com capitulo ambiental.', 'Mercosul-UE assinado com capitulo ambiental. Mostra que Brasil e parceiro verde confiavel. Exportacao respeita floresta.', 'Coletiva em Brasilia em dezembro de 2024.', 'verified', true, '2024-12-06', 'https://www.reuters.com/world/americas/lula-mercosur-eu-environmental-2024-12-06/', 'other', 1, 'Montevideu', 'Cupula Mercosul', 'lula-mercosul-ue-b111-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro ataca Mercosul-UE como entreguismo.', 'Mercosul-UE e entreguismo. Europa impoe regras ambientais absurdas e Brasil perde soberania. Voltaremos a rever.', 'Live em dezembro de 2024.', 'verified', false, '2024-12-10', 'https://www.youtube.com/watch?v=eduardo-mercosul-entreguismo', 'social_media_post', 4, 'Online', 'Youtube Live', 'eduardo-mercosul-entreguismo-b111-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva defende legado ambiental em balanco de 2026.', 'Em 3 anos entregamos reducao recorde no desmatamento, COP30, Fundo Florestas e transicao energetica. Brasil volta ao topo.', 'Entrevista em janeiro de 2026.', 'verified', true, '2026-01-12', 'https://www.mongabay.com/2026/01/marina-silva-legacy-interview/', 'news_article', 1, 'Brasilia', 'MMA', 'marina-legado-2026-b111-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro promete rever acordos climaticos se voltar.', 'Meu primeiro ato e sair do Acordo de Paris, fechar COP, fechar Fundo Amazonia. O Brasil nao sera mais reserva gringa.', 'Comicio em Sao Paulo em marco de 2026.', 'verified', true, '2026-03-15', 'https://www1.folha.uol.com.br/poder/2026/03/bolsonaro-sair-paris-campanha.shtml', 'other', 5, 'Sao Paulo', 'Comicio', 'bolsonaro-sair-paris-campanha-b111-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende continuidade de agenda climatica na campanha 2026.', 'Nao vamos retroceder. O Brasil verde que reconstruimos e compromisso. Meu adversario quer destruir. Povo decide em outubro.', 'Comicio em Belem em abril de 2026.', 'verified', true, '2026-04-12', 'https://www.reuters.com/world/americas/lula-campaign-climate-2026-04-12/', 'other', 1, 'Belem', 'Comicio', 'lula-continuidade-climatica-2026-b111-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
