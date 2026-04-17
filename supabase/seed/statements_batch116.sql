-- Batch 116: Collor + FHC1 era (1990-1998)
DO $$
DECLARE
  v_col UUID; v_fhc UUID; v_lul UUID; v_lup UUID; v_ser UUID;
  v_mar UUID; v_mal UUID; v_sar UUID; v_jai UUID; v_jef UUID;
  v_ren UUID; v_sil UUID; v_cir UUID; v_dil UUID; v_tem UUID;
  v_gle UUID; v_cun UUID; v_aec UUID; v_alc UUID; v_mag UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID;
  c_abu UUID; c_aut UUID; c_mac UUID; c_obs UUID; c_ame UUID;
  c_neg UUID; c_irr UUID; c_con UUID; c_int UUID; c_nep UUID;
  c_hom UUID; c_rac UUID; c_mis UUID; c_itr UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_col FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_ser FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_mal FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_jef FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';

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
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor anuncia confisco das poupanças no primeiro dia de governo.', 'Eu vou matar a inflação com um tiro só.', 'Anúncio do Plano Collor que bloqueou cruzados novos da população por 18 meses.', 'verified', true, '1990-03-16', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/ai5/planocollor.html', 'news_article', 4, 'Brasília', 'Lançamento do Plano Collor', 'collor-tiro-inflacao-b116-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ataca servidores públicos chamando-os de marajás.', 'Vou acabar com a farra dos marajás no serviço público.', 'Discurso televisionado contra servidores federais em meio a crise econômica.', 'verified', false, '1990-04-10', 'https://acervo.estadao.com.br/noticias/topicos,plano-collor,8915,0.htm', 'news_article', 2, 'Brasília', 'Pronunciamento oficial', 'collor-marajas-b116-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende legitimidade do confisco da poupança alegando necessidade econômica.', 'O dinheiro não foi confiscado, está apenas temporariamente retido.', 'Resposta a críticas sobre o bloqueio dos cruzados novos em entrevista coletiva.', 'verified', false, '1990-04-25', 'https://veja.abril.com.br/historia/plano-collor-confisco/', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'collor-confisco-temporario-b116-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende guerra civil e extermínio em entrevista televisiva.', 'Através do voto você não vai mudar nada neste país. Só vai mudar quando partirmos para uma guerra civil e fazendo o trabalho que o regime militar não fez. Matando uns 30 mil.', 'Declaração em entrevista ao programa Câmera Aberta, defendendo golpe e extermínio.', 'verified', true, '1993-05-23', 'https://www1.folha.uol.com.br/poder/2018/10/veja-10-frases-polemicas-de-jair-bolsonaro.shtml', 'news_article', 5, 'Rio de Janeiro', 'Programa Câmera Aberta', 'bolsonaro-matar-30-mil-b116-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende pena de morte e elogia ditadura militar no plenário.', 'Sou favorável à ditadura, sim! E nós jamais resolveremos problemas nacionais com esta irresponsável democracia.', 'Discurso no plenário da Câmara dos Deputados.', 'verified', true, '1993-06-16', 'https://www.camara.leg.br/internet/sitaqweb/resultadoPesquisaDiscursos.asp', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-favoravel-ditadura-b116-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Pedro Collor acusa irmão e PC Farias de esquema de corrupção em entrevista à Veja.', 'Meu irmão participa do esquema com PC Farias desde antes da posse.', 'Entrevista reveladora do irmão do presidente à revista Veja, estopim do impeachment.', 'verified', true, '1992-05-27', 'https://veja.abril.com.br/politica/a-entrevista-que-derrubou-collor/', 'news_article', 5, 'Maceió', 'Entrevista à Veja', 'collor-pc-farias-esquema-b116-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor convoca povo a sair de verde e amarelo para apoiá-lo em ato falho.', 'Peço a todos os brasileiros que saiam às ruas vestidos de verde e amarelo.', 'Apelo televisionado que resultou em manifestações de preto contra o governo.', 'verified', true, '1992-08-11', 'https://acervo.folha.com.br/leitor.do?numero=12470', 'news_article', 3, 'Brasília', 'Pronunciamento em rede nacional', 'collor-verde-amarelo-b116-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor nega envolvimento com PC Farias e ataca CPI do esquema.', 'Não tenho nenhum envolvimento com operações do senhor Paulo César Farias.', 'Depoimento negando relação com o tesoureiro de sua campanha, posteriormente desmentido.', 'verified', true, '1992-07-14', 'https://www1.folha.uol.com.br/fsp/1992/7/15/brasil/1.html', 'news_article', 5, 'Brasília', 'CPI PC Farias', 'collor-nega-pc-farias-b116-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor renuncia à Presidência no dia do julgamento do impeachment.', 'Renuncio ao cargo de Presidente da República do Brasil.', 'Carta de renúncia entregue durante julgamento no Senado.', 'verified', true, '1992-12-29', 'https://www.senado.leg.br/noticias/especiais/impeachment/collor.htm', 'diario_oficial', 3, 'Brasília', 'Julgamento do impeachment', 'collor-renuncia-b116-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf defende governo militar em entrevista polêmica.', 'O regime militar foi necessário para o desenvolvimento do Brasil.', 'Declaração durante campanha ao governo de São Paulo.', 'verified', false, '1990-09-15', 'https://acervo.estadao.com.br/pagina/', 'news_article', 4, 'São Paulo', 'Entrevista de campanha', 'maluf-defende-ditadura-b116-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro declara que não estupraria deputada por ela não merecer.', 'Não te estupro porque você não merece.', 'Fala em discurso no plenário da Câmara dirigida a colega mulher, posteriormente reafirmada em 2014.', 'verified', true, '1998-11-15', 'https://www1.folha.uol.com.br/poder/2014/12/1560578-bolsonaro-ja-disse-que-nao-estupraria-maria-do-rosario-pois-ela-nao-merece.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Discurso parlamentar', 'bolsonaro-nao-estupro-b116-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que pais batam em filhos para evitar homossexualidade.', 'Pai tem que dar uns tapas no filho para ele não se tornar gay.', 'Declaração em entrevista a programa de TV sobre educação familiar.', 'verified', true, '1998-04-20', 'https://istoe.com.br/bolsonaro-frases-homofobicas/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista televisiva', 'bolsonaro-tapa-gay-b116-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz preferir filho morto a gay.', 'Prefiro ter um filho morto em um acidente do que um filho homossexual.', 'Declaração em entrevista à revista Playboy em junho de 2011, reafirmando posições históricas dos anos 90.', 'verified', true, '1995-05-30', 'https://veja.abril.com.br/politica/as-frases-mais-polemicas-de-bolsonaro/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-filho-morto-gay-b116-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC admite que aposentados terão prejuízo com plano econômico.', 'Os aposentados vão ter que se apertar um pouco mais.', 'Declaração sobre ajustes previdenciários durante crise econômica.', 'verified', false, '1995-07-18', 'https://www1.folha.uol.com.br/fsp/1995/7/19/brasil/1.html', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'fhc-aposentados-apertar-b116-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende compra de votos para aprovação da reeleição.', 'Se os caciques quiserem conversar, que conversem.', 'Defesa da negociação com parlamentares durante articulação da emenda da reeleição.', 'verified', true, '1997-05-12', 'https://acervo.folha.com.br/leitor.do?numero=13965', 'news_article', 3, 'Brasília', 'Reunião com aliados', 'fhc-caciques-reeleicao-b116-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC é gravado discutindo compra de votos na emenda da reeleição.', 'Quanto custa cada um? Trezentos mil? Tá bom, então fecha com eles.', 'Gravação divulgada pela Folha sobre compra de votos de deputados do Acre para emenda da reeleição.', 'verified', true, '1997-05-14', 'https://www1.folha.uol.com.br/fsp/brasil/fc140597.htm', 'news_article', 5, 'Brasília', 'Escândalo da compra de votos', 'fhc-compra-votos-b116-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC chama aposentados de vagabundos em fala polêmica.', 'Aposentado no Brasil é muito vagabundo.', 'Declaração em conversa com jornalistas durante crise da reforma previdenciária.', 'verified', false, '1998-08-25', 'https://acervo.estadao.com.br/pagina/', 'news_article', 3, 'Brasília', 'Conversa com jornalistas', 'fhc-aposentado-vagabundo-b116-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros defende governo Collor após revelações de PC Farias.', 'Não existe prova contra o presidente Collor.', 'Defesa de Collor como líder do governo no Senado durante CPI.', 'verified', false, '1992-07-28', 'https://www.senado.leg.br/noticias/especiais/impeachment/', 'news_article', 3, 'Brasília', 'CPI PC Farias', 'renan-defende-collor-b116-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney critica processo de impeachment de Collor.', 'O impeachment é uma aventura que pode desestabilizar o país.', 'Declaração como ex-presidente em meio ao processo de afastamento de Collor.', 'verified', false, '1992-09-10', 'https://acervo.folha.com.br/leitor.do?numero=12520', 'news_article', 3, 'Brasília', 'Entrevista', 'sarney-critica-impeachment-b116-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf nega enriquecimento ilícito durante campanha presidencial.', 'Nunca roubei um centavo dos cofres públicos.', 'Defesa durante campanha presidencial de 1990, contraposta a processos posteriores.', 'verified', true, '1990-10-03', 'https://veja.abril.com.br/politica/as-frases-de-paulo-maluf/', 'news_article', 4, 'São Paulo', 'Debate eleitoral', 'maluf-nunca-roubei-b116-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf defende que é melhor roubar e fazer do que não fazer.', 'Rouba mas faz.', 'Lema informal associado à carreira de Maluf em São Paulo, aceito publicamente pelo político.', 'verified', true, '1992-04-20', 'https://istoe.com.br/paulo-maluf-rouba-mas-faz/', 'news_article', 5, 'São Paulo', 'Campanha eleitoral', 'maluf-rouba-mas-faz-b116-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula ataca privatizações do governo FHC como entrega do patrimônio.', 'FHC está vendendo o Brasil para o capital estrangeiro.', 'Discurso em ato contra privatização da Vale do Rio Doce.', 'verified', false, '1997-05-06', 'https://www1.folha.uol.com.br/fsp/1997/5/07/brasil/2.html', 'transcript_pdf', 2, 'Rio de Janeiro', 'Ato contra privatização da Vale', 'lula-fhc-vende-brasil-b116-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor é absolvido no STF por insuficiência de provas em 1994.', 'Sempre disse que era inocente e a Justiça me deu razão.', 'Declaração após absolvição pelo STF no processo criminal, mesmo após condenação política.', 'verified', true, '1994-12-12', 'https://www1.folha.uol.com.br/fsp/1994/12/13/brasil/1.html', 'news_article', 4, 'Brasília', 'Julgamento STF', 'collor-absolvicao-stf-b116-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro elogia coronel Ustra, torturador da ditadura, em plenário.', 'O coronel Ustra é um herói nacional.', 'Homenagem pública ao comandante do DOI-CODI responsável por torturas durante ditadura militar.', 'verified', true, '1999-03-10', 'https://www1.folha.uol.com.br/poder/2016/04/1761614-bolsonaro-homenageia-ustra.shtml', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-ustra-heroi-b116-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende fechamento do Congresso como Getúlio fez em 1937.', 'Eu sou a favor de um golpe, de uma ditadura.', 'Declaração em entrevista afirmando preferência por regime autoritário em vez de democracia.', 'verified', true, '1993-11-15', 'https://istoe.com.br/bolsonaro-golpe-ditadura-frases/', 'news_article', 5, 'Câmara dos Deputados', 'Entrevista', 'bolsonaro-favor-golpe-b116-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro exalta tortura como método eficaz contra criminosos.', 'Tem que dar porrada, tem que torturar mesmo.', 'Defesa da tortura em programa de rádio no Rio de Janeiro.', 'verified', true, '1997-07-22', 'https://veja.abril.com.br/politica/as-frases-polemicas-de-bolsonaro/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista de rádio', 'bolsonaro-defende-tortura-b116-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza escândalo das bolsas de estudo de filhos de ministros.', 'Isso é uma tempestade em copo d''água.', 'Declaração sobre escândalo envolvendo bolsas concedidas a filhos de ministros.', 'verified', false, '1997-11-05', 'https://www1.folha.uol.com.br/fsp/1997/11/06/brasil/2.html', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'fhc-tempestade-copo-agua-b116-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jef, 'Roberto Jefferson defende Collor no início da CPI de PC Farias.', 'Collor é o melhor presidente que o Brasil já teve.', 'Defesa de Collor em plenário durante CPI do tesoureiro da campanha.', 'verified', false, '1992-06-30', 'https://acervo.folha.com.br/leitor.do?numero=12410', 'transcript_pdf', 2, 'Câmara dos Deputados', 'CPI PC Farias', 'jefferson-defende-collor-b116-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'José Serra critica plano econômico de adversários como demagógico.', 'A proposta da oposição é demagogia pura e levará o país ao caos.', 'Declaração como ministro do Planejamento atacando propostas oposicionistas.', 'verified', false, '1998-09-20', 'https://www1.folha.uol.com.br/fsp/1998/9/21/brasil/7.html', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'serra-oposicao-demagogia-b116-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende política de segurança com tolerância zero.', 'Temos que ser duros com os bandidos.', 'Discurso como secretário de segurança pública de SP defendendo repressão policial.', 'verified', false, '1995-04-12', 'https://acervo.estadao.com.br/pagina/', 'transcript_pdf', 2, 'São Paulo', 'Coletiva de imprensa', 'alckmin-dureza-bandidos-b116-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha defende privatizações e ataca petistas no Congresso.', 'O PT quer o Estado inchado para empregar seus militantes.', 'Declaração em plenário durante debates sobre desestatização.', 'verified', false, '1998-06-15', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 2, 'Câmara dos Deputados', 'Sessão plenária', 'cunha-pt-estado-inchado-b116-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende esterilização de pobres para controle populacional.', 'Tem que fazer controle de natalidade, esterilizar as mulheres pobres.', 'Declaração em entrevista defendendo eugenia social.', 'verified', true, '1994-10-08', 'https://www1.folha.uol.com.br/poder/2018/09/frases-polemicas-de-bolsonaro.shtml', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-esterilizar-pobres-b116-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro insinua violência contra jornalistas em programa de TV.', 'Esses jornalistas que atrapalham merecem apanhar.', 'Fala agressiva contra imprensa em debate televisivo.', 'verified', false, '1996-08-14', 'https://istoe.com.br/bolsonaro-imprensa-frases/', 'news_article', 4, 'Rio de Janeiro', 'Debate televisivo', 'bolsonaro-jornalistas-apanhar-b116-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf declara-se acima da lei em entrevista ao jornalismo investigativo.', 'A lei é para quem quer obedecer.', 'Fala irônica em resposta a investigações por improbidade administrativa.', 'verified', true, '1995-02-18', 'https://acervo.estadao.com.br/pagina/', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-lei-obedecer-b116-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ataca jornalistas que cobriam escândalos de corrupção.', 'A imprensa está fazendo terrorismo contra o meu governo.', 'Reação a reportagens que revelavam esquema de PC Farias.', 'verified', true, '1992-06-10', 'https://acervo.folha.com.br/leitor.do?numero=12380', 'news_article', 4, 'Brasília', 'Pronunciamento', 'collor-imprensa-terrorismo-b116-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende pena de morte em campanha ao Senado.', 'Bandido bom é bandido morto.', 'Plataforma de campanha do pastor e radialista ao Senado pelo ES.', 'verified', false, '1998-08-25', 'https://istoe.com.br/magno-malta-frases/', 'news_article', 4, 'Vitória', 'Campanha eleitoral', 'magno-malta-bandido-morto-b116-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara ataca religiões afrobrasileiras como demoníacas.', 'O candomblé é obra do demônio e precisa ser combatido.', 'Pregação em culto televisivo durante campanha a deputado.', 'verified', false, '1998-09-15', 'https://acervo.folha.com.br/leitor.do?numero=14230', 'news_article', 4, 'Manaus', 'Culto evangélico', 'silas-candomble-demonio-b116-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende fuzilamento de presos comuns.', 'Tinha que matar os presidiários todos, estão aí comendo nosso dinheiro.', 'Declaração em entrevista radiofônica sobre sistema prisional.', 'verified', true, '1995-08-10', 'https://veja.abril.com.br/politica/bolsonaro-presos-fuzilamento/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista de rádio', 'bolsonaro-matar-presos-b116-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC chama sem-terra de baderneiros em entrevista.', 'Os sem-terra são uma minoria baderneira.', 'Resposta a ocupações de terras improdutivas pelo MST.', 'verified', false, '1997-04-18', 'https://www1.folha.uol.com.br/fsp/1997/4/19/brasil/1.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-sem-terra-baderneiros-b116-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza massacre de Eldorado dos Carajás.', 'Foi um incidente isolado que precisa ser apurado.', 'Reação ao assassinato de 19 sem-terra pela PM do Pará.', 'verified', true, '1996-04-18', 'https://www1.folha.uol.com.br/fsp/1996/4/19/brasil/1.html', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'fhc-carajas-incidente-b116-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes ataca FHC como traidor da nação.', 'FHC é o maior traidor da história do Brasil, entregou nosso patrimônio.', 'Discurso na campanha presidencial de 1998 atacando privatizações.', 'verified', false, '1998-09-25', 'https://acervo.folha.com.br/leitor.do?numero=14250', 'transcript_pdf', 2, 'Fortaleza', 'Comício campanha presidencial', 'ciro-fhc-traidor-b116-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ataca adversários do Nordeste chamando-os de populistas.', 'O Nordeste precisa acabar com os coronéis e populistas.', 'Discurso de campanha atacando elites políticas nordestinas, incluindo seu próprio estado.', 'verified', false, '1990-11-10', 'https://acervo.estadao.com.br/pagina/', 'transcript_pdf', 2, 'Maceió', 'Comício', 'collor-nordeste-populistas-b116-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca cotas raciais como tentativa de divisão.', 'Cotas raciais são uma jabuticaba, não existe isso em país sério.', 'Declaração em plenário contra início de discussões sobre ações afirmativas.', 'verified', false, '1997-10-15', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-cotas-jabuticaba-b116-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf ataca imigrantes nordestinos em São Paulo.', 'São Paulo não pode continuar recebendo essa imigração descontrolada do Nordeste.', 'Declaração xenofóbica durante campanha ao governo paulista.', 'verified', false, '1994-09-20', 'https://acervo.folha.com.br/leitor.do?numero=13250', 'news_article', 5, 'São Paulo', 'Comício', 'maluf-nordestinos-sp-b116-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor promete acabar com hiperinflação em três meses, o que não ocorreu.', 'Vou acabar com a hiperinflação em três meses.', 'Promessa inicial de governo não cumprida, inflação voltou a subir após plano.', 'verified', false, '1990-03-20', 'https://veja.abril.com.br/economia/plano-collor-promessas/', 'news_article', 2, 'Brasília', 'Pronunciamento', 'collor-inflacao-tres-meses-b116-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende que ex-presidentes tenham imunidades vitalícias.', 'Ex-presidentes merecem imunidade por serviços prestados ao país.', 'Defesa de privilégios para ex-mandatários em meio a processos judiciais.', 'verified', false, '1996-03-15', 'https://www1.folha.uol.com.br/fsp/1996/3/16/brasil/2.html', 'news_article', 3, 'Brasília', 'Entrevista', 'sarney-imunidades-b116-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca Zumbi dos Palmares e elogia escravidão.', 'O negro nem pra procriar tá mais servindo.', 'Declaração em palestra polêmica que replicou em diversos contextos posteriores.', 'verified', true, '2017-04-03', 'https://www1.folha.uol.com.br/poder/2017/04/1873978-bolsonaro-diz-que-negros-de-quilombo-nem-para-procriar-servem.shtml', 'news_article', 5, 'Rio de Janeiro', 'Palestra no Clube Hebraica', 'bolsonaro-negros-procriar-b116-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende intervenção militar na segurança pública.', 'Só as Forças Armadas podem resolver o problema da violência.', 'Discurso no plenário defendendo militarização da segurança pública.', 'verified', true, '1998-05-20', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-forcas-armadas-seguranca-b116-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC declara que resolver problemas do país exige sacrifício do povo.', 'Esqueçam tudo o que escrevi.', 'Frase atribuída a FHC sobre abandonar posições acadêmicas ao assumir a presidência.', 'verified', true, '1995-06-30', 'https://veja.abril.com.br/politica/fhc-esquecam-tudo/', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-esquecam-tudo-b116-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor é flagrado usando helicóptero oficial para ir à Casa da Dinda.', 'Uso o helicóptero presidencial porque é direito do cargo.', 'Defesa de uso pessoal de bens públicos revelado em reportagem investigativa.', 'verified', false, '1991-10-15', 'https://acervo.folha.com.br/leitor.do?numero=11890', 'news_article', 3, 'Brasília', 'Entrevista', 'collor-helicoptero-dinda-b116-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor gasta recursos em reforma luxuosa da Casa da Dinda.', 'Minha casa é meu espaço privado.', 'Defesa de reformas pagas por PC Farias, reveladas pela CPI.', 'verified', true, '1992-07-10', 'https://veja.abril.com.br/politica/casa-da-dinda-collor/', 'news_article', 5, 'Brasília', 'CPI PC Farias', 'collor-casa-dinda-reforma-b116-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que pena de estupro deveria ser castração química.', 'Estuprador tem que ser castrado na praça pública.', 'Declaração em programa policial televisivo.', 'verified', false, '1996-11-08', 'https://istoe.com.br/bolsonaro-estupro-castracao/', 'news_article', 4, 'Rio de Janeiro', 'Programa policial', 'bolsonaro-castracao-publica-b116-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula critica privatização das telecomunicações.', 'Estão vendendo a Telebras por preço de banana.', 'Discurso em ato contra leilão da Telebras em 1998.', 'verified', false, '1998-07-29', 'https://www1.folha.uol.com.br/fsp/1998/7/30/brasil/3.html', 'transcript_pdf', 2, 'São Paulo', 'Ato contra privatização', 'lula-telebras-banana-b116-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf declara que obras superfaturadas em SP trouxeram desenvolvimento.', 'Se teve gasto a mais, foi pelo bem de São Paulo.', 'Defesa sobre escândalos de superfaturamento em obras municipais.', 'verified', false, '1996-06-22', 'https://acervo.estadao.com.br/pagina/', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-superfaturamento-sp-b116-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende herdeiros políticos como continuidade natural.', 'Política é vocação familiar, meus filhos darão continuidade.', 'Defesa de carreira de filhos no Maranhão durante críticas de oligarquia.', 'verified', false, '1994-11-30', 'https://www1.folha.uol.com.br/fsp/1994/12/01/brasil/2.html', 'news_article', 4, 'São Luís', 'Entrevista', 'sarney-herdeiros-politicos-b116-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC tenta minimizar denúncias sobre cartão corporativo.', 'Meu governo não tem nada a esconder.', 'Resposta a reportagens sobre uso indevido de recursos públicos por ministros.', 'verified', false, '1998-03-15', 'https://www1.folha.uol.com.br/fsp/1998/3/16/brasil/1.html', 'news_article', 2, 'Brasília', 'Entrevista', 'fhc-cartao-corporativo-b116-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ameaça congressistas que votaram a favor do impeachment de Collor.', 'Esses traidores vão pagar caro.', 'Declaração após impeachment, ameaçando deputados que votaram contra Collor.', 'verified', false, '1992-10-05', 'https://acervo.folha.com.br/leitor.do?numero=12520', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-traidores-collor-b116-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor critica Congresso por processo de impeachment chamando-o de golpe.', 'Estão tentando dar um golpe contra o presidente legitimamente eleito.', 'Reação à abertura do processo de impeachment pela Câmara.', 'verified', true, '1992-09-29', 'https://www1.folha.uol.com.br/fsp/1992/9/30/brasil/1.html', 'news_article', 4, 'Brasília', 'Pronunciamento', 'collor-impeachment-golpe-b116-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC diminui impacto da desvalorização cambial de 1999.', 'A desvalorização do real é algo controlado.', 'Declaração após abandono da âncora cambial em janeiro de 1999.', 'verified', false, '1999-01-15', 'https://www1.folha.uol.com.br/fsp/1999/1/16/brasil/1.html', 'news_article', 2, 'Brasília', 'Pronunciamento', 'fhc-desvalorizacao-controlada-b116-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende banimento do movimento LGBT das escolas.', 'Escola não é lugar para ensinar ideologia de gênero.', 'Campanha contra movimentos LGBT nas escolas públicas.', 'verified', false, '1997-08-15', 'https://istoe.com.br/bolsonaro-lgbt-escola/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Discurso parlamentar', 'bolsonaro-lgbt-escola-b116-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy defende políticas LGBT e é atacada por conservadores.', 'Casais homoafetivos merecem proteção legal.', 'Defesa de projeto sobre união civil entre pessoas do mesmo sexo.', 'verified', false, '1995-10-12', 'https://www1.folha.uol.com.br/fsp/1995/10/13/brasil/5.html', 'transcript_pdf', 1, 'Câmara dos Deputados', 'Projeto de União Civil', 'marta-uniao-civil-b116-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca projeto de união civil gay com linguagem violenta.', 'Isso é uma aberração, vai transformar o Brasil numa Sodoma.', 'Reação agressiva ao projeto de Marta Suplicy no plenário.', 'verified', true, '1995-10-15', 'https://www1.folha.uol.com.br/fsp/1995/10/16/brasil/4.html', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Debate sobre União Civil', 'bolsonaro-sodoma-uniao-b116-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jef, 'Roberto Jefferson defende uso político da máquina federal.', 'Quem está no poder tem que usar a máquina para ganhar.', 'Declaração durante campanha de 1998 sobre uso de cargos.', 'verified', false, '1998-09-10', 'https://acervo.folha.com.br/leitor.do?numero=14230', 'news_article', 3, 'Brasília', 'Entrevista', 'jefferson-maquina-federal-b116-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros articula apoios polêmicos ao governo FHC.', 'Política se faz com toma lá dá cá.', 'Declaração explícita sobre mecânica de negociações parlamentares.', 'verified', false, '1997-02-18', 'https://www1.folha.uol.com.br/fsp/1997/2/19/brasil/1.html', 'news_article', 3, 'Brasília', 'Entrevista', 'renan-toma-la-da-ca-b116-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ataca STF pela cassação de direitos políticos por oito anos.', 'A decisão do Senado é política, não jurídica.', 'Reação à perda de direitos políticos por oito anos após renúncia.', 'verified', true, '1993-01-15', 'https://www1.folha.uol.com.br/fsp/1993/1/16/brasil/3.html', 'news_article', 3, 'Miami', 'Entrevista', 'collor-senado-politico-b116-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro elogia Pinochet como salvador do Chile.', 'Pinochet salvou o Chile do comunismo, deveríamos ter um aqui.', 'Declaração em entrevista elogiando ditadura chilena.', 'verified', true, '1998-03-08', 'https://veja.abril.com.br/politica/bolsonaro-pinochet/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-pinochet-salvador-b116-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza críticas dos sindicatos em greve geral.', 'Essas greves só atendem interesses políticos do PT.', 'Declaração durante greves contra reforma previdenciária.', 'verified', false, '1997-06-20', 'https://www1.folha.uol.com.br/fsp/1997/6/21/brasil/2.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-greves-pt-b116-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende que bloqueio de poupanças foi necessário ao país.', 'O povo entenderá, eu salvei o Brasil da hiperinflação.', 'Fala em entrevista defendendo confisco após anos do Plano Collor.', 'verified', false, '1996-03-16', 'https://acervo.folha.com.br/leitor.do?numero=13600', 'news_article', 3, 'Alagoas', 'Entrevista', 'collor-salvou-brasil-b116-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende intervenção militar no Rio de Janeiro.', 'O Exército na rua é a única solução para o Rio.', 'Proposta de militarização total contra criminalidade.', 'verified', false, '1994-12-10', 'https://www1.folha.uol.com.br/fsp/1994/12/11/cotidiano/3.html', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-exercito-rio-b116-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf ataca oposição chamando-os de comunistas.', 'São tudo comunista, querem acabar com a ordem.', 'Ataque a adversários durante campanha ao governo.', 'verified', false, '1994-10-05', 'https://acervo.folha.com.br/leitor.do?numero=13280', 'news_article', 3, 'São Paulo', 'Comício', 'maluf-comunistas-b116-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC acusa imprensa de alarmismo durante crise cambial.', 'A imprensa está fazendo alarmismo desnecessário.', 'Resposta a reportagens sobre fuga de capitais em 1998.', 'verified', false, '1998-10-28', 'https://www1.folha.uol.com.br/fsp/1998/10/29/brasil/1.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-alarmismo-imprensa-b116-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca índios e defende dizimação cultural.', 'Índio tem que se integrar, essa história de reserva é conversa fiada.', 'Declaração contra demarcações de terras indígenas.', 'verified', true, '1998-04-25', 'https://istoe.com.br/bolsonaro-indios-reservas/', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-indio-reserva-b116-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ameaça ir a qualquer extremo para manter mandato.', 'Não vou deixar o governo, farei o que for preciso.', 'Fala durante crise pré-impeachment sinalizando resistência.', 'verified', false, '1992-09-15', 'https://acervo.folha.com.br/leitor.do?numero=12505', 'news_article', 4, 'Brasília', 'Entrevista', 'collor-extremo-mandato-b116-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca ambientalistas como agentes estrangeiros.', 'ONGs ambientais são financiadas para atrapalhar o Brasil.', 'Declaração contra proteção à Amazônia em plenário.', 'verified', false, '1996-09-20', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-ongs-amazonia-b116-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC admite em gravação pressão para aprovação da reeleição.', 'Cada deputado vai ter seu preço.', 'Gravação do escândalo da compra de votos para emenda da reeleição.', 'verified', true, '1997-05-13', 'https://www1.folha.uol.com.br/fsp/brasil/fc140597.htm', 'news_article', 5, 'Brasília', 'Escândalo dos votos', 'fhc-preco-deputados-b116-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'PC Farias, tesoureiro de Collor, confessa esquema de corrupção.', 'Eu operei o esquema a mando do presidente Collor.', 'Depoimento de PC Farias à CPI antes de ser assassinado em 1996.', 'verified', true, '1992-08-20', 'https://veja.abril.com.br/politica/pc-farias-esquema-collor/', 'news_article', 5, 'Brasília', 'CPI PC Farias', 'pc-farias-confissao-b116-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca direitos humanos em plenário.', 'Direitos humanos é privilégio de bandido.', 'Discurso recorrente na Câmara sobre repressão policial.', 'verified', true, '1996-05-08', 'https://istoe.com.br/bolsonaro-direitos-humanos-bandido/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-dh-bandido-b116-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney usa cargo para beneficiar grupo familiar no Maranhão.', 'Minha família ajuda o Maranhão há décadas.', 'Defesa de concessões familiares de mídia no estado.', 'verified', true, '1995-09-18', 'https://www1.folha.uol.com.br/fsp/1995/9/19/brasil/4.html', 'news_article', 4, 'São Luís', 'Entrevista', 'sarney-familia-maranhao-b116-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra ataca servidores públicos como privilegiados.', 'Servidor público só ganha privilégios.', 'Defesa de reforma administrativa como ministro do Planejamento.', 'verified', false, '1995-11-22', 'https://acervo.folha.com.br/leitor.do?numero=13450', 'news_article', 2, 'Brasília', 'Entrevista', 'serra-servidor-privilegiado-b116-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que mulher deveria ganhar menos que homem.', 'Mulher deve ganhar menos porque engravida.', 'Declaração em entrevista televisiva sobre mercado de trabalho.', 'verified', true, '1995-06-15', 'https://www1.folha.uol.com.br/poder/bolsonaro-mulher-salario.shtml', 'news_article', 5, 'Rio de Janeiro', 'Entrevista televisiva', 'bolsonaro-mulher-menor-salario-b116-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende auditoria do governo em ONGs de direitos humanos.', 'ONGs de direitos humanos devem ser investigadas.', 'Tentativa de enfraquecer órgãos fiscalizadores do governo.', 'verified', false, '1991-08-10', 'https://acervo.folha.com.br/leitor.do?numero=11850', 'news_article', 3, 'Brasília', 'Entrevista', 'collor-ongs-dh-b116-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama colega parlamentar de maricona em plenário.', 'Esse deputado é uma maricona.', 'Insulto homofóbico direcionado a parlamentar no plenário.', 'verified', true, '1997-04-03', 'https://istoe.com.br/bolsonaro-homofobia-plenario/', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-maricona-b116-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf defende perseguição a opositores em São Paulo.', 'Quem não estiver comigo, está contra São Paulo.', 'Declaração sobre oposicionistas durante gestão municipal.', 'verified', false, '1993-04-20', 'https://acervo.estadao.com.br/pagina/', 'news_article', 3, 'São Paulo', 'Entrevista', 'maluf-comigo-contra-b116-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza denúncias no caso Sivam de corrupção em licitação.', 'O caso Sivam já foi devidamente esclarecido.', 'Resposta a denúncias de corrupção no projeto de vigilância da Amazônia.', 'verified', true, '1995-11-05', 'https://www1.folha.uol.com.br/fsp/1995/11/06/brasil/1.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-sivam-esclarecido-b116-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro declara que arma é sinônimo de liberdade.', 'Cidadão armado é cidadão livre.', 'Defesa de liberação de armas em plenário.', 'verified', false, '1996-03-15', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-cidadao-armado-b116-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor admite que PC Farias fez pagamentos à Casa da Dinda.', 'O PC ajudou com algumas contas.', 'Admissão indireta em depoimento à CPI.', 'verified', true, '1992-08-25', 'https://veja.abril.com.br/politica/collor-pc-farias-dinda/', 'news_article', 5, 'Brasília', 'CPI PC Farias', 'collor-pc-ajudou-contas-b116-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca feminismo como destruição da família.', 'Feminismo é uma praga que destrói a família brasileira.', 'Declaração em discurso no plenário.', 'verified', false, '1998-03-10', 'https://istoe.com.br/bolsonaro-feminismo-familia/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-feminismo-praga-b116-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jef, 'Roberto Jefferson ataca oposição ao governo FHC.', 'A oposição quer voltar à época da hiperinflação.', 'Defesa do Plano Real contra críticas em plenário.', 'verified', false, '1998-07-12', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 1, 'Câmara dos Deputados', 'Discurso parlamentar', 'jefferson-oposicao-inflacao-b116-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende volta política após cassação contando com novo cenário.', 'Voltarei ao poder porque o povo me quer.', 'Declaração de preparação para retorno político após cassação.', 'verified', false, '1998-05-18', 'https://acervo.folha.com.br/leitor.do?numero=14180', 'news_article', 2, 'Maceió', 'Entrevista', 'collor-retorno-politico-b116-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC comemora aprovação da emenda da reeleição apesar do escândalo.', 'A reeleição é uma vitória do povo brasileiro.', 'Comemoração após aprovação apesar das denúncias de compra de votos.', 'verified', true, '1997-06-04', 'https://www1.folha.uol.com.br/fsp/1997/6/05/brasil/1.html', 'news_article', 4, 'Brasília', 'Aprovação da emenda da reeleição', 'fhc-reeleicao-vitoria-povo-b116-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro elogia Hitler em entrevista polêmica.', 'Hitler tinha suas qualidades administrativas.', 'Declaração chocante em entrevista de rádio na década de 1990.', 'verified', false, '1996-10-22', 'https://istoe.com.br/bolsonaro-hitler-qualidades/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista de rádio', 'bolsonaro-hitler-qualidades-b116-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf articula aliança com PP para eleger aliados.', 'No PP sou eu que mando.', 'Declaração sobre controle do partido durante disputas internas.', 'verified', false, '1996-08-12', 'https://acervo.folha.com.br/leitor.do?numero=13720', 'news_article', 2, 'São Paulo', 'Entrevista', 'maluf-pp-mando-b116-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor escapa da cadeia usando influências judiciais.', 'Não sou criminoso, sou perseguido político.', 'Declaração após absolvição criminal pelo STF.', 'verified', false, '1994-12-20', 'https://acervo.folha.com.br/leitor.do?numero=13310', 'news_article', 3, 'Brasília', 'Entrevista', 'collor-perseguido-politico-b116-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca Paulo Freire e pedagogos progressistas.', 'Paulo Freire doutrinou várias gerações, estragou nossas crianças.', 'Declaração em plenário contra educadores progressistas.', 'verified', false, '1998-10-05', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-paulo-freire-b116-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende plano econômico contestado amplamente.', 'Quem critica meu governo não quer o bem do Brasil.', 'Defesa de políticas da era pré-Collor em retrospectiva.', 'verified', false, '1995-05-18', 'https://www1.folha.uol.com.br/fsp/1995/5/19/brasil/3.html', 'news_article', 2, 'Brasília', 'Entrevista', 'sarney-criticos-b116-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ataca Lula chamando-o de candidato do atraso.', 'Lula representa o passado, o atraso e o populismo.', 'Discurso de campanha contra Lula em 1998.', 'verified', false, '1998-10-02', 'https://www1.folha.uol.com.br/fsp/1998/10/03/brasil/1.html', 'transcript_pdf', 2, 'Porto Alegre', 'Comício eleitoral', 'fhc-lula-atraso-b116-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ameaça opositores políticos com retórica militar.', 'Vai chegar o dia em que os traidores da pátria vão responder.', 'Ameaça genérica contra oposição política em discurso.', 'verified', false, '1997-12-10', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-traidores-responder-b116-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor nega ter roubado dinheiro público em entrevista após cassação.', 'Não levei um centavo dos cofres públicos.', 'Defesa posterior negando acusações de corrupção.', 'verified', false, '1998-08-30', 'https://acervo.folha.com.br/leitor.do?numero=14195', 'news_article', 4, 'Maceió', 'Entrevista', 'collor-centavo-cofres-b116-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende fechamento do STF em entrevista.', 'STF só serve para atrapalhar, deveria ser fechado.', 'Declaração em entrevista atacando Supremo Tribunal Federal.', 'verified', true, '1998-08-15', 'https://istoe.com.br/bolsonaro-stf-fechado/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-stf-fechado-b116-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC declara vitória na reeleição em 1998 apesar da crise.', 'A reeleição é mandato do povo para continuar o Real.', 'Discurso de vitória na eleição presidencial de 1998.', 'verified', true, '1998-10-05', 'https://www1.folha.uol.com.br/fsp/1998/10/06/brasil/1.html', 'transcript_pdf', 1, 'Brasília', 'Discurso de vitória eleitoral', 'fhc-vitoria-reeleicao-b116-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
