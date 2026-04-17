DO $$
DECLARE
  v_jair UUID;
  v_edu  UUID;
  v_fla  UUID;
  v_car  UUID;
  v_dam  UUID;
  v_sal  UUID;
  v_mor  UUID;
  v_mou  UUID;
  v_gue  UUID;
  v_tcr  UUID;
  v_mfe  UUID;
  v_mag  UUID;
  v_sil  UUID;
  v_zam  UUID;
  v_dsi  UUID;
  v_bia  UUID;
  v_mvh  UUID;
  v_kim  UUID;
  v_tab  UUID;
  v_chi  UUID;
  v_jan  UUID;
  v_frx  UUID;
  v_gle  UUID;
  v_lul  UUID;
  v_axm  UUID;
  v_gil  UUID;
  v_bar  UUID;
  v_fac  UUID;
  v_sar  UUID;
  v_tem  UUID;
  v_fhc  UUID;
  v_dil  UUID;
  v_hum  UUID;
  v_ott  UUID;
  v_oma  UUID;
  v_ren  UUID;
  v_ran  UUID;
  v_alr  UUID;
  v_pac  UUID;
  v_joa  UUID;

  c_ant UUID;
  c_des UUID;
  c_vio UUID;
  c_neg UUID;
  c_abu UUID;
  c_aut UUID;
  c_odi UUID;
  c_irr UUID;
  c_hom UUID;
  c_mac UUID;
  c_rac UUID;
  c_int UUID;
  c_obs UUID;
  c_ame UUID;
  c_con UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_sal  FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_gue  FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_tcr  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_mfe  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_mag  FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sil  FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_dsi  FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_bia  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mvh  FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim  FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_tab  FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_chi  FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_frx  FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lul  FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_axm  FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil  FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_bar  FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_fac  FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_sar  FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_tem  FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_fhc  FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_dil  FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_hum  FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ott  FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_oma  FROM politicians WHERE slug = 'omar-aziz';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_ran  FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_alr  FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac  FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_joa  FROM politicians WHERE slug = 'joao-azevedo';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica medidas de Doria em São Paulo e diz que "bolsonarismo salvou vidas".', 'Se fosse pelo governador tucano, o Brasil estaria quebrado. Aqui o bolsonarismo salvou vidas e empregos.', 'Declaração em 14 de julho de 2020 atacando gestão paulista de Covid.', 'verified', false, '2020-07-14', 'https://www1.folha.uol.com.br/poder/2020/07/bolsonaro-doria-sp-covid.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-bolsonarismo-salvou-vidas-b101-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro aglomera em motociata durante pandemia em Brasília.', 'Moto é liberdade. Não tem pandemia que me impeça de andar com meu povo.', 'Motociata em 9 de maio de 2020 com centenas de apoiadores sem máscara.', 'verified', true, '2020-05-09', 'https://g1.globo.com/politica/noticia/2020/05/09/bolsonaro-motociata-brasilia-aglomeracao.ghtml', 'news_article', 4, 'Brasília', 'Motociata', 'bolsonaro-motociata-maio-b101-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nomeia 16 militares sem formação para pastas técnicas no Ministério da Saúde.', 'O Exército tem gente capaz. Vai militarizar a Saúde e resolver rapidamente.', 'Declaração em 28 de maio de 2020 ao confirmar indicações.', 'verified', false, '2020-05-28', 'https://www1.folha.uol.com.br/poder/2020/05/militares-ocupam-ministerio-saude.shtml', 'news_article', 3, 'Palácio do Planalto', 'Anúncio de nomeações', 'bolsonaro-militariza-saude-b101-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso rejeita decreto que tentava anistiar autoridades por decisões na pandemia.', 'Agentes públicos responderão por atos que violem direitos fundamentais mesmo em pandemia.', 'Decisão em ADI 6421 em 22 de maio de 2020 sobre a MP 966/2020.', 'verified', false, '2020-05-22', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=443544', 'diario_oficial', 1, 'Supremo Tribunal Federal', 'Julgamento ADI 6421', 'barroso-mp-anistia-pandemia-b101-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro fala em "excesso de mortes na cova" como se fosse natural.', 'As mortes são lamentáveis, mas há pessoas que morreriam de qualquer jeito. Inchado.', 'Declaração em 3 de junho de 2020 ao contestar números oficiais.', 'verified', false, '2020-06-03', 'https://g1.globo.com/politica/noticia/2020/06/03/bolsonaro-excesso-de-mortes-inchado.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-excesso-mortes-inchado-b101-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega adesão ao Covax Facility por motivo ideológico.', 'Não vamos ficar dependentes da OMS para nada. Vacinas a gente decide aqui.', 'Declaração em 4 de setembro de 2020 resistindo à adesão ao consórcio internacional.', 'verified', false, '2020-09-04', 'https://www.bbc.com/portuguese/brasil-54034563', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-covax-facility-recusa-b101-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica pressão de ambientalistas por demissão de Salles.', 'Salles é ministro competente. Ambientalistas globalistas querem derrubar para colocar outro alinhado a ONGs.', 'Entrevista em 18 de junho de 2020.', 'verified', false, '2020-06-18', 'https://valor.globo.com/politica/noticia/2020/06/18/mourao-defende-salles-ambientalistas.ghtml', 'news_article', 2, 'Vice-presidência', 'Entrevista à imprensa', 'mourao-defende-salles-b101-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama quem usa máscara de "bosta".', 'Esse povo bobo ficando com pano na boca. Bosta isso.', 'Diálogo captado em 14 de julho de 2020 em motociata.', 'verified', true, '2020-07-14', 'https://www1.folha.uol.com.br/poder/2020/07/bolsonaro-critica-uso-de-mascara.shtml', 'news_article', 4, 'Brasília', 'Motociata', 'bolsonaro-mascara-bosta-b101-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que vacina "não é obrigação nem de criança".', 'Não vou obrigar ninguém, nem criança. Pais decidem, não o Estado.', 'Declaração em 16 de dezembro de 2020 contra calendário vacinal padrão.', 'verified', false, '2020-12-16', 'https://g1.globo.com/politica/noticia/2020/12/16/bolsonaro-vacina-crianca-nao-obrigatoria.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-vacina-crianca-b101-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro depõe na PF sobre interferência na corporação e confirma acusações.', 'Reafirmo: o presidente buscou trocar o diretor da PF para ter informações privilegiadas.', 'Depoimento em 2 de maio de 2020 à Polícia Federal em Curitiba.', 'verified', true, '2020-05-02', 'https://g1.globo.com/politica/noticia/2020/05/02/sergio-moro-depoimento-pf-bolsonaro.ghtml', 'news_article', 3, 'Polícia Federal — Curitiba', 'Depoimento à PF', 'moro-depoimento-pf-interferencia-b101-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que imprensa "fez a pandemia" ganhar proporção.', 'Jornal televisivo criou essa histeria. Sem a imprensa, ninguém teria medo.', 'Live em 21 de maio de 2020.', 'verified', false, '2020-05-21', 'https://www.poder360.com.br/governo/bolsonaro-imprensa-criou-pandemia/', 'social_media_post', 4, 'Live Facebook', 'Live semanal', 'bolsonaro-imprensa-criou-pandemia-b101-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz em reunião ministerial que "quer ver o povo armado".', 'Eu quero o povo todo armado. Isso que é a garantia de não termos uma ditadura aqui.', 'Trecho da reunião ministerial de 22 de abril de 2020 divulgada pelo STF.', 'verified', true, '2020-04-22', 'https://g1.globo.com/politica/noticia/2020/05/22/em-reuniao-bolsonaro-disse-querer-povo-armado.ghtml', 'news_article', 5, 'Palácio do Planalto', 'Reunião ministerial', 'bolsonaro-povo-armado-reuniao-b101-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro amplia Auxílio Emergencial depois de resistência inicial.', 'Vamos sancionar o auxílio de R$ 600 porque o povo precisa, não porque concordo.', 'Declaração em 1º de abril de 2020 ao sancionar a Lei 13.982/2020.', 'verified', false, '2020-04-01', 'https://agenciabrasil.ebc.com.br/politica/noticia/2020-04/bolsonaro-sanciona-auxilio-emergencial', 'news_article', 1, 'Palácio do Planalto', 'Sanção presidencial', 'bolsonaro-sanciona-auxilio-b101-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes defende fim do auxílio mesmo com pandemia ativa.', 'Não podemos manter esse auxílio. Vai estourar o teto. Pandemia passa, endividamento fica.', 'Declaração em 11 de agosto de 2020 em evento com empresários.', 'verified', false, '2020-08-11', 'https://valor.globo.com/politica/noticia/2020/08/11/guedes-fim-auxilio-emergencial.ghtml', 'news_article', 2, 'São Paulo', 'Evento empresarial', 'guedes-fim-auxilio-pandemia-b101-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que crianças não pegam Covid para defender reabertura de creches.', 'Criança não pega Covid. Pode voltar para creche e escola. Ciência mostra isso.', 'Entrevista em 14 de julho de 2020, contrariando evidência pediátrica.', 'verified', false, '2020-07-14', 'https://www.cartacapital.com.br/politica/damares-crianca-nao-pega-covid/', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'damares-crianca-covid-b101-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles viaja enquanto Amazônia queima em meio à pandemia.', 'A situação da Amazônia está sob controle. As queimadas são menores do que dizem.', 'Entrevista em 30 de agosto de 2020 negando recordes de queimadas.', 'verified', false, '2020-08-30', 'https://www.bbc.com/portuguese/brasil-53963214', 'news_article', 3, 'Ministério do Meio Ambiente', 'Entrevista à imprensa', 'salles-nega-queimadas-b101-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro zomba de coveiros sobrecarregados em Manaus.', 'Não sou coveiro. Não adianta me perguntar sobre cemitério.', 'Declaração em 27 de abril de 2020 com Manaus em colapso funerário.', 'verified', true, '2020-04-27', 'https://www1.folha.uol.com.br/poder/2020/04/bolsonaro-manaus-coveiro-covid.shtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-coveiro-manaus-b101-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe protocola superpedido de impeachment com 60 ações acumuladas.', 'São mais de 60 pedidos. Lira não pode engavetar a responsabilidade do Congresso.', 'Protocolo em 17 de novembro de 2020.', 'verified', false, '2020-11-17', 'https://www12.senado.leg.br/noticias/materias/2020/11/17/randolfe-superpedido-impeachment', 'other', 1, 'Câmara dos Deputados', 'Protocolo de denúncia', 'randolfe-superpedido-impeachment-b101-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que morre quem "tem que morrer" ao comentar 100 mil mortes.', 'Todo mundo vai morrer. Uns mais cedo, outros mais tarde. Sou cristão e sei.', 'Declaração em 7 de agosto de 2020 quando Brasil passou de 100 mil óbitos.', 'verified', true, '2020-08-07', 'https://g1.globo.com/politica/noticia/2020/08/07/bolsonaro-100-mil-mortes-covid.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-100-mil-mortes-b101-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro acusa governadores de "inflar" pedidos de respiradores.', 'Estados pedem 10 vezes mais respiradores do que precisam. É jogo político.', 'Declaração em 20 de abril de 2020 em meio à corrida por equipamentos.', 'verified', false, '2020-04-20', 'https://www1.folha.uol.com.br/cotidiano/2020/04/bolsonaro-governadores-respiradores.shtml', 'news_article', 3, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-respiradores-inflados-b101-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro orienta população a "procurar um hospital e filmar".', 'Manda o povo ir ver de perto como são os hospitais. Não é o que estão falando.', 'Live em 11 de junho de 2020 orientando invasão de unidades de saúde.', 'verified', false, '2020-06-11', 'https://www.bbc.com/portuguese/brasil-53016489', 'news_article', 4, 'Live Facebook', 'Live semanal', 'bolsonaro-procurar-hospital-filmar-b101-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis lidera pauta anti-lockdown na Câmara.', 'Temos que impedir essa ditadura do isolamento. Estou com o projeto que proíbe lockdown.', 'Discurso em 15 de maio de 2020 apresentando projeto restritivo.', 'verified', false, '2020-05-15', 'https://www.camara.leg.br/noticias/655678-bia-kicis-projeto-lockdown/', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'bia-kicis-projeto-anti-lockdown-b101-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem defende fim imediato do isolamento.', 'Pandemia não é desculpa para suspender liberdades. Temos que reabrir tudo agora.', 'Discurso em 22 de abril de 2020.', 'verified', false, '2020-04-22', 'https://www.camara.leg.br/noticias/652456-vanhattem-reabertura/', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'vanhattem-reabertura-imediata-b101-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende vacinação obrigatória.', 'Vacinação é direito coletivo. Tem que ser obrigatória para proteger todos.', 'Discurso em 15 de dezembro de 2020.', 'verified', false, '2020-12-15', 'https://www.camara.leg.br/noticias/714523-tabata-vacinacao-obrigatoria/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'tabata-vacinacao-obrigatoria-b101-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra vacinação universal pelo SUS.', 'A vacina tem que ser pública, gratuita, para todos. O SUS salvou e vai salvar o Brasil.', 'Ato virtual em 13 de dezembro de 2020.', 'verified', false, '2020-12-13', 'https://www.bbc.com/portuguese/brasil-55301234', 'news_article', 1, 'São Bernardo do Campo', 'Ato virtual', 'lula-vacinacao-sus-b101-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compra briga com China ao chamar vírus de "chinês".', 'O vírus chinês veio pelo comunismo chinês. Temos que dizer a verdade.', 'Entrevista em 25 de março de 2020 gerando crise com embaixador chinês.', 'verified', false, '2020-03-25', 'https://www.reuters.com/article/us-health-coronavirus-brazil-china-idUSKBN21C2M2', 'news_article', 3, 'Palácio do Planalto', 'Entrevista à imprensa', 'bolsonaro-virus-chines-crise-b101-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama China de "vírus chinês" em tuíte com comparação a Chernobyl.', 'Culpa da China. É o Chernobyl deles. Devem responder.', 'Postagem em 18 de março de 2020.', 'verified', true, '2020-03-18', 'https://www1.folha.uol.com.br/mundo/2020/03/china-chernobyl-eduardo-bolsonaro.shtml', 'social_media_post', 4, 'Twitter', 'Postagem em rede social', 'eduardo-china-chernobyl-b101-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_rac, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro diz que CPI da Pandemia seria "perseguição".', 'CPI é uso político da tragédia. Vão usar para perseguir o presidente.', 'Entrevista em 5 de dezembro de 2020 resistindo a instalar CPI.', 'verified', false, '2020-12-05', 'https://www12.senado.leg.br/noticias/materias/2020/12/05/flavio-cpi-pandemia-perseguicao', 'news_article', 3, 'Senado Federal', 'Entrevista à imprensa', 'flavio-cpi-perseguicao-b101-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro veta auxílio adicional a profissionais da saúde.', 'Vetei o adicional para enfermeiros. Não tem como bancar.', 'Em 4 de agosto de 2020 vetou itens da Lei 14.023.', 'verified', false, '2020-08-04', 'https://g1.globo.com/politica/noticia/2020/08/04/bolsonaro-veta-adicional-enfermeiros.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Sanção de lei', 'bolsonaro-veto-enfermeiros-b101-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "não sabe" o valor das vacinas que governo vai comprar.', 'Não sei. Pergunte ao Pazuello. Eu tô cuidando do Brasil, não de vacina.', 'Declaração em 17 de dezembro de 2020.', 'verified', false, '2020-12-17', 'https://g1.globo.com/politica/noticia/2020/12/17/bolsonaro-nao-sabe-valor-vacina.ghtml', 'news_article', 3, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-nao-sabe-vacina-b101-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama Doria de "bandido" após anúncio da CoronaVac.', 'Doria é um bandido. Quer enfiar vacina chinesa goela abaixo por interesse político.', 'Declaração em 19 de outubro de 2020.', 'verified', false, '2020-10-19', 'https://www1.folha.uol.com.br/poder/2020/10/bolsonaro-chama-doria-de-bandido-vacina.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-doria-bandido-vacina-b101-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco pede responsabilidade institucional diante da pandemia.', 'O Senado precisa ser voz da serenidade. Não podemos compactuar com negacionismo.', 'Declaração em 20 de dezembro de 2020.', 'verified', false, '2020-12-20', 'https://www12.senado.leg.br/noticias/materias/2020/12/20/pacheco-senado-pandemia-responsabilidade', 'news_article', 1, 'Senado Federal', 'Entrevista à imprensa', 'pacheco-responsabilidade-senado-b101-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca a ANVISA ao falar de vacinas.', 'A Anvisa está atrapalhando. Querem criar dificuldade onde não tem.', 'Declaração em 16 de dezembro de 2020 sobre atraso na aprovação de imunizantes.', 'verified', false, '2020-12-16', 'https://g1.globo.com/politica/noticia/2020/12/16/bolsonaro-critica-anvisa-vacina.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-ataca-anvisa-b101-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que vai vetar fundão de pandemia criado pelo Congresso.', 'Vou vetar esse fundo. Dinheiro não resolve, plano resolve.', 'Declaração em 8 de junho de 2020.', 'verified', false, '2020-06-08', 'https://valor.globo.com/politica/noticia/2020/06/08/bolsonaro-vetar-fundo-pandemia.ghtml', 'news_article', 2, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-veto-fundo-pandemia-b101-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz a repórter: "minha vontade é te encher de porrada".', 'Minha vontade é te encher a boca na porrada, tá entendendo?', 'Diálogo com repórter da Folha em 23 de agosto de 2020.', 'verified', true, '2020-08-23', 'https://www1.folha.uol.com.br/poder/2020/08/bolsonaro-ameaca-encher-reporter-folha-de-porrada.shtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-porrada-reporter-b101-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama cloroquina de "salvação" mesmo com estudos negativos.', 'Cloroquina salva vida. Quem não usa tem sangue nas mãos. Pronto, falei.', 'Live em 6 de agosto de 2020 contra publicações científicas.', 'verified', false, '2020-08-06', 'https://www.poder360.com.br/governo/bolsonaro-cloroquina-salvacao-agosto/', 'social_media_post', 5, 'Live Facebook', 'Live semanal', 'bolsonaro-cloroquina-salvacao-b101-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão desmente Bolsonaro e diz que queimadas existem sim.', 'Não podemos negar dados. Há problema sério com queimadas. Vamos tratar com seriedade.', 'Entrevista em 10 de setembro de 2020, rompendo publicamente com Salles.', 'verified', false, '2020-09-10', 'https://oglobo.globo.com/brasil/mourao-desmente-bolsonaro-queimadas-24723612', 'news_article', 1, 'Vice-presidência', 'Entrevista à imprensa', 'mourao-queimadas-existem-b101-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "Fauci é mentiroso" em live.', 'Fauci é um mentiroso. Trump foi sabotado por essa máfia de médicos.', 'Live em 13 de novembro de 2020.', 'verified', false, '2020-11-13', 'https://www.cnnbrasil.com.br/internacional/bolsonaro-fauci-mentiroso/', 'social_media_post', 3, 'Live Facebook', 'Live semanal', 'bolsonaro-fauci-mentiroso-b101-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro promove desinformação sobre ivermectina.', 'Ivermectina funciona e é barata. Querem esconder para vender vacina cara.', 'Postagem em 8 de setembro de 2020.', 'verified', false, '2020-09-08', 'https://www.metropoles.com/brasil/politica-br/carlos-ivermectina-desinformacao', 'social_media_post', 4, 'Twitter', 'Postagem em rede social', 'carlos-ivermectina-b101-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ataca jornalistas durante pandemia, chamando de "milícia digital".', 'Jornalista é milícia digital a serviço do STF. Precisam ser enquadrados.', 'Postagem em 18 de junho de 2020.', 'verified', false, '2020-06-18', 'https://www.cartacapital.com.br/politica/zambelli-ataca-jornalistas-milicia/', 'social_media_post', 4, 'Twitter', 'Postagem em rede social', 'zambelli-jornalistas-milicia-b101-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Silveira pede prisão de ministros do STF em plena pandemia.', 'Moraes, Barroso, Fachin... todos deviam estar presos. STF é máfia.', 'Vídeo em 3 de agosto de 2020.', 'verified', false, '2020-08-03', 'https://www.metropoles.com/brasil/politica-br/silveira-pede-prisao-stf-ministros', 'social_media_post', 5, 'Redes sociais', 'Vídeo em rede social', 'silveira-prisao-stf-b101-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano promove aglomeração em templo e pede fim de decretos estaduais.', 'Deus não precisa de decreto. Vamos continuar abrindo as igrejas.', 'Pregação em 29 de março de 2020 em São Paulo.', 'verified', false, '2020-03-29', 'https://www.metropoles.com/brasil/politica-br/feliciano-aglomeracao-templo-marco', 'social_media_post', 4, 'São Paulo', 'Culto evangélico', 'feliciano-aglomeracao-culto-b101-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama pandemia de "castigo de Deus" pela agenda LGBT.', 'Deus está castigando o mundo pela agenda LGBT. É hora de arrependimento.', 'Pregação em 12 de abril de 2020.', 'verified', false, '2020-04-12', 'https://www.cartacapital.com.br/politica/magno-malta-castigo-pandemia-lgbt/', 'social_media_post', 4, 'Espírito Santo', 'Culto evangélico', 'magno-castigo-lgbt-b101-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que governo não comprará vacinas de Pfizer por contrato "abusivo".', 'Pfizer quer impor contrato abusivo. Não vamos comprar. É absurdo.', 'Declaração em 25 de setembro de 2020 sobre recusa inicial.', 'verified', true, '2020-09-25', 'https://www1.folha.uol.com.br/equilibrioesaude/2020/09/bolsonaro-rejeita-vacina-pfizer-contrato.shtml', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-rejeita-pfizer-b101-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar denuncia dinheiro da pandemia desviado para cloroquina.', 'Gastaram milhões em cloroquina enquanto faltava EPI. Isso é irresponsabilidade criminosa.', 'Pronunciamento em 25 de agosto de 2020.', 'verified', false, '2020-08-25', 'https://www12.senado.leg.br/noticias/materias/2020/08/25/otto-denuncia-cloroquina-milhoes', 'news_article', 1, 'Senado Federal', 'Pronunciamento em plenário', 'otto-desvio-cloroquina-b101-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan anuncia assinaturas para CPI da Pandemia.', 'Temos os 27 senadores. CPI será instalada para responsabilizar quem matou.', 'Declaração em 29 de dezembro de 2020 com coleta de assinaturas.', 'verified', false, '2020-12-29', 'https://www12.senado.leg.br/noticias/materias/2020/12/29/renan-cpi-pandemia-assinaturas', 'news_article', 1, 'Senado Federal', 'Entrevista à imprensa', 'renan-cpi-assinaturas-b101-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro manda STF "ficar na dele" e parar de "invadir" Executivo.', 'O STF tem que ficar na dele. Não é seu papel gerir pandemia. Sou eu o presidente.', 'Declaração em 18 de maio de 2020 após decisão sobre competência concorrente.', 'verified', false, '2020-05-18', 'https://g1.globo.com/politica/noticia/2020/05/18/bolsonaro-stf-ficar-na-dele.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-stf-ficar-na-dele-b101-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz a servidor da Saúde: "você é meu empregado".', 'Você é meu empregado. Se eu mandar tomar cloroquina, toma. Eu quero a obediência.', 'Reunião em 30 de abril de 2020 com técnicos do Ministério da Saúde, revelada posteriormente.', 'verified', false, '2020-04-30', 'https://www1.folha.uol.com.br/poder/2020/06/voce-e-meu-empregado-diz-bolsonaro-a-servidores.shtml', 'news_article', 4, 'Ministério da Saúde', 'Reunião técnica', 'bolsonaro-voce-empregado-saude-b101-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro dispensa distanciamento em missa de 7º dia de apoiador.', 'Povo unido não tem medo. Abraço coletivo, Deus protege.', 'Participação em missa em 15 de agosto de 2020 sem máscara.', 'verified', false, '2020-08-15', 'https://oglobo.globo.com/politica/bolsonaro-missa-sem-mascara-agosto-24687534', 'news_article', 3, 'Brasília', 'Missa católica', 'bolsonaro-missa-sem-mascara-b101-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega existência de "segunda onda" enquanto casos sobem.', 'Não existe segunda onda. Invenção da imprensa para manter o medo.', 'Live em 12 de novembro de 2020, semanas antes do colapso de Manaus.', 'verified', true, '2020-11-12', 'https://www.bbc.com/portuguese/brasil-54936714', 'news_article', 5, 'Live Facebook', 'Live semanal', 'bolsonaro-nega-segunda-onda-b101-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que governo "não será cobaia da Coronavac".', 'Brasil não é cobaia. Não testamos vacina chinesa no nosso povo.', 'Postagem em 20 de outubro de 2020.', 'verified', true, '2020-10-20', 'https://g1.globo.com/politica/noticia/2020/10/20/bolsonaro-coronavac-cobaia.ghtml', 'social_media_post', 5, 'Twitter', 'Postagem em rede social', 'bolsonaro-cobaia-coronavac-b101-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes defende abertura dos shoppings antes do fim da primeira onda.', 'Shopping tem que abrir. Consumo é o motor. Pandemia não pode quebrar a economia.', 'Evento virtual em 4 de maio de 2020.', 'verified', false, '2020-05-04', 'https://valor.globo.com/politica/noticia/2020/05/04/guedes-defende-shoppings-abertos.ghtml', 'news_article', 2, 'Brasília', 'Evento virtual', 'guedes-shopping-abertos-b101-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "pandemia está acabando" com 170 mil mortos.', 'A pandemia está acabando. Os números mostram que passamos o pico.', 'Declaração em 8 de novembro de 2020.', 'verified', false, '2020-11-08', 'https://g1.globo.com/politica/noticia/2020/11/08/bolsonaro-pandemia-acabando-novembro.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-pandemia-acabando-b101-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro dá coletiva sem máscara com profissionais de Saúde do MS.', 'Aqui quem é homem não tem medo de vírus. Vamos sem máscara.', 'Evento em 22 de julho de 2020 em Brasília após recuperação da Covid.', 'verified', false, '2020-07-22', 'https://www1.folha.uol.com.br/poder/2020/07/bolsonaro-evento-sem-mascara-julho.shtml', 'news_article', 3, 'Palácio do Planalto', 'Coletiva de imprensa', 'bolsonaro-coletiva-sem-mascara-b101-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro demite funcionário do Ibama após fiscalização na Amazônia.', 'Esse cara foi demitido. Não admito que atrapalhem trabalhadores rurais.', 'Declaração em 29 de abril de 2020 em caso envolvendo uso do patrimônio público.', 'verified', false, '2020-04-29', 'https://www1.folha.uol.com.br/ambiente/2020/04/bolsonaro-demite-fiscal-ibama.shtml', 'news_article', 3, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-demite-fiscal-ibama-b101-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro cancela aquisição de doses da CoronaVac.', 'Estou cancelando. Não foi autorizada por mim. O povo brasileiro não será cobaia.', 'Postagem em 21 de outubro de 2020 após Pazuello assinar protocolo.', 'verified', true, '2020-10-21', 'https://g1.globo.com/politica/noticia/2020/10/21/bolsonaro-cancela-compra-coronavac.ghtml', 'social_media_post', 5, 'Twitter', 'Postagem em rede social', 'bolsonaro-cancela-coronavac-b101-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que meninas brasileiras deveriam "vestir rosa" em plena pandemia.', 'Menina veste rosa, menino veste azul. Estamos reconstruindo a família brasileira.', 'Live em 5 de abril de 2020, falas que viralizaram durante pandemia.', 'verified', true, '2020-04-05', 'https://www1.folha.uol.com.br/cotidiano/2020/04/damares-menina-veste-rosa-menino-azul.shtml', 'news_article', 2, 'Ministério da Mulher', 'Live oficial', 'damares-menina-rosa-pandemia-b101-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que ciência "não é o dono da verdade".', 'Ciência é uma opinião. Eu ouço, mas decido. Não sou marionete de cientista.', 'Declaração em 8 de julho de 2020.', 'verified', false, '2020-07-08', 'https://g1.globo.com/ciencia-e-saude/noticia/2020/07/08/bolsonaro-ciencia-nao-dona-verdade.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-ciencia-opiniao-b101-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que terra arrasada "é exagero" sobre Amazônia.', 'Exagero. Amazônia não está queimando. Só fala quem não conhece.', 'Discurso em 17 de agosto de 2020.', 'verified', false, '2020-08-17', 'https://www.reuters.com/article/brazil-environment-amazon-idUSKCN25D2E8', 'news_article', 3, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-amazonia-exagero-b101-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro proíbe divulgação de gastos secretos da Saúde via LAI.', 'Essa LAI virou arma para perseguir. Sigilo é direito do presidente.', 'Declaração em 24 de março de 2020 ao implantar MP 928.', 'verified', false, '2020-03-24', 'https://www1.folha.uol.com.br/poder/2020/03/bolsonaro-suspende-prazo-lei-acesso-informacao.shtml', 'news_article', 4, 'Palácio do Planalto', 'Edição de MP', 'bolsonaro-lai-pandemia-b101-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Alexandre de Moraes suspende MP que restringia acesso à informação.', 'A democracia exige transparência, sobretudo em crise. Suspendo a MP 928.', 'Decisão liminar em 26 de março de 2020.', 'verified', true, '2020-03-26', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=440923', 'diario_oficial', 1, 'Supremo Tribunal Federal', 'Decisão liminar ADI 6351', 'moraes-suspende-mp-lai-b101-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica negacionismo e defende Mandetta.', 'Mandetta foi demitido por fazer ciência. Pandemia exige seriedade, não negacionismo.', 'Artigo em 17 de abril de 2020.', 'verified', false, '2020-04-17', 'https://www1.folha.uol.com.br/opiniao/2020/04/kim-kataguiri-mandetta-pandemia.shtml', 'news_article', 1, 'Folha de S.Paulo', 'Artigo de opinião', 'kim-kataguiri-mandetta-b101-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar protocola pedido de responsabilização internacional.', 'Vamos levar Bolsonaro a tribunais internacionais por crime contra a humanidade.', 'Declaração em 14 de julho de 2020.', 'verified', false, '2020-07-14', 'https://www.camara.leg.br/noticias/673248-chico-alencar-tribunal-internacional/', 'news_article', 1, 'Câmara dos Deputados', 'Declaração à imprensa', 'chico-tribunal-internacional-b101-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Freixo denuncia "pacto de sangue" entre Centrão e Bolsonaro.', 'Esse pacto tem sangue. Centrão está lavando mãos enquanto Bolsonaro mata.', 'Artigo em 10 de agosto de 2020.', 'verified', false, '2020-08-10', 'https://www.cartacapital.com.br/politica/freixo-pacto-sangue-centrao/', 'news_article', 1, 'Rio de Janeiro', 'Artigo de opinião', 'freixo-pacto-sangue-b101-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali cobra investigação sobre mortes evitáveis.', 'Mais de 100 mil dessas mortes eram evitáveis com gestão responsável. É crime.', 'Pronunciamento em 20 de outubro de 2020.', 'verified', false, '2020-10-20', 'https://www.camara.leg.br/noticias/698234-jandira-mortes-evitaveis/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'jandira-mortes-evitaveis-b101-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa alerta para colapso do SUS.', 'O SUS está à beira do colapso. Precisamos de plano nacional, não de ideologia.', 'Pronunciamento em 10 de junho de 2020.', 'verified', false, '2020-06-10', 'https://www12.senado.leg.br/noticias/materias/2020/06/10/humberto-sus-colapso', 'news_article', 1, 'Senado Federal', 'Pronunciamento em plenário', 'humberto-sus-colapso-b101-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma Rousseff compara Bolsonaro a Trump no "caos da pandemia".', 'O bolsonarismo é uma versão brasileira e trágica do trumpismo. Ambos desprezam vidas.', 'Entrevista em 26 de outubro de 2020.', 'verified', false, '2020-10-26', 'https://www.bbc.com/portuguese/brasil-54698734', 'news_article', 2, 'Porto Alegre', 'Entrevista à imprensa', 'dilma-bolsonaro-trump-b101-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC pede "nova frente democrática" contra negacionismo.', 'Precisamos de uma frente democrática. Pandemia mostrou o perigo do negacionismo.', 'Artigo em 20 de junho de 2020.', 'verified', false, '2020-06-20', 'https://www1.folha.uol.com.br/opiniao/2020/06/fhc-frente-democratica-pandemia.shtml', 'news_article', 1, 'Folha de S.Paulo', 'Artigo de opinião', 'fhc-frente-democratica-b101-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Michel Temer articula diálogo entre Bolsonaro e STF.', 'Tentei ajudar a apaziguar. STF e Executivo precisam trabalhar juntos contra pandemia.', 'Declaração em 29 de maio de 2020 após mediação.', 'verified', false, '2020-05-29', 'https://oglobo.globo.com/politica/temer-media-bolsonaro-stf-24534567', 'news_article', 2, 'São Paulo', 'Entrevista à imprensa', 'temer-mediacao-stf-b101-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney cobra união nacional e critica politização da saúde.', 'Minha geração sabe: em crise, união. Triste ver politização da saúde.', 'Artigo em 25 de abril de 2020.', 'verified', false, '2020-04-25', 'https://oglobo.globo.com/opiniao/sarney-uniao-pandemia-brasil-24423456', 'news_article', 1, 'Rio de Janeiro', 'Artigo de opinião', 'sarney-uniao-nacional-b101-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin vota pela condenação de Bolsonaro em inquérito sobre fake news.', 'Redes organizadas de desinformação atingem a democracia. Investigar é imperativo.', 'Voto em junho de 2020 reafirmando validade do inquérito 4781.', 'verified', false, '2020-06-17', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=444612', 'diario_oficial', 1, 'Supremo Tribunal Federal', 'Julgamento ADPF 572', 'fachin-inquerito-fake-news-b101-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes critica militarização da Saúde como "fracasso".', 'A militarização do Ministério da Saúde é um fracasso. Matou quem não deveria morrer.', 'Entrevista em 14 de agosto de 2020.', 'verified', false, '2020-08-14', 'https://www1.folha.uol.com.br/poder/2020/08/gilmar-mendes-militarizacao-saude-fracasso.shtml', 'news_article', 1, 'Supremo Tribunal Federal', 'Entrevista à imprensa', 'gilmar-militarizacao-fracasso-b101-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_oma, 'Omar Aziz denuncia contrato superfaturado para cloroquina no Exército.', 'Exército produziu cloroquina sem licitação e em quantidade absurda. Onde foi parar?', 'Pronunciamento em 30 de setembro de 2020.', 'verified', false, '2020-09-30', 'https://www12.senado.leg.br/noticias/materias/2020/09/30/omar-contrato-cloroquina-exercito', 'news_article', 2, 'Senado Federal', 'Pronunciamento em plenário', 'omar-contrato-cloroquina-b101-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Azevêdo cobra plano de vacinação junto a outros governadores.', 'Governadores do Nordeste unidos por vacinação. Não podemos esperar o Planalto.', 'Reunião do Consórcio Nordeste em 30 de novembro de 2020.', 'verified', false, '2020-11-30', 'https://paraiba.pb.gov.br/noticias/joao-azevedo-consorcio-nordeste-vacinacao', 'other', 1, 'João Pessoa', 'Consórcio Nordeste', 'joao-azevedo-consorcio-vacinacao-b101-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alr, 'Arthur Lira articula apoio do Centrão com cargos no Ministério da Saúde.', 'Centrão vai ajudar governo. Indicamos nomes técnicos para a Saúde.', 'Declaração em 20 de julho de 2020 ao negociar cargos.', 'verified', false, '2020-07-20', 'https://oglobo.globo.com/politica/lira-centrao-cargos-saude-24623412', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista à imprensa', 'lira-centrao-cargos-saude-b101-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles pressiona Ibama a demitir fiscal que flagrou desmate.', 'Esse fiscal está atrapalhando produtores rurais. Vai sair ou transferido.', 'Reunião em 14 de outubro de 2020.', 'verified', false, '2020-10-14', 'https://www1.folha.uol.com.br/ambiente/2020/11/salles-pressiona-ibama-fiscal-desmate.shtml', 'news_article', 3, 'Ministério do Meio Ambiente', 'Reunião interna', 'salles-pressao-ibama-fiscal-b101-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina defende "moratória verde" enquanto agronegócio desmata.', 'Moratória da soja é suficiente. Não precisamos de mais fiscalização. Produtor é sério.', 'Entrevista em 22 de setembro de 2020.', 'verified', false, '2020-09-22', 'https://valor.globo.com/agronegocios/noticia/2020/09/22/tereza-moratoria-soja-verde.ghtml', 'news_article', 2, 'Ministério da Agricultura', 'Entrevista à imprensa', 'tereza-moratoria-soja-b101-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro sanciona com vetos projeto de recuperação para estados.', 'Vou sancionar, mas com vetos. Não dá para repassar dinheiro sem controle.', 'Sanção da LC 173/2020 em 27 de maio de 2020.', 'verified', false, '2020-05-27', 'https://agenciabrasil.ebc.com.br/politica/noticia/2020-05/sancionada-lei-auxilio-estados-municipios', 'news_article', 2, 'Palácio do Planalto', 'Sanção de lei', 'bolsonaro-sanciona-lc173-b101-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que brasileiro "não pode viver de auxílio".', 'Não é justo viver de esmola do governo. Povo tem que voltar ao trabalho.', 'Declaração em 17 de setembro de 2020.', 'verified', false, '2020-09-17', 'https://www1.folha.uol.com.br/mercado/2020/09/bolsonaro-auxilio-esmola.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-auxilio-esmola-b101-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro se recusa a prestar solidariedade a Manaus em colapso funerário.', 'Manaus está sendo bem cuidada. Não existe colapso. Fake news.', 'Declaração em 30 de abril de 2020 com covas coletivas em Manaus.', 'verified', true, '2020-04-30', 'https://www.bbc.com/portuguese/brasil-52478934', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-manaus-fake-news-b101-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que brasileiro "pula em esgoto e não acontece nada".', 'Brasileiro pula em esgoto, mergulha. Sai, e nada acontece. Tem imunidade.', 'Declaração em 26 de março de 2020 ao minimizar Covid.', 'verified', true, '2020-03-26', 'https://g1.globo.com/politica/noticia/2020/03/26/brasileiro-pula-em-esgoto-e-nao-acontece-nada-diz-bolsonaro.ghtml', 'news_article', 5, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-esgoto-imunidade-b101-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que quem "tem medo" deve "ficar em casa".', 'Tem medo? Fica em casa. Não dá para todo mundo parar por medroso.', 'Live em 14 de maio de 2020.', 'verified', false, '2020-05-14', 'https://www.poder360.com.br/governo/bolsonaro-medo-fica-em-casa/', 'social_media_post', 4, 'Live Facebook', 'Live semanal', 'bolsonaro-medo-fica-casa-b101-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que sua saliva "não transmite" vírus em evento com apoiadores.', 'Minha saliva não pega ninguém. Sou imune. Já tive Covid.', 'Cumprimento a apoiadores em 5 de setembro de 2020.', 'verified', false, '2020-09-05', 'https://oglobo.globo.com/politica/bolsonaro-saliva-imune-24723412', 'news_article', 4, 'Palácio da Alvorada', 'Cumprimento a apoiadores', 'bolsonaro-saliva-imune-b101-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça cortar repasse federal a estados que decretarem novo lockdown.', 'Decretou lockdown? Perde repasse. Vamos ver quem aguenta.', 'Declaração em 11 de novembro de 2020.', 'verified', false, '2020-11-11', 'https://valor.globo.com/politica/noticia/2020/11/11/bolsonaro-ameaca-repasse-estados-lockdown.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-ameaca-repasse-lockdown-b101-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca jornalista em redes sociais com ameaças veladas.', 'Esse jornalista está marcado. Vamos expor quem é. Povo reage.', 'Postagem em 5 de outubro de 2020.', 'verified', false, '2020-10-05', 'https://www.metropoles.com/brasil/politica-br/carlos-ataca-jornalista-outubro', 'social_media_post', 4, 'Twitter', 'Postagem em rede social', 'carlos-ataque-jornalista-b101-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende "bloqueio global" contra China por pandemia.', 'China precisa ser bloqueada mundialmente. Custou milhões de vidas.', 'Entrevista em 12 de abril de 2020.', 'verified', false, '2020-04-12', 'https://www.cnnbrasil.com.br/internacional/eduardo-bolsonaro-bloqueio-china/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista à imprensa', 'eduardo-bloqueio-china-b101-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro manda recado ao STF: "acabou a Lava Jato" em referência à PF.', 'Acabou a Lava Jato. Polícia Federal trabalha pra mim agora.', 'Fala em reunião com empresários em 6 de julho de 2020.', 'verified', true, '2020-07-06', 'https://www1.folha.uol.com.br/poder/2020/07/bolsonaro-acabou-lava-jato-pf.shtml', 'news_article', 5, 'Palácio do Planalto', 'Reunião com empresários', 'bolsonaro-acabou-lava-jato-b101-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que há "muito ditador" entre governadores na pandemia.', 'Tem muito ditador por aí. Governador não é rei. Vou botar ordem na casa.', 'Declaração em 12 de maio de 2020.', 'verified', false, '2020-05-12', 'https://g1.globo.com/politica/noticia/2020/05/12/bolsonaro-muito-ditador-governadores.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-ditador-governadores-b101-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comemora "fim da Lava Jato" em público.', 'A Lava Jato acabou. Não existem mais vazamentos seletivos.', 'Declaração em 14 de setembro de 2020.', 'verified', false, '2020-09-14', 'https://oglobo.globo.com/politica/bolsonaro-comemora-fim-lava-jato-24723412', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-comemora-fim-lavajato-b101-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que "virou gripezinha mesmo", confirmando tese inicial.', 'Virou gripezinha mesmo. Eu falei, não me escutaram. Agora tá provado.', 'Live em 6 de agosto de 2020 após ter tido Covid.', 'verified', false, '2020-08-06', 'https://www.cartacapital.com.br/politica/bolsonaro-virou-gripezinha-mesmo/', 'social_media_post', 5, 'Live Facebook', 'Live semanal', 'bolsonaro-virou-gripezinha-b101-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Pfizer "não responsabiliza por mortes" e que preferimos comprar vacina.', 'Pfizer tem cláusula absurda: se morrer, problema seu. Por isso não comprei.', 'Declaração em 17 de dezembro de 2020.', 'verified', true, '2020-12-17', 'https://g1.globo.com/politica/noticia/2020/12/17/bolsonaro-pfizer-nao-responsabiliza-mortes.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-pfizer-clausula-morte-b101-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão admite "erros de comunicação" do governo na pandemia.', 'Nós tivemos erros de comunicação. Tem que admitir.', 'Entrevista em 28 de novembro de 2020.', 'verified', false, '2020-11-28', 'https://valor.globo.com/politica/noticia/2020/11/28/mourao-erros-comunicacao-pandemia.ghtml', 'news_article', 1, 'Vice-presidência', 'Entrevista à imprensa', 'mourao-erros-comunicacao-b101-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Pazuello e fala em "paz e tranquilidade" no ministério.', 'Pazuello está de paz. Ninguém vai tirar. Está fazendo a coisa certa.', 'Declaração em 8 de dezembro de 2020.', 'verified', false, '2020-12-08', 'https://g1.globo.com/politica/noticia/2020/12/08/bolsonaro-defende-pazuello-paz.ghtml', 'news_article', 2, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-pazuello-paz-b101-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que OMS "errou tanto" que perdeu credibilidade.', 'A OMS errou demais. Recomendou isso, recomendou aquilo. Não confio.', 'Discurso na abertura da 75ª Assembleia da ONU em 22 de setembro de 2020.', 'verified', false, '2020-09-22', 'https://www.reuters.com/article/us-un-assembly-brazil-who-idUSKCN26D2E1', 'news_article', 3, 'Nova York (virtual)', '75ª Assembleia Geral da ONU', 'bolsonaro-oms-credibilidade-onu-b101-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede que evangélicos "não tomem vacina chinesa".', 'Evangélicos, não se deixem enganar. Vacina chinesa é veneno. Oração, não agulha.', 'Live com pastores em 3 de dezembro de 2020.', 'verified', false, '2020-12-03', 'https://www.cartacapital.com.br/politica/bolsonaro-evangelicos-vacina-veneno/', 'social_media_post', 5, 'Live Facebook', 'Live com pastores', 'bolsonaro-evangelicos-vacina-veneno-b101-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara mobiliza fiéis da AD contra isolamento e Butantan.', 'Butantan é aliado do diabo. Coronavac é veneno. Igreja fica aberta.', 'Pregação em 15 de novembro de 2020.', 'verified', false, '2020-11-15', 'https://www.metropoles.com/brasil/politica-br/silas-butantan-diabo-novembro', 'social_media_post', 4, 'Manaus', 'Culto evangélico', 'silas-butantan-diabo-b101-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira chama decretos de lockdown de "terrorismo de Estado".', 'Isso é terrorismo de Estado. Governadores praticam tortura psicológica.', 'Vídeo em 25 de março de 2020.', 'verified', false, '2020-03-25', 'https://www.metropoles.com/brasil/politica-br/silveira-lockdown-terrorismo', 'social_media_post', 4, 'Redes sociais', 'Vídeo em rede social', 'silveira-lockdown-terrorismo-b101-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Pazuello mesmo com crise de oxigênio se aproximando.', 'Pazuello é meu general. Não vai sair. Quem quer tirar é imprensa.', 'Declaração em 28 de dezembro de 2020.', 'verified', true, '2020-12-28', 'https://g1.globo.com/politica/noticia/2020/12/28/bolsonaro-defende-pazuello-dezembro.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-defende-pazuello-dez-b101-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro encerra ano afirmando que "Brasil venceu a pandemia".', 'Brasil venceu. Graças a Deus e à gestão firme. Não entramos no lockdown da esquerda.', 'Pronunciamento de fim de ano em 31 de dezembro de 2020.', 'verified', true, '2020-12-31', 'https://www1.folha.uol.com.br/poder/2020/12/bolsonaro-brasil-venceu-pandemia-pronunciamento-fim-ano.shtml', 'news_article', 5, 'Palácio do Planalto', 'Pronunciamento de fim de ano', 'bolsonaro-brasil-venceu-fim-ano-b101-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe fecha 2020 pedindo responsabilização criminal.', 'Fecho 2020 com 194 mil brasileiros mortos. Bolsonaro precisa responder por isso.', 'Pronunciamento em 30 de dezembro de 2020 no Senado.', 'verified', false, '2020-12-30', 'https://www12.senado.leg.br/noticias/materias/2020/12/30/randolfe-balanco-2020-mortes-bolsonaro', 'news_article', 1, 'Senado Federal', 'Pronunciamento em plenário', 'randolfe-balanco-2020-b101-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
