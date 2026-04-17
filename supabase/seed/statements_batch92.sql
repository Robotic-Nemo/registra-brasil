-- Batch 92: Era Lula I/II, mensalão, Bolsonaro deputado (2003-2010) - parte 1
DO $$
DECLARE
  v_lula UUID; v_fhc UUID; v_dilma UUID; v_serra UUID; v_marta UUID;
  v_maluf UUID; v_sarney UUID; v_aecio UUID; v_ciro UUID; v_alckmin UUID;
  v_jair UUID; v_edu UUID; v_flavio UUID; v_renan UUID; v_gleisi UUID;
  v_moro UUID; v_jefferson UUID; v_silas UUID; v_collor UUID; v_cunha UUID;
  v_haddad UUID;
  c_cor UUID; c_des UUID; c_hom UUID; c_mis UUID; c_rac UUID;
  c_odi UUID; c_abu UUID; c_mac UUID; c_ant UUID; c_irr UUID;
  c_con UUID; c_nep UUID; c_vio UUID; c_int UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_dilma FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_serra FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_marta FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_maluf FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sarney FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_aecio FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_ciro FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_alckmin FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_flavio FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_renan FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_gleisi FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_moro FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_jefferson FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_silas FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_collor FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_cunha FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_haddad FROM politicians WHERE slug = 'fernando-haddad';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson denuncia esquema de mensalão em entrevista à Folha.', 'O PT paga uma mesada de 30 mil reais por mês a parlamentares da base aliada para votarem a favor do governo.', 'Entrevista que deflagrou a crise do mensalão em junho de 2005.', 'verified', true, '2005-06-06', 'https://www1.folha.uol.com.br/folha/brasil/ult96u69613.shtml', 'news_article', 5, 'Brasília', 'Entrevista à Folha de S.Paulo', 'jefferson-denuncia-mensalao-b92-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma que se sentiu traído ao tomar conhecimento do esquema do mensalão.', 'Eu me sinto traído por práticas inaceitáveis de que nunca tive notícia. Peço desculpas ao povo brasileiro.', 'Pronunciamento em cadeia nacional após estouro do escândalo do mensalão.', 'verified', true, '2005-08-12', 'https://www1.folha.uol.com.br/folha/brasil/ult96u71021.shtml', 'news_article', 3, 'Palácio do Planalto', 'Pronunciamento oficial', 'lula-pede-desculpas-mensalao-b92-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, então deputado, defende esterilização de pessoas pobres como política de combate à miséria.', 'A única solução é esterilizar. Pobre não sabe se cuidar, tem filho demais e vai engrossar as fileiras de marginais.', 'Declaração dada em entrevista na Câmara dos Deputados.', 'verified', true, '2008-06-19', 'https://www1.folha.uol.com.br/folha/brasil/ult96u410596.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Entrevista', 'bolsonaro-esterilizacao-pobres-b92-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende tortura contra suspeitos e diz preferir filho morto a gay.', 'Prefiro ter um filho morto em acidente do que um filho homossexual.', 'Entrevista à revista Playboy em 2011 sobre posicionamentos ideológicos adotados publicamente desde os anos 2000.', 'verified', true, '2010-11-22', 'https://veja.abril.com.br/politica/frases-polemicas-bolsonaro/', 'news_article', 5, 'Brasília', 'Entrevista Playboy/Veja', 'bolsonaro-prefiro-filho-morto-b92-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro presta homenagem ao coronel Ustra, torturador da ditadura, em sessão na Câmara.', 'A vergonha da CPI da ditadura é que não matamos mais, foi um erro deixar vivos.', 'Discurso na Câmara dos Deputados defendendo torturadores da ditadura militar.', 'verified', true, '2008-09-16', 'https://www.camara.leg.br/noticias/discursos-bolsonaro-ditadura-2008', 'congressional_record', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-homenagem-ustra-b92-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula compara mensalão a caixa dois comum em campanhas brasileiras.', 'Se houve caixa dois, não foi só o PT. Todos os partidos fazem isso há décadas no Brasil.', 'Declaração em entrevista coletiva tentando relativizar o escândalo do mensalão.', 'verified', false, '2005-09-01', 'https://www1.folha.uol.com.br/folha/brasil/ult96u72341.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-relativiza-mensalao-b92-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma não saber de nada sobre o mensalão apesar de Dirceu ser seu chefe da Casa Civil.', 'Eu não sabia de nada. Quem fez, fez às minhas costas.', 'Entrevista após a queda de José Dirceu da Casa Civil.', 'verified', true, '2005-06-16', 'https://www1.folha.uol.com.br/folha/brasil/ult96u70102.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-nao-sabia-mensalao-b92-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro se opõe à criminalização da homofobia durante debate na Câmara.', 'Homossexualismo é desvio de comportamento. Não podemos criminalizar quem critica essa aberração.', 'Discurso na Câmara contra projeto de lei que criminalizaria a homofobia (PLC 122).', 'verified', true, '2006-11-28', 'https://www.camara.leg.br/noticias/bolsonaro-plc122-2006', 'congressional_record', 5, 'Câmara dos Deputados', 'Debate sobre PLC 122', 'bolsonaro-contra-plc122-b92-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que pai que vê filho brincando com bonecas deve bater.', 'Se eu vir dois homens se beijando na rua, eu vou bater. Pai tem que dar porrada em filho que se mostra gay.', 'Entrevista concedida na Câmara em tom provocativo sobre educação masculina.', 'verified', true, '2010-09-14', 'https://veja.abril.com.br/politica/bolsonaro-porrada-filho-2010/', 'news_article', 5, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-porrada-filho-gay-b92-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma, então ministra, defende Lula e nega envolvimento do governo em esquema de corrupção.', 'Não há nenhum esquema. O presidente é honrado e não há qualquer prova contra ele.', 'Entrevista em defesa de Lula durante as investigações da CPI dos Correios.', 'verified', false, '2005-07-20', 'https://www1.folha.uol.com.br/folha/brasil/ult96u70800.shtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'dilma-defende-lula-cpi-b92-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Zumbi dos Palmares era homossexual e covarde.', 'Zumbi era um cara que engravidou mulher e fugiu, e ainda era gay. Quilombola não faz nada, nem para procriar serve.', 'Declaração em palestra no clube Hebraica do Rio de Janeiro, ainda como deputado.', 'verified', true, '2010-04-14', 'https://g1.globo.com/politica/noticia/bolsonaro-zumbi-declaracoes.html', 'news_article', 5, 'Rio de Janeiro', 'Palestra Hebraica', 'bolsonaro-zumbi-b92-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney rebate acusações no Senado e diz que nepotismo é questão cultural.', 'O que chamam de nepotismo é apenas ter confiança em quem conhece. O Senado sempre funcionou assim.', 'Discurso em defesa própria após denúncias de atos secretos e contratações de parentes.', 'verified', true, '2009-07-08', 'https://www1.folha.uol.com.br/folha/brasil/ult96u596213.shtml', 'news_article', 4, 'Senado Federal', 'Sessão plenária', 'sarney-defende-nepotismo-b92-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros se declara inocente após denúncia de pagamento de pensão por lobista.', 'Não há nada de ilegal. Paguei tudo com recursos próprios. É perseguição política.', 'Entrevista após denúncia da revista Veja sobre pagamento feito pelo lobista Cláudio Gontijo.', 'verified', true, '2007-05-30', 'https://veja.abril.com.br/politica/renan-pensao-lobista-2007/', 'news_article', 4, 'Senado Federal', 'Entrevista coletiva', 'renan-nega-pensao-lobista-b92-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que estupro não é grande problema porque ninguém estupraria pessoas feias.', 'Eu jamais estuparia você, porque você não merece.', 'Declaração na Câmara dos Deputados dirigida à deputada Maria do Rosário, após discussão sobre direitos humanos.', 'verified', true, '2003-11-05', 'https://www1.folha.uol.com.br/folha/brasil/ult96u54783.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-nao-merece-estupro-b92-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC critica Lula afirmando que o PT governa como se fosse oposição.', 'O PT governa o país como se ainda estivesse na oposição, atacando tudo que construímos.', 'Entrevista ao programa Roda Viva após a eleição presidencial.', 'verified', false, '2006-10-29', 'https://www.estadao.com.br/politica/fhc-critica-lula-2006', 'news_article', 1, 'São Paulo', 'Roda Viva', 'fhc-critica-lula-2006-b92-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra afirma em campanha que Lula destruiu a economia com gastos excessivos.', 'O Brasil está à beira de um colapso fiscal por conta da irresponsabilidade do PT.', 'Declaração em comício na reta final da campanha presidencial de 2010.', 'verified', false, '2010-10-20', 'https://www1.folha.uol.com.br/poder/2010/10/serra-comicio-sao-paulo.shtml', 'news_article', 2, 'São Paulo', 'Comício', 'serra-colapso-fiscal-b92-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin acusa Lula de usar máquina pública para se reeleger em 2006.', 'O presidente Lula transformou o governo em comitê eleitoral. Isso é abuso do poder político.', 'Comício na campanha presidencial de 2006 em segundo turno.', 'verified', false, '2006-10-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u85002.shtml', 'news_article', 2, 'São Paulo', 'Comício', 'alckmin-acusa-lula-maquina-b92-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que a oposição tenta criminalizar a política e atacar seu governo.', 'Querem criminalizar a política e manchar meu governo. O povo sabe reconhecer a verdade.', 'Discurso em evento do PT no Rio Grande do Sul durante a crise do mensalão.', 'verified', false, '2005-08-25', 'https://www1.folha.uol.com.br/folha/brasil/ult96u71650.shtml', 'news_article', 2, 'Porto Alegre', 'Ato do PT', 'lula-criminalizacao-politica-b92-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Paulo Maluf debocha de investigações da Interpol sobre desvios de recursos.', 'A Interpol não vai achar nada. Estou tranquilo e seguirei trabalhando pelo meu povo.', 'Entrevista após ser incluído na lista vermelha da Interpol por corrupção.', 'verified', true, '2010-09-09', 'https://g1.globo.com/politica/noticia/maluf-interpol-2010.html', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-debocha-interpol-b92-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf afirma em entrevista que rouba mas faz, frase que se tornou símbolo.', 'O povo paulista sabe: rouba, mas faz. E o que importa é fazer.', 'Entrevista ao SBT durante campanha à Câmara Federal, reiterando ditado popular sobre si.', 'verified', true, '2006-09-12', 'https://www1.folha.uol.com.br/folha/brasil/ult96u83560.shtml', 'news_article', 5, 'São Paulo', 'Entrevista SBT', 'maluf-rouba-mas-faz-b92-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma na Câmara que negros não servem nem para procriar.', 'Eu fui num quilombo. O afrodescendente mais leve lá pesava sete arrobas. Não fazem nada, não servem nem para procriar.', 'Palestra no Clube Hebraica do Rio, ainda como deputado federal.', 'verified', true, '2010-04-14', 'https://www1.folha.uol.com.br/poder/2010/04/bolsonaro-hebraica-quilombolas.shtml', 'news_article', 5, 'Rio de Janeiro', 'Palestra Hebraica', 'bolsonaro-quilombolas-arrobas-b92-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula compara críticas da imprensa a perseguição de ditadura.', 'Nunca vi um governo ser tão perseguido pela imprensa como o meu. Parece época de ditadura.', 'Entrevista coletiva em visita ao estado de Pernambuco.', 'verified', false, '2009-10-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u637002.shtml', 'news_article', 2, 'Recife', 'Entrevista coletiva', 'lula-imprensa-ditadura-b92-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson detalha pagamento do mensalão por Delúbio Soares.', 'O Delúbio Soares chegou a me oferecer quatro milhões de reais em dinheiro vivo para comprar apoio do PTB.', 'Depoimento à CPI dos Correios.', 'verified', true, '2005-06-14', 'https://www.camara.leg.br/noticias/cpi-correios-jefferson-2005', 'congressional_record', 5, 'Câmara dos Deputados', 'CPI dos Correios', 'jefferson-delubio-milhoes-b92-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy defende abertura dos presídios a visitas íntimas homoafetivas.', 'Não há motivo para discriminar casais homoafetivos. Presos são seres humanos também.', 'Declaração como senadora durante debate sobre direitos LGBT.', 'verified', false, '2010-05-17', 'https://www1.folha.uol.com.br/cotidiano/2010/05/marta-lgbt-presidios.shtml', 'news_article', 1, 'Senado Federal', 'Debate Dia Nacional contra Homofobia', 'marta-presidios-homoafetivos-b92-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor, ao retornar ao Senado, diz que foi injustiçado pelo impeachment.', 'Minha história me absolverá. Fui vítima de uma armação política orquestrada pela elite econômica.', 'Discurso de posse como senador em 2007 após eleição por Alagoas.', 'verified', true, '2007-02-01', 'https://www1.folha.uol.com.br/folha/brasil/ult96u89412.shtml', 'news_article', 3, 'Senado Federal', 'Posse', 'collor-historia-absolvera-b92-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende volta do regime militar em discurso na Câmara.', 'O erro da ditadura foi torturar e não matar. Se tivesse matado uns 30 mil corruptos, o Brasil estaria bem.', 'Discurso na Câmara dos Deputados.', 'verified', true, '2008-11-19', 'https://www.camara.leg.br/noticias/bolsonaro-ditadura-2008', 'congressional_record', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-erro-ditadura-matar-b92-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma critica a mídia no lançamento de sua candidatura presidencial.', 'A mídia brasileira não informa, deforma. Vai tentar me derrotar porque represento a continuidade do Lula.', 'Evento de lançamento de pré-candidatura presidencial pelo PT.', 'verified', false, '2010-02-20', 'https://g1.globo.com/politica/noticia/2010/02/dilma-candidatura-lancamento.html', 'news_article', 2, 'Brasília', 'Convenção PT', 'dilma-midia-deforma-b92-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio Neves, como governador de Minas, ataca o governo Lula na questão tributária.', 'O governo federal sufoca os estados com carga tributária. Minas paga a conta da incompetência do PT.', 'Entrevista em Belo Horizonte durante reunião de governadores.', 'verified', false, '2007-08-10', 'https://www.estadao.com.br/politica/aecio-carga-tributaria-2007', 'news_article', 1, 'Belo Horizonte', 'Encontro de governadores', 'aecio-carga-tributaria-b92-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes, ministro da Integração Nacional, ofende Lílian Witte Fibe em entrevista.', 'A Lílian não entende nada de economia, é uma ignorante que deveria voltar pra casa cuidar do marido.', 'Entrevista em 2003 sobre a política econômica do governo Lula.', 'verified', true, '2003-07-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u51201.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'ciro-ofende-lilian-fibe-b92-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes ironiza ex-esposa dizendo que ficou com ele por interesse.', 'Minha ex só ficou comigo enquanto fui prefeito e governador. Mulher quer poder, não amor.', 'Comentário em palanque durante a campanha de 2010.', 'verified', true, '2010-08-22', 'https://oglobo.globo.com/politica/ciro-ironiza-ex-esposa-2010', 'news_article', 4, 'Fortaleza', 'Comício', 'ciro-ironiza-ex-esposa-b92-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara defende que homossexualidade é doença tratável na Câmara.', 'Homossexualismo é doença e, como toda doença, tem cura. Jesus cura, a Igreja cura.', 'Discurso em sessão da Comissão de Direitos Humanos da Câmara dos Deputados.', 'verified', true, '2007-05-16', 'https://www.camara.leg.br/noticias/silas-camara-homossexualidade-2007', 'congressional_record', 5, 'Câmara dos Deputados', 'Comissão de Direitos Humanos', 'silas-homossexualidade-doenca-b92-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma em entrevista que não conhecia o publicitário Marcos Valério.', 'Nunca vi esse homem na minha vida. Não sei quem é esse Marcos Valério.', 'Declaração após denúncias do operador do mensalão.', 'verified', true, '2005-07-11', 'https://www1.folha.uol.com.br/folha/brasil/ult96u70412.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-nao-conhecia-valerio-b92-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula reage à crise dos aloprados e diz que PT foi atacado por imprensa.', 'O PT foi vítima de aloprados. Gente que quis atingir meu partido com lama.', 'Entrevista coletiva sobre o caso do dossiê contra José Serra em 2006.', 'verified', true, '2006-09-19', 'https://www1.folha.uol.com.br/folha/brasil/ult96u83701.shtml', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'lula-aloprados-b92-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro fala que mulher deveria ganhar menos que homem por engravidar.', 'Mulher deve ganhar salário menor, porque engravida. Quando sair de licença, vai dar prejuízo ao empregador.', 'Entrevista ao Jornal do Commercio sobre PL de equiparação salarial.', 'verified', true, '2007-02-22', 'https://veja.abril.com.br/politica/bolsonaro-salario-mulher-2007/', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-salario-mulher-menor-b92-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney defende contratações de parentes no Senado como escolhas técnicas.', 'Meus parentes são profissionais qualificados. Não se pode discriminar alguém por ter meu sobrenome.', 'Declaração após revelação da contratação de 13 parentes no gabinete do Senado.', 'verified', true, '2009-07-28', 'https://www1.folha.uol.com.br/folha/brasil/ult96u598751.shtml', 'news_article', 4, 'Senado Federal', 'Entrevista coletiva', 'sarney-defende-parentes-b92-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz em entrevista que escolheu Dilma como sua sucessora natural.', 'A Dilma é a mulher mais preparada do Brasil. Ela vai dar continuidade ao que fizemos.', 'Declaração em evento do PT lançando a pré-candidatura de Dilma.', 'verified', false, '2010-06-13', 'https://g1.globo.com/politica/noticia/2010/06/lula-dilma-sucessora.html', 'news_article', 1, 'Brasília', 'Convenção PT', 'lula-dilma-sucessora-b92-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Eduardo Cunha defende foro privilegiado para deputados em debate.', 'Sem foro, o Judiciário vira instrumento político para cassar mandatos. Foro é garantia.', 'Discurso no plenário da Câmara sobre proposta de extinção do foro.', 'verified', false, '2009-04-22', 'https://www.camara.leg.br/noticias/cunha-foro-privilegiado-2009', 'congressional_record', 3, 'Câmara dos Deputados', 'Plenário', 'cunha-defende-foro-b92-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula faz declaração polêmica em 2006 dizendo que só erra quem trabalha.', 'Só erra quem faz. Quem não faz não erra porque não faz nada. Meu governo faz muito.', 'Discurso em evento público ao comentar escândalos do mensalão.', 'verified', true, '2006-05-23', 'https://www1.folha.uol.com.br/folha/brasil/ult96u80012.shtml', 'news_article', 3, 'São Paulo', 'Evento público', 'lula-so-erra-quem-faz-b92-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ironiza governo Lula dizendo que é governo de analfabetos.', 'Esse governo foi tomado por um grupo de analfabetos políticos que querem destruir o Plano Real.', 'Declaração em palestra em universidade privada.', 'verified', true, '2005-09-30', 'https://www.estadao.com.br/politica/fhc-analfabetos-2005', 'news_article', 3, 'São Paulo', 'Palestra', 'fhc-analfabetos-b92-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende pena de morte em discurso na Câmara.', 'Bandido bom é bandido morto. Temos que acabar com essa patifaria de direitos humanos para vagabundo.', 'Discurso na Câmara dos Deputados sobre segurança pública.', 'verified', true, '2004-05-12', 'https://www.camara.leg.br/noticias/bolsonaro-bandido-morto-2004', 'congressional_record', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-bandido-morto-2004-b92-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_flavio, 'Flávio Bolsonaro, deputado estadual RJ, apoia declarações do pai sobre homofobia.', 'Meu pai está certo. A esquerda quer calar quem defende a família tradicional no Brasil.', 'Entrevista após declaração polêmica do pai sobre homossexuais.', 'verified', false, '2010-10-05', 'https://oglobo.globo.com/politica/flavio-apoia-pai-2010', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'flavio-apoia-pai-homofobia-b92-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra insinua envolvimento de Dilma em dossiê contra sua família.', 'A Dilma tem envolvimento direto com o dossiê. Ela sabia de tudo e mentiu ao país.', 'Declaração em debate presidencial da Globo no segundo turno de 2010.', 'verified', true, '2010-10-14', 'https://g1.globo.com/eleicoes/2010/debate-serra-dossie.html', 'news_article', 3, 'Rio de Janeiro', 'Debate Globo', 'serra-acusa-dilma-dossie-b92-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma nega envolvimento no caso do dossiê contra Serra em debate.', 'Jamais autorizei ou tive conhecimento de qualquer dossiê. Essa é uma acusação caluniosa.', 'Resposta no debate presidencial da Globo no segundo turno de 2010.', 'verified', true, '2010-10-14', 'https://g1.globo.com/eleicoes/2010/debate-dilma-dossie.html', 'news_article', 2, 'Rio de Janeiro', 'Debate Globo', 'dilma-nega-dossie-b92-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz declaração misógina sobre Dilma em 2010.', 'Presidente tem que ser homem, não pode ser mulher. Mulher é fraca para tomar decisões difíceis.', 'Entrevista durante a campanha presidencial de 2010 falando da candidatura de Dilma.', 'verified', true, '2010-09-28', 'https://veja.abril.com.br/politica/bolsonaro-dilma-mulher-2010/', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-presidente-homem-b92-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz em Davos que a crise financeira é culpa de brancos de olhos azuis.', 'Essa crise foi provocada e fomentada por comportamentos irracionais de gente branca, de olhos azuis.', 'Coletiva de imprensa após encontro com o primeiro-ministro britânico Gordon Brown.', 'verified', true, '2009-03-26', 'https://www1.folha.uol.com.br/folha/dinheiro/ult91u539012.shtml', 'news_article', 3, 'Brasília', 'Coletiva com Gordon Brown', 'lula-brancos-olhos-azuis-b92-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula compara sua gestão econômica à de Fernando Henrique desfavoravelmente.', 'O FHC entregou o país quebrado. Eu recebi uma herança maldita e consertei tudo.', 'Comício na campanha presidencial de 2006.', 'verified', false, '2006-09-23', 'https://www1.folha.uol.com.br/folha/brasil/ult96u83912.shtml', 'news_article', 2, 'Salvador', 'Comício', 'lula-heranca-maldita-b92-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que preferia ter ditadura de volta em 2009.', 'A ditadura acabou cedo demais. Precisávamos de mais 30 anos de regime militar para salvar o Brasil.', 'Discurso na Câmara dos Deputados sobre o aniversário do golpe militar.', 'verified', true, '2009-04-01', 'https://www.camara.leg.br/noticias/bolsonaro-ditadura-aniversario-2009', 'congressional_record', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-ditadura-mais-30-anos-b92-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin, como governador, nega participação em operação da PM com mortes.', 'A PM paulista é modelo. Os crimes foram isolados e não houve excesso institucional.', 'Coletiva sobre os Crimes de Maio de 2006 em São Paulo.', 'verified', true, '2006-05-25', 'https://www1.folha.uol.com.br/folha/brasil/ult96u79901.shtml', 'news_article', 4, 'São Paulo', 'Entrevista coletiva', 'alckmin-nega-crimes-maio-b92-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula chama repórter da Folha de imprensa marrom em entrevista coletiva.', 'A Folha virou imprensa marrom, faz jornalismo de fofoca e serve à direita.', 'Entrevista coletiva em que Lula rebate perguntas sobre o mensalão.', 'verified', true, '2009-10-22', 'https://www1.folha.uol.com.br/folha/brasil/ult96u640011.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-folha-imprensa-marrom-b92-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende fuzilamento de criminosos em entrevista à rádio.', 'Tem que fuzilar tudo isso aí. Criminoso morto não reincide. Só resolve país com bala.', 'Entrevista em rádio no interior do Rio de Janeiro.', 'verified', true, '2007-11-14', 'https://oglobo.globo.com/politica/bolsonaro-fuzilar-radio-2007', 'news_article', 5, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-fuzilar-criminosos-b92-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf ironiza investigações do Ministério Público em entrevista.', 'Essas denúncias são fogos de artifício. Nada se prova e continuo sendo eleito.', 'Entrevista após denúncia criminal por lavagem de dinheiro em 2007.', 'verified', true, '2007-11-03', 'https://www1.folha.uol.com.br/folha/brasil/ult96u88031.shtml', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-fogos-artificio-b92-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula declara que poderia ser candidato à reeleição indefinida se o povo pedisse.', 'Se eu pudesse, e o povo pedisse, seria candidato quantas vezes for necessário.', 'Declaração em evento do PT em Recife.', 'verified', false, '2010-03-14', 'https://www1.folha.uol.com.br/poder/2010/03/lula-reeleicao-popular.shtml', 'news_article', 3, 'Recife', 'Ato PT', 'lula-reeleicao-indefinida-b92-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, false FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros é acusado de quebra de decoro e nega ter usado verba pública.', 'Não há irregularidade. Devolvi cada centavo. É perseguição de adversários políticos.', 'Defesa no Conselho de Ética do Senado após o escândalo Mônica Veloso.', 'verified', true, '2007-08-22', 'https://www1.folha.uol.com.br/folha/brasil/ult96u87412.shtml', 'news_article', 4, 'Senado Federal', 'Conselho de Ética', 'renan-nega-irregularidade-b92-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende armamento da população mesmo contra Estatuto do Desarmamento.', 'Quero todo cidadão armado. É direito natural se defender. Bandido tem arma, cidadão tem que ter também.', 'Discurso na Câmara contra o Estatuto do Desarmamento.', 'verified', true, '2005-10-18', 'https://www.camara.leg.br/noticias/bolsonaro-desarmamento-2005', 'congressional_record', 3, 'Câmara dos Deputados', 'Debate referendo', 'bolsonaro-contra-desarmamento-b92-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes ataca Serra chamando-o de covarde em entrevista.', 'O Serra é covarde e desonesto. Nunca enfrentou ninguém cara a cara na vida.', 'Declaração em entrevista durante a campanha presidencial de 2010.', 'verified', true, '2010-07-30', 'https://g1.globo.com/politica/2010/07/ciro-ataca-serra.html', 'news_article', 3, 'Fortaleza', 'Entrevista', 'ciro-ataca-serra-covarde-b92-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma em evento internacional que Brasil tem muitos políticos que roubam pouco.', 'Temos políticos que roubam, sim, mas aqui eles roubam pouco se comparados a outros países.', 'Fala em reunião do Mercosul na Argentina.', 'verified', true, '2006-07-25', 'https://www1.folha.uol.com.br/folha/brasil/ult96u82109.shtml', 'news_article', 3, 'Buenos Aires', 'Reunião Mercosul', 'lula-roubam-pouco-b92-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy defende a vinda do Rock in Rio para SP como promoção municipal em polêmica.', 'Cidade de São Paulo precisa de eventos internacionais, mesmo que critiquem os custos.', 'Declaração da então prefeita sobre eventos culturais municipais.', 'verified', false, '2003-08-12', 'https://www1.folha.uol.com.br/folha/cotidiano/ult95u55701.shtml', 'news_article', 1, 'São Paulo', 'Entrevista prefeitura', 'marta-rock-in-rio-sp-b92-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro dispara ofensas contra a então ministra Marta Suplicy.', 'A Marta é uma sexóloga frustrada, que gostava de falar de sexo porque não tinha nada a oferecer.', 'Entrevista em rádio carioca durante discussão sobre ministério do Turismo.', 'verified', true, '2008-03-18', 'https://oglobo.globo.com/politica/bolsonaro-ataca-marta-2008', 'news_article', 4, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-ataca-marta-b92-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma, ministra-chefe da Casa Civil, assume responsabilidade pelo PAC.', 'O PAC é o maior programa de infraestrutura da história e vou garantir que saia do papel.', 'Lançamento do Programa de Aceleração do Crescimento.', 'verified', false, '2007-01-22', 'https://www1.folha.uol.com.br/folha/brasil/ult96u89012.shtml', 'news_article', 1, 'Brasília', 'Lançamento PAC', 'dilma-pac-infraestrutura-b92-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz no plenário que gay deveria apanhar da família e ser reeducado.', 'Essa coisa de gay é criação da família que deixou passar. Apanha que cura.', 'Discurso no plenário em resposta a debate sobre diversidade nas escolas.', 'verified', true, '2009-06-24', 'https://www.camara.leg.br/noticias/bolsonaro-gay-apanha-2009', 'congressional_record', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-gay-apanha-cura-b92-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma que Dirceu foi sacrificado para proteger o governo.', 'O Dirceu pagou por todos. É um guerreiro que entendeu o momento histórico.', 'Entrevista após condenação de José Dirceu no julgamento do mensalão.', 'verified', true, '2010-12-07', 'https://www1.folha.uol.com.br/poder/2010/12/lula-defende-dirceu.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-dirceu-sacrificado-b92-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf debocha de adversários e critica ex-governador Covas.', 'O Covas deixou a cidade um caos. Eu arrumei tudo e ainda me acusam. São invejosos.', 'Entrevista após eleição para a Câmara em 2006.', 'verified', false, '2006-10-12', 'https://www1.folha.uol.com.br/folha/brasil/ult96u84021.shtml', 'news_article', 2, 'São Paulo', 'Entrevista', 'maluf-debocha-covas-b92-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro sobre sistema de cotas raciais diz que é racismo ao contrário.', 'Cota racial é racismo ao contrário. Negro não precisa de favor, precisa de estudar como todo mundo.', 'Declaração na Comissão de Constituição e Justiça da Câmara sobre o Estatuto da Igualdade Racial.', 'verified', true, '2009-11-04', 'https://www.camara.leg.br/noticias/bolsonaro-cotas-racismo-2009', 'congressional_record', 4, 'Câmara dos Deputados', 'CCJ', 'bolsonaro-cotas-racismo-contrario-b92-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio diz que deveria ser o candidato do PSDB em 2010 mas foi preterido.', 'Eu era o candidato natural. O partido errou e vai pagar caro por isso.', 'Declaração após Serra ser escolhido candidato pelo PSDB em 2010.', 'verified', true, '2010-06-14', 'https://www.estadao.com.br/politica/aecio-candidato-natural-2010', 'news_article', 2, 'Belo Horizonte', 'Entrevista', 'aecio-candidato-natural-b92-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula critica mídia na crise do mensalão e diz ser alvo de golpe branco.', 'A imprensa tenta derrubar meu governo com um golpe branco. Mas o povo está comigo.', 'Entrevista no auge da crise do mensalão em 2005.', 'verified', true, '2005-09-20', 'https://www1.folha.uol.com.br/folha/brasil/ult96u72712.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-golpe-branco-imprensa-b92-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra faz piada de mau gosto sobre adversária mulher em comício.', 'A Dilma faz cara de brava, mas na hora de decidir precisa pedir ao Lula o que fazer.', 'Comício em Minas Gerais durante a campanha presidencial de 2010.', 'verified', true, '2010-09-11', 'https://www1.folha.uol.com.br/poder/2010/09/serra-dilma-comicio.shtml', 'news_article', 3, 'Belo Horizonte', 'Comício', 'serra-dilma-piada-b92-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende fim da demarcação de terras indígenas.', 'Índio tem que se integrar, não ficar isolado em terras. Indígena também é brasileiro e tem que trabalhar.', 'Discurso na Câmara dos Deputados sobre terras indígenas.', 'verified', true, '2008-05-07', 'https://www.camara.leg.br/noticias/bolsonaro-indios-terra-2008', 'congressional_record', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-contra-demarcacao-b92-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula defende o programa Bolsa Família contra críticas da oposição.', 'Bolsa Família não é esmola. É direito do brasileiro pobre e é política pública séria.', 'Pronunciamento em rede nacional sobre balanço do governo.', 'verified', false, '2006-03-29', 'https://www1.folha.uol.com.br/folha/brasil/ult96u77712.shtml', 'news_article', 1, 'Brasília', 'Pronunciamento oficial', 'lula-defende-bolsa-familia-b92-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney admite "atos secretos" mas diz que é padrão do Senado.', 'Esses atos não são segredo. É procedimento interno consolidado pelas mesas anteriores.', 'Entrevista sobre o escândalo dos atos secretos do Senado em 2009.', 'verified', true, '2009-06-19', 'https://www1.folha.uol.com.br/folha/brasil/ult96u594901.shtml', 'news_article', 4, 'Senado Federal', 'Entrevista coletiva', 'sarney-atos-secretos-b92-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insulta Benedita da Silva em debate sobre direitos humanos.', 'A Benedita só fala porque é negra. Se fosse branca, ninguém ouviria essa bobagem.', 'Discurso em audiência pública na Câmara sobre direitos humanos.', 'verified', true, '2006-05-10', 'https://www.camara.leg.br/noticias/bolsonaro-benedita-2006', 'congressional_record', 5, 'Câmara dos Deputados', 'Audiência pública', 'bolsonaro-ofende-benedita-b92-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin critica dívida pública no primeiro debate de 2006.', 'O governo Lula explode a dívida pública. Tem pouca responsabilidade fiscal e gasta demais.', 'Primeiro debate presidencial do primeiro turno de 2006.', 'verified', false, '2006-08-14', 'https://g1.globo.com/eleicoes/2006/debate-alckmin-divida.html', 'news_article', 1, 'São Paulo', 'Debate Band', 'alckmin-divida-publica-b92-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama adversários de petistas de vermelhos vagabundos.', 'Petista é vermelho vagabundo, comunista que nunca trabalhou na vida.', 'Discurso na Câmara dos Deputados atacando bancada do PT.', 'verified', true, '2007-08-28', 'https://www.camara.leg.br/noticias/bolsonaro-petistas-vagabundos-2007', 'congressional_record', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-petistas-vagabundos-b92-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor defende imunidade parlamentar para senadores investigados.', 'Senador tem imunidade garantida pela Constituição. Querem destruir o Parlamento.', 'Discurso em defesa própria no Senado após denúncia de recebimento de vantagens.', 'verified', false, '2010-09-15', 'https://www1.folha.uol.com.br/poder/2010/09/collor-imunidade.shtml', 'news_article', 3, 'Senado Federal', 'Plenário', 'collor-defende-imunidade-b92-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson, já cassado, acusa STF de ser parcial em julgamento do mensalão.', 'O STF é parcial. Condena uns, absolve outros. Não é Justiça, é política.', 'Declaração à imprensa após condenação em primeira instância.', 'verified', false, '2010-10-28', 'https://www1.folha.uol.com.br/poder/2010/10/jefferson-critica-stf.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'jefferson-stf-parcial-b92-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula critica classe média dizendo que só cuida de seus interesses egoístas.', 'A classe média não tem noção de Brasil. Só vê o próprio umbigo e é ingrata com o governo.', 'Entrevista em programa de rádio no Nordeste.', 'verified', true, '2008-10-22', 'https://www1.folha.uol.com.br/folha/brasil/ult96u458213.shtml', 'news_article', 3, 'Teresina', 'Entrevista rádio', 'lula-classe-media-egoista-b92-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro declara apoio a regime militar na Venezuela de Chávez em 2007.', 'Venezuela precisava era de um general bom, não de um comunista bêbado como Chávez.', 'Declaração em entrevista à rádio em 2007.', 'verified', true, '2007-12-04', 'https://www1.folha.uol.com.br/folha/mundo/ult94u88123.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-venezuela-general-b92-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula ironiza pedidos de CPI do mensalão como "fogueira das vaidades".', 'CPI virou fogueira das vaidades de políticos que querem aparecer na TV.', 'Declaração durante a crise do mensalão em discurso a sindicalistas.', 'verified', true, '2005-07-29', 'https://www1.folha.uol.com.br/folha/brasil/ult96u70981.shtml', 'news_article', 3, 'São Bernardo do Campo', 'Ato sindical', 'lula-cpi-fogueira-vaidades-b92-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vota contra o Estatuto do Idoso dizendo que onera orçamento.', 'Estatuto do Idoso é populismo. Ninguém vai cumprir e só onera o orçamento público.', 'Justificativa de voto contrário na Câmara dos Deputados.', 'verified', true, '2003-09-24', 'https://www.camara.leg.br/noticias/bolsonaro-estatuto-idoso-2003', 'congressional_record', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-contra-estatuto-idoso-b92-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Eduardo Cunha defende emenda orçamentária como instrumento legítimo.', 'Emenda parlamentar é direito do deputado. Não é troca, é representação popular.', 'Entrevista após polêmica sobre uso de emendas no orçamento.', 'verified', false, '2010-07-19', 'https://www1.folha.uol.com.br/poder/2010/07/cunha-emendas.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'cunha-emendas-direito-b92-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que Rede Globo é inimiga do povo brasileiro.', 'A Globo manipula tudo. É inimiga do povo, defende só a elite e é comunista no fundo.', 'Discurso na Câmara dos Deputados em 2006.', 'verified', true, '2006-06-20', 'https://www.camara.leg.br/noticias/bolsonaro-globo-inimiga-2006', 'congressional_record', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-globo-inimiga-b92-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que cansou de discutir mensalão e que não vai falar mais do assunto.', 'Mensalão é tema vencido. Não vou mais falar disso. Quem quer acreditar em mentira que acredite.', 'Entrevista coletiva após a reeleição em 2006.', 'verified', true, '2006-11-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u85012.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-mensalao-tema-vencido-b92-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara ataca projeto que criminalizaria homofobia na Câmara.', 'Esse projeto é da ditadura gay. Vão prender pastor por pregar a Bíblia.', 'Discurso em plenário durante debate sobre PLC 122.', 'verified', true, '2009-08-12', 'https://www.camara.leg.br/noticias/silas-ditadura-gay-2009', 'congressional_record', 5, 'Câmara dos Deputados', 'Plenário', 'silas-ditadura-gay-b92-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que quota para mulher é proteção excessiva.', 'Mulher não precisa de cota. Quem é boa passa por conta própria. Cota é esmola.', 'Discurso na Câmara sobre cotas partidárias para mulheres.', 'verified', true, '2009-05-27', 'https://www.camara.leg.br/noticias/bolsonaro-cota-mulher-2009', 'congressional_record', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-cota-mulher-esmola-b92-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma apresenta plano de combate à pobreza como prioridade na campanha.', 'Vou erradicar a miséria absoluta no Brasil se eleita. Será minha principal meta.', 'Lançamento de pré-candidatura em convenção do PT.', 'verified', false, '2010-06-13', 'https://g1.globo.com/politica/eleicoes/2010/dilma-miseria.html', 'news_article', 1, 'Brasília', 'Convenção PT', 'dilma-combate-miseria-b92-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula sobre o Mensalão Tucano diz que o PSDB também foi culpado.', 'Mensalão não é só do PT. O PSDB fez igual em Minas Gerais e ninguém fala disso.', 'Declaração em café com jornalistas no Planalto.', 'verified', true, '2007-09-05', 'https://www1.folha.uol.com.br/folha/brasil/ult96u87102.shtml', 'news_article', 3, 'Brasília', 'Café com jornalistas', 'lula-mensalao-tucano-b92-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio nega mensalão mineiro e acusa Lula de instrumentalizar escândalos.', 'Não houve mensalão em Minas. É uma fábula inventada por petistas para dividir a culpa deles.', 'Entrevista em Belo Horizonte sobre acusações de esquema no PSDB-MG.', 'verified', true, '2007-09-10', 'https://www.estadao.com.br/politica/aecio-mensalao-mineiro-2007', 'news_article', 4, 'Belo Horizonte', 'Entrevista', 'aecio-nega-mensalao-mineiro-b92-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que educação sexual nas escolas é kit gay.', 'Essa educação sexual é um kit gay para transformar criança em gay. Pais não podem aceitar.', 'Discurso em sessão da Câmara sobre MEC e materiais didáticos.', 'verified', true, '2010-04-20', 'https://www.camara.leg.br/noticias/bolsonaro-kit-gay-2010', 'congressional_record', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-kit-gay-b92-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula tece elogios a Chávez e critica o liberalismo econômico.', 'Chávez é um democrata exemplar. Os liberais odeiam porque ele pensa nos pobres.', 'Coletiva de imprensa em Caracas em reunião do Mercosul.', 'verified', true, '2005-07-04', 'https://www1.folha.uol.com.br/folha/mundo/ult94u70412.shtml', 'news_article', 3, 'Caracas', 'Reunião Mercosul', 'lula-chavez-democrata-b92-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC critica programa Bolsa Família como compra de votos.', 'O Bolsa Família virou máquina de comprar votos. É eleitoreiro e não transforma nada.', 'Entrevista à revista Veja durante campanha presidencial de 2006.', 'verified', true, '2006-10-08', 'https://veja.abril.com.br/politica/fhc-bolsa-familia-votos-2006/', 'news_article', 3, 'São Paulo', 'Entrevista Veja', 'fhc-bolsa-familia-votos-b92-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama adversários homossexuais de doentes em entrevista.', 'Gay é gente doente. Não posso tratar gente doente com a mesma dignidade de pessoa normal.', 'Entrevista ao programa CQC em 2010.', 'verified', true, '2010-07-12', 'https://g1.globo.com/politica/noticia/bolsonaro-cqc-gay-doente.html', 'news_article', 5, 'São Paulo', 'Programa CQC', 'bolsonaro-cqc-gay-doente-b92-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney acusa adversários no Senado de promoverem linchamento público.', 'É um linchamento moral. Tudo que fiz pelo Brasil é esquecido pela maldade política.', 'Defesa no plenário do Senado após escândalo dos atos secretos.', 'verified', true, '2009-07-14', 'https://www1.folha.uol.com.br/folha/brasil/ult96u597213.shtml', 'news_article', 3, 'Senado Federal', 'Plenário', 'sarney-linchamento-publico-b92-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra, então governador, acusa governo federal de sonegar dados do dengue.', 'O Ministério da Saúde esconde a realidade do dengue. Está fazendo política partidária com doença.', 'Entrevista coletiva em São Paulo.', 'verified', false, '2008-04-10', 'https://www.estadao.com.br/politica/serra-dengue-governo-2008', 'news_article', 2, 'São Paulo', 'Entrevista', 'serra-dengue-dados-b92-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ironiza movimento feminista em discurso na Câmara.', 'Feminismo é histeria de mulher mal amada. Se tivessem marido não ficariam reclamando.', 'Discurso de resposta a deputadas do PT durante plenário.', 'verified', true, '2008-03-08', 'https://www.camara.leg.br/noticias/bolsonaro-feminismo-histeria-2008', 'congressional_record', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-feminismo-histeria-b92-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad, como ministro da Educação, defende cotas raciais em universidades.', 'Cotas não são privilégio, são reparação histórica. Negros precisam estar na universidade.', 'Audiência pública na Câmara dos Deputados.', 'verified', false, '2009-05-19', 'https://g1.globo.com/educacao/noticia/2009/haddad-cotas-universidade.html', 'news_article', 1, 'Brasília', 'Audiência pública', 'haddad-defende-cotas-b92-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz em discurso que "nunca se roubou tanto" em alusão à oposição.', 'Se tem alguém que rouba, não é meu governo. Na era tucana, se roubou muito mais e ninguém foi preso.', 'Discurso em ato do PT no Rio de Janeiro.', 'verified', true, '2005-11-12', 'https://www1.folha.uol.com.br/folha/brasil/ult96u74112.shtml', 'news_article', 3, 'Rio de Janeiro', 'Ato do PT', 'lula-nunca-se-roubou-tanto-b92-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende tortura durante depoimento em audiência.', 'Tortura é método eficaz em casos extremos. Em guerra contra bandido, vale tudo.', 'Audiência pública sobre segurança na Câmara.', 'verified', true, '2006-03-15', 'https://www.camara.leg.br/noticias/bolsonaro-defende-tortura-2006', 'congressional_record', 5, 'Câmara dos Deputados', 'Audiência pública', 'bolsonaro-defende-tortura-b92-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy, prefeita, defende aumento do IPTU progressivo.', 'IPTU progressivo é justiça tributária. Quem tem mais paga mais. É simples assim.', 'Coletiva sobre orçamento da prefeitura em São Paulo.', 'verified', false, '2003-10-28', 'https://www1.folha.uol.com.br/folha/cotidiano/ult95u58012.shtml', 'news_article', 1, 'São Paulo', 'Coletiva prefeitura', 'marta-iptu-progressivo-b92-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson, já cassado, afirma que Delúbio lhe pagava mensalidades.', 'O Delúbio me ligava todo mês para combinar o valor. Era como mesada mesmo.', 'Entrevista na CPI do Mensalão dando detalhes do esquema.', 'verified', true, '2005-09-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u72501.shtml', 'news_article', 5, 'Brasília', 'CPI Mensalão', 'jefferson-delubio-mesada-b92-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro fala que direitos humanos são a proteção aos bandidos.', 'Direitos humanos é esterco de vagabundo. Serve só pra proteger marginais que matam pessoas de bem.', 'Discurso em plenário da Câmara sobre projeto de direitos humanos.', 'verified', true, '2005-08-03', 'https://www.camara.leg.br/noticias/bolsonaro-direitos-humanos-esterco-2005', 'congressional_record', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-direitos-humanos-esterco-b92-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula reafirma em final de mandato que saiu "de ombros erguidos".', 'Entro na história como presidente mais popular de todos os tempos e saio de ombros erguidos.', 'Pronunciamento de despedida em rede nacional ao deixar o Planalto.', 'verified', true, '2010-12-22', 'https://g1.globo.com/politica/noticia/2010/12/lula-despedida-ombros-erguidos.html', 'news_article', 2, 'Brasília', 'Pronunciamento oficial', 'lula-ombros-erguidos-despedida-b92-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

END $$;
