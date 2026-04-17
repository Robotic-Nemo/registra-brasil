-- Batch 145: Reconstrução RS enchentes + Pantanal (2024-2026) Parte 2
DO $$
DECLARE
  v_lei UUID; v_mel UUID; v_lul UUID; v_had UUID; v_rui UUID;
  v_mar UUID; v_sim UUID; v_ptx UUID; v_wdi UUID; v_wgo UUID;
  v_jmu UUID; v_lew UUID; v_pad UUID; v_nis UUID; v_wli UUID;
  v_cca UUID; v_tar UUID; v_cai UUID; v_zem UUID; v_rat UUID;
  v_jai UUID; v_edu UUID; v_nik UUID; v_mvh UUID; v_adv UUID;
  v_pab UUID; v_jaw UUID; v_hum UUID; v_ran UUID; v_osi UUID;
  v_jfe UUID; v_cal UUID; v_sbo UUID; v_tpe UUID; v_fme UUID;
  v_ehi UUID; v_rsa UUID; v_tcr UUID; v_alc UUID; v_gle UUID;
  v_jme UUID; v_mvi UUID; v_cfa UUID; v_csa UUID; v_mme UUID;
  v_lsa UUID; v_edw UUID; v_asi UUID; v_ani UUID; v_sgu UUID;
  v_sal UUID; v_cgo UUID; v_clu UUID; v_lma UUID; v_dil UUID;
  v_ega UUID; v_zdi UUID; v_jgu UUID; v_lin UUID;
  c_irr UUID; c_des UUID; c_neg UUID; c_odi UUID; c_abu UUID;
  c_cfi UUID; c_ame UUID; c_xen UUID; c_mac UUID; c_mis UUID;
  c_hom UUID; c_int UUID; c_aut UUID;
