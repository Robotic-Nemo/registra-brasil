-- Batch 104: Campanha eleitoral 2022 - primeiro semestre e pre-campanha (Jan-Jul 2022)
-- 100 statements sobre ataques as urnas, alianca Lula-Alckmin, debate Band com Vera Magalhaes,
-- "tres resultados: prisao, morte ou vitoria", Roberto Jefferson contra PF, lancamentos
DO $$
DECLARE
  v_jair UUID; v_edu UUID; v_fla UUID; v_car UUID; v_dam UUID;
  v_hmo UUID; v_pgu UUID; v_ter UUID; v_mfe UUID; v_mma UUID;
  v_sca UUID; v_zam UUID; v_dsi UUID; v_bia UUID; v_ram UUID;
  v_rje UUID; v_mvh UUID; v_kim UUID; v_nik UUID; v_gir UUID;
  v_jza UUID; v_san UUID; v_fbr UUID; v_cgi UUID; v_lul UUID;
  v_alc UUID; v_had UUID; v_gle UUID; v_jan UUID; v_cir UUID;
  v_teb UUID; v_mar UUID; v_mvi UUID; v_axm UUID; v_gmm UUID;
  v_car2 UUID; v_fac UUID; v_lir UUID; v_pac UUID; v_ren UUID;
  v_hum UUID; v_ott UUID; v_ran UUID; v_sor UUID; v_pab UUID; v_bou UUID;
  c_ant UUID; c_vio UUID; c_des UUID; c_odi UUID; c_abu UUID;
  c_aut UUID; c_neg UUID; c_irr UUID; c_con UUID; c_int UUID;
  c_ame UUID; c_obs UUID; c_hom UUID; c_mac UUID; c_rac UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_pgu FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_mma FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sca FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_rje FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jza FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fbr FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_axm FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gmm FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ott FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_sor FROM politicians WHERE slug = 'soraya-thronicke';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca urnas em live e diz que eleicoes de 2022 podem nao ser confiaveis.', 'Se nao tivermos o voto impresso em 2022, tem um sintoma de que tem algo errado nas eleicoes.', 'Live semanal nas redes sociais em que o presidente voltou a atacar o sistema eleitoral.', 'verified', true, '2022-01-06', 'https://www1.folha.uol.com.br/poder/2022/01/bolsonaro-volta-a-atacar-urnas-em-live-e-diz-que-eleicoes-podem-nao-ser-confiaveis.shtml', 'news_article', 4, 'Brasilia', 'Live semanal', 'bolsonaro-urnas-nao-confiaveis-live-b104-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia que tera Alckmin como vice em chapa historica de centro-esquerda em 2022.', 'Eu e o Alckmin vamos reconstruir o Brasil. Nossa alianca mostra que a democracia esta acima das diferencas ideologicas.', 'Declaracao em entrevista apos reuniao com diretorio do PT que aprovou alianca com PSB.', 'verified', true, '2022-01-13', 'https://g1.globo.com/politica/noticia/2022/01/13/lula-confirma-que-alckmin-sera-seu-vice-em-chapa-para-2022.ghtml', 'news_article', 1, 'Sao Paulo', 'Entrevista coletiva', 'lula-alckmin-vice-chapa-b104-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin deixa o PSDB apos 33 anos e sinaliza alianca com Lula para 2022.', 'Deixo o PSDB com gratidao. O momento exige unir democratas contra o extremismo.', 'Discurso de desfiliacao em ato realizado em Sao Paulo com presenca de lideres do PSB.', 'verified', true, '2021-12-15', 'https://www.estadao.com.br/politica/alckmin-deixa-psdb-apos-33-anos/', 'news_article', 1, 'Sao Paulo', 'Ato de desfiliacao do PSDB', 'alckmin-sai-psdb-b104-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Forcas Armadas podem fazer contagem paralela de votos em 2022.', 'As Forcas Armadas poderao fazer uma contagem paralela dos votos. E uma sugestao que eu apoio.', 'Declaracao a apoiadores na saida do Palacio da Alvorada defendendo papel militar na apuracao.', 'verified', true, '2022-01-20', 'https://www1.folha.uol.com.br/poder/2022/01/bolsonaro-defende-forcas-armadas-em-contagem-paralela-de-votos.shtml', 'news_article', 5, 'Brasilia', 'Cerca do Alvorada', 'bolsonaro-forcas-armadas-contagem-paralela-b104-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin rebate Bolsonaro sobre contagem paralela e diz que so a Justica Eleitoral apura votos.', 'So a Justica Eleitoral tem competencia constitucional para apurar e proclamar os eleitos. Nenhuma outra instituicao.', 'Resposta publica do presidente do TSE em nota oficial apos declaracoes do presidente da Republica.', 'verified', true, '2022-01-21', 'https://www.tse.jus.br/comunicacao/noticias/2022/Janeiro/so-a-justica-eleitoral-apura-e-proclama-eleitos-afirma-presidente-do-tse', 'official_statement', 1, 'Brasilia', 'Nota oficial TSE', 'fachin-rebate-bolsonaro-contagem-b104-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que eleicao de 2022 sera fraudada se nao houver voto impresso.', 'Sem voto impresso, ja sabemos qual sera o resultado: fraude. O povo nao aceitara.', 'Discurso em evento de apoiadores em Sao Paulo defendendo mobilizacao contra o TSE.', 'verified', false, '2022-02-05', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-diz-que-eleicao-sera-fraudada-sem-voto-impresso/', 'news_article', 4, 'Sao Paulo', 'Evento de apoiadores', 'eduardo-fraude-sem-voto-impresso-b104-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz ameaca velada em discurso no Acre e diz que vai "a guerra" se necessario.', 'Se necessario for, iremos a guerra. Nao pretendo deixar o poder se houver fraude.', 'Discurso em evento em Rio Branco com apoiadores durante viagem oficial ao Acre.', 'verified', true, '2022-02-24', 'https://g1.globo.com/politica/noticia/2022/02/24/bolsonaro-ameaca-ir-a-guerra-se-houver-fraude-na-eleicao.ghtml', 'news_article', 5, 'Rio Branco', 'Evento no Acre', 'bolsonaro-ira-guerra-fraude-b104-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli defende auditoria militar das urnas e acusa TSE de esconder fraudes.', 'O TSE esconde a verdade. Precisamos de auditoria militar independente das urnas eletronicas.', 'Discurso no plenario da Camara dos Deputados atacando a Justica Eleitoral.', 'verified', false, '2022-02-15', 'https://www.camara.leg.br/noticias/2022/02/zambelli-auditoria-militar-urnas', 'parliamentary_record', 4, 'Brasilia', 'Plenario da Camara', 'zambelli-auditoria-militar-urnas-b104-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis afirma que urna eletronica nao e auditavel e promete lutar contra TSE.', 'A urna eletronica nao e auditavel. Vamos lutar ate o fim contra essa farsa do TSE.', 'Discurso em evento bolsonarista em Brasilia apos reuniao da CCJ.', 'verified', false, '2022-02-18', 'https://www.poder360.com.br/eleicoes/bia-kicis-urna-nao-e-auditavel/', 'news_article', 4, 'Brasilia', 'Evento bolsonarista', 'bia-kicis-urna-nao-auditavel-b104-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Lula e "cachacinha" em comicio em Chapeco apos invasao russa.', 'O Lula e um cachacinha que nao entende nada do mundo. Foi la na Russia e voltou como pato.', 'Discurso em evento em Chapeco criticando a posicao de Lula sobre guerra na Ucrania.', 'verified', false, '2022-03-12', 'https://www.uol.com.br/eleicoes/2022/bolsonaro-chama-lula-de-cachacinha-chapeco/', 'news_article', 3, 'Chapeco', 'Comicio em Chapeco', 'bolsonaro-lula-cachacinha-b104-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Bolsonaro por posicao ambigua sobre guerra na Ucrania.', 'O Bolsonaro nao sabe onde fica a Ucrania. Eu defendo a paz e o dialogo, nao aventuras belicistas.', 'Entrevista a jornalistas em Sao Paulo apos reuniao com diplomatas europeus.', 'verified', false, '2022-03-14', 'https://g1.globo.com/politica/noticia/2022/03/14/lula-critica-bolsonaro-por-posicao-sobre-guerra-ucrania.ghtml', 'news_article', 1, 'Sao Paulo', 'Entrevista a jornalistas', 'lula-critica-bolsonaro-ucrania-b104-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes defende reforma administrativa as vesperas da campanha eleitoral.', 'Precisamos da reforma administrativa para destravar o Brasil. O povo entende que gastar menos e melhor.', 'Discurso em evento do Lide em Sao Paulo com empresarios.', 'verified', false, '2022-03-22', 'https://www.valor.com.br/politica/guedes-reforma-administrativa-lide-2022/', 'news_article', 1, 'Sao Paulo', 'Evento Lide', 'guedes-reforma-administrativa-b104-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rje, 'Roberto Jefferson ataca Alexandre de Moraes e ameaca ministros do STF das redes.', 'Alexandre de Moraes e um bandido togado. Vai responder pelos seus crimes contra a patria.', 'Transmissao ao vivo nas redes sociais atacando ministros do Supremo durante cumprimento de medida cautelar.', 'verified', true, '2022-03-25', 'https://www1.folha.uol.com.br/poder/2022/03/roberto-jefferson-ataca-moraes-bandido-togado.shtml', 'social_media_post', 5, 'Comendador Levy Gasparian (RJ)', 'Live nas redes sociais', 'jefferson-moraes-bandido-togado-b104-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes determina prisao de Roberto Jefferson por reiteradas ameacas contra o STF.', 'A reiteracao de condutas criminosas, com ataques frontais ao Estado Democratico de Direito, torna inadequada a prisao domiciliar.', 'Decisao no inquerito das milicias digitais determinando retorno a prisao preventiva.', 'verified', true, '2022-03-25', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=483456', 'official_statement', 1, 'Brasilia', 'Decisao judicial STF', 'moraes-prisao-jefferson-b104-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira comemora indulto de Bolsonaro apos condenacao pelo STF.', 'O presidente Bolsonaro me deu o indulto porque sabe que sou inocente. STF nao tem poder acima do povo.', 'Pronunciamento publico apos decreto de graca assinado pelo presidente um dia depois da condenacao.', 'verified', true, '2022-04-21', 'https://g1.globo.com/politica/noticia/2022/04/21/bolsonaro-da-indulto-a-daniel-silveira.ghtml', 'news_article', 5, 'Brasilia', 'Pronunciamento publico', 'silveira-indulto-stf-b104-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro assina indulto a Daniel Silveira no dia seguinte a condenacao pelo STF.', 'Dignidade, honra, lealdade. Hoje e um dia para se lembrar na historia do Brasil.', 'Declaracao ao assinar decreto de graca constitucional em Brasilia um dia apos condenacao a 8 anos e 9 meses.', 'verified', true, '2022-04-21', 'https://www1.folha.uol.com.br/poder/2022/04/bolsonaro-da-indulto-a-daniel-silveira.shtml', 'official_statement', 5, 'Brasilia', 'Assinatura de decreto', 'bolsonaro-indulto-silveira-b104-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann diz que indulto a Silveira e atentado contra STF e Constituicao.', 'E um ato de desrespeito ao STF e a Constituicao. Bolsonaro mostra que nao respeita a democracia.', 'Entrevista coletiva na sede do PT em Sao Paulo criticando decreto presidencial.', 'verified', false, '2022-04-21', 'https://www.poder360.com.br/politica/gleisi-indulto-silveira-atentado/', 'news_article', 1, 'Sao Paulo', 'Coletiva no PT', 'gleisi-critica-indulto-b104-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica polarizacao e lanca pre-candidatura pelo PDT em ato nacional.', 'Nao e Lula nem Bolsonaro. O Brasil precisa de um projeto de desenvolvimento e de reconciliacao.', 'Discurso de lancamento de pre-candidatura em evento nacional do PDT em Brasilia.', 'verified', true, '2022-03-26', 'https://g1.globo.com/politica/noticia/2022/03/26/ciro-gomes-lanca-pre-candidatura-presidencia-pdt.ghtml', 'news_article', 1, 'Brasilia', 'Ato nacional do PDT', 'ciro-lanca-pre-candidatura-b104-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet lanca pre-candidatura pelo MDB como "terceira via" em 2022.', 'Sou a ponte entre a direita e a esquerda. O Brasil precisa de equilibrio e de dialogo.', 'Evento de lancamento da pre-candidatura em Brasilia com presenca de lideres emedebistas.', 'verified', true, '2022-04-07', 'https://www1.folha.uol.com.br/poder/2022/04/simone-tebet-lanca-pre-candidatura-mdb-terceira-via.shtml', 'news_article', 1, 'Brasilia', 'Lancamento MDB', 'tebet-lanca-pre-candidatura-b104-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro sugere que Lula sera preso novamente apos reuniao com ministros.', 'Ainda tem processo do Lula. Ele pode voltar a cana a qualquer momento.', 'Fala a apoiadores no cerco do Palacio da Alvorada em Brasilia.', 'verified', false, '2022-04-12', 'https://www.uol.com.br/eleicoes/2022/bolsonaro-diz-que-lula-pode-voltar-presso/', 'news_article', 3, 'Brasilia', 'Cerca do Alvorada', 'bolsonaro-lula-preso-novamente-b104-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem critica indulto a Daniel Silveira e chama decisao de erro.', 'O indulto ao Silveira foi um erro politico grave. O Novo defende a separacao de poderes.', 'Entrevista ao Poder360 em Porto Alegre comentando decreto presidencial.', 'verified', false, '2022-04-23', 'https://www.poder360.com.br/politica/marcel-van-hattem-critica-indulto-silveira/', 'news_article', 1, 'Porto Alegre', 'Entrevista Poder360', 'marcel-critica-indulto-b104-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva retorna a Rede e anuncia apoio a Lula desde o primeiro turno.', 'Tenho divergencias com o PT, mas o momento exige unir forcas contra o retrocesso autoritario.', 'Declaracao em ato da Rede Sustentabilidade em Sao Paulo.', 'verified', true, '2022-04-28', 'https://g1.globo.com/politica/noticia/2022/04/28/marina-silva-anuncia-apoio-a-lula-desde-primeiro-turno.ghtml', 'news_article', 1, 'Sao Paulo', 'Ato Rede Sustentabilidade', 'marina-apoio-lula-b104-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca STF em live e chama ministros de "tiranos de toga".', 'Os ministros do STF sao tiranos de toga. O povo vai acertar contas com essa casta.', 'Live no YouTube atacando o Supremo Tribunal Federal durante a campanha a deputado federal.', 'verified', true, '2022-05-04', 'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-ataca-stf-tiranos-toga/', 'social_media_post', 4, 'Belo Horizonte', 'Live no YouTube', 'nikolas-stf-tiranos-toga-b104-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que nao aceitara outro resultado que nao sua vitoria nas eleicoes.', 'Se o processo for limpo, aceitamos o resultado. Mas se for fraude, nao aceitaremos.', 'Declaracao a apoiadores em evento do PL em Brasilia.', 'verified', true, '2022-05-10', 'https://www1.folha.uol.com.br/poder/2022/05/bolsonaro-nao-aceitara-resultado-se-for-fraude.shtml', 'news_article', 4, 'Brasilia', 'Evento PL', 'bolsonaro-nao-aceita-resultado-b104-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad lanca pre-candidatura ao governo de Sao Paulo pelo PT apoiando Lula.', 'Sao Paulo precisa reencontrar o caminho da educacao e da inclusao. Vou trabalhar junto com o Lula.', 'Ato no Sindicato dos Bancarios de Sao Paulo com militantes e Lula.', 'verified', true, '2022-04-02', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2022/noticia/2022/04/02/haddad-pre-candidato-governo-sp-pt.ghtml', 'news_article', 1, 'Sao Paulo', 'Ato no Sindicato dos Bancarios', 'haddad-pre-candidato-sp-b104-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano diz que Lula esta possuido pelo demonio em culto evangelico.', 'O Lula esta possuido pelo demonio. Votar nele e votar contra Deus.', 'Sermao em culto evangelico transmitido ao vivo pela internet.', 'verified', false, '2022-05-15', 'https://www.uol.com.br/eleicoes/2022/feliciano-lula-possuido-demonio/', 'social_media_post', 3, 'Sao Paulo', 'Culto evangelico', 'feliciano-lula-demonio-b104-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mma, 'Magno Malta chama eleitores de Lula de "ignorantes" em evento em Vitoria.', 'Quem vota no Lula e ignorante, nao conhece o Evangelho nem a Biblia.', 'Discurso em evento bolsonarista em Vitoria atacando eleitores de Lula.', 'verified', false, '2022-05-20', 'https://www.gazetaonline.com.br/politica/2022/05/magno-malta-eleitor-lula-ignorante.html', 'news_article', 3, 'Vitoria', 'Evento bolsonarista', 'malta-eleitor-lula-ignorante-b104-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves deixa Ministerio da Mulher e lanca pre-candidatura ao Senado pelo DF.', 'Saio do governo para levar a bandeira da familia para o Senado. Bolsonaro tem meu apoio total.', 'Entrevista coletiva em Brasilia anunciando desincompatibilizacao para disputar o Senado pelo DF.', 'verified', true, '2022-03-31', 'https://g1.globo.com/df/distrito-federal/eleicoes/2022/noticia/2022/03/31/damares-alves-deixa-ministerio-e-sera-candidata-ao-senado.ghtml', 'news_article', 1, 'Brasilia', 'Coletiva de imprensa', 'damares-deixa-ministerio-senado-b104-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina deixa Ministerio da Agricultura para candidatura ao Senado pelo MS.', 'Agradeco ao presidente Bolsonaro pela confianca. Vou ao Senado pelo Mato Grosso do Sul.', 'Despedida do Ministerio da Agricultura em cerimonia em Brasilia.', 'verified', false, '2022-03-31', 'https://www.canalrural.com.br/noticias/tereza-cristina-deixa-agricultura-senado-ms/', 'news_article', 1, 'Brasilia', 'Cerimonia no Ministerio', 'tereza-cristina-senado-ms-b104-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Mourao se lanca ao Senado pelo RS e diz que "nao briga com Bolsonaro".', 'Nao tenho briga com o presidente. Vou disputar o Senado pelo Rio Grande do Sul.', 'Ato de filiacao ao Republicanos em Porto Alegre com lideres locais.', 'verified', false, '2022-04-11', 'https://gauchazh.clicrbs.com.br/politica/eleicoes/noticia/2022/04/mourao-senado-rs-republicanos.html', 'news_article', 1, 'Porto Alegre', 'Filiacao Republicanos', 'mourao-senado-rs-b104-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca jornalista Vera Magalhaes em debate da Band e a chama de "vergonha".', 'Acho que voce dorme pensando em mim. Voce tem uma paixao por mim. Nao pode ter tanto odio assim.', 'Ataque durante pergunta da jornalista no primeiro debate presidencial realizado pela Band.', 'verified', true, '2022-08-28', 'https://www1.folha.uol.com.br/poder/2022/08/bolsonaro-ataca-vera-magalhaes-em-debate.shtml', 'news_article', 4, 'Sao Paulo', 'Debate presidencial Band', 'bolsonaro-ataque-vera-magalhaes-b104-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz declaracao de "tres resultados" em evento em Sao Paulo.', 'Tenho tres alternativas para o meu futuro: preso, morto ou vitoria. E digo aos canalhas: nunca serei preso.', 'Discurso no Grito dos Excluidos em evento para empresarios e apoiadores em Sao Paulo.', 'verified', true, '2021-08-29', 'https://www1.folha.uol.com.br/poder/2021/08/bolsonaro-diz-ter-tres-alternativas-preso-morto-ou-vitoria.shtml', 'news_article', 5, 'Sao Paulo', 'Evento de empresarios', 'bolsonaro-tres-resultados-b104-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reune embaixadores estrangeiros para atacar urnas eletronicas.', 'Tenho duvidas sobre o sistema eleitoral. Quero que voces levem essas preocupacoes aos seus paises.', 'Reuniao com embaixadores estrangeiros no Palacio da Alvorada transmitida ao vivo pela TV Brasil.', 'verified', true, '2022-07-18', 'https://g1.globo.com/politica/noticia/2022/07/18/bolsonaro-reune-embaixadores-e-ataca-urnas.ghtml', 'news_article', 5, 'Brasilia', 'Reuniao no Alvorada', 'bolsonaro-embaixadores-urnas-b104-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira e ministros ajudam Bolsonaro em reuniao com embaixadores questionada pelo TSE.', 'O Itamaraty apoiou a iniciativa do presidente de prestar esclarecimentos sobre o sistema eleitoral.', 'Nota do Itamaraty defendendo a reuniao com embaixadores apos questionamentos do TSE.', 'verified', false, '2022-07-19', 'https://www.poder360.com.br/governo/itamaraty-defende-reuniao-embaixadores/', 'official_statement', 3, 'Brasilia', 'Nota oficial Itamaraty', 'itamaraty-defende-embaixadores-b104-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que reuniao com embaixadores foi "circo golpista" de Bolsonaro.', 'O Bolsonaro virou o Brasil uma republiqueta. Esse circo golpista com embaixadores e uma vergonha.', 'Entrevista ao Roda Viva da TV Cultura em Sao Paulo.', 'verified', true, '2022-07-25', 'https://g1.globo.com/politica/noticia/2022/07/25/lula-reuniao-embaixadores-circo-golpista.ghtml', 'news_article', 2, 'Sao Paulo', 'Roda Viva', 'lula-embaixadores-circo-b104-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin diz que Bolsonaro "sabota" a democracia ao atacar urnas.', 'Quem ataca urna ataca democracia. Bolsonaro sabota as instituicoes que deveria defender.', 'Discurso em ato de filiacao ao PSB em Brasilia apos oficializacao como vice de Lula.', 'verified', true, '2022-03-23', 'https://www1.folha.uol.com.br/poder/2022/03/alckmin-bolsonaro-sabota-democracia.shtml', 'news_article', 1, 'Brasilia', 'Filiacao PSB', 'alckmin-bolsonaro-sabota-democracia-b104-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Andre Janones desiste de candidatura a presidente e anuncia apoio a Lula.', 'Retiro minha candidatura e apoio o Lula. O momento exige unir forcas contra o fascismo.', 'Discurso de desistencia em Belo Horizonte com a presenca de lideres do PT.', 'verified', true, '2022-08-04', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/08/04/janones-desiste-apoia-lula.ghtml', 'news_article', 1, 'Belo Horizonte', 'Ato de desistencia', 'janones-desiste-apoia-lula-b104-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin e escoltado por militares em cerimonia no TSE apos ataques de Bolsonaro.', 'A Justica Eleitoral tem todas as condicoes de realizar uma eleicao limpa, segura e transparente.', 'Discurso em cerimonia no TSE com presenca de chefes das Forcas Armadas durante crise institucional.', 'verified', true, '2022-05-19', 'https://www.tse.jus.br/comunicacao/noticias/2022/Maio/cerimonia-eleicoes-2022', 'official_statement', 1, 'Brasilia', 'Cerimonia TSE', 'fachin-cerimonia-militares-b104-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro posta tuite ameacador sobre AI-5 apos decisao do STF.', 'A hora de um novo AI-5 pode chegar. Depende do STF parar de atacar o presidente.', 'Publicacao nas redes sociais durante julgamento do STF que gerou forte reacao institucional.', 'verified', true, '2022-06-02', 'https://www1.folha.uol.com.br/poder/2022/06/eduardo-bolsonaro-volta-a-falar-em-ai-5.shtml', 'social_media_post', 5, 'Brasilia', 'Publicacao nas redes sociais', 'eduardo-ai-5-novamente-b104-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli diz que Forcas Armadas devem estar prontas para "intervencao".', 'As Forcas Armadas sao poder moderador. Devem estar prontas para intervir se houver fraude.', 'Live nas redes sociais durante campanha a deputada federal.', 'verified', false, '2022-06-15', 'https://www.poder360.com.br/eleicoes/zambelli-forcas-armadas-intervencao/', 'social_media_post', 5, 'Sao Paulo', 'Live de campanha', 'zambelli-forcas-armadas-intervencao-b104-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto ataca STF e ministros em discurso na Camara antes das eleicoes.', 'Os ministros do STF sao traidores da patria. O Brasil vai dar um basta.', 'Discurso no plenario da Camara dos Deputados durante sessao de discussao sobre o Judiciario.', 'verified', false, '2022-06-22', 'https://www.camara.leg.br/noticias/2022/06/cabo-gilberto-ataca-stf', 'parliamentary_record', 4, 'Brasilia', 'Plenario da Camara', 'cabo-gilberto-stf-traidores-b104-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem deixa Abin para lancar pre-candidatura a deputado federal pelo PL.', 'Deixo a Abin para representar o povo no Congresso e defender o presidente Bolsonaro.', 'Anuncio em Brasilia apos desincompatibilizacao obrigatoria para disputar eleicao.', 'verified', false, '2022-03-31', 'https://www.cnnbrasil.com.br/politica/ramagem-deixa-abin-deputado-federal/', 'news_article', 2, 'Brasilia', 'Anuncio de pre-candidatura', 'ramagem-deixa-abin-b104-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz convencao do PL e reafirma ataques as urnas em discurso.', 'Nao quero tumultuar, mas temos duvidas. Se houver fraude, o povo vai as ruas.', 'Discurso na convencao do PL no Maracanazinho, Rio de Janeiro, oficializando candidatura a reeleicao.', 'verified', true, '2022-07-24', 'https://www1.folha.uol.com.br/poder/2022/07/convencao-pl-bolsonaro-reeleicao-urnas.shtml', 'news_article', 4, 'Rio de Janeiro', 'Convencao PL Maracanazinho', 'bolsonaro-convencao-pl-urnas-b104-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula oficializa candidatura no Expo Center Norte em Sao Paulo com Alckmin.', 'Venho aqui para pedir ao povo brasileiro que me de mais uma chance de governar o Brasil.', 'Discurso na convencao nacional do PT que oficializou a chapa Lula-Alckmin.', 'verified', true, '2022-07-21', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/07/21/lula-convencao-pt-candidatura.ghtml', 'news_article', 1, 'Sao Paulo', 'Convencao PT Expo Center Norte', 'lula-convencao-pt-b104-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que vai "estourar a boca da urna" em fala a policiais.', 'No dia 2 de outubro, vamos estourar a boca da urna, chega desse ladrao.', 'Discurso em evento com policiais militares em Rio Grande, RS, durante campanha a reeleicao.', 'verified', false, '2022-07-30', 'https://www.uol.com.br/eleicoes/2022/bolsonaro-estourar-boca-urna/', 'news_article', 3, 'Rio Grande', 'Evento com policiais', 'bolsonaro-estourar-boca-urna-b104-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca imprensa em entrevista ao Jornal Nacional e confronta William Bonner.', 'O PT rouba e voce sabe disso, Bonner. Voces e que mentem sobre mim.', 'Entrevista no Jornal Nacional em que o presidente confrontou diretamente o apresentador.', 'verified', true, '2022-08-22', 'https://g1.globo.com/jornal-nacional/noticia/2022/08/22/entrevista-bolsonaro-jornal-nacional.ghtml', 'interview', 3, 'Rio de Janeiro', 'Entrevista Jornal Nacional', 'bolsonaro-bonner-jornal-nacional-b104-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula da entrevista ao Jornal Nacional e promete governar para todos os brasileiros.', 'Vou governar para os 215 milhoes de brasileiros, nao so para quem votou em mim.', 'Entrevista no Jornal Nacional durante campanha a presidencia da Republica.', 'verified', true, '2022-08-25', 'https://g1.globo.com/jornal-nacional/noticia/2022/08/25/entrevista-lula-jornal-nacional.ghtml', 'interview', 1, 'Rio de Janeiro', 'Entrevista Jornal Nacional', 'lula-entrevista-jornal-nacional-b104-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca ministros do STF em tuite e depois apaga publicacao.', 'Alguns togados se acham imperadores. O povo vai acertar contas com os inimigos do Brasil.', 'Publicacao no Twitter que foi apagada apos repercussao negativa e criticas de parlamentares.', 'verified', false, '2022-06-28', 'https://www.poder360.com.br/politica/carlos-bolsonaro-ataca-stf-twitter/', 'social_media_post', 3, 'Rio de Janeiro', 'Publicacao no Twitter', 'carlos-ataca-stf-twitter-b104-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos retira pre-candidatura a governador de SP e apoia Haddad.', 'Retiro a candidatura em nome da unidade. Apoio o Haddad para vencer o bolsonarismo em SP.', 'Discurso em ato do PSOL em Sao Paulo com presenca do PT.', 'verified', true, '2022-06-14', 'https://www1.folha.uol.com.br/poder/2022/06/boulos-desiste-apoia-haddad-sp.shtml', 'news_article', 1, 'Sao Paulo', 'Ato PSOL', 'boulos-apoia-haddad-b104-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke lanca candidatura pelo Uniao Brasil e ataca Bolsonaro e Lula.', 'Nao represento Bolsonaro nem Lula. Represento o Brasil que quer paz e progresso.', 'Convencao do Uniao Brasil em Brasilia que oficializou candidatura da senadora.', 'verified', false, '2022-07-27', 'https://www.cnnbrasil.com.br/politica/soraya-thronicke-candidata-uniao-brasil/', 'news_article', 1, 'Brasilia', 'Convencao Uniao Brasil', 'soraya-lanca-candidatura-b104-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz ato de 7 de setembro com tom eleitoral e ataques as instituicoes.', 'Vamos vencer essa eleicao com o voto do povo. E se precisar, vamos para as ruas.', 'Discurso no desfile de 7 de setembro na Esplanada dos Ministerios com apoiadores.', 'verified', true, '2022-09-07', 'https://www1.folha.uol.com.br/poder/2022/09/bolsonaro-7-setembro-ato-eleitoral.shtml', 'news_article', 4, 'Brasilia', 'Desfile 7 de Setembro', 'bolsonaro-7-setembro-2022-b104-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro usa bicentenario da Independencia para ataques a Lula em Copacabana.', 'Nao podemos entregar o Brasil ao comunismo e ao crime organizado.', 'Discurso na praia de Copacabana no ato de 7 de setembro com apoiadores.', 'verified', true, '2022-09-07', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/09/07/bolsonaro-discurso-copacabana-7-setembro.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Ato em Copacabana', 'bolsonaro-copacabana-independencia-b104-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Bolsonaro por usar 7 de Setembro como palanque.', 'Bolsonaro transformou o 7 de setembro em palanque. Nao respeita a data nem a historia do Brasil.', 'Entrevista ao SBT durante campanha nacional.', 'verified', false, '2022-09-08', 'https://www.sbt.com.br/jornalismo/sbt-brasil/lula-critica-bolsonaro-7-setembro/', 'interview', 1, 'Sao Paulo', 'Entrevista SBT', 'lula-critica-7-setembro-b104-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes admite que deixara governo apos eleicao independente do resultado.', 'Minha missao no governo se encerra em 2022. Deixo com sentimento de dever cumprido.', 'Entrevista ao Valor Economico em Nova York durante reuniao com investidores.', 'verified', false, '2022-09-22', 'https://www.valor.com.br/politica/guedes-deixa-governo-apos-eleicao/', 'interview', 1, 'Nova York', 'Entrevista Valor Economico', 'guedes-deixa-governo-fim-b104-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica Bolsonaro por ataques as urnas e defende TSE.', 'Quem ataca urna e golpista. Nao da para tergiversar com a democracia.', 'Discurso no plenario da Camara em defesa do TSE durante crise institucional.', 'verified', false, '2022-06-20', 'https://www.camara.leg.br/noticias/2022/06/kim-kataguiri-defende-tse', 'parliamentary_record', 1, 'Brasilia', 'Plenario da Camara', 'kim-defende-tse-b104-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende intervencao militar em live nas redes bolsonaristas.', 'Se o PT voltar, as Forcas Armadas devem agir. A Constituicao permite.', 'Live nas redes sociais durante campanha a deputado federal pelo RS.', 'verified', false, '2022-08-12', 'https://gauchazh.clicrbs.com.br/politica/eleicoes/noticia/2022/08/sanderson-intervencao-militar.html', 'social_media_post', 5, 'Porto Alegre', 'Live de campanha', 'sanderson-intervencao-militar-b104-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girao defende acionamento do artigo 142 em discurso na Camara.', 'O artigo 142 e caminho legal. As Forcas Armadas sao poder moderador.', 'Discurso no plenario da Camara dos Deputados durante sessao extraordinaria.', 'verified', false, '2022-09-14', 'https://www.camara.leg.br/noticias/2022/09/girao-artigo-142', 'parliamentary_record', 5, 'Brasilia', 'Plenario da Camara', 'girao-artigo-142-b104-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jza, 'Julia Zanatta defende Bolsonaro em redes sociais e ataca Moraes.', 'Moraes e inimigo da liberdade. Vamos tirar essa toga do poder com o voto.', 'Publicacao nas redes sociais durante campanha em Santa Catarina.', 'verified', false, '2022-08-28', 'https://www.nsctotal.com.br/noticias/julia-zanatta-moraes-liberdade', 'social_media_post', 3, 'Florianopolis', 'Publicacao nas redes sociais', 'zanatta-moraes-inimigo-b104-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbr, 'Filipe Barros lidera articulacao por voto impresso na Camara mesmo apos derrota.', 'Nao desistiremos. O voto impresso e direito do povo brasileiro e continuaremos lutando.', 'Discurso no plenario da Camara reapresentando PEC do voto impresso apos rejeicao.', 'verified', false, '2022-02-10', 'https://www.camara.leg.br/noticias/2022/02/filipe-barros-voto-impresso', 'parliamentary_record', 3, 'Brasilia', 'Plenario da Camara', 'filipe-barros-voto-impresso-b104-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sca, 'Silas Camara fala que eleicao de Lula sera "vitoria do inferno".', 'Se o Lula vencer, sera a vitoria do inferno sobre o Brasil. Nao podemos permitir isso.', 'Discurso em culto evangelico em Manaus durante campanha a reeleicao.', 'verified', false, '2022-08-07', 'https://www.acritica.com/politica/silas-camara-lula-inferno/', 'news_article', 3, 'Manaus', 'Culto evangelico', 'silas-camara-lula-inferno-b104-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz em entrevista ao Flow que prisao domiciliar de Jefferson foi injusta.', 'O Jefferson e um patriota. A prisao dele foi exagerada. Perseguicao politica pura.', 'Entrevista ao podcast Flow em Sao Paulo com quatro horas de duracao.', 'verified', true, '2022-08-22', 'https://www1.folha.uol.com.br/poder/2022/08/bolsonaro-defende-jefferson-flow-podcast.shtml', 'interview', 3, 'Sao Paulo', 'Podcast Flow', 'bolsonaro-defende-jefferson-flow-b104-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula participa do Flow e critica uso de religiao em campanha de Bolsonaro.', 'A religiao nao pode ser arma de guerra. Respeito todas as fes e nao uso nenhuma para atacar.', 'Entrevista ao podcast Flow em Sao Paulo durante a campanha presidencial.', 'verified', true, '2022-08-08', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/08/08/lula-flow-podcast.ghtml', 'interview', 1, 'Sao Paulo', 'Podcast Flow', 'lula-flow-podcast-b104-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua que Janja tem gosto estranho em comicio bolsonarista.', 'Se eu fosse o Lula, nao teria casado com a Janja. Ela nao tem o meu estilo.', 'Discurso em ato de campanha em Alfenas, MG, que gerou reacao do PT.', 'verified', false, '2022-09-15', 'https://www.uol.com.br/eleicoes/2022/bolsonaro-comenta-janja-alfenas/', 'news_article', 3, 'Alfenas', 'Ato de campanha', 'bolsonaro-comenta-janja-b104-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "pintou um clima" com venezuelanas em Sao Sebastiao.', 'Parei a moto. Estavam arrumadinhas, umas 14, 15 anos. Pintou um clima.', 'Relato em live com o pastor Silas Malafaia em evento evangelico durante campanha.', 'verified', true, '2022-10-14', 'https://www1.folha.uol.com.br/poder/2022/10/bolsonaro-pintou-clima-venezuelanas.shtml', 'news_article', 4, 'Sao Paulo', 'Live com Silas Malafaia', 'bolsonaro-pintou-clima-b104-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica fala de Bolsonaro sobre venezuelanas e chama de "pedofilia verbal".', 'O Bolsonaro fala em "pintou um clima" com adolescentes venezuelanas. E pedofilia verbal.', 'Entrevista a radios do Nordeste durante campanha do segundo turno.', 'verified', true, '2022-10-17', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/17/lula-critica-pintou-clima.ghtml', 'interview', 2, 'Recife', 'Entrevista a radios', 'lula-critica-pintou-clima-b104-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli persegue homem com arma em rua de Sao Paulo no dia 29 de outubro.', 'Eu estava em legitima defesa. O homem me atacou e tive que sacar a arma.', 'Declaracao a imprensa apos apontar arma para jornalista Luan Araujo em rua de Sao Paulo na vespera do segundo turno.', 'verified', true, '2022-10-29', 'https://www1.folha.uol.com.br/poder/2022/10/zambelli-aponta-arma-sao-paulo.shtml', 'news_article', 5, 'Sao Paulo', 'Rua Peixoto Gomide', 'zambelli-arma-sao-paulo-b104-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Marcela McGowan em debate e gera reacao de Lula.', 'Nao conheco essa moca. Nao vou perder tempo com isso.', 'Debate presidencial da Band no segundo turno, em Sao Paulo.', 'verified', true, '2022-10-16', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/16/debate-band-2-turno-lula-bolsonaro.ghtml', 'news_article', 2, 'Sao Paulo', 'Debate Band 2o turno', 'bolsonaro-debate-band-2turno-b104-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Bolsonaro de "pequeno ditador" em debate do 2o turno.', 'Voce e um pequeno ditador que mente, nao respeita as instituicoes nem a democracia.', 'Debate presidencial do segundo turno na TV Globo em Sao Paulo.', 'verified', true, '2022-10-28', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/28/debate-globo-lula-bolsonaro-segundo-turno.ghtml', 'news_article', 2, 'Sao Paulo', 'Debate Globo 2o turno', 'lula-pequeno-ditador-b104-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes critica Lula em entrevista e defende legado economico.', 'O Lula vai destruir o que construimos. A esquerda nao sabe gerir economia.', 'Entrevista ao Estadao em Brasilia na reta final da campanha.', 'verified', false, '2022-10-20', 'https://www.estadao.com.br/economia/guedes-critica-lula-economia/', 'interview', 2, 'Brasilia', 'Entrevista Estadao', 'guedes-critica-lula-b104-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet anuncia apoio a Lula no 2o turno e pede voto contra Bolsonaro.', 'Voto em Lula com esperanca na democracia. Bolsonaro representa risco ao pais.', 'Coletiva em Brasilia anunciando apoio oficial a candidatura de Lula no 2o turno.', 'verified', true, '2022-10-05', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/05/simone-tebet-apoia-lula-segundo-turno.ghtml', 'news_article', 1, 'Brasilia', 'Coletiva de imprensa', 'tebet-apoia-lula-2turno-b104-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva intensifica campanha por Lula no 2o turno em defesa da Amazonia.', 'Bolsonaro destruiu a Amazonia. Lula e a esperanca de recuperar o meio ambiente.', 'Ato com Lula em Belem durante campanha do segundo turno.', 'verified', false, '2022-10-11', 'https://www.oeco.org.br/reportagens/marina-silva-campanha-lula-amazonia/', 'news_article', 1, 'Belem', 'Ato de campanha', 'marina-campanha-lula-amazonia-b104-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira defende aprovacao da PEC Kamikaze as vesperas da eleicao.', 'A PEC e necessaria para ajudar os mais pobres. Nao tem nada de eleitoral nisso.', 'Entrevista em Brasilia apos aprovacao da PEC que ampliou beneficios sociais em ano eleitoral.', 'verified', false, '2022-07-14', 'https://www.camara.leg.br/noticias/2022/07/arthur-lira-pec-kamikaze', 'news_article', 3, 'Brasilia', 'Entrevista no Congresso', 'lira-pec-kamikaze-b104-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Rodrigo Pacheco diz que TSE deve ter ultima palavra sobre urnas.', 'O TSE tem a ultima palavra sobre as urnas. O Congresso nao pode tutelar a Justica Eleitoral.', 'Entrevista em Brasilia apos debates sobre PEC do voto impresso.', 'verified', false, '2022-05-12', 'https://www12.senado.leg.br/noticias/materias/2022/05/12/pacheco-tse-urnas', 'news_article', 1, 'Brasilia', 'Entrevista no Senado', 'pacheco-tse-urnas-b104-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros lanca pre-candidatura ao Senado apos articulacao com Lula.', 'Volto ao Senado para defender o povo alagoano e apoiar o presidente Lula.', 'Ato de filiacao ao MDB em Maceio com lideres locais.', 'verified', false, '2022-04-05', 'https://www.poder360.com.br/politica/renan-calheiros-senado-2022/', 'news_article', 1, 'Maceio', 'Ato de filiacao', 'renan-senado-2022-b104-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa ataca Bolsonaro por uso da maquina publica na eleicao.', 'Bolsonaro usa a maquina publica de forma criminosa para beneficiar sua campanha.', 'Entrevista no Senado apos sessao de debate sobre eleicoes.', 'verified', false, '2022-08-18', 'https://www12.senado.leg.br/noticias/materias/2022/08/18/humberto-costa-bolsonaro-maquina-publica', 'interview', 2, 'Brasilia', 'Entrevista no Senado', 'humberto-costa-maquina-publica-b104-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar defende Lula e critica golpismo em entrevista no Senado.', 'Quem ataca urnas ataca democracia. Otto Alencar sempre estara ao lado da democracia.', 'Entrevista ao programa da TV Senado apos discussao sobre ataques a Justica Eleitoral.', 'verified', false, '2022-07-22', 'https://www12.senado.leg.br/noticias/materias/2022/07/22/otto-alencar-golpismo', 'interview', 1, 'Brasilia', 'TV Senado', 'otto-alencar-golpismo-b104-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues e escolhido lider do governo Lula no Senado.', 'Vou trabalhar pela reconstrucao do Brasil com o presidente Lula a partir de 2023.', 'Entrevista em Brasilia apos encontro com Lula para definicao da equipe de transicao.', 'verified', false, '2022-11-10', 'https://www12.senado.leg.br/noticias/materias/2022/11/10/randolfe-lider-governo-lula', 'news_article', 1, 'Brasilia', 'Entrevista no Senado', 'randolfe-lider-governo-b104-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro cita armas em comicio para apoiadores em Juiz de Fora.', 'Tenho tiro, porrada e bomba para quem tentar roubar as eleicoes.', 'Discurso em comicio em Juiz de Fora, MG, durante campanha da reeleicao.', 'verified', false, '2022-08-25', 'https://g1.globo.com/mg/zona-da-mata/noticia/2022/08/25/bolsonaro-comicio-juiz-fora.ghtml', 'news_article', 4, 'Juiz de Fora', 'Comicio em MG', 'bolsonaro-tiro-porrada-bomba-b104-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca pesquisas em comicio e chama Datafolha de "fraudulento".', 'Datafolha fraudulento. Nao acreditamos nessas pesquisas compradas pela Globo.', 'Discurso em comicio em Curitiba, PR, durante campanha da reeleicao.', 'verified', false, '2022-08-30', 'https://www.gazetadopovo.com.br/politica/republica/bolsonaro-curitiba-datafolha-fraudulento/', 'news_article', 3, 'Curitiba', 'Comicio em PR', 'bolsonaro-datafolha-fraudulento-b104-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes assume TSE com aceno as Forcas Armadas e defesa da democracia.', 'As Forcas Armadas nao fiscalizam nem paralelamente, nem em conjunto com a Justica Eleitoral.', 'Discurso de posse como presidente do TSE em cerimonia em Brasilia.', 'verified', true, '2022-08-16', 'https://www.tse.jus.br/comunicacao/noticias/2022/Agosto/posse-moraes-presidente', 'official_statement', 1, 'Brasilia', 'Posse TSE', 'moraes-posse-tse-b104-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gmm, 'Gilmar Mendes critica ataques de Bolsonaro as urnas em seminario.', 'Ataques sistematicos as urnas configuram tentativa de desestabilizacao do processo eleitoral.', 'Palestra em seminario juridico em Lisboa sobre democracia e eleicoes.', 'verified', false, '2022-06-30', 'https://www.poder360.com.br/justica/gilmar-mendes-ataques-urnas-lisboa/', 'news_article', 1, 'Lisboa', 'Seminario juridico', 'gilmar-ataques-urnas-b104-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Carmen Lucia defende urnas em discurso no TSE durante crise.', 'A urna eletronica e segura, auditavel e ja elegeu todos os presidentes desde 1996.', 'Discurso no TSE durante cerimonia de inspecao das urnas eletronicas.', 'verified', false, '2022-05-05', 'https://www.tse.jus.br/comunicacao/noticias/2022/Maio/carmen-lucia-urnas', 'official_statement', 1, 'Brasilia', 'Cerimonia TSE', 'carmen-lucia-urnas-b104-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz reuniao ministerial tratando de estrategia eleitoral, segundo vazamento.', 'Temos que enfrentar o TSE. O processo eleitoral esta comprometido por ideologia.', 'Reuniao ministerial vazada posteriormente mostrando uso da maquina publica para fins eleitorais.', 'verified', true, '2022-07-05', 'https://www1.folha.uol.com.br/poder/2022/07/reuniao-ministerial-bolsonaro-vazamento.shtml', 'leaked_document', 4, 'Brasilia', 'Reuniao ministerial', 'reuniao-ministerial-vazada-b104-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ataca casamento homoafetivo em entrevista bolsonarista.', 'Casamento so e entre homem e mulher. O resto e aberracao que nao aceitamos.', 'Entrevista ao canal bolsonarista Jovem Pan durante campanha a reeleicao como deputado.', 'verified', false, '2022-09-10', 'https://www.jovempan.com.br/noticias/politica/feliciano-casamento-homoafetivo/', 'interview', 3, 'Sao Paulo', 'Jovem Pan', 'feliciano-casamento-homoafetivo-b104-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves diz em culto que "Jesus entregou Brasilia" a Bolsonaro.', 'Jesus entregou Brasilia ao presidente. Temos que rezar para manter o Brasil cristao.', 'Discurso em culto evangelico em Brasilia durante campanha ao Senado pelo DF.', 'verified', false, '2022-09-25', 'https://www.metropoles.com/distrito-federal/eleicoes-df/damares-jesus-brasilia', 'news_article', 3, 'Brasilia', 'Culto evangelico', 'damares-jesus-brasilia-b104-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marcal lanca candidatura presidencial de ultima hora pelo PROS.', 'Sou candidato a presidente. O Brasil precisa de coaching e mentalidade vencedora.', 'Convencao do PROS em Brasilia que oficializou candidatura relampago.', 'verified', false, '2022-08-05', 'https://www.uol.com.br/eleicoes/2022/pablo-marcal-candidato-presidente/', 'news_article', 1, 'Brasilia', 'Convencao PROS', 'marcal-candidato-presidencia-2022-b104-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rje, 'Roberto Jefferson diz em live que Bolsonaro e "salvador" e STF e "inimigo".', 'Bolsonaro e o salvador da patria. O STF e inimigo do povo e da cristandade.', 'Live nas redes sociais durante periodo em prisao domiciliar.', 'verified', false, '2022-10-20', 'https://www.poder360.com.br/justica/roberto-jefferson-salvador-stf/', 'social_media_post', 4, 'Comendador Levy Gasparian', 'Live nas redes', 'jefferson-salvador-stf-inimigo-b104-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que ira "cumprir sua missao ate o final" durante crise politica.', 'Vou cumprir minha missao ate o ultimo dia. Nao vou abandonar o povo brasileiro.', 'Discurso na ONU em Nova York em setembro de 2022 durante campanha.', 'verified', true, '2022-09-20', 'https://g1.globo.com/politica/noticia/2022/09/20/bolsonaro-discurso-onu-2022.ghtml', 'speech', 2, 'Nova York', 'Discurso na ONU', 'bolsonaro-onu-2022-b104-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara programas sociais com "bolsa esmola" em debate.', 'Bolsa Familia e bolsa esmola. Criamos o Auxilio Brasil que e um programa decente.', 'Debate presidencial da Globo no primeiro turno.', 'verified', true, '2022-09-29', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/09/29/debate-globo-bolsonaro-bolsa-familia.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Debate Globo 1o turno', 'bolsonaro-bolsa-esmola-b104-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende democracia em comicio gigante no Rio de Janeiro com mais de 30 mil pessoas.', 'Vamos vencer o fascismo no dia 2 de outubro. O Brasil nao aceitara outro mandato de horror.', 'Comicio no Rio de Janeiro com mais de 30 mil pessoas na reta final da campanha.', 'verified', true, '2022-09-24', 'https://www1.folha.uol.com.br/poder/2022/09/comicio-lula-rio-de-janeiro-2022.shtml', 'news_article', 1, 'Rio de Janeiro', 'Comicio na Cinelandia', 'lula-comicio-rio-b104-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro alega "influencia demoniaca" em comicio com Silas Malafaia.', 'Tem forcas do mal atuando contra o Brasil. Influencia demoniaca quer nos tirar do poder.', 'Ato religioso-politico em Belo Horizonte com Silas Malafaia e apoiadores.', 'verified', false, '2022-10-09', 'https://g1.globo.com/mg/minas-gerais/noticia/2022/10/09/bolsonaro-ato-religioso-bh.ghtml', 'news_article', 3, 'Belo Horizonte', 'Ato religioso-politico', 'bolsonaro-influencia-demoniaca-b104-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro mente sobre fala de Lula sobre igrejas em comicio manipulado.', 'O Lula quer fechar as igrejas. Vi a declaracao dele com meus proprios olhos.', 'Discurso em Vespera das eleicoes espalhando desinformacao sobre Lula e igrejas.', 'verified', true, '2022-09-20', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/09/20/bolsonaro-mente-lula-igrejas.ghtml', 'news_article', 3, 'Brasilia', 'Ato de campanha', 'bolsonaro-lula-igrejas-mentira-b104-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rebate fake news sobre fechar igrejas em video nas redes sociais.', 'Sou cristao. Nunca fechei igreja e nunca vou fechar. Essa mentira e criminosa.', 'Video gravado por Lula e divulgado nas redes sociais rebatendo desinformacao de Bolsonaro.', 'verified', true, '2022-09-22', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/09/22/lula-rebate-fake-news-igrejas.ghtml', 'social_media_post', 1, 'Sao Paulo', 'Video nas redes sociais', 'lula-rebate-fake-igrejas-b104-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad ataca Tarcisio em debate de governo de Sao Paulo.', 'Tarcisio e candidato laranja de Bolsonaro. Nao conhece Sao Paulo e nem vive aqui.', 'Debate de segundo turno para o governo de Sao Paulo na TV Globo.', 'verified', true, '2022-10-27', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2022/noticia/2022/10/27/debate-governador-sp-haddad-tarcisio.ghtml', 'news_article', 2, 'Sao Paulo', 'Debate Globo SP', 'haddad-ataca-tarcisio-b104-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann lidera articulacao do PT para vitoria de Lula no 2o turno.', 'Nosso foco agora e conquistar os eleitores que votaram em outros candidatos e vencer o fascismo.', 'Entrevista coletiva na sede do PT apos resultado do 1o turno.', 'verified', false, '2022-10-03', 'https://www.poder360.com.br/eleicoes/gleisi-lidera-articulacao-pt-2turno/', 'news_article', 1, 'Sao Paulo', 'Coletiva PT', 'gleisi-articulacao-2turno-b104-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca pesquisas na vespera da eleicao e diz que so pesquisa que vale e a da urna.', 'As pesquisas sao cambiadas. So vale a pesquisa da urna no dia da votacao.', 'Discurso em Copacabana na vespera do primeiro turno da eleicao presidencial.', 'verified', true, '2022-10-01', 'https://www1.folha.uol.com.br/poder/2022/10/bolsonaro-ataca-pesquisas-copacabana.shtml', 'news_article', 3, 'Rio de Janeiro', 'Vespera do 1o turno', 'bolsonaro-ataca-pesquisas-copacabana-b104-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tenta desqualificar votos do Nordeste em entrevista.', 'O Nordeste vota no Lula por causa do Bolsa Familia. Nao por conviccao politica.', 'Entrevista a Jovem Pan durante campanha do 2o turno.', 'verified', false, '2022-10-18', 'https://www.uol.com.br/eleicoes/2022/bolsonaro-nordeste-bolsa-familia/', 'interview', 3, 'Sao Paulo', 'Jovem Pan', 'bolsonaro-desqualifica-nordeste-b104-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula agradece Nordeste em comicio gigante em Recife.', 'O Nordeste e a fortaleza da democracia. Obrigado, povo nordestino, pela resistencia.', 'Comicio em Recife com mais de 50 mil pessoas durante campanha do 2o turno.', 'verified', true, '2022-10-22', 'https://g1.globo.com/pe/pernambuco/eleicoes/2022/noticia/2022/10/22/lula-comicio-recife.ghtml', 'news_article', 1, 'Recife', 'Comicio em Recife', 'lula-nordeste-recife-b104-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli e denunciada por violencia apos perseguir jornalista com arma em SP.', 'Eu so me defendi. Nao vou pedir desculpas por ter usado minha arma legal.', 'Declaracao a jornalistas apos ser indiciada pela Policia Federal pelo episodio da arma.', 'verified', true, '2022-10-31', 'https://www1.folha.uol.com.br/poder/2022/10/zambelli-denuncia-arma-policia.shtml', 'news_article', 4, 'Sao Paulo', 'Coletiva apos indiciamento', 'zambelli-denuncia-indiciamento-b104-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz silencio estrategico apos derrota no 2o turno e nao comenta resultado.', 'Preciso refletir sobre o resultado. Falarei quando for o momento.', 'Silencio apos derrota para Lula no segundo turno que gerou tensao institucional por 44 horas.', 'verified', true, '2022-10-30', 'https://www1.folha.uol.com.br/poder/2022/10/bolsonaro-silencia-derrota-segundo-turno.shtml', 'news_article', 5, 'Brasilia', 'Silencio no Alvorada', 'bolsonaro-silencio-derrota-b104-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

END $$;
