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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama Covid-19 de "gripezinha" e minimiza risco sanitário.', 'É uma gripezinha, um resfriadinho. No meu caso particular, pelo meu histórico de atleta, eu não precisaria me preocupar.', 'Pronunciamento em rede nacional em 24 de março de 2020, pouco depois da OMS declarar pandemia. A fala contrariou orientações do Ministério da Saúde e foi considerada marco inicial do negacionismo presidencial.', 'verified', true, '2020-03-24', 'https://g1.globo.com/politica/noticia/2020/03/24/em-pronunciamento-bolsonaro-critica-governadores-e-diz-que-midia-propaga-panico-com-coronavirus.ghtml', 'news_article', 5, 'Palácio do Planalto', 'Pronunciamento em rede nacional', 'bolsonaro-gripezinha-pronunciamento-b100-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro responde "e daí?" a repórter sobre recorde de mortes por Covid-19.', 'E daí? Lamento. Quer que eu faça o quê? Eu sou Messias, mas não faço milagre.', 'Resposta dada em 28 de abril de 2020 quando o Brasil bateu recorde de mortes diárias (474) e ultrapassou a China em óbitos. A frase se tornou símbolo da indiferença presidencial diante da pandemia.', 'verified', true, '2020-04-28', 'https://www1.folha.uol.com.br/cotidiano/2020/04/e-dai-lamento-quer-que-eu-faca-o-que-diz-bolsonaro-sobre-mortes-por-coronavirus.shtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-e-dai-mortes-b100-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Brasil precisa "parar de ser país de maricas" diante da pandemia.', 'O Brasil precisa deixar de ser um país de maricas. Tem que enfrentar o peito aberto, porra. Vamos enfrentar o problema.', 'Declaração feita em 10 de novembro de 2020 a apoiadores em Brasília, quando o país ultrapassava 162 mil mortes por Covid-19. A fala foi classificada por entidades LGBTQIA+ como homofóbica e negacionista.', 'verified', true, '2020-11-10', 'https://www.bbc.com/portuguese/brasil-54899578', 'news_article', 4, 'Palácio da Alvorada', 'Declaração a apoiadores', 'bolsonaro-pais-de-maricas-b100-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro promove uso de cloroquina sem comprovação científica contra Covid-19.', 'Eu acredito na cloroquina. Funciona. Quem é de direita toma cloroquina, quem é de esquerda toma Tubaína.', 'Declaração em live nas redes sociais em julho de 2020, reforçando politização do tratamento precoce. Estudos clínicos já indicavam ineficácia e riscos cardíacos da cloroquina contra Covid-19.', 'verified', true, '2020-07-23', 'https://www.cnnbrasil.com.br/politica/quem-e-de-direita-toma-cloroquina-quem-e-de-esquerda-toma-tubaina-diz-bolsonaro/', 'news_article', 5, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-cloroquina-tubaina-b100-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro demite Mandetta após conflitos sobre isolamento social e cloroquina.', 'Acabei de demitir o Ministro da Saúde Luiz Henrique Mandetta. Havia incompatibilidade com o presidente.', 'Anúncio em 16 de abril de 2020 após meses de embates públicos sobre a condução da pandemia. Mandetta defendia isolamento social e questionava eficácia da cloroquina.', 'verified', true, '2020-04-16', 'https://www1.folha.uol.com.br/cotidiano/2020/04/bolsonaro-demite-mandetta-do-ministerio-da-saude.shtml', 'news_article', 4, 'Palácio do Planalto', 'Anúncio de demissão', 'bolsonaro-demissao-mandetta-b100-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles propõe "passar a boiada" em regulamentações ambientais aproveitando pandemia.', 'Precisamos ter um esforço nosso aqui enquanto estamos nesse momento de tranquilidade no aspecto de cobertura de imprensa, porque só fala de Covid, e ir passando a boiada e mudando todo o regramento.', 'Declaração feita na reunião ministerial de 22 de abril de 2020, cujo vídeo foi divulgado por determinação do STF no inquérito das fake news. A fala se tornou emblemática do uso da pandemia como oportunidade de desmonte ambiental.', 'verified', true, '2020-04-22', 'https://g1.globo.com/politica/noticia/2020/05/22/ministro-do-meio-ambiente-defende-passar-a-boiada-e-mudar-regramento-e-simplificar-normas.ghtml', 'news_article', 5, 'Palácio do Planalto', 'Reunião ministerial', 'salles-passar-a-boiada-b100-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro participa de manifestação antidemocrática com pedido de intervenção militar.', 'Eu estou aqui porque acredito em vocês. Vocês estão aqui porque acreditam no Brasil. Nós não queremos negociar nada. O que nós queremos é ação pelo Brasil.', 'Discurso feito em 19 de abril de 2020 em frente ao QG do Exército em Brasília, em ato com faixas pedindo intervenção militar, fechamento do STF e do Congresso, em plena pandemia.', 'verified', true, '2020-04-19', 'https://g1.globo.com/politica/noticia/2020/04/19/em-ato-com-pedido-de-intervencao-militar-bolsonaro-critica-politica-tradicional.ghtml', 'news_article', 5, 'QG do Exército — Brasília', 'Ato pró-governo', 'bolsonaro-qg-exercito-intervencao-b100-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que não comprará CoronaVac e chama vacina de "chinesa do Doria".', 'Não será comprada. Meu governo não comprará a vacina chinesa. O povo brasileiro NÃO SERÁ COBAIA DE NINGUÉM.', 'Postagem em redes sociais em 21 de outubro de 2020, um dia depois do Ministério da Saúde anunciar intenção de adquirir a CoronaVac. A fala politizou a vacina e gerou crise com João Doria e o Butantan.', 'verified', true, '2020-10-21', 'https://www1.folha.uol.com.br/equilibrioesaude/2020/10/bolsonaro-diz-que-nao-comprara-vacina-chinesa-do-joao-doria.shtml', 'social_media_post', 5, 'Twitter', 'Postagem em rede social', 'bolsonaro-vacina-chinesa-doria-b100-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ironiza efeitos colaterais da vacina e sugere virar jacaré.', 'Na Pfizer, está bem claro: "não nos responsabilizamos por qualquer efeito colateral". Se você virar um jacaré, é problema seu.', 'Live semanal em 17 de dezembro de 2020, em que o presidente ridicularizou vacinas contra Covid-19 e desestimulou imunização em massa durante avanço da segunda onda.', 'verified', true, '2020-12-17', 'https://g1.globo.com/politica/noticia/2020/12/17/se-voce-virar-um-jacare-e-problema-seu-diz-bolsonaro-sobre-efeitos-colaterais-da-vacina-contra-a-covid-19.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-jacare-vacina-b100-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que vacina contra Covid-19 não será obrigatória em nenhuma hipótese.', 'Ninguém pode obrigar ninguém a tomar vacina. Meu governo não vai obrigar e eu não vou tomar, ponto final.', 'Declaração em coletiva em Brasília em 1º de setembro de 2020. A fala contrariava orientação de infectologistas e do PNI sobre importância da adesão coletiva.', 'verified', false, '2020-09-01', 'https://www.cnnbrasil.com.br/politica/bolsonaro-diz-que-ninguem-pode-obrigar-ninguem-a-tomar-vacina/', 'news_article', 4, 'Palácio do Planalto', 'Coletiva de imprensa', 'bolsonaro-vacina-nao-obrigatoria-b100-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama Covid-19 de "vírus chinês" em postagens.', 'A culpa é da China. Eles esconderam o vírus chinês do mundo. Vamos responsabilizá-los.', 'Postagens em 18 de março de 2020 que geraram crise diplomática com Pequim, com o embaixador chinês reagindo publicamente.', 'verified', true, '2020-03-18', 'https://www1.folha.uol.com.br/mundo/2020/03/eduardo-bolsonaro-e-criticado-por-embaixador-chines-apos-acusacao-sobre-coronavirus.shtml', 'social_media_post', 4, 'Twitter', 'Postagem em rede social', 'eduardo-virus-chines-b100-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_rac, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca governadores que decretaram isolamento como "tiranos".', 'Os governadores tiranos estão destruindo a economia com esse confinamento ditatorial. Vão responder na História.', 'Postagens em rede social em abril de 2020, parte de campanha coordenada contra medidas estaduais de distanciamento.', 'verified', false, '2020-04-08', 'https://www.cartacapital.com.br/politica/carlos-bolsonaro-ataca-governadores-que-decretaram-quarentena/', 'social_media_post', 3, 'Twitter', 'Postagem em rede social', 'carlos-governadores-tiranos-b100-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende cloroquina no Senado e critica Mandetta.', 'O ministro Mandetta não pode ficar dificultando o acesso à cloroquina. O presidente já disse: quem quiser, deve ter o medicamento.', 'Fala no plenário do Senado em 7 de abril de 2020, somando pressão política contra o ministro da Saúde.', 'verified', false, '2020-04-07', 'https://www12.senado.leg.br/noticias/materias/2020/04/07/flavio-bolsonaro-defende-cloroquina-covid', 'news_article', 4, 'Senado Federal', 'Pronunciamento em plenário', 'flavio-defende-cloroquina-b100-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que "oração cura" em evento durante pandemia.', 'A oração é o melhor remédio. Deus está curando brasileiros da Covid pela fé.', 'Declaração em culto virtual em maio de 2020, criticada por sanitaristas por desestimular medidas médicas.', 'verified', false, '2020-05-20', 'https://www.metropoles.com/brasil/politica-br/damares-oracao-cura-covid', 'news_article', 3, 'Transmissão virtual', 'Culto evangélico', 'damares-oracao-cura-b100-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sérgio Moro pede demissão e acusa Bolsonaro de interferência política na PF.', 'O presidente me disse mais de uma vez, mesmo na frente de outros ministros, que queria ter uma pessoa do contato pessoal dele, para que ele pudesse ter informações, relatórios de inteligência.', 'Coletiva em 24 de abril de 2020 em que Moro deixou o Ministério da Justiça após Bolsonaro exonerar o diretor-geral da PF, Maurício Valeixo.', 'verified', true, '2020-04-24', 'https://g1.globo.com/politica/noticia/2020/04/24/leia-a-integra-do-discurso-de-demissao-do-ministro-sergio-moro.ghtml', 'news_article', 4, 'Ministério da Justiça', 'Pronunciamento de demissão', 'moro-pedido-demissao-b100-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro veta obrigatoriedade de máscaras em locais públicos.', 'Máscara em igreja, escola e comércio é exagero. Vetei. Cada um se vira.', 'Em 3 de julho de 2020 Bolsonaro vetou dispositivos da Lei 14.019/2020 que obrigavam máscaras em estabelecimentos comerciais, religiosos e educacionais.', 'verified', true, '2020-07-03', 'https://www1.folha.uol.com.br/equilibrioesaude/2020/07/bolsonaro-veta-obrigatoriedade-de-mascaras-em-comercios-igrejas-e-escolas.shtml', 'news_article', 4, 'Palácio do Planalto', 'Sanção de lei', 'bolsonaro-veto-mascaras-b100-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro zomba de pacientes intubados e compara a "falta de homem".', 'Tudo é pandemia, tem que acabar esse negócio. Lamento os mortos, lamento, mas é o destino de todo mundo.', 'Discurso a apoiadores em 5 de novembro de 2020 em Brasília, minimizando mortes acumuladas no país.', 'verified', false, '2020-11-05', 'https://www.cnnbrasil.com.br/politica/bolsonaro-ironiza-mortos-pandemia-novembro/', 'news_article', 5, 'Palácio da Alvorada', 'Declaração a apoiadores', 'bolsonaro-destino-todo-mundo-b100-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Alexandre de Moraes confirma competência dos estados sobre medidas sanitárias.', 'Estados e municípios têm competência concorrente para adotar medidas de enfrentamento da pandemia, independentemente do Executivo federal.', 'Voto na ADI 6341 em 15 de abril de 2020, na qual o STF reconheceu autonomia dos entes federados contra o esvaziamento feito por Bolsonaro.', 'verified', true, '2020-04-15', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=441447', 'diario_oficial', 1, 'Supremo Tribunal Federal', 'Julgamento ADI 6341', 'moraes-competencia-estados-covid-b100-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama governadores de "ditadores" pela quarentena.', 'Esses governadores estão implantando uma ditadura sanitária. Estão destruindo empregos com decretos arbitrários.', 'Entrevista em 27 de março de 2020 em que o presidente radicalizou retórica contra governos estaduais que decretaram isolamento.', 'verified', true, '2020-03-27', 'https://g1.globo.com/politica/noticia/2020/03/27/bolsonaro-critica-governadores-e-diz-que-brasil-nao-pode-parar.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Entrevista à imprensa', 'bolsonaro-governadores-ditadores-b100-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro cumprimenta apoiadores em meio à multidão sem máscara.', 'Povo na rua é democracia. Vírus não se pega assim, tá bom? Abração em todo mundo.', 'Em 15 de março de 2020, dias após o Ministério da Saúde recomendar distanciamento, Bolsonaro foi a ato em Brasília e cumprimentou centenas de pessoas.', 'verified', true, '2020-03-15', 'https://www1.folha.uol.com.br/poder/2020/03/bolsonaro-cumprimenta-apoiadores-em-manifestacao-em-brasilia.shtml', 'news_article', 4, 'Esplanada dos Ministérios', 'Manifestação pró-governo', 'bolsonaro-cumprimenta-apoiadores-b100-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa, ex-ministro da Saúde, denuncia desmonte do SUS em plena pandemia.', 'O governo Bolsonaro está sabotando o SUS no momento que o país mais precisa. Isso é crime contra a saúde pública.', 'Pronunciamento no Senado em 5 de maio de 2020 após demissão de Mandetta e indefinição sobre reposição de leitos.', 'verified', false, '2020-05-05', 'https://www12.senado.leg.br/noticias/materias/2020/05/05/humberto-costa-cobra-politica-nacional-contra-a-covid-19', 'news_article', 1, 'Senado Federal', 'Pronunciamento em plenário', 'humberto-costa-sus-pandemia-b100-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça intervenção federal em estados que decretaram lockdown.', 'Se governador insistir em destruir empregos, vou usar a Constituição. Existe intervenção federal prevista.', 'Declaração em entrevista em 30 de março de 2020, interpretada por juristas como ameaça ao pacto federativo.', 'verified', false, '2020-03-30', 'https://oglobo.globo.com/politica/bolsonaro-acena-com-intervencao-federal-em-estados-por-medidas-contra-covid-24341234', 'news_article', 4, 'Palácio da Alvorada', 'Entrevista à imprensa', 'bolsonaro-ameaca-intervencao-federal-b100-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão diz que isolamento vertical é "mais sensato" contrariando ciência.', 'O isolamento vertical, só dos idosos e doentes crônicos, seria mais racional. O Brasil não pode parar.', 'Declaração em 26 de março de 2020 a jornalistas, alinhada à posição de Bolsonaro e contra OMS.', 'verified', false, '2020-03-26', 'https://g1.globo.com/politica/noticia/2020/03/26/mourao-defende-isolamento-vertical-para-conter-coronavirus.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Entrevista à imprensa', 'mourao-isolamento-vertical-b100-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Paulo Guedes diz que economia não pode "parar por uma gripe".', 'Não podemos quebrar a economia por uma doença que, ao fim, tem taxa de letalidade controlável.', 'Reunião com empresários em 24 de março de 2020, alinhada ao discurso negacionista do presidente.', 'verified', false, '2020-03-24', 'https://valor.globo.com/politica/noticia/2020/03/24/guedes-defende-fim-rapido-do-isolamento-social.ghtml', 'news_article', 3, 'Ministério da Economia', 'Reunião com empresários', 'guedes-economia-gripe-b100-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro anuncia Nelson Teich como novo ministro da Saúde.', 'Teve uma conversa franca, temos afinidade. Ele tem liberdade, mas vai trabalhar sob minha diretriz.', 'Anúncio em 17 de abril de 2020, um dia após demitir Mandetta, sinalizando exigência de alinhamento ao Planalto.', 'verified', false, '2020-04-17', 'https://www.bbc.com/portuguese/brasil-52334205', 'news_article', 2, 'Palácio do Planalto', 'Anúncio de nomeação', 'bolsonaro-anuncia-teich-b100-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pressiona Teich a liberar cloroquina para todos os casos de Covid.', 'A cloroquina tem que ser usada. Não vou admitir que ministro desobedeça orientação de quem foi eleito.', 'Reunião em 14 de maio de 2020. Teich pediu demissão horas depois, citando falta de autonomia.', 'verified', true, '2020-05-14', 'https://www1.folha.uol.com.br/equilibrioesaude/2020/05/nelson-teich-pede-demissao-do-ministerio-da-saude.shtml', 'news_article', 4, 'Palácio do Planalto', 'Reunião com ministro', 'bolsonaro-pressao-teich-cloroquina-b100-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nomeia general Pazuello, sem formação em saúde, para ministério.', 'O Pazuello vem dando conta do recado. Vai ficar. Está dando certo.', 'Declaração em 2 de junho de 2020 confirmando Pazuello como ministro interino, militar sem experiência em saúde pública.', 'verified', true, '2020-06-02', 'https://g1.globo.com/politica/noticia/2020/06/02/general-pazuello-assume-ministerio-da-saude-interinamente.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-nomeacao-pazuello-b100-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro esconde número de mortes diárias em novo padrão do Ministério da Saúde.', 'Acabou matéria no Jornal Nacional. Isso não reflete o momento em que o país se encontra.', 'Declaração em 5 de junho de 2020 após mudança no site do Ministério da Saúde que ocultou número total de mortes, revertida por decisão do STF.', 'verified', true, '2020-06-05', 'https://g1.globo.com/politica/noticia/2020/06/05/bolsonaro-comemora-fim-de-divulgacao-de-dados-detalhados-da-covid-19.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-acabou-jornal-nacional-b100-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_oma, 'Omar Aziz denuncia subnotificação e pede CPI da Pandemia.', 'O governo federal está maquiando dados para esconder mortes. Precisamos de uma CPI urgente.', 'Pronunciamento no Senado em 8 de junho de 2020, antecedendo a CPI que seria instalada em 2021.', 'verified', false, '2020-06-08', 'https://www12.senado.leg.br/noticias/materias/2020/06/08/omar-aziz-cobra-transparencia-sobre-mortes-covid', 'news_article', 1, 'Senado Federal', 'Pronunciamento em plenário', 'omar-aziz-subnotificacao-b100-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso determina publicação integral dos dados de Covid pelo governo.', 'A transparência é pressuposto da democracia. O governo deve retornar à divulgação anterior dos dados de Covid-19.', 'Decisão liminar em 8 de junho de 2020 na ADPF 690, obrigando o Ministério da Saúde a retomar divulgação completa.', 'verified', true, '2020-06-08', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=444954', 'diario_oficial', 1, 'Supremo Tribunal Federal', 'Decisão liminar — ADPF 690', 'barroso-transparencia-dados-covid-b100-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro anuncia teste positivo para Covid-19 e defende cloroquina.', 'Tomei hidroxicloroquina. Estou com o vírus dentro de mim, mas já me sinto bem. Recomendo a todos.', 'Anúncio em coletiva em 7 de julho de 2020, em que Bolsonaro tirou a máscara diante de jornalistas ao confirmar contágio.', 'verified', true, '2020-07-07', 'https://g1.globo.com/politica/noticia/2020/07/07/bolsonaro-testa-positivo-para-coronavirus.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Coletiva de imprensa', 'bolsonaro-positivo-cloroquina-b100-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles aproveita foco na pandemia para flexibilizar licenciamento ambiental.', 'Estamos aproveitando este momento para revisar normas que o agro precisa. Sem holofote da imprensa.', 'Trecho da reunião ministerial de 22 de abril de 2020 complementar ao episódio da "boiada".', 'verified', false, '2020-04-22', 'https://www1.folha.uol.com.br/ambiente/2020/05/salles-diz-em-reuniao-ministerial-que-e-preciso-passar-a-boiada-em-mudancas-de-regras.shtml', 'news_article', 5, 'Palácio do Planalto', 'Reunião ministerial', 'salles-flexibilizar-licenciamento-b100-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli protagoniza ato com armas e ataques ao STF durante pandemia.', 'Vou continuar lutando com a arma que tenho, com a palavra, com o fuzil se preciso. STF precisa respeitar o povo.', 'Participação em ato anti-STF em 31 de maio de 2020, em plena pandemia, aglomerando apoiadores em Brasília.', 'verified', true, '2020-05-31', 'https://www.cartacapital.com.br/politica/zambelli-participa-de-ato-antidemocratico-em-brasilia/', 'news_article', 4, 'Esplanada dos Ministérios', 'Manifestação pró-governo', 'zambelli-ato-stf-pandemia-b100-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira xinga ministros do STF e defende AI-5 em vídeo.', 'Esses ministros togados deveriam estar presos. O Brasil precisa de um novo AI-5 para limpar a Casa.', 'Vídeo publicado em 25 de outubro de 2020. Levou a inquérito no STF e à cassação do mandato em 2021.', 'verified', true, '2020-10-25', 'https://g1.globo.com/politica/noticia/2020/10/25/daniel-silveira-ataca-ministros-do-stf-e-defende-ai-5.ghtml', 'social_media_post', 5, 'Redes sociais', 'Vídeo em rede social', 'daniel-silveira-ai5-stf-b100-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende fim do isolamento e chama pandemia de "pânico inventado".', 'Estão inventando essa pandemia para derrubar Bolsonaro. É tudo uma narrativa da grande mídia.', 'Postagem em 5 de abril de 2020 que viralizou entre apoiadores do governo.', 'verified', false, '2020-04-05', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-panico-covid-narrativa', 'social_media_post', 5, 'Twitter', 'Postagem em rede social', 'bia-kicis-panico-inventado-b100-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem critica auxílio emergencial por "desincentivar trabalho".', 'Esse auxílio emergencial foi mal desenhado e vai manter gente em casa sem querer trabalhar.', 'Discurso na Câmara em 16 de maio de 2020 criticando expansão do benefício durante pandemia.', 'verified', false, '2020-05-16', 'https://www.camara.leg.br/noticias/662345-marcel-van-hattem-auxilio-emergencial/', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'vanhattem-auxilio-trabalho-b100-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica tanto lockdown quanto negacionismo.', 'Precisamos de equilíbrio: ciência guia a política, mas economia não pode ser ignorada.', 'Artigo de opinião em 20 de abril de 2020 defendendo posição intermediária.', 'verified', false, '2020-04-20', 'https://www1.folha.uol.com.br/opiniao/2020/04/kim-kataguiri-pandemia-economia.shtml', 'news_article', 1, 'Folha de S.Paulo', 'Artigo de opinião', 'kim-kataguiri-equilibrio-b100-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral critica ausência de plano nacional contra Covid.', 'Não temos plano nacional de testagem, nem de vacinação. O governo é o principal inimigo da saúde pública.', 'Pronunciamento em 17 de junho de 2020 na Câmara dos Deputados.', 'verified', false, '2020-06-17', 'https://www.camara.leg.br/noticias/668234-tabata-critica-gestao-covid/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'tabata-plano-nacional-covid-b100-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar cobra responsabilização de Bolsonaro por mortes.', 'Bolsonaro zombou, minimizou, sabotou. Cada morte por Covid tem nome dele também.', 'Discurso em 30 de junho de 2020 na Câmara em dia de luto por vítimas.', 'verified', false, '2020-06-30', 'https://oglobo.globo.com/politica/chico-alencar-cobra-bolsonaro-vitimas-covid-24523412', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'chico-alencar-responsabilidade-b100-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali cobra plano nacional de vacinação contra Covid-19.', 'O Ministério da Saúde trava propositalmente o acesso às vacinas. Isto é genocídio por omissão.', 'Fala na Câmara em 20 de novembro de 2020 durante debate sobre aquisição de vacinas.', 'verified', false, '2020-11-20', 'https://www.camara.leg.br/noticias/710234-jandira-vacinacao-nacional/', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'jandira-vacinacao-nacional-b100-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo denuncia política de morte e cobra impeachment.', 'Temos um governo necropolítico. Impeachment é a única saída ética para salvar vidas.', 'Entrevista a site em 3 de julho de 2020.', 'verified', false, '2020-07-03', 'https://www.cartacapital.com.br/politica/freixo-necropolitica-bolsonaro-impeachment/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista à imprensa', 'freixo-necropolitica-impeachment-b100-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann classifica atitude de Bolsonaro como "genocida".', 'Não é mais negligência, é decisão política de matar. É genocídio em curso no Brasil.', 'Nota oficial do PT em 30 de abril de 2020 após fala "e daí" do presidente.', 'verified', true, '2020-04-30', 'https://pt.org.br/nota-pt-genocidio-bolsonaro-covid/', 'other', 2, 'Brasília', 'Nota oficial do PT', 'gleisi-genocidio-bolsonaro-b100-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Bolsonaro de "o maior genocida" da história do Brasil.', 'Esse presidente é o maior genocida da história republicana. Morreram mais brasileiros por sua irresponsabilidade.', 'Live com sindicalistas em 1º de maio de 2020, em meio a crescente onda de mortes.', 'verified', true, '2020-05-01', 'https://www.bbc.com/portuguese/brasil-52493500', 'news_article', 2, 'São Bernardo do Campo', 'Ato virtual do 1º de Maio', 'lula-genocida-bolsonaro-b100-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro exonera Valeixo da PF e gera crise com Moro.', 'Exoneração a pedido do delegado Maurício Valeixo. Assunto encerrado.', 'Publicação no DOU em 24 de abril de 2020 contra palavra de Valeixo, deflagrando demissão de Moro.', 'verified', true, '2020-04-24', 'https://g1.globo.com/politica/noticia/2020/04/24/governo-exonera-mauricio-valeixo-da-chefia-da-policia-federal.ghtml', 'diario_oficial', 4, 'Palácio do Planalto', 'Publicação em DOU', 'bolsonaro-exonera-valeixo-b100-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin autoriza inquérito contra Bolsonaro após denúncia de Moro.', 'As declarações do ex-ministro Sergio Moro apresentam indícios que justificam a abertura de inquérito contra o presidente.', 'Decisão em 27 de abril de 2020 autorizando o inquérito no STF.', 'verified', true, '2020-04-27', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=442534', 'diario_oficial', 1, 'Supremo Tribunal Federal', 'Decisão judicial', 'fachin-autoriza-inquerito-moro-b100-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que não tomará vacina porque "já teve Covid".', 'Já tive Covid. Meus anticorpos são campeões. Não preciso de vacina.', 'Declaração em coletiva em 19 de novembro de 2020 desestimulando imunização.', 'verified', false, '2020-11-19', 'https://www.poder360.com.br/governo/bolsonaro-anticorpos-campeoes-vacina/', 'news_article', 4, 'Palácio da Alvorada', 'Coletiva de imprensa', 'bolsonaro-anticorpos-campeoes-b100-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano diz que cloroquina "é dom de Deus".', 'Deus colocou a cloroquina para nos ajudar. Quem não toma é porque é de esquerda ou é ateu.', 'Pregação em culto evangélico em 10 de maio de 2020 em São Paulo.', 'verified', false, '2020-05-10', 'https://www.cartacapital.com.br/politica/feliciano-cloroquina-dom-de-deus/', 'social_media_post', 3, 'São Paulo', 'Culto evangélico', 'feliciano-cloroquina-dom-deus-b100-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta prega contra isolamento em templo e ataca governadores.', 'Governador que fecha igreja é inimigo de Deus. Vou dar o recado: o povo de fé não vai obedecer.', 'Pregação em 26 de março de 2020, violando recomendações sanitárias.', 'verified', false, '2020-03-26', 'https://www.metropoles.com/brasil/politica-br/magno-malta-governadores-templos-fechados', 'social_media_post', 3, 'Espírito Santo', 'Culto evangélico', 'magno-malta-governador-inimigo-b100-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara promove aglomeração em culto durante pico da pandemia.', 'Deus está acima de qualquer decreto. Vamos continuar abrindo as portas.', 'Pregação em 5 de abril de 2020 na Assembleia de Deus em Manaus, em plena explosão de casos na Amazônia.', 'verified', false, '2020-04-05', 'https://www.em.com.br/app/noticia/politica/2020/04/05/interna_politica,1135234/silas-camara-culto-covid.shtml', 'news_article', 4, 'Manaus', 'Culto evangélico', 'silas-camara-culto-manaus-b100-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes classifica gestão da Saúde de "genocídio" em live.', 'O Exército se associa a um genocídio. Não pode ficar omisso diante do que acontece.', 'Declaração em live acadêmica em 4 de junho de 2020 criticando militarização do Ministério da Saúde.', 'verified', true, '2020-06-04', 'https://www1.folha.uol.com.br/poder/2020/06/exercito-se-associa-a-um-genocidio-diz-gilmar-mendes-ao-criticar-acao-no-ministerio-da-saude.shtml', 'news_article', 1, 'Transmissão virtual', 'Seminário online', 'gilmar-genocidio-exercito-b100-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que decisão do STF sobre pandemia fere autoridade presidencial.', 'Se ministros querem governar, que disputem eleição. Quem manda aqui sou eu, eleito pelo povo.', 'Declaração em 16 de abril de 2020 após decisão do STF reconhecer competência concorrente.', 'verified', false, '2020-04-16', 'https://g1.globo.com/politica/noticia/2020/04/16/bolsonaro-critica-stf-decisao-pandemia.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-stf-quem-manda-b100-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues entra com pedido de impeachment contra Bolsonaro por pandemia.', 'Apresentamos 22º pedido de impeachment. Não pode haver governante que ria da morte.', 'Protocolado em 5 de maio de 2020 na Câmara dos Deputados pela Rede Sustentabilidade.', 'verified', false, '2020-05-05', 'https://www.camara.leg.br/noticias/654789-randolfe-impeachment-pandemia/', 'other', 1, 'Câmara dos Deputados', 'Protocolo de denúncia', 'randolfe-impeachment-pandemia-b100-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alr, 'Arthur Lira articula apoio a Bolsonaro engavetando pedidos de impeachment.', 'Não é hora de impeachment. Presidente tem legitimidade para conduzir o enfrentamento à pandemia.', 'Declaração em 12 de junho de 2020 durante negociação do Centrão com o governo.', 'verified', false, '2020-06-12', 'https://oglobo.globo.com/politica/lira-nao-ha-clima-para-impeachment-24587234', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista à imprensa', 'lira-engavetar-impeachment-b100-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Rodrigo Pacheco defende responsabilização criminal por desinformação.', 'Disseminar fake news sobre vacinas pode configurar crime. Instituições precisam agir.', 'Entrevista em 15 de dezembro de 2020 ao criticar postura presidencial.', 'verified', false, '2020-12-15', 'https://www12.senado.leg.br/noticias/materias/2020/12/15/pacheco-fake-news-vacinas-crime', 'news_article', 1, 'Senado Federal', 'Entrevista à imprensa', 'pacheco-criminalizar-fake-news-b100-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro culpa imprensa pela "histeria" com o coronavírus.', 'A imprensa brasileira criou essa histeria. Estão empurrando o país para o caos para derrubar o governo.', 'Declaração em 19 de março de 2020, um dos primeiros ataques à mídia em tema sanitário.', 'verified', false, '2020-03-19', 'https://g1.globo.com/politica/noticia/2020/03/19/bolsonaro-acusa-imprensa-de-histeria-coronavirus.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-imprensa-histeria-b100-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro manda repórter "calar a boca" ao ser questionado sobre mortes.', 'Cala a boca. Você é de uma imprensa canalha. Não estou aqui para responder a besteira.', 'Troca com jornalista em 22 de maio de 2020 em Brasília.', 'verified', true, '2020-05-22', 'https://www1.folha.uol.com.br/poder/2020/05/bolsonaro-manda-reporter-calar-a-boca-ao-ser-questionado.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-cala-boca-reporter-b100-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca Mandetta antes de sua demissão.', 'Esse ministro está traindo o presidente. Tem que ir embora o quanto antes.', 'Postagem em 6 de abril de 2020, parte da campanha familiar contra Mandetta.', 'verified', false, '2020-04-06', 'https://www.metropoles.com/brasil/politica-br/carlos-ataca-mandetta-saida', 'social_media_post', 3, 'Twitter', 'Postagem em rede social', 'carlos-ataca-mandetta-b100-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro compara OMS à União Soviética.', 'A OMS é aparelhada pela esquerda global. Parece a União Soviética dando ordem ao Brasil.', 'Postagem em 8 de julho de 2020 atacando diretrizes internacionais.', 'verified', false, '2020-07-08', 'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-compara-oms-uniao-sovietica/', 'social_media_post', 3, 'Twitter', 'Postagem em rede social', 'eduardo-oms-uniao-sovietica-b100-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina minimiza impactos da pandemia no agro.', 'O agronegócio não para. Vamos continuar produzindo, pandemia não afeta quem trabalha.', 'Entrevista em 10 de abril de 2020 defendendo manutenção de atividades.', 'verified', false, '2020-04-10', 'https://valor.globo.com/agronegocios/noticia/2020/04/10/tereza-cristina-agro-nao-para-covid.ghtml', 'news_article', 2, 'Ministério da Agricultura', 'Entrevista à imprensa', 'tereza-cristina-agro-nao-para-b100-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ironiza uso de máscara em evento com apoiadores.', 'Tira essa máscara. Tá com medo do quê? Isso aqui é conversa de homem.', 'Cumprimento a apoiadores em 10 de junho de 2020 em Brasília, filmado e viralizado.', 'verified', true, '2020-06-10', 'https://g1.globo.com/politica/noticia/2020/06/10/bolsonaro-tira-mascara-apoiadores.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Cumprimento a apoiadores', 'bolsonaro-tira-mascara-homem-b100-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar, médico, critica cloroquinismo e defende ciência.', 'Como médico, afirmo: cloroquina não funciona contra Covid-19. É irresponsabilidade defender.', 'Pronunciamento no Senado em 20 de maio de 2020.', 'verified', false, '2020-05-20', 'https://www12.senado.leg.br/noticias/materias/2020/05/20/otto-alencar-critica-cloroquina', 'news_article', 1, 'Senado Federal', 'Pronunciamento em plenário', 'otto-alencar-cloroquina-ciencia-b100-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros pede CPI e denuncia "pior governo da história da saúde".', 'Nunca vi tanto desprezo pela vida. Este é o pior governo da história da saúde pública brasileira.', 'Entrevista em 28 de novembro de 2020 em que articulou futura CPI.', 'verified', false, '2020-11-28', 'https://www12.senado.leg.br/noticias/materias/2020/11/28/renan-cpi-pandemia', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'renan-pior-governo-saude-b100-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que fechamento de escolas é "caolhice" de governadores.', 'Fechar escola é caolhice. Criança não tem Covid. Quem decidiu isso está destruindo futuro.', 'Declaração em 22 de julho de 2020 criticando decretos estaduais.', 'verified', false, '2020-07-22', 'https://g1.globo.com/educacao/noticia/2020/07/22/bolsonaro-fechar-escolas-caolhice.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-escola-caolhice-b100-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro alega que "90% vão pegar" e país precisa seguir.', '90% de nós vamos pegar o vírus. Não adianta fugir. Vamos encarar o problema.', 'Declaração em 29 de março de 2020 a apoiadores em Brasília.', 'verified', false, '2020-03-29', 'https://www1.folha.uol.com.br/cotidiano/2020/03/bolsonaro-diz-que-90-da-populacao-vai-pegar-coronavirus.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração a apoiadores', 'bolsonaro-90-porcento-pegar-b100-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama veto a máscara de "bom senso".', 'Máscara em lugar aberto é frescura. Vetei por bom senso.', 'Declaração em 4 de julho de 2020 após o veto à Lei 14.019.', 'verified', false, '2020-07-04', 'https://www.cnnbrasil.com.br/politica/bolsonaro-mascara-frescura-veto/', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-mascara-frescura-b100-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Azevêdo, governador da Paraíba, rebate Bolsonaro e defende lockdown.', 'Lockdown salva vidas. Respeitamos a ciência, não a irresponsabilidade do Planalto.', 'Pronunciamento em 7 de maio de 2020 ao anunciar medidas na Paraíba.', 'verified', false, '2020-05-07', 'https://paraiba.pb.gov.br/noticias/joao-azevedo-lockdown-ciencia', 'news_article', 1, 'João Pessoa', 'Pronunciamento oficial', 'joao-azevedo-lockdown-ciencia-b100-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC classifica conduta de Bolsonaro como "suicida" para o país.', 'Tenho medo pelo Brasil. O presidente tem conduta suicida. A pandemia exige seriedade, não bravata.', 'Entrevista em 12 de abril de 2020.', 'verified', true, '2020-04-12', 'https://www1.folha.uol.com.br/poder/2020/04/fhc-diz-que-bolsonaro-tem-conduta-suicida-na-pandemia.shtml', 'news_article', 2, 'São Paulo', 'Entrevista à imprensa', 'fhc-conduta-suicida-bolsonaro-b100-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Michel Temer pede união nacional e critica politização da pandemia.', 'Pandemia não tem partido. É hora de deixar política de lado e proteger vidas.', 'Artigo em 15 de abril de 2020 na Folha de S.Paulo.', 'verified', false, '2020-04-15', 'https://www1.folha.uol.com.br/opiniao/2020/04/michel-temer-pandemia-uniao.shtml', 'news_article', 1, 'Folha de S.Paulo', 'Artigo de opinião', 'temer-uniao-pandemia-b100-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende STF contra ataques de Bolsonaro na pandemia.', 'O STF está cumprindo seu papel. Ataques do presidente são preocupantes para a democracia.', 'Nota pública em 24 de maio de 2020.', 'verified', false, '2020-05-24', 'https://oglobo.globo.com/politica/sarney-defende-stf-pandemia-24523112', 'other', 1, 'São Luís', 'Nota pública', 'sarney-defende-stf-b100-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma denuncia negacionismo e cobra impeachment de Bolsonaro.', 'O que vemos hoje é um negacionismo genocida. É urgente o afastamento de Bolsonaro.', 'Entrevista em 25 de abril de 2020 à rede de TV latino-americana.', 'verified', false, '2020-04-25', 'https://www.cartacapital.com.br/politica/dilma-cobra-impeachment-bolsonaro-pandemia/', 'news_article', 2, 'Porto Alegre', 'Entrevista à imprensa', 'dilma-impeachment-negacionismo-b100-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro sugere que imprensa "inflou" número de mortes.', 'Desconfio desses números. Hospital recebe mais por morte de Covid. Deve ter muito morto contado errado.', 'Declaração em 11 de maio de 2020 levantando teoria conspiratória sobre registros.', 'verified', true, '2020-05-11', 'https://g1.globo.com/politica/noticia/2020/05/11/bolsonaro-sugere-manipulacao-dados-covid.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-hospital-lucro-morte-b100-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca governador Dória como "acumulador de cargo".', 'Esse governador de São Paulo só quer aparecer. Está matando a economia para fazer campanha.', 'Declaração em 18 de março de 2020, iniciando confronto público com Doria.', 'verified', false, '2020-03-18', 'https://www1.folha.uol.com.br/poder/2020/03/bolsonaro-ataca-doria-paulista.shtml', 'news_article', 3, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-ataca-doria-b100-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que "não sou coveiro" ao rebater pergunta sobre mortes.', 'Não sou coveiro. Procurem esses dados com o Ministério da Saúde.', 'Resposta a jornalistas em 20 de abril de 2020 ao ser questionado sobre balanço diário.', 'verified', true, '2020-04-20', 'https://www1.folha.uol.com.br/poder/2020/04/nao-sou-coveiro-diz-bolsonaro-a-jornalista.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-nao-sou-coveiro-b100-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede que populares gravem supermercados para verificar "desabastecimento fake".', 'Povão, peguem celular e gravem os supermercados. Não tem desabastecimento, é fake news.', 'Live em 19 de março de 2020 ao minimizar pânico inicial.', 'verified', false, '2020-03-19', 'https://www.poder360.com.br/governo/bolsonaro-celular-supermercado-pandemia/', 'social_media_post', 3, 'Live Facebook', 'Live semanal', 'bolsonaro-gravem-supermercado-b100-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende abertura de igrejas como "essenciais" em lockdown.', 'Igreja é essencial. Não podem ser fechadas enquanto supermercados estão abertos.', 'Declaração em 1 de abril de 2020 em entrevista à Rádio Guaíba.', 'verified', false, '2020-04-01', 'https://www.cartacapital.com.br/politica/damares-igreja-essencial-covid/', 'news_article', 3, 'Brasília', 'Entrevista radiofônica', 'damares-igreja-essencial-b100-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro usa decreto para incluir cultos como serviço essencial.', 'Templos religiosos não fecham no Brasil. Vamos garantir por decreto.', 'Decreto 10.292/2020 de 25 de março ampliando lista de serviços essenciais.', 'verified', true, '2020-03-25', 'https://g1.globo.com/politica/noticia/2020/03/25/bolsonaro-decreto-cultos-essenciais.ghtml', 'diario_oficial', 4, 'Palácio do Planalto', 'Edição de decreto', 'bolsonaro-decreto-cultos-essenciais-b100-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro debocha de médicos e diz que "vai operar sem entender".', 'Estão querendo mandar no Brasil sem saber. Tá virando república médica. Não vou aceitar.', 'Declaração em 10 de abril de 2020 criticando orientações do Conselho Federal de Medicina.', 'verified', false, '2020-04-10', 'https://www1.folha.uol.com.br/poder/2020/04/bolsonaro-critica-medicos-republica.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-republica-medicos-b100-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli convoca ato em frente ao STF contra pandemia.', 'Todo mundo às ruas. Não podemos permitir ditadura sanitária com aval do Supremo.', 'Convocação em redes sociais em 19 de abril de 2020 para ato antidemocrático em Brasília.', 'verified', false, '2020-04-19', 'https://www.cartacapital.com.br/politica/zambelli-convoca-ato-stf/', 'social_media_post', 4, 'Twitter', 'Postagem em rede social', 'zambelli-ato-stf-convocacao-b100-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira xinga governadores ao vivo e pede fim de quarentenas.', 'Esses governadores covardes precisam ser presos. Querem transformar isso em ditadura.', 'Live em 22 de maio de 2020 com linguagem agressiva.', 'verified', false, '2020-05-22', 'https://www.metropoles.com/brasil/politica-br/daniel-silveira-governadores-prisao', 'social_media_post', 4, 'Redes sociais', 'Live em rede social', 'silveira-xinga-governadores-b100-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro promete veto a projeto de auxílio emergencial para estados.', 'Vou vetar. Estados não são filhos do governo federal. Cada um cuide do seu.', 'Declaração em 23 de abril de 2020 sobre LC 173/2020.', 'verified', false, '2020-04-23', 'https://valor.globo.com/politica/noticia/2020/04/23/bolsonaro-ameaca-vetar-auxilio-estados.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-veto-auxilio-estados-b100-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro acena com forças armadas se STF não "entender a limitação".', 'Existem limites. As Forças Armadas têm um papel constitucional. Se o STF extrapolar, que se preparem.', 'Fala em reunião com empresários em 22 de abril de 2020, trecho revelado no vídeo da reunião ministerial.', 'verified', true, '2020-04-22', 'https://www1.folha.uol.com.br/poder/2020/05/em-reuniao-ministerial-bolsonaro-atacou-o-stf.shtml', 'news_article', 5, 'Palácio do Planalto', 'Reunião ministerial', 'bolsonaro-forcas-armadas-stf-b100-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que STF está "estabelecendo uma ditadura" em reunião ministerial.', 'O Brasil está virando o Zimbábue. O STF é quem está implantando uma ditadura sanitária.', 'Reunião de 22 de abril de 2020, cujo vídeo foi divulgado.', 'verified', true, '2020-04-22', 'https://g1.globo.com/politica/noticia/2020/05/22/stf-divulga-video-da-reuniao-ministerial-de-22-de-abril.ghtml', 'news_article', 5, 'Palácio do Planalto', 'Reunião ministerial', 'bolsonaro-stf-zimbabue-ditadura-b100-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede à população que "invada hospitais" para filmar leitos vazios.', 'Povo entra em hospital, filma os leitos. Querem enganar o Brasil com hospital de campanha.', 'Declaração em 11 de junho de 2020 estimulando invasão de unidades hospitalares.', 'verified', true, '2020-06-11', 'https://g1.globo.com/politica/noticia/2020/06/11/bolsonaro-sugere-invasao-hospitais-filmar.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-invadir-hospital-b100-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega privilegiar família com testes para Covid.', 'Não usei nenhum hospital público. Fiz teste particular. Quem diz o contrário mente.', 'Declaração em 8 de julho de 2020 ao responder sobre acesso a testes antes de anunciar contaminação.', 'verified', false, '2020-07-08', 'https://oglobo.globo.com/politica/bolsonaro-defende-testes-familia-24587523', 'news_article', 2, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-testes-familia-b100-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro viaja a Goiás e aglomera em evento na saída de Brasília.', 'Aqui estou eu, ao lado do povo. Não tenho medo do vírus.', 'Visita a Anápolis em 6 de junho de 2020 reunindo centenas de apoiadores sem máscara.', 'verified', false, '2020-06-06', 'https://www1.folha.uol.com.br/poder/2020/06/bolsonaro-aglomera-em-goias.shtml', 'news_article', 4, 'Anápolis, GO', 'Visita a apoiadores', 'bolsonaro-aglomeracao-anapolis-b100-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro rompe distanciamento ao comer com apoiadores em Brasília.', 'Pão com linguiça, pastel, cachorro-quente. Fui comer com o povo. É Brasil.', 'Em 15 de março de 2020 foi a lanchonetes em Brasília após cumprimentar multidão.', 'verified', false, '2020-03-15', 'https://g1.globo.com/politica/noticia/2020/03/15/bolsonaro-come-com-apoiadores-brasilia.ghtml', 'news_article', 3, 'Brasília', 'Passeio público', 'bolsonaro-pastel-apoiadores-b100-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que não vai usar "remédio de marica" em referência à vacina.', 'Remédio de marica é para quem tem medo. Eu não tenho medo do vírus. Não preciso de vacina.', 'Declaração em 21 de dezembro de 2020 sobre resistência à imunização.', 'verified', true, '2020-12-21', 'https://www.bbc.com/portuguese/brasil-55399812', 'news_article', 4, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-remedio-marica-b100-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca Butantan e chama CoronaVac de "veneno chinês".', 'CoronaVac é veneno chinês. Doria quer enfiar goela abaixo dos brasileiros esse produto duvidoso.', 'Postagem em 20 de outubro de 2020 na campanha contra vacina chinesa.', 'verified', false, '2020-10-20', 'https://www.metropoles.com/brasil/politica-br/carlos-coronavac-veneno-chines', 'social_media_post', 5, 'Twitter', 'Postagem em rede social', 'carlos-coronavac-veneno-b100-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro sugere que vacina chinesa pode ser "armadilha" de Pequim.', 'Quem garante que o governo comunista chinês não colocou algo nessa vacina? É ingenuidade confiar.', 'Postagem em 22 de outubro de 2020 reforçando desinformação sobre imunizantes.', 'verified', false, '2020-10-22', 'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-vacina-chinesa-desconfianca/', 'social_media_post', 5, 'Twitter', 'Postagem em rede social', 'eduardo-vacina-armadilha-chinesa-b100-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro culpa China por pandemia em discurso na ONU.', 'O vírus chegou ao mundo sem que soubéssemos. É preciso responsabilizar quem escondeu dados.', 'Discurso de abertura da 75ª Assembleia Geral da ONU em 22 de setembro de 2020.', 'verified', true, '2020-09-22', 'https://www.bbc.com/portuguese/internacional-54255893', 'news_article', 3, 'Nova York (virtual)', '75ª Assembleia Geral da ONU', 'bolsonaro-onu-china-pandemia-b100-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz na ONU que ambientalismo é "ideologia" mesmo com Amazônia queimando.', 'Somos vítimas de campanha desonesta sobre Amazônia. O Brasil preserva mais do que qualquer outro país.', 'Discurso na ONU em 22 de setembro de 2020 ignorando recorde de queimadas.', 'verified', false, '2020-09-22', 'https://www.reuters.com/article/us-un-assembly-brazil-idUSKCN26D1IM', 'news_article', 3, 'Nova York (virtual)', '75ª Assembleia Geral da ONU', 'bolsonaro-onu-amazonia-mentira-b100-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Pazuello não será exonerado mesmo com colapso em Manaus.', 'O Pazuello fica. É meu general e tem minha total confiança. Manaus está sendo bem cuidada.', 'Declaração em 15 de dezembro de 2020, precedendo colapso total de oxigênio em Manaus em janeiro de 2021.', 'verified', false, '2020-12-15', 'https://g1.globo.com/politica/noticia/2020/12/15/bolsonaro-mantem-pazuello-saude.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-pazuello-fica-b100-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que cremes dentais fariam mais mal que cloroquina.', 'Pasta de dente mata mais que cloroquina. Para quem reclama: pesquisem os efeitos.', 'Live em 16 de julho de 2020 minimizando efeitos colaterais da cloroquina.', 'verified', false, '2020-07-16', 'https://www.poder360.com.br/governo/bolsonaro-pasta-dente-cloroquina/', 'social_media_post', 4, 'Live Facebook', 'Live semanal', 'bolsonaro-pasta-dente-cloroquina-b100-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro anuncia "Tratamento Precoce" como política oficial do governo.', 'Vamos aprovar e distribuir tratamento precoce. É direito do brasileiro escolher.', 'Declaração em 11 de junho de 2020 após sair decreto com protocolo do tratamento precoce.', 'verified', true, '2020-06-11', 'https://www1.folha.uol.com.br/equilibrioesaude/2020/06/bolsonaro-tratamento-precoce-cloroquina.shtml', 'news_article', 5, 'Palácio do Planalto', 'Edição de decreto', 'bolsonaro-tratamento-precoce-oficial-b100-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que governadores são "vagabundos" por lockdown.', 'Esses governadores vagabundos estão destruindo o país. Vão responder ao povo.', 'Declaração em 6 de maio de 2020 em Brasília.', 'verified', false, '2020-05-06', 'https://g1.globo.com/politica/noticia/2020/05/06/bolsonaro-chama-governadores-de-vagabundos.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Declaração à imprensa', 'bolsonaro-governadores-vagabundos-b100-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "todos vão morrer algum dia" ao comentar 150 mil mortes.', 'A gente lamenta, mas todos nós vamos morrer algum dia. Não adianta fugir disso.', 'Declaração em 12 de outubro de 2020 quando Brasil ultrapassou 150 mil mortes.', 'verified', true, '2020-10-12', 'https://www1.folha.uol.com.br/poder/2020/10/todos-vao-morrer-algum-dia-diz-bolsonaro-sobre-mortes-por-covid-19.shtml', 'news_article', 5, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-todos-morrer-algum-dia-b100-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica recomendação de distanciamento e cita histórico de atleta.', 'Meu histórico de atleta, se for contaminado, não precisa se preocupar. Não sentiria nada.', 'Pronunciamento em 24 de março de 2020 induzindo ideia de imunidade natural.', 'verified', true, '2020-03-24', 'https://www.bbc.com/portuguese/brasil-52036694', 'news_article', 5, 'Palácio do Planalto', 'Pronunciamento em rede nacional', 'bolsonaro-atleta-imune-b100-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que pandemia serviu para "destruir Trump" e pode servir aqui.', 'A imprensa quer destruir Bolsonaro como destruiu Trump com a pandemia.', 'Live em 12 de novembro de 2020 após derrota de Trump.', 'verified', false, '2020-11-12', 'https://www.cnnbrasil.com.br/politica/bolsonaro-imprensa-trump-pandemia/', 'social_media_post', 3, 'Live Facebook', 'Live semanal', 'bolsonaro-trump-imprensa-b100-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua que vacina da Pfizer "pode transformar" pessoas.', 'Se você virar um crocodilo, é problema seu. Se você virar um homem-barbado, problema seu.', 'Live em 17 de dezembro de 2020 ridicularizando vacinas.', 'verified', true, '2020-12-17', 'https://www.reuters.com/article/us-health-coronavirus-brazil-bolsonaro-idUSKBN28R3E8', 'news_article', 5, 'Live Facebook', 'Live semanal', 'bolsonaro-crocodilo-homem-barbado-b100-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro fecha 2020 dizendo que pandemia é "questão de comunismo versus liberdade".', 'O vírus é fato. Mas o que fizeram com ele é comunismo. Querem controlar a liberdade em nome da saúde.', 'Live de encerramento de 2020 em 29 de dezembro apresentando balanço distorcido.', 'verified', true, '2020-12-29', 'https://www1.folha.uol.com.br/poder/2020/12/bolsonaro-encerra-2020-com-ataques-a-isolamento.shtml', 'social_media_post', 4, 'Live Facebook', 'Live semanal', 'bolsonaro-comunismo-liberdade-2020-b100-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

END $$;
