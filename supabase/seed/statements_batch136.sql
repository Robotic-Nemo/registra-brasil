-- Batch 136: Trabalho, escala 6x1, economia de aplicativos 2023-2026 (parte 1)
DO $$
DECLARE
  v_mar UUID; v_had UUID; v_teb UUID; v_dwe UUID; v_dia UUID;
  v_lup UUID; v_lul UUID; v_gle UUID; v_pad UUID; v_ruc UUID;
  v_msi UUID; v_fav UUID; v_cam UUID; v_alc UUID; v_eri UUID;
  v_sam UUID; v_tab UUID; v_tal UUID; v_mel UUID; v_jan UUID;
  v_ors UUID; v_cha UUID; v_mvh UUID; v_kim UUID; v_adv UUID;
  v_nik UUID; v_pag UUID; v_jai UUID; v_edu UUID; v_tar UUID;
  v_zem UUID; v_cai UUID; v_rnu UUID; v_epa UUID; v_jca UUID;
  v_agr UUID; v_hmo UUID; v_jwa UUID; v_huc UUID; v_lin UUID;
  v_zec UUID; v_jog UUID; v_dua UUID; v_bou UUID; v_jan2 UUID;
  v_ani UUID; v_son UUID; v_sal UUID;
  c_abu UUID; c_irr UUID; c_des UUID; c_odi UUID; c_con UUID;
  c_int UUID; c_cor UUID; c_aut UUID; c_mac UUID; c_mis UUID;
