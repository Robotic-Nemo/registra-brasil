-- Batch 93: Era Lula I/II, mensalão, Bolsonaro deputado (2003-2010) - parte 2
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede intervenção militar durante discurso em 2010.', 'Precisamos do Exército nas ruas. Só os militares podem salvar o Brasil da roubalheira petista.', 'Discurso na Câmara dos Deputados atacando governo Lula.', 'verified', true, '2010-05-18', 'https://www.camara.leg.br/noticias/bolsonaro-intervencao-militar-2010', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-intervencao-militar-b93-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula defende Palocci após queda da Receita mostrar quebra de sigilo.', 'O Palocci é homem honrado. Vítima de perseguição política descarada de quem não aceita nossa vitória.', 'Entrevista coletiva após demissão de Antônio Palocci do Ministério da Fazenda.', 'verified', true, '2006-03-27', 'https://www1.folha.uol.com.br/folha/brasil/ult96u77601.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-defende-palocci-b93-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro atribui violência urbana a direitos humanos em entrevista.', 'Direitos humanos criaram esse caos. Bandido solto por direitos humanos mata gente honesta.', 'Entrevista ao Jornal Nacional sobre segurança pública.', 'verified', true, '2006-04-05', 'https://g1.globo.com/jornal-nacional/2006/bolsonaro-direitos-humanos-caos.html', 'news_article', 4, 'Rio de Janeiro', 'Jornal Nacional', 'bolsonaro-dh-caos-b93-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney rechaça oposição e chama movimento contra sua presidência de golpismo.', 'Querem me destituir? Que tentem! O Senado sabe a quem deve respeito. É golpe dos derrotados.', 'Discurso em defesa própria após movimento pela sua renúncia.', 'verified', true, '2009-07-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u597501.shtml', 'news_article', 3, 'Senado Federal', 'Plenário', 'sarney-golpismo-oposicao-b93-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama delegada mulher de despreparada durante audiência.', 'Mulher delegada é piada. Bandido ri na cara. Tem que ter homem de verdade em delegacia.', 'Audiência pública sobre segurança do Rio de Janeiro na Câmara.', 'verified', true, '2007-09-20', 'https://www.camara.leg.br/noticias/bolsonaro-mulher-delegada-2007', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Audiência pública', 'bolsonaro-mulher-delegada-b93-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma promete seguir modelo econômico do Lula se eleita.', 'Não vou mudar o rumo do país. Vou acelerar o que Lula começou. Temos uma rota vencedora.', 'Entrevista ao programa Jornal Nacional durante campanha de 2010.', 'verified', false, '2010-08-23', 'https://g1.globo.com/politica/eleicoes/2010/dilma-jornal-nacional.html', 'news_article', 1, 'Rio de Janeiro', 'Jornal Nacional', 'dilma-modelo-lula-b93-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma que o STF erraria ao condenar Dirceu e outros no mensalão.', 'Se o STF condenar meus companheiros, estará cometendo uma injustiça histórica contra os trabalhadores.', 'Entrevista à Folha antes do início do julgamento do mensalão.', 'verified', true, '2010-08-05', 'https://www1.folha.uol.com.br/poder/2010/08/lula-stf-erraria-mensalao.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-stf-erraria-mensalao-b93-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Eduardo Cunha lidera oposição evangélica contra projeto de diversidade no MEC.', 'Não permitiremos que o MEC de Haddad faça lavagem cerebral nas crianças brasileiras.', 'Discurso no plenário da Câmara sobre material didático sobre diversidade.', 'verified', true, '2010-11-10', 'https://www.camara.leg.br/noticias/cunha-mec-lavagem-2010', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'cunha-mec-lavagem-b93-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende intervenção federal no Rio em crise da segurança.', 'O Rio está tomado por bandidos. Precisamos de força militar. Se não der, que venham os tanques.', 'Discurso na Câmara sobre segurança no Rio.', 'verified', true, '2010-11-27', 'https://www.camara.leg.br/noticias/bolsonaro-tanques-rio-2010', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-tanques-rio-b93-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma em programa de TV que pobre não sabia o que era estádio.', 'Pobre antes do meu governo nem sabia o que era entrar num estádio. Agora pode comprar passagem e ir.', 'Entrevista ao programa Bom Dia Presidente em 2009.', 'verified', true, '2009-06-22', 'https://g1.globo.com/politica/noticia/2009/lula-pobre-estadio.html', 'news_article', 2, 'Brasília', 'Bom Dia Presidente', 'lula-pobre-estadio-b93-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf nega desvio de mais de 1 bilhão em obras do Túnel Ayrton Senna.', 'Não há prova alguma. São invenções de promotores em busca de holofote.', 'Entrevista após ação civil pública contra obras de sua gestão.', 'verified', true, '2005-05-18', 'https://www1.folha.uol.com.br/folha/brasil/ult96u68912.shtml', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-nega-desvios-tunel-b93-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama de bandidos ONGs que defendem direitos humanos.', 'Essas ONGs de direitos humanos são ninho de bandido. Vivem de defender criminoso.', 'Discurso na Câmara dos Deputados em 2006.', 'verified', true, '2006-07-25', 'https://www.camara.leg.br/noticias/bolsonaro-ongs-bandidos-2006', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-ongs-bandidos-b93-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin, como governador SP, defende ação da PM nos Crimes de Maio.', 'A PM reagiu a ataques criminosos. Qualquer governante faria o mesmo. Não há excesso a apurar.', 'Entrevista após 505 mortes em operações policiais em maio de 2006.', 'verified', true, '2006-06-15', 'https://www1.folha.uol.com.br/folha/cotidiano/ult95u80412.shtml', 'news_article', 5, 'São Paulo', 'Entrevista', 'alckmin-defende-pm-maio-2006-b93-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula se compara a Jesus Cristo em evento partidário.', 'Eu não sou Cristo, mas já fui crucificado várias vezes pela imprensa e sempre voltei.', 'Discurso em evento do PT em Pernambuco.', 'verified', true, '2009-08-29', 'https://www1.folha.uol.com.br/folha/brasil/ult96u621701.shtml', 'news_article', 2, 'Recife', 'Ato do PT', 'lula-comparacao-cristo-b93-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende o fim do Bolsa Família como política assistencialista.', 'Bolsa Família é compra de voto e só faz preguiçoso. Tem que acabar com isso.', 'Entrevista ao jornal O Globo em 2008.', 'verified', true, '2008-07-15', 'https://oglobo.globo.com/politica/bolsonaro-fim-bolsa-familia-2008', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-fim-bolsa-familia-b93-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes ataca eleitores de Serra chamando-os de ignorantes.', 'Quem vota em Serra é ignorante ou mal-intencionado. Não tem meio termo.', 'Comício em Fortaleza na campanha de 2010.', 'verified', true, '2010-09-25', 'https://www1.folha.uol.com.br/poder/2010/09/ciro-eleitor-serra-ignorante.shtml', 'news_article', 3, 'Fortaleza', 'Comício', 'ciro-eleitor-serra-ignorante-b93-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ironiza sucessão presidencial afirmando que Lula escolheu fantoche.', 'A Dilma é fantoche do Lula. Não vai governar, vai ser marionete.', 'Entrevista a colunistas em São Paulo durante a campanha de 2010.', 'verified', true, '2010-08-14', 'https://www.estadao.com.br/politica/fhc-dilma-fantoche-2010', 'news_article', 3, 'São Paulo', 'Entrevista', 'fhc-dilma-fantoche-b93-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende que criança tem que apanhar em escola para aprender.', 'Criança tem que apanhar, sim. Educação vem da família e vem da porrada quando precisa.', 'Entrevista em rádio do Rio de Janeiro.', 'verified', true, '2008-11-11', 'https://oglobo.globo.com/politica/bolsonaro-crianca-apanha-2008', 'news_article', 4, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-crianca-apanha-b93-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula ironiza denúncias sobre compra do dossiê contra Serra em 2006.', 'Esse tal dossiê é invenção. Se fosse verdade, a imprensa já teria mostrado.', 'Entrevista coletiva após operação da PF para desmontar esquema.', 'verified', true, '2006-09-21', 'https://www1.folha.uol.com.br/folha/brasil/ult96u83812.shtml', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'lula-ironiza-dossie-2006-b93-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro propõe castração química para estupradores em debate.', 'Estuprador tem que ser castrado quimicamente. Ou então condenado à morte.', 'Discurso na Câmara dos Deputados sobre projeto de lei.', 'verified', true, '2007-11-21', 'https://www.camara.leg.br/noticias/bolsonaro-castracao-quimica-2007', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-castracao-quimica-b93-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros renuncia à presidência do Senado mantendo mandato.', 'Renuncio à presidência, mas não ao Senado. Vou provar minha inocência como senador comum.', 'Discurso na renúncia à presidência do Senado.', 'verified', true, '2007-12-04', 'https://www1.folha.uol.com.br/folha/brasil/ult96u88701.shtml', 'news_article', 3, 'Senado Federal', 'Plenário', 'renan-renuncia-presidencia-b93-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende fim de reserva ambiental como obstáculo ao agronegócio.', 'Reserva ambiental é balela. Atrapalha o produtor rural e só beneficia ONG estrangeira.', 'Discurso na CCJ da Câmara dos Deputados.', 'verified', true, '2009-09-23', 'https://www.camara.leg.br/noticias/bolsonaro-reserva-ambiental-2009', 'transcript_pdf', 3, 'Câmara dos Deputados', 'CCJ', 'bolsonaro-reserva-balela-b93-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula chama senadores que investigam Sarney de fariseus em evento.', 'Esses senadores que hostilizam Sarney são fariseus que querem atacar o amigo do Brasil.', 'Discurso em evento com Sarney no Maranhão.', 'verified', true, '2009-07-22', 'https://www1.folha.uol.com.br/folha/brasil/ult96u598201.shtml', 'news_article', 3, 'São Luís', 'Evento público', 'lula-senadores-fariseus-b93-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro acusa imprensa de manipulação ao criticar Ustra.', 'Ustra era herói. A imprensa maldita distorce tudo para criminalizar militares patriotas.', 'Discurso em plenário em defesa do coronel Ustra.', 'verified', true, '2009-09-03', 'https://www.camara.leg.br/noticias/bolsonaro-ustra-heroi-2009', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-ustra-heroi-b93-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta, como ministra do Turismo, defende orçamento bilionário do setor.', 'O Turismo precisa de investimento público. Não é luxo, é indústria que gera emprego.', 'Audiência na Câmara defendendo proposta orçamentária.', 'verified', false, '2008-09-30', 'https://www1.folha.uol.com.br/folha/dinheiro/ult91u445412.shtml', 'news_article', 1, 'Brasília', 'Audiência pública', 'marta-orcamento-turismo-b93-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz piada dizendo que seu filho não vira gay porque foi educado.', 'Meus filhos não serão gays porque tiveram educação. Isso é escolha, é ambiente.', 'Entrevista na Câmara sobre educação familiar.', 'verified', true, '2010-06-12', 'https://veja.abril.com.br/politica/bolsonaro-filhos-gays-2010/', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-filhos-educacao-gay-b93-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que Palocci não precisa se explicar à CPMI do Banestado.', 'O Palocci não precisa explicar nada. Ele sabe o que faz, é competente, honrado.', 'Declaração em evento durante a crise da quebra de sigilo do caseiro Francenildo.', 'verified', true, '2006-03-20', 'https://www1.folha.uol.com.br/folha/brasil/ult96u77312.shtml', 'news_article', 4, 'Brasília', 'Evento público', 'lula-palocci-nao-explica-b93-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende sanção da lei que proibia ensino de ciências de gênero.', 'Escola não é lugar de falar de gênero. Isso é perversão pedagógica.', 'Entrevista após PL estadual em 2010.', 'verified', true, '2010-03-10', 'https://g1.globo.com/politica/noticia/bolsonaro-genero-escola-2010.html', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-genero-escola-b93-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma afirma que seu governo combaterá aborto mantendo legislação.', 'Sou pessoalmente contra aborto. Mas como presidente respeitarei a lei vigente.', 'Entrevista durante campanha presidencial em 2010 a veículos evangélicos.', 'verified', true, '2010-10-20', 'https://g1.globo.com/politica/eleicoes/2010/dilma-aborto.html', 'news_article', 2, 'Brasília', 'Entrevista', 'dilma-aborto-lei-b93-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio, como governador MG, é acusado de usar aeroporto estadual para voos privados.', 'Sou governador, tenho direito a usar recursos do Estado para funções oficiais. Não há irregularidade.', 'Entrevista após reportagem sobre uso do aeroporto de Cláudio.', 'verified', true, '2009-10-05', 'https://veja.abril.com.br/politica/aecio-aeroporto-claudio-2009/', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'aecio-aeroporto-claudio-b93-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica Lula por distribuir Bolsa Família em discurso na Câmara.', 'O Lula compra voto com Bolsa Família. Pobre passa a ser refém do governo e vota de barriga.', 'Discurso no plenário da Câmara em 2006.', 'verified', true, '2006-09-29', 'https://www.camara.leg.br/noticias/bolsonaro-bolsa-familia-2006', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-bolsa-voto-2006-b93-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula debocha de pesquisa que mostrava desgaste do governo.', 'Pesquisa é coisa de IBOPE pago. A verdadeira pesquisa é nas ruas, com o povo pobre.', 'Entrevista durante crise do mensalão em 2005.', 'verified', true, '2005-08-30', 'https://www1.folha.uol.com.br/folha/brasil/ult96u71901.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-pesquisa-ibope-pago-b93-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em entrevista polêmica, diz que mulheres não deveriam votar.', 'Mulher não deveria votar. Não entende de política, vota em qualquer um que fala bonito.', 'Entrevista concedida a programa de rádio em 2009.', 'verified', true, '2009-10-15', 'https://veja.abril.com.br/politica/bolsonaro-mulher-nao-votar-2009/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-mulher-nao-votar-b93-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende privatizações de sua era contra críticas do PT.', 'As privatizações modernizaram o Brasil. O PT chama de entrega, mas foi salvação.', 'Palestra na FGV em 2008 sobre legado de seu governo.', 'verified', false, '2008-09-12', 'https://www.estadao.com.br/politica/fhc-privatizacoes-fgv-2008', 'news_article', 1, 'São Paulo', 'Palestra FGV', 'fhc-privatizacoes-fgv-b93-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia ditadura argentina em entrevista.', 'A Argentina fez melhor. Matou mais e limpou o país. Aqui faltou coragem para matar mais.', 'Entrevista em rádio do Rio de Janeiro em 2005.', 'verified', true, '2005-09-29', 'https://oglobo.globo.com/politica/bolsonaro-ditadura-argentina-2005', 'news_article', 5, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-ditadura-argentina-b93-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra, governador SP, defende modelo de privatização de linhas de metrô.', 'A parceria privada é modelo eficiente. Vai dar ao paulistano metrô de primeiro mundo.', 'Coletiva sobre leilão da Linha 4-Amarela do Metrô.', 'verified', false, '2007-05-22', 'https://www.estadao.com.br/politica/serra-metro-linha-4', 'news_article', 1, 'São Paulo', 'Coletiva', 'serra-metro-privatizacao-b93-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ofende Marta Suplicy chamando-a de vagabunda em plenário.', 'Essa vagabunda da Marta virou ministra para receber dinheiro do contribuinte sem trabalhar.', 'Discurso no plenário da Câmara dos Deputados em 2008.', 'verified', true, '2008-04-15', 'https://www.camara.leg.br/noticias/bolsonaro-marta-vagabunda-2008', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-marta-vagabunda-b93-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula critica a Lei de Responsabilidade Fiscal como amarra neoliberal.', 'Essa LRF é amarra neoliberal que impede o governo de fazer política social.', 'Entrevista em 2010 em evento do PT em São Paulo.', 'verified', false, '2010-08-10', 'https://www1.folha.uol.com.br/poder/2010/08/lula-critica-lrf.shtml', 'news_article', 2, 'São Paulo', 'Evento PT', 'lula-critica-lrf-b93-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende punições físicas em escolas militares.', 'Escola militar é para formar homem. Tem que ter castigo físico, exercícios pesados. Isso forma caráter.', 'Entrevista à rádio sobre defesa do modelo militar.', 'verified', true, '2007-07-20', 'https://oglobo.globo.com/politica/bolsonaro-escola-militar-2007', 'news_article', 3, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-escola-militar-fisico-b93-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma afirma que Lula fez mais pelo Brasil do que todos os presidentes anteriores.', 'O Lula fez mais em 8 anos do que todos fizeram em toda história do Brasil junta.', 'Discurso em ato de campanha de 2010.', 'verified', false, '2010-09-15', 'https://g1.globo.com/politica/eleicoes/2010/dilma-lula-historia.html', 'news_article', 2, 'São Paulo', 'Comício', 'dilma-lula-historia-b93-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em entrevista, elogia torturadores Ustra e Brilhante Ustra.', 'O Ustra é patriota. Salvou o Brasil do comunismo. Merece estátua em praça pública.', 'Entrevista em 2009 sobre reparação a vítimas da ditadura.', 'verified', true, '2009-07-30', 'https://veja.abril.com.br/politica/bolsonaro-ustra-patriota-2009/', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-ustra-patriota-b93-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que quem vence o mensalão é o povo, não a Justiça.', 'Quem decide sobre o mensalão é o povo nas urnas. E o povo já me absolveu ao me reeleger.', 'Discurso em evento do PT em Brasília.', 'verified', true, '2006-12-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u86501.shtml', 'news_article', 4, 'Brasília', 'Ato do PT', 'lula-povo-absolveu-mensalao-b93-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Eduardo Cunha consolida bancada evangélica contra direitos LGBT.', 'A bancada evangélica não aceita imposição gayzista. Defenderemos a família tradicional.', 'Reunião da Frente Parlamentar Evangélica em 2009.', 'verified', true, '2009-11-17', 'https://www.camara.leg.br/noticias/cunha-evangelicos-lgbt-2009', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Frente Evangélica', 'cunha-evangelicos-lgbt-b93-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica Carlinhos Cachoeira e acusa governo de corrupção sistêmica.', 'O Cachoeira só é amigo do PT. Todo o esquema é PT, mas tentam colocar nos outros.', 'Discurso na Câmara em 2010 antes da CPI do Cachoeira.', 'verified', false, '2010-09-08', 'https://www.camara.leg.br/noticias/bolsonaro-cachoeira-2010', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-cachoeira-pt-b93-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara defende pastores evangélicos acima da lei civil.', 'A Bíblia está acima das leis humanas. Pastor não pode ser punido por pregar contra o pecado.', 'Audiência pública sobre o PLC 122 na Câmara em 2008.', 'verified', true, '2008-09-03', 'https://www.camara.leg.br/noticias/silas-pastor-biblia-2008', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Audiência pública', 'silas-biblia-acima-lei-b93-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula elogia Kadafi durante visita da Líbia em 2009.', 'O Kadafi é um dos líderes mais importantes do mundo árabe. Grande amigo do Brasil.', 'Coletiva durante visita oficial à Líbia.', 'verified', true, '2009-07-03', 'https://www1.folha.uol.com.br/folha/mundo/ult94u591201.shtml', 'news_article', 3, 'Tripoli', 'Visita oficial', 'lula-elogia-kadafi-b93-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que professores doutrinam crianças em escolas públicas.', 'Professor petista doutrina criança. Vira molequinho comunista. Tem que ser expulso das escolas.', 'Discurso na Câmara sobre currículo escolar.', 'verified', true, '2010-04-29', 'https://www.camara.leg.br/noticias/bolsonaro-professor-doutrina-2010', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-professor-doutrina-b93-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson culpa PT diretamente e acusa Lula de saber de tudo.', 'O Lula sabia de tudo. Ele me chamou várias vezes para pedir calma na crise.', 'Depoimento à Polícia Federal em 2006.', 'verified', true, '2006-02-14', 'https://www1.folha.uol.com.br/folha/brasil/ult96u77012.shtml', 'news_article', 5, 'Brasília', 'Depoimento PF', 'jefferson-lula-sabia-b93-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula nega saber do mensalão e ataca a imprensa em discurso sindical.', 'Não sabia de nada. A imprensa quer criminalizar o povo e o trabalhador.', 'Discurso em ato sindical em São Bernardo.', 'verified', true, '2005-08-18', 'https://www1.folha.uol.com.br/folha/brasil/ult96u71311.shtml', 'news_article', 3, 'São Bernardo do Campo', 'Ato sindical', 'lula-nega-ataca-imprensa-b93-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz comentário debochado sobre Preta Gil por ser mulher negra.', 'A Preta Gil não é atriz, é chata. Só aparece porque é negra e o pai é famoso. Sem talento.', 'Entrevista em rádio do Rio em 2010.', 'verified', true, '2010-10-01', 'https://oglobo.globo.com/politica/bolsonaro-preta-gil-2010', 'news_article', 5, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-preta-gil-b93-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula chama oposição ao mensalão de elitista em entrevista.', 'Essa oposição odeia mensalão porque odeia o povo no poder. São elitistas revoltados.', 'Entrevista a jornal argentino em 2006.', 'verified', true, '2006-08-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u82612.shtml', 'news_article', 3, 'Buenos Aires', 'Entrevista jornal Clarín', 'lula-oposicao-elitista-b93-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca ONGs ambientais chamando-as de traidoras da pátria.', 'Greenpeace é traidor da pátria. São todos agentes a serviço de potências estrangeiras.', 'Discurso na Câmara sobre Amazônia.', 'verified', true, '2008-08-12', 'https://www.camara.leg.br/noticias/bolsonaro-greenpeace-traidor-2008', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-greenpeace-traidor-b93-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf insiste que fez o progresso paulistano em entrevista polêmica.', 'Sem mim, São Paulo era uma aldeia. As pessoas esquecem quem construiu os viadutos, as avenidas.', 'Entrevista ao SBT em 2008 sobre eleição municipal.', 'verified', true, '2008-09-14', 'https://www1.folha.uol.com.br/folha/brasil/ult96u446512.shtml', 'news_article', 3, 'São Paulo', 'Entrevista SBT', 'maluf-aldeia-sp-b93-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma na Câmara que aborto é assassinato.', 'Aborto é assassinato. Quem faz aborto tinha que ir pra cadeia por homicídio qualificado.', 'Discurso no plenário contra descriminalização do aborto.', 'verified', true, '2007-03-05', 'https://www.camara.leg.br/noticias/bolsonaro-aborto-assassinato-2007', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-aborto-assassinato-b93-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula decreta apoio a Dilma apesar de Ciro Gomes ser opção interna do PT.', 'A Dilma é a candidata. Quem não apoiar é porque não gosta do Brasil.', 'Reunião da executiva do PT em 2010.', 'verified', false, '2010-04-30', 'https://g1.globo.com/politica/eleicoes/2010/lula-apoio-dilma.html', 'news_article', 2, 'São Paulo', 'Executiva PT', 'lula-apoio-dilma-candidata-b93-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz piada debochada sobre estupro em programa de TV.', 'Estupro é crime, mas quem sai na rua vestida daquele jeito pede pra ser estuprada.', 'Declaração em programa televisivo em 2007.', 'verified', true, '2007-10-14', 'https://veja.abril.com.br/politica/bolsonaro-estupro-vestida-2007/', 'news_article', 5, 'São Paulo', 'Programa TV', 'bolsonaro-estupro-vestida-b93-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio defende privatização da Copasa durante seu governo.', 'Temos que abrir a Copasa ao mercado. Modelo estatal não dá conta de universalizar saneamento.', 'Entrevista em Belo Horizonte em 2007.', 'verified', false, '2007-03-17', 'https://www.estadao.com.br/politica/aecio-copasa-privatizacao', 'news_article', 1, 'Belo Horizonte', 'Entrevista', 'aecio-copasa-privatizacao-b93-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Marco Feliciano é herói pela luta contra o movimento LGBT.', 'O Feliciano é herói da família. Enfrenta a ditadura gay que quer acabar com a moral cristã.', 'Entrevista em programa evangélico em 2010.', 'verified', true, '2010-10-10', 'https://oglobo.globo.com/politica/bolsonaro-feliciano-heroi-2010', 'news_article', 4, 'Rio de Janeiro', 'Entrevista evangélica', 'bolsonaro-feliciano-heroi-b93-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula compara Dirceu a líder histórico do PT em defesa pós-condenação.', 'O Dirceu é o maior quadro político do PT. Vocês estão julgando não um homem, mas uma ideia.', 'Discurso em ato do PT em outubro de 2010.', 'verified', true, '2010-10-02', 'https://www1.folha.uol.com.br/poder/2010/10/lula-defende-dirceu-ato.shtml', 'news_article', 3, 'São Paulo', 'Ato PT', 'lula-defende-dirceu-ato-b93-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende criação de partido militar para disputar eleições.', 'Precisamos de um partido militar. Só assim esse povo vai ter representação de verdade.', 'Entrevista à Isto É em 2008.', 'verified', true, '2008-02-20', 'https://istoe.com.br/politica/bolsonaro-partido-militar-2008', 'news_article', 4, 'Brasília', 'Entrevista ISTOÉ', 'bolsonaro-partido-militar-b93-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor debocha de ex-esposa Rosane em aparição pública.', 'A Rosane nunca vai me enterrar politicamente. Quem tentou destruir minha imagem falhou.', 'Entrevista no Senado após eleição em 2007.', 'verified', false, '2007-03-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u89912.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'collor-debocha-rosane-b93-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, false FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro sobre aborto de anencefálica diz que é conveniência feminina.', 'Mulher fala de anencéfalo para esconder que quer matar filho. Isso é covardia.', 'Audiência no STF em 2008 sobre ADPF de anencefalia.', 'verified', true, '2008-08-27', 'https://g1.globo.com/politica/noticia/bolsonaro-anencefalia-2008.html', 'news_article', 4, 'Brasília', 'Audiência pública STF', 'bolsonaro-anencefalia-conveniencia-b93-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney ataca opositores no Senado chamando-os de irresponsáveis.', 'Esses juvenis do Senado são irresponsáveis. Querem destruir a instituição para se promoverem.', 'Discurso em defesa da presidência da Casa em 2009.', 'verified', true, '2009-08-04', 'https://www1.folha.uol.com.br/folha/brasil/ult96u601412.shtml', 'news_article', 3, 'Senado Federal', 'Plenário', 'sarney-juvenis-irresponsaveis-b93-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes afirma que imprensa é sócia de escândalos políticos.', 'A Folha é sócia dos escândalos. Cria crise para vender jornal e ajudar a direita.', 'Entrevista em campanha em 2010.', 'verified', true, '2010-08-15', 'https://www1.folha.uol.com.br/poder/2010/08/ciro-ataca-imprensa.shtml', 'news_article', 3, 'Fortaleza', 'Entrevista', 'ciro-imprensa-socia-b93-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende redução da maioridade penal para 14 anos.', 'Moleque de 14 anos já sabe matar. Tem que responder como adulto. Cadeia para menor infrator.', 'Discurso no plenário em 2006.', 'verified', true, '2006-06-14', 'https://www.camara.leg.br/noticias/bolsonaro-maioridade-14-2006', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-maioridade-14-b93-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula protege Erenice Guerra após escândalo e nega envolvimento.', 'A Erenice é vítima de armação. Não há nenhuma prova contra ela.', 'Entrevista coletiva após denúncia contra Erenice Guerra, chefe da Casa Civil.', 'verified', true, '2010-09-17', 'https://www1.folha.uol.com.br/poder/2010/09/lula-defende-erenice.shtml', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'lula-defende-erenice-b93-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama movimento negro de oportunista em discurso.', 'Movimento negro é oportunista. Vive de vitimismo. Negro no Brasil nunca sofreu preconceito de verdade.', 'Discurso na Câmara em 2007 contra Estatuto da Igualdade Racial.', 'verified', true, '2007-11-20', 'https://www.camara.leg.br/noticias/bolsonaro-movimento-negro-2007', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-movimento-negro-b93-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula ameaça jornalistas em programa de rádio.', 'Tem jornalista que vai ter que pedir desculpa. E vão pedir. Tomara que não deem passaporte pra eles.', 'Entrevista a programa de rádio em 2009.', 'verified', true, '2009-10-23', 'https://www1.folha.uol.com.br/folha/brasil/ult96u640512.shtml', 'news_article', 3, 'São Paulo', 'Entrevista rádio', 'lula-ameaca-jornalistas-b93-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende que sem-terra sejam expulsos com violência.', 'Sem-terra tem que levar bala. Invadir fazenda é crime. Bandido invasor merece bala.', 'Discurso na Câmara em 2005 sobre MST.', 'verified', true, '2005-04-12', 'https://www.camara.leg.br/noticias/bolsonaro-mst-bala-2005', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-mst-bala-b93-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma, ministra, defende usina de Belo Monte contra críticas ambientais.', 'Belo Monte é essencial. ONGs querem barrar desenvolvimento brasileiro para servir interesse externo.', 'Entrevista em 2010 como ministra-chefe da Casa Civil.', 'verified', false, '2010-02-02', 'https://g1.globo.com/politica/noticia/2010/dilma-belo-monte-ongs.html', 'news_article', 2, 'Brasília', 'Entrevista', 'dilma-belo-monte-b93-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega o Holocausto em comentário polêmico em entrevista.', 'O Holocausto pode ter tido exagero. Ninguém nunca viu aquelas câmaras de gás. É propaganda.', 'Entrevista a rádio em 2006.', 'verified', true, '2006-04-28', 'https://veja.abril.com.br/politica/bolsonaro-holocausto-2006/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-nega-holocausto-b93-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula declara no aniversário da ditadura que era um "erro histórico".', 'A ditadura militar foi um erro histórico. Mas não vou ficar remoendo o passado.', 'Discurso em 31 de março de 2009.', 'verified', false, '2009-03-31', 'https://www1.folha.uol.com.br/folha/brasil/ult96u540012.shtml', 'news_article', 1, 'Brasília', 'Evento oficial', 'lula-ditadura-erro-historico-b93-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Universidade brasileira como antro comunista.', 'Universidade brasileira é antro vermelho. Professores comunistas doutrinam jovens a odiarem a pátria.', 'Discurso em plenário em 2007.', 'verified', true, '2007-05-09', 'https://www.camara.leg.br/noticias/bolsonaro-universidade-antro-2007', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-universidade-antro-b93-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf acusa MP de São Paulo de perseguição política sistemática.', 'O MP paulista virou instrumento político. Se eu fosse petista, ninguém me acusaria.', 'Entrevista após denúncia em 2008.', 'verified', true, '2008-05-28', 'https://www1.folha.uol.com.br/folha/brasil/ult96u408901.shtml', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-mp-perseguicao-b93-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro culpa mulher em caso de violência doméstica em debate.', 'Apanha quem provoca. Mulher que apanha do marido fez por onde, senão não apanhava.', 'Discurso na Câmara sobre Lei Maria da Penha em 2006.', 'verified', true, '2006-07-20', 'https://www.camara.leg.br/noticias/bolsonaro-maria-penha-provoca-2006', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-mulher-provoca-apanha-b93-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin ataca Lula chamando-o de "festeiro" em campanha de 2006.', 'Lula é festeiro, gosta de churrasco, futebol, viagem. Não gosta de trabalhar.', 'Comício em Brasília durante segundo turno de 2006.', 'verified', true, '2006-10-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u84612.shtml', 'news_article', 3, 'Brasília', 'Comício', 'alckmin-lula-festeiro-b93-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula responde a Alckmin chamando-o de picolé de chuchu na campanha.', 'O Alckmin é um picolé de chuchu. Sem sabor, sem cor, sem calor. Tucano frio.', 'Comício em São Paulo em 2006.', 'verified', true, '2006-10-22', 'https://www1.folha.uol.com.br/folha/brasil/ult96u84801.shtml', 'news_article', 2, 'São Paulo', 'Comício', 'lula-alckmin-picole-chuchu-b93-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, false FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende torturador Carlos Brilhante Ustra em sessão.', 'O coronel Ustra é patriota. Quem pede cadeia para ele é comunista frustrado.', 'Discurso em plenário em 2010.', 'verified', true, '2010-10-06', 'https://www.camara.leg.br/noticias/bolsonaro-brilhante-ustra-2010', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-brilhante-ustra-b93-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan defende usar recursos públicos para segurança familiar.', 'Senador precisa ter segurança reforçada. Família precisa ser protegida. É uso normal do gabinete.', 'Entrevista após denúncia sobre uso de verba para segurança pessoal.', 'verified', true, '2007-06-28', 'https://www1.folha.uol.com.br/folha/brasil/ult96u88201.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'renan-seguranca-familia-b93-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro denuncia suposta "ideologia de gênero" em livros didáticos.', 'MEC distribui cartilha gay. Vai ensinar criança a ser homossexual. Pais têm que reagir.', 'Discurso em sessão da Câmara em 2010.', 'verified', true, '2010-09-23', 'https://www.camara.leg.br/noticias/bolsonaro-cartilha-gay-mec-2010', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-cartilha-gay-mec-b93-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula defende Delúbio Soares como vítima do processo judicial.', 'O Delúbio não fez nada errado. Fez o que todo partido faz. Foi perseguido.', 'Entrevista após condenação de Delúbio no STF.', 'verified', true, '2010-09-02', 'https://www1.folha.uol.com.br/poder/2010/09/lula-defende-delubio.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-defende-delubio-b93-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro publica em 2010 vídeo defendendo medidas autoritárias.', 'Tem que acabar com essa democracia chata. Brasil precisa de mão forte, não de voto.', 'Vídeo em canal próprio em redes sociais em 2010.', 'verified', false, '2010-10-18', 'https://oglobo.globo.com/politica/bolsonaro-video-democracia-2010', 'social_media_post', 4, 'Rio de Janeiro', 'Vídeo YouTube', 'bolsonaro-video-democracia-chata-b93-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara afirma que igreja evangélica deve governar o Estado.', 'O Brasil deve ser governado pelos princípios evangélicos. Laicidade é conversa de comunista.', 'Palestra em culto evangélico em Manaus em 2008.', 'verified', true, '2008-06-14', 'https://g1.globo.com/politica/noticia/silas-camara-estado-laico-2008.html', 'news_article', 4, 'Manaus', 'Culto evangélico', 'silas-igreja-estado-laico-b93-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma que brasileiro virou consumidor graças ao seu governo.', 'O povo passou a consumir. Antes de mim, pobre nem sonhava com TV ou carro. Eu mudei isso.', 'Entrevista a programa de rádio em 2010.', 'verified', false, '2010-07-12', 'https://g1.globo.com/politica/noticia/2010/07/lula-povo-consumidor.html', 'news_article', 1, 'Brasília', 'Entrevista rádio', 'lula-povo-consumidor-b93-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em entrevista, admite que é favorável a repressão a manifestações.', 'Passeata tem que levar cassetete. Manifestante é baderna. Governo tem que reprimir com firmeza.', 'Entrevista no Rio em 2010 sobre manifestações de estudantes.', 'verified', true, '2010-05-12', 'https://oglobo.globo.com/politica/bolsonaro-repressao-passeata-2010', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-cassetete-passeata-b93-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC responde ataques de Lula chamando-o de populista barato.', 'O Lula é populista barato. Governo dele é teatro. Não construiu nada sólido.', 'Palestra em universidade portuguesa em 2010.', 'verified', false, '2010-06-04', 'https://www.estadao.com.br/politica/fhc-lula-populista-portugal', 'news_article', 2, 'Lisboa', 'Palestra universidade', 'fhc-lula-populista-barato-b93-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz ao Supremo que defender ditadura é "liberdade de opinião".', 'Defender ditadura é minha opinião. Se o STF quer prender por opinião, é que vira ditadura STF.', 'Discurso em protesto em frente ao STF em 2010.', 'verified', true, '2010-11-15', 'https://veja.abril.com.br/politica/bolsonaro-stf-ditadura-opiniao-2010/', 'news_article', 4, 'Brasília', 'Ato pró-militares', 'bolsonaro-stf-ditadura-opiniao-b93-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma que seu governo criou mais empregos que todos os outros juntos.', 'Criamos mais empregos do que todos os outros presidentes juntos. É fato inquestionável.', 'Discurso em evento com centrais sindicais.', 'verified', false, '2010-05-01', 'https://g1.globo.com/politica/noticia/2010/05/lula-empregos-1-maio.html', 'news_article', 1, 'São Paulo', 'Ato 1º de Maio', 'lula-empregos-todos-juntos-b93-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua em entrevista que eleição de 2006 foi fraudada pelo PT.', 'Essa urna é fraudada. O Lula só ganhou porque tem fraude. Queremos voto impresso agora.', 'Entrevista em rádio em 2007.', 'verified', true, '2007-03-22', 'https://oglobo.globo.com/politica/bolsonaro-urna-fraudada-2007', 'news_article', 4, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-urna-fraudada-2007-b93-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma adia resposta à Justiça em julgamento do dossiê Serra de 2010.', 'Não vou me pronunciar sobre processo em curso. Respeito o Poder Judiciário.', 'Coletiva no dia anterior ao segundo turno em 2010.', 'verified', false, '2010-10-30', 'https://g1.globo.com/politica/eleicoes/2010/dilma-justica-silencio.html', 'news_article', 2, 'Brasília', 'Coletiva', 'dilma-silencio-justica-b93-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Fernando Haddad como ministro da Educação em 2008.', 'O Haddad é incapaz. Quer ensinar criança a ser gay. Tem que ser tirado do MEC.', 'Discurso em 2008 na Câmara sobre políticas educacionais.', 'verified', true, '2008-10-28', 'https://www.camara.leg.br/noticias/bolsonaro-haddad-mec-2008', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-ataca-haddad-mec-b93-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor ironiza denúncias de Veja sobre sua volta à política.', 'A Veja nunca se conformou que eu voltei ao Senado. Seguirão inventando histórias.', 'Entrevista após denúncia em matéria da revista Veja.', 'verified', true, '2008-03-12', 'https://veja.abril.com.br/politica/collor-veja-senado-2008/', 'news_article', 3, 'Brasília', 'Entrevista', 'collor-veja-invencoes-b93-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula defende censura a revistas em episódio da "imprensa marrom".', 'Imprensa que mente tem que ser controlada. Não pode haver liberdade para caluniar.', 'Declaração em evento de comunicadores do PT.', 'verified', true, '2009-11-03', 'https://www1.folha.uol.com.br/folha/brasil/ult96u648601.shtml', 'news_article', 4, 'São Paulo', 'Encontro comunicadores PT', 'lula-censura-imprensa-b93-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca casamento homoafetivo como atentado contra família.', 'Casamento gay é atentado contra a família. Se aprovarem, vai virar casamento com animal logo.', 'Discurso em plenário em 2010 sobre união civil entre pessoas do mesmo sexo.', 'verified', true, '2010-08-26', 'https://www.camara.leg.br/noticias/bolsonaro-casamento-gay-animal-2010', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-casamento-gay-animal-b93-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf defende acúmulo patrimonial como fruto de sua "capacidade empresarial".', 'Meu patrimônio vem do meu trabalho empresarial. Sou industrial há décadas. Não tem irregularidade.', 'Entrevista à Veja em 2010 sobre patrimônio declarado.', 'verified', true, '2010-08-04', 'https://veja.abril.com.br/politica/maluf-patrimonio-empresarial-2010/', 'news_article', 4, 'São Paulo', 'Entrevista Veja', 'maluf-patrimonio-empresarial-b93-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi Hoffmann, senadora, defende Dilma como quadro técnico imparcial.', 'A Dilma tem currículo técnico incomparável. É economista, gestora de ponta, não política.', 'Entrevista em Curitiba durante campanha presidencial em 2010.', 'verified', false, '2010-09-14', 'https://www1.folha.uol.com.br/poder/2010/09/gleisi-dilma-tecnica.shtml', 'news_article', 1, 'Curitiba', 'Entrevista', 'gleisi-dilma-tecnica-b93-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz comentário xenófobo contra haitianos em entrevista.', 'Haitiano é escória. Não serve nem para o Brasil. Que vá embora ou que volte de onde veio.', 'Entrevista em rádio em 2010 sobre imigração.', 'verified', true, '2010-07-28', 'https://oglobo.globo.com/politica/bolsonaro-haitiano-escoria-2010', 'news_article', 5, 'Rio de Janeiro', 'Entrevista rádio', 'bolsonaro-haitiano-escoria-b93-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula ironiza jornalismo investigativo como "jornalismo de guerra".', 'Alguns jornais brasileiros fazem jornalismo de guerra. Não querem informar, querem derrubar.', 'Palestra no Lulacast em 2010.', 'verified', false, '2010-05-29', 'https://www1.folha.uol.com.br/poder/2010/05/lula-jornalismo-guerra.shtml', 'news_article', 3, 'São Paulo', 'Palestra Lulacast', 'lula-jornalismo-guerra-b93-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro fecha 2010 elogiando candidato Serra e pedindo voto útil.', 'Voto em Dilma é voto em comunismo. Quem ama o Brasil vota Serra. Contra o PT, tudo.', 'Entrevista durante segundo turno das eleições de 2010.', 'verified', true, '2010-10-25', 'https://oglobo.globo.com/politica/bolsonaro-voto-serra-2010', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-voto-serra-comunismo-b93-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma comemora vitória em 2010 e promete governo técnico e firme.', 'Não é uma vitória minha. É vitória das mulheres brasileiras. Vou governar com firmeza.', 'Discurso de vitória no segundo turno das eleições de 2010.', 'verified', true, '2010-10-31', 'https://g1.globo.com/especiais/eleicoes-2010/noticia/dilma-discurso-vitoria.html', 'news_article', 2, 'Brasília', 'Discurso de vitória', 'dilma-discurso-vitoria-b93-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

END $$;
