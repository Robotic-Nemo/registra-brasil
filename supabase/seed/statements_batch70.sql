-- statements_batch70.sql
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
    VALUES (v_had, 'Haddad critica juros altos do BC.', 'A taxa de juros atual é completamente incompatível com o ritmo de queda da inflação.', 'Haddad pressionou publicamente o Copom por cortes mais rápidos no primeiro semestre de 2023.', 'verified', true, '2023-05-10', 'https://valor.globo.com/politica/noticia/2023/05/10/haddad-critica-juros-do-bc.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Ministério da Fazenda', 'haddad-critica-juros-copom-b70-1') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto defende autonomia do BC.', 'O Banco Central não pode ceder a pressões políticas de curto prazo sob risco de desancorar expectativas.', 'Campos Neto respondeu a pressões do governo após reunião do Copom manter Selic em 13,75%.', 'verified', true, '2023-05-03', 'https://www1.folha.uol.com.br/mercado/2023/05/campos-neto-defende-autonomia-bc.shtml', 'news_article', 2, 'São Paulo', 'Seminário XP', 'campos-neto-autonomia-bc-b70-2') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula chama Campos Neto de adversário.', 'Esse cidadão que está lá no Banco Central não tem compromisso com o Brasil.', 'Lula intensificou críticas pessoais ao presidente do BC durante evento do PT.', 'verified', true, '2023-02-02', 'https://g1.globo.com/politica/noticia/2023/02/02/lula-ataca-campos-neto.ghtml', 'news_article', 4, 'Brasília', 'Reunião do PT', 'lula-ataca-campos-neto-b70-3') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 4
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet apresenta PPA 2024-2027.', 'O novo Plano Plurianual coloca o combate à desigualdade no centro da estratégia de desenvolvimento.', 'Tebet entregou PPA ao Congresso priorizando redução da pobreza.', 'verified', false, '2023-08-31', 'https://www.gov.br/planejamento/pt-br/assuntos/noticias/2023/agosto/tebet-entrega-ppa', 'government', 1, 'Brasília', 'Entrega do PPA', 'tebet-ppa-2024-b70-4') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad defende arcabouço fiscal.', 'O novo arcabouço é a âncora fiscal que substitui o teto de gastos sem abrir mão da responsabilidade.', 'Haddad apresentou o novo arcabouço fiscal à imprensa em março de 2023.', 'verified', true, '2023-03-30', 'https://valor.globo.com/politica/noticia/2023/03/30/haddad-apresenta-arcabouco-fiscal.ghtml', 'news_article', 2, 'Brasília', 'Apresentação do Arcabouço', 'haddad-arcabouco-apresentacao-b70-5') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo sinaliza continuidade no BC.', 'Seguirei o mandato legal do Banco Central com foco em convergência da inflação à meta.', 'Galípolo foi sabatinado no Senado para assumir diretoria do BC.', 'verified', false, '2023-07-12', 'https://www.bcb.gov.br/detalhenoticia/20230712-galipolo', 'government', 1, 'Brasília', 'Sabatina Senado', 'galipolo-sabatina-b70-6') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_dwe, 'Dweck anuncia reestruturação de carreiras.', 'A valorização do serviço público é parte essencial da reconstrução do Estado.', 'Dweck anunciou acordo salarial com servidores federais.', 'verified', false, '2023-05-20', 'https://www.gov.br/gestao/pt-br/assuntos/noticias/2023/maio/dweck-servidores', 'government', 1, 'Brasília', 'Acordo servidores', 'dweck-servidores-acordo-b70-7') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_pra, 'Prates defende política de preços da Petrobras.', 'A nova política de preços protege o consumidor brasileiro da volatilidade internacional.', 'Prates anunciou mudança na política de paridade de importação.', 'verified', true, '2023-05-16', 'https://www1.folha.uol.com.br/mercado/2023/05/prates-politica-precos.shtml', 'news_article', 3, 'Rio de Janeiro', 'Coletiva Petrobras', 'prates-politica-precos-b70-8') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula critica taxa de juros em entrevista.', 'A taxa de juros está elevada porque o Campos Neto quer prejudicar o governo.', 'Lula repetiu ataques ao presidente do BC em entrevista à rádio.', 'verified', true, '2023-04-13', 'https://g1.globo.com/politica/noticia/2023/04/13/lula-juros-campos-neto.ghtml', 'news_article', 4, 'Brasília', 'Entrevista rádio', 'lula-juros-ataque-b70-9') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 10
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia taxação de fundos offshore.', 'Fundos no exterior de super-ricos não podem mais pagar menos imposto que um trabalhador.', 'Haddad enviou MP taxando offshore e fundos exclusivos.', 'verified', true, '2023-08-28', 'https://valor.globo.com/brasil/noticia/2023/08/28/haddad-offshore-taxacao.ghtml', 'news_article', 2, 'Brasília', 'Anúncio MP', 'haddad-offshore-mp-b70-10') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gle, 'Gleisi ataca política de juros.', 'O BC autônomo virou um poder paralelo que sabota o crescimento do Brasil.', 'Gleisi, então presidente do PT, pressionou BC em evento partidário.', 'verified', true, '2023-03-22', 'https://g1.globo.com/politica/noticia/2023/03/22/gleisi-bc-poder-paralelo.ghtml', 'news_article', 4, 'Brasília', 'Direção PT', 'gleisi-bc-paralelo-b70-11') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 12
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto alerta sobre arcabouço.', 'O arcabouço fiscal tem fragilidades e depende de receitas extraordinárias para funcionar.', 'Campos Neto fez crítica técnica ao arcabouço em evento no Rio.', 'verified', false, '2023-06-14', 'https://valor.globo.com/financas/noticia/2023/06/14/campos-neto-arcabouco-fragil.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Seminário Febraban', 'campos-neto-arcabouco-critica-b70-12') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet pede parcimônia nas críticas ao BC.', 'Atacar o presidente do Banco Central não ajuda a derrubar juros, só desorganiza o mercado.', 'Tebet divergiu publicamente de Lula sobre ataques a Campos Neto.', 'verified', true, '2023-02-09', 'https://www1.folha.uol.com.br/mercado/2023/02/tebet-bc-criticas.shtml', 'news_article', 2, 'Brasília', 'Coletiva Planejamento', 'tebet-pede-parcimonia-b70-13') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia meta de déficit zero.', 'Vamos zerar o déficit primário em 2024 sem abrir mão de investimentos sociais.', 'Haddad reafirmou meta fiscal ambiciosa no PLDO.', 'verified', true, '2023-04-14', 'https://valor.globo.com/brasil/noticia/2023/04/14/haddad-meta-deficit-zero.ghtml', 'news_article', 3, 'Brasília', 'Envio PLDO', 'haddad-deficit-zero-b70-14') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula afirma que meta fiscal não é obsessão.', 'Não vou sacrificar o povo pobre para cumprir meta fiscal.', 'Lula contrariou Haddad e defendeu revisão da meta de déficit zero.', 'verified', true, '2023-10-27', 'https://g1.globo.com/politica/noticia/2023/10/27/lula-meta-fiscal-obsessao.ghtml', 'news_article', 4, 'Brasília', 'Café com jornalistas', 'lula-meta-fiscal-obsessao-b70-15') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad rebate dúvida de Lula sobre meta.', 'A meta está mantida e seguirá sendo perseguida com responsabilidade.', 'Haddad reafirmou compromisso com déficit zero após declarações de Lula.', 'verified', true, '2023-10-28', 'https://valor.globo.com/politica/noticia/2023/10/28/haddad-rebate-lula-meta.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Fazenda', 'haddad-rebate-lula-meta-b70-16') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_pra, 'Prates diz que demissão foi decisão política.', 'Minha saída da Petrobras foi estritamente política, não teve causa técnica.', 'Prates foi demitido da presidência da Petrobras em maio de 2024.', 'verified', true, '2024-05-15', 'https://valor.globo.com/empresas/noticia/2024/05/15/prates-demissao-politica.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista pós-demissão', 'prates-demissao-politica-b70-17') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 18
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_cha, 'Chambriard assume Petrobras.', 'Assumo com compromisso de manter a Petrobras como motor do desenvolvimento brasileiro.', 'Chambriard foi indicada presidente da Petrobras em maio de 2024.', 'verified', true, '2024-05-24', 'https://g1.globo.com/economia/noticia/2024/05/24/chambriard-petrobras.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Posse Petrobras', 'chambriard-posse-petrobras-b70-18') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_mer, 'Mercadante defende papel do BNDES.', 'O BNDES voltou a financiar o desenvolvimento produtivo que o país precisa.', 'Mercadante apresentou balanço do BNDES na Nova Indústria Brasil.', 'verified', false, '2024-01-22', 'https://www.bndes.gov.br/noticias/mercadante-nova-industria', 'government', 1, 'Brasília', 'Nova Indústria Brasil', 'mercadante-bndes-balanco-b70-19') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gue, 'Guedes ataca novo arcabouço.', 'O arcabouço do Haddad é uma licença para gastar sem controle, vai rachar a economia.', 'Ex-ministro Guedes atacou arcabouço em evento empresarial.', 'verified', false, '2023-06-05', 'https://www1.folha.uol.com.br/mercado/2023/06/guedes-arcabouco-critica.shtml', 'news_article', 3, 'São Paulo', 'Evento do mercado financeiro', 'guedes-arcabouco-ataque-b70-20') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre reforma tributária.', 'A reforma tributária do consumo é a mudança estrutural mais importante dos últimos 30 anos.', 'Haddad celebrou aprovação da PEC da reforma tributária.', 'verified', true, '2023-12-15', 'https://valor.globo.com/brasil/noticia/2023/12/15/haddad-reforma-tributaria-aprovada.ghtml', 'news_article', 1, 'Brasília', 'Pós-aprovação PEC', 'haddad-reforma-aprovada-b70-21') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_agu, 'Aguinaldo Ribeiro defende reforma tributária.', 'Entregamos um novo sistema tributário que vai simplificar a vida do produtor e do consumidor.', 'Aguinaldo, relator da PEC 45, discursou antes da aprovação.', 'verified', false, '2023-07-07', 'https://www.camara.leg.br/noticias/reforma-tributaria-aguinaldo', 'government', 1, 'Brasília', 'Aprovação Câmara', 'aguinaldo-reforma-camara-b70-22') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_vhm, 'Van Hattem critica reforma tributária.', 'A reforma tributária do PT é um cavalo de Troia que vai aumentar a carga sobre o trabalhador.', 'Van Hattem votou contra e criticou a PEC em plenário.', 'verified', false, '2023-07-06', 'https://g1.globo.com/politica/noticia/2023/07/06/van-hattem-reforma.ghtml', 'news_article', 3, 'Brasília', 'Plenário Câmara', 'vanhattem-reforma-critica-b70-23') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_nik, 'Nikolas espalha desinformação sobre reforma.', 'Com a reforma vocês vão pagar imposto até para ir ao médico, até para comprar pão.', 'Nikolas publicou vídeo com alegações falsas sobre reforma tributária.', 'verified', true, '2023-07-05', 'https://www1.folha.uol.com.br/mercado/2023/07/nikolas-reforma-fake.shtml', 'news_article', 4, 'Brasília', 'Vídeo redes sociais', 'nikolas-reforma-fake-b70-24') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_tab, 'Tabata defende reforma tributária.', 'É a maior chance em uma geração de desburocratizar o país e combater privilégios.', 'Tabata Amaral votou a favor da reforma na Câmara.', 'verified', false, '2023-07-07', 'https://g1.globo.com/politica/noticia/2023/07/07/tabata-reforma.ghtml', 'news_article', 1, 'Brasília', 'Plenário Câmara', 'tabata-reforma-favor-b70-25') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia taxação de super-ricos.', 'Super-ricos e multinacionais pagarão sua parte justa no Brasil, como defendemos no G20.', 'Haddad anunciou tributação mínima global no G20 do Brasil.', 'verified', true, '2024-02-29', 'https://valor.globo.com/brasil/noticia/2024/02/29/haddad-g20-superricos.ghtml', 'news_article', 2, 'São Paulo', 'G20 Finanças', 'haddad-g20-superricos-b70-26') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobe IOF e recua em 24h.', 'Foi um erro de comunicação, o IOF será corrigido já.', 'Haddad recuou de aumento do IOF após reação do mercado em maio de 2025.', 'verified', true, '2025-05-23', 'https://valor.globo.com/brasil/noticia/2025/05/23/haddad-iof-recuo.ghtml', 'news_article', 4, 'Brasília', 'Coletiva emergencial', 'haddad-iof-recuo-b70-27') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo assume presidência do BC.', 'Minha bússola será a meta de inflação e a estabilidade macroeconômica.', 'Galípolo assumiu presidência do BC em janeiro de 2025.', 'verified', true, '2025-01-02', 'https://www.bcb.gov.br/detalhenoticia/20250102-galipolo-posse', 'government', 1, 'Brasília', 'Posse BC', 'galipolo-posse-bc-b70-28') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto diz que BC cumpriu dever.', 'Deixamos o BC com inflação sob controle e credibilidade restaurada.', 'Campos Neto em discurso de despedida do cargo em dezembro de 2024.', 'verified', false, '2024-12-19', 'https://www1.folha.uol.com.br/mercado/2024/12/campos-neto-despedida.shtml', 'news_article', 1, 'Brasília', 'Despedida BC', 'campos-neto-despedida-b70-29') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula volta a atacar juros sob Galípolo.', 'Mesmo com Galípolo no BC, os juros continuam altos demais, é um absurdo.', 'Lula criticou publicamente a Selic em evento sindical.', 'verified', true, '2025-03-19', 'https://g1.globo.com/politica/noticia/2025/03/19/lula-juros-galipolo.ghtml', 'news_article', 4, 'São Paulo', 'Ato CUT', 'lula-juros-galipolo-b70-30') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 31
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_bol, 'Bolsonaro critica arcabouço.', 'Arcabouço é o nome bonito de gastança descontrolada.', 'Bolsonaro atacou política fiscal de Haddad em transmissão.', 'verified', false, '2023-05-18', 'https://g1.globo.com/politica/noticia/2023/05/18/bolsonaro-arcabouco.ghtml', 'news_article', 3, 'Brasília', 'Live', 'bolsonaro-arcabouco-b70-31') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet diz que corte de gastos é inevitável.', 'Não há saída sem revisar despesas obrigatórias, isso é matemática.', 'Tebet defendeu pacote de corte de gastos em novembro de 2024.', 'verified', true, '2024-11-27', 'https://valor.globo.com/brasil/noticia/2024/11/27/tebet-corte-gastos.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Planejamento', 'tebet-corte-gastos-b70-32') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia pacote fiscal de fim de ano.', 'As medidas garantem cumprimento do arcabouço por dois anos à frente.', 'Haddad apresentou pacote de R$ 70 bi em cortes.', 'verified', true, '2024-11-27', 'https://valor.globo.com/brasil/noticia/2024/11/27/haddad-pacote-fiscal.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Fazenda', 'haddad-pacote-fiscal-b70-33') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula anuncia isenção IR até R$ 5 mil no pacote.', 'Ninguém vai falar do pacote, todo mundo vai falar da isenção do imposto.', 'Lula misturou anúncio do pacote fiscal com isenção do IR, gerando ruído.', 'verified', true, '2024-11-27', 'https://g1.globo.com/economia/noticia/2024/11/27/lula-ir-5-mil.ghtml', 'news_article', 4, 'Brasília', 'Pronunciamento', 'lula-ir-cincomil-b70-34') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad defende isenção IR até R$ 5 mil.', 'A isenção é compensada pela tributação de super-ricos, é fiscalmente neutro.', 'Haddad defendeu projeto em sabatina parlamentar.', 'verified', true, '2025-03-18', 'https://valor.globo.com/brasil/noticia/2025/03/18/haddad-ir-compensacao.ghtml', 'news_article', 2, 'Brasília', 'Sabatina Câmara', 'haddad-ir-compensacao-b70-35') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_sil, 'Silveira defende revisão do setor elétrico.', 'Precisamos modernizar o marco setorial sem pressionar a tarifa do consumidor.', 'Silveira tratou de reforma elétrica em audiência pública.', 'verified', false, '2023-09-21', 'https://www.gov.br/mme/pt-br/assuntos/noticias/silveira-modernizacao', 'government', 1, 'Brasília', 'Audiência pública MME', 'silveira-modernizacao-b70-36') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_fav, 'Fávaro defende Plano Safra recorde.', 'O agro brasileiro tem o maior Plano Safra da história para produzir mais e melhor.', 'Fávaro apresentou Plano Safra 2023/24.', 'verified', false, '2023-06-26', 'https://www.gov.br/agricultura/pt-br/assuntos/noticias/favaro-plano-safra', 'government', 1, 'Brasília', 'Lançamento Plano Safra', 'favaro-plano-safra-b70-37') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_ter, 'Tereza Cristina critica Plano Safra.', 'Os juros do Plano Safra estão altos demais porque a política de juros geral está quebrada.', 'Senadora Tereza Cristina criticou juros do Plano Safra.', 'verified', false, '2023-07-03', 'https://www1.folha.uol.com.br/mercado/2023/07/tereza-cristina-plano-safra.shtml', 'news_article', 2, 'Brasília', 'Comissão Senado', 'tereza-plano-safra-b70-38') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_mar, 'Marina defende taxonomia verde.', 'Não há política fiscal sustentável sem integrar risco climático nas contas públicas.', 'Marina Silva em cúpula climática no G20 Brasil.', 'verified', false, '2024-07-24', 'https://www.gov.br/mma/pt-br/noticias/marina-taxonomia-verde', 'government', 1, 'Rio de Janeiro', 'G20 Clima', 'marina-taxonomia-verde-b70-39') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_alc, 'Alckmin defende nova política industrial.', 'A Nova Indústria Brasil é a reindustrialização verde que o país precisa.', 'Alckmin lançou o plano Nova Indústria Brasil em janeiro de 2024.', 'verified', false, '2024-01-22', 'https://valor.globo.com/brasil/noticia/2024/01/22/alckmin-nova-industria.ghtml', 'news_article', 1, 'Brasília', 'Lançamento NIB', 'alckmin-nova-industria-b70-40') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad elogia cooperação com Alckmin.', 'Fazenda e MDIC trabalham de mãos dadas na reindustrialização do país.', 'Haddad destacou alinhamento com Alckmin em evento.', 'verified', false, '2024-02-20', 'https://valor.globo.com/brasil/noticia/2024/02/20/haddad-alckmin-alinhamento.ghtml', 'news_article', 1, 'São Paulo', 'Fórum Fiesp', 'haddad-alckmin-alinhamento-b70-41') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_rui, 'Rui Costa sobre PAC.', 'O Novo PAC é o maior programa de investimentos da década.', 'Rui Costa lançou Novo PAC.', 'verified', false, '2023-08-11', 'https://g1.globo.com/politica/noticia/2023/08/11/rui-costa-pac.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Lançamento Novo PAC', 'rui-costa-pac-b70-42') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_wdi, 'Wellington Dias defende Bolsa Família.', 'Bolsa Família e CadÚnico são as principais políticas de combate à miséria.', 'Wellington Dias defendeu reformulação do Bolsa Família.', 'verified', false, '2023-03-02', 'https://g1.globo.com/politica/noticia/2023/03/02/wellington-bolsa-familia.ghtml', 'news_article', 1, 'Brasília', 'Lançamento Bolsa Família', 'wellington-bolsa-familia-b70-43') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lup, 'Lupi defende reforma da Previdência do BPC.', 'O BPC precisa ser mantido inatingível, é constitucional.', 'Lupi resistiu a cortes no BPC no pacote fiscal de 2024.', 'verified', true, '2024-11-28', 'https://valor.globo.com/brasil/noticia/2024/11/28/lupi-bpc.ghtml', 'news_article', 3, 'Brasília', 'Comissão Câmara', 'lupi-bpc-b70-44') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lmar, 'Luiz Marinho defende valorização do salário mínimo.', 'O novo salário mínimo é a maior transferência de renda do país.', 'Luiz Marinho comemorou sanção da lei do salário mínimo.', 'verified', false, '2023-08-25', 'https://www.gov.br/trabalho/pt-br/noticias/marinho-salario-minimo', 'government', 1, 'Brasília', 'Sanção Lei 14.663', 'luiz-marinho-salario-minimo-b70-45') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_rmar, 'Rogério Marinho critica gasto com servidores.', 'O governo Lula explodiu a folha pública enquanto a economia freia.', 'Senador Rogério Marinho criticou acordo de reajuste de servidores.', 'verified', false, '2024-02-28', 'https://www1.folha.uol.com.br/mercado/2024/02/rogerio-marinho-servidores.shtml', 'news_article', 3, 'Brasília', 'Plenário Senado', 'rogerio-servidores-b70-46') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_adv, 'Adriana Ventura critica criação de cargos.', 'Criar comissionados enquanto o arcabouço aperta é desrespeito ao contribuinte.', 'Adriana Ventura discursou contra novos cargos no Executivo.', 'verified', false, '2024-03-20', 'https://g1.globo.com/politica/noticia/2024/03/20/adriana-ventura-cargos.ghtml', 'news_article', 2, 'Brasília', 'Plenário Câmara', 'adriana-cargos-b70-47') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad fala sobre Selic em Davos.', 'O Brasil precisa de juros reais compatíveis com o risco do país, não mais que isso.', 'Haddad em Davos em janeiro de 2024.', 'verified', false, '2024-01-17', 'https://valor.globo.com/mundo/noticia/2024/01/17/haddad-davos-juros.ghtml', 'news_article', 2, 'Davos', 'Fórum Econômico Mundial', 'haddad-davos-juros-b70-48') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto em Davos defende disciplina fiscal.', 'Sem consolidação fiscal, a desinflação não se sustenta no Brasil.', 'Campos Neto em Davos 2024.', 'verified', false, '2024-01-18', 'https://www.reuters.com/world/americas/campos-neto-davos-fiscal-2024-01-18/', 'news_article', 2, 'Davos', 'Fórum Econômico Mundial', 'campos-davos-fiscal-b70-49') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula diz que ''mercado se acostuma''.', 'O mercado tem que parar de reclamar, o mercado vai se acostumar.', 'Lula rebateu reação negativa do mercado ao afrouxamento da meta.', 'verified', true, '2024-04-16', 'https://g1.globo.com/politica/noticia/2024/04/16/lula-mercado-se-acostuma.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-mercado-acostuma-b70-50') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad defende Fazenda após fala de Lula.', 'O governo segue comprometido com responsabilidade fiscal, isso é inegociável.', 'Haddad saiu em defesa após fala ''mercado se acostuma'' derrubar Bolsa.', 'verified', true, '2024-04-17', 'https://valor.globo.com/politica/noticia/2024/04/17/haddad-rebate-mercado.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Fazenda', 'haddad-rebate-mercado-b70-51') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula mudou meta fiscal em LDO.', 'Vamos revisar a meta, não tem sentido manter meta irreal.', 'Lula confirmou revisão da meta fiscal em abril de 2024.', 'verified', true, '2024-04-15', 'https://g1.globo.com/politica/noticia/2024/04/15/lula-revisao-meta.ghtml', 'news_article', 4, 'Brasília', 'Café com jornalistas', 'lula-revisao-meta-b70-52') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet reforça meta revisada.', 'A revisão não é abandono, é ajuste realista dentro do arcabouço.', 'Tebet defendeu revisão da meta em entrevista coletiva.', 'verified', false, '2024-04-15', 'https://valor.globo.com/brasil/noticia/2024/04/15/tebet-meta-revisada.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Planejamento', 'tebet-meta-revisada-b70-53') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad diz ser ''soldado de Lula''.', 'Sou soldado do presidente Lula, em qualquer missão que ele me colocar.', 'Haddad em evento após rumores de demissão.', 'verified', true, '2024-08-22', 'https://g1.globo.com/politica/noticia/2024/08/22/haddad-soldado-lula.ghtml', 'news_article', 2, 'Brasília', 'Evento no Planalto', 'haddad-soldado-lula-b70-54') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gle, 'Gleisi critica ''mercado especulador''.', 'O mercado especula contra o Brasil todo santo dia e ninguém chama responsabilidade.', 'Gleisi em ato do PT.', 'verified', false, '2024-07-10', 'https://g1.globo.com/politica/noticia/2024/07/10/gleisi-mercado-especulador.ghtml', 'news_article', 3, 'Brasília', 'Ato do PT', 'gleisi-mercado-especulador-b70-55') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad projeta déficit menor que esperado.', 'O déficit de 2024 ficou dentro do intervalo do arcabouço, mesmo com calamidades.', 'Haddad comentou resultado primário anual.', 'verified', false, '2025-01-31', 'https://valor.globo.com/brasil/noticia/2025/01/31/haddad-deficit-2024.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Resultado Primário', 'haddad-deficit-2024-b70-56') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_pra, 'Prates anuncia dividendos extraordinários.', 'A Petrobras é do povo brasileiro e distribuirá dividendos extraordinários justos.', 'Prates anunciou revisão de política de dividendos após polêmica.', 'verified', false, '2024-04-25', 'https://valor.globo.com/empresas/noticia/2024/04/25/prates-dividendos.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Assembleia Petrobras', 'prates-dividendos-b70-57') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_cha, 'Chambriard defende exploração na Foz.', 'A exploração na Margem Equatorial é essencial para a soberania energética.', 'Chambriard defendeu licenciamento na Foz do Amazonas.', 'verified', true, '2024-08-15', 'https://valor.globo.com/empresas/noticia/2024/08/15/chambriard-foz-amazonas.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Rio Oil & Gas', 'chambriard-foz-amazonas-b70-58') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 59
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_mar, 'Marina Silva contrasta com Petrobras na Foz.', 'A exploração de combustíveis fósseis deve ser compatível com metas climáticas.', 'Marina Silva em divergência pública sobre a Margem Equatorial.', 'verified', true, '2024-08-20', 'https://www1.folha.uol.com.br/ambiente/2024/08/marina-foz-amazonas.shtml', 'news_article', 2, 'Brasília', 'Coletiva MMA', 'marina-foz-amazonas-b70-59') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre retirada da taxação global.', 'A tributação dos super-ricos é pauta do G20 liderada pelo Brasil.', 'Haddad comemorou avanço em taxação global de bilionários no G20 Rio.', 'verified', true, '2024-07-26', 'https://valor.globo.com/mundo/noticia/2024/07/26/haddad-superricos-g20.ghtml', 'news_article', 1, 'Rio de Janeiro', 'G20 Finanças', 'haddad-superricos-g20-b70-60') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet defende PPA 2028-2031 com clima.', 'O novo PPA traz o clima pela primeira vez como eixo estruturante do Estado.', 'Tebet anunciou estrutura do próximo PPA em 2026.', 'verified', false, '2026-01-22', 'https://valor.globo.com/brasil/noticia/2026/01/22/tebet-ppa-clima.ghtml', 'news_article', 1, 'Brasília', 'Anúncio estruturante PPA', 'tebet-ppa-clima-b70-61') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_dwe, 'Dweck rebate corte de servidores.', 'Cortar servidores não é reforma, é sucateamento de Estado.', 'Dweck rebateu proposta da oposição de cortar servidores.', 'verified', false, '2024-11-29', 'https://valor.globo.com/brasil/noticia/2024/11/29/dweck-servidores.ghtml', 'news_article', 2, 'Brasília', 'Audiência Câmara', 'dweck-servidores-rebate-b70-62') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_ebo, 'Eduardo Bolsonaro ataca Haddad.', 'Haddad é o ministro do confisco, quer taxar até o Cristo Redentor.', 'Eduardo Bolsonaro em discurso no plenário.', 'verified', false, '2024-03-14', 'https://g1.globo.com/politica/noticia/2024/03/14/eduardo-bolsonaro-haddad.ghtml', 'news_article', 3, 'Brasília', 'Plenário Câmara', 'eduardo-ataca-haddad-b70-63') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_vhm, 'Van Hattem ataca arcabouço.', 'O arcabouço já nasceu morto, o governo fura a meta todo trimestre.', 'Van Hattem no plenário contra arcabouço.', 'verified', false, '2024-05-22', 'https://g1.globo.com/politica/noticia/2024/05/22/vanhattem-arcabouco.ghtml', 'news_article', 2, 'Brasília', 'Plenário Câmara', 'vanhattem-arcabouco-morto-b70-64') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre dólar a R$ 6.', 'O câmbio está sofrendo volatilidade global, não é problema específico do Brasil.', 'Haddad minimizou alta do dólar ao patamar de R$ 6.', 'verified', true, '2024-12-18', 'https://valor.globo.com/financas/noticia/2024/12/18/haddad-dolar-seis.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Fazenda', 'haddad-dolar-seis-b70-65') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo vende reservas para segurar dólar.', 'O BC atuará sempre que identificar disfuncionalidade no mercado de câmbio.', 'Galípolo após leilão recorde de reservas em dezembro de 2024.', 'verified', true, '2024-12-19', 'https://www.bcb.gov.br/detalhenoticia/20241219-galipolo-cambio', 'government', 2, 'Brasília', 'Coletiva BC', 'galipolo-cambio-b70-66') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula culpa especuladores pela alta do dólar.', 'São especuladores atacando o Brasil, não é a realidade da economia.', 'Lula em transmissão aos domingos culpou ''especuladores''.', 'verified', true, '2024-12-22', 'https://g1.globo.com/politica/noticia/2024/12/22/lula-especuladores-dolar.ghtml', 'news_article', 4, 'Brasília', 'Conversa com o Presidente', 'lula-especuladores-dolar-b70-67') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_mer, 'Mercadante defende BNDES em ativos estratégicos.', 'O BNDES voltará a ser acionista estratégico em setores como defesa e infraestrutura.', 'Mercadante defendeu participação acionária do BNDES em 2024.', 'verified', false, '2024-09-10', 'https://valor.globo.com/brasil/noticia/2024/09/10/mercadante-bndes-estrategico.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Evento BNDES', 'mercadante-bndes-estrategico-b70-68') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad nega pressão sobre Galípolo.', 'O Banco Central tem autonomia e eu respeito integralmente.', 'Haddad negou pressão sobre o BC em abril de 2025.', 'verified', false, '2025-04-10', 'https://valor.globo.com/politica/noticia/2025/04/10/haddad-bc-autonomia.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-autonomia-bc-b70-69') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula cobra Galípolo publicamente.', 'O Galípolo sabe que o povo não aguenta juros nesse patamar.', 'Lula pressionou publicamente Galípolo em março de 2025.', 'verified', true, '2025-03-25', 'https://g1.globo.com/politica/noticia/2025/03/25/lula-cobra-galipolo.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-cobra-galipolo-b70-70') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo rebate pressão.', 'Decisões do Copom são técnicas e colegiadas, não cedem a pressões.', 'Galípolo rebateu declarações de Lula.', 'verified', true, '2025-03-26', 'https://www1.folha.uol.com.br/mercado/2025/03/galipolo-rebate.shtml', 'news_article', 2, 'São Paulo', 'Congresso FEBRABAN', 'galipolo-rebate-b70-71') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia corte de benefícios tributários.', 'É hora de reduzir 10% dos benefícios tributários como prevê a Constituição.', 'Haddad anunciou corte de benefícios em 2025.', 'verified', false, '2025-06-11', 'https://valor.globo.com/brasil/noticia/2025/06/11/haddad-beneficios.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-beneficios-tributarios-b70-72') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_adv, 'Adriana Ventura defende corte de gastos.', 'O caminho é revisar obrigações e não criar imposto, o contribuinte não aguenta mais.', 'Adriana Ventura em debate da reforma tributária.', 'verified', false, '2024-12-05', 'https://g1.globo.com/politica/noticia/2024/12/05/adriana-corte.ghtml', 'news_article', 2, 'Brasília', 'Plenário Câmara', 'adriana-corte-b70-73') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_tab, 'Tabata defende gastança inteligente.', 'Precisamos de responsabilidade fiscal e social caminhando juntas.', 'Tabata em entrevista no Roda Viva.', 'verified', false, '2024-06-24', 'https://g1.globo.com/politica/noticia/2024/06/24/tabata-roda-viva.ghtml', 'news_article', 1, 'São Paulo', 'Roda Viva', 'tabata-rodaviva-b70-74') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula diz que rico não paga imposto.', 'Aqui, quem é rico não paga imposto, quem trabalha paga todos os impostos do mundo.', 'Lula em evento na CUT.', 'verified', true, '2024-11-05', 'https://g1.globo.com/politica/noticia/2024/11/05/lula-rico-imposto.ghtml', 'news_article', 2, 'São Paulo', 'Ato CUT', 'lula-rico-imposto-b70-75') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre rating brasileiro.', 'O rating refletirá a disciplina fiscal que estamos mostrando.', 'Haddad após elevação do rating pela Moody''s em outubro de 2024.', 'verified', false, '2024-10-01', 'https://valor.globo.com/financas/noticia/2024/10/01/haddad-moodys.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Fazenda', 'haddad-moodys-b70-76') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet critica vetos a corte de gastos.', 'Vetar medidas do próprio pacote é tiro no pé da credibilidade.', 'Tebet criticou vetos de Lula ao pacote fiscal em janeiro de 2025.', 'verified', true, '2025-01-09', 'https://www1.folha.uol.com.br/mercado/2025/01/tebet-vetos.shtml', 'news_article', 3, 'Brasília', 'Entrevista CBN', 'tebet-vetos-b70-77') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad explica pacote fiscal ao Congresso.', 'Pedimos apoio a quem tem compromisso com a estabilidade fiscal do país.', 'Haddad fez reuniões reservadas com líderes.', 'verified', false, '2024-11-28', 'https://valor.globo.com/politica/noticia/2024/11/28/haddad-congresso-pacote.ghtml', 'news_article', 1, 'Brasília', 'Reuniões com líderes', 'haddad-congresso-pacote-b70-78') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_camp, 'Campos Neto defende independência monetária em livro.', 'A independência do Banco Central foi a maior conquista institucional do período.', 'Campos Neto em evento de pós-mandato.', 'verified', false, '2025-05-30', 'https://www1.folha.uol.com.br/mercado/2025/05/campos-neto-livro.shtml', 'news_article', 1, 'São Paulo', 'Lançamento livro', 'campos-neto-livro-b70-79') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre tarifas dos EUA.', 'Vamos defender nossa indústria com firmeza contra tarifas injustas dos EUA.', 'Haddad reagiu a tarifas de Trump em abril de 2025.', 'verified', true, '2025-04-03', 'https://valor.globo.com/brasil/noticia/2025/04/03/haddad-tarifas-eua.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-tarifas-eua-b70-80') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_alc, 'Alckmin anuncia plano anti-tarifas.', 'O plano de contingência protege empregos brasileiros diante do protecionismo.', 'Alckmin anunciou plano contra tarifas Trump em abril de 2025.', 'verified', false, '2025-04-04', 'https://valor.globo.com/brasil/noticia/2025/04/04/alckmin-tarifas.ghtml', 'news_article', 1, 'Brasília', 'Lançamento plano', 'alckmin-tarifas-b70-81') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula promete dólar a R$ 5.', 'O dólar vai voltar para R$ 5, pode anotar aí, é só esperar um pouco.', 'Lula fez promessa de câmbio em live semanal.', 'verified', true, '2025-01-19', 'https://g1.globo.com/politica/noticia/2025/01/19/lula-dolar-cinco.ghtml', 'news_article', 4, 'Brasília', 'Live semanal', 'lula-promete-dolar-cinco-b70-82') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad evita comentar projeção de câmbio.', 'Ministro da Fazenda não faz projeção cambial, essa não é função do cargo.', 'Haddad se desvincula da fala de Lula sobre dólar.', 'verified', true, '2025-01-20', 'https://valor.globo.com/financas/noticia/2025/01/20/haddad-dolar-lula.ghtml', 'news_article', 3, 'Brasília', 'Coletiva Fazenda', 'haddad-dolar-evita-b70-83') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo sobe Selic em janeiro de 2025.', 'O Copom elevará os juros enquanto necessário para convergência da inflação.', 'Galípolo subiu a Selic em 100 pontos.', 'verified', true, '2025-01-29', 'https://www.bcb.gov.br/detalhenoticia/20250129-copom', 'government', 2, 'Brasília', 'Reunião Copom', 'galipolo-copom-jan-b70-84') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad pede ''paciência'' com inflação.', 'Temos todas as condições de voltar ao centro da meta ao longo de 2025.', 'Haddad após IPCA acima de 5% em janeiro.', 'verified', false, '2025-02-11', 'https://valor.globo.com/brasil/noticia/2025/02/11/haddad-inflacao.ghtml', 'news_article', 2, 'Brasília', 'Coletiva IPCA', 'haddad-inflacao-paciencia-b70-85') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula critica alimento caro.', 'O preço do arroz e da carne não pode subir nas costas do trabalhador.', 'Lula ataca alta de alimentos em março de 2025.', 'verified', false, '2025-03-12', 'https://g1.globo.com/politica/noticia/2025/03/12/lula-alimentos.ghtml', 'news_article', 2, 'Brasília', 'Transmissão', 'lula-alimentos-caros-b70-86') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia zeragem de imposto de alimentos.', 'Zeramos o imposto de importação de itens da cesta básica para ajudar as famílias.', 'Haddad anunciou pacote alimentos em março de 2025.', 'verified', true, '2025-03-07', 'https://valor.globo.com/brasil/noticia/2025/03/07/haddad-alimentos.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-alimentos-b70-87') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_ter, 'Tereza Cristina defende agro contra IOF.', 'O IOF proposto prejudica o financiamento do agro na hora do plantio.', 'Tereza Cristina rebate aumento do IOF em maio de 2025.', 'verified', false, '2025-05-23', 'https://valor.globo.com/politica/noticia/2025/05/23/tereza-iof.ghtml', 'news_article', 2, 'Brasília', 'Plenário Senado', 'tereza-iof-b70-88') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad admite erro no IOF.', 'Assumimos o erro e fizemos o ajuste mais rápido possível, era necessário.', 'Haddad admite erro em coletiva pós-recuo do IOF.', 'verified', true, '2025-05-24', 'https://www1.folha.uol.com.br/mercado/2025/05/haddad-admite-iof.shtml', 'news_article', 4, 'Brasília', 'Coletiva Fazenda', 'haddad-admite-iof-b70-89') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_adv, 'Adriana Ventura ironiza IOF.', 'O governo recuou do IOF em menos de 24 horas, não tem nem convicção do que faz.', 'Adriana Ventura comentou o recuo do IOF em plenário.', 'verified', false, '2025-05-26', 'https://g1.globo.com/politica/noticia/2025/05/26/adriana-iof.ghtml', 'news_article', 2, 'Brasília', 'Plenário Câmara', 'adriana-iof-b70-90') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula diz que BC tem que baixar juros já.', 'O Banco Central tem que ter coragem de baixar juros, e agora.', 'Lula em novo ataque público ao BC em maio de 2025.', 'verified', true, '2025-05-05', 'https://g1.globo.com/politica/noticia/2025/05/05/lula-bc-coragem.ghtml', 'news_article', 4, 'São Paulo', 'Evento sindical', 'lula-bc-coragem-b70-91') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 92
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_gal, 'Galípolo ignora pressão de Lula.', 'Nossa função é fazer a inflação convergir. Ponto final.', 'Galípolo respondeu sem citar Lula diretamente.', 'verified', false, '2025-05-08', 'https://valor.globo.com/financas/noticia/2025/05/08/galipolo-pressao.ghtml', 'news_article', 1, 'Brasília', 'Seminário BC', 'galipolo-ignora-pressao-b70-92') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad nega saída da Fazenda.', 'Não cogito sair da Fazenda, o presidente tem minha confiança e eu a dele.', 'Haddad desmentiu rumores de saída em julho de 2025.', 'verified', true, '2025-07-15', 'https://valor.globo.com/politica/noticia/2025/07/15/haddad-saida.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-nega-saida-b70-93') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_teb, 'Tebet sobre sucessão 2026.', 'Se for preciso, estarei de novo disponível para servir ao país.', 'Tebet respondeu sobre planos em entrevista.', 'verified', false, '2025-09-22', 'https://g1.globo.com/politica/noticia/2025/09/22/tebet-sucessao.ghtml', 'news_article', 1, 'Brasília', 'Entrevista CBN', 'tebet-sucessao-b70-94') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad anuncia desoneração da folha parcial.', 'Mantemos parte da desoneração respeitando o acordo com o Congresso.', 'Haddad negocia MP após derrubada do STF.', 'verified', false, '2024-09-26', 'https://valor.globo.com/brasil/noticia/2024/09/26/haddad-desoneracao.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-desoneracao-folha-b70-95') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_dwe, 'Dweck defende concurso unificado.', 'O CPNU é a maior seleção pública da história, mais diversa e mais barata.', 'Dweck defendeu CPNU em evento com inscritos.', 'verified', false, '2024-08-18', 'https://g1.globo.com/politica/noticia/2024/08/18/dweck-cpnu.ghtml', 'news_article', 1, 'Brasília', 'Resultado CPNU', 'dweck-cpnu-b70-96') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_mer, 'Mercadante sobre financiamento Lava Jato.', 'O BNDES não tem nada a esconder e está cumprindo todas as decisões judiciais.', 'Mercadante falou sobre pendências do BNDES na Lava Jato.', 'verified', false, '2023-11-20', 'https://valor.globo.com/brasil/noticia/2023/11/20/mercadante-lava-jato.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Coletiva BNDES', 'mercadante-lavajato-b70-97') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_sil, 'Silveira defende Petrobras na Foz.', 'A exploração é segura, respaldada tecnicamente e essencial.', 'Silveira defendeu licenciamento da Petrobras.', 'verified', false, '2024-05-10', 'https://www1.folha.uol.com.br/ambiente/2024/05/silveira-foz-amazonas.shtml', 'news_article', 3, 'Brasília', 'Comissão Câmara', 'silveira-foz-b70-98') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 99
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_had, 'Haddad sobre PIB de 2024.', 'O Brasil cresceu mais que o esperado, com emprego e renda em alta.', 'Haddad comemorou PIB de 3,4% em 2024.', 'verified', false, '2025-03-07', 'https://valor.globo.com/brasil/noticia/2025/03/07/haddad-pib.ghtml', 'news_article', 1, 'Brasília', 'Coletiva PIB', 'haddad-pib-2024-b70-99') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_lul, 'Lula sobre meta de inflação.', 'Não consigo entender por que a meta tem que ser 3%, tem que ser mais alta.', 'Lula questionou meta do CMN em coletiva.', 'verified', true, '2023-01-27', 'https://g1.globo.com/politica/noticia/2023/01/27/lula-meta-inflacao.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-questiona-meta-b70-100') RETURNING id
  ) INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

END $$;