BEGIN
  SELECT id INTO v_mar FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_dwe FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_dia FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_ruc FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_msi FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_cam FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_mel FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_ors FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_pag FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_rnu FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_epa FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_jca FROM politicians WHERE slug = 'joao-campos';
  SELECT id INTO v_agr FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_jwa FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_huc FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_zec FROM politicians WHERE slug = 'zeca-dirceu';
  SELECT id INTO v_jog FROM politicians WHERE slug = 'jose-guimaraes';
  SELECT id INTO v_dua FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_jan2 FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'silvio-almeida';

  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton protocola PEC para acabar com a escala 6x1.', 'O trabalhador brasileiro precisa ter direito a descansar. A escala 6x1 adoece nosso povo.', 'Protocolo da PEC do Fim da Escala 6x1 na Câmara dos Deputados.', 'verified', true, '2024-11-12', 'https://www.camara.leg.br/noticias/1112488-erika-hilton-pec-fim-escala-6x1/', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'erika-pec-fim-6x1-b136-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem diz que fim da escala 6x1 quebraria empresas.', 'Essa proposta populista vai destruir empregos e fechar pequenas empresas em todo o Brasil.', 'Discurso no plenário contra a PEC do Fim da Escala 6x1.', 'verified', true, '2024-11-13', 'https://www.gazetadopovo.com.br/republica/marcel-van-hattem-6x1-empresas/', 'news_article', 4, 'Brasília', 'Plenário da Câmara', 'marcel-6x1-empresas-b136-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho defende redução da jornada e apoia debate sobre fim do 6x1.', 'Reduzir jornada é agenda de civilização. Precisamos debater com responsabilidade esse tema.', 'Entrevista coletiva no Ministério do Trabalho após reunião com centrais sindicais.', 'verified', true, '2024-11-14', 'https://g1.globo.com/politica/noticia/2024/11/14/marinho-jornada-6x1.ghtml', 'news_article', 1, 'Brasília', 'Ministério do Trabalho', 'marinho-reducao-jornada-b136-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri afirma que redução da jornada vai gerar desemprego.', 'Quem quer menos trabalho não entende economia. Menos jornada é menos emprego.', 'Postagem em rede social durante debate sobre a PEC do Fim da Escala 6x1.', 'verified', false, '2024-11-15', 'https://www.metropoles.com/brasil/politica-br/kim-kataguiri-jornada-desemprego', 'social_media_post', 4, 'São Paulo', 'Postagem em rede social', 'kim-jornada-desemprego-b136-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz apoiar debate sobre redução da jornada de trabalho.', 'O trabalhador precisa ter tempo para a família. Vamos discutir redução de jornada com os setores.', 'Declaração durante café da manhã com jornalistas no Palácio do Planalto.', 'verified', true, '2024-11-18', 'https://www1.folha.uol.com.br/mercado/2024/11/lula-apoia-debate-reducao-jornada.shtml', 'news_article', 1, 'Brasília', 'Café com jornalistas', 'lula-apoia-reducao-jornada-b136-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama PEC do Fim da Escala 6x1 de ameaça socialista.', 'Querem transformar o Brasil em Venezuela acabando com o emprego de milhões.', 'Postagem em rede social durante tramitação da PEC.', 'verified', true, '2024-11-14', 'https://g1.globo.com/politica/noticia/2024/11/14/nikolas-6x1-socialismo.ghtml', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-6x1-socialismo-b136-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Guilherme Boulos apoia PEC do Fim da Escala 6x1 em ato com trabalhadores.', 'Trabalhador não é máquina. A escala 6x1 é herança de um Brasil que precisa acabar.', 'Ato público em São Paulo com centrais sindicais em favor da PEC.', 'verified', true, '2024-11-16', 'https://www.brasildefato.com.br/2024/11/16/boulos-ato-fim-6x1-sp/', 'news_article', 1, 'São Paulo', 'Ato público na Paulista', 'boulos-ato-6x1-b136-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura diz que fim do 6x1 vai aumentar informalidade.', 'Esse projeto é uma fantasia que jogará milhões na informalidade.', 'Entrevista à rádio CBN sobre PEC do Fim da Escala 6x1.', 'verified', false, '2024-11-19', 'https://cbn.globoradio.globo.com/editorias/politica/2024/11/19/adriana-ventura-6x1.htm', 'news_article', 3, 'São Paulo', 'Entrevista à CBN', 'adriana-ventura-6x1-b136-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende fim do 6x1 como avanço civilizatório.', 'Não é possível que no século 21 ainda tenhamos gente trabalhando seis dias seguidos.', 'Discurso na Câmara em defesa da PEC apresentada por Erika Hilton.', 'verified', false, '2024-11-13', 'https://www.camara.leg.br/noticias/samia-bomfim-6x1', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'samia-6x1-civilizatorio-b136-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica PEC do Fim do 6x1 e diz que inibe investimentos.', 'Essa pauta afugenta investimento. Comércio e serviço não sobrevivem a isso.', 'Entrevista após agenda com empresários em São Paulo.', 'verified', true, '2024-11-20', 'https://valor.globo.com/politica/noticia/2024/11/20/tarcisio-6x1-investimento.ghtml', 'news_article', 4, 'São Paulo', 'Encontro com FIESP', 'tarcisio-6x1-investimento-b136-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho anuncia regulamentação do trabalho em aplicativos.', 'Motoristas e entregadores de aplicativo terão direitos básicos garantidos por lei.', 'Coletiva de imprensa sobre projeto de regulamentação de motoristas de aplicativo.', 'verified', true, '2024-03-04', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-03/marinho-regulamentacao-motoristas-aplicativo', 'news_article', 2, 'Brasília', 'Coletiva no Ministério do Trabalho', 'marinho-reg-aplicativos-b136-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pag, 'Paulo Guedes ataca regulamentação de aplicativos como ataque ao empreendedor.', 'Querem acabar com a liberdade do motorista. É volta do trabalho escravo sindicalizado.', 'Palestra em evento de mercado financeiro em São Paulo.', 'verified', false, '2024-03-15', 'https://www.infomoney.com.br/politica/guedes-aplicativos-liberdade/', 'news_article', 4, 'São Paulo', 'Evento FAAP', 'guedes-aplicativos-liberdade-b136-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Fernando Haddad defende regulamentação de plataformas digitais.', 'Não é aceitável empresa bilionária lucrar sem garantir direitos mínimos ao trabalhador.', 'Entrevista no programa Roda Viva sobre trabalho em plataformas.', 'verified', true, '2024-04-08', 'https://www1.folha.uol.com.br/mercado/2024/04/haddad-plataformas-direitos.shtml', 'news_article', 2, 'São Paulo', 'Programa Roda Viva', 'haddad-plataformas-direitos-b136-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca regulamentação de aplicativos como volta da CLT.', 'Governo quer amarrar o motorista na CLT. Querem acabar com a liberdade do brasileiro.', 'Live semanal em rede social durante tramitação do PL dos motoristas.', 'verified', true, '2024-03-20', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/03/20/bolsonaro-ataca-pl-aplicativos.htm', 'social_media_post', 4, 'Brasília', 'Live semanal', 'bolsonaro-pl-aplicativos-b136-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema critica PL dos motoristas de aplicativo e diz que afastará empresas.', 'Uber e 99 vão embora do Brasil se aprovarem esse absurdo do governo federal.', 'Entrevista na Jovem Pan sobre regulamentação de plataformas.', 'verified', false, '2024-03-22', 'https://jovempan.com.br/noticias/politica/zema-pl-motoristas-empresas.html', 'news_article', 4, 'Belo Horizonte', 'Entrevista Jovem Pan', 'zema-pl-motoristas-b136-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende regulação específica para apps, sem CLT tradicional.', 'Precisamos de uma terceira via: direitos garantidos sem destruir o modelo dos aplicativos.', 'Discurso em plenário durante discussão do PL dos motoristas.', 'verified', false, '2024-04-02', 'https://www.camara.leg.br/noticias/tabata-amaral-pl-aplicativos', 'news_article', 2, 'Brasília', 'Plenário da Câmara', 'tabata-pl-aplicativos-b136-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia assédio moral contra motoristas por plataformas.', 'Motoristas são punidos por algoritmo sem direito de defesa. É assédio digital.', 'Audiência pública sobre trabalho em aplicativos na Câmara.', 'verified', false, '2024-05-10', 'https://www.camara.leg.br/noticias/erika-hilton-audiencia-apps', 'news_article', 2, 'Brasília', 'Audiência Pública Câmara', 'erika-assedio-algoritmo-b136-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Carlos Lupi defende ampliação da Previdência para trabalhadores de aplicativo.', 'Todo trabalhador brasileiro merece aposentadoria, inclusive os de aplicativos.', 'Coletiva sobre inclusão previdenciária de trabalhadores informais.', 'verified', false, '2023-08-22', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-08/lupi-previdencia-aplicativos', 'news_article', 1, 'Brasília', 'Ministério da Previdência', 'lupi-previdencia-apps-b136-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que fim do 6x1 é demagogia eleitoral da esquerda.', 'Eles enganam o povo prometendo menos trabalho e mais salário. É papo de socialista.', 'Postagem em rede social durante debate sobre a PEC.', 'verified', false, '2024-11-17', 'https://www.metropoles.com/brasil/politica-br/eduardo-bolsonaro-6x1-demagogia', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'eduardo-6x1-demagogia-b136-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Fernanda Melchionna defende PEC do 6x1 e fala em dignidade do trabalhador.', 'Não se trata só de horas, mas de dignidade humana. Trabalhador merece descanso.', 'Discurso em plenário durante debate da PEC.', 'verified', false, '2024-11-14', 'https://www.camara.leg.br/noticias/melchionna-6x1-dignidade', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'melchionna-6x1-dignidade-b136-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho defende recomposição do salário mínimo acima da inflação.', 'O salário mínimo precisa crescer para movimentar a economia e tirar gente da pobreza.', 'Entrevista após reunião com centrais sindicais sobre valorização do mínimo.', 'verified', true, '2023-03-01', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-03/marinho-salario-minimo', 'news_article', 1, 'Brasília', 'Ministério do Trabalho', 'marinho-minimo-acima-inflacao-b136-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Fernando Haddad anuncia nova política de valorização do salário mínimo.', 'Teremos uma regra permanente de ganho real para o mínimo, inflação mais PIB.', 'Coletiva no Ministério da Fazenda sobre política de valorização do mínimo.', 'verified', true, '2023-04-25', 'https://g1.globo.com/economia/noticia/2023/04/25/haddad-politica-salario-minimo.ghtml', 'news_article', 1, 'Brasília', 'Ministério da Fazenda', 'haddad-politica-minimo-b136-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pag, 'Paulo Guedes critica aumento do salário mínimo acima da inflação.', 'Aumentar o mínimo além da produtividade é destruir empregos e fomentar informalidade.', 'Entrevista ao Valor Econômico sobre política salarial.', 'verified', false, '2023-05-10', 'https://valor.globo.com/politica/noticia/2023/05/10/guedes-minimo-produtividade.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Entrevista Valor', 'guedes-minimo-produtividade-b136-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho anuncia salário mínimo de R$ 1.412 para 2024.', 'O salário mínimo subirá de R$ 1.320 para R$ 1.412, com ganho real acima da inflação.', 'Anúncio oficial do valor do salário mínimo para janeiro de 2024.', 'verified', true, '2023-12-28', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-12/salario-minimo-2024', 'news_article', 1, 'Brasília', 'Anúncio oficial', 'marinho-minimo-2024-b136-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende regra fiscal que limita reajuste do salário mínimo.', 'Precisamos equilibrar valorização com responsabilidade fiscal e sustentabilidade.', 'Entrevista sobre pacote fiscal que atrela mínimo ao arcabouço.', 'verified', false, '2024-11-28', 'https://www1.folha.uol.com.br/mercado/2024/11/tebet-minimo-arcabouco.shtml', 'news_article', 2, 'Brasília', 'Coletiva no Planejamento', 'tebet-minimo-arcabouco-b136-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem ataca valorização do salário mínimo como populismo.', 'Aumentar o mínimo com caneta é mágica que produz desemprego depois.', 'Entrevista no programa Pânico sobre política salarial.', 'verified', false, '2024-01-15', 'https://jovempan.com.br/programas/panico/marcel-minimo.html', 'news_article', 4, 'São Paulo', 'Programa Pânico', 'marcel-minimo-populismo-b136-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que salário mínimo precisa crescer para fortalecer classe média.', 'Quando o pobre come, o rico vende. Valorizar o mínimo movimenta toda economia.', 'Discurso em cerimônia no Palácio do Planalto com trabalhadores.', 'verified', true, '2024-05-01', 'https://g1.globo.com/politica/noticia/2024/05/01/lula-dia-trabalhador-minimo.ghtml', 'news_article', 1, 'Brasília', 'Cerimônia Dia do Trabalhador', 'lula-minimo-classe-media-b136-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema critica reajuste do mínimo e diz que empresas de MG sofrerão.', 'Empresas mineiras vão ter que demitir por causa dessa política irresponsável.', 'Entrevista coletiva em Belo Horizonte sobre política salarial federal.', 'verified', false, '2024-01-20', 'https://www.em.com.br/app/noticia/politica/2024/01/20/zema-minimo-mg.shtml', 'news_article', 4, 'Belo Horizonte', 'Coletiva no Palácio Tiradentes', 'zema-minimo-mg-b136-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana comemora lançamento do programa Pé-de-Meia para ensino médio.', 'Pé-de-Meia vai garantir que nenhum estudante pobre abandone a escola por necessidade.', 'Cerimônia de lançamento do Pé-de-Meia no Palácio do Planalto.', 'verified', true, '2024-01-26', 'https://agenciabrasil.ebc.com.br/educacao/noticia/2024-01/pe-de-meia-lancamento', 'news_article', 1, 'Brasília', 'Lançamento Pé-de-Meia', 'camilo-pe-de-meia-lancamento-b136-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama Pé-de-Meia de bolsa-eleitoreira.', 'Estão comprando voto de adolescente com dinheiro do contribuinte.', 'Postagem em rede social sobre lançamento do Pé-de-Meia.', 'verified', false, '2024-01-27', 'https://www.metropoles.com/brasil/politica-br/nikolas-pe-de-meia-voto', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'nikolas-pe-de-meia-voto-b136-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias defende novo Bolsa Família com benefício médio de R$ 600.', 'O Bolsa Família volta mais forte, com valor digno e foco na criança pequena.', 'Coletiva de lançamento do novo Bolsa Família.', 'verified', true, '2023-03-02', 'https://g1.globo.com/politica/noticia/2023/03/02/wellington-dias-bolsa-familia.ghtml', 'news_article', 1, 'Brasília', 'Ministério do Desenvolvimento Social', 'wellington-bolsa-familia-600-b136-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro critica Bolsa Família e diz que o Auxílio Brasil era melhor.', 'Davam uma esmola de R$ 600 porque copiaram o que a gente fazia melhor.', 'Live em rede social atacando programa social do governo Lula.', 'verified', true, '2023-03-05', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/03/05/bolsonaro-bolsa-familia-esmola.htm', 'social_media_post', 3, 'Brasília', 'Live semanal', 'bolsonaro-bolsa-esmola-b136-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias anuncia pente-fino no Bolsa Família.', 'Vamos retirar quem não precisa e priorizar a família que mais sofre.', 'Anúncio da revisão cadastral do Bolsa Família no Ministério.', 'verified', false, '2023-05-18', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-05/bolsa-familia-pente-fino', 'news_article', 1, 'Brasília', 'Coletiva MDS', 'wellington-pente-fino-b136-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jca, 'João Campos defende Bolsa Família e elogia impacto em Pernambuco.', 'Em Pernambuco, o Bolsa Família tira famílias da extrema pobreza e dinamiza comércio local.', 'Entrevista sobre política social em Recife.', 'verified', false, '2023-07-10', 'https://jc.ne10.uol.com.br/politica/2023/07/joao-campos-bolsa-familia.html', 'news_article', 1, 'Recife', 'Prefeitura do Recife', 'joao-campos-bolsa-familia-b136-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Ronaldo Caiado critica Bolsa Família como fomentador de dependência.', 'Programa assistencialista eterniza pobreza. Goiás mostra o caminho do trabalho.', 'Entrevista no programa Roda Viva sobre política social.', 'verified', false, '2023-09-18', 'https://www1.folha.uol.com.br/poder/2023/09/caiado-roda-viva-bolsa-familia.shtml', 'news_article', 4, 'São Paulo', 'Programa Roda Viva', 'caiado-bolsa-dependencia-b136-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr defende ampliação do Bolsa Família para famílias do Maranhão.', 'Famílias maranhenses dependem do Bolsa Família para pagar o gás de cozinha.', 'Discurso em plenário sobre orçamento do Bolsa Família.', 'verified', false, '2023-10-12', 'https://www.camara.leg.br/noticias/duarte-bolsa-familia-maranhao', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'duarte-bolsa-maranhao-b136-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende integração entre Bolsa Família e qualificação profissional.', 'Queremos beneficiário do Bolsa Família no mercado de trabalho, não dependente.', 'Lançamento de programa estadual de qualificação em São Paulo.', 'verified', false, '2024-02-22', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-bolsa-familia-qualificacao', 'news_article', 2, 'São Paulo', 'Palácio dos Bandeirantes', 'tarcisio-bolsa-qualificacao-b136-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que Bolsa Família é investimento, não despesa.', 'Bolsa Família não é gasto, é investimento em gente. É o que faz o povo comer.', 'Discurso em inauguração de agência dos Correios no Nordeste.', 'verified', true, '2023-08-15', 'https://g1.globo.com/politica/noticia/2023/08/15/lula-bolsa-familia-investimento.ghtml', 'news_article', 1, 'Recife', 'Inauguração no Nordeste', 'lula-bolsa-investimento-b136-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agr, 'Aguinaldo Ribeiro defende pente-fino mais duro no Bolsa Família.', 'Há fraudes demais no programa. Precisamos de mais rigor no cadastro.', 'Declaração à imprensa sobre CPI da fraude no Bolsa Família.', 'verified', false, '2024-06-05', 'https://www1.folha.uol.com.br/poder/2024/06/aguinaldo-bolsa-fraude.shtml', 'news_article', 3, 'Brasília', 'Câmara dos Deputados', 'aguinaldo-bolsa-fraude-b136-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende Bolsa Família como combate à fome.', 'Na pandemia vimos filas por osso. Bolsa Família tirou a fome do prato do brasileiro.', 'Discurso em plenário sobre mapa da fome.', 'verified', false, '2023-07-26', 'https://www.camara.leg.br/noticias/jandira-bolsa-familia-fome', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'jandira-bolsa-fome-b136-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho defende revogação de pontos da Reforma Trabalhista.', 'Reforma trabalhista de 2017 precarizou trabalho. Precisamos corrigir distorções.', 'Entrevista ao Estadão sobre revisão da Reforma Trabalhista.', 'verified', false, '2023-06-14', 'https://www.estadao.com.br/economia/marinho-reforma-trabalhista/', 'news_article', 1, 'Brasília', 'Ministério do Trabalho', 'marinho-reforma-trabalhista-b136-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende manutenção integral da Reforma Trabalhista.', 'A reforma gerou milhões de empregos. Mexer nela é retrocesso.', 'Entrevista à Band News sobre trabalho.', 'verified', false, '2023-06-20', 'https://www.band.uol.com.br/noticias/adriana-ventura-reforma-trabalhista.html', 'news_article', 3, 'Brasília', 'Band News FM', 'adriana-reforma-trabalhista-b136-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias defende revogação completa da Reforma Trabalhista.', 'Reforma de Temer foi derrota histórica dos trabalhadores. Temos que revogar.', 'Discurso em ato do Dia do Trabalhador em Nova Iguaçu.', 'verified', false, '2023-05-01', 'https://www.brasildefato.com.br/2023/05/01/lindbergh-reforma-trabalhista-ato', 'news_article', 1, 'Nova Iguaçu', 'Ato Dia do Trabalhador', 'lindbergh-reforma-revogar-b136-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epa, 'Eduardo Paes critica Reforma Trabalhista por aumentar trabalho intermitente precário.', 'Virou moda não pagar direitos. Rio tem muito trabalhador intermitente sem renda fixa.', 'Entrevista na Globonews sobre mercado de trabalho carioca.', 'verified', false, '2024-05-10', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/05/10/paes-intermitente.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Globonews', 'paes-intermitente-precario-b136-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem defende expansão da pejotização e trabalho flexível.', 'PJ é liberdade. Quem quer segurança que seja CLT, mas não imponham isso a todos.', 'Discurso em plenário sobre reforma trabalhista.', 'verified', false, '2023-08-23', 'https://www.camara.leg.br/noticias/marcel-pejotizacao', 'news_article', 4, 'Brasília', 'Plenário da Câmara', 'marcel-pejotizacao-b136-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho diz que pejotização é fraude contra trabalhadores.', 'Pejotização é fraude. Não existe PJ autônomo que trabalha subordinado oito horas por dia.', 'Entrevista coletiva após reunião com centrais sindicais sobre pejotização.', 'verified', true, '2024-09-12', 'https://valor.globo.com/brasil/noticia/2024/09/12/marinho-pejotizacao-fraude.ghtml', 'news_article', 2, 'Brasília', 'Ministério do Trabalho', 'marinho-pejotizacao-fraude-b136-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende pejotização como modelo moderno de trabalho.', 'O Brasil precisa abraçar o PJ. Criar burocracia só atrasa nossa economia.', 'Palestra em evento da FIESP sobre trabalho e produtividade.', 'verified', false, '2024-10-08', 'https://www.fiesp.com.br/noticias/tarcisio-evento-pj/', 'news_article', 4, 'São Paulo', 'Evento FIESP', 'tarcisio-pj-moderno-b136-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva defende regulação de plataformas digitais de trabalho.', 'Algoritmo não pode mandar mais que a lei. Precisamos regular essas plataformas.', 'Audiência pública na Câmara sobre fake news e plataformas.', 'verified', false, '2024-04-18', 'https://www.camara.leg.br/noticias/orlando-silva-plataformas', 'news_article', 1, 'Brasília', 'Audiência Pública Câmara', 'orlando-plataformas-b136-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia trabalho escravo contemporâneo em garimpos.', 'Em terras indígenas invadidas encontramos trabalho escravo. Precisamos agir.', 'Coletiva sobre operação em terra yanomami.', 'verified', true, '2023-03-08', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2023-03/sonia-yanomami-escravo', 'news_article', 2, 'Brasília', 'Ministério dos Povos Indígenas', 'sonia-trabalho-escravo-garimpo-b136-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Silvio Almeida denuncia trabalho análogo à escravidão em vinícolas do RS.', 'O que vimos em Bento Gonçalves é inaceitável. Vamos à fundo contra trabalho escravo.', 'Coletiva após resgate de 207 trabalhadores em vinícolas gaúchas.', 'verified', true, '2023-02-26', 'https://g1.globo.com/rs/rio-grande-do-sul/noticia/2023/02/26/silvio-almeida-vinicolas.ghtml', 'news_article', 2, 'Bento Gonçalves', 'Coletiva MDH', 'silvio-trabalho-escravo-b136-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho anuncia combate à terceirização irrestrita no serviço público.', 'Não aceitamos que servidor público seja terceirizado sem critério. Vamos reorganizar.', 'Declaração após reunião com sindicatos do serviço público.', 'verified', false, '2024-02-14', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-02/marinho-terceirizacao', 'news_article', 1, 'Brasília', 'Ministério do Trabalho', 'marinho-terceirizacao-b136-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica proposta de limite à terceirização.', 'Querem engessar o mercado. Terceirização é ferramenta de eficiência.', 'Postagem em rede social criticando política do governo.', 'verified', false, '2024-02-16', 'https://www.metropoles.com/brasil/politica-br/kim-kataguiri-terceirizacao', 'social_media_post', 3, 'São Paulo', 'Postagem em rede social', 'kim-terceirizacao-b136-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia precarização de mulheres em apps de entrega.', 'Mulher no iFood ganha menos, sofre assédio e não tem acesso a banheiro. É inaceitável.', 'Audiência pública com entregadoras na Câmara.', 'verified', true, '2024-06-20', 'https://www.camara.leg.br/noticias/erika-entregadoras-mulheres', 'news_article', 1, 'Brasília', 'Audiência Pública Câmara', 'erika-entregadoras-mulheres-b136-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan2, 'André Janones defende regulamentação de apps e critica precarização.', 'App virou fábrica de escravidão moderna. Muitos recebem menos de R$ 5 por corrida.', 'Live em rede social sobre entregadores de aplicativo.', 'verified', false, '2024-07-04', 'https://www.metropoles.com/brasil/politica-br/janones-apps-escravidao', 'social_media_post', 1, 'Brasília', 'Live em rede social', 'janones-apps-precarizacao-b136-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar defende PEC do Fim da Escala 6x1 como pauta histórica.', 'O Brasil debate isso desde 1988. É hora de avançar para 36 horas.', 'Discurso em plenário sobre PEC da redução de jornada.', 'verified', false, '2024-11-13', 'https://www.camara.leg.br/noticias/chico-alencar-36-horas', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'chico-36-horas-b136-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta sinaliza resistência para pautar PEC do Fim da Escala 6x1.', 'É tema sensível que precisa de muito debate. Não vamos pautar de afogadilho.', 'Entrevista à imprensa após eleição para presidente da Câmara.', 'verified', true, '2025-02-05', 'https://www1.folha.uol.com.br/poder/2025/02/hugo-motta-pec-6x1.shtml', 'news_article', 3, 'Brasília', 'Presidência da Câmara', 'hugo-motta-6x1-b136-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone defende PEC do Fim da Escala 6x1 como pauta feminista.', 'Quem mais sofre com 6x1 são mulheres negras, que acumulam jornada doméstica.', 'Discurso em plenário em favor da PEC.', 'verified', false, '2024-11-14', 'https://www.camara.leg.br/noticias/taliria-6x1-feminista', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'taliria-6x1-feminista-b136-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rnu, 'Ricardo Nunes critica PEC do Fim da Escala 6x1 como ruim para comércio paulistano.', 'Comércio de São Paulo emprega muita gente. Essa PEC vai fechar lojas.', 'Entrevista à Rádio Bandeirantes sobre PEC e economia paulistana.', 'verified', false, '2024-11-22', 'https://www.band.uol.com.br/noticias/ricardo-nunes-comercio-6x1', 'news_article', 3, 'São Paulo', 'Rádio Bandeirantes', 'ricardo-nunes-6x1-b136-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco defende Bolsa Família e combate a desigualdades raciais.', 'Maioria beneficiária do Bolsa Família é de mulheres negras. É pauta racial também.', 'Evento de lançamento da cartilha da Igualdade Racial.', 'verified', false, '2024-03-25', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-03/anielle-bolsa-familia-racial', 'news_article', 1, 'Brasília', 'MIR', 'anielle-bolsa-racial-b136-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende direitos trabalhistas de aplicativos.', 'Entregador não é autônomo. Precisamos garantir direitos a quem roda pelas nossas ruas.', 'Entrevista na TV 247 sobre regulação de plataformas.', 'verified', false, '2024-03-12', 'https://www.brasil247.com/politica/gleisi-entregadores-app', 'news_article', 1, 'Brasília', 'TV 247', 'gleisi-entregadores-b136-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Esther Dweck anuncia reajuste para servidores federais.', 'Servidor federal ficou sem reajuste por anos. Reconhecemos valor do serviço público.', 'Coletiva no Ministério da Gestão sobre mesa de negociação.', 'verified', true, '2023-05-16', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-05/dweck-reajuste-servidores', 'news_article', 1, 'Brasília', 'Ministério da Gestão', 'dweck-reajuste-servidores-b136-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema critica reajuste de servidores federais como gasto irresponsável.', 'Governo gasta com cargo e deixa o resto faltando. É festa na Esplanada.', 'Coletiva após reunião com governadores.', 'verified', false, '2023-05-20', 'https://www.em.com.br/app/noticia/politica/2023/05/20/zema-servidores.shtml', 'news_article', 3, 'Belo Horizonte', 'Palácio Tiradentes', 'zema-servidores-festa-b136-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_huc, 'Humberto Costa defende valorização do trabalho e direitos trabalhistas.', 'Brasil que queremos é com emprego com carteira, salário justo e direitos garantidos.', 'Discurso no Senado sobre agenda de emprego.', 'verified', false, '2023-09-06', 'https://www12.senado.leg.br/noticias/humberto-costa-trabalho', 'news_article', 1, 'Brasília', 'Plenário do Senado', 'humberto-trabalho-direitos-b136-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho lança Programa Emprega + Mulheres para reduzir desemprego feminino.', 'Mulheres são maioria nos desempregados. Emprega + Mulheres chega para mudar isso.', 'Lançamento do programa no Ministério do Trabalho.', 'verified', false, '2023-07-20', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-07/emprega-mulheres', 'news_article', 1, 'Brasília', 'Ministério do Trabalho', 'marinho-emprega-mulheres-b136-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ironiza programa Emprega + Mulheres.', 'Agora vão empregar mulher por cota e demitir homem competente. É assim que funciona.', 'Postagem em rede social atacando política de trabalho.', 'verified', false, '2023-07-24', 'https://www.metropoles.com/brasil/politica-br/nikolas-emprega-mulheres', 'social_media_post', 5, 'Brasília', 'Postagem em rede social', 'nikolas-emprega-mulheres-b136-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende fim da escala 6x1 como pauta de saúde mental.', 'Trabalho demais adoece. Precisamos de jornada que permita vida digna.', 'Entrevista no programa Bom Dia Brasil sobre a PEC.', 'verified', false, '2024-11-18', 'https://g1.globo.com/jornal-hoje/noticia/2024/11/18/samia-6x1-saude-mental.ghtml', 'news_article', 1, 'Brasília', 'Bom Dia Brasil', 'samia-6x1-saude-mental-b136-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende escala 6x1 e ataca PEC como socialista.', 'Trabalho dignifica. Na ditadura do PT querem que brasileiro vire preguiçoso.', 'Live semanal atacando PEC do Fim da Escala 6x1.', 'verified', true, '2024-11-15', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/11/15/bolsonaro-6x1-preguica.htm', 'social_media_post', 5, 'Brasília', 'Live semanal', 'bolsonaro-6x1-preguica-b136-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende modernização trabalhista com proteção e flexibilidade.', 'Precisamos proteger o trabalhador sem engessar as empresas. Equilíbrio é o caminho.', 'Entrevista ao Valor Econômico sobre agenda trabalhista.', 'verified', false, '2024-03-05', 'https://valor.globo.com/politica/noticia/2024/03/05/alckmin-trabalho-equilibrio.ghtml', 'news_article', 2, 'Brasília', 'Vice-Presidência', 'alckmin-trabalho-equilibrio-b136-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha defende Bolsa Família como política de saúde pública.', 'Criança bem alimentada aprende mais e adoece menos. Bolsa Família é saúde.', 'Entrevista ao programa Roda Viva sobre políticas sociais.', 'verified', false, '2023-11-06', 'https://tvcultura.com.br/programas/rodaviva/padilha-bolsa-familia', 'news_article', 1, 'São Paulo', 'Roda Viva', 'padilha-bolsa-saude-b136-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina Silva defende Bolsa Verde para proteção de florestas e renda.', 'Vamos pagar famílias para conservar a floresta. Bolsa Verde é desenvolvimento sustentável.', 'Coletiva sobre retomada do Bolsa Verde no Ministério do Ambiente.', 'verified', false, '2023-08-10', 'https://agenciabrasil.ebc.com.br/meio-ambiente/noticia/2023-08/marina-bolsa-verde', 'news_article', 1, 'Brasília', 'MMA', 'marina-bolsa-verde-b136-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ruc, 'Rui Costa defende Pé-de-Meia como prioridade do governo Lula.', 'Pé-de-Meia é uma das maiores apostas sociais do Brasil. Vai manter jovem na escola.', 'Coletiva na Casa Civil sobre prioridades do governo.', 'verified', false, '2024-01-26', 'https://g1.globo.com/politica/noticia/2024/01/26/rui-costa-pe-de-meia.ghtml', 'news_article', 1, 'Brasília', 'Casa Civil', 'rui-costa-pe-de-meia-b136-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica Pé-de-Meia como gasto populista.', 'Estão dando dinheiro sem avaliar aprendizado. É mais uma bolsa eleitoreira.', 'Discurso em plenário criticando o programa Pé-de-Meia.', 'verified', false, '2024-02-01', 'https://www.camara.leg.br/noticias/adriana-pe-de-meia', 'news_article', 3, 'Brasília', 'Plenário da Câmara', 'adriana-pe-de-meia-b136-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana amplia Pé-de-Meia para alunos da EJA.', 'Adulto que volta pra escola também merece apoio. Vamos ampliar o Pé-de-Meia.', 'Cerimônia de ampliação do programa para EJA.', 'verified', false, '2024-09-15', 'https://agenciabrasil.ebc.com.br/educacao/noticia/2024-09/pe-de-meia-eja', 'news_article', 1, 'Brasília', 'MEC', 'camilo-pe-de-meia-eja-b136-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica Pé-de-Meia como marketing federal.', 'Querem aparecer com programa federal quando os estados fazem o serviço de verdade.', 'Entrevista à CNN Brasil sobre política educacional.', 'verified', false, '2024-02-20', 'https://www.cnnbrasil.com.br/politica/tarcisio-pe-de-meia/', 'news_article', 3, 'São Paulo', 'CNN Brasil', 'tarcisio-pe-de-meia-b136-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comemora R$ 600 fixo no Bolsa Família como legado social.', 'O pobre voltou para o Orçamento. R$ 600 por família é garantia de comida no prato.', 'Discurso em cerimônia do Bolsa Família em Olinda.', 'verified', true, '2023-06-20', 'https://g1.globo.com/pe/pernambuco/noticia/2023/06/20/lula-bolsa-familia-olinda.ghtml', 'news_article', 1, 'Olinda', 'Cerimônia Bolsa Família', 'lula-600-bolsa-familia-b136-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama regulamentação de apps de bolivarianismo.', 'Estão copiando Maduro pra acabar com a Uber. Logo logo só tem táxi do PT.', 'Postagem em rede social atacando PL dos motoristas.', 'verified', false, '2024-03-25', 'https://www.metropoles.com/brasil/politica-br/eduardo-bolsonaro-uber-maduro', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'eduardo-apps-bolivarianismo-b136-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zec, 'Zeca Dirceu defende revisão de pontos da Reforma Trabalhista.', 'Negociado sobre o legislado deu no que estamos vendo: trabalhador sem ferias.', 'Discurso em plenário sobre agenda trabalhista.', 'verified', false, '2024-05-29', 'https://www.camara.leg.br/noticias/zeca-dirceu-trabalhista', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'zeca-dirceu-trabalhista-b136-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jog, 'José Guimarães defende pauta pro-trabalhador no governo Lula.', 'Nossa bancada está ao lado dos trabalhadores. Fim do 6x1 está na pauta.', 'Entrevista em Brasília sobre prioridades legislativas.', 'verified', false, '2024-11-19', 'https://www.camara.leg.br/noticias/jose-guimaraes-6x1', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'jose-guimaraes-6x1-b136-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner defende equilíbrio fiscal com valorização do mínimo.', 'Sem responsabilidade fiscal não há agenda social sustentável. Mas mínimo precisa subir.', 'Entrevista no Senado sobre orçamento federal.', 'verified', false, '2024-07-15', 'https://www12.senado.leg.br/noticias/jaques-wagner-minimo', 'news_article', 1, 'Brasília', 'Senado Federal', 'jaques-wagner-minimo-b136-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Fávaro defende acesso de trabalhadores rurais a direitos.', 'Trabalhador do campo merece mesmo respeito que da cidade. Bolsa Família é legítima.', 'Entrevista em Mato Grosso sobre trabalho rural.', 'verified', false, '2023-10-15', 'https://www.correiobraziliense.com.br/politica/2023/10/favaro-trabalhador-rural.html', 'news_article', 1, 'Cuiabá', 'MAPA', 'favaro-trabalho-rural-b136-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pag, 'Paulo Guedes ataca Bolsa Família como fábrica de dependentes.', 'Assistencialismo cria dependentes eternos. Brasil precisa é de empreendedor.', 'Palestra em evento do mercado financeiro no Rio.', 'verified', false, '2023-09-22', 'https://www.infomoney.com.br/economia/guedes-bolsa-familia/', 'news_article', 4, 'Rio de Janeiro', 'Evento de mercado', 'guedes-bolsa-dependentes-b136-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar defende aumento real do salário mínimo todos os anos.', 'Mínimo não é caridade. É contrato civilizatório que precisamos honrar anualmente.', 'Discurso no plenário sobre orçamento federal.', 'verified', false, '2023-12-06', 'https://www.camara.leg.br/noticias/chico-alencar-minimo', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'chico-minimo-anual-b136-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho anuncia salário mínimo de R$ 1.518 para 2025.', 'O mínimo subirá para R$ 1.518, mantendo a política de valorização real.', 'Anúncio oficial do salário mínimo de 2025.', 'verified', true, '2024-12-27', 'https://g1.globo.com/economia/noticia/2024/12/27/salario-minimo-2025.ghtml', 'news_article', 1, 'Brasília', 'Coletiva oficial', 'marinho-minimo-2025-b136-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende limite de crescimento do mínimo no arcabouço.', 'Arcabouço precisa limitar crescimento do mínimo vinculado a outras despesas.', 'Coletiva no Ministério do Planejamento sobre pacote fiscal.', 'verified', true, '2024-11-27', 'https://valor.globo.com/politica/noticia/2024/11/27/tebet-pacote-fiscal-minimo.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Planejamento', 'tebet-pacote-fiscal-minimo-b136-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias critica limite de crescimento do mínimo no pacote fiscal.', 'Não aceitamos que arrocho do servidor e do mínimo seja ajuste fiscal. É regressivo.', 'Discurso em plenário sobre pacote de corte de gastos.', 'verified', false, '2024-12-03', 'https://www.camara.leg.br/noticias/lindbergh-pacote-fiscal', 'news_article', 2, 'Brasília', 'Plenário da Câmara', 'lindbergh-pacote-fiscal-b136-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias anuncia Bolsa Família alcança 21 milhões de famílias.', 'Chegamos a 21 milhões de famílias. Maior rede de proteção do mundo.', 'Balanço anual do programa na Esplanada dos Ministérios.', 'verified', false, '2024-01-15', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-01/bolsa-familia-21-milhoes', 'news_article', 1, 'Brasília', 'MDS', 'wellington-21-milhoes-b136-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende substituir Bolsa Família por geração de emprego.', 'Ninguém quer viver de bolsa. Emprego é que tira da pobreza de verdade.', 'Entrevista no programa Pânico sobre políticas sociais.', 'verified', false, '2024-05-08', 'https://jovempan.com.br/programas/panico/caiado-bolsa-emprego.html', 'news_article', 3, 'São Paulo', 'Programa Pânico', 'caiado-bolsa-emprego-b136-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton cobra aprovação urgente da PEC do Fim da Escala 6x1.', 'Temos 2 milhões de assinaturas. Câmara precisa respeitar vontade popular e votar.', 'Ato em frente à Câmara cobrando pauta da PEC.', 'verified', true, '2025-03-19', 'https://www.brasildefato.com.br/2025/03/19/erika-hilton-ato-6x1-camara', 'news_article', 1, 'Brasília', 'Ato na Praça dos Três Poderes', 'erika-ato-6x1-camara-b136-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta diz que não pautará PEC do Fim da Escala 6x1 em 2025.', 'Não há consenso. Não vamos pautar algo tão divisivo neste momento.', 'Declaração à imprensa sobre pauta da Câmara.', 'verified', true, '2025-04-10', 'https://www1.folha.uol.com.br/poder/2025/04/hugo-motta-6x1-2025.shtml', 'news_article', 3, 'Brasília', 'Presidência da Câmara', 'hugo-motta-nao-pauta-6x1-b136-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio lança programa paulista alternativo ao Pé-de-Meia.', 'São Paulo paga mais, sem depender de Brasília. É o exemplo que funciona.', 'Lançamento do Bolsa do Povo Estudante em São Paulo.', 'verified', false, '2024-03-18', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-bolsa-povo-estudante', 'news_article', 2, 'São Paulo', 'Palácio dos Bandeirantes', 'tarcisio-bolsa-povo-estudante-b136-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho denuncia uberização da economia e defende direitos mínimos.', 'Uberização joga trabalhador no precipício sem rede de proteção. Vamos regular.', 'Palestra em congresso de direito do trabalho em Brasília.', 'verified', false, '2024-06-14', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-06/marinho-uberizacao', 'news_article', 2, 'Brasília', 'Congresso de Direito do Trabalho', 'marinho-uberizacao-b136-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que Bolsa Família engorda preguiça e destrói trabalho.', 'Muita gente pede pra não conseguir emprego só pra continuar com bolsa do governo.', 'Live semanal durante pré-campanha municipal.', 'verified', true, '2024-07-11', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/07/11/bolsonaro-bolsa-preguica.htm', 'social_media_post', 5, 'Brasília', 'Live semanal', 'bolsonaro-bolsa-preguica-b136-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos defende PEC do Fim da Escala 6x1 como bandeira histórica.', 'Luta pela redução de jornada tem 150 anos. Agora é momento de sermos herdeiros dessa luta.', 'Discurso em ato do Primeiro de Maio em São Paulo.', 'verified', false, '2025-05-01', 'https://www.brasildefato.com.br/2025/05/01/boulos-ato-1-maio', 'news_article', 1, 'São Paulo', 'Ato Primeiro de Maio', 'boulos-1-maio-6x1-b136-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende programa Desenrola Brasil para trabalhadores endividados.', 'Negativado não consegue emprego, não consegue crédito. Desenrola vai liberar a economia.', 'Coletiva sobre Desenrola Brasil no Ministério do Desenvolvimento.', 'verified', false, '2023-07-17', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-07/alckmin-desenrola', 'news_article', 1, 'Brasília', 'MDIC', 'alckmin-desenrola-b136-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca novo Bolsa Família como compra de votos.', 'É dinheiro do pagador de imposto indo para comprar voto. Corrupção institucionalizada.', 'Postagem em rede social atacando Bolsa Família.', 'verified', false, '2024-08-20', 'https://www.metropoles.com/brasil/politica-br/nikolas-bolsa-voto', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-bolsa-compra-voto-b136-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias anuncia integração entre Bolsa Família e Pé-de-Meia.', 'Família do Bolsa terá filho com Pé-de-Meia. É política social integrada.', 'Coletiva sobre integração de programas sociais.', 'verified', false, '2024-04-11', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-04/integracao-bolsa-pe-de-meia', 'news_article', 1, 'Brasília', 'MDS', 'wellington-integracao-pe-de-meia-b136-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem ataca reajuste do mínimo como populismo fiscal.', 'Querem quebrar o país pagando mínimo impagável. É o caminho da Argentina.', 'Discurso em plenário sobre pacote fiscal.', 'verified', false, '2024-12-05', 'https://www.camara.leg.br/noticias/marcel-minimo-argentina', 'news_article', 4, 'Brasília', 'Plenário da Câmara', 'marcel-minimo-argentina-b136-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia jornada exaustiva de entregadores.', 'Ninguém aguenta 12 horas pedalando por R$ 100. Isso não é trabalho, é escravidão digital.', 'Audiência na Câmara com entregadores de app.', 'verified', false, '2024-08-28', 'https://www.camara.leg.br/noticias/erika-entregadores-jornada', 'news_article', 1, 'Brasília', 'Audiência Pública', 'erika-entregadores-jornada-b136-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral cobra aprovação de regulamentação de aplicativos.', 'Estamos há três anos enrolando. Entregador precisa de direitos agora.', 'Entrevista em Brasília sobre tramitação do PL dos motoristas.', 'verified', false, '2024-09-04', 'https://g1.globo.com/politica/noticia/2024/09/04/tabata-aplicativos.ghtml', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'tabata-apps-urgente-b136-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende fim da escala 6x1 e aponta redução gradual da jornada.', 'Sou a favor de reduzir jornada. Vamos discutir com responsabilidade e sem susto.', 'Entrevista ao Jornal Nacional sobre PEC do Fim da Escala 6x1.', 'verified', true, '2024-11-22', 'https://g1.globo.com/jornal-nacional/noticia/2024/11/22/lula-entrevista-jn-6x1.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Jornal Nacional', 'lula-jn-6x1-b136-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
