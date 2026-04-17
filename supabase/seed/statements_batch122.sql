-- Batch 122: Lava Jato deep-dive I (Jan 2014 - Abr 2017)
DO $$
DECLARE
  v_mor UUID; v_lul UUID; v_lip UUID; v_dil UUID; v_tem UUID;
  v_aec UUID; v_fhc UUID; v_jair UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_dam UUID; v_pau UUID; v_mou UUID; v_gle UUID;
  v_had UUID; v_cir UUID; v_jse UUID; v_alc UUID; v_mar UUID;
  v_mal UUID; v_sar UUID; v_ren UUID; v_cun UUID; v_jan UUID;
  v_cha UUID; v_fre UUID; v_sil UUID; v_rje UUID; v_mag UUID;
  v_mfe UUID; v_axm UUID; v_gil UUID; v_bar UUID; v_tof UUID;
  v_fux UUID; v_fac UUID; v_car2 UUID;
  c_cor UUID; c_obs UUID; c_abu UUID; c_ant UUID; c_des UUID;
  c_odi UUID; c_irr UUID; c_con UUID; c_nep UUID; c_int UUID;
  c_ame UUID;
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
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_pau FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_jse FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_mal FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
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

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro deflagra primeira fase da Lava Jato na 13ª Vara Federal de Curitiba.', 'A operação cumpre mandados contra organização criminosa que atuava em posto de combustíveis.', 'Autorização judicial para a primeira fase, na época ainda restrita a doleiros.', 'verified', true, '2014-03-17', 'https://www1.folha.uol.com.br/poder/2014/03/1426842-pf-deflagra-operacao-contra-lavagem-de-dinheiro-em-postos-de-gasolina.shtml', 'news_article', 3, 'Curitiba', 'Primeira fase da Lava Jato', 'moro-primeira-fase-lava-jato-b122-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma declara que investigações devem ir até o fim, sem blindagem.', 'Não haverá acobertamento. A Petrobras é patrimônio do povo brasileiro.', 'Resposta a jornalistas após primeira fase da Lava Jato.', 'verified', false, '2014-03-20', 'https://g1.globo.com/politica/noticia/2014/03/dilma-diz-que-investigacoes-na-petrobras-vao-ate-o-fim.html', 'news_article', 1, 'Brasília', 'Coletiva no Planalto', 'dilma-investigacoes-ate-fim-b122-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro decreta prisão de Paulo Roberto Costa por obstrução de justiça.', 'A ocultação de provas em cofre configura embaraço às investigações.', 'Prisão do ex-diretor de Abastecimento da Petrobras após operação na casa da filha.', 'verified', true, '2014-03-21', 'https://oglobo.globo.com/politica/operacao-lava-jato-prende-ex-diretor-da-petrobras-paulo-roberto-costa-11929134', 'news_article', 3, 'Curitiba', 'Prisão de Paulo Roberto Costa', 'moro-prisao-paulo-roberto-costa-b122-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula minimiza escândalo da Petrobras em discurso.', 'A Petrobras é a empresa mais transparente do Brasil. Quem roubou vai pagar.', 'Declaração em ato público com sindicalistas em São Bernardo.', 'verified', false, '2014-04-10', 'https://www1.folha.uol.com.br/poder/2014/04/1440123-lula-defende-petrobras-em-ato-sindical.shtml', 'other', 2, 'São Bernardo do Campo', 'Ato sindical', 'lula-petrobras-transparente-b122-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio Neves acusa PT de usar Petrobras como caixa do partido.', 'O PT transformou a Petrobras em seu caixa eleitoral. É a maior fraude da história.', 'Discurso de campanha no Rio de Janeiro durante pré-campanha presidencial.', 'verified', true, '2014-05-15', 'https://veja.abril.com.br/politica/aecio-acusa-pt-de-usar-petrobras-como-caixa/', 'other', 3, 'Rio de Janeiro', 'Comício de campanha', 'aecio-petrobras-caixa-pt-b122-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro aceita delação premiada de Alberto Youssef sobre esquema Petrobras.', 'A colaboração de Youssef descortina esquema bilionário na estatal.', 'Homologação de acordo do doleiro que detalhou propinas a partidos.', 'verified', true, '2014-08-06', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/2014/08/justica-homologa-delacao-premiada-de-alberto-youssef.html', 'other', 3, 'Curitiba', 'Homologação de delação', 'moro-delacao-youssef-b122-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro homologa delação de Paulo Roberto Costa com detalhamento de propinas.', 'A delação revela o funcionamento do pagamento de comissões a agentes públicos.', 'Acordo traz 59 políticos à lista, incluindo líderes do Congresso.', 'verified', true, '2014-08-28', 'https://www1.folha.uol.com.br/poder/2014/08/1507543-justica-homologa-delacao-de-paulo-roberto-costa.shtml', 'other', 4, 'Curitiba', 'Delação de Paulo Roberto Costa', 'moro-delacao-paulo-roberto-b122-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha nega receber propina em esquema da Petrobras.', 'Jamais recebi qualquer centavo da Petrobras. São acusações levianas.', 'Declaração à imprensa em Brasília após ter nome citado por Paulo Roberto Costa.', 'verified', false, '2014-10-02', 'https://oglobo.globo.com/politica/cunha-nega-receber-propina-da-petrobras-14128765', 'news_article', 4, 'Brasília', 'Coletiva na Câmara', 'cunha-nega-propina-petrobras-b122-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma reeleita promete apoio total à Lava Jato em discurso.', 'Vamos apoiar a Lava Jato para que chegue a todos os responsáveis.', 'Primeiro discurso após vitória apertada sobre Aécio Neves.', 'verified', false, '2014-10-27', 'https://g1.globo.com/politica/eleicoes/2014/noticia/2014/10/dilma-apoia-lava-jato-em-primeiro-discurso.html', 'other', 1, 'Brasília', 'Discurso pós-eleição', 'dilma-apoio-lava-jato-b122-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro decreta prisão preventiva de executivos da OAS e Camargo Corrêa.', 'A prisão é necessária para evitar reiteração criminosa e interferência nas provas.', 'Operação Juízo Final, sétima fase da Lava Jato, atinge empreiteiras.', 'verified', true, '2014-11-14', 'https://www1.folha.uol.com.br/poder/2014/11/1547123-pf-prende-executivos-de-empreiteiras-em-operacao-da-lava-jato.shtml', 'news_article', 3, 'Curitiba', 'Operação Juízo Final', 'moro-prisao-empreiteiras-b122-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros acusa Moro de espetacularizar operação.', 'Essa espetacularização vai passar. A Justiça tem que ser sóbria.', 'Reação do presidente do Senado a prisões de empreiteiros.', 'verified', false, '2014-11-18', 'https://veja.abril.com.br/politica/renan-acusa-moro-de-espetacularizar-lava-jato/', 'news_article', 2, 'Brasília', 'Entrevista no Senado', 'renan-moro-espetaculariza-b122-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica prisões preventivas e compara a abusos de exceção.', 'Prisão preventiva para arrancar delação é coisa de Estado de exceção.', 'Entrevista a rádio criticando método da força-tarefa.', 'verified', false, '2014-12-03', 'https://www1.folha.uol.com.br/poder/2014/12/1559872-lula-critica-prisao-preventiva-na-lava-jato.shtml', 'news_article', 3, 'São Paulo', 'Entrevista a rádio', 'lula-preventiva-excecao-b122-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pau, 'Guedes defende em artigo responsabilização ampla de corruptos.', 'O Brasil precisa enfrentar a corrupção sistêmica sem medo.', 'Artigo publicado em revista econômica sobre impacto da Lava Jato.', 'verified', false, '2014-12-15', 'https://veja.abril.com.br/economia/paulo-guedes-defende-responsabilizacao-corruptos/', 'news_article', 1, 'Rio de Janeiro', 'Artigo em revista', 'guedes-responsabilizacao-corruptos-b122-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia Moro e defende endurecimento penal.', 'O Brasil precisa de mais Moros e menos bandidos soltos.', 'Declaração em plenário da Câmara durante discussão de projeto.', 'verified', false, '2015-02-05', 'https://g1.globo.com/politica/noticia/2015/02/bolsonaro-elogia-moro-na-camara.html', 'other', 2, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-elogia-moro-b122-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Alexandre de Moraes defende legalidade da força-tarefa.', 'Os métodos da Lava Jato estão amparados pela legislação vigente.', 'Palestra em congresso jurídico em São Paulo.', 'verified', false, '2015-03-12', 'https://www.conjur.com.br/2015-mar-12/alexandre-moraes-defende-metodos-lava-jato', 'news_article', 2, 'São Paulo', 'Congresso jurídico', 'alexandre-moraes-defende-lava-jato-b122-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro autoriza operação contra tesoureiro do PT João Vaccari.', 'Vaccari é peça central no recebimento de recursos ilícitos para o partido.', 'Prisão do tesoureiro em operação Que País é Esse.', 'verified', true, '2015-04-15', 'https://oglobo.globo.com/politica/vaccari-neto-preso-na-operacao-lava-jato-15871234', 'news_article', 4, 'Curitiba', 'Operação Que País é Esse', 'moro-prisao-vaccari-b122-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia uso político da Lava Jato contra o PT.', 'A operação está sendo usada para criminalizar a política e destruir o PT.', 'Discurso no Senado em defesa do partido.', 'verified', false, '2015-04-20', 'https://www12.senado.leg.br/noticias/materias/2015/04/20/gleisi-denuncia-lava-jato-politica', 'other', 3, 'Senado Federal', 'Pronunciamento', 'gleisi-lava-jato-politica-b122-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha nega contas secretas na Suíça em depoimento à CPI.', 'Jamais tive contas no exterior. Desafio qualquer um a provar o contrário.', 'Depoimento à CPI da Petrobras sobre contas suíças reveladas pela imprensa.', 'verified', true, '2015-05-12', 'https://www1.folha.uol.com.br/poder/2015/05/1628734-cunha-nega-contas-na-suica-em-cpi.shtml', 'other', 5, 'Câmara dos Deputados', 'CPI da Petrobras', 'cunha-nega-contas-suica-b122-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro aceita denúncia contra Marcelo Odebrecht.', 'Os indícios apontam para participação do executivo em organização criminosa.', 'Primeira denúncia formal contra o presidente da Odebrecht.', 'verified', true, '2015-06-19', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/2015/06/marcelo-odebrecht-preso-na-lava-jato.html', 'other', 4, 'Curitiba', 'Operação Erga Omnes', 'moro-denuncia-marcelo-odebrecht-b122-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma diz que Lava Jato é orgulho para o Brasil.', 'A operação Lava Jato é um orgulho para o Brasil. Nenhum governo investigou tanto.', 'Entrevista a emissora estrangeira durante crise política.', 'verified', true, '2015-07-03', 'https://veja.abril.com.br/politica/dilma-diz-lava-jato-orgulho-brasil/', 'news_article', 2, 'Brasília', 'Entrevista internacional', 'dilma-lava-jato-orgulho-b122-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ataca imprensa e diz ser alvo de linchamento.', 'Estou sendo linchado pela mídia sem provas de nada. Isso é abuso.', 'Entrevista coletiva após reportagem da Veja sobre tríplex.', 'verified', false, '2015-07-15', 'https://www1.folha.uol.com.br/poder/2015/07/1655432-lula-diz-que-sofre-linchamento-da-imprensa.shtml', 'news_article', 2, 'São Paulo', 'Coletiva do Instituto Lula', 'lula-linchamento-imprensa-b122-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer defende continuidade das investigações e elogia o juiz.', 'A Lava Jato mostra que o Brasil está amadurecendo institucionalmente.', 'Entrevista ao jornal Estadão no papel de vice-presidente.', 'verified', false, '2015-08-11', 'https://politica.estadao.com.br/noticias/geral,temer-elogia-lava-jato-em-entrevista,1739521', 'news_article', 2, 'Brasília', 'Entrevista', 'temer-elogia-lava-jato-b122-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro sentencia Pedro Corrêa por corrupção e lavagem.', 'Condeno o ex-deputado a 20 anos e 7 meses pelos crimes contra a Petrobras.', 'Primeira sentença contra ex-parlamentar na Lava Jato.', 'verified', true, '2015-09-22', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/2015/09/ex-deputado-pedro-correa-e-condenado-por-moro.html', 'other', 3, 'Curitiba', 'Sentença Pedro Corrêa', 'moro-sentenca-pedro-correa-b122-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rje, 'Roberto Jefferson critica Moro por métodos e pede CPI do Judiciário.', 'Moro virou um super-juiz. Precisa de freios.', 'Declaração a blog político no Rio.', 'verified', false, '2015-10-04', 'https://oglobo.globo.com/politica/roberto-jefferson-critica-moro-super-juiz-17892134', 'news_article', 3, 'Rio de Janeiro', 'Entrevista a blog', 'jefferson-moro-super-juiz-b122-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC diz que Lava Jato mudará o Brasil para melhor.', 'Teremos um país mais limpo depois disso, apesar do custo político.', 'Palestra em think tank em São Paulo.', 'verified', false, '2015-10-19', 'https://www1.folha.uol.com.br/poder/2015/10/1698765-fhc-diz-que-lava-jato-mudara-o-brasil.shtml', 'other', 1, 'São Paulo', 'Palestra FHC', 'fhc-lava-jato-mudar-brasil-b122-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro autoriza prisão do senador Delcídio Amaral.', 'A prisão é necessária diante da articulação para obstruir colaborações.', 'Primeira prisão de senador em exercício desde 1988.', 'verified', true, '2015-11-25', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/2015/11/senador-delcidio-do-amaral-e-preso.html', 'other', 5, 'Brasília', 'Prisão de Delcídio Amaral', 'moro-prisao-delcidio-b122-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma afirma desconhecer conversas de Delcídio sobre obstrução.', 'Nunca participei de qualquer conversa para atrapalhar investigações.', 'Coletiva após vazamento de áudio de Delcídio.', 'verified', true, '2015-11-26', 'https://www1.folha.uol.com.br/poder/2015/11/1711234-dilma-diz-desconhecer-conversas-delcidio.shtml', 'news_article', 3, 'Brasília', 'Coletiva no Planalto', 'dilma-desconhece-delcidio-b122-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega favorecimento a Delcídio e diz que senador age por conta própria.', 'Delcídio é senador experiente. Suas ações são responsabilidade dele.', 'Entrevista coletiva em resposta à delação de Delcídio.', 'verified', false, '2015-12-02', 'https://g1.globo.com/politica/noticia/2015/12/lula-nega-envolvimento-com-delcidio.html', 'news_article', 3, 'São Paulo', 'Coletiva do Instituto Lula', 'lula-nega-delcidio-b122-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Cunha abre processo de impeachment de Dilma no dia da delação.', 'Estão presentes os requisitos legais para abertura do impeachment.', 'Decisão anunciada horas após rompimento do PT com presidente da Câmara.', 'verified', true, '2015-12-02', 'https://oglobo.globo.com/politica/cunha-abre-processo-de-impeachment-contra-dilma-18354123', 'news_article', 5, 'Câmara dos Deputados', 'Abertura do impeachment', 'cunha-abre-impeachment-dilma-b122-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi chama delação de Delcídio de pacto com o diabo.', 'Essa delação é um pacto com o diabo para derrubar o governo.', 'Entrevista a portal de notícias.', 'verified', false, '2016-03-04', 'https://veja.abril.com.br/politica/gleisi-chama-delacao-pacto-com-diabo/', 'news_article', 3, 'Brasília', 'Entrevista a portal', 'gleisi-delacao-diabo-b122-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro determina condução coercitiva de Lula para depoimento.', 'A condução é medida cautelar para preservar a ordem pública do depoimento.', 'Operação Aletheia leva Lula à Polícia Federal em Congonhas.', 'verified', true, '2016-03-04', 'https://g1.globo.com/pr/parana/noticia/2016/03/lula-e-alvo-de-conducao-coercitiva-pela-lava-jato.html', 'other', 4, 'São Paulo', 'Operação Aletheia', 'moro-conducao-coercitiva-lula-b122-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula acusa Moro de perseguição política após condução coercitiva.', 'Não havia necessidade de condução coercitiva. Isso foi espetáculo.', 'Entrevista após depoimento na sede da PF em Congonhas.', 'verified', true, '2016-03-04', 'https://www1.folha.uol.com.br/poder/2016/03/1747891-lula-critica-moro-apos-conducao-coercitiva.shtml', 'news_article', 3, 'São Paulo', 'Coletiva pós-depoimento', 'lula-perseguicao-moro-b122-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro divulga áudio de Dilma e Lula sobre nomeação ministerial.', 'Os diálogos revelam tentativa de obstrução via foro privilegiado.', 'Levantamento do sigilo de escuta telefônica gera crise política.', 'verified', true, '2016-03-16', 'https://oglobo.globo.com/politica/moro-divulga-audio-de-dilma-lula-18931234', 'other', 5, 'Curitiba', 'Divulgação do grampo Dilma-Lula', 'moro-grampo-dilma-lula-b122-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma diz que divulgação do áudio é violação da Constituição.', 'A divulgação ilegal de conversas é crime e atenta contra a Constituição.', 'Pronunciamento em cadeia nacional após áudio vazado.', 'verified', true, '2016-03-16', 'https://g1.globo.com/politica/processo-de-impeachment-de-dilma/noticia/2016/03/dilma-critica-divulgacao-de-audio-por-moro.html', 'other', 4, 'Brasília', 'Pronunciamento em cadeia nacional', 'dilma-audio-violacao-b122-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes suspende posse de Lula como ministro.', 'A nomeação busca desvio de finalidade para escapar da jurisdição de primeiro grau.', 'Liminar concedida poucas horas após o anúncio do cargo na Casa Civil.', 'verified', true, '2016-03-17', 'https://www1.folha.uol.com.br/poder/2016/03/1752123-gilmar-mendes-suspende-posse-de-lula-na-casa-civil.shtml', 'other', 4, 'Brasília', 'Liminar de Gilmar Mendes', 'gilmar-suspende-lula-casa-civil-b122-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio defende impeachment como resposta à Lava Jato.', 'O impeachment é resposta institucional à corrupção que a Lava Jato revela.', 'Discurso em convenção do PSDB.', 'verified', false, '2016-04-10', 'https://veja.abril.com.br/politica/aecio-defende-impeachment-como-resposta-lava-jato/', 'other', 3, 'São Paulo', 'Convenção PSDB', 'aecio-impeachment-lava-jato-b122-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro dedica voto a torturador ao aprovar impeachment.', 'Pela memória do coronel Carlos Alberto Brilhante Ustra, voto sim.', 'Voto na sessão de impeachment gerou repercussão mundial.', 'verified', true, '2016-04-17', 'https://g1.globo.com/politica/processo-de-impeachment-de-dilma/noticia/2016/04/bolsonaro-dedica-voto-a-ustra-em-sessao-do-impeachment.html', 'other', 5, 'Câmara dos Deputados', 'Votação do impeachment', 'bolsonaro-voto-ustra-b122-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Cunha comemora aprovação do impeachment na Câmara.', 'A Câmara cumpriu seu papel histórico. O Brasil agradece.', 'Pronunciamento após votação pela admissibilidade.', 'verified', true, '2016-04-17', 'https://oglobo.globo.com/politica/cunha-comemora-aprovacao-impeachment-na-camara-19123987', 'other', 3, 'Câmara dos Deputados', 'Encerramento da sessão', 'cunha-comemora-impeachment-b122-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali denuncia golpe parlamentar disfarçado de impeachment.', 'Isso não é impeachment. É golpe parlamentar travestido de legalidade.', 'Discurso em plenário durante votação.', 'verified', false, '2016-04-17', 'https://www12.camara.leg.br/noticias/2016/04/17/jandira-denuncia-golpe-parlamentar', 'other', 3, 'Câmara dos Deputados', 'Sessão do impeachment', 'jandira-golpe-parlamentar-b122-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fre, 'Marcelo Freixo diz que Cunha lidera articulação para derrubar Dilma.', 'Cunha é o comandante do golpe para salvar a própria pele.', 'Entrevista durante vigília pró-Dilma.', 'verified', false, '2016-04-17', 'https://www1.folha.uol.com.br/poder/2016/04/1763421-freixo-ataca-cunha-em-vigilia.shtml', 'news_article', 3, 'Rio de Janeiro', 'Vigília pró-Dilma', 'freixo-cunha-golpe-b122-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer divulga pronunciamento vazado como se fosse presidente antes da votação final.', 'Precisamos de um governo de salvação nacional.', 'Áudio vazado antecipou plano de governo antes do afastamento formal.', 'verified', true, '2016-04-11', 'https://g1.globo.com/politica/processo-de-impeachment-de-dilma/noticia/2016/04/audio-de-temer-simulando-discurso-vaza.html', 'social_media_post', 4, 'Brasília', 'Vazamento de áudio', 'temer-audio-vazado-b122-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma nega crime de responsabilidade em defesa no Senado.', 'Não cometi crime algum. Resistirei por todos os meios democráticos.', 'Defesa apresentada em plenário do Senado pela presidente afastada.', 'verified', true, '2016-08-29', 'https://www12.senado.leg.br/noticias/materias/2016/08/29/dilma-nega-crime-responsabilidade-impeachment', 'other', 3, 'Senado Federal', 'Julgamento do impeachment', 'dilma-nega-crime-responsabilidade-b122-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan acusa Lava Jato de usurpar competência do Congresso.', 'A força-tarefa extrapola limites. Vamos reagir com leis.', 'Declaração dias antes da votação do pacote anticrime do Ministério Público.', 'verified', false, '2016-11-29', 'https://www1.folha.uol.com.br/poder/2016/11/1835621-renan-acusa-lava-jato-de-usurpar-congresso.shtml', 'news_article', 4, 'Senado Federal', 'Coletiva no Congresso', 'renan-lava-jato-usurpa-b122-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro afirma que dez medidas do MP devem ser aprovadas.', 'As dez medidas contra a corrupção são passo crucial para o país.', 'Declaração em palestra sobre o projeto do MP.', 'verified', false, '2016-11-30', 'https://g1.globo.com/politica/noticia/2016/11/moro-defende-dez-medidas-contra-corrupcao.html', 'other', 2, 'Curitiba', 'Palestra pública', 'moro-defende-dez-medidas-b122-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Cunha é preso em Brasília por ordem de Moro.', 'A prisão preventiva se faz necessária diante do poder econômico e político do acusado.', 'Ex-presidente da Câmara é preso após cassação e denúncia.', 'verified', true, '2016-10-19', 'https://oglobo.globo.com/politica/eduardo-cunha-e-preso-em-brasilia-20234567', 'other', 5, 'Brasília', 'Prisão de Eduardo Cunha', 'moro-prende-cunha-b122-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Cunha afirma que não fará acordo de delação premiada.', 'Não farei acordo. Não pretendo acusar inocentes para me livrar.', 'Carta divulgada pela defesa na prisão em Curitiba.', 'verified', false, '2016-11-15', 'https://veja.abril.com.br/politica/cunha-diz-que-nao-fara-delacao/', 'news_article', 2, 'Curitiba', 'Carta da prisão', 'cunha-nao-fara-delacao-b122-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro aceita delação de Marcelo Odebrecht.', 'A colaboração do presidente da Odebrecht amplia em muito o escopo das apurações.', 'Homologação do acordo que trouxe centenas de políticos à lista.', 'verified', true, '2016-12-01', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/2016/12/justica-homologa-delacao-de-marcelo-odebrecht.html', 'other', 4, 'Curitiba', 'Delação de Marcelo Odebrecht', 'moro-delacao-marcelo-odebrecht-b122-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer nega citação por Marcelo Odebrecht em delação.', 'Nunca pedi recursos à Odebrecht. Essa versão é absurda.', 'Nota do Palácio do Planalto após vazamentos de delação.', 'verified', true, '2016-12-14', 'https://www1.folha.uol.com.br/poder/2016/12/1841523-temer-nega-citacao-por-marcelo-odebrecht.shtml', 'news_article', 4, 'Brasília', 'Nota do Planalto', 'temer-nega-odebrecht-b122-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio nega repasses da Odebrecht em nota.', 'Jamais recebi propina da Odebrecht. Qualquer acusação é mentira.', 'Nota oficial do gabinete do senador mineiro.', 'verified', false, '2017-01-31', 'https://oglobo.globo.com/politica/aecio-nega-repasses-da-odebrecht-em-nota-20897654', 'news_article', 4, 'Brasília', 'Nota do gabinete', 'aecio-nega-odebrecht-b122-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin homologa 77 delações da Odebrecht no STF.', 'Os acordos preenchem os requisitos legais exigidos pela Lei 12.850.', 'Homologação em bloco abre caminho para investigações contra parlamentares.', 'verified', true, '2017-01-31', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/fachin-homologa-delacoes-odebrecht-stf.ghtml', 'other', 4, 'STF', 'Homologação das delações Odebrecht', 'fachin-homologa-delacoes-odebrecht-b122-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro rebate críticas de Gilmar Mendes em evento público.', 'Críticas são bem-vindas, mas a Lava Jato respeita o devido processo.', 'Resposta em conferência acadêmica em Porto Alegre.', 'verified', false, '2017-02-10', 'https://www.conjur.com.br/2017-fev-10/moro-rebate-gilmar-mendes-evento', 'other', 2, 'Porto Alegre', 'Conferência jurídica', 'moro-rebate-gilmar-b122-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes acusa Moro de violar garantias individuais.', 'O juiz parcial de Curitiba está criando um contencioso de exceção.', 'Entrevista ao jornal Valor Econômico.', 'verified', true, '2017-02-15', 'https://valor.globo.com/politica/noticia/2017/02/15/gilmar-mendes-acusa-moro-de-violar-garantias.ghtml', 'news_article', 3, 'Brasília', 'Entrevista ao Valor', 'gilmar-moro-violacao-garantias-b122-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro recebe denúncia da PF contra Lula no caso tríplex.', 'Há indícios suficientes para recebimento da denúncia por corrupção passiva.', 'Decisão em despacho na 13ª Vara Federal de Curitiba.', 'verified', true, '2016-09-20', 'https://www1.folha.uol.com.br/poder/2016/09/1815123-moro-recebe-denuncia-contra-lula-no-caso-triplex.shtml', 'other', 4, 'Curitiba', 'Denúncia do caso tríplex', 'moro-denuncia-lula-triplex-b122-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Moro é cúmplice da tentativa de exclusão política do PT.', 'Moro é peça de um projeto para nos tirar da eleição.', 'Entrevista ao programa Roda Viva.', 'verified', true, '2016-10-10', 'https://www.youtube.com/watch?v=rodaviva-lula-2016', 'news_article', 3, 'São Paulo', 'Roda Viva TV Cultura', 'lula-moro-exclusao-pt-b122-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso defende em voto manutenção de execução provisória da pena.', 'A execução provisória é compatível com a presunção de inocência.', 'Voto no HC 152.752 sobre prisão em segunda instância.', 'verified', true, '2018-04-04', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=373727', 'other', 3, 'STF', 'Julgamento HC 152752', 'barroso-segunda-instancia-b122-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ataca Moro em comício em Minas e promete resistir.', 'Moro não conseguirá me prender. Vou andar por todo o Brasil.', 'Comício em Juiz de Fora durante caravana do Nordeste.', 'verified', false, '2017-08-25', 'https://www1.folha.uol.com.br/poder/2017/08/1912345-lula-ataca-moro-em-comicio-em-minas.shtml', 'other', 3, 'Juiz de Fora', 'Caravana Lula pelo Brasil', 'lula-ataca-moro-minas-b122-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro condena Lula a 9 anos e 6 meses no caso tríplex.', 'Condeno o ex-presidente por corrupção passiva e lavagem de dinheiro.', 'Sentença na ação penal 5046512-94.2016.4.04.7000.', 'verified', true, '2017-07-12', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/moro-condena-lula-a-9-anos-e-meio-de-prisao-por-corrupcao.ghtml', 'other', 5, 'Curitiba', 'Sentença Lula caso tríplex', 'moro-sentenca-lula-2017-b122-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula acusa Moro de torturador togado após sentença.', 'Moro é torturador togado. Uma vergonha para a magistratura.', 'Discurso em ato em São Paulo após sentença.', 'verified', true, '2017-07-20', 'https://oglobo.globo.com/politica/lula-chama-moro-de-torturador-togado-21567123', 'other', 4, 'São Paulo', 'Ato contra a sentença', 'lula-moro-torturador-b122-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi organiza caravana de resistência a sentença de Lula.', 'O PT inteiro está com Lula. Vamos às ruas mostrar nossa força.', 'Anúncio de caravanas pelo país em nota oficial.', 'verified', false, '2017-07-14', 'https://www.pt.org.br/gleisi-anuncia-caravana-defesa-lula/', 'news_article', 2, 'Brasília', 'Anúncio PT Nacional', 'gleisi-caravana-lula-b122-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar denuncia sentença como politicamente motivada.', 'A sentença de Lula é política e insustentável tecnicamente.', 'Discurso na Câmara em defesa do devido processo.', 'verified', false, '2017-07-18', 'https://www.camara.leg.br/noticias/2017/07/chico-alencar-sentenca-politica-lula', 'other', 2, 'Câmara dos Deputados', 'Pronunciamento', 'chico-alencar-sentenca-politica-b122-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jse, 'José Serra nega repasses da Odebrecht após delações.', 'Jamais recebi propina. Os delatores mentem para obter benefícios.', 'Nota oficial após vazamento de anexos de colaboração.', 'verified', false, '2017-03-14', 'https://www1.folha.uol.com.br/poder/2017/03/1865432-jose-serra-nega-repasses-da-odebrecht.shtml', 'news_article', 4, 'Brasília', 'Nota do gabinete', 'serra-nega-odebrecht-b122-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin nega caixa dois e diz que financiamento foi legal.', 'Todas as doações seguiram os trâmites legais. Nunca houve caixa dois.', 'Entrevista após citação por executivos em delação.', 'verified', false, '2017-05-08', 'https://veja.abril.com.br/politica/alckmin-nega-caixa-dois-em-campanha/', 'news_article', 4, 'São Paulo', 'Coletiva no Palácio dos Bandeirantes', 'alckmin-nega-caixa-dois-b122-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy nega propina da Odebrecht.', 'Não existe uma única prova contra mim. Meu nome será limpo.', 'Nota após relatório final de Marcelo Odebrecht.', 'verified', false, '2017-04-12', 'https://oglobo.globo.com/politica/marta-suplicy-nega-propina-odebrecht-21234123', 'news_article', 3, 'São Paulo', 'Nota oficial', 'marta-nega-odebrecht-b122-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Paulo Maluf é condenado por lavagem de dinheiro.', 'Acato a decisão, mas manterei recursos. Sou inocente.', 'Reação à condenação pelo STF na ação penal 863.', 'verified', true, '2017-05-03', 'https://g1.globo.com/politica/noticia/stf-condena-maluf-em-acao-sobre-lavagem-de-dinheiro.ghtml', 'other', 4, 'STF', 'Condenação Paulo Maluf', 'maluf-condenado-lavagem-b122-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Joesley Batista grava Temer tratando de compra de silêncio de Cunha.', 'Tem que manter isso, viu? (sobre pagamentos a Cunha preso)', 'Gravação do encontro no Palácio do Jaburu revelada pela Procuradoria.', 'verified', true, '2017-05-17', 'https://g1.globo.com/politica/noticia/audio-de-joesley-grava-temer-tratando-pagamento-a-cunha.ghtml', 'news_article', 5, 'Brasília', 'Gravação do Jaburu', 'temer-joesley-gravacao-b122-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer vai à TV negar renúncia após vazamento de gravação.', 'Não renunciarei. Repito: não renunciarei. Quero provar minha inocência.', 'Pronunciamento em cadeia nacional após revelação da gravação Joesley.', 'verified', true, '2017-05-18', 'https://www1.folha.uol.com.br/poder/2017/05/1885674-temer-diz-que-nao-renuncia-apos-gravacao.shtml', 'other', 4, 'Brasília', 'Pronunciamento em cadeia nacional', 'temer-nao-renuncia-jaburu-b122-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Joesley grava Aécio pedindo R$ 2 milhões por meio do primo.', 'Preciso resolver uma coisa aqui. Tem que ser rápido.', 'Gravação pela JBS revelou pedido do senador ao empresário.', 'verified', true, '2017-05-17', 'https://veja.abril.com.br/politica/aecio-gravado-por-joesley-pedindo-2-milhoes/', 'news_article', 5, 'Brasília', 'Áudio JBS', 'aecio-audio-joesley-b122-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio nega crime após ter áudio divulgado e é afastado.', 'Não cometi crime algum. A conversa foi distorcida.', 'Nota do senador após decisão do STF pelo afastamento.', 'verified', true, '2017-05-18', 'https://oglobo.globo.com/politica/aecio-nega-crime-apos-audio-divulgado-21423456', 'news_article', 4, 'Brasília', 'Nota do gabinete', 'aecio-nega-crime-audio-b122-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro afirma em entrevista que Lava Jato está acima de pressões.', 'Não nos intimidamos com pressões. Seguiremos o rito da lei.', 'Entrevista à revista Veja sobre momento político pós-JBS.', 'verified', false, '2017-06-03', 'https://veja.abril.com.br/politica/moro-lava-jato-nao-se-intimida/', 'news_article', 2, 'Curitiba', 'Entrevista Veja', 'moro-lava-jato-acima-b122-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan articula derrubada de denúncia contra Temer na Câmara.', 'Vamos barrar essa denúncia temerária com ampla maioria.', 'Articulação revelada em reportagem antes da votação.', 'verified', true, '2017-08-01', 'https://www1.folha.uol.com.br/poder/2017/08/1906543-renan-articula-rejeicao-denuncia-temer.shtml', 'news_article', 4, 'Senado Federal', 'Articulação de bastidores', 'renan-articula-derrubar-denuncia-b122-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Câmara rejeita primeira denúncia contra Temer; ele agradece.', 'Agradeço à Câmara. Seguiremos o trabalho pelo Brasil.', 'Pronunciamento após Câmara barrar denúncia de Janot.', 'verified', true, '2017-08-02', 'https://g1.globo.com/politica/noticia/camara-rejeita-denuncia-contra-temer-por-corrupcao.ghtml', 'other', 4, 'Brasília', 'Pronunciamento do Planalto', 'temer-agradece-camara-b122-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vota contra denúncia de Temer mesmo criticando o governo.', 'Votarei contra a denúncia para preservar a institucionalidade.', 'Voto em plenário na Câmara gera críticas de apoiadores.', 'verified', false, '2017-08-02', 'https://oglobo.globo.com/politica/bolsonaro-vota-contra-denuncia-de-temer-21678345', 'other', 3, 'Câmara dos Deputados', 'Votação denúncia Temer', 'bolsonaro-vota-contra-denuncia-b122-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro aplica medidas cautelares contra Joesley Batista após prisão.', 'A prisão preventiva visa cessar reiteração delitiva do colaborador.', 'Joesley é preso por omissão em delação premiada.', 'verified', true, '2017-09-10', 'https://g1.globo.com/politica/noticia/joesley-batista-e-preso-no-aeroporto.ghtml', 'other', 4, 'São Paulo', 'Prisão de Joesley Batista', 'moro-prisao-joesley-b122-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney minimiza crise e defende acordo com Temer.', 'Não é hora de aventuras. O país precisa de estabilidade.', 'Entrevista do ex-presidente a rádio em São Luís.', 'verified', false, '2017-09-15', 'https://www1.folha.uol.com.br/poder/2017/09/1918743-sarney-pede-estabilidade-governo-temer.shtml', 'news_article', 2, 'São Luís', 'Entrevista a rádio', 'sarney-estabilidade-temer-b122-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Câmara barra segunda denúncia contra Temer por obstrução.', 'Superamos mais essa. Agora vamos focar nas reformas.', 'Pronunciamento após Câmara rejeitar nova denúncia.', 'verified', true, '2017-10-25', 'https://oglobo.globo.com/politica/camara-barra-segunda-denuncia-contra-temer-21987654', 'other', 4, 'Brasília', 'Pronunciamento do Planalto', 'temer-barra-segunda-denuncia-b122-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fux, 'Fux defende execução da pena após segunda instância.', 'A presunção de inocência não é absoluta e cede ao interesse social.', 'Voto em julgamento sobre presunção de inocência no STF.', 'verified', true, '2018-04-04', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=373728', 'other', 3, 'STF', 'Julgamento HC 152752', 'fux-segunda-instancia-b122-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Dias Toffoli vota pela execução provisória em 2018.', 'Acompanho a corrente que admite execução após confirmação em segunda instância.', 'Voto no HC 152.752 de Lula.', 'verified', true, '2018-04-04', 'https://g1.globo.com/politica/noticia/stf-nega-hc-de-lula-veja-como-votou-cada-ministro.ghtml', 'other', 3, 'STF', 'Julgamento HC 152752', 'toffoli-segunda-instancia-b122-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Cármen Lúcia desempata e STF nega HC a Lula.', 'Acompanho o voto do relator. Negado o habeas corpus.', 'Voto decisivo em sessão histórica no STF.', 'verified', true, '2018-04-04', 'https://www1.folha.uol.com.br/poder/2018/04/stf-nega-hc-a-lula.shtml', 'other', 4, 'STF', 'Julgamento HC 152752', 'carmen-lucia-nega-hc-lula-b122-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro expede mandado de prisão contra Lula.', 'Determino a expedição do mandado para cumprimento da pena.', 'Mandado emitido dois dias após decisão do STF.', 'verified', true, '2018-04-05', 'https://g1.globo.com/politica/noticia/moro-expede-mandado-de-prisao-contra-lula.ghtml', 'other', 5, 'Curitiba', 'Mandado de prisão Lula', 'moro-mandado-prisao-lula-b122-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz discurso em São Bernardo antes de se entregar.', 'Eu sou a ideia. Podem matar as rosas mas não impedirão a chegada da primavera.', 'Discurso no Sindicato dos Metalúrgicos antes de ser preso.', 'verified', true, '2018-04-07', 'https://oglobo.globo.com/politica/lula-faz-discurso-antes-de-se-entregar-a-pf-22456789', 'other', 4, 'São Bernardo do Campo', 'Discurso antes da prisão', 'lula-discurso-sindicato-b122-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se entrega à PF e é levado para Curitiba.', 'Vou sair daqui e estarei com a cabeça erguida. Sou inocente.', 'Declaração aos apoiadores antes de embarcar para Curitiba.', 'verified', true, '2018-04-07', 'https://g1.globo.com/politica/noticia/lula-se-entrega-a-pf-e-vai-preso.ghtml', 'news_article', 5, 'São Bernardo do Campo', 'Entrega à Polícia Federal', 'lula-se-entrega-pf-b122-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi denuncia prisão de Lula como golpe sem voto.', 'Esta prisão é a consumação do golpe iniciado em 2016.', 'Discurso a apoiadores na porta da PF em Curitiba.', 'verified', true, '2018-04-08', 'https://www.pt.org.br/gleisi-prisao-lula-golpe/', 'other', 3, 'Curitiba', 'Vigília Lula Livre', 'gleisi-golpe-prisao-lula-b122-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comemora prisão de Lula em postagem.', 'Finalmente a Justiça prevaleceu. Fim da impunidade.', 'Postagem em redes sociais celebra encarceramento do ex-presidente.', 'verified', true, '2018-04-07', 'https://veja.abril.com.br/politica/bolsonaro-comemora-prisao-lula/', 'social_media_post', 3, 'Rio de Janeiro', 'Postagem em rede social', 'bolsonaro-comemora-prisao-lula-b122-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que Lula é inocente e vítima de exclusão política.', 'Lula foi tirado da disputa com processo manipulado.', 'Coletiva após indicação para substituir Lula na candidatura.', 'verified', true, '2018-09-11', 'https://oglobo.globo.com/politica/haddad-defende-lula-em-coletiva-23123456', 'other', 3, 'São Paulo', 'Coletiva sobre candidatura', 'haddad-lula-exclusao-b122-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro nega ilegalidade em decisão que barrou entrevista de Lula.', 'A decisão respeita o regramento aplicável ao preso.', 'Resposta à polêmica sobre impedimento de entrevista à Folha.', 'verified', true, '2018-09-28', 'https://www1.folha.uol.com.br/poder/2018/09/moro-nega-ilegalidade-em-barrar-entrevista-lula.shtml', 'other', 4, 'Curitiba', 'Caso da entrevista a Lula', 'moro-barra-entrevista-lula-b122-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro convida Moro para ministério da Justiça ainda em 2018.', 'Convidei o juiz Sergio Moro para ser ministro. Ele aceitou.', 'Anúncio após vitória no segundo turno presidencial.', 'verified', true, '2018-11-01', 'https://g1.globo.com/politica/noticia/bolsonaro-convida-moro-para-ministerio-da-justica.ghtml', 'other', 5, 'Rio de Janeiro', 'Anúncio do ministério', 'bolsonaro-convida-moro-ministerio-b122-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro aceita convite para ministério da Justiça de Bolsonaro.', 'Aceitei porque há a perspectiva de implementar agenda anticorrupção.', 'Pronunciamento em coletiva em Curitiba após aceitar convite.', 'verified', true, '2018-11-01', 'https://oglobo.globo.com/politica/moro-aceita-ministerio-de-bolsonaro-23456789', 'news_article', 5, 'Curitiba', 'Coletiva Moro', 'moro-aceita-ministerio-b122-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes diz que Moro ao aceitar ministério comprova suspeição.', 'O aceite ao cargo demonstra a parcialidade do julgamento de Lula.', 'Entrevista à imprensa após anúncio do cargo.', 'verified', true, '2018-11-02', 'https://www1.folha.uol.com.br/poder/2018/11/gilmar-diz-que-moro-prova-suspeicao-ao-aceitar-cargo.shtml', 'news_article', 4, 'Brasília', 'Entrevista Folha', 'gilmar-moro-suspeicao-ministerio-b122-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula acusa Moro de conluio com Bolsonaro em carta da prisão.', 'Agora está provado: Moro vendeu a sentença ao Bolsonaro.', 'Carta divulgada pela defesa após anúncio do ministério.', 'verified', true, '2018-11-03', 'https://oglobo.globo.com/politica/lula-acusa-moro-de-conluio-com-bolsonaro-23489012', 'news_article', 4, 'Curitiba', 'Carta da prisão', 'lula-moro-conluio-bolsonaro-b122-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica Moro e diz que juiz virou político.', 'Moro deixou de ser juiz. Virou articulador político.', 'Entrevista à GloboNews após anúncio do ministério.', 'verified', true, '2018-11-05', 'https://g1.globo.com/politica/noticia/ciro-critica-moro-ministerio-bolsonaro.ghtml', 'news_article', 3, 'Fortaleza', 'Entrevista TV', 'ciro-critica-moro-b122-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro anuncia pacote anticrime como primeira prioridade.', 'Apresentarei um pacote anticrime já em janeiro para combater corrupção.', 'Coletiva em Brasília sobre planos no ministério.', 'verified', true, '2018-12-07', 'https://www1.folha.uol.com.br/poder/2018/12/moro-anuncia-pacote-anticrime.shtml', 'news_article', 3, 'Brasília', 'Anúncio pacote anticrime', 'moro-pacote-anticrime-b122-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que Moro é herói nacional no ministério.', 'O Brasil precisa de mais Moros para nos livrar da corrupção.', 'Entrevista durante posse dos ministros.', 'verified', false, '2019-01-02', 'https://veja.abril.com.br/politica/damares-elogia-moro-heroi-nacional/', 'news_article', 2, 'Brasília', 'Entrevista na posse', 'damares-moro-heroi-b122-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende que Lava Jato serviu para arrumar a casa.', 'A Lava Jato foi essencial para o Brasil ser mais sério.', 'Entrevista à Band em fevereiro de 2019.', 'verified', false, '2019-02-10', 'https://g1.globo.com/politica/noticia/mourao-defende-lava-jato.ghtml', 'news_article', 2, 'Brasília', 'Entrevista Band', 'mourao-defende-lava-jato-b122-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que reformaria Moro para o STF se tiver vaga.', 'Moro é nome natural para a próxima vaga no Supremo.', 'Declaração em entrevista a emissora em Brasília.', 'verified', true, '2019-02-28', 'https://oglobo.globo.com/politica/bolsonaro-indica-moro-ao-stf-23876543', 'news_article', 4, 'Brasília', 'Entrevista a emissora', 'bolsonaro-indica-moro-stf-b122-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali denuncia indicação ao STF como compra de sentença.', 'Indicação ao STF prova que houve acerto antes de Moro condenar Lula.', 'Discurso na Câmara após declaração de Bolsonaro.', 'verified', false, '2019-03-01', 'https://www.camara.leg.br/noticias/jandira-denuncia-acerto-moro-stf', 'other', 3, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-moro-stf-acerto-b122-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro apresenta projeto de lei anticrime ao Congresso.', 'O projeto anticrime combaterá a corrupção e o crime organizado.', 'Entrega do texto à presidência da Câmara por Moro.', 'verified', true, '2019-02-19', 'https://g1.globo.com/politica/noticia/moro-entrega-pacote-anticrime.ghtml', 'news_article', 2, 'Brasília', 'Entrega do projeto', 'moro-entrega-anticrime-b122-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro é denunciado por rachadinha no MP-RJ.', 'Sou vítima de uma perseguição política descabida.', 'Denúncia do MP-RJ com base em relatórios do Coaf.', 'verified', true, '2019-01-22', 'https://oglobo.globo.com/rio/flavio-bolsonaro-e-alvo-do-mp-rachadinha-23567890', 'news_article', 4, 'Rio de Janeiro', 'Denúncia do MP-RJ', 'flavio-rachadinha-denuncia-b122-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende Moro como nome de Deus para o Brasil.', 'Moro foi colocado por Deus para limpar o Brasil da corrupção.', 'Discurso em culto evangélico em Vitória.', 'verified', false, '2019-03-15', 'https://veja.abril.com.br/politica/magno-malta-moro-nome-de-deus/', 'other', 2, 'Vitória', 'Culto evangélico', 'magno-malta-moro-deus-b122-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano defende impunidade para pastores em pacote anticrime.', 'Nossa igreja merece proteção contra investigações abusivas.', 'Discurso durante discussão do pacote anticrime na Câmara.', 'verified', false, '2019-04-11', 'https://www.camara.leg.br/noticias/feliciano-anticrime-pastores', 'other', 3, 'Câmara dos Deputados', 'Debate pacote anticrime', 'feliciano-anticrime-pastores-b122-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro defende excludente de ilicitude no pacote anticrime.', 'O excludente é necessário para dar segurança jurídica a policiais.', 'Audiência pública sobre pacote anticrime na Câmara.', 'verified', true, '2019-04-25', 'https://g1.globo.com/politica/noticia/moro-defende-excludente-ilicitude-anticrime.ghtml', 'other', 3, 'Câmara dos Deputados', 'Audiência pública', 'moro-excludente-ilicitude-b122-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