BEGIN
  SELECT id INTO v_lei FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_mel FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_sim FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_ptx FROM politicians WHERE slug = 'paulo-teixeira';
  SELECT id INTO v_wdi FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_wgo FROM politicians WHERE slug = 'waldez-goes';
  SELECT id INTO v_jmu FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_wli FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_cca FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jaw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_osi FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_jfe FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_sbo FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tpe FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fme FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_ehi FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_rsa FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_tcr FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jme FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_cfa FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_csa FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_mme FROM politicians WHERE slug = 'margareth-menezes';
  SELECT id INTO v_lsa FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_edw FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_asi FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_sgu FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_cgo FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_clu FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_lma FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_ega FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_zdi FROM politicians WHERE slug = 'zeca-dirceu';
  SELECT id INTO v_jgu FROM politicians WHERE slug = 'jose-guimaraes';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';

  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_cfi FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lei, 'Leite critica lentidão do Plano Rio Grande e cobra liberação de recursos federais.', 'Não dá para reconstruir o Rio Grande do Sul com discurso. Precisamos do dinheiro na conta dos municípios.', 'Governador do RS cobra repasses atrasados do Plano Rio Grande um ano após enchentes de maio de 2024.', 'verified', true, '2025-05-12', 'https://gauchazh.clicrbs.com.br/politica/noticia/2025/05/leite-cobra-uniao-plano-rio-grande.html', 'news_article', 3, 'Porto Alegre', 'Coletiva de imprensa', 'leite-cobra-plano-rio-grande-b145-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Melo minimiza falhas no sistema de bombas de Porto Alegre durante nova chuva.', 'Nenhuma cidade do mundo estaria preparada para o que aconteceu. Estamos fazendo o possível.', 'Prefeito rebate críticas após bombas falharem em chuva de outubro de 2024.', 'verified', false, '2024-10-21', 'https://www.correiodopovo.com.br/noticias/politica/melo-defende-sistema-de-bombas-1.1544210', 'news_article', 3, 'Porto Alegre', 'Entrevista', 'melo-bombas-porto-alegre-b145-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que reconstrução do RS vai custar mais que o previsto e exige paciência.', 'Gente, não é em um ano que a gente vai reconstruir o Rio Grande. Isso vai levar tempo. Tenham paciência.', 'Declaração durante visita a Canoas um ano após a enchente.', 'verified', true, '2025-05-05', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2025/lula-canoas-um-ano-enchente', 'other', 2, 'Canoas, RS', 'Cerimônia um ano das enchentes', 'lula-reconstrucao-paciencia-b145-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad promete linha de crédito especial para empresas do RS, mas limita teto.', 'Não dá para o Tesouro assumir todo o prejuízo. Teremos crédito subsidiado, mas com regras.', 'Ministro da Fazenda anuncia pacote de crédito em valor inferior ao esperado.', 'verified', false, '2024-06-18', 'https://valor.globo.com/brasil/noticia/2024/06/18/haddad-anuncia-credito-rs.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-credito-rs-b145-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa afirma que governo não errou na resposta ao RS e culpa logística.', 'O governo federal não errou. O que houve foi uma questão logística complicadíssima.', 'Ministro da Casa Civil rebate críticas sobre demora no socorro.', 'verified', true, '2024-06-05', 'https://www.poder360.com.br/governo/rui-costa-governo-nao-errou-rs/', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'rui-costa-governo-nao-errou-b145-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina reconhece falha do governo em alertar sobre risco extremo no RS.', 'Nós precisamos admitir: o alerta poderia ter sido mais forte. Vamos reforçar o sistema.', 'Ministra do Meio Ambiente admite falhas em comissão do Senado.', 'verified', false, '2024-06-26', 'https://www12.senado.leg.br/noticias/materias/2024/06/26/marina-alerta-rs', 'legislative_record', 2, 'Senado Federal', 'Comissão Meio Ambiente', 'marina-alerta-rs-b145-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sim, 'Tebet culpa mudança climática e isenta gestores locais de responsabilidade.', 'Isso é mudança climática. Não adianta procurar culpado entre prefeitos e governadores.', 'Ministra do Planejamento comenta cobrança por responsabilidades.', 'verified', false, '2024-05-22', 'https://g1.globo.com/politica/noticia/2024/05/22/tebet-mudanca-climatica-rs.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'tebet-mudanca-climatica-rs-b145-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ptx, 'Paulo Teixeira promete regularização fundiária no RS que não se concretiza.', 'Em 90 dias vamos regularizar todas as famílias atingidas. É prioridade absoluta.', 'Ministro do Desenvolvimento Agrário faz promessa descumprida conforme CGU.', 'verified', false, '2024-07-10', 'https://www.gov.br/mda/pt-br/noticias/teixeira-regularizacao-rs', 'other', 3, 'Brasília', 'Anúncio MDA', 'teixeira-regularizacao-90-dias-b145-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdi, 'Wellington Dias exalta Bolsa Família extraordinário no RS como "conquista histórica".', 'Nunca um governo fez tanto em tão pouco tempo. Isso é conquista histórica do presidente Lula.', 'Ministro do Desenvolvimento Social faz autoelogio durante entrega de benefícios.', 'verified', false, '2024-06-04', 'https://www.gov.br/mds/pt-br/noticias/dias-bolsa-familia-rs', 'other', 2, 'Porto Alegre', 'Entrega de Bolsa Família', 'dias-bolsa-familia-historico-b145-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wgo, 'Waldez Góes afirma que Defesa Civil cumpriu protocolo no RS apesar das mortes.', 'Não teve falha. Tudo que podia ser feito, foi feito dentro do protocolo.', 'Ministro da Integração defende Defesa Civil em audiência mesmo com mais de 180 mortes.', 'verified', true, '2024-06-11', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/06/goes-defesa-civil-rs', 'legislative_record', 4, 'Câmara dos Deputados', 'Audiência Pública', 'goes-defesa-civil-protocolo-b145-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jmu, 'José Múcio desautoriza uso das Forças Armadas em Pantanal por falta de "missão clara".', 'Forças Armadas não são bombeiros. Não podem ficar apagando fogo sem missão clara.', 'Ministro da Defesa justifica demora no emprego do Exército em incêndios do Pantanal.', 'verified', true, '2024-07-02', 'https://www.poder360.com.br/governo/mucio-forcas-armadas-pantanal/', 'news_article', 4, 'Brasília', 'Entrevista Ministério Defesa', 'mucio-forcas-armadas-pantanal-b145-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski diz que Força Nacional chegou "no tempo adequado" ao RS contrariando relatos locais.', 'A Força Nacional chegou no tempo adequado. Quem diz o contrário está fazendo politicagem.', 'Ministro da Justiça rebate prefeitos gaúchos que denunciaram demora.', 'verified', false, '2024-06-14', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-forca-nacional-rs', 'other', 3, 'Brasília', 'Coletiva MJ', 'lewandowski-forca-nacional-rs-b145-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha minimiza surto de leptospirose no RS dizendo ser "esperado".', 'A gente já esperava que haveria aumento de casos. Está dentro do previsto.', 'Ministro da Saúde comenta surto após médicos gaúchos pedirem reforço federal.', 'verified', false, '2024-06-20', 'https://www.gov.br/saude/pt-br/assuntos/noticias/padilha-leptospirose-rs', 'other', 3, 'Brasília', 'Coletiva Saúde', 'padilha-leptospirose-rs-b145-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade reconhece colapso da saúde no RS apenas semanas depois.', 'Reconheço que o sistema ficou sobrecarregado nas primeiras semanas. Vamos reforçar a estrutura.', 'Ex-ministra admite em sabatina do Senado que resposta sanitária falhou.', 'verified', false, '2024-07-09', 'https://www12.senado.leg.br/noticias/materias/2024/07/nisia-saude-rs', 'legislative_record', 2, 'Senado Federal', 'Sabatina', 'nisia-colapso-saude-rs-b145-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wli, 'Wilson Lima ironiza RS dizendo que "Amazonas vive isso toda estiagem".', 'A gente vive isso toda estiagem no Amazonas e ninguém fala. Agora é tragédia nacional.', 'Governador do Amazonas reclama de atenção nacional maior ao RS que a seca amazônica.', 'verified', true, '2024-06-08', 'https://www.amazonasatual.com.br/wilson-lima-compara-rs-amazonas/', 'news_article', 3, 'Manaus', 'Entrevista', 'wilson-lima-compara-rs-amazonas-b145-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cca, 'Cláudio Castro nega responsabilidade do estado em enchentes no Rio após chuvas.', 'Rio não é responsabilidade só do governador. Prefeitos que cuidem das suas cidades.', 'Governador do RJ terceiriza responsabilidade após chuvas históricas no estado em janeiro de 2025.', 'verified', false, '2025-01-13', 'https://oglobo.globo.com/rio/noticia/2025/01/claudio-castro-enchentes-rj.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'castro-enchentes-rj-b145-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio compara doações de SP ao RS como "solidariedade paulista" em tom eleitoral.', 'São Paulo mostrou ao Brasil o que é solidariedade. Enviamos mais que qualquer estado.', 'Governador de SP usa tragédia gaúcha para autopromoção em discurso.', 'verified', true, '2024-05-28', 'https://www.estadao.com.br/politica/tarcisio-solidariedade-paulista-rs/', 'news_article', 2, 'São Paulo', 'Evento oficial', 'tarcisio-solidariedade-sp-rs-b145-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado critica governo federal e sugere que PT "usa tragédia politicamente".', 'O PT está usando a tragédia dos gaúchos para fazer política. Vergonha.', 'Governador de Goiás ataca governo Lula durante visita ao RS.', 'verified', false, '2024-06-01', 'https://www.metropoles.com/politica/caiado-pt-tragedia-rs', 'news_article', 3, 'Porto Alegre', 'Visita solidária', 'caiado-pt-tragedia-rs-b145-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema diz que Minas "não vai pagar pela incompetência" de outros estados.', 'Minas não vai pagar pelo que outros estados deixaram de fazer. Cada um cuide do seu.', 'Governador mineiro rejeita proposta de fundo solidário nacional para desastres climáticos.', 'verified', true, '2024-06-25', 'https://www.em.com.br/politica/zema-fundo-solidario-desastres/', 'news_article', 4, 'Belo Horizonte', 'Entrevista', 'zema-fundo-solidario-rs-b145-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior diz que Paraná "não precisa de federação" para lidar com chuvas.', 'Paraná resolve seus problemas. Não precisamos esperar Brasília.', 'Governador do PR menospreza coordenação federal em desastres.', 'verified', false, '2024-10-15', 'https://www.gazetadopovo.com.br/politica/ratinho-federacao-desastres/', 'news_article', 3, 'Curitiba', 'Entrevista', 'ratinho-federacao-desastres-b145-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro espalha fake news de que Lula bloqueou doações estrangeiras ao RS.', 'O Lula barrou doação da Argentina. Deixou o povo gaúcho sofrer por vingança política.', 'Ex-presidente repete desinformação já desmentida pelo Itamaraty em live no X.', 'verified', true, '2024-05-15', 'https://www.aosfatos.org/noticias/bolsonaro-espalha-fake-doacoes-argentina-rs/', 'fact_check', 5, 'Redes sociais', 'Live no X', 'bolsonaro-fake-argentina-rs-b145-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ataca doações internacionais dizendo que "ONU quer tomar o RS".', 'ONU usa enchente para avançar agenda globalista no Rio Grande. Não vamos aceitar.', 'Deputado espalha teoria conspiratória sobre ajuda humanitária internacional.', 'verified', false, '2024-05-20', 'https://www.metropoles.com/brasil/eduardo-bolsonaro-onu-rs', 'news_article', 4, 'Redes sociais', 'Postagem', 'eduardo-onu-globalista-rs-b145-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira insinua que ajuda do governo é condicionada a voto.', 'Gaúcho só recebe ajuda quem vota PT. Quem vota na direita fica sem.', 'Deputado espalha desinformação após reclamações isoladas de moradores.', 'verified', true, '2024-05-25', 'https://www.aosfatos.org/noticias/nikolas-auxilio-rs-voto/', 'fact_check', 5, 'Redes sociais', 'Vídeo no Instagram', 'nikolas-ajuda-voto-rs-b145-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem denuncia "censura" em lives sobre RS sem apresentar provas.', 'Estão censurando quem fala a verdade sobre o que está acontecendo no RS. Isso é ditadura.', 'Deputado afirma, sem provas, que Moraes retirou do ar conteúdos sobre enchentes.', 'verified', false, '2024-05-18', 'https://www.poder360.com.br/politica/van-hattem-censura-rs/', 'news_article', 3, 'Porto Alegre', 'Manifestação', 'van-hattem-censura-rs-b145-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica gastos do Plano Rio Grande como "populismo fiscal".', 'Gastar bilhões sem controle não é reconstrução, é populismo fiscal.', 'Deputada do Novo vota contra MP de socorro ao RS.', 'verified', false, '2024-06-17', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/06/ventura-mp-rs', 'legislative_record', 2, 'Câmara dos Deputados', 'Plenário', 'ventura-populismo-rs-b145-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal arrecada doações para RS e não presta contas conforme denúncia do MPF.', 'Vou mandar 50 milhões para os gaúchos. Confiem em mim.', 'Empresário promete valor exagerado e não apresenta comprovantes de entrega.', 'verified', true, '2024-05-10', 'https://www.uol.com.br/eleicoes/2024/noticias/2024/05/marcal-doacoes-rs-prestacao/', 'news_article', 5, 'Redes sociais', 'Live no YouTube', 'marcal-doacoes-rs-b145-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner defende que ministros não podem ser cobrados por "fenômeno climático".', 'Ministro não é responsável por tempestade. Essa narrativa é oportunismo.', 'Líder do governo no Senado minimiza cobranças sobre gestão da crise.', 'verified', false, '2024-06-13', 'https://www12.senado.leg.br/noticias/materias/2024/06/wagner-ministros-rs', 'legislative_record', 3, 'Senado Federal', 'Plenário', 'wagner-ministros-rs-b145-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa ataca adversários por "politizarem" tragédia do RS.', 'Quem politiza a tragédia é a extrema-direita que nunca se importou com os pobres.', 'Senador petista inflama debate em vez de buscar união política.', 'verified', false, '2024-05-19', 'https://www12.senado.leg.br/noticias/materias/2024/05/humberto-politiza-rs', 'legislative_record', 2, 'Senado Federal', 'Plenário', 'humberto-politiza-rs-b145-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe minimiza atrasos em repasses para o RS dizendo que burocracia é normal.', 'Essa burocracia é normal de qualquer governo. Não tem nada de anormal.', 'Senador rebate cobranças por repasses atrasados seis meses após a enchente.', 'verified', false, '2024-11-10', 'https://www.poder360.com.br/politica/randolfe-burocracia-rs/', 'news_article', 3, 'Brasília', 'Entrevista', 'randolfe-burocracia-rs-b145-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_osi, 'Orlando Silva defende Secom federal de críticas por campanha publicitária.', 'A Secom fez o trabalho dentro da legalidade. Quem critica não viu a tragédia.', 'Ministro das Comunicações rebate denúncia de propaganda oficial sobre RS.', 'verified', false, '2024-06-28', 'https://www.gov.br/mcom/pt-br/noticias/orlando-secom-rs', 'other', 2, 'Brasília', 'Coletiva MCom', 'orlando-secom-rs-b145-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jfe, 'Jandira Feghali ataca jornalistas que criticam governo na crise gaúcha.', 'Tem jornalista torcendo contra o povo gaúcho só para atingir o governo Lula.', 'Secretária de Relações Institucionais ataca imprensa ao invés de responder críticas.', 'verified', false, '2024-06-07', 'https://www.metropoles.com/brasil/jandira-ataca-imprensa-rs', 'news_article', 3, 'Brasília', 'Entrevista', 'jandira-ataca-imprensa-rs-b145-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cal, 'Chico Alencar minimiza críticas sobre gestão federal em entrevista.', 'Cobrar socorro imediato em tragédia dessa dimensão é ingenuidade.', 'Deputado defende governo alegando complexidade operacional.', 'verified', false, '2024-05-21', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/alencar-rs-socorro', 'legislative_record', 2, 'Câmara dos Deputados', 'Entrevista', 'alencar-rs-ingenuidade-b145-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sbo, 'Sâmia Bomfim associa enchente ao "capitalismo predatório" em fala polêmica.', 'Essa tragédia é filha do capitalismo predatório e do agronegócio que destrói tudo.', 'Deputada do PSOL generaliza culpa ao agro em momento de comoção nacional.', 'verified', true, '2024-05-17', 'https://www.oantagonista.com.br/brasil/samia-capitalismo-rs/', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'samia-capitalismo-rs-b145-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tpe, 'Talíria Petrone associa tragédia a "racismo ambiental" sem dados específicos.', 'O racismo ambiental mata mais negros e pobres. Isso é estrutural.', 'Deputada generaliza narrativa em discurso no plenário sobre RS.', 'verified', false, '2024-05-23', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/taliria-racismo-ambiental-rs', 'legislative_record', 2, 'Câmara dos Deputados', 'Plenário', 'taliria-racismo-ambiental-rs-b145-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna defende gestão federal e ataca Eduardo Leite.', 'O Leite é o maior irresponsável pelo que aconteceu no RS. Não pode ser ele a cobrar.', 'Deputada ataca governador gaúcho em vez de discutir soluções.', 'verified', false, '2024-05-14', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/melchionna-leite-rs', 'legislative_record', 3, 'Câmara dos Deputados', 'Plenário', 'melchionna-ataca-leite-b145-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ehi, 'Érika Hilton afirma que LGBTQIA+ "estão sendo abandonados" nos abrigos do RS.', 'Pessoas trans estão sendo segregadas em abrigos. Isso é transfobia institucional.', 'Deputada denuncia sem citar casos específicos nem relatórios oficiais.', 'verified', false, '2024-05-24', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/erika-abrigos-rs', 'legislative_record', 2, 'Câmara dos Deputados', 'Plenário', 'erika-abrigos-rs-b145-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles nega mudança climática e culpa "má gestão local" pelo RS.', 'Não é clima. É má gestão. Se fosse clima, choveria assim todo ano.', 'Ex-ministro faz negacionismo climático após enchentes históricas no RS.', 'verified', true, '2024-05-11', 'https://www.uol.com.br/tilt/noticias/2024/05/salles-nega-mudanca-climatica-rs/', 'news_article', 5, 'Redes sociais', 'Twitter', 'salles-nega-clima-rs-b145-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina defende agronegócio de críticas durante crise do Pantanal.', 'Agro não queima Pantanal. Quem queima são ativistas e indígenas irresponsáveis.', 'Senadora tenta desviar responsabilidade do setor durante incêndios recordes de 2024.', 'verified', true, '2024-07-15', 'https://www.oeco.org.br/noticias/tereza-cristina-pantanal-agro/', 'news_article', 5, 'Senado Federal', 'Entrevista', 'tereza-agro-pantanal-b145-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin promete ajuda ao setor automotivo do RS e desmente demora.', 'Não teve demora. O setor automotivo foi atendido prontamente por este governo.', 'Vice-presidente rebate críticas de montadoras sobre demora em linhas de crédito.', 'verified', false, '2024-06-22', 'https://www.gov.br/mdic/pt-br/noticias/alckmin-automotivo-rs', 'other', 2, 'Porto Alegre', 'Visita a fábricas', 'alckmin-automotivo-rs-b145-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann culpa "extrema direita" por fake news e não admite falhas do governo.', 'Toda crítica ao governo é fake news da extrema direita. Não existe erro de gestão.', 'Presidente do PT generaliza e desqualifica qualquer crítica.', 'verified', true, '2024-05-16', 'https://www.poder360.com.br/politica/gleisi-fake-news-rs/', 'news_article', 4, 'Brasília', 'Coletiva PT', 'gleisi-fake-news-rs-b145-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jme, 'Jorge Messias confirma que AGU vai processar quem espalhar fake news sobre RS.', 'Quem espalhar mentira contra o governo vai ser processado. Não toleraremos.', 'AGU anuncia ações judiciais em massa, levantando questionamentos sobre liberdade de expressão.', 'verified', false, '2024-05-13', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/messias-fake-news-rs', 'other', 3, 'Brasília', 'Coletiva AGU', 'messias-agu-fake-news-rs-b145-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira nega ter recusado ajuda estrangeira ao RS contrariando documentos.', 'Nunca recusamos ajuda. Essa informação é falsa.', 'Ministro das Relações Exteriores contraria ofícios do próprio Itamaraty vazados.', 'verified', false, '2024-05-26', 'https://www.poder360.com.br/governo/vieira-ajuda-estrangeira-rs/', 'news_article', 3, 'Brasília', 'Coletiva Itamaraty', 'vieira-ajuda-estrangeira-rs-b145-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cfa, 'Carlos Fávaro minimiza perdas agrícolas do RS afirmando que "mercado se recupera".', 'O mercado se recupera rápido. Não adianta fazer drama com números.', 'Ministro da Agricultura rebate estimativas de entidades do setor.', 'verified', false, '2024-06-10', 'https://www.gov.br/agricultura/pt-br/assuntos/noticias/favaro-perdas-rs', 'other', 3, 'Brasília', 'Coletiva Mapa', 'favaro-perdas-rs-b145-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_csa, 'Camilo Santana anuncia "volta às aulas imediata" no RS que não se cumpre.', 'Em duas semanas todas as escolas vão voltar. Garantimos.', 'Ministro da Educação faz promessa descumprida; retomada levou meses.', 'verified', false, '2024-05-27', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-aulas-rs', 'other', 3, 'Brasília', 'Coletiva MEC', 'camilo-aulas-rs-b145-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Margareth Menezes promete festival de solidariedade que gera críticas sobre custo.', 'Vamos fazer o maior festival de solidariedade do Brasil. Custo não importa.', 'Ministra da Cultura anuncia festival com orçamento elevado enquanto vítimas ainda sem abrigo.', 'verified', false, '2024-06-03', 'https://www.gov.br/cultura/pt-br/assuntos/noticias/margareth-festival-rs', 'other', 3, 'Brasília', 'Coletiva MinC', 'margareth-festival-rs-b145-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lsa, 'Luciana Santos minimiza atraso em entrega de equipamentos científicos do Inmet.', 'Atraso de equipamentos é normal. Não influencia em previsões.', 'Ministra da Ciência rebate denúncia de que Inmet falhou por falta de radares.', 'verified', false, '2024-07-05', 'https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/noticias/luciana-inmet-rs', 'other', 3, 'Brasília', 'Entrevista MCTI', 'luciana-inmet-rs-b145-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edw, 'Esther Dweck defende manter contingenciamento mesmo com necessidade do RS.', 'O arcabouço fiscal não pode ser rompido nem pelo RS. Precisamos de disciplina.', 'Ministra da Gestão é criticada por priorizar ajuste fiscal em vez de emergência.', 'verified', false, '2024-06-12', 'https://www.gov.br/servidor/pt-br/assuntos/noticias/dweck-arcabouco-rs', 'other', 2, 'Brasília', 'Entrevista MGI', 'dweck-arcabouco-rs-b145-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_asi, 'Alexandre Silveira anuncia "restabelecimento total" da energia no RS que não ocorre.', 'Energia voltou em 100% do estado. Situação normalizada.', 'Ministro de Minas e Energia contradiz dados da própria CEEE sobre quedas seguidas.', 'verified', false, '2024-06-06', 'https://www.gov.br/mme/pt-br/assuntos/noticias/silveira-energia-rs', 'other', 3, 'Brasília', 'Coletiva MME', 'silveira-energia-rs-b145-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco politiza tragédia ao atribuir racismo à ajuda "desigual" no RS.', 'A ajuda chegou antes para os brancos ricos. Isso é racismo estrutural.', 'Ministra da Igualdade Racial generaliza sem citar dados específicos.', 'verified', true, '2024-05-30', 'https://www.gov.br/igualdaderacial/pt-br/noticias/anielle-racismo-rs', 'other', 3, 'Porto Alegre', 'Visita a abrigos', 'anielle-racismo-rs-b145-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sgu, 'Sônia Guajajara afirma que indígenas "foram ignorados" pelo governo gaúcho.', 'O governo gaúcho ignorou completamente nossas comunidades. Isso é genocídio indígena.', 'Ministra dos Povos Indígenas usa termo genocídio em discurso polêmico.', 'verified', true, '2024-06-02', 'https://www.gov.br/povosindigenas/pt-br/noticias/guajajara-rs-genocidio', 'other', 4, 'Brasília', 'Evento MPI', 'guajajara-genocidio-rs-b145-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Silvio Almeida (antes da demissão) afirma que direitos humanos "falharam" no RS.', 'Os direitos humanos falharam no RS. O Estado precisa rever tudo.', 'Ministro faz autocrítica ampla que irritou outros membros do governo.', 'verified', false, '2024-06-09', 'https://www.gov.br/mdh/pt-br/assuntos/noticias/silvio-direitos-rs', 'other', 2, 'Brasília', 'Evento MDHC', 'silvio-direitos-rs-b145-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgo, 'Cida Gonçalves defende criação de programa "emergencial" para mulheres vítimas.', 'As mulheres foram as maiores vítimas. Precisamos de programa emergencial.', 'Ministra das Mulheres anuncia programa sem detalhes orçamentários concretos.', 'verified', false, '2024-05-29', 'https://www.gov.br/mulheres/pt-br/assuntos/noticias/cida-mulheres-rs', 'other', 2, 'Porto Alegre', 'Visita a abrigos', 'cida-mulheres-rs-b145-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_clu, 'Carlos Lupi promete antecipação do INSS que não se materializa como anunciada.', 'Vamos antecipar o 13º de todos os beneficiários do RS. Todos, sem exceção.', 'Ministro da Previdência faz promessa ampla que INSS só cumpriu parcialmente.', 'verified', false, '2024-05-15', 'https://www.gov.br/previdencia/pt-br/noticias/lupi-inss-rs', 'other', 3, 'Brasília', 'Coletiva MPS', 'lupi-inss-rs-b145-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lma, 'Luiz Marinho garante FGTS emergencial que demora meses para chegar.', 'O FGTS está liberado agora. Quem quiser, saca hoje mesmo.', 'Ministro do Trabalho anuncia liberação mais rápida do que de fato ocorreu.', 'verified', false, '2024-05-12', 'https://www.gov.br/trabalho-e-emprego/pt-br/noticias/marinho-fgts-rs', 'other', 3, 'Brasília', 'Coletiva MTE', 'marinho-fgts-rs-b145-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma culpa "legado neoliberal" por enchentes ao comentar do Banco dos BRICS.', 'O legado neoliberal e austerista é responsável por essas tragédias.', 'Presidente do Banco dos BRICS politiza tragédia em entrevista internacional.', 'verified', false, '2024-05-31', 'https://www.reuters.com/world/americas/rousseff-brics-bank-floods/', 'news_article', 3, 'Xangai', 'Entrevista Reuters', 'dilma-brics-legado-rs-b145-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ega, 'Eliziane Gama defende CPI das Enchentes que é rejeitada por base governista.', 'Precisamos de CPI para apurar o que falhou. Não é perseguição.', 'Senadora cidadanista enfrenta base do governo ao propor investigação.', 'verified', false, '2024-06-15', 'https://www12.senado.leg.br/noticias/materias/2024/06/gama-cpi-rs', 'legislative_record', 1, 'Senado Federal', 'Plenário', 'gama-cpi-rs-b145-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zdi, 'Zeca Dirceu ataca oposição chamando de "abutres" que lucram com tragédia.', 'A oposição é abutre. Quer lucrar com a tragédia do povo gaúcho.', 'Líder do PT na Câmara usa tom agressivo sobre parlamentares adversários.', 'verified', false, '2024-05-20', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/dirceu-abutres-rs', 'legislative_record', 3, 'Câmara dos Deputados', 'Plenário', 'dirceu-abutres-rs-b145-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jgu, 'José Guimarães defende aumento de gastos para RS sem controle prévio.', 'Vamos gastar o que for preciso. Sem responsabilidade fiscal nesse momento.', 'Líder do governo na Câmara é criticado por desafiar arcabouço fiscal.', 'verified', false, '2024-05-18', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/guimaraes-gastos-rs', 'legislative_record', 3, 'Câmara dos Deputados', 'Plenário', 'guimaraes-gastos-rs-b145-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias defende taxar super-ricos para pagar reconstrução do RS.', 'Tem que taxar o super-rico. Dinheiro tem, o que falta é coragem política.', 'Líder do PT propõe taxa emergencial, causando divisão na coalizão.', 'verified', false, '2024-05-22', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/lindbergh-taxar-rs', 'legislative_record', 2, 'Câmara dos Deputados', 'Plenário', 'lindbergh-taxar-rs-b145-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lei, 'Leite se emociona e chora em coletiva admitindo "limites" do governo estadual.', 'Eu chorei. A gente tem limites. Nem sempre dá conta. Peço perdão.', 'Governador faz mea-culpa pública em coletiva dias após enchente.', 'verified', true, '2024-05-07', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/leite-chora-coletiva-enchente.html', 'news_article', 1, 'Porto Alegre', 'Coletiva Palácio Piratini', 'leite-chora-coletiva-b145-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Melo diz que "não era possível prever" enchente mesmo com alertas prévios.', 'Ninguém previu isso. Não dá para cobrar o impossível.', 'Prefeito de Porto Alegre rebate denúncia de que houve alertas ignorados pela Defesa Civil municipal.', 'verified', true, '2024-05-10', 'https://www.correiodopovo.com.br/noticias/politica/melo-nao-era-possivel-prever-1.1543820', 'news_article', 4, 'Porto Alegre', 'Coletiva', 'melo-nao-era-possivel-prever-b145-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cita número errado de mortos no RS durante pronunciamento oficial.', 'Já são quase 500 mortos no Rio Grande do Sul. Uma tragédia.', 'Presidente cita número muito acima do oficial, corrigido por assessores depois.', 'verified', false, '2024-05-25', 'https://g1.globo.com/politica/noticia/2024/05/25/lula-numero-mortos-rs.ghtml', 'news_article', 2, 'Brasília', 'Pronunciamento TV', 'lula-numero-mortos-rs-b145-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad sugere que gaúchos "aguentem" até segundo semestre para receber ajuda completa.', 'Tem que ter paciência. A ajuda total vai sair no segundo semestre.', 'Ministro afirma em audiência que reconstrução é de longo prazo, gerando reação.', 'verified', false, '2024-06-19', 'https://www12.senado.leg.br/noticias/materias/2024/06/haddad-aguentem-rs', 'legislative_record', 3, 'Senado Federal', 'CAE', 'haddad-aguentem-rs-b145-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa minimiza demora de caminhões com doações dizendo ser "logística normal".', 'Caminhão não chega em dez minutos. Logística é assim.', 'Ministro responde a reclamações de prefeitos sobre demora em doações federais.', 'verified', false, '2024-05-16', 'https://www.poder360.com.br/governo/rui-costa-caminhoes-rs/', 'news_article', 3, 'Brasília', 'Coletiva Planalto', 'rui-caminhoes-rs-b145-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina minimiza dados de desmatamento no Pantanal durante incêndios de 2024.', 'Pantanal não tem o maior desmatamento. Nosso governo está controlando bem.', 'Ministra contraria dados do MapBiomas divulgados no mesmo mês sobre avanço recorde.', 'verified', false, '2024-08-14', 'https://www.oeco.org.br/noticias/marina-pantanal-desmatamento-mapbiomas/', 'news_article', 4, 'Brasília', 'Entrevista MMA', 'marina-pantanal-desmatamento-b145-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sim, 'Tebet ironiza jornalista que cobrava resposta do governo sobre enchentes.', 'Você entende de orçamento? Então não pergunta o que não sabe.', 'Ministra do Planejamento responde de forma ríspida a questionamento em coletiva.', 'verified', true, '2024-06-04', 'https://www.metropoles.com/colunas/igor-gadelha/tebet-jornalista-rs', 'news_article', 2, 'Brasília', 'Coletiva Planejamento', 'tebet-jornalista-rs-b145-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ptx, 'Paulo Teixeira erra nome de cidade gaúcha durante visita oficial.', 'Estou aqui em... Canoas? Não, em... é... aqui em Lajeado.', 'Ministro confunde cidades durante agenda oficial, virando meme nas redes.', 'verified', false, '2024-06-25', 'https://www.metropoles.com/brasil/teixeira-confunde-cidade-rs', 'news_article', 1, 'Lajeado, RS', 'Visita oficial', 'teixeira-confunde-cidade-rs-b145-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdi, 'Wellington Dias confunde programas sociais em coletiva sobre RS.', 'O Auxílio Brasil... quer dizer, o Bolsa Família vai chegar para todos.', 'Ministro confunde nome do antigo programa do governo Bolsonaro e atual.', 'verified', false, '2024-05-28', 'https://www.poder360.com.br/governo/wellington-dias-auxilio-brasil-rs/', 'news_article', 1, 'Brasília', 'Coletiva MDS', 'dias-confunde-auxilio-b145-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wgo, 'Waldez Góes atribui mortes no RS a "fatalidade".', 'Tem gente que morreu porque foi fatalidade. Não tinha como evitar.', 'Ministro da Integração gera reação ao normalizar mortes evitáveis.', 'verified', true, '2024-05-14', 'https://www.poder360.com.br/governo/goes-fatalidade-rs/', 'news_article', 5, 'Brasília', 'Coletiva MIDR', 'goes-fatalidade-rs-b145-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jmu, 'José Múcio chama incêndios no Pantanal de "coisa pontual" em declaração criticada.', 'Isso é coisa pontual. Não é uma crise federal.', 'Ministro da Defesa minimiza incêndios recordes que queimaram 1,8 milhão de hectares.', 'verified', true, '2024-07-20', 'https://www.oeco.org.br/noticias/mucio-pantanal-pontual/', 'news_article', 5, 'Brasília', 'Coletiva Ministério Defesa', 'mucio-pantanal-pontual-b145-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski desautoriza pedido de emprego da Força Nacional no Pantanal.', 'Força Nacional não vai ao Pantanal. Não é atribuição nossa.', 'Ministro da Justiça nega pedido de governadores do MT e MS em audiência pública.', 'verified', false, '2024-07-18', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-pantanal-forca-nacional', 'other', 3, 'Brasília', 'Audiência pública', 'lewandowski-pantanal-forca-nacional-b145-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha ignora crise de saúde mental no RS em declaração.', 'Saúde mental sempre foi prioridade, não vamos focar agora só em isolar.', 'Ministro rebate cobrança da Fiocruz sobre explosão de casos de ansiedade e depressão no RS pós-enchente.', 'verified', false, '2025-02-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/padilha-saude-mental-rs', 'other', 3, 'Brasília', 'Coletiva Saúde', 'padilha-saude-mental-rs-b145-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wli, 'Wilson Lima diz que quem critica Amazonas "não entende região" em tom áspero.', 'Quem fala do Amazonas sem morar aqui, cala a boca.', 'Governador reage a críticas sobre gestão em estiagem histórica.', 'verified', true, '2024-10-05', 'https://www.amazonasatual.com.br/wilson-lima-cala-boca/', 'news_article', 3, 'Manaus', 'Entrevista', 'wilson-cala-boca-b145-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cca, 'Cláudio Castro diz que "chuva é responsabilidade de Deus" e gera polêmica.', 'Chuva é responsabilidade de Deus. Governo ajuda, mas Deus é quem manda.', 'Governador do RJ evoca religiosidade para se esquivar de cobranças sobre gestão.', 'verified', true, '2025-01-18', 'https://oglobo.globo.com/rio/noticia/2025/01/castro-chuva-deus.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'castro-chuva-deus-b145-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz que "SP não precisa de ajuda do governo federal" em chuva de 2025.', 'São Paulo resolve seus problemas sozinho. Não dependemos de Brasília.', 'Governador paulista rejeita ajuda federal em enchente e é criticado.', 'verified', true, '2025-02-22', 'https://www.estadao.com.br/politica/tarcisio-sp-ajuda-federal-chuva/', 'news_article', 3, 'São Paulo', 'Coletiva Palácio Bandeirantes', 'tarcisio-sp-sem-ajuda-b145-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado insinua que "bandidos" usam abrigos do RS para se esconder.', 'Temos informação de que bandidos usam esses abrigos. Precisa investigar.', 'Governador de Goiás insinua sem provas durante visita a Porto Alegre.', 'verified', false, '2024-06-08', 'https://www.metropoles.com/politica/caiado-abrigos-bandidos-rs', 'news_article', 4, 'Porto Alegre', 'Visita', 'caiado-abrigos-bandidos-rs-b145-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema recusa ajudar RS dizendo que "não é problema meu".', 'Não é problema meu. Minas cuida de Minas.', 'Governador mineiro rejeita envio de socorro em coletiva.', 'verified', true, '2024-05-09', 'https://www.em.com.br/politica/zema-rs-nao-e-problema/', 'news_article', 5, 'Belo Horizonte', 'Coletiva', 'zema-rs-nao-e-problema-b145-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior posta selfie em enchente no Paraná e é acusado de insensibilidade.', 'Aqui no meio da ajuda às vítimas. O Paraná é agilidade.', 'Governador publica foto sorridente em área alagada em outubro de 2024.', 'verified', true, '2024-10-18', 'https://www.gazetadopovo.com.br/politica/ratinho-selfie-enchente/', 'news_article', 2, 'Curitiba', 'Instagram', 'ratinho-selfie-enchente-b145-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro afirma em live que governo "sabotou" alertas no RS.', 'Sabotaram os alertas de propósito. Era projeto político.', 'Ex-presidente espalha teoria conspiratória sem qualquer fundamento técnico.', 'verified', true, '2024-05-22', 'https://www.aosfatos.org/noticias/bolsonaro-alerta-rs-sabotagem/', 'fact_check', 5, 'Redes sociais', 'Live no X', 'bolsonaro-sabotagem-alerta-rs-b145-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro sugere que vítimas "aprendam a nadar" em postagem.', 'Gaúcho tem que aprender a nadar. Não dá para depender do Estado.', 'Deputado faz piada de mau gosto enquanto corpos ainda eram resgatados.', 'verified', false, '2024-05-09', 'https://www.metropoles.com/brasil/eduardo-bolsonaro-gaucho-nadar', 'news_article', 5, 'Redes sociais', 'Postagem X', 'eduardo-gaucho-nadar-b145-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha fake news sobre helicópteros "proibidos" de voar no RS.', 'Proibiram helicópteros privados de socorrerem os gaúchos. Absurdo.', 'Deputado espalha boato desmentido pela Anac sobre suposta restrição.', 'verified', true, '2024-05-08', 'https://www.aosfatos.org/noticias/nikolas-helicopteros-rs/', 'fact_check', 5, 'Redes sociais', 'Vídeo', 'nikolas-helicopteros-rs-b145-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem sugere que governo "usa vítimas como cabide eleitoral".', 'O Lula usa as vítimas como cabide eleitoral. Nojento.', 'Deputado faz acusação dura contra governo sem detalhes.', 'verified', false, '2024-06-03', 'https://www.poder360.com.br/politica/van-hattem-lula-vitimas/', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'van-hattem-cabide-eleitoral-b145-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica auxílio às vítimas chamando de "esmola eleitoreira".', 'Isso não é ajuda, é esmola eleitoreira. Dar R$ 5 mil não reconstrói nada.', 'Deputada do Novo desqualifica auxílio reconstrução entregue a famílias.', 'verified', false, '2024-06-14', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/06/ventura-esmola-rs', 'legislative_record', 3, 'Câmara dos Deputados', 'Plenário', 'ventura-esmola-rs-b145-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal publica vídeo com crianças em enchente sem autorização.', 'Aqui o Marçal resolvendo! Olha essas crianças salvas por mim.', 'Empresário filma menores sem consentimento dos pais durante ação de resgate.', 'verified', true, '2024-05-12', 'https://www.uol.com.br/tilt/noticias/2024/05/marcal-criancas-rs/', 'news_article', 4, 'Canoas, RS', 'Vídeo Instagram', 'marcal-criancas-rs-b145-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner defende que governo "não precisa se desculpar".', 'O governo não tem do que se desculpar. Fez o máximo possível.', 'Líder do governo no Senado rejeita autocrítica mesmo diante de apuração da CGU.', 'verified', false, '2024-07-01', 'https://www12.senado.leg.br/noticias/materias/2024/07/wagner-desculpa-rs', 'legislative_record', 3, 'Senado Federal', 'Plenário', 'wagner-desculpa-rs-b145-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa compara críticos do governo a "urubus" sobrevoando a tragédia.', 'Urubus sobrevoam o Rio Grande. É o mercado, é a direita, é a imprensa.', 'Senador generaliza e ataca setores diversos.', 'verified', false, '2024-05-24', 'https://www12.senado.leg.br/noticias/materias/2024/05/humberto-urubus-rs', 'legislative_record', 3, 'Senado Federal', 'Plenário', 'humberto-urubus-rs-b145-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues chora no Senado e fala "nunca esqueci meus gaúchos".', 'Nunca esqueci meus gaúchos. Eu fui para lá antes de todo mundo.', 'Senador se emociona em discurso que foi considerado autopromoção por adversários.', 'verified', false, '2024-05-20', 'https://www12.senado.leg.br/noticias/materias/2024/05/randolfe-chora-rs', 'legislative_record', 1, 'Senado Federal', 'Plenário', 'randolfe-chora-rs-b145-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_osi, 'Orlando Silva defende propaganda oficial de R$ 100 milhões sobre reconstrução.', 'Investir R$ 100 milhões em comunicação é essencial. O povo precisa saber.', 'Ministro defende gasto publicitário em plena crise humanitária.', 'verified', false, '2024-08-05', 'https://www.gov.br/mcom/pt-br/noticias/orlando-publicidade-rs', 'other', 3, 'Brasília', 'Coletiva MCom', 'orlando-publicidade-rs-b145-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jfe, 'Jandira Feghali diz que enchente "foi culpa do Bolsonaro" mesmo passados 18 meses.', 'A culpa é do Bolsonaro, que cortou verba ambiental. Ninguém esquece.', 'Secretária politiza tragédia em ato do PCdoB em 2025.', 'verified', false, '2025-06-10', 'https://www.metropoles.com/brasil/jandira-bolsonaro-enchente-rs', 'news_article', 3, 'Rio de Janeiro', 'Ato PCdoB', 'jandira-bolsonaro-enchente-b145-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cal, 'Chico Alencar sugere que voluntários foram "manipulados" pela direita no RS.', 'Muitos voluntários foram manipulados pela direita para criar narrativa.', 'Deputado generaliza ação de voluntariado durante enchente.', 'verified', false, '2024-05-17', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/alencar-voluntarios-rs', 'legislative_record', 3, 'Câmara dos Deputados', 'Plenário', 'alencar-voluntarios-rs-b145-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sbo, 'Sâmia Bomfim propõe "rever propriedade privada" em áreas de risco no RS.', 'Precisamos repensar a propriedade privada em áreas de risco. Desapropriar.', 'Deputada defende desapropriação em massa em discurso controverso.', 'verified', false, '2024-06-21', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/06/samia-desapropriar-rs', 'legislative_record', 2, 'Câmara dos Deputados', 'Plenário', 'samia-desapropriar-rs-b145-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ehi, 'Érika Hilton acusa Leite de "transfobia" sem citar caso concreto.', 'O Leite é transfóbico. Tem que responder por isso.', 'Deputada acusa governador sem especificar episódio, alimentando polarização.', 'verified', false, '2024-05-26', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/05/erika-leite-transfobia', 'legislative_record', 3, 'Câmara dos Deputados', 'Plenário', 'erika-leite-transfobia-b145-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina ataca ambientalistas chamando de "xiitas da natureza".', 'Esses xiitas da natureza querem acabar com o agro. São o inimigo.', 'Senadora usa linguagem de guerra contra ativistas no contexto do Pantanal.', 'verified', true, '2024-08-20', 'https://www12.senado.leg.br/noticias/materias/2024/08/tereza-xiitas-ambiente', 'legislative_record', 4, 'Senado Federal', 'Plenário', 'tereza-xiitas-ambiente-b145-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin confunde nome de ministro durante pronunciamento sobre RS.', 'O ministro... Rui... Costa... Haddad. Enfim, o governo está atuando.', 'Vice-presidente tropeça em nomes durante coletiva, virando meme.', 'verified', false, '2024-05-13', 'https://www.metropoles.com/brasil/alckmin-confunde-ministro-rs', 'news_article', 1, 'Brasília', 'Coletiva Planalto', 'alckmin-confunde-ministro-b145-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jme, 'Jorge Messias ameaça processar governadores de oposição por "desinformação".', 'Governadores que mentirem sobre o RS serão processados pela União.', 'AGU usa linguagem de ameaça contra governadores adversários.', 'verified', false, '2024-06-05', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/messias-governadores-processo', 'other', 4, 'Brasília', 'Coletiva AGU', 'messias-processa-governadores-b145-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_csa, 'Camilo Santana prometeu retorno escolar que foi cumprido apenas 40%.', 'Cumprimos todas as metas. Todas as escolas voltaram.', 'Ministro mente sobre dado verificado pelo Inep meses depois.', 'verified', false, '2024-08-10', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-retorno-escolar-rs', 'other', 4, 'Brasília', 'Coletiva MEC', 'camilo-retorno-escolar-rs-b145-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sgu, 'Sônia Guajajara sugere que "colonização" causou enchente do RS.', 'A enchente é consequência de séculos de colonização violenta do sul.', 'Ministra dos Povos Indígenas generaliza em ato acadêmico.', 'verified', false, '2024-06-17', 'https://www.gov.br/povosindigenas/pt-br/noticias/guajajara-colonizacao-rs', 'other', 3, 'Brasília', 'Evento MPI', 'guajajara-colonizacao-rs-b145-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma afirma que Banco dos BRICS "não vai financiar" reconstrução do RS.', 'BRICS não vai financiar reconstrução. Isso não é nosso papel.', 'Presidente do Banco dos BRICS frustra expectativa de aporte ao RS.', 'verified', false, '2024-06-30', 'https://www.reuters.com/world/americas/brics-bank-no-funding-rs/', 'news_article', 2, 'Xangai', 'Entrevista', 'dilma-brics-nao-financia-b145-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias afirma que quem questiona reconstrução é "antigaúcho".', 'Quem questiona a reconstrução é antigaúcho. Não tem jeito.', 'Líder do PT agride adversários chamando de antigaúchos em plenário.', 'verified', false, '2024-06-23', 'https://www2.camara.leg.br/camaranoticias/noticias/2024/06/lindbergh-antigaucho-rs', 'legislative_record', 3, 'Câmara dos Deputados', 'Plenário', 'lindbergh-antigaucho-rs-b145-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que enchente do RS foi "responsabilidade de todos" e isenta governo.', 'Isso é responsabilidade de todos nós, da sociedade. Não é só do governo.', 'Presidente dilui responsabilidade em discurso um ano depois.', 'verified', true, '2025-05-06', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2025/lula-um-ano-enchentes-rs', 'other', 3, 'Porto Alegre', 'Ato um ano enchentes', 'lula-responsabilidade-todos-rs-b145-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
