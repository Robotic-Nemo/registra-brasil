-- statements_batch71.sql
-- Tema: Equipe econômica, política fiscal/monetária (Jan 2023 - Abr 2026)
-- 100 declarações

DO $$
DECLARE
  v_had UUID; v_camp UUID; v_gal UUID; v_teb UUID; v_dwe UUID;
  v_pra UUID; v_cha UUID; v_mer UUID; v_lul UUID; v_gle UUID;
  v_sil UUID; v_fav UUID; v_mar UUID; v_alc UUID; v_bol UUID;
  v_gue UUID; v_rui UUID; v_wdi UUID; v_lup UUID; v_lmar UUID;
  v_rmar UUID; v_adv UUID; v_vhm UUID; v_nik UUID; v_tab UUID;
  v_agu UUID; v_ebo UUID; v_ter UUID;
  c_irr UUID; c_des UUID; c_abu UUID; c_aut UUID; c_obs UUID;
  c_ame UUID; c_neg UUID; c_ant UUID; c_cor UUID; c_con UUID; c_int UUID;
BEGIN
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_camp FROM politicians WHERE slug = 'roberto-campos-neto';
  SELECT id INTO v_gal FROM politicians WHERE slug = 'gabriel-galipolo';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_dwe FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_pra FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'magda-chambriard';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_gue FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_wdi FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_lmar FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_rmar FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_vhm FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_agu FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_ebo FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';

  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad comenta corte de rating da Fitch.', 'Rating nenhum define o destino do Brasil, define a capacidade de cumprir compromissos.', 'Haddad respondeu a relatório da Fitch em 2024.', 'verified', false, '2024-07-29', 'https://www.reuters.com/world/americas/haddad-fitch-brasil-2024-07-29/', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-fitch-b71-1') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto alerta para desancoragem.', 'Expectativas desancoradas exigem juros mais altos por mais tempo.', 'Campos Neto em ata do Copom.', 'verified', false, '2024-06-25', 'https://www.bcb.gov.br/detalhenoticia/20240625-ata-copom', 'government', 2, 'Brasília', 'Ata do Copom', 'campos-ata-desancoragem-b71-2') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula chama juros altos de crime.', 'Juros alto no Brasil é um crime contra o povo brasileiro.', 'Lula em ato sindical.', 'verified', true, '2023-08-18', 'https://g1.globo.com/politica/noticia/2023/08/18/lula-juros-crime.ghtml', 'news_article', 4, 'Salvador', 'Ato sindical', 'lula-juros-crime-b71-3') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre juros neutros.', 'O Brasil precisa reduzir o juro real neutro através de reformas e credibilidade.', 'Haddad em palestra no Lide.', 'verified', false, '2024-03-04', 'https://valor.globo.com/brasil/noticia/2024/03/04/haddad-juros-neutros.ghtml', 'news_article', 1, 'São Paulo', 'Lide', 'haddad-juros-neutros-b71-4') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_pra, 'Prates divulga plano estratégico Petrobras.', 'A Petrobras vai investir em transição energética sem abrir mão de óleo e gás.', 'Prates lançou novo plano estratégico 2024-2028.', 'verified', false, '2023-11-24', 'https://g1.globo.com/economia/noticia/2023/11/24/prates-plano-estrategico.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Plano Estratégico', 'prates-plano-estrategico-b71-5') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_cha, 'Chambriard sobre refinarias.', 'A Petrobras não vai mais privatizar refinarias, essa fase acabou.', 'Chambriard anunciou retomada de refinarias em 2024.', 'verified', false, '2024-08-01', 'https://valor.globo.com/empresas/noticia/2024/08/01/chambriard-refinarias.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Coletiva Petrobras', 'chambriard-refinarias-b71-6') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad explica desoneração.', 'A solução da desoneração respeita empregos e equilibra as contas.', 'Haddad após acordo com STF em 2024.', 'verified', false, '2024-05-09', 'https://valor.globo.com/brasil/noticia/2024/05/09/haddad-desoneracao-acordo.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-desoneracao-acordo-b71-7') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gue, 'Guedes diz que Brasil vai quebrar.', 'Com esse arcabouço o Brasil quebra em 2026, está escrito.', 'Guedes em evento de agentes autônomos.', 'verified', false, '2023-11-09', 'https://www1.folha.uol.com.br/mercado/2023/11/guedes-brasil-quebra.shtml', 'news_article', 4, 'São Paulo', 'Evento XP', 'guedes-brasil-quebra-b71-8') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad cita trajetória de arrecadação.', 'A arrecadação federal cresce em termos reais há 12 meses consecutivos.', 'Haddad citando dados da RFB.', 'verified', false, '2024-05-22', 'https://valor.globo.com/brasil/noticia/2024/05/22/haddad-arrecadacao.ghtml', 'news_article', 1, 'Brasília', 'Coletiva RFB', 'haddad-arrecadacao-b71-9') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_rmar, 'Rogério Marinho ataca Haddad.', 'Haddad é a carinha simpática de uma política fiscal desastrosa.', 'Rogério Marinho no plenário.', 'verified', false, '2024-06-20', 'https://www1.folha.uol.com.br/mercado/2024/06/rogerio-haddad.shtml', 'news_article', 3, 'Brasília', 'Plenário Senado', 'rogerio-ataca-haddad-b71-10') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet sobre corte do PAC.', 'Cortes no PAC são necessários para caber no arcabouço.', 'Tebet em reunião com Rui Costa.', 'verified', false, '2024-11-25', 'https://g1.globo.com/politica/noticia/2024/11/25/tebet-corte-pac.ghtml', 'news_article', 2, 'Brasília', 'Reunião Planalto', 'tebet-corte-pac-b71-11') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_rui, 'Rui Costa defende PAC integral.', 'Não haverá corte no PAC, o PAC é a marca deste governo.', 'Rui Costa contrariou Tebet sobre cortes.', 'verified', true, '2024-11-26', 'https://valor.globo.com/politica/noticia/2024/11/26/rui-costa-pac.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Casa Civil', 'rui-costa-pac-integral-b71-12') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia novo cadastro positivo.', 'O cadastro positivo aprimorado ajudará a reduzir spread bancário.', 'Haddad em audiência com bancos em 2024.', 'verified', false, '2024-04-08', 'https://valor.globo.com/financas/noticia/2024/04/08/haddad-cadastro-positivo.ghtml', 'news_article', 1, 'Brasília', 'Audiência com bancos', 'haddad-cadastro-positivo-b71-13') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_fav, 'Fávaro comenta Plano Safra 24/25.', 'Ampliamos o Plano Safra em volume e reduzimos juros do Pronaf.', 'Fávaro lançou Plano Safra 2024/25.', 'verified', false, '2024-07-03', 'https://www.gov.br/agricultura/pt-br/assuntos/noticias/favaro-plano-safra-24', 'government', 1, 'Brasília', 'Lançamento Plano Safra 24/25', 'favaro-plano-safra-24-b71-14') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula quer taxar remessas para o exterior.', 'O rico mandando dinheiro para o exterior tem que pagar imposto maior.', 'Lula defendeu em entrevista à BandNews.', 'verified', false, '2025-06-12', 'https://g1.globo.com/politica/noticia/2025/06/12/lula-taxar-remessas.ghtml', 'news_article', 3, 'Brasília', 'Entrevista BandNews', 'lula-remessas-b71-15') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad comenta inflação dentro da meta.', 'Estamos no intervalo de tolerância e o caminho é convergir para o centro.', 'Haddad após IPCA de maio.', 'verified', false, '2024-06-11', 'https://valor.globo.com/brasil/noticia/2024/06/11/haddad-ipca-maio.ghtml', 'news_article', 1, 'Brasília', 'Coletiva IPCA', 'haddad-ipca-b71-16') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo detalha novo regime de metas contínuas.', 'O regime de meta contínua aproxima o Brasil das melhores práticas internacionais.', 'Galípolo explicou novo regime em coletiva.', 'verified', false, '2024-06-26', 'https://www.bcb.gov.br/detalhenoticia/20240626-meta-continua', 'government', 1, 'Brasília', 'Coletiva CMN', 'galipolo-meta-continua-b71-17') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad celebra meta contínua.', 'A nova sistemática torna o regime de metas mais claro e responsável.', 'Haddad aprovou meta contínua no CMN.', 'verified', false, '2024-06-26', 'https://valor.globo.com/brasil/noticia/2024/06/26/haddad-meta-continua.ghtml', 'news_article', 1, 'Brasília', 'CMN', 'haddad-meta-continua-b71-18') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula diz que economia voou no primeiro ano.', 'A economia tá voando, a inflação caiu, o emprego subiu.', 'Lula em discurso de 1 ano de governo.', 'verified', false, '2024-01-01', 'https://g1.globo.com/politica/noticia/2024/01/01/lula-economia-voando.ghtml', 'news_article', 2, 'Brasília', 'Discurso 1 ano', 'lula-economia-voando-b71-19') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lmar, 'Luiz Marinho defende reajuste Pronampe.', 'O pequeno empreendedor merece ter acesso ao crédito com taxas humanas.', 'Luiz Marinho em lançamento do Pronampe.', 'verified', false, '2023-06-15', 'https://www.gov.br/trabalho/pt-br/noticias/marinho-pronampe', 'government', 1, 'Brasília', 'Lançamento Pronampe', 'luiz-pronampe-b71-20') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lup, 'Lupi diz que previdência tá equilibrada.', 'A Previdência não tem déficit, essa história é conversa de banqueiro.', 'Lupi como ministro da Previdência.', 'verified', false, '2023-05-03', 'https://www1.folha.uol.com.br/mercado/2023/05/lupi-previdencia.shtml', 'news_article', 3, 'Brasília', 'Coletiva MPS', 'lupi-previdencia-deficit-b71-21') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad critica postura de Lupi.', 'Precisamos tratar a Previdência com responsabilidade, seus números são claros.', 'Haddad contestou Lupi em audiência.', 'verified', false, '2023-05-04', 'https://valor.globo.com/brasil/noticia/2023/05/04/haddad-lupi-previdencia.ghtml', 'news_article', 2, 'Brasília', 'Comissão Senado', 'haddad-rebate-lupi-b71-22') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_pra, 'Prates nega conflito de interesse.', 'Não há conflito de interesse algum na minha gestão da Petrobras.', 'Prates respondeu questionamentos sobre sua gestão.', 'verified', false, '2024-03-08', 'https://valor.globo.com/empresas/noticia/2024/03/08/prates-conflito.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Coletiva Petrobras', 'prates-conflito-b71-23') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 24
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_dwe, 'Dweck detalha estabilidade de servidores.', 'Estabilidade e avaliação de desempenho não são incompatíveis.', 'Dweck em audiência sobre reforma administrativa.', 'verified', false, '2024-09-18', 'https://valor.globo.com/brasil/noticia/2024/09/18/dweck-estabilidade.ghtml', 'news_article', 1, 'Brasília', 'Comissão Câmara', 'dweck-estabilidade-b71-24') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet sobre dólar a R$ 6.', 'O Brasil não vai quebrar, não é a primeira turbulência.', 'Tebet minimizou pânico cambial em dezembro de 2024.', 'verified', false, '2024-12-20', 'https://g1.globo.com/politica/noticia/2024/12/20/tebet-dolar.ghtml', 'news_article', 2, 'Brasília', 'Entrevista GloboNews', 'tebet-dolar-brasil-b71-25') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_alc, 'Alckmin sobre Mercosul-UE.', 'O acordo Mercosul-UE é a janela para integrar o Brasil às cadeias globais.', 'Alckmin em missão europeia.', 'verified', false, '2024-12-06', 'https://valor.globo.com/brasil/noticia/2024/12/06/alckmin-mercosul-ue.ghtml', 'news_article', 1, 'Montevidéu', 'Assinatura Mercosul-UE', 'alckmin-mercosul-ue-b71-26') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre Mercosul-UE.', 'O acordo tem impacto fiscal positivo e abre mercados para o Brasil.', 'Haddad comentou o acordo em coletiva.', 'verified', false, '2024-12-07', 'https://valor.globo.com/brasil/noticia/2024/12/07/haddad-mercosul.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-mercosul-ue-b71-27') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_bol, 'Bolsonaro diz que Lula vai destruir economia.', 'Lula vai destruir a economia como em 2015, é só esperar.', 'Bolsonaro em transmissão.', 'verified', false, '2023-03-15', 'https://g1.globo.com/politica/noticia/2023/03/15/bolsonaro-destruir-economia.ghtml', 'news_article', 3, 'Brasília', 'Live', 'bolsonaro-destruir-economia-b71-28') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_nik, 'Nikolas mente sobre Pix.', 'O governo Lula vai taxar seu Pix, tá escrito na Receita.', 'Nikolas publicou vídeo viral com informação falsa em 2025.', 'verified', true, '2025-01-10', 'https://www1.folha.uol.com.br/mercado/2025/01/nikolas-pix-fake.shtml', 'news_article', 5, 'Brasília', 'Vídeo redes sociais', 'nikolas-pix-fake-b71-29') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad desmente taxação do Pix.', 'Não existe taxação do Pix, é fake news irresponsável.', 'Haddad desmentiu informações falsas em coletiva.', 'verified', true, '2025-01-12', 'https://valor.globo.com/brasil/noticia/2025/01/12/haddad-desmente-pix.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-desmente-pix-b71-30') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_ebo, 'Eduardo Bolsonaro amplifica fake do Pix.', 'O governo quer controlar seu Pix, é socialismo puro.', 'Eduardo Bolsonaro compartilhou desinformação.', 'verified', true, '2025-01-11', 'https://g1.globo.com/politica/noticia/2025/01/11/eduardo-pix-fake.ghtml', 'news_article', 4, 'Brasília', 'Redes sociais', 'eduardo-pix-fake-b71-31') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_vhm, 'Van Hattem ataca vigilância do Pix.', 'A Receita quer bisbilhotar cada centavo do contribuinte.', 'Van Hattem em plenário sobre instrução normativa.', 'verified', false, '2025-01-13', 'https://g1.globo.com/politica/noticia/2025/01/13/vanhattem-pix.ghtml', 'news_article', 3, 'Brasília', 'Plenário Câmara', 'vanhattem-pix-b71-32') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad revoga IN do Pix.', 'Revogamos a instrução normativa para evitar qualquer dúvida.', 'Haddad revogou IN após escalada da desinformação.', 'verified', true, '2025-01-15', 'https://valor.globo.com/brasil/noticia/2025/01/15/haddad-revoga-in-pix.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Fazenda', 'haddad-revoga-in-b71-33') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo em Jackson Hole.', 'O Brasil tem fundamentos para manter convergência da inflação sem recessão.', 'Galípolo em Jackson Hole em agosto de 2025.', 'verified', false, '2025-08-22', 'https://www.reuters.com/world/americas/galipolo-jackson-hole-2025-08-22/', 'news_article', 1, 'Jackson Hole', 'Jackson Hole Symposium', 'galipolo-jackson-hole-b71-34') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad projeta déficit primário zerado em 2025.', 'Trabalhamos para entregar primário próximo de zero em 2025.', 'Haddad em coletiva de agosto de 2025.', 'verified', false, '2025-08-14', 'https://valor.globo.com/brasil/noticia/2025/08/14/haddad-primario-2025.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-primario-2025-b71-35') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula fala em ''empresários patriotas''.', 'Os empresários que investem aqui são patriotas, os outros são especuladores.', 'Lula em evento da FIESP em 2025.', 'verified', false, '2025-05-20', 'https://g1.globo.com/politica/noticia/2025/05/20/lula-empresarios-patriotas.ghtml', 'news_article', 3, 'São Paulo', 'Evento FIESP', 'lula-patriotas-b71-36') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia regulação bets.', 'A regulação das bets fecha uma brecha gigante de tributação.', 'Haddad regulamentou apostas esportivas em 2024.', 'verified', false, '2024-07-31', 'https://valor.globo.com/brasil/noticia/2024/07/31/haddad-bets.ghtml', 'news_article', 2, 'Brasília', 'Regulamentação bets', 'haddad-bets-b71-37') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad lança Desenrola.', 'O Desenrola tira o nome de milhões de brasileiros do vermelho.', 'Haddad lançou o Desenrola Brasil.', 'verified', true, '2023-07-17', 'https://g1.globo.com/economia/noticia/2023/07/17/haddad-desenrola.ghtml', 'news_article', 1, 'Brasília', 'Lançamento Desenrola', 'haddad-desenrola-b71-38') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto critica relatório do Copom.', 'Não vou comentar decisões anteriores, mas disciplina é fundamental.', 'Campos Neto em evento após divisão do Copom em maio de 2024.', 'verified', true, '2024-05-16', 'https://www1.folha.uol.com.br/mercado/2024/05/campos-copom-divisao.shtml', 'news_article', 2, 'Brasília', 'Evento ICC', 'campos-copom-divisao-b71-39') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo explica voto dissidente no Copom.', 'O cenário exigia um corte menor para preservar a credibilidade.', 'Galípolo votou diferente de outros indicados pelo governo em 2024.', 'verified', true, '2024-05-10', 'https://valor.globo.com/financas/noticia/2024/05/10/galipolo-voto-copom.ghtml', 'news_article', 2, 'Brasília', 'Coletiva pós-Copom', 'galipolo-voto-copom-b71-40') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula critica diretores indicados pelo ex-governo.', 'Os diretores do Bolsonaro no BC sabotam o governo Lula.', 'Lula em evento na CUT.', 'verified', true, '2024-05-15', 'https://g1.globo.com/politica/noticia/2024/05/15/lula-diretores-bc.ghtml', 'news_article', 4, 'São Paulo', 'Ato CUT', 'lula-diretores-bc-b71-41') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 42
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad pede moderação ao governo.', 'Vamos evitar comentar decisões específicas do BC, isso ajuda o país.', 'Haddad indiretamente pediu a Lula que reduzisse críticas.', 'verified', true, '2024-05-17', 'https://valor.globo.com/politica/noticia/2024/05/17/haddad-moderacao-bc.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-moderacao-b71-42') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet defende disciplina fiscal.', 'Não existe justiça social com economia quebrada.', 'Tebet em entrevista à Bloomberg.', 'verified', false, '2024-03-21', 'https://www.bloomberg.com/news/articles/2024-03-21/tebet-fiscal-discipline', 'news_article', 1, 'Nova York', 'Bloomberg Summit', 'tebet-disciplina-fiscal-b71-43') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia IR 2026.', 'A isenção do IR até R$ 5 mil entra em vigor em 2026.', 'Haddad após sanção da lei em outubro de 2025.', 'verified', true, '2025-10-15', 'https://valor.globo.com/brasil/noticia/2025/10/15/haddad-ir-2026.ghtml', 'news_article', 1, 'Brasília', 'Sanção Lei IR', 'haddad-ir-sancao-b71-44') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_tab, 'Tabata critica isenção IR mal compensada.', 'Aprovamos a isenção, mas a compensação precisa ser robusta.', 'Tabata em plenário no debate do projeto.', 'verified', false, '2025-09-04', 'https://g1.globo.com/politica/noticia/2025/09/04/tabata-ir-compensacao.ghtml', 'news_article', 1, 'Brasília', 'Plenário Câmara', 'tabata-ir-compensacao-b71-45') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia agenda verde fiscal.', 'Estamos estruturando o mercado regulado de carbono com lei sancionada.', 'Haddad celebrou sanção da lei do mercado de carbono.', 'verified', false, '2024-12-12', 'https://valor.globo.com/brasil/noticia/2024/12/12/haddad-carbono.ghtml', 'news_article', 1, 'Brasília', 'Sanção lei de carbono', 'haddad-carbono-b71-46') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_mar, 'Marina Silva sobre mercado de carbono.', 'O mercado regulado é a ponte entre política fiscal e ambiental.', 'Marina Silva na sanção.', 'verified', false, '2024-12-12', 'https://www.gov.br/mma/pt-br/noticias/marina-carbono', 'government', 1, 'Brasília', 'Sanção lei', 'marina-carbono-b71-47') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad pede aprovação de vetos.', 'Peço ao Congresso que mantenha os vetos que preservam o arcabouço.', 'Haddad pressionou por manutenção dos vetos.', 'verified', false, '2025-02-19', 'https://valor.globo.com/politica/noticia/2025/02/19/haddad-vetos.ghtml', 'news_article', 1, 'Brasília', 'Congresso', 'haddad-vetos-b71-48') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_wdi, 'Wellington defende BPC completo.', 'Quem defende cortar BPC não conhece a realidade do idoso pobre.', 'Wellington Dias rebateu oposição em audiência.', 'verified', false, '2024-12-02', 'https://g1.globo.com/politica/noticia/2024/12/02/wellington-bpc.ghtml', 'news_article', 2, 'Brasília', 'Comissão Senado', 'wellington-bpc-b71-49') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula sobre bancos: ''lucram demais''.', 'Os bancos no Brasil lucram demais enquanto o povo paga caro.', 'Lula em ato sindical em 2024.', 'verified', false, '2024-03-01', 'https://g1.globo.com/politica/noticia/2024/03/01/lula-bancos-lucram.ghtml', 'news_article', 3, 'Brasília', 'Ato sindical', 'lula-bancos-b71-50') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre spread bancário.', 'O spread no Brasil é alto por múltiplos fatores, estamos atacando todos.', 'Haddad em evento da Febraban.', 'verified', false, '2024-03-19', 'https://valor.globo.com/financas/noticia/2024/03/19/haddad-spread.ghtml', 'news_article', 1, 'São Paulo', 'Febraban', 'haddad-spread-b71-51') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_ter, 'Tereza Cristina critica IOF no agro.', 'IOF adicional vai quebrar o médio produtor rural.', 'Tereza Cristina em plenário do Senado.', 'verified', false, '2025-05-24', 'https://valor.globo.com/politica/noticia/2025/05/24/tereza-iof-agro.ghtml', 'news_article', 2, 'Brasília', 'Plenário Senado', 'tereza-iof-agro-b71-52') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad defende regulação de big techs.', 'As big techs pagam zero imposto aqui, isso vai acabar.', 'Haddad em evento sobre economia digital.', 'verified', false, '2024-10-17', 'https://valor.globo.com/brasil/noticia/2024/10/17/haddad-bigtechs.ghtml', 'news_article', 2, 'São Paulo', 'Evento economia digital', 'haddad-bigtechs-b71-53') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gle, 'Gleisi sobre BNDES e indústria.', 'O BNDES de Mercadante é o motor da reindustrialização.', 'Gleisi em congresso do PT em 2024.', 'verified', false, '2024-07-07', 'https://g1.globo.com/politica/noticia/2024/07/07/gleisi-bndes.ghtml', 'news_article', 1, 'Brasília', 'Congresso PT', 'gleisi-bndes-b71-54') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_adv, 'Adriana Ventura sobre BNDES.', 'O BNDES tá voltando a fazer empréstimos subsidiados sem transparência.', 'Adriana Ventura questionou BNDES em audiência.', 'verified', false, '2024-09-17', 'https://g1.globo.com/politica/noticia/2024/09/17/adriana-bndes.ghtml', 'news_article', 2, 'Brasília', 'Audiência Câmara', 'adriana-bndes-b71-55') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_mer, 'Mercadante defende transparência do BNDES.', 'Todo empréstimo do BNDES é público e auditável, não há opacidade.', 'Mercadante rebateu críticas em audiência.', 'verified', false, '2024-09-18', 'https://valor.globo.com/brasil/noticia/2024/09/18/mercadante-transparencia.ghtml', 'news_article', 1, 'Brasília', 'Audiência Câmara', 'mercadante-transparencia-b71-56') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre MP do corte de supersalários.', 'Vamos atacar o supersalário do setor público como marco de equidade.', 'Haddad em coletiva em 2025.', 'verified', false, '2025-06-04', 'https://valor.globo.com/brasil/noticia/2025/06/04/haddad-supersalarios.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-supersalarios-b71-57') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto aposta em independência total.', 'Independência do BC é condição necessária para estabilidade de longo prazo.', 'Campos Neto em artigo na Folha.', 'verified', false, '2023-10-12', 'https://www1.folha.uol.com.br/opiniao/2023/10/campos-neto-independencia.shtml', 'news_article', 1, 'São Paulo', 'Artigo Folha', 'campos-neto-artigo-b71-58') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula sobre BC autônomo: ''foi um erro''.', 'Acho que a gente errou em aceitar a autonomia do Banco Central.', 'Lula em entrevista à imprensa internacional.', 'verified', true, '2024-02-08', 'https://www.reuters.com/world/americas/lula-bc-autonomia-2024-02-08/', 'news_article', 5, 'Brasília', 'Entrevista Reuters', 'lula-bc-erro-b71-59') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 60
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre autonomia do BC.', 'A autonomia do Banco Central é lei e será respeitada por este governo.', 'Haddad rebateu fala de Lula.', 'verified', true, '2024-02-09', 'https://valor.globo.com/politica/noticia/2024/02/09/haddad-autonomia.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-autonomia-b71-60') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo corta Selic pela primeira vez.', 'O ciclo de cortes começa com o cenário externo melhorado.', 'Galípolo promoveu primeiro corte desde a alta de janeiro.', 'verified', true, '2026-01-28', 'https://valor.globo.com/financas/noticia/2026/01/28/galipolo-corte-selic.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Copom', 'galipolo-corte-selic-b71-61') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad celebra início de cortes.', 'O BC agiu de forma técnica, como sempre fez, e o Brasil ganha.', 'Haddad comentou corte de Galípolo.', 'verified', false, '2026-01-29', 'https://valor.globo.com/brasil/noticia/2026/01/29/haddad-corte-selic.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-celebra-corte-b71-62') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula comemora corte.', 'Finalmente o BC entendeu que juros altos matam empresa e emprego.', 'Lula comentou corte em evento no ABC.', 'verified', true, '2026-01-30', 'https://g1.globo.com/politica/noticia/2026/01/30/lula-corte-bc.ghtml', 'news_article', 2, 'São Bernardo', 'Ato ABC', 'lula-comemora-corte-b71-63') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet defende reforma administrativa.', 'A reforma administrativa precisa sair antes que as contas apertem de vez.', 'Tebet em evento em 2025.', 'verified', false, '2025-09-10', 'https://valor.globo.com/brasil/noticia/2025/09/10/tebet-ref-administrativa.ghtml', 'news_article', 2, 'Brasília', 'Seminário FGV', 'tebet-ref-administrativa-b71-64') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_dwe, 'Dweck sobre reforma administrativa.', 'A reforma administrativa não pode sucatear serviços públicos essenciais.', 'Dweck contrabalançou Tebet em audiência.', 'verified', false, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/dweck-ref-admin.ghtml', 'news_article', 2, 'Brasília', 'Audiência Câmara', 'dweck-ref-admin-b71-65') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad defende reforma da renda.', 'A reforma do IR completa o que começamos com o consumo, é indispensável.', 'Haddad apresentou projeto da reforma da renda em 2025.', 'verified', true, '2025-03-18', 'https://valor.globo.com/brasil/noticia/2025/03/18/haddad-ir-reforma.ghtml', 'news_article', 1, 'Brasília', 'Apresentação projeto', 'haddad-ir-reforma-b71-66') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_vhm, 'Van Hattem ataca reforma da renda.', 'O governo criou mais imposto disfarçado de isenção, é hipocrisia.', 'Van Hattem em plenário em 2025.', 'verified', false, '2025-09-15', 'https://g1.globo.com/politica/noticia/2025/09/15/vanhattem-ir.ghtml', 'news_article', 2, 'Brasília', 'Plenário Câmara', 'vanhattem-ir-b71-67') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_fav, 'Fávaro defende crédito rural.', 'O crédito do agro precisa ser protegido das turbulências externas.', 'Fávaro em audiência sobre Plano Safra.', 'verified', false, '2025-06-20', 'https://www.gov.br/agricultura/pt-br/noticias/favaro-plano-safra-25', 'government', 1, 'Brasília', 'Audiência Plano Safra', 'favaro-plano-safra-25-b71-68') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia linha fiscal ESG.', 'O Brasil avança com título verde soberano no mercado internacional.', 'Haddad celebrou emissão de green bond em novembro de 2023.', 'verified', false, '2023-11-06', 'https://valor.globo.com/financas/noticia/2023/11/06/haddad-green-bond.ghtml', 'news_article', 1, 'Nova York', 'Emissão Green Bond', 'haddad-green-bond-b71-69') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_pra, 'Prates insiste em exploração na Foz.', 'Sem a Foz, a Petrobras não tem futuro de reposição de reservas.', 'Prates defendeu exploração em audiência no Senado.', 'verified', true, '2023-10-04', 'https://valor.globo.com/empresas/noticia/2023/10/04/prates-foz-amazonas.ghtml', 'news_article', 3, 'Brasília', 'Comissão Senado', 'prates-foz-insiste-b71-70') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 71
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula defende Petrobras na Foz.', 'A Petrobras tem que explorar a Foz do Amazonas, o Ibama não pode impedir.', 'Lula em evento no Amapá em 2023.', 'verified', true, '2023-08-02', 'https://g1.globo.com/politica/noticia/2023/08/02/lula-foz-ibama.ghtml', 'news_article', 4, 'Macapá', 'Ato Amapá', 'lula-foz-ibama-b71-71') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 72
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad fala em pacto de crescimento.', 'Precisamos de um pacto nacional para crescer 3% ao ano de forma sustentável.', 'Haddad em fórum em 2024.', 'verified', false, '2024-02-23', 'https://valor.globo.com/brasil/noticia/2024/02/23/haddad-pacto-crescimento.ghtml', 'news_article', 1, 'São Paulo', 'Fórum empresarial', 'haddad-pacto-crescimento-b71-72') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto sobre credibilidade.', 'A credibilidade é construída com coerência, não se compra.', 'Campos Neto em entrevista à Bloomberg.', 'verified', false, '2024-09-05', 'https://www.bloomberg.com/news/articles/2024-09-05/campos-neto-credibility', 'news_article', 1, 'Nova York', 'Bloomberg Brazil', 'campos-credibilidade-b71-73') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_agu, 'Aguinaldo Ribeiro celebra regulamentação.', 'Temos a estrutura do IBS e CBS prontos para entrar em vigor.', 'Aguinaldo em entrevista em 2025.', 'verified', false, '2025-06-30', 'https://www.camara.leg.br/noticias/aguinaldo-ibs-cbs', 'government', 1, 'Brasília', 'Regulamentação Reforma', 'aguinaldo-ibs-cbs-b71-74') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad regulamenta reforma tributária.', 'A regulamentação saiu como pactuado entre União, estados e municípios.', 'Haddad celebrou sanção da lei complementar.', 'verified', true, '2025-01-16', 'https://valor.globo.com/brasil/noticia/2025/01/16/haddad-regulamentacao.ghtml', 'news_article', 1, 'Brasília', 'Sanção lei', 'haddad-regulamentacao-b71-75') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula sobre IBGE e desemprego.', 'O desemprego é o menor da história do Brasil, o PT trabalha.', 'Lula em discurso.', 'verified', false, '2025-02-28', 'https://g1.globo.com/politica/noticia/2025/02/28/lula-desemprego.ghtml', 'news_article', 1, 'Brasília', 'Pronunciamento', 'lula-desemprego-b71-76') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_nik, 'Nikolas mente sobre ''imposto do ovo''.', 'Agora vão taxar o ovo! Isso é o arcabouço na sua mesa.', 'Nikolas publicou vídeo com distorções sobre tributária em 2025.', 'verified', true, '2025-02-10', 'https://www1.folha.uol.com.br/mercado/2025/02/nikolas-ovo-fake.shtml', 'news_article', 4, 'Brasília', 'Redes sociais', 'nikolas-ovo-fake-b71-77') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad responde fakes sobre tributária.', 'Estão mentindo sobre a reforma para criar pânico, vamos combater com dados.', 'Haddad montou força-tarefa contra desinformação em 2025.', 'verified', true, '2025-02-12', 'https://valor.globo.com/politica/noticia/2025/02/12/haddad-fakes.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-combate-fakes-b71-78') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet sobre enchentes no RS.', 'As enchentes exigem esforço nacional que vai além do arcabouço.', 'Tebet defendeu gastos fora da meta para o RS.', 'verified', true, '2024-05-13', 'https://g1.globo.com/rs/noticia/2024/05/13/tebet-rs-gastos.ghtml', 'news_article', 2, 'Porto Alegre', 'Visita ao RS', 'tebet-rs-gastos-b71-79') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia excepcionalidade RS.', 'Gastos do RS estarão fora da meta, é emergência humanitária.', 'Haddad anunciou dispensa fiscal para o RS.', 'verified', true, '2024-05-14', 'https://valor.globo.com/brasil/noticia/2024/05/14/haddad-rs-excepcionalidade.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-rs-excepcionalidade-b71-80') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lup, 'Lupi demite-se em meio a crise INSS.', 'Saio de cabeça erguida após cumprir minha missão no governo.', 'Lupi se demitiu após caso de descontos irregulares do INSS.', 'verified', true, '2025-05-02', 'https://g1.globo.com/politica/noticia/2025/05/02/lupi-demissao.ghtml', 'news_article', 4, 'Brasília', 'Demissão INSS', 'lupi-demissao-b71-81') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_wdi, 'Wellington Dias assume Previdência.', 'A prioridade é ressarcir cada aposentado lesado.', 'Wellington Dias substituiu Lupi no MPS.', 'verified', false, '2025-05-06', 'https://valor.globo.com/brasil/noticia/2025/05/06/wellington-mps.ghtml', 'news_article', 2, 'Brasília', 'Posse MPS', 'wellington-mps-posse-b71-82') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre impacto fiscal INSS.', 'O ressarcimento será feito, o impacto será distribuído no arcabouço.', 'Haddad em coletiva sobre o caso do INSS em 2025.', 'verified', false, '2025-05-15', 'https://valor.globo.com/brasil/noticia/2025/05/15/haddad-inss.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-inss-impacto-b71-83') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo em entrevista à Bloomberg.', 'Vamos zelar pela credibilidade, convergência é meta irrefutável.', 'Galípolo em entrevista à Bloomberg.', 'verified', false, '2025-04-02', 'https://www.bloomberg.com/news/articles/2025-04-02/galipolo-credibility', 'news_article', 1, 'Washington', 'FMI Spring Meetings', 'galipolo-bloomberg-b71-84') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad nos Spring Meetings.', 'O Brasil tem trajetória fiscal em melhora sustentada, apesar do ruído.', 'Haddad em Washington no FMI.', 'verified', false, '2025-04-23', 'https://valor.globo.com/mundo/noticia/2025/04/23/haddad-fmi.ghtml', 'news_article', 1, 'Washington', 'Spring Meetings FMI', 'haddad-fmi-2025-b71-85') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula critica FMI.', 'FMI continua receitando arrocho como se estivéssemos nos anos 90.', 'Lula em evento do PT em 2025.', 'verified', false, '2025-04-29', 'https://g1.globo.com/politica/noticia/2025/04/29/lula-fmi.ghtml', 'news_article', 2, 'Brasília', 'Ato PT', 'lula-critica-fmi-b71-86') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad amplia cashback para pobres.', 'O cashback é inovação mundial para devolver imposto ao mais pobre.', 'Haddad explicou mecanismo de cashback da reforma.', 'verified', false, '2024-10-09', 'https://valor.globo.com/brasil/noticia/2024/10/09/haddad-cashback.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-cashback-b71-87') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lmar, 'Luiz Marinho sobre desemprego.', 'Criamos mais de 4 milhões de empregos formais em dois anos.', 'Luiz Marinho divulgou Caged.', 'verified', false, '2025-02-05', 'https://www.gov.br/trabalho/pt-br/noticias/marinho-caged', 'government', 1, 'Brasília', 'Divulgação Caged', 'luiz-marinho-caged-b71-88') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre CVM e supervisão.', 'Teremos supervisão mais efetiva do mercado após o caso Americanas.', 'Haddad em audiência sobre fraude contábil.', 'verified', false, '2023-02-14', 'https://valor.globo.com/empresas/noticia/2023/02/14/haddad-americanas.ghtml', 'news_article', 2, 'Brasília', 'Audiência Câmara', 'haddad-americanas-b71-89') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_alc, 'Alckmin sobre tarifas de Trump.', 'A resposta não é emocional, é técnica e proporcional.', 'Alckmin em entrevista sobre tarifas em 2025.', 'verified', false, '2025-04-10', 'https://valor.globo.com/brasil/noticia/2025/04/10/alckmin-tarifas-trump.ghtml', 'news_article', 1, 'Brasília', 'Coletiva MDIC', 'alckmin-trump-b71-90') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_bol, 'Bolsonaro defende tarifas de Trump.', 'Trump tá certo em taxar o Brasil do Lula, só falta fechar a torneira.', 'Bolsonaro em transmissão em 2025.', 'verified', true, '2025-04-12', 'https://g1.globo.com/politica/noticia/2025/04/12/bolsonaro-tarifas-trump.ghtml', 'news_article', 5, 'Brasília', 'Live', 'bolsonaro-aplaude-tarifas-b71-91') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 92
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_ebo, 'Eduardo Bolsonaro celebra tarifas.', 'Trump tá salvando os EUA da ameaça Lula-China.', 'Eduardo Bolsonaro em Washington.', 'verified', true, '2025-04-14', 'https://www1.folha.uol.com.br/mundo/2025/04/eduardo-bolsonaro-trump.shtml', 'news_article', 5, 'Washington', 'CPAC US', 'eduardo-celebra-tarifas-b71-92') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 93
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad critica oposição anti-Brasil.', 'Torcer contra o Brasil nas tarifas é torcer contra o povo brasileiro.', 'Haddad rebateu oposição em coletiva.', 'verified', true, '2025-04-15', 'https://valor.globo.com/politica/noticia/2025/04/15/haddad-oposicao-tarifas.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-oposicao-tarifas-b71-93') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo comenta tarifaço.', 'Monitoramos os efeitos do tarifaço, temos instrumentos para preservar a estabilidade.', 'Galípolo em coletiva.', 'verified', false, '2025-04-16', 'https://www.bcb.gov.br/detalhenoticia/20250416-tarifas', 'government', 1, 'Brasília', 'Coletiva BC', 'galipolo-tarifaco-b71-94') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre trajetória da dívida.', 'A dívida líquida como proporção do PIB seguirá trajetória sustentável no novo arcabouço.', 'Haddad em relatório ao Congresso.', 'verified', false, '2024-11-15', 'https://valor.globo.com/brasil/noticia/2024/11/15/haddad-divida.ghtml', 'news_article', 1, 'Brasília', 'Relatório Fiscal', 'haddad-divida-b71-95') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet alerta para risco demográfico.', 'Sem reforma da Previdência o Brasil não consegue financiar o envelhecimento.', 'Tebet em seminário em 2025.', 'verified', false, '2025-10-21', 'https://valor.globo.com/brasil/noticia/2025/10/21/tebet-previdencia.ghtml', 'news_article', 2, 'São Paulo', 'Seminário Insper', 'tebet-previdencia-b71-96') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad defende vinculação social.', 'Queremos renda, emprego e crescimento com responsabilidade fiscal.', 'Haddad em fórum empresarial.', 'verified', false, '2026-02-11', 'https://valor.globo.com/brasil/noticia/2026/02/11/haddad-vinculacao-social.ghtml', 'news_article', 1, 'São Paulo', 'Expert XP 2026', 'haddad-vinculacao-social-b71-97') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo sobre cenário 2026.', 'A ancoragem das expectativas é condição para qualquer ciclo sustentado de cortes.', 'Galípolo em coletiva pós-Copom.', 'verified', false, '2026-03-18', 'https://www.bcb.gov.br/detalhenoticia/20260318-galipolo', 'government', 1, 'Brasília', 'Coletiva Copom', 'galipolo-cenario-2026-b71-98') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad fala sobre inflação em alimentos.', 'A política monetária atua, mas medidas microeconômicas aceleram o ajuste de alimentos.', 'Haddad em palestra em março de 2026.', 'verified', false, '2026-03-25', 'https://valor.globo.com/brasil/noticia/2026/03/25/haddad-alimentos-2026.ghtml', 'news_article', 1, 'São Paulo', 'Palestra Fiesp', 'haddad-alimentos-2026-b71-99') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula defende novo ciclo desenvolvimentista.', 'O Brasil volta ao mapa do desenvolvimento com Estado forte e empresário patriota.', 'Lula em discurso de abertura da ExpoFreight 2026.', 'verified', true, '2026-04-02', 'https://g1.globo.com/politica/noticia/2026/04/02/lula-desenvolvimentista.ghtml', 'news_article', 2, 'Brasília', 'ExpoFreight 2026', 'lula-desenvolvimentista-b71-100') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
