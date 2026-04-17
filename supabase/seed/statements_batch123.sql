-- Batch 123: Lava Jato deep-dive II (Mai 2017 - Dez 2019)
DO $$
DECLARE
  v_mor UUID; v_lul UUID; v_lip UUID; v_dil UUID; v_tem UUID;
  v_aec UUID; v_fhc UUID; v_jair UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_mic UUID; v_dam UUID; v_pau UUID; v_mou UUID;
  v_gle UUID; v_had UUID; v_cir UUID; v_jse UUID; v_alc UUID;
  v_mar UUID; v_sar UUID; v_ren UUID; v_cun UUID; v_cha UUID;
  v_fre UUID; v_sil UUID; v_rje UUID; v_mag UUID; v_mfe UUID;
  v_axm UUID; v_gil UUID; v_bar UUID; v_tof UUID; v_fux UUID;
  v_fac UUID; v_car2 UUID; v_zan UUID; v_fdn UUID; v_jme UUID;
  v_lew UUID; v_ram UUID; v_zam UUID; v_dsi UUID; v_nik UUID;
  v_bki UUID; v_mvh UUID; v_ran UUID; v_eli UUID; v_dua UUID;
  v_jwa UUID; v_hco UUID; v_ott UUID; v_hmo UUID; v_lir UUID;
  v_pac UUID; v_dal UUID; v_iba UUID; v_tar UUID;
  c_cor UUID; c_obs UUID; c_abu UUID; c_ant UUID; c_des UUID;
  c_odi UUID; c_con UUID; c_nep UUID; c_int UUID; c_ame UUID;
  c_neg UUID; c_aut UUID; c_vio UUID;
