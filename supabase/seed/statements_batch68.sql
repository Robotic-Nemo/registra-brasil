-- Batch 68: Bolsonaro family post-conviction (Nov 2025 - Jan 2026)
DO $$
DECLARE
  v_jair UUID; v_fla UUID; v_edu UUID; v_car UUID; v_mic UUID;
  v_nik UUID; v_bia UUID; v_mfe UUID; v_dam UUID; v_mou UUID;
  v_mag UUID; v_ram UUID; v_zam UUID; v_sil UUID; v_mor UUID;
  v_tar UUID; v_pab UUID; v_jan UUID; v_gle UUID; v_lul UUID;
  v_had UUID; v_mor2 UUID; v_din UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID;
  c_abu UUID; c_aut UUID; c_mac UUID; c_obs UUID; c_ame UUID;
  c_neg UUID; c_irr UUID; c_con UUID; c_int UUID; c_nep UUID;
  c_hom UUID; c_rac UUID; c_mis UUID; c_itr UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mor2 FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro classifica prisão como perseguição política após condenação no STF.', 'Sou vítima da maior perseguição política da história do Brasil.', 'Declaração dada logo após início do cumprimento de pena em regime fechado em Brasília.', 'verified', true, '2025-11-25', 'https://www1.folha.uol.com.br/poder/2025/11/bolsonaro-preso-stf.shtml', 'news_article', 4, 'Brasília', 'Transferência para cumprimento de pena', 'bolsonaro-vitima-perseguicao-b68-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio anuncia pré-candidatura presidencial em 2026 para dar continuidade ao legado do pai.', 'Vou ser candidato a presidente para continuar o legado do meu pai e libertar o Brasil.', 'Pronunciamento no Senado após a prisão de Jair Bolsonaro.', 'verified', true, '2025-11-27', 'https://g1.globo.com/politica/noticia/2025/11/27/flavio-bolsonaro-candidatura-presidencial.ghtml', 'news_article', 2, 'Senado Federal', 'Entrevista coletiva', 'flavio-candidatura-2026-b68-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro, dos EUA, pede sanções americanas contra ministros do STF.', 'Espero que o governo americano aplique sanções contra os ministros que perseguem meu pai.', 'Declaração em entrevista a rede conservadora nos Estados Unidos.', 'verified', true, '2025-11-28', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-sancoes-stf/', 'news_article', 5, 'Washington, EUA', 'Entrevista à Fox News', 'eduardo-sancoes-stf-b68-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro anuncia pré-candidatura ao Senado pelo DF.', 'Aceito a missão de ser candidata ao Senado para representar as famílias brasileiras.', 'Anúncio em culto evangélico em Brasília com lideranças do PL Mulher.', 'verified', true, '2025-12-02', 'https://www.uol.com.br/eleicoes/2025/12/michelle-bolsonaro-senado-df.htm', 'news_article', 2, 'Brasília', 'Culto evangélico PL Mulher', 'michelle-candidatura-senado-b68-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca Moraes em série de postagens após visita ao pai na prisão.', 'Moraes é o carcereiro do Brasil e um dia responderá por seus crimes.', 'Postagens no X após primeira visita familiar a Jair Bolsonaro em cela especial.', 'verified', false, '2025-12-03', 'https://www.metropoles.com/brasil/politica-br/carlos-bolsonaro-ataca-moraes-x', 'social_media_post', 4, 'Rio de Janeiro', 'Postagens em rede social', 'carlos-ataque-moraes-b68-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro alega problemas de saúde para tentar prisão domiciliar.', 'Minha saúde está deteriorando. Preciso de cuidados que só em casa posso ter.', 'Mensagem divulgada pela defesa pedindo a Moraes a conversão da pena.', 'verified', false, '2025-12-05', 'https://www.poder360.com.br/politica/bolsonaro-saude-domiciliar-pedido/', 'news_article', 2, 'Brasília', 'Petição da defesa', 'bolsonaro-saude-domiciliar-b68-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio acusa STF de perseguir família Bolsonaro inteira.', 'Querem exterminar politicamente toda a família Bolsonaro. Não vão conseguir.', 'Entrevista após recurso negado sobre foro privilegiado.', 'verified', false, '2025-12-06', 'https://oglobo.globo.com/politica/flavio-stf-extermino-familia/', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'flavio-extermino-familia-b68-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo diz que continuará nos EUA até "Brasil voltar a ser livre".', 'Só voltarei ao Brasil quando a liberdade for restabelecida e meu pai estiver solto.', 'Declaração a jornalistas em Miami durante evento da CPAC.', 'verified', false, '2025-12-08', 'https://veja.abril.com.br/politica/eduardo-bolsonaro-exilio-cpac/', 'news_article', 3, 'Miami, EUA', 'CPAC América Latina', 'eduardo-exilio-cpac-b68-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle convoca mulheres evangélicas a "resistir" contra governo Lula.', 'As mulheres de fé vão resistir a esse governo que ataca nossos valores.', 'Discurso em evento da Assembleia de Deus em São Paulo.', 'verified', false, '2025-12-10', 'https://noticias.uol.com.br/politica/2025/12/10/michelle-evangelicas-resistencia.htm', 'news_article', 2, 'São Paulo', 'Congresso de Mulheres da AD', 'michelle-resistencia-evangelica-b68-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira compara prisão de Bolsonaro a perseguição de Jesus.', 'Assim como Jesus foi perseguido, Bolsonaro é perseguido pela justiça dos homens.', 'Vídeo em redes sociais viralizou no dia seguinte à prisão.', 'verified', true, '2025-11-26', 'https://www.metropoles.com/brasil/politica-br/nikolas-bolsonaro-jesus', 'social_media_post', 3, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-bolsonaro-jesus-b68-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende anistia ampla para Bolsonaro no Congresso.', 'Vamos aprovar a anistia que livrará Bolsonaro dessa perseguição injusta.', 'Discurso em plenário da Câmara em defesa do PL da Anistia.', 'verified', false, '2025-12-12', 'https://g1.globo.com/politica/noticia/2025/12/12/bia-kicis-anistia-bolsonaro.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Debate PL Anistia', 'bia-kicis-anistia-b68-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano convoca jejum nacional pela libertação de Bolsonaro.', 'Conclamo o povo evangélico a um jejum de 40 dias pela libertação do nosso capitão.', 'Pronunciamento em culto na Catedral da Fé transmitido ao vivo.', 'verified', false, '2025-12-14', 'https://www.poder360.com.br/politica/feliciano-jejum-bolsonaro/', 'news_article', 2, 'São Paulo', 'Culto Catedral da Fé', 'feliciano-jejum-bolsonaro-b68-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que Michelle será a "nova voz" do bolsonarismo.', 'Michelle é a unção divina para substituir Bolsonaro neste momento de trevas.', 'Declaração em evento do PL em Brasília.', 'verified', false, '2025-12-15', 'https://www.cnnbrasil.com.br/politica/damares-michelle-bolsonarismo/', 'news_article', 2, 'Brasília', 'Convenção do PL', 'damares-michelle-bolsonarismo-b68-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca irmão Flávio em postagens apagadas minutos depois.', 'Tem gente na família querendo surfar na tragédia do papai para se promover.', 'Postagens em rede social geraram crise interna na família, sendo apagadas em seguida.', 'verified', true, '2025-12-16', 'https://www1.folha.uol.com.br/poder/2025/12/carlos-ataca-flavio-familia.shtml', 'social_media_post', 3, 'Rio de Janeiro', 'Postagens em rede social', 'carlos-ataca-flavio-b68-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio responde a Carlos e pede unidade na família.', 'Não é hora de divisão. Precisamos estar unidos pelo papai e pelo Brasil.', 'Entrevista em resposta a ataques do irmão Carlos.', 'verified', false, '2025-12-16', 'https://oglobo.globo.com/politica/flavio-responde-carlos-unidade/', 'news_article', 1, 'Rio de Janeiro', 'Coletiva de imprensa', 'flavio-unidade-familia-b68-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro envia mensagem aos apoiadores pedindo resistência pacífica.', 'Resistam pacificamente. Não desistam do Brasil. Minha luta é pela sua liberdade.', 'Carta manuscrita divulgada pela família após visita semanal à prisão.', 'verified', true, '2025-12-18', 'https://g1.globo.com/politica/noticia/2025/12/18/bolsonaro-carta-apoiadores-resistencia.ghtml', 'news_article', 3, 'Brasília', 'Carta da prisão', 'bolsonaro-carta-resistencia-b68-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que Bolsonaro está sendo crucificado.', 'Bolsonaro está sendo crucificado como Cristo foi. Mas haverá ressurreição política.', 'Declaração em ato religioso em Vila Velha.', 'verified', false, '2025-12-19', 'https://www.metropoles.com/brasil/politica-br/magno-malta-bolsonaro-cristo', 'news_article', 2, 'Vila Velha', 'Ato religioso', 'magno-malta-crucificacao-b68-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pede intervenção de Trump no "caso brasileiro".', 'Presidente Trump tem o poder de salvar a democracia brasileira.', 'Entrevista a podcast americano de direita.', 'verified', true, '2025-12-20', 'https://www.bbc.com/portuguese/articles/eduardo-bolsonaro-trump-intervencao', 'news_article', 5, 'Washington, EUA', 'Entrevista podcast', 'eduardo-trump-intervencao-b68-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle acusa governo Lula de perseguir cristãos.', 'Esse governo persegue cristãos e protege bandidos. Vamos mudar isso.', 'Discurso em evento com pastores em Goiânia.', 'verified', false, '2025-12-22', 'https://noticias.uol.com.br/politica/2025/12/22/michelle-lula-perseguicao-cristaos.htm', 'news_article', 3, 'Goiânia', 'Evento com pastores', 'michelle-perseguicao-cristaos-b68-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem defende Bolsonaro em plenário e chama STF de ditadura.', 'O Brasil vive uma ditadura togada. Bolsonaro é o preso político número um.', 'Discurso em plenário da Câmara dos Deputados.', 'verified', false, '2025-12-23', 'https://www.poder360.com.br/politica/ramagem-ditadura-togada/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'ramagem-ditadura-togada-b68-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro divulga suposto áudio do pai em cela, gerando polêmica.', 'Meu pai está sofrendo, humilhado numa cela gelada. Isso é tortura.', 'Divulgação de áudio não autorizado em rede social gerou investigação.', 'verified', true, '2025-12-26', 'https://www1.folha.uol.com.br/poder/2025/12/carlos-audio-bolsonaro-cela.shtml', 'social_media_post', 3, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-audio-cela-b68-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro passa mal e é transferido para hospital militar.', 'Estou passando mal, preciso de atendimento médico urgente.', 'Bolsonaro foi transferido para o HFA com quadro de crise hipertensiva.', 'verified', true, '2025-12-28', 'https://g1.globo.com/politica/noticia/2025/12/28/bolsonaro-hospital-hfa.ghtml', 'news_article', 2, 'Brasília', 'Internação em hospital militar', 'bolsonaro-hospital-hfa-b68-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que pai corre risco de vida na prisão.', 'Se algo acontecer com meu pai, Moraes será o responsável perante a história.', 'Declaração após internação emergencial do ex-presidente.', 'verified', true, '2025-12-28', 'https://www.cnnbrasil.com.br/politica/flavio-pai-risco-moraes-responsavel/', 'news_article', 4, 'Brasília', 'Coletiva em hospital', 'flavio-moraes-responsavel-b68-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pede que apoiadores façam atos pela saúde do pai.', 'Tomem as ruas pela vida do meu pai. Não podemos deixá-lo morrer na prisão.', 'Vídeo gravado nos EUA convocando atos em 31 capitais.', 'verified', true, '2025-12-29', 'https://veja.abril.com.br/politica/eduardo-convoca-atos-saude-pai/', 'social_media_post', 4, 'EUA', 'Vídeo convocatório', 'eduardo-convoca-atos-b68-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle faz vigília em frente ao hospital militar.', 'Estou aqui velando pela vida do meu marido. Que Deus tenha misericórdia.', 'Michelle passou a noite em frente ao HFA com apoiadores em oração.', 'verified', true, '2025-12-29', 'https://noticias.uol.com.br/politica/2025/12/29/michelle-vigilia-hfa.htm', 'news_article', 2, 'Brasília', 'Vigília em hospital', 'michelle-vigilia-hfa-b68-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli, foragida, grava vídeo na Itália atacando STF.', 'Do meu exílio italiano, afirmo: o Brasil está em ditadura e Bolsonaro é inocente.', 'Vídeo gravado em Roma após condenação definitiva.', 'verified', false, '2025-12-30', 'https://www.metropoles.com/brasil/politica-br/zambelli-exilio-italia-stf', 'social_media_post', 3, 'Roma, Itália', 'Vídeo em rede social', 'zambelli-exilio-stf-b68-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Em mensagem de fim de ano, Bolsonaro chama 2025 de "ano da injustiça".', '2025 foi o ano da injustiça. Que 2026 seja o ano da nossa libertação.', 'Mensagem manuscrita divulgada pelos filhos na virada do ano.', 'verified', false, '2025-12-31', 'https://oglobo.globo.com/politica/bolsonaro-mensagem-ano-injustica/', 'news_article', 2, 'Brasília', 'Mensagem de fim de ano', 'bolsonaro-ano-injustica-b68-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas convoca ato gigante na Paulista em janeiro.', 'Dia 25 de janeiro, Paulista lotada pela libertação de Bolsonaro.', 'Postagem em rede social convocando manifestação no aniversário de SP.', 'verified', false, '2026-01-05', 'https://www.poder360.com.br/politica/nikolas-ato-paulista-bolsonaro/', 'social_media_post', 2, 'São Paulo', 'Convocação ato', 'nikolas-ato-paulista-b68-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio evita se comprometer com candidatura presidencial diante do cenário.', 'Meu foco é São Paulo. Se for vontade de Deus e do presidente Bolsonaro, a gente conversa depois.', 'Entrevista em que evitou se comprometer com sucessão.', 'verified', false, '2026-01-07', 'https://www1.folha.uol.com.br/poder/2026/01/tarcisio-sucessao-bolsonaro.shtml', 'news_article', 1, 'São Paulo', 'Entrevista Folha', 'tarcisio-sucessao-b68-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro publica lista de ministros "que pagarão" na próxima eleição.', 'Anotem: Moraes, Dino, Mendes, Fachin. Todos vão pagar na próxima eleição.', 'Postagem em rede social com lista de ministros do STF.', 'verified', true, '2026-01-08', 'https://g1.globo.com/politica/noticia/2026/01/08/carlos-lista-ministros.ghtml', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-lista-ministros-b68-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio defende anistia para 8 de Janeiro e para o pai.', 'Anistia ampla, geral e irrestrita para todos os patriotas, incluindo meu pai.', 'Entrevista após reunião com lideranças do Centrão.', 'verified', false, '2026-01-10', 'https://www.cnnbrasil.com.br/politica/flavio-anistia-ampla/', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'flavio-anistia-ampla-b68-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle lança livro sobre "perseguição" à família em culto lotado.', 'Este livro conta a verdade sobre a perseguição satânica contra minha família.', 'Lançamento de livro em igreja em Brasília.', 'verified', false, '2026-01-12', 'https://veja.abril.com.br/politica/michelle-livro-perseguicao/', 'news_article', 2, 'Brasília', 'Lançamento de livro', 'michelle-livro-perseguicao-b68-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pede asilo político nos EUA segundo vazamento.', 'Estou avaliando pedir asilo político. Voltar ao Brasil agora seria suicídio.', 'Áudio vazado de conversa com aliados americanos.', 'verified', true, '2026-01-14', 'https://www.bbc.com/portuguese/articles/eduardo-asilo-politico-eua', 'news_article', 4, 'Washington, EUA', 'Áudio vazado', 'eduardo-asilo-eua-b68-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro grava vídeo do hospital agradecendo apoio dos militares.', 'Agradeço aos militares patriotas que ainda torcem pela minha liberdade.', 'Vídeo gravado no HFA e divulgado pela família.', 'verified', true, '2026-01-15', 'https://www.poder360.com.br/politica/bolsonaro-video-militares-hospital/', 'social_media_post', 4, 'Brasília', 'Vídeo do hospital', 'bolsonaro-video-militares-b68-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor2, 'Moraes nega prisão domiciliar e mantém Bolsonaro em cela especial.', 'Não há elementos médicos que justifiquem a conversão em domiciliar.', 'Decisão monocrática de Moraes rejeitando pedido da defesa.', 'verified', false, '2026-01-16', 'https://www.conjur.com.br/2026-jan-16/moraes-nega-domiciliar-bolsonaro', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-nega-domiciliar-b68-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal oferece dinheiro para defesa de Bolsonaro e é criticado.', 'Banquei a defesa do Bolsonaro com meus milhões. Os caras vieram chorar comigo.', 'Live em rede social em que se vangloria da ajuda financeira.', 'verified', false, '2026-01-17', 'https://www.metropoles.com/brasil/politica-br/marcal-bolsonaro-dinheiro-defesa', 'social_media_post', 2, 'São Paulo', 'Live em rede social', 'marcal-defesa-bolsonaro-b68-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão sugere que Bolsonaro aceite sua situação com dignidade.', 'O presidente Bolsonaro precisa aceitar sua situação com a dignidade que o cargo exigia.', 'Entrevista na qual se distancia da família Bolsonaro.', 'verified', false, '2026-01-18', 'https://oglobo.globo.com/politica/mourao-bolsonaro-dignidade/', 'news_article', 1, 'Brasília', 'Entrevista', 'mourao-dignidade-b68-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos ataca Mourão chamando de traidor.', 'Mourão é traidor desde sempre. Papai o escolheu por pressão e foi apunhalado.', 'Resposta em rede social à entrevista de Mourão.', 'verified', false, '2026-01-18', 'https://www1.folha.uol.com.br/poder/2026/01/carlos-ataca-mourao-traidor.shtml', 'social_media_post', 2, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-mourao-traidor-b68-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que Bolsonaro se converteu profundamente na prisão.', 'Meu marido está mais próximo de Deus do que nunca. A prisão está lapidando ele.', 'Entrevista a TV evangélica após visita ao marido.', 'verified', false, '2026-01-20', 'https://noticias.uol.com.br/politica/2026/01/20/michelle-bolsonaro-conversao-prisao.htm', 'news_article', 1, 'Brasília', 'Entrevista TV Record', 'michelle-bolsonaro-conversao-b68-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio se reúne com Centrão para costurar apoio presidencial.', 'Temos uma unidade de direita que vai levar o Brasil a eleger um presidente bolsonarista.', 'Reunião com Lira, Arthur Lira e outros líderes do Centrão.', 'verified', false, '2026-01-22', 'https://www.cnnbrasil.com.br/politica/flavio-centrao-presidencial/', 'news_article', 1, 'Brasília', 'Reunião política', 'flavio-centrao-b68-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo publica vídeo elogiando Trump e pedindo modelo similar no Brasil.', 'Precisamos de um Trump brasileiro para limpar o país dos comunistas.', 'Vídeo gravado em evento MAGA em Orlando.', 'verified', false, '2026-01-23', 'https://veja.abril.com.br/politica/eduardo-trump-brasileiro/', 'social_media_post', 3, 'Orlando, EUA', 'Evento MAGA', 'eduardo-trump-brasileiro-b68-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama ato da Paulista de "maior da história".', 'Foi o maior ato da história do Brasil. Dois milhões pela libertação do presidente.', 'Postagem com números exagerados sobre manifestação na Paulista.', 'verified', true, '2026-01-25', 'https://g1.globo.com/politica/noticia/2026/01/25/ato-paulista-bolsonaro-publico.ghtml', 'social_media_post', 3, 'São Paulo', 'Ato Paulista', 'nikolas-ato-maior-historia-b68-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle discursa na Paulista e pede "revolução nas urnas".', 'Vamos fazer a revolução nas urnas para libertar meu marido.', 'Discurso em cima do trio elétrico durante ato da Paulista.', 'verified', true, '2026-01-25', 'https://www1.folha.uol.com.br/poder/2026/01/michelle-discurso-paulista.shtml', 'news_article', 3, 'São Paulo', 'Ato Paulista', 'michelle-discurso-paulista-b68-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz no ato que será candidato "com ou sem apoio do partido".', 'Sou candidato. Com ou sem PL. O povo é que manda.', 'Fala durante ato da Paulista reforçando pré-candidatura.', 'verified', true, '2026-01-25', 'https://oglobo.globo.com/politica/flavio-candidato-com-ou-sem-pl/', 'news_article', 2, 'São Paulo', 'Ato Paulista', 'flavio-candidato-pl-b68-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio participa da Paulista e exalta Bolsonaro sem se candidatar.', 'Bolsonaro é o maior líder que este país já teve e será nosso candidato de fato.', 'Discurso dúbio sobre candidatura presidencial no ato da Paulista.', 'verified', true, '2026-01-25', 'https://www.poder360.com.br/politica/tarcisio-paulista-bolsonaro-lider/', 'news_article', 2, 'São Paulo', 'Ato Paulista', 'tarcisio-paulista-b68-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, via carta lida na Paulista, pede que povo "não esqueça" os algozes.', 'Não esqueçam os nomes dos que me prenderam. Votem contra eles sempre.', 'Carta manuscrita de Bolsonaro lida por Michelle no trio elétrico.', 'verified', true, '2026-01-25', 'https://www.cnnbrasil.com.br/politica/bolsonaro-carta-paulista-algozes/', 'news_article', 3, 'São Paulo', 'Ato Paulista', 'bolsonaro-carta-paulista-b68-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos se ausenta do ato da Paulista e é criticado pela família.', 'Prefiro agir nos bastidores. A vitrine fica com quem busca cargo.', 'Resposta em rede social após críticas por não ter ido ao ato.', 'verified', false, '2026-01-26', 'https://www.metropoles.com/brasil/politica-br/carlos-ausencia-paulista', 'social_media_post', 2, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-ausencia-paulista-b68-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares compara Michelle a Ester, rainha bíblica.', 'Michelle é a Ester do nosso tempo, levantada por Deus para libertar seu povo.', 'Discurso em evento evangélico em Brasília.', 'verified', false, '2026-01-27', 'https://noticias.uol.com.br/politica/2026/01/27/damares-michelle-ester.htm', 'news_article', 2, 'Brasília', 'Culto evangélico', 'damares-michelle-ester-b68-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica ausência de recursos jurídicos sólidos da defesa de Bolsonaro.', 'A defesa cometeu erros processuais que comprometeram todas as chances de reversão.', 'Entrevista comentando estratégia dos advogados de Bolsonaro.', 'verified', false, '2026-01-28', 'https://www1.folha.uol.com.br/poder/2026/01/moro-critica-defesa-bolsonaro.shtml', 'news_article', 1, 'Curitiba', 'Entrevista', 'moro-critica-defesa-b68-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Daniel Silveira, solto em prisão domiciliar, critica STF.', 'Estão matando Bolsonaro lentamente na prisão, como tentaram comigo.', 'Live em rede social de sua residência sob monitoramento.', 'verified', false, '2026-01-29', 'https://veja.abril.com.br/politica/silveira-bolsonaro-stf/', 'social_media_post', 3, 'Petrópolis', 'Live em rede social', 'silveira-bolsonaro-morte-b68-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio ataca Haddad por medida econômica em meio à campanha.', 'Haddad está quebrando o Brasil enquanto persegue minha família.', 'Publicação em rede social em meio à pré-campanha.', 'verified', false, '2026-02-02', 'https://g1.globo.com/politica/noticia/2026/02/02/flavio-ataca-haddad.ghtml', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'flavio-ataca-haddad-b68-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle pede voto evangélico "no nome de Jesus" em culto.', 'Em nome de Jesus vocês vão me ajudar a libertar meu marido. Amém?', 'Uso de apelo religioso em comício travestido de culto em Anápolis.', 'verified', false, '2026-02-04', 'https://www.poder360.com.br/politica/michelle-voto-evangelico-jesus/', 'news_article', 3, 'Anápolis', 'Culto evangélico', 'michelle-voto-jesus-b68-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo critica Lula por gastos e minimiza crise na família.', 'Meu pai não está sofrendo, está fortalecendo. O povo brasileiro é que sofre com Lula.', 'Entrevista a canal de YouTube bolsonarista.', 'verified', false, '2026-02-06', 'https://www.cnnbrasil.com.br/politica/eduardo-lula-gastos-pai/', 'news_article', 2, 'EUA', 'Entrevista YouTube', 'eduardo-lula-gastos-b68-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro posta suposta "lista negra" de jornalistas.', 'Esta é a lista dos jornalistas que mentiram sobre meu pai. Jamais esqueceremos.', 'Postagem com fotos e nomes de jornalistas que gerou onda de ataques coordenados.', 'verified', true, '2026-02-08', 'https://www1.folha.uol.com.br/poder/2026/02/carlos-lista-jornalistas.shtml', 'social_media_post', 5, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-lista-jornalistas-b68-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones rebate Flávio e ironiza saúde de Bolsonaro.', 'A saúde do Bolsonaro piora toda vez que tem audiência marcada. É diagnóstico conhecido.', 'Postagem em rede social após Flávio acusar governo de negligência.', 'verified', false, '2026-02-09', 'https://noticias.uol.com.br/politica/2026/02/09/janones-ironia-bolsonaro-saude.htm', 'social_media_post', 1, 'Ituiutaba', 'Postagem em rede social', 'janones-ironia-bolsonaro-b68-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio anuncia viagem internacional para denunciar STF.', 'Vou aos EUA e Europa denunciar a tirania do STF contra minha família.', 'Anúncio de agenda internacional com parlamentares de direita.', 'verified', false, '2026-02-10', 'https://oglobo.globo.com/politica/flavio-viagem-eua-europa-stf/', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'flavio-viagem-internacional-b68-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que mulheres "não devem ganhar igual aos homens".', 'A mulher tem papel diferente do homem. Querer igualdade salarial é antinatural.', 'Declaração em evento de mulheres evangélicas gerou indignação.', 'verified', true, '2026-02-11', 'https://veja.abril.com.br/politica/michelle-mulheres-salario-homens/', 'news_article', 4, 'Curitiba', 'Evento com mulheres evangélicas', 'michelle-mulheres-salario-b68-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi rebate Michelle sobre salário de mulheres.', 'Michelle mostra o que realmente pensa da mulher. Lugar de submissão, não de direito.', 'Postagem em rede social em resposta a declaração de Michelle.', 'verified', false, '2026-02-11', 'https://www.metropoles.com/brasil/politica-br/gleisi-rebate-michelle', 'social_media_post', 1, 'Brasília', 'Postagem em rede social', 'gleisi-rebate-michelle-b68-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas apoia Michelle e ataca feminismo após polêmica.', 'Michelle está certa. Feminismo destruiu o Brasil e a família.', 'Vídeo em rede social defendendo falas de Michelle sobre mulheres.', 'verified', false, '2026-02-12', 'https://www.poder360.com.br/politica/nikolas-defende-michelle-feminismo/', 'social_media_post', 3, 'Belo Horizonte', 'Vídeo em rede social', 'nikolas-feminismo-b68-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tenta reunião com ex-ministros dentro da cela e é barrado.', 'Quero reunir meu grupo. Por que não posso? Aqui é uma prisão política.', 'PF barrou tentativa de reunião política dentro do quartel.', 'verified', false, '2026-02-13', 'https://www1.folha.uol.com.br/poder/2026/02/bolsonaro-reuniao-ex-ministros-cela.shtml', 'news_article', 2, 'Brasília', 'Quartel prisional', 'bolsonaro-reuniao-cela-b68-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio pressiona Valdemar e Lira por apoio formal do PL.', 'Se o PL não me apoiar, vou para outro partido. O povo pede.', 'Reunião com Valdemar Costa Neto gerou crise no PL.', 'verified', false, '2026-02-15', 'https://www.cnnbrasil.com.br/politica/flavio-valdemar-pl-pressao/', 'news_article', 2, 'Brasília', 'Reunião partidária', 'flavio-pressao-pl-b68-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo publica áudio supostamente do pai xingando Moraes.', 'Esse áudio é do meu pai mostrando o que pensa do "ministro".', 'Postagem de áudio não autorizado causou investigação sobre contrabando na prisão.', 'verified', true, '2026-02-17', 'https://g1.globo.com/politica/noticia/2026/02/17/eduardo-audio-pai-moraes.ghtml', 'social_media_post', 4, 'EUA', 'Postagem em rede social', 'eduardo-audio-pai-moraes-b68-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle faz comentário considerado homofóbico em entrevista.', 'Deus fez homem e mulher. Quem acha diferente está enganando a si mesmo.', 'Resposta a pergunta sobre direitos LGBTQIA+ em entrevista.', 'verified', false, '2026-02-18', 'https://noticias.uol.com.br/politica/2026/02/18/michelle-deus-homem-mulher-lgbt.htm', 'news_article', 3, 'Brasília', 'Entrevista', 'michelle-homofobia-b68-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano profere fala racista ao criticar governo Lula.', 'Esse governo tá enchendo de gente estranha em cargos. Cota racial é pura ideologia.', 'Discurso em evento eleitoral do PL.', 'verified', false, '2026-02-19', 'https://www.metropoles.com/brasil/politica-br/feliciano-cotas-racismo', 'news_article', 4, 'Recife', 'Evento PL', 'feliciano-cotas-racismo-b68-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro faz piada sobre a saúde do pai.', 'Papai é mais duro que peroba. Vai durar mais que a era Lula.', 'Postagem em rede social após notícia de melhora de Bolsonaro.', 'verified', false, '2026-02-20', 'https://veja.abril.com.br/politica/carlos-piada-pai-saude/', 'social_media_post', 1, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-piada-pai-b68-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende candidatura de Michelle como "unção direta".', 'Michelle é a escolha de Deus. Quem votar nela estará votando no Reino de Deus.', 'Pregação em culto com Michelle presente.', 'verified', false, '2026-02-22', 'https://www1.folha.uol.com.br/poder/2026/02/damares-michelle-uncao-divina.shtml', 'news_article', 3, 'Goiânia', 'Culto com Michelle', 'damares-uncao-michelle-b68-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta convida pastores a "orar pela queda" do STF.', 'Orem para que o Senhor derrube essa corte corrompida que prendeu Bolsonaro.', 'Discurso em congresso de pastores em Cachoeiro.', 'verified', false, '2026-02-23', 'https://www.poder360.com.br/politica/magno-malta-queda-stf-pastores/', 'news_article', 4, 'Cachoeiro de Itapemirim', 'Congresso de pastores', 'magno-malta-queda-stf-b68-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio apresenta projeto para reduzir poderes do STF.', 'Vou apresentar PEC para reduzir o poder absolutista do STF.', 'Apresentação de PEC no Senado.', 'verified', false, '2026-02-24', 'https://www.cnnbrasil.com.br/politica/flavio-pec-poderes-stf/', 'news_article', 3, 'Senado Federal', 'Sessão legislativa', 'flavio-pec-stf-b68-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comenta prisão de Bolsonaro em entrevista.', 'Bolsonaro cumpre pena imposta pelo sistema de justiça. Não é perseguição, é consequência.', 'Entrevista a jornal internacional sobre cenário político.', 'verified', false, '2026-02-25', 'https://oglobo.globo.com/politica/lula-bolsonaro-prisao-consequencia/', 'news_article', 1, 'Brasília', 'Entrevista Reuters', 'lula-bolsonaro-consequencia-b68-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pede aos EUA para boicotarem eleições de 2026 se "fraudadas".', 'Se houver fraude eleitoral em 2026, os EUA não devem reconhecer o resultado.', 'Depoimento em subcomitê do Congresso americano.', 'verified', true, '2026-02-26', 'https://www.bbc.com/portuguese/articles/eduardo-eua-eleicoes-2026-fraude', 'news_article', 5, 'Washington, EUA', 'Audiência congressional', 'eduardo-eua-fraude-b68-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle visita Bolsonaro em cela e sai chorando dizendo que "ele quase morreu".', 'Encontrei meu marido quase morto. Deus os perdoe.', 'Declaração à imprensa após visita no quartel militar.', 'verified', true, '2026-02-27', 'https://www1.folha.uol.com.br/poder/2026/02/michelle-visita-bolsonaro-morte.shtml', 'news_article', 3, 'Brasília', 'Visita no quartel', 'michelle-quase-morreu-b68-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Ministro Flávio Dino desmente relato sobre saúde de Bolsonaro.', 'O ex-presidente está sendo tratado com todo o respeito. Os laudos médicos oficiais são públicos.', 'Declaração em entrevista após fala de Michelle.', 'verified', false, '2026-02-27', 'https://www.conjur.com.br/2026-fev-27/dino-bolsonaro-saude-tratamento', 'news_article', 1, 'Brasília', 'Entrevista', 'dino-desmente-michelle-b68-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro divulga imagem falsa supostamente vazada de cela.', 'Vejam em que condições meu pai está. Uma vergonha nacional.', 'Imagem descoberta como gerada por IA por agência de checagem.', 'verified', true, '2026-02-28', 'https://www.metropoles.com/brasil/politica-br/carlos-imagem-falsa-ia-cela', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-imagem-falsa-ia-b68-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio ataca a Folha em coletiva e chama imprensa de "inimiga".', 'A imprensa dessa Folha é inimiga do povo brasileiro. Estão mentindo sobre meu pai.', 'Fala durante coletiva no Senado com ofensas a veículos.', 'verified', false, '2026-03-02', 'https://g1.globo.com/politica/noticia/2026/03/02/flavio-imprensa-inimiga-folha.ghtml', 'news_article', 3, 'Senado Federal', 'Coletiva de imprensa', 'flavio-imprensa-inimiga-b68-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas zomba de parlamentar trans em plenário com referência a Bolsonaro.', 'Meu pai biológico está preso político, mas tem quem queira brincar de gênero aqui.', 'Fala em plenário gerou processo no Conselho de Ética.', 'verified', true, '2026-03-03', 'https://veja.abril.com.br/politica/nikolas-parlamentar-trans-plenario/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-trans-plenario-b68-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle critica educação sexual nas escolas em campanha.', 'Esse governo quer doutrinar nossos filhos com gender. Só no meu governo acaba isso.', 'Discurso de campanha em colégio evangélico de Brasília.', 'verified', false, '2026-03-05', 'https://www.poder360.com.br/politica/michelle-educacao-sexual-campanha/', 'news_article', 3, 'Brasília', 'Comício em colégio', 'michelle-educacao-sexual-b68-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo divulga suposto plano para usar Trump contra urnas brasileiras.', 'Estamos organizando pressão internacional para impor voto impresso no Brasil.', 'Declaração em entrevista a site conservador americano.', 'verified', true, '2026-03-07', 'https://www.cnnbrasil.com.br/politica/eduardo-trump-voto-impresso-pressao/', 'news_article', 5, 'EUA', 'Entrevista Breitbart', 'eduardo-trump-urnas-b68-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que Bolsonaro será "presidente moral" mesmo preso.', 'Meu pai é o presidente moral do Brasil, preso ou solto.', 'Entrevista após ato em São Paulo.', 'verified', false, '2026-03-08', 'https://oglobo.globo.com/politica/flavio-bolsonaro-presidente-moral/', 'news_article', 2, 'São Paulo', 'Coletiva pós-ato', 'flavio-presidente-moral-b68-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comemora aniversário na prisão com carta dura ao STF.', 'Hoje completo mais um ano e o STF me dá de presente a humilhação. A história os julgará.', 'Carta manuscrita divulgada no dia do aniversário do ex-presidente.', 'verified', true, '2026-03-21', 'https://www1.folha.uol.com.br/poder/2026/03/bolsonaro-aniversario-carta-stf.shtml', 'news_article', 3, 'Brasília', 'Aniversário na prisão', 'bolsonaro-aniversario-carta-b68-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos organiza campanha online no aniversário do pai com hashtag pedindo intervenção.', '#FFAABrasilLivre no Twitter em homenagem ao meu pai.', 'Hashtag pede intervenção das Forças Armadas viralizou nas redes.', 'verified', true, '2026-03-21', 'https://g1.globo.com/politica/noticia/2026/03/21/carlos-hashtag-intervencao-aniversario.ghtml', 'social_media_post', 5, 'Rio de Janeiro', 'Campanha em rede social', 'carlos-hashtag-intervencao-b68-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio recua em fala anterior e desmente irmão Carlos sobre intervenção.', 'A família Bolsonaro jamais defendeu intervenção. Isso é coisa do Twitter, não nossa.', 'Coletiva para tentar controlar estrago após hashtag de Carlos.', 'verified', false, '2026-03-22', 'https://veja.abril.com.br/politica/flavio-desmente-carlos-intervencao/', 'news_article', 2, 'Brasília', 'Coletiva', 'flavio-desmente-carlos-b68-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo cobra Trump por sanções contra Moraes em nova postagem.', 'Sr. presidente Trump, o mundo espera a Lei Magnitsky contra Moraes.', 'Postagem em rede social marcando o presidente dos EUA.', 'verified', false, '2026-03-24', 'https://www.poder360.com.br/politica/eduardo-trump-magnitsky-moraes/', 'social_media_post', 4, 'EUA', 'Postagem em rede social', 'eduardo-trump-magnitsky-b68-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que Bolsonaro "a perdoou" por frustrações antigas em entrevista.', 'Meu marido me perdoou. Nosso casamento está melhor com ele preso.', 'Entrevista considerada constrangedora em programa evangélico.', 'verified', false, '2026-03-25', 'https://www.metropoles.com/brasil/politica-br/michelle-bolsonaro-casamento-prisao', 'news_article', 1, 'São Paulo', 'Programa TV Record', 'michelle-casamento-prisao-b68-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares acusa governo Lula de desmontar "ministério da família".', 'Lula está destruindo a família brasileira. Só Bolsonaro sabe defender.', 'Discurso em CPI no Senado.', 'verified', false, '2026-03-26', 'https://noticias.uol.com.br/politica/2026/03/26/damares-familia-lula.htm', 'news_article', 2, 'Senado Federal', 'CPI', 'damares-familia-lula-b68-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca Lula de forma violenta em live.', 'Se pudesse, eu mandava o Lula para o inferno agora. Ele destruiu o Brasil.', 'Live em rede social gerou nova representação na PGR.', 'verified', true, '2026-03-28', 'https://www1.folha.uol.com.br/poder/2026/03/nikolas-ataca-lula-inferno.shtml', 'social_media_post', 4, 'Belo Horizonte', 'Live em rede social', 'nikolas-lula-inferno-b68-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio usa discurso nacionalista em entrevista contra "globalismo".', 'Vou libertar o Brasil do globalismo, dos comunistas e do STF corrupto.', 'Entrevista a canal bolsonarista de direita.', 'verified', false, '2026-03-30', 'https://www.cnnbrasil.com.br/politica/flavio-globalismo-stf-comunistas/', 'news_article', 2, 'Brasília', 'Entrevista canal YouTube', 'flavio-globalismo-b68-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro perde condição de elegibilidade e se irrita em carta.', 'Estou proibido de votar em mim mesmo. Que país de merda é esse?', 'Trecho de carta manuscrita vazado por apoiador.', 'verified', true, '2026-04-02', 'https://g1.globo.com/politica/noticia/2026/04/02/bolsonaro-carta-vazada-pais-merda.ghtml', 'news_article', 3, 'Brasília', 'Carta vazada', 'bolsonaro-pais-merda-b68-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli publica vídeo fantasiada de Bolsonaro na prisão.', 'Estou aqui como meu presidente está, preso injustamente. Liberdade para Bolsonaro.', 'Vídeo viral gerou polêmica sobre condição de foragida na Itália.', 'verified', false, '2026-04-03', 'https://veja.abril.com.br/politica/zambelli-video-fantasia-bolsonaro/', 'social_media_post', 2, 'Roma, Itália', 'Vídeo em rede social', 'zambelli-fantasia-bolsonaro-b68-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que "só Deus" pode tirar Bolsonaro da prisão.', 'A Justiça dos homens falhou. Só Deus pode tirar meu marido dessa prisão.', 'Fala em culto em Uberlândia.', 'verified', false, '2026-04-05', 'https://www.poder360.com.br/politica/michelle-deus-bolsonaro-prisao/', 'news_article', 2, 'Uberlândia', 'Culto evangélico', 'michelle-deus-prisao-b68-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos contrata equipe de mídia para turbinar Michelle.', 'Vamos transformar mamãe na presidente moral do Brasil nas redes.', 'Vazamento de áudio em grupo bolsonarista sobre marketing digital.', 'verified', false, '2026-04-07', 'https://oglobo.globo.com/politica/carlos-marketing-michelle-midia/', 'news_article', 2, 'Rio de Janeiro', 'Áudio vazado', 'carlos-marketing-michelle-b68-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que irá aos EUA ao lado de Eduardo pedir pressão internacional.', 'Vou aos EUA com meu irmão articular pressão internacional para libertar o pai.', 'Anúncio de agenda conjunta com Eduardo em Washington.', 'verified', false, '2026-04-09', 'https://www.cnnbrasil.com.br/politica/flavio-eduardo-eua-bolsonaro/', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'flavio-eduardo-eua-b68-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz vídeo ridicularizando Moraes em imitação.', 'Sou o ministro Moraes, o carcereiro-mor do Brasil. Vou prender vocês também!', 'Vídeo zombando do ministro viralizou nas redes sociais.', 'verified', false, '2026-04-10', 'https://www.metropoles.com/brasil/politica-br/nikolas-imitacao-moraes', 'social_media_post', 3, 'Belo Horizonte', 'Vídeo em rede social', 'nikolas-imitacao-moraes-b68-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende CPI contra Moraes.', 'Vamos instalar uma CPI para investigar os crimes do ministro Moraes.', 'Pedido formal de CPI protocolado na Câmara.', 'verified', false, '2026-04-11', 'https://www1.folha.uol.com.br/poder/2026/04/bia-kicis-cpi-moraes.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Requerimento de CPI', 'bia-kicis-cpi-moraes-b68-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rebate Flávio sobre economia e defende governo.', 'Flávio mente sobre economia. O país cresce apesar do legado da família dele.', 'Entrevista coletiva no Ministério da Fazenda.', 'verified', false, '2026-04-12', 'https://veja.abril.com.br/economia/haddad-rebate-flavio-economia/', 'news_article', 1, 'Brasília', 'Coletiva de imprensa', 'haddad-rebate-flavio-b68-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio se reúne com Flávio e evita confirmar apoio à candidatura.', 'Meu foco é São Paulo, mas respeito o Flávio e sua decisão.', 'Reunião reservada entre governador e senador em São Paulo.', 'verified', false, '2026-04-13', 'https://www.poder360.com.br/politica/tarcisio-flavio-reuniao-candidatura/', 'news_article', 1, 'São Paulo', 'Reunião política', 'tarcisio-flavio-reuniao-b68-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo se encontra com Steve Bannon e faz aceno a movimentos radicais.', 'Junto com Bannon vamos montar a estratégia para libertar o Brasil.', 'Encontro em Washington gerou alerta nas embaixadas brasileiras.', 'verified', true, '2026-04-14', 'https://www.bbc.com/portuguese/articles/eduardo-bannon-washington', 'news_article', 4, 'Washington, EUA', 'Reunião com Bannon', 'eduardo-bannon-b68-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos insulta jornalista em resposta a reportagem sobre saúde do pai.', 'Essa jornalista petista vive do ódio ao meu pai. Vai trabalhar, vagabunda.', 'Resposta em rede social com ofensa misógina gerou representação.', 'verified', true, '2026-04-15', 'https://oglobo.globo.com/politica/carlos-ofensa-jornalista-vagabunda/', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-ofensa-jornalista-b68-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle lança slogan de campanha "Mãe do Brasil".', 'Serei a Mãe do Brasil no Senado. Vou cuidar de todos vocês.', 'Lançamento oficial da campanha com slogan maternal.', 'verified', false, '2026-04-16', 'https://www.metropoles.com/brasil/politica-br/michelle-mae-brasil-campanha', 'news_article', 2, 'Brasília', 'Lançamento de campanha', 'michelle-mae-brasil-b68-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede a família que "não desistam" em carta aos filhos.', 'Meus filhos, não desistam. Continuem a luta. O Brasil conta com vocês.', 'Carta manuscrita divulgada após visita familiar na Páscoa.', 'verified', true, '2026-04-16', 'https://g1.globo.com/politica/noticia/2026/04/16/bolsonaro-carta-filhos-pascoa.ghtml', 'news_article', 2, 'Brasília', 'Carta na Páscoa', 'bolsonaro-carta-filhos-b68-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio ataca Lula por política externa com Venezuela na véspera de viagem.', 'Lula abraça ditadores enquanto meu pai apodrece na cadeia.', 'Postagem em rede social em meio a viagem de Lula para Caracas.', 'verified', false, '2026-04-17', 'https://www.cnnbrasil.com.br/politica/flavio-lula-venezuela-ditadores/', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'flavio-lula-venezuela-b68-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