BEGIN
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lip FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_pau FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_jse FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_fre FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_rje FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_axm FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_fux FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_fdn FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_jme FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bki FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_eli FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dua FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_jwa FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hco FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ott FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_dal FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_iba FROM politicians WHERE slug = 'ibaneis-rocha';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer aparece em gravação de Joesley Batista discutindo pagamento a Cunha.', 'Tem que manter isso, viu?', 'Áudio gravado pelo dono da JBS no Palácio do Jaburu desencadeia crise no governo Temer.', 'verified', true, '2017-05-17', 'https://www1.folha.uol.com.br/poder/2017/05/1884201-joesley-batista-grava-temer-dando-aval-a-compra-de-silencio-de-cunha.shtml', 'news_article', 5, 'Brasília', 'Gravação do Jaburu', 'temer-gravacao-joesley-b123-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer nega em pronunciamento ter autorizado compra de silêncio de Cunha.', 'Não comprei o silêncio de ninguém. Não temo acusações, temo a injustiça.', 'Pronunciamento em cadeia nacional após vazamento da gravação da JBS.', 'verified', true, '2017-05-18', 'https://g1.globo.com/politica/noticia/temer-faz-pronunciamento-apos-delacao-da-jbs.ghtml', 'speech', 4, 'Brasília', 'Pronunciamento em cadeia nacional', 'temer-nega-compra-silencio-b123-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio é afastado do mandato pelo STF após gravação pedindo R$ 2 milhões.', 'Preciso de dois. Mas tem que ser uma pessoa de sua confiança.', 'Áudio em que o senador pede dinheiro a Joesley Batista leva ao afastamento pelo STF.', 'verified', true, '2017-05-18', 'https://oglobo.globo.com/politica/stf-afasta-aecio-neves-do-mandato-de-senador-21354120', 'news_article', 5, 'Brasília', 'Afastamento pelo STF', 'aecio-afastamento-jbs-b123-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros classifica delação da JBS como ''terremoto político''.', 'O país vive um terremoto político sem precedentes. Nenhuma instituição está imune.', 'Declaração em plenário do Senado após divulgação das gravações.', 'verified', false, '2017-05-19', 'https://www12.senado.leg.br/noticias/materias/2017/05/19/renan-classifica-delacao-da-jbs-como-terremoto-politico', 'speech', 2, 'Brasília', 'Sessão do Senado', 'renan-terremoto-politico-b123-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica delação premiada como ''indústria de delações''.', 'Virou moda delatar para ganhar benefício. É uma indústria da mentira.', 'Comentário em entrevista sobre delações da Odebrecht e JBS.', 'verified', false, '2017-06-10', 'https://veja.abril.com.br/politica/bolsonaro-critica-industria-de-delacoes/', 'interview', 3, 'Rio de Janeiro', 'Entrevista à Veja', 'bolsonaro-industria-delacoes-b123-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro condena Lula a 9 anos e 6 meses por tríplex do Guarujá.', 'Há provas suficientes de corrupção passiva e lavagem de dinheiro no caso do apartamento.', 'Sentença de primeira instância no caso do tríplex, primeira condenação criminal de Lula.', 'verified', true, '2017-07-12', 'https://www1.folha.uol.com.br/poder/2017/07/1901132-moro-condena-lula-a-9-anos-e-6-meses-no-caso-do-triplex.shtml', 'other', 4, 'Curitiba', 'Sentença do tríplex', 'moro-condena-lula-triplex-b123-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reage à condenação dizendo ser vítima de perseguição.', 'Não sou réu confesso. Sou vítima de uma farsa jurídica montada contra mim.', 'Discurso no Sindicato dos Metalúrgicos do ABC após sentença de Moro.', 'verified', true, '2017-07-13', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/lula-reage-a-condenacao-e-diz-ser-vitima-de-farsa.ghtml', 'speech', 3, 'São Bernardo do Campo', 'Ato no Sindicato', 'lula-farsa-juridica-b123-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann nega propina de R$ 1 milhão em contas de campanha.', 'Jamais recebi um centavo ilegal. É acusação mentirosa da Lava Jato.', 'Resposta a denúncia da PGR por corrupção passiva e lavagem de dinheiro.', 'verified', false, '2017-08-02', 'https://oglobo.globo.com/politica/gleisi-hoffmann-nega-ter-recebido-propina-em-contas-de-campanha-21671234', 'news_article', 3, 'Brasília', 'Coletiva no PT', 'gleisi-nega-propina-b123-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Câmara rejeita denúncia contra Temer por corrupção passiva.', 'A Câmara cumpriu seu papel constitucional. Agora é trabalhar pelo Brasil.', 'Votação que barra processo no STF contra o presidente por denúncia da PGR.', 'verified', true, '2017-08-02', 'https://www1.folha.uol.com.br/poder/2017/08/1907876-camara-rejeita-denuncia-contra-temer.shtml', 'news_article', 4, 'Brasília', 'Votação da denúncia', 'temer-camara-rejeita-denuncia-b123-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha, já preso, afirma em depoimento que Temer sabia de tudo.', 'O presidente tinha conhecimento pleno dos repasses. Nada acontecia sem aval.', 'Depoimento do ex-presidente da Câmara preso em Curitiba desde 2016.', 'verified', true, '2017-09-14', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/cunha-diz-em-depoimento-que-temer-sabia-de-repasses.ghtml', 'other', 4, 'Curitiba', 'Depoimento de Cunha', 'cunha-temer-sabia-b123-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica publicamente desembargadores que soltam investigados.', 'Não se pode permitir que formalismos processuais protejam criminosos de colarinho branco.', 'Entrevista em seminário sobre combate à corrupção em São Paulo.', 'verified', false, '2017-10-05', 'https://veja.abril.com.br/politica/moro-critica-solturas-em-seminario/', 'speech', 3, 'São Paulo', 'Seminário sobre corrupção', 'moro-critica-solturas-b123-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes concede habeas corpus a Paulo Preto e é criticado por Moro.', 'A prisão preventiva não pode se tornar regra nem instrumento de pressão para delações.', 'Decisão monocrática no STF que desagrada à força-tarefa da Lava Jato.', 'verified', false, '2017-11-09', 'https://www1.folha.uol.com.br/poder/2017/11/1934098-gilmar-solta-paulo-preto-e-moro-critica.shtml', 'other', 2, 'Brasília', 'Decisão no STF', 'gilmar-hc-paulo-preto-b123-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Lula ''deveria apodrecer na cadeia''.', 'Lula tem que apodrecer na cadeia. Essa é a verdade que o Brasil precisa ouvir.', 'Declaração em comício em Porto Alegre durante pré-campanha.', 'verified', true, '2017-12-15', 'https://g1.globo.com/rs/rio-grande-do-sul/noticia/bolsonaro-diz-em-porto-alegre-que-lula-deveria-apodrecer-na-cadeia.ghtml', 'speech', 4, 'Porto Alegre', 'Comício de pré-campanha', 'bolsonaro-lula-apodrecer-b123-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete manter candidatura ainda que condenado.', 'Vou ser candidato, doa a quem doer. O povo é quem decide.', 'Entrevista em São Paulo dias antes do julgamento do TRF-4.', 'verified', true, '2018-01-20', 'https://www1.folha.uol.com.br/poder/2018/01/1953451-lula-promete-manter-candidatura-ainda-que-condenado.shtml', 'interview', 3, 'São Paulo', 'Entrevista coletiva', 'lula-candidatura-doa-quem-doer-b123-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'TRF-4 confirma condenação de Lula e aumenta pena para 12 anos.', 'A confirmação da sentença reforça a solidez das provas produzidas.', 'Julgamento colegiado da 8ª Turma do TRF-4 em Porto Alegre.', 'verified', true, '2018-01-24', 'https://g1.globo.com/pr/parana/noticia/trf-4-confirma-condenacao-de-lula-e-aumenta-pena-para-12-anos.ghtml', 'other', 4, 'Porto Alegre', 'Julgamento do TRF-4', 'trf4-confirma-condenacao-lula-b123-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi convoca militância a resistir à prisão de Lula.', 'Não vamos entregar Lula para a injustiça. A resistência será nas ruas.', 'Discurso em ato do PT em São Bernardo após decisão do TRF-4.', 'verified', false, '2018-01-25', 'https://www.cartacapital.com.br/politica/gleisi-convoca-militancia-a-resistir-a-prisao-de-lula/', 'speech', 3, 'São Bernardo do Campo', 'Ato do PT', 'gleisi-resistencia-prisao-lula-b123-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin rejeita recursos de Lula e mantém execução da pena.', 'Recursos meramente protelatórios não podem impedir o cumprimento da decisão colegiada.', 'Decisão monocrática no STF indeferindo habeas corpus.', 'verified', true, '2018-03-22', 'https://oglobo.globo.com/politica/fachin-rejeita-recurso-de-lula-no-stf-22510437', 'other', 3, 'Brasília', 'Decisão no STF', 'fachin-rejeita-recurso-lula-b123-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro expede mandado de prisão contra Lula após negativa de HC no STF.', 'Determino a apresentação voluntária à Polícia Federal em Curitiba.', 'Mandado expedido após STF negar habeas corpus preventivo ao ex-presidente.', 'verified', true, '2018-04-05', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/moro-expede-mandado-de-prisao-contra-lula.ghtml', 'other', 4, 'Curitiba', 'Mandado de prisão de Lula', 'moro-mandado-prisao-lula-b123-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa no Sindicato dos Metalúrgicos antes de se entregar.', 'Eles não prendem um homem, prendem uma ideia. Vocês vão ter que se multiplicar por mim.', 'Último discurso antes da prisão, diante de multidão em São Bernardo.', 'verified', true, '2018-04-07', 'https://www1.folha.uol.com.br/poder/2018/04/lula-discursa-no-sindicato-antes-de-se-entregar.shtml', 'speech', 3, 'São Bernardo do Campo', 'Discurso antes da prisão', 'lula-discurso-sindicato-b123-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comemora prisão de Lula em vídeo em rede social.', 'A Justiça venceu! Agora o ladrão está no lugar dele: atrás das grades.', 'Vídeo publicado em rede social horas após Lula se entregar à Polícia Federal.', 'verified', true, '2018-04-08', 'https://veja.abril.com.br/politica/bolsonaro-comemora-prisao-de-lula-em-video/', 'social_media_post', 3, 'Rio de Janeiro', 'Publicação em redes', 'bolsonaro-comemora-prisao-lula-b123-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad assume candidatura após Lula ser impedido pela Lei da Ficha Limpa.', 'Lula é o candidato, mas o PT não fugirá à responsabilidade com o Brasil.', 'Declaração em convenção do PT que oficializou a chapa Haddad-Manuela.', 'verified', true, '2018-09-11', 'https://g1.globo.com/politica/eleicoes/2018/noticia/pt-oficializa-haddad-como-candidato.ghtml', 'speech', 2, 'São Paulo', 'Convenção do PT', 'haddad-candidato-pt-b123-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que petistas devem ser ''metralhados''.', 'Vamos metralhar a petralhada aqui do Acre! Eles vão para a ponta da praia.', 'Declaração em comício em Rio Branco com arma simulada com tripé.', 'verified', true, '2018-09-03', 'https://www1.folha.uol.com.br/poder/2018/09/bolsonaro-diz-que-petralhada-deve-ser-metralhada.shtml', 'speech', 5, 'Rio Branco', 'Comício em Rio Branco', 'bolsonaro-metralhar-petralhada-b123-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é esfaqueado em ato de campanha em Juiz de Fora.', 'Foi um ato covarde que não vai impedir nossa luta pelo Brasil.', 'Ataque durante caminhada em Juiz de Fora, em plena campanha presidencial.', 'verified', true, '2018-09-06', 'https://g1.globo.com/mg/zona-da-mata/noticia/bolsonaro-e-esfaqueado-em-juiz-de-fora.ghtml', 'news_article', 2, 'Juiz de Fora', 'Atentado contra Bolsonaro', 'bolsonaro-esfaqueado-juiz-fora-b123-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que basta um soldado e um cabo para fechar STF.', 'Se quisermos fechar o STF, você sabe o que tem que fazer? Nem precisa ir tanque, um soldado e um cabo fecham.', 'Entrevista ao podcast em meio à campanha eleitoral de 2018.', 'verified', true, '2018-10-21', 'https://www1.folha.uol.com.br/poder/2018/10/eduardo-bolsonaro-diz-que-basta-um-soldado-e-um-cabo-para-fechar-stf.shtml', 'interview', 5, 'São Paulo', 'Entrevista a podcast', 'eduardo-soldado-cabo-stf-b123-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz gesto de arma e ameaça petistas em ato no Paraíba.', 'Vamos varrer esses bandidos vermelhos do Brasil. Ou saem para fora, ou vão pra cadeia.', 'Ato de campanha em discurso via videoconferência no Val do Anhangabaú.', 'verified', true, '2018-10-21', 'https://veja.abril.com.br/politica/bolsonaro-promete-limpeza-contra-vermelhos/', 'speech', 5, 'São Paulo', 'Ato no Vale do Anhangabaú', 'bolsonaro-limpeza-vermelhos-b123-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad acusa Bolsonaro de disseminar fake news por WhatsApp.', 'Há um esquema de disparo em massa financiado por empresários. É crime eleitoral.', 'Coletiva após reportagem da Folha sobre disparos em massa no WhatsApp.', 'verified', true, '2018-10-18', 'https://www1.folha.uol.com.br/poder/2018/10/haddad-acusa-bolsonaro-de-financiar-disparos-em-massa.shtml', 'news_article', 2, 'São Paulo', 'Coletiva de campanha', 'haddad-fake-news-whatsapp-b123-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vence segundo turno e é eleito presidente.', 'Não podemos seguir flertando com o socialismo, comunismo, populismo.', 'Discurso de vitória em rede social após apuração do segundo turno.', 'verified', true, '2018-10-28', 'https://g1.globo.com/politica/eleicoes/2018/noticia/bolsonaro-e-eleito-presidente-da-republica.ghtml', 'social_media_post', 2, 'Rio de Janeiro', 'Noite da vitória', 'bolsonaro-vitoria-segundo-turno-b123-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro aceita convite de Bolsonaro para assumir Ministério da Justiça.', 'Aceito o desafio de combater a corrupção e o crime organizado a partir do Executivo.', 'Anúncio após reunião com o presidente eleito no Rio de Janeiro.', 'verified', true, '2018-11-01', 'https://www1.folha.uol.com.br/poder/2018/11/moro-aceita-ministerio-da-justica-de-bolsonaro.shtml', 'news_article', 5, 'Rio de Janeiro', 'Anúncio do ministério', 'moro-aceita-ministerio-b123-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula denuncia que Moro agiu politicamente ao aceitar ministério.', 'Fica provado que a Lava Jato era um projeto político. Moro se revela como era.', 'Nota divulgada pela defesa do ex-presidente na prisão em Curitiba.', 'verified', true, '2018-11-02', 'https://oglobo.globo.com/politica/lula-diz-que-moro-agiu-politicamente-ao-aceitar-ministerio-23181230', 'other', 3, 'Curitiba', 'Nota da defesa', 'lula-moro-agiu-politicamente-b123-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica Moro por ir ao governo que prendeu adversário.', 'Moro carimbou o golpe jurídico. Foi um juiz parcial e agora é ministro.', 'Entrevista à TV Bandeirantes após anúncio do ministério.', 'verified', false, '2018-11-05', 'https://www.cartacapital.com.br/politica/ciro-critica-ida-de-moro-ao-governo/', 'interview', 3, 'São Paulo', 'Entrevista à Band', 'ciro-moro-golpe-juridico-b123-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pau, 'Paulo Guedes defende privatização massiva no governo Bolsonaro.', 'Vamos privatizar tudo que for possível. O Estado brasileiro é elefantíaco.', 'Entrevista a investidores em Nova York antes da posse.', 'verified', false, '2018-12-03', 'https://valor.globo.com/brasil/noticia/guedes-defende-privatizacao-massiva.ghtml', 'interview', 2, 'Nova York', 'Encontro com investidores', 'guedes-privatizacao-massiva-b123-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares celebra nomeação ao Ministério da Mulher com frase viral.', 'Atenção, atenção! Nova era no Brasil: menino veste azul e menina veste rosa!', 'Discurso em festa após ser anunciada ministra por Bolsonaro.', 'verified', true, '2019-01-02', 'https://g1.globo.com/politica/noticia/2019/01/02/damares-menino-veste-azul-menina-veste-rosa.ghtml', 'speech', 3, 'Brasília', 'Comemoração da nomeação', 'damares-menino-azul-menina-rosa-b123-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro toma posse e promete combate ao marxismo cultural.', 'Vamos unir o povo, livrar a pátria do socialismo, da inversão de valores.', 'Discurso de posse no Congresso Nacional em 1º de janeiro de 2019.', 'verified', true, '2019-01-01', 'https://www1.folha.uol.com.br/poder/2019/01/bolsonaro-toma-posse-promete-combate-ao-marxismo.shtml', 'speech', 3, 'Brasília', 'Posse presidencial', 'bolsonaro-posse-marxismo-b123-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro é alvo de investigação por rachadinhas.', 'Não há nada de ilegal. É perseguição política contra minha família.', 'Denúncia do MPRJ sobre esquema no gabinete da Alerj envolvendo Queiroz.', 'verified', true, '2019-01-18', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/flavio-bolsonaro-e-alvo-de-investigacao-por-rachadinhas.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Investigação do MPRJ', 'flavio-rachadinhas-investigacao-b123-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro nega vínculos com Queiroz e atribui depósitos a negócios pessoais.', 'Queiroz era um funcionário, nunca houve esquema. Os depósitos eram meus, lícitos.', 'Entrevista à Rede Globo tentando esclarecer movimentações financeiras do ex-assessor.', 'verified', true, '2019-01-22', 'https://g1.globo.com/politica/noticia/flavio-bolsonaro-nega-vinculo-com-queiroz.ghtml', 'interview', 4, 'Rio de Janeiro', 'Entrevista ao Jornal Nacional', 'flavio-nega-vinculos-queiroz-b123-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro apresenta pacote anticrime com medidas duras contra crime organizado.', 'O Brasil precisa endurecer contra o crime. Esse é o projeto mais importante da gestão.', 'Apresentação do pacote anticrime do Ministério da Justiça.', 'verified', true, '2019-02-04', 'https://www1.folha.uol.com.br/poder/2019/02/moro-apresenta-pacote-anticrime.shtml', 'news_article', 2, 'Brasília', 'Apresentação do pacote', 'moro-pacote-anticrime-b123-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro assina decreto que facilita posse de armas.', 'O povo bom tem que ter o direito de se defender. Vamos desengessar a posse.', 'Assinatura de decreto presidencial no Palácio do Planalto.', 'verified', true, '2019-01-15', 'https://g1.globo.com/politica/noticia/bolsonaro-assina-decreto-que-facilita-posse-de-armas.ghtml', 'news_article', 3, 'Brasília', 'Decreto de armas', 'bolsonaro-decreto-armas-b123-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão minimiza regime militar e chama ditadura de ''período de exceção''.', 'Aquilo foi um período de exceção necessário. O Brasil corria risco real.', 'Entrevista ao Jornal da Record em que defende o regime militar.', 'verified', true, '2019-03-29', 'https://veja.abril.com.br/politica/mourao-defende-regime-militar-como-periodo-de-excecao/', 'interview', 4, 'Brasília', 'Entrevista à Record', 'mourao-ditadura-periodo-excecao-b123-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro manda comemorar ''Dia do Golpe'' de 1964 em quartéis.', 'O 31 de março deve ser relembrado como o dia em que o Brasil foi salvo do comunismo.', 'Ordem enviada ao Ministério da Defesa para comemorar 55 anos do golpe.', 'verified', true, '2019-03-25', 'https://www1.folha.uol.com.br/poder/2019/03/bolsonaro-manda-comemorar-golpe-de-1964.shtml', 'news_article', 5, 'Brasília', 'Comemoração do golpe', 'bolsonaro-comemora-golpe-1964-b123-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz em culto que viu Jesus em uma goiabeira.', 'Eu subi na goiabeira e encontrei Jesus. Minha vida mudou para sempre ali.', 'Pregação em culto evangélico antes de assumir como ministra.', 'verified', true, '2019-04-06', 'https://g1.globo.com/politica/noticia/damares-alves-diz-que-viu-jesus-em-uma-goiabeira.ghtml', 'speech', 2, 'Brasília', 'Culto evangélico', 'damares-jesus-goiabeira-b123-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Vaza Jato: site The Intercept revela diálogos entre Moro e procuradores.', 'Telegramas mostram coordenação indevida entre juiz e acusação na Lava Jato.', 'Publicação do The Intercept Brasil com mensagens hackeadas de Telegram.', 'verified', true, '2019-06-09', 'https://theintercept.com/2019/06/09/chat-moro-deltan-telegram-lava-jato/', 'news_article', 5, 'São Paulo', 'Vaza Jato', 'vaza-jato-mensagens-moro-b123-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro rebate vazamentos dizendo que não há nada demais nas mensagens.', 'Não vejo nada de ilícito nas mensagens. Foram obtidas por crime hacker.', 'Entrevista coletiva em Brasília após primeira reportagem do Intercept.', 'verified', true, '2019-06-10', 'https://www1.folha.uol.com.br/poder/2019/06/moro-rebate-vazamentos-diz-que-nao-ha-nada-de-ilicito.shtml', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'moro-rebate-vaza-jato-b123-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes diz que Vaza Jato mostra ''farsa'' da Lava Jato.', 'Os diálogos revelam uma operação que se transformou em projeto de poder.', 'Fala em seminário jurídico em Lisboa após publicação das mensagens.', 'verified', true, '2019-06-12', 'https://oglobo.globo.com/politica/gilmar-diz-que-vaza-jato-mostra-farsa-da-lava-jato-23746210', 'speech', 3, 'Lisboa', 'Seminário jurídico', 'gilmar-vaza-jato-farsa-b123-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Moro e ataca o Intercept.', 'Moro é um homem íntegro. O Intercept está a serviço de criminosos.', 'Declaração à imprensa na saída do Palácio do Alvorada.', 'verified', true, '2019-06-11', 'https://veja.abril.com.br/politica/bolsonaro-defende-moro-apos-vaza-jato/', 'news_article', 3, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-defende-moro-vaza-jato-b123-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi pede anulação das condenações de Lula após Vaza Jato.', 'As provas estão aí: Lula é preso político. Exigimos sua liberdade imediata.', 'Coletiva do PT após as primeiras reportagens do Intercept.', 'verified', true, '2019-06-13', 'https://www.cartacapital.com.br/politica/gleisi-pede-anulacao-das-condenacoes-de-lula/', 'speech', 3, 'Brasília', 'Coletiva do PT', 'gleisi-anulacao-lula-vaza-jato-b123-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que filho Flávio pode ter ''errado'' em rachadinhas.', 'Se errou, vai pagar. Mas não tenho conhecimento de ilegalidades.', 'Declaração a jornalistas sobre investigações contra o filho senador.', 'verified', false, '2019-07-05', 'https://g1.globo.com/politica/noticia/bolsonaro-admite-que-filho-pode-ter-errado-em-rachadinhas.ghtml', 'news_article', 3, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-filho-errado-rachadinhas-b123-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo é indicado para ser embaixador nos EUA pelo pai.', 'Sou o nome certo para esse cargo. Nenhum outro brasileiro tem as minhas conexões lá.', 'Entrevista em que defende a própria indicação como embaixador em Washington.', 'verified', true, '2019-07-11', 'https://www1.folha.uol.com.br/mundo/2019/07/eduardo-bolsonaro-defende-propria-indicacao-a-embaixada.shtml', 'interview', 4, 'Brasília', 'Entrevista à imprensa', 'eduardo-embaixada-eua-b123-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe critica nepotismo na indicação de Eduardo Bolsonaro.', 'Escalar o filho para embaixada dos EUA é a síntese do nepotismo no governo.', 'Discurso no plenário do Senado contra a indicação.', 'verified', false, '2019-07-15', 'https://www12.senado.leg.br/noticias/materias/2019/07/15/randolfe-critica-indicacao-de-eduardo-bolsonaro', 'speech', 2, 'Brasília', 'Sessão do Senado', 'randolfe-nepotismo-eduardo-b123-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua que ONGs causam queimadas na Amazônia.', 'Podem estar sendo as ONGs que perderam dinheiro e agora ateiam fogo.', 'Entrevista em Brasília sobre aumento histórico das queimadas na Amazônia.', 'verified', true, '2019-08-21', 'https://g1.globo.com/politica/noticia/2019/08/21/bolsonaro-sugere-que-ongs-provocam-queimadas-na-amazonia.ghtml', 'news_article', 4, 'Brasília', 'Declaração sobre Amazônia', 'bolsonaro-ongs-queimadas-b123-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Toffoli suspende inquéritos que usam dados do Coaf sem autorização.', 'É preciso estabelecer critérios sobre o compartilhamento de dados fiscais e financeiros.', 'Decisão monocrática do presidente do STF paralisando investigações.', 'verified', true, '2019-07-16', 'https://www1.folha.uol.com.br/poder/2019/07/toffoli-suspende-inqueritos-que-usam-dados-do-coaf.shtml', 'other', 4, 'Brasília', 'Decisão no STF', 'toffoli-suspende-coaf-b123-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica publicamente decisão de Toffoli sobre o Coaf.', 'Decisão paralisa investigações relevantes contra o crime organizado e a corrupção.', 'Entrevista em evento do Ministério da Justiça no Rio de Janeiro.', 'verified', false, '2019-07-17', 'https://oglobo.globo.com/politica/moro-critica-decisao-de-toffoli-sobre-coaf-23801045', 'speech', 3, 'Rio de Janeiro', 'Evento do MJ', 'moro-critica-toffoli-coaf-b123-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Queiroz é preso em Atibaia em propriedade de advogado da família Bolsonaro.', 'Meu pai, Queiroz e advogado são todos vítimas de perseguição política.', 'Declaração de Flávio Bolsonaro logo após a prisão do ex-assessor.', 'verified', true, '2020-06-18', 'https://g1.globo.com/sp/sao-paulo/noticia/2020/06/18/fabricio-queiroz-e-preso-em-atibaia.ghtml', 'news_article', 4, 'Brasília', 'Prisão de Queiroz', 'flavio-queiroz-preso-atibaia-b123-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rje, 'Roberto Jefferson ataca STF em programa de rádio.', 'O STF é um puteiro jurídico que tem que ser fechado de uma vez.', 'Declaração em programa de rádio após atos bolsonaristas em Brasília.', 'verified', true, '2019-09-30', 'https://www1.folha.uol.com.br/poder/2019/09/roberto-jefferson-ataca-stf-como-puteiro-juridico.shtml', 'speech', 5, 'Rio de Janeiro', 'Programa de rádio', 'rje-stf-puteiro-juridico-b123-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso defende STF contra ataques de bolsonaristas.', 'A democracia não se negocia. O Supremo é um dos pilares do Estado de Direito.', 'Pronunciamento em sessão plenária do STF após ataques de Jefferson.', 'verified', true, '2019-10-02', 'https://oglobo.globo.com/politica/barroso-defende-stf-contra-ataques-23965782', 'speech', 2, 'Brasília', 'Sessão do STF', 'barroso-defende-stf-b123-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fux, 'Fux nega habeas corpus e mantém condenações da Lava Jato.', 'A operação trouxe ganhos civilizatórios e não pode ser desmontada por decisões monocráticas.', 'Voto em plenário do STF em caso sobre validade de provas da Lava Jato.', 'verified', false, '2019-10-17', 'https://www1.folha.uol.com.br/poder/2019/10/fux-defende-lava-jato-no-plenario-do-stf.shtml', 'other', 2, 'Brasília', 'Sessão do STF', 'fux-defende-lava-jato-b123-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'STF derruba prisão em segunda instância e Lula é solto.', 'Eles não prendem um homem, prendem uma ideia. Uma ideia não se prende.', 'Discurso de Lula ao sair da Superintendência da PF em Curitiba após 580 dias.', 'verified', true, '2019-11-08', 'https://g1.globo.com/politica/noticia/2019/11/08/lula-discursa-apos-sair-da-prisao-em-curitiba.ghtml', 'speech', 3, 'Curitiba', 'Saída da prisão', 'lula-discurso-saida-prisao-b123-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica STF por decisão sobre prisão em segunda instância.', 'É um absurdo. O Brasil vai virar paraíso de bandidos de colarinho branco.', 'Declaração na saída do Palácio da Alvorada após a decisão do STF.', 'verified', true, '2019-11-08', 'https://veja.abril.com.br/politica/bolsonaro-critica-stf-por-soltar-lula/', 'news_article', 3, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-critica-stf-decisao-b123-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca STF em série de tweets.', 'Chega de togados covardes soltando bandidos. O povo não aguenta mais.', 'Série de postagens do vereador no Twitter após decisão do STF.', 'verified', true, '2019-11-08', 'https://www1.folha.uol.com.br/poder/2019/11/carlos-bolsonaro-ataca-stf-em-tweets.shtml', 'social_media_post', 4, 'Rio de Janeiro', 'Publicações no Twitter', 'carlos-ataca-stf-twitter-b123-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hco, 'Humberto Costa defende soltura de Lula como correção histórica.', 'A liberdade de Lula é reparação de uma injustiça que marcou o Brasil.', 'Declaração à imprensa após decisão do STF sobre 2ª instância.', 'verified', false, '2019-11-09', 'https://www.cartacapital.com.br/politica/humberto-costa-comemora-soltura-de-lula/', 'news_article', 2, 'Brasília', 'Coletiva do PT', 'humberto-soltura-lula-b123-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Alexandre de Moraes abre inquérito das fake news no STF.', 'As ameaças sistemáticas contra ministros exigem apuração imediata.', 'Decisão monocrática que inaugura o Inquérito 4781 sobre ataques ao STF.', 'verified', true, '2019-03-14', 'https://g1.globo.com/politica/noticia/stf-abre-inquerito-sobre-fake-news-e-ameacas-a-ministros.ghtml', 'other', 3, 'Brasília', 'Abertura do inquérito', 'moraes-inquerito-fake-news-b123-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli pede intervenção militar em vídeo.', 'O povo está nas ruas pedindo as Forças Armadas. O Congresso e o STF não ouvem.', 'Vídeo publicado em redes sociais durante atos antidemocráticos de 2019.', 'verified', true, '2019-05-26', 'https://www1.folha.uol.com.br/poder/2019/05/zambelli-pede-intervencao-militar-em-video.shtml', 'social_media_post', 5, 'São Paulo', 'Atos antidemocráticos', 'zambelli-intervencao-militar-b123-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin mantém competência da Lava Jato sobre processos de Lula.', 'A competência está fixada. Reexame implicaria reforma que extrapola esta instância.', 'Decisão monocrática no STF rejeitando pedidos da defesa de Lula.', 'verified', false, '2019-04-10', 'https://oglobo.globo.com/politica/fachin-mantem-competencia-da-lava-jato-sobre-processos-de-lula-23604321', 'other', 2, 'Brasília', 'Decisão no STF', 'fachin-competencia-lava-jato-b123-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça romper com CCJ se Moro perder poder.', 'Se mexerem com o Moro, eu vou para as ruas com o povo. Não vou admitir isso.', 'Declaração na saída do Alvorada sobre pacote anticrime no Congresso.', 'verified', false, '2019-08-15', 'https://veja.abril.com.br/politica/bolsonaro-ameaca-congresso-se-moro-perder-poder/', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-ameaca-moro-congresso-b123-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'José Sarney critica clima de polarização em entrevista.', 'O Brasil precisa voltar ao diálogo. A polarização destrói a democracia.', 'Entrevista ao jornal O Estado de S. Paulo sobre clima político.', 'verified', false, '2019-04-22', 'https://politica.estadao.com.br/noticias/geral,sarney-critica-polarizacao-politica,70002812345', 'interview', 1, 'São Luís', 'Entrevista ao Estadão', 'sarney-polarizacao-democracia-b123-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC alerta para crise democrática sob Bolsonaro.', 'Não se pode normalizar ataques a instituições. A democracia requer contenção do poder.', 'Artigo no jornal O Estado de S. Paulo sobre rumo do governo.', 'verified', true, '2019-09-14', 'https://politica.estadao.com.br/noticias/geral,fhc-alerta-para-crise-democratica,70003001234', 'news_article', 2, 'São Paulo', 'Artigo no Estadão', 'fhc-crise-democratica-b123-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin é denunciado por caixa 2 em campanhas do PSDB.', 'Não recebi um centavo ilegal. Vou me defender em juízo.', 'Resposta à denúncia do MPSP baseada em delação da Odebrecht.', 'verified', true, '2019-08-16', 'https://g1.globo.com/sp/sao-paulo/noticia/2019/08/16/alckmin-e-denunciado-por-caixa-2.ghtml', 'news_article', 4, 'São Paulo', 'Denúncia do MPSP', 'alckmin-denunciado-caixa-2-b123-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jse, 'José Serra é alvo de busca e apreensão por lavagem de dinheiro.', 'Sou inocente. Essa operação é uma barbaridade contra mim.', 'Declaração após operação da PF na casa do senador em São Paulo.', 'verified', true, '2019-07-02', 'https://www1.folha.uol.com.br/poder/2019/07/policia-federal-faz-busca-e-apreensao-na-casa-de-jose-serra.shtml', 'news_article', 4, 'São Paulo', 'Operação na residência', 'serra-busca-apreensao-b123-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros é alvo de nova denúncia por organização criminosa.', 'Nego categoricamente. Sou alvo de abuso de autoridade da PGR.', 'Coletiva no Senado após denúncia feita por Raquel Dodge.', 'verified', true, '2018-09-17', 'https://www12.senado.leg.br/noticias/materias/2018/09/17/renan-nega-denuncia-por-organizacao-criminosa', 'news_article', 3, 'Brasília', 'Coletiva no Senado', 'renan-denuncia-organizacao-b123-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha é condenado a mais 24 anos por corrupção.', 'Continuo inocente. Vou recorrer a todas as instâncias.', 'Declaração da defesa após nova condenação em Curitiba.', 'verified', true, '2018-03-30', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/eduardo-cunha-e-condenado-a-mais-24-anos.ghtml', 'other', 4, 'Curitiba', 'Nova condenação', 'cunha-condenado-mais-24-anos-b123-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fre, 'Marcelo Freixo denuncia milícias no Rio ligadas a Bolsonaros.', 'O que estamos vendo é a interseção entre mandato político e crime organizado.', 'Discurso na Alerj após reportagens sobre ligações com milicianos.', 'verified', true, '2019-01-24', 'https://www1.folha.uol.com.br/cotidiano/2019/01/freixo-denuncia-ligacoes-entre-milicias-e-bolsonaros.shtml', 'speech', 3, 'Rio de Janeiro', 'Alerj', 'freixo-milicias-bolsonaro-b123-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar critica ataques de Bolsonaro a jornalistas.', 'É intolerável que o presidente incite violência contra profissionais de imprensa.', 'Artigo publicado na Carta Capital sobre ataques à imprensa.', 'verified', false, '2019-02-07', 'https://www.cartacapital.com.br/politica/chico-alencar-critica-ataques-a-jornalistas/', 'news_article', 2, 'Rio de Janeiro', 'Artigo na Carta Capital', 'chico-ataques-jornalistas-b123-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende indicação de Eduardo para embaixada.', 'Eduardo é bom de prosa, fala inglês e entende os americanos. É o homem certo.', 'Entrevista defendendo a indicação de Eduardo Bolsonaro aos EUA.', 'verified', false, '2019-07-12', 'https://veja.abril.com.br/politica/magno-malta-defende-eduardo-bolsonaro-embaixada/', 'interview', 2, 'Vitória', 'Entrevista à Veja', 'malta-eduardo-embaixada-b123-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano defende pauta conservadora e ataca STF.', 'Os togados afrontam valores cristãos da nação. O povo não vai aceitar.', 'Discurso em culto em São Paulo com presença de aliados bolsonaristas.', 'verified', false, '2019-09-22', 'https://www1.folha.uol.com.br/poder/2019/09/feliciano-ataca-stf-em-culto-com-bolsonaristas.shtml', 'speech', 3, 'São Paulo', 'Culto evangélico', 'feliciano-ataca-stf-culto-b123-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes diz que Moro ''desonrou a toga''.', 'As mensagens mostram alguém que agiu como acusador, não como juiz.', 'Entrevista à Folha de S. Paulo sobre Vaza Jato.', 'verified', true, '2019-07-05', 'https://www1.folha.uol.com.br/poder/2019/07/gilmar-diz-que-moro-desonrou-a-toga.shtml', 'interview', 4, 'Brasília', 'Entrevista à Folha', 'gilmar-moro-desonrou-toga-b123-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Cármen Lúcia afirma que democracia exige contenção do poder.', 'Nenhum poder é absoluto. A democracia vive de limites.', 'Discurso em cerimônia no TSE sobre integridade eleitoral.', 'verified', false, '2019-10-08', 'https://oglobo.globo.com/politica/carmen-lucia-democracia-exige-contencao-do-poder-23990456', 'speech', 1, 'Brasília', 'Cerimônia no TSE', 'carmen-contencao-poder-b123-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende bancada evangélica em pauta contra STF.', 'O Supremo não pode afrontar a fé e a família do povo brasileiro.', 'Declaração em culto com parlamentares evangélicos em Brasília.', 'verified', false, '2019-11-20', 'https://www.cartacapital.com.br/politica/silas-camara-ataca-stf-em-culto/', 'speech', 2, 'Brasília', 'Culto parlamentar', 'silas-bancada-evangelica-b123-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz piada sobre violência contra mulher em entrevista.', 'Eu não bato em mulher, mas se a pessoa merece apanhar, tem que apanhar.', 'Declaração em entrevista a canal americano.', 'verified', true, '2019-07-18', 'https://www1.folha.uol.com.br/poder/2019/07/bolsonaro-faz-piada-sobre-violencia-contra-mulher.shtml', 'interview', 4, 'Washington', 'Entrevista internacional', 'bolsonaro-piada-violencia-mulher-b123-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão minimiza desmatamento histórico na Amazônia.', 'Não temos crise ambiental. O Brasil preserva mais do que a Europa.', 'Declaração à imprensa estrangeira após dados do INPE sobre queimadas.', 'verified', true, '2019-08-23', 'https://g1.globo.com/politica/noticia/mourao-minimiza-desmatamento-na-amazonia.ghtml', 'news_article', 4, 'Brasília', 'Coletiva internacional', 'mourao-minimiza-desmatamento-b123-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pau, 'Guedes defende reforma da Previdência como ''idade mínima para todos''.', 'A reforma é inadiável. Sem ela, o Brasil quebra em dois anos.', 'Pronunciamento em comissão da Câmara sobre a PEC.', 'verified', false, '2019-05-15', 'https://valor.globo.com/politica/noticia/guedes-defende-reforma-da-previdencia-como-inadiavel.ghtml', 'speech', 1, 'Brasília', 'Comissão da Câmara', 'guedes-reforma-previdencia-b123-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi critica reforma da Previdência como ataque aos trabalhadores.', 'É a maior retirada de direitos da história. Querem jogar o povo na miséria.', 'Discurso no plenário da Câmara em defesa dos direitos trabalhistas.', 'verified', false, '2019-07-10', 'https://www.cartacapital.com.br/politica/gleisi-critica-reforma-da-previdencia/', 'speech', 2, 'Brasília', 'Plenário da Câmara', 'gleisi-critica-previdencia-b123-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad denuncia ''fascismo à brasileira'' no primeiro ano de Bolsonaro.', 'O que estamos vivendo é um projeto autoritário travestido de liberdade.', 'Palestra na USP sobre balanço do primeiro ano de governo Bolsonaro.', 'verified', false, '2019-12-10', 'https://www1.folha.uol.com.br/poder/2019/12/haddad-denuncia-fascismo-a-brasileira.shtml', 'speech', 2, 'São Paulo', 'Palestra na USP', 'haddad-fascismo-brasileira-b123-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro acusa Bolsonaro de ''miliciano'' chefe.', 'Estamos sob um governo de milicianos. É o pior da história do Brasil.', 'Entrevista à TV Cultura sobre primeiro ano de Bolsonaro.', 'verified', true, '2019-12-15', 'https://www.cartacapital.com.br/politica/ciro-chama-bolsonaro-de-miliciano-chefe/', 'interview', 3, 'Fortaleza', 'Entrevista à TV Cultura', 'ciro-bolsonaro-miliciano-b123-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Globo merece multa milionária por reportagem sobre milícia.', 'Eu vou acabar com vocês. Vocês não me intimidam.', 'Declaração na saída do Alvorada criticando reportagem do Jornal Nacional.', 'verified', true, '2019-10-29', 'https://g1.globo.com/politica/noticia/2019/10/29/bolsonaro-ameaca-globo-por-reportagem.ghtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-ameaca-globo-milicia-b123-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua ligação de Lula com Marielle em comício.', 'Pode ter havido ligação. Não posso acusar, mas quem entra no PT não sai ileso.', 'Declaração em conversa com apoiadores no cercadinho, sem provas.', 'verified', true, '2019-10-29', 'https://www1.folha.uol.com.br/poder/2019/10/bolsonaro-insinua-ligacao-do-pt-com-marielle.shtml', 'speech', 5, 'Brasília', 'Cercadinho do Alvorada', 'bolsonaro-insinuacao-marielle-b123-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fre, 'Freixo rebate insinuações de Bolsonaro sobre Marielle.', 'É criminoso espalhar mentira sobre uma vereadora assassinada. Haverá reação jurídica.', 'Coletiva no Rio após declarações do presidente.', 'verified', true, '2019-10-30', 'https://oglobo.globo.com/rio/freixo-rebate-bolsonaro-sobre-marielle-24021345', 'news_article', 3, 'Rio de Janeiro', 'Coletiva do PSOL', 'freixo-rebate-marielle-b123-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar critica pacote anticrime de Moro no Senado.', 'Há excessos no texto que violam garantias constitucionais básicas.', 'Discurso no Senado durante tramitação do pacote anticrime.', 'verified', false, '2019-11-27', 'https://www12.senado.leg.br/noticias/materias/2019/11/27/otto-critica-excessos-no-pacote-anticrime', 'speech', 1, 'Brasília', 'Sessão do Senado', 'otto-pacote-anticrime-b123-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner classifica pacote anticrime como autoritário.', 'É a tentativa de criminalizar resistência e dar mais poder à polícia sem controle.', 'Discurso no Senado contra propostas de Moro.', 'verified', false, '2019-11-28', 'https://www12.senado.leg.br/noticias/materias/2019/11/28/wagner-critica-pacote-anticrime', 'speech', 2, 'Brasília', 'Sessão do Senado', 'wagner-pacote-autoritario-b123-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy critica retrocessos do governo Bolsonaro em direitos humanos.', 'Estamos vivendo um retrocesso histórico em liberdades civis e direitos das minorias.', 'Artigo publicado na Folha de S. Paulo.', 'verified', false, '2019-07-29', 'https://www1.folha.uol.com.br/opiniao/2019/07/marta-suplicy-critica-retrocessos.shtml', 'news_article', 2, 'São Paulo', 'Artigo na Folha', 'marta-retrocessos-bolsonaro-b123-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca jornalista no cercadinho com grosseria.', 'Cara, você tem uma cara terrível de homossexual. Isso não é crime.', 'Resposta a pergunta de jornalista sobre suposta ligação de Queiroz ao caso Marielle.', 'verified', true, '2019-12-20', 'https://www1.folha.uol.com.br/poder/2019/12/bolsonaro-ataca-jornalista-no-cercadinho.shtml', 'speech', 5, 'Brasília', 'Cercadinho do Alvorada', 'bolsonaro-ataca-jornalista-b123-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe acusa governo de atacar imprensa para intimidar.', 'Ataques sistemáticos à imprensa visam calar quem investiga. É autoritarismo puro.', 'Pronunciamento no Senado contra Bolsonaro.', 'verified', false, '2019-12-21', 'https://www12.senado.leg.br/noticias/materias/2019/12/21/randolfe-acusa-governo-de-intimidar-imprensa', 'speech', 2, 'Brasília', 'Sessão do Senado', 'randolfe-governo-intimida-imprensa-b123-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa em Cuba criticando Lava Jato.', 'A Lava Jato foi operação política. Querem me manter sem direitos políticos.', 'Discurso em Havana em seminário com intelectuais latino-americanos.', 'verified', false, '2019-11-25', 'https://www.cartacapital.com.br/politica/lula-discursa-em-cuba-sobre-lava-jato/', 'speech', 2, 'Havana', 'Seminário em Cuba', 'lula-discurso-cuba-b123-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro assina MP que dificulta criação de ONGs ambientais.', 'Essas ONGs esquerdistas vão ter que prestar contas agora. Acabou festa.', 'Assinatura de medida provisória no Planalto com ministros.', 'verified', false, '2019-06-28', 'https://g1.globo.com/politica/noticia/bolsonaro-assina-mp-sobre-ongs.ghtml', 'news_article', 3, 'Brasília', 'Cerimônia no Planalto', 'bolsonaro-mp-ongs-b123-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio de Freitas defende obras suspensas pela Lava Jato.', 'Precisamos retomar projetos travados. O país não pode parar por suspeita.', 'Entrevista ao Valor sobre pasta da Infraestrutura.', 'verified', false, '2019-08-05', 'https://valor.globo.com/politica/noticia/tarcisio-defende-retomada-de-obras.ghtml', 'interview', 2, 'Brasília', 'Entrevista ao Valor', 'tarcisio-obras-lava-jato-b123-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_iba, 'Ibaneis Rocha defende policiamento pesado em atos pró-Bolsonaro.', 'O DF vai garantir ordem. Manifestações pacíficas sempre serão bem-vindas.', 'Coletiva em Brasília antes de atos bolsonaristas em 7 de setembro.', 'verified', false, '2019-09-05', 'https://www1.folha.uol.com.br/poder/2019/09/ibaneis-defende-policiamento-em-atos-pro-bolsonaro.shtml', 'news_article', 2, 'Brasília', 'Coletiva no GDF', 'ibaneis-policiamento-atos-b123-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama critica corte de verbas para ciência.', 'Cortar verba para pesquisa é apagar o futuro do Brasil.', 'Discurso no Senado após cortes anunciados pelo MEC.', 'verified', false, '2019-05-08', 'https://www12.senado.leg.br/noticias/materias/2019/05/08/eliziane-critica-corte-em-pesquisa', 'speech', 1, 'Brasília', 'Sessão do Senado', 'eliziane-corte-ciencia-b123-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro tenta cancelar sigilo de relatórios do Coaf.', 'É direito meu saber quem me investiga e por quê.', 'Pedido protocolado no STJ para acesso a relatórios sobre Queiroz.', 'verified', true, '2019-01-30', 'https://g1.globo.com/politica/noticia/flavio-bolsonaro-pede-acesso-a-relatorios-do-coaf.ghtml', 'other', 4, 'Brasília', 'Pedido no STJ', 'flavio-cancelar-coaf-b123-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca ministros do STF em reunião ministerial.', 'Aqueles velhos do Supremo não têm coragem de enfrentar o povo.', 'Fala em reunião interna depois divulgada em investigações.', 'verified', true, '2019-10-15', 'https://www1.folha.uol.com.br/poder/2019/10/bolsonaro-ataca-ministros-do-stf-em-reuniao-ministerial.shtml', 'speech', 4, 'Brasília', 'Reunião ministerial', 'bolsonaro-ataca-ministros-stf-b123-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr. critica cortes sociais do governo Bolsonaro.', 'Cortar programas sociais é sufocar a população mais vulnerável do país.', 'Discurso na Assembleia Legislativa do Maranhão.', 'verified', false, '2019-06-20', 'https://www.cartacapital.com.br/politica/duarte-jr-critica-cortes-sociais/', 'speech', 1, 'São Luís', 'Alema', 'duarte-cortes-sociais-b123-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Toffoli impõe sigilo a investigações contra políticos.', 'É necessário resguardar o direito à honra durante apurações em curso.', 'Decisão monocrática impondo sigilo amplo em inquéritos.', 'verified', false, '2019-08-20', 'https://oglobo.globo.com/politica/toffoli-impoe-sigilo-a-investigacoes-contra-politicos-23875932', 'other', 3, 'Brasília', 'Decisão no STF', 'toffoli-sigilo-investigacoes-b123-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro encerra 2019 com balanço defendendo aliados investigados.', 'Meu filho é inocente. Moro é íntegro. O resto é perseguição da velha política.', 'Entrevista coletiva de fim de ano no Palácio do Planalto.', 'verified', true, '2019-12-19', 'https://g1.globo.com/politica/noticia/bolsonaro-faz-balanco-de-2019-em-coletiva.ghtml', 'news_article', 3, 'Brasília', 'Coletiva de fim de ano', 'bolsonaro-balanco-2019-b123-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
