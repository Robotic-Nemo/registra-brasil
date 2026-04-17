-- Batch 137: Trabalho, salário mínimo, Bolsa Família e Pé-de-Meia 2023-2026 (parte 2)
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho defende piso nacional da enfermagem como direito já conquistado.', 'Piso da enfermagem não se discute. É direito de quem salvou o Brasil na pandemia.', 'Coletiva sobre regulamentação do piso nacional da enfermagem.', 'verified', true, '2023-05-04', 'https://agenciabrasil.ebc.com.br/saude/noticia/2023-05/marinho-piso-enfermagem', 'news_article', 1, 'Brasília', 'Ministério do Trabalho', 'marinho-piso-enfermagem-b137-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende piso da enfermagem e repasses federais para hospitais.', 'Vamos garantir recursos federais para que hospitais paguem o piso justo.', 'Entrevista após reunião com sindicatos de enfermagem.', 'verified', false, '2023-08-10', 'https://g1.globo.com/saude/noticia/2023/08/10/padilha-piso-enfermagem.ghtml', 'news_article', 1, 'Brasília', 'Ministério da Saúde', 'padilha-piso-enfermagem-b137-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema questiona piso da enfermagem e diz que estados não podem pagar.', 'Estados não têm dinheiro. Esse piso foi uma irresponsabilidade do Congresso.', 'Entrevista em Belo Horizonte sobre dívidas hospitalares.', 'verified', false, '2023-09-12', 'https://www.em.com.br/app/noticia/politica/2023/09/12/zema-piso-enfermagem.shtml', 'news_article', 4, 'Belo Horizonte', 'Palácio Tiradentes', 'zema-piso-enfermagem-b137-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Melchionna cobra fiscalização do piso da enfermagem em hospitais privados.', 'Hospital privado rico não pode descumprir piso. Precisamos de fiscalização dura.', 'Audiência pública sobre saúde na Câmara.', 'verified', false, '2024-03-15', 'https://www.camara.leg.br/noticias/melchionna-fiscalizacao-enfermagem', 'news_article', 1, 'Brasília', 'Audiência Pública Câmara', 'melchionna-fiscalizacao-enfermagem-b137-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia salário mínimo de R$ 1.320 em maio de 2023.', 'Prometi e cumpri. Salário mínimo de R$ 1.320 entra em vigor em maio.', 'Cerimônia de assinatura do decreto no Palácio do Planalto.', 'verified', true, '2023-04-28', 'https://g1.globo.com/politica/noticia/2023/04/28/lula-anuncia-minimo-1320.ghtml', 'news_article', 1, 'Brasília', 'Cerimônia Planalto', 'lula-minimo-1320-b137-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar cobra reajuste também para benefícios do INSS.', 'Aposentado também é trabalhador. Precisa ter ganho real, não só o mínimo.', 'Discurso em plenário sobre reajuste do INSS.', 'verified', false, '2024-02-20', 'https://www.camara.leg.br/noticias/chico-aposentado-inss', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'chico-aposentado-inss-b137-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende pacote fiscal e limite de crescimento do mínimo.', 'Mínimo vai continuar subindo, mas com freio para manter sustentabilidade.', 'Coletiva sobre pacote de corte de gastos.', 'verified', true, '2024-11-28', 'https://www1.folha.uol.com.br/mercado/2024/11/haddad-pacote-minimo.shtml', 'news_article', 2, 'Brasília', 'Ministério da Fazenda', 'haddad-pacote-minimo-b137-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann critica aliados do governo por aceitar teto do mínimo.', 'Não podemos abrir mão da valorização do mínimo para agradar mercado.', 'Entrevista em evento do PT sobre pacote fiscal.', 'verified', false, '2024-12-01', 'https://www.brasil247.com/politica/gleisi-pacote-fiscal', 'news_article', 2, 'Brasília', 'Evento do PT', 'gleisi-pacote-fiscal-b137-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende valor do mínimo abaixo da inflação para salvar orçamento.', 'Quem quer salvar o país tem que ter coragem de congelar salário mínimo.', 'Entrevista ao programa Pânico sobre fiscal.', 'verified', false, '2024-12-04', 'https://jovempan.com.br/programas/panico/kim-minimo.html', 'news_article', 4, 'São Paulo', 'Programa Pânico', 'kim-congelar-minimo-b137-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que acabar com escala 6x1 não deve ser imposto sem negociar.', 'A gente não pode acabar com a 6x1 na canetada. Tem que negociar com setores.', 'Entrevista coletiva após reunião com Força Sindical.', 'verified', true, '2024-11-25', 'https://www1.folha.uol.com.br/mercado/2024/11/lula-6x1-canetada.shtml', 'news_article', 3, 'Brasília', 'Palácio do Planalto', 'lula-6x1-canetada-b137-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho defende sindicalismo e critica fragilização de sindicatos.', 'Sindicato forte é condição para democracia. Reforma trabalhista enfraqueceu essa luta.', 'Congresso da CUT em São Paulo.', 'verified', false, '2024-05-10', 'https://www.brasildefato.com.br/2024/05/10/marinho-cut-sindicatos', 'news_article', 2, 'São Paulo', 'Congresso CUT', 'marinho-sindicalismo-b137-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem defende fim do imposto sindical obrigatório.', 'Trabalhador não deve financiar sindicato que não escolheu. Liberdade acima de tudo.', 'Discurso em plenário sobre PL do sindicalismo.', 'verified', false, '2024-06-25', 'https://www.camara.leg.br/noticias/marcel-imposto-sindical', 'news_article', 3, 'Brasília', 'Plenário da Câmara', 'marcel-imposto-sindical-b137-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_huc, 'Humberto Costa defende restabelecer financiamento sindical.', 'Sindicato precisa de recurso para funcionar. Não existe representação sem base.', 'Discurso no Senado sobre sindicalismo.', 'verified', false, '2024-07-10', 'https://www12.senado.leg.br/noticias/humberto-sindicato-financiamento', 'news_article', 2, 'Brasília', 'Plenário do Senado', 'humberto-sindicalismo-b137-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias anuncia Bolsa Família com adicional para gestantes.', 'Gestantes, crianças e adolescentes terão adicional no Bolsa Família.', 'Cerimônia do Novo Bolsa Família no Planalto.', 'verified', false, '2023-03-17', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-03/bolsa-familia-adicionais', 'news_article', 1, 'Brasília', 'Palácio do Planalto', 'wellington-bolsa-gestantes-b137-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca adicional do Bolsa Família e insinua fraude.', 'Adicional por criança é incentivo a ter mais filho para receber mais.', 'Postagem em rede social atacando política social.', 'verified', false, '2023-03-20', 'https://www.metropoles.com/brasil/politica-br/nikolas-bolsa-filhos', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-bolsa-filhos-b137-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro repete que Bolsa Família estimula ter filhos para ganhar bolsa.', 'Povo tem filho pra conseguir auxílio. Isso vai quebrar o Brasil.', 'Live semanal durante pré-campanha municipal.', 'verified', true, '2024-06-06', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/06/06/bolsonaro-bolsa-filhos.htm', 'social_media_post', 5, 'Brasília', 'Live semanal', 'bolsonaro-bolsa-filhos-b137-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho afirma que CLT deve ser modernizada sem retirar direitos.', 'CLT precisa modernizar. Mas modernizar não é tirar direito, é ampliar proteção.', 'Palestra em evento da OIT em Brasília.', 'verified', false, '2024-10-18', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-10/marinho-oit-clt', 'news_article', 1, 'Brasília', 'Evento OIT', 'marinho-oit-clt-b137-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pag, 'Paulo Guedes volta a defender revogar CLT completamente.', 'CLT é herança getulista. País moderno não pode viver amarrado a código de 1943.', 'Evento de investidores no BTG Pactual.', 'verified', false, '2024-04-11', 'https://www.infomoney.com.br/economia/guedes-clt-revogar/', 'news_article', 4, 'São Paulo', 'Evento BTG', 'guedes-revogar-clt-b137-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia racismo no mercado de trabalho.', 'Mulher negra recebe menos em qualquer função. É preciso enfrentar racismo salarial.', 'Audiência pública sobre igualdade salarial.', 'verified', false, '2023-09-05', 'https://www.camara.leg.br/noticias/taliria-racismo-salarial', 'news_article', 1, 'Brasília', 'Audiência Pública', 'taliria-racismo-salarial-b137-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho sanciona Lei de Igualdade Salarial entre homens e mulheres.', 'Brasil terá lei para punir quem pagar menos à mulher pela mesma função.', 'Cerimônia no Planalto da sanção da Lei 14.611/2023.', 'verified', true, '2023-07-03', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2023-07/igualdade-salarial', 'news_article', 1, 'Brasília', 'Cerimônia Planalto', 'marinho-igualdade-salarial-b137-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira zomba da Lei de Igualdade Salarial.', 'Agora tudo é discriminação. Empresa vai contratar só homem pra não dar dor de cabeça.', 'Postagem em rede social contra a lei de igualdade salarial.', 'verified', false, '2023-07-05', 'https://www.metropoles.com/brasil/politica-br/nikolas-igualdade-salarial', 'social_media_post', 5, 'Brasília', 'Postagem em rede social', 'nikolas-igualdade-salarial-b137-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula elogia Bolsa Família e chama de marca do governo.', 'Bolsa Família voltou a ser o coração do governo. Ninguém pode ter fome.', 'Discurso em cerimônia do Bolsa Família na Bahia.', 'verified', true, '2024-07-25', 'https://g1.globo.com/politica/noticia/2024/07/25/lula-bolsa-familia-bahia.ghtml', 'news_article', 1, 'Salvador', 'Cerimônia Bolsa Família', 'lula-bolsa-familia-bahia-b137-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Ronaldo Caiado diz que Bolsa Família é cabresto eleitoral do PT.', 'PT usa Bolsa Família para prender o eleitor. É cabresto eletrônico.', 'Entrevista ao Estadão durante pré-campanha presidencial.', 'verified', false, '2025-03-10', 'https://www.estadao.com.br/politica/caiado-bolsa-familia-cabresto/', 'news_article', 4, 'Goiânia', 'Entrevista Estadão', 'caiado-bolsa-cabresto-b137-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende ampliar Bolsa Família para inclusão produtiva.', 'Bolsa Família precisa vir com porta de saída: trabalho, educação e saúde.', 'Discurso em plenário sobre agenda social.', 'verified', false, '2024-03-22', 'https://www.camara.leg.br/noticias/samia-bolsa-inclusao', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'samia-bolsa-inclusao-b137-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio propõe substituir Bolsa Família por emprego garantido.', 'Só emprego tira da pobreza. Bolsa é paliativo, precisamos de vagas reais.', 'Entrevista na CNN sobre modelo de política social.', 'verified', false, '2024-11-10', 'https://www.cnnbrasil.com.br/politica/tarcisio-emprego-garantido/', 'news_article', 3, 'São Paulo', 'CNN Brasil', 'tarcisio-emprego-bolsa-b137-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Esther Dweck defende reposição para servidores federais.', 'Servidor ficou com 25% de perda salarial. Vamos repor em etapas.', 'Coletiva sobre mesa de negociação com servidores.', 'verified', false, '2024-03-28', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-03/dweck-servidores-reposicao', 'news_article', 1, 'Brasília', 'Ministério da Gestão', 'dweck-servidores-reposicao-b137-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica reajuste de servidores federais como supersalários.', 'Servidor federal já ganha muito mais que o privado. Reajuste é provocação.', 'Discurso em plenário sobre orçamento.', 'verified', false, '2024-04-05', 'https://www.camara.leg.br/noticias/adriana-servidores-super', 'news_article', 3, 'Brasília', 'Plenário da Câmara', 'adriana-servidores-super-b137-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner apoia reajuste ao servidor dentro do arcabouço.', 'Servidor merece respeito. Reajuste é direito e vai respeitar arcabouço.', 'Declaração no Senado sobre mesa de negociação.', 'verified', false, '2024-04-09', 'https://www12.senado.leg.br/noticias/jaques-wagner-servidor-arcabouço', 'news_article', 1, 'Brasília', 'Senado Federal', 'jaques-servidor-arcabouço-b137-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende Pé-de-Meia como maior investimento já feito na juventude.', 'Pé-de-Meia é o maior programa para jovem pobre da história do Brasil.', 'Cerimônia em escola pública do Ceará.', 'verified', true, '2024-03-04', 'https://g1.globo.com/ce/ceara/noticia/2024/03/04/lula-pe-de-meia-ce.ghtml', 'news_article', 1, 'Fortaleza', 'Escola Estadual', 'lula-pe-de-meia-maior-b137-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que Pé-de-Meia é bolsa-esmola disfarçada.', 'Dão esmola aos adolescentes para comprar voto na próxima eleição.', 'Postagem em rede social.', 'verified', false, '2024-03-07', 'https://www.metropoles.com/brasil/politica-br/eduardo-pe-de-meia-esmola', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'eduardo-pe-de-meia-esmola-b137-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia expansão do Pé-de-Meia para 4 milhões de jovens.', 'Chegaremos a 4 milhões de estudantes beneficiados, o maior programa de juventude.', 'Cerimônia de balanço do Pé-de-Meia no MEC.', 'verified', false, '2024-12-10', 'https://agenciabrasil.ebc.com.br/educacao/noticia/2024-12/pe-de-meia-balanco', 'news_article', 1, 'Brasília', 'MEC', 'camilo-pe-de-meia-4-milhoes-b137-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende Pé-de-Meia mas cobra avaliação de resultado.', 'Precisamos medir se Pé-de-Meia está mesmo reduzindo evasão. Dinheiro público exige avaliação.', 'Entrevista em Brasília sobre política educacional.', 'verified', false, '2024-04-22', 'https://www1.folha.uol.com.br/educacao/2024/04/tabata-pe-de-meia-avaliacao.shtml', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'tabata-pe-de-meia-avaliacao-b137-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zec, 'Zeca Dirceu defende proteção do Bolsa Família no pacote fiscal.', 'Cortar Bolsa Família para agradar mercado é traição ao povo brasileiro.', 'Discurso em plenário sobre pacote fiscal.', 'verified', false, '2024-12-06', 'https://www.camara.leg.br/noticias/zeca-bolsa-pacote', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'zeca-bolsa-pacote-b137-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho defende combate ao trabalho infantil como prioridade.', 'Brasil tem 1,8 milhão de crianças em trabalho infantil. É urgente erradicar.', 'Dia Mundial contra o Trabalho Infantil.', 'verified', false, '2023-06-12', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2023-06/trabalho-infantil', 'news_article', 1, 'Brasília', 'Evento Trabalho Infantil', 'marinho-trabalho-infantil-b137-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Silvio Almeida lança plano de combate ao trabalho análogo à escravidão.', 'Plano intersetorial vai juntar Trabalho, Direitos Humanos e Justiça contra escravidão moderna.', 'Lançamento do 4º Plano Nacional.', 'verified', false, '2024-05-13', 'https://www.gov.br/mdh/noticias/2024/05/4-plano-escravo', 'other', 1, 'Brasília', 'MDH', 'silvio-plano-escravo-b137-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias anuncia retirada de 8 milhões da extrema pobreza.', 'Bolsa Família tirou 8 milhões da extrema pobreza em 18 meses de governo Lula.', 'Coletiva de balanço social.', 'verified', true, '2024-07-03', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-07/bolsa-familia-extrema-pobreza', 'news_article', 1, 'Brasília', 'MDS', 'wellington-extrema-pobreza-b137-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro contesta dados sociais do governo Lula.', 'Esses números são inventados. No meu governo é que tirei gente da pobreza.', 'Entrevista à Jovem Pan sobre política social.', 'verified', false, '2024-07-08', 'https://jovempan.com.br/noticias/politica/bolsonaro-dados-sociais.html', 'news_article', 4, 'São Paulo', 'Jovem Pan', 'bolsonaro-dados-sociais-b137-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho anuncia Brasil sai do Mapa da Fome da ONU.', 'Brasil sai do Mapa da Fome. É vitória da política social e do Bolsa Família.', 'Coletiva após publicação de relatório da FAO.', 'verified', true, '2024-07-24', 'https://g1.globo.com/politica/noticia/2024/07/24/marinho-mapa-fome.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Ministério do Trabalho', 'marinho-mapa-fome-b137-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema questiona saída do Brasil do Mapa da Fome.', 'Esses dados são maquiados. Qualquer um anda na rua e vê fome em todo lugar.', 'Entrevista em Belo Horizonte.', 'verified', false, '2024-07-26', 'https://www.em.com.br/app/noticia/politica/2024/07/26/zema-mapa-fome.shtml', 'news_article', 4, 'Belo Horizonte', 'Palácio Tiradentes', 'zema-mapa-fome-b137-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende redução gradual da jornada para 40 horas semanais.', 'Podemos migrar para 40 horas em etapas. Redução da jornada é caminho.', 'Entrevista no JN sobre agenda econômica.', 'verified', true, '2024-11-30', 'https://g1.globo.com/jornal-nacional/noticia/2024/11/30/haddad-jn-40-horas.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Jornal Nacional', 'haddad-jn-40-horas-b137-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura ataca redução de jornada para 40 horas.', 'Vamos perder produtividade e empregos. Brasil já tem horas a menos que Alemanha proporcional.', 'Entrevista à BandNews.', 'verified', false, '2024-12-02', 'https://www.band.uol.com.br/noticias/adriana-40-horas.html', 'news_article', 4, 'São Paulo', 'BandNews', 'adriana-40-horas-b137-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho lança MEI Caminhoneiro e condena precarização do setor.', 'Caminhoneiro não pode ser PJ sem direitos. MEI Caminhoneiro garante proteção.', 'Lançamento do programa no Palácio do Planalto.', 'verified', false, '2024-01-10', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-01/mei-caminhoneiro', 'news_article', 1, 'Brasília', 'Palácio do Planalto', 'marinho-mei-caminhoneiro-b137-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Carlos Lupi defende reforma da previdência dos trabalhadores de app.', 'Motorista de app precisa de uma previdência desenhada pra ele. Modelo atual não serve.', 'Coletiva no Ministério da Previdência.', 'verified', false, '2023-11-14', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-11/lupi-previdencia-app', 'news_article', 1, 'Brasília', 'Ministério da Previdência', 'lupi-previdencia-app-b137-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia que plataformas pagam menos que salário mínimo por hora.', 'Motorista de app ganha R$ 4 a hora descontando despesas. Isso é escravidão moderna.', 'Audiência pública sobre apps.', 'verified', true, '2024-05-22', 'https://www.camara.leg.br/noticias/erika-apps-salario-hora', 'news_article', 1, 'Brasília', 'Audiência Pública', 'erika-apps-salario-hora-b137-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem diz que fiscal do trabalho persegue empresas.', 'Auditor do trabalho virou milícia contra empreendedor. Precisa reformar essa fiscalização.', 'Discurso em plenário atacando fiscalização trabalhista.', 'verified', false, '2024-08-15', 'https://www.camara.leg.br/noticias/marcel-fiscal-trabalho', 'news_article', 5, 'Brasília', 'Plenário da Câmara', 'marcel-fiscal-trabalho-b137-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho defende auditores do trabalho como braço do Estado.', 'Auditor do trabalho salva vidas. Resgata trabalho escravo, fiscaliza segurança.', 'Evento de aniversário da fiscalização do trabalho.', 'verified', false, '2024-08-20', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-08/marinho-auditores-trabalho', 'news_article', 1, 'Brasília', 'Ministério do Trabalho', 'marinho-auditores-trabalho-b137-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende incluir mulheres negras em programa de trabalho decente.', 'Mulher negra é desemprego em dobro. Precisamos ação afirmativa no trabalho.', 'Discurso em plenário sobre igualdade.', 'verified', false, '2024-03-08', 'https://www.camara.leg.br/noticias/jandira-mulheres-negras-trabalho', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'jandira-mulheres-negras-b137-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agr, 'Aguinaldo Ribeiro defende pacote fiscal com restrições ao mínimo.', 'Precisamos dar sinal ao mercado com contenção de despesas, inclusive do mínimo.', 'Entrevista ao Valor sobre pacote fiscal.', 'verified', false, '2024-11-29', 'https://valor.globo.com/politica/noticia/2024/11/29/aguinaldo-pacote-minimo.ghtml', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'aguinaldo-pacote-minimo-b137-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia terceirização como porta da precarização.', 'Terceirizar é jeito legal de pagar menos e dar menos direitos. Resistir é preciso.', 'Ato com trabalhadores terceirizados no Rio.', 'verified', false, '2024-09-04', 'https://www.brasildefato.com.br/2024/09/04/taliria-terceirizacao-rio', 'news_article', 1, 'Rio de Janeiro', 'Ato com trabalhadores', 'taliria-terceirizacao-b137-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos defende salário mínimo de R$ 2.000 até 2026.', 'Brasileiro precisa de mínimo digno. Queremos R$ 2.000 em 2026 com ganho real.', 'Entrevista ao Brasil de Fato sobre propostas.', 'verified', false, '2024-07-08', 'https://www.brasildefato.com.br/2024/07/08/boulos-minimo-2000', 'news_article', 2, 'São Paulo', 'Brasil de Fato', 'boulos-minimo-2000-b137-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona lei dos motoristas de aplicativo apesar das críticas.', 'Vamos ter lei com direitos básicos. Aplicativos precisam contribuir.', 'Cerimônia de sanção da lei dos motoristas.', 'verified', true, '2024-09-20', 'https://g1.globo.com/politica/noticia/2024/09/20/lula-sanciona-lei-motoristas.ghtml', 'news_article', 2, 'Brasília', 'Palácio do Planalto', 'lula-sanciona-motoristas-b137-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ameaça processar governo por regulação de apps.', 'Vamos à Justiça contra essa absurda intervenção no livre mercado.', 'Postagem em rede social após sanção do PL.', 'verified', false, '2024-09-21', 'https://www.metropoles.com/brasil/politica-br/nikolas-apps-justica', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-apps-justica-b137-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho critica pacote fiscal que limita mínimo vinculado.', 'Precisamos preservar mínimo como ferramenta de distribuição de renda.', 'Entrevista à Folha sobre pacote fiscal.', 'verified', false, '2024-12-10', 'https://www1.folha.uol.com.br/mercado/2024/12/marinho-pacote-fiscal-minimo.shtml', 'news_article', 2, 'Brasília', 'Ministério do Trabalho', 'marinho-pacote-minimo-b137-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende arcabouço e diz que mínimo precisa ser previsível.', 'Não podemos vincular mínimo a outras despesas sem teto. Precisa ser previsível.', 'Entrevista ao Estadão.', 'verified', false, '2024-11-29', 'https://www.estadao.com.br/economia/tebet-arcabouço-minimo/', 'news_article', 2, 'Brasília', 'Ministério do Planejamento', 'tebet-arcabouço-minimo-b137-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mel, 'Melchionna defende PEC da Jornada de 4 dias como debate no Brasil.', 'Mundo todo testa 4 dias por semana. Brasil pode fazer piloto em serviço público.', 'Audiência pública sobre jornada.', 'verified', false, '2024-11-27', 'https://www.camara.leg.br/noticias/melchionna-4-dias', 'news_article', 1, 'Brasília', 'Audiência Pública', 'melchionna-4-dias-b137-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rnu, 'Ricardo Nunes defende manutenção da escala 6x1 no comércio paulistano.', 'Mexer no 6x1 vai desorganizar o varejo. São Paulo se opõe.', 'Coletiva na Prefeitura de SP.', 'verified', false, '2024-11-21', 'https://www.prefeitura.sp.gov.br/cidade/noticias/nunes-6x1-comercio', 'other', 3, 'São Paulo', 'Prefeitura de São Paulo', 'nunes-6x1-comercio-b137-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias anuncia vale-gás incluído no Bolsa Família.', 'Gás de cozinha fica mais acessível com auxílio vinculado ao Bolsa Família.', 'Coletiva sobre benefícios sociais.', 'verified', false, '2023-09-06', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-09/vale-gas-bolsa', 'news_article', 1, 'Brasília', 'MDS', 'wellington-vale-gas-b137-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado desafia Bolsa Família em Goiás com programa próprio.', 'Em Goiás damos programa que qualifica. Bolsa Família só eterniza pobreza.', 'Coletiva em Goiânia.', 'verified', false, '2024-09-12', 'https://www.correiobraziliense.com.br/politica/2024/09/caiado-bolsa-goias.html', 'news_article', 3, 'Goiânia', 'Palácio das Esmeraldas', 'caiado-bolsa-goias-b137-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho endossa críticas a demissões em massa na Yellow e afins.', 'Plataformas precisam ter responsabilidade. Essas demissões sumárias precisam parar.', 'Declaração após demissões em massa em apps.', 'verified', false, '2024-06-05', 'https://valor.globo.com/empresas/noticia/2024/06/05/marinho-demissoes-plataformas.ghtml', 'news_article', 2, 'Brasília', 'Ministério do Trabalho', 'marinho-demissoes-plataformas-b137-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton acusa iFood de lobby contra PEC do Fim da Escala 6x1.', 'iFood financia narrativa contra direitos. Plataformas querem manter precarização.', 'Audiência pública sobre plataformas e direitos trabalhistas.', 'verified', true, '2024-12-03', 'https://www.camara.leg.br/noticias/erika-ifood-lobby', 'news_article', 2, 'Brasília', 'Audiência Pública', 'erika-ifood-lobby-b137-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende tributação de plataformas digitais estrangeiras.', 'Plataforma que lucra com trabalhador brasileiro tem que pagar imposto no Brasil.', 'Declaração em evento do Ministério da Fazenda.', 'verified', false, '2024-04-17', 'https://valor.globo.com/brasil/noticia/2024/04/17/haddad-tributacao-plataformas.ghtml', 'news_article', 2, 'Brasília', 'Ministério da Fazenda', 'haddad-tributacao-plataformas-b137-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva defende proteção ao entregador ciclista.', 'Entregador ciclista morre todo dia e plataforma lava as mãos. Precisa mudar.', 'Audiência pública sobre entregadores.', 'verified', false, '2023-11-28', 'https://www.camara.leg.br/noticias/orlando-entregador-ciclista', 'news_article', 1, 'Brasília', 'Audiência Pública', 'orlando-entregador-ciclista-b137-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete valorizar aposentado com aumento acima da inflação.', 'Aposentado é quem construiu o Brasil. Vamos dar ganho real aos que ganham mínimo.', 'Discurso em cerimônia do INSS.', 'verified', true, '2024-04-24', 'https://g1.globo.com/politica/noticia/2024/04/24/lula-aposentados-inss.ghtml', 'news_article', 1, 'Brasília', 'INSS', 'lula-aposentados-inss-b137-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Carlos Lupi defende aposentadoria por idade pra motorista de app.', 'Trabalhador de app precisa de aposentadoria. Vamos criar regime específico.', 'Coletiva no Ministério da Previdência.', 'verified', false, '2024-05-06', 'https://agenciabrasil.ebc.com.br/economia/noticia/2024-05/lupi-aposentadoria-app', 'news_article', 1, 'Brasília', 'Ministério da Previdência', 'lupi-aposentadoria-app-b137-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho anuncia salário mínimo de R$ 1.630 para 2026.', 'Vamos para R$ 1.630 em 2026, com ganho real mesmo dentro do arcabouço.', 'Anúncio oficial do valor do mínimo para 2026.', 'verified', true, '2025-12-26', 'https://g1.globo.com/economia/noticia/2025/12/26/salario-minimo-2026.ghtml', 'news_article', 1, 'Brasília', 'Coletiva oficial', 'marinho-minimo-2026-b137-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que pacote fiscal não prejudica política de valorização do mínimo.', 'O mínimo continua subindo acima da inflação. O arcabouço é sustentável.', 'Coletiva no Ministério da Fazenda.', 'verified', false, '2025-01-08', 'https://www1.folha.uol.com.br/mercado/2025/01/haddad-pacote-fiscal-minimo.shtml', 'news_article', 2, 'Brasília', 'Ministério da Fazenda', 'haddad-pacote-fiscal-2025-b137-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema critica governo Lula por política trabalhista e planeja modelo próprio.', 'Lula quer engessar o Brasil. MG vai mostrar modelo de trabalho moderno e flexível.', 'Entrevista à CNN sobre pré-candidatura presidencial.', 'verified', false, '2025-06-10', 'https://www.cnnbrasil.com.br/politica/zema-modelo-trabalho-mg/', 'news_article', 4, 'Belo Horizonte', 'CNN Brasil', 'zema-modelo-trabalho-b137-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende pacote de desregulamentação trabalhista se for presidente.', 'Se for presidente, vou liberar trabalho no domingo e flexibilizar tudo pra criar emprego.', 'Entrevista ao Poder360 sobre 2026.', 'verified', true, '2025-09-18', 'https://www.poder360.com.br/politica/tarcisio-desregulamentacao-trabalho', 'news_article', 4, 'São Paulo', 'Entrevista Poder360', 'tarcisio-desregulamentacao-trabalho-b137-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos cobra Câmara pautar PEC do Fim da Escala 6x1.', 'Motta precisa colocar PEC em votação. É vontade de maioria do povo brasileiro.', 'Ato em frente à Câmara em Brasília.', 'verified', false, '2025-04-29', 'https://www.brasildefato.com.br/2025/04/29/boulos-ato-6x1-motta', 'news_article', 1, 'Brasília', 'Ato no Congresso', 'boulos-cobra-motta-6x1-b137-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Silvio Almeida denuncia trabalho análogo à escravidão em cafezais de MG.', 'Operação em MG resgatou 200 trabalhadores. Vamos rastrear cadeia de café.', 'Coletiva após operação do MTE em cafeicultura.', 'verified', true, '2024-02-18', 'https://g1.globo.com/mg/minas-gerais/noticia/2024/02/18/silvio-almeida-cafe-escravo.ghtml', 'news_article', 2, 'Belo Horizonte', 'Operação MTE', 'silvio-cafe-escravo-b137-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epa, 'Eduardo Paes defende ampliação do vale-transporte no Rio.', 'Trabalhador carioca perde 4 horas no transporte. Vamos duplicar Vale Social.', 'Cerimônia de lançamento do Bilhete Único Social.', 'verified', false, '2024-03-21', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/03/21/paes-vale-social.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Prefeitura do Rio', 'paes-vale-social-b137-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jca, 'João Campos defende programa próprio de renda mínima no Recife.', 'Recife tem Casa da Gente. Não precisa esperar Brasília pra agir contra pobreza.', 'Coletiva na Prefeitura do Recife.', 'verified', false, '2024-05-30', 'https://jc.ne10.uol.com.br/politica/2024/05/joao-campos-casa-da-gente.html', 'news_article', 1, 'Recife', 'Prefeitura do Recife', 'joao-campos-casa-da-gente-b137-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que empresas devem contribuir mais para INSS.', 'Grandes empresas pagam menos INSS que pequenas. Vamos corrigir essa injustiça.', 'Discurso em evento com pequenos empresários.', 'verified', true, '2024-08-15', 'https://g1.globo.com/politica/noticia/2024/08/15/lula-inss-grandes-empresas.ghtml', 'news_article', 2, 'Brasília', 'Evento Sebrae', 'lula-inss-grandes-empresas-b137-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Esther Dweck assina acordo coletivo com servidores.', 'Mesa permanente de negociação é avanço democrático com servidores.', 'Cerimônia no Palácio do Planalto de assinatura do acordo.', 'verified', false, '2024-05-16', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-05/dweck-servidores-acordo', 'news_article', 1, 'Brasília', 'Palácio do Planalto', 'dweck-servidores-acordo-b137-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca política salarial do governo em pré-campanha.', 'Lula arruína o Brasil dando aumento irresponsável. Vamos reverter tudo isso.', 'Evento com empresários de agronegócio.', 'verified', false, '2025-06-20', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/06/20/bolsonaro-salario-agronegocio.htm', 'news_article', 4, 'Ribeirão Preto', 'Agrishow', 'bolsonaro-salario-agronegocio-b137-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Luiz Marinho defende cotas para mulheres e negros em direção de empresas.', 'Grandes empresas precisam ter mulheres e negros na diretoria. Vamos regular.', 'Evento do MIR sobre representatividade corporativa.', 'verified', false, '2024-05-13', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-05/marinho-cotas-empresas', 'news_article', 2, 'Brasília', 'MIR', 'marinho-cotas-empresas-b137-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca cotas em empresas como racismo às avessas.', 'Querem obrigar empresa a contratar por cor e sexo. Mérito virou pecado.', 'Postagem em rede social.', 'verified', false, '2024-05-15', 'https://www.metropoles.com/brasil/politica-br/nikolas-cotas-empresas', 'social_media_post', 5, 'Brasília', 'Postagem em rede social', 'nikolas-cotas-empresas-b137-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr apoia PEC do Fim da Escala 6x1 pelo Maranhão.', 'Maranhense no comércio sofre muito com 6x1. Precisamos apoiar essa PEC.', 'Discurso em plenário sobre a PEC.', 'verified', false, '2024-11-14', 'https://www.camara.leg.br/noticias/duarte-6x1-maranhao', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'duarte-6x1-maranhao-b137-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho defende fim da escala 6x1 no próprio Ministério.', 'Vamos debater com responsabilidade. Tenho compromisso com redução de jornada.', 'Entrevista à GloboNews sobre PEC.', 'verified', true, '2024-11-18', 'https://g1.globo.com/politica/noticia/2024/11/18/marinho-globonews-6x1.ghtml', 'news_article', 2, 'Brasília', 'GloboNews', 'marinho-globonews-6x1-b137-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco denuncia precarização de trabalhadoras domésticas.', 'Doméstica foi a última a ganhar direitos. Não pode voltar a ser invisível.', 'Evento no MIR sobre trabalho doméstico.', 'verified', false, '2024-04-27', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-04/anielle-domesticas', 'news_article', 1, 'Brasília', 'MIR', 'anielle-domesticas-b137-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem defende trabalho doméstico sem CLT.', 'Empregada doméstica virou luxo. Voltar pra contrato informal gera mais emprego.', 'Entrevista ao portal Gazeta do Povo.', 'verified', false, '2024-06-10', 'https://www.gazetadopovo.com.br/republica/marcel-empregada-domestica/', 'news_article', 5, 'Brasília', 'Gazeta do Povo', 'marcel-domestica-informal-b137-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pag, 'Paulo Guedes critica PEC das Domésticas de 2013.', 'A PEC das Domésticas foi um tiro no pé. Empregou muito menos gente.', 'Palestra em evento de mercado em SP.', 'verified', false, '2023-11-22', 'https://www.infomoney.com.br/economia/guedes-pec-domesticas/', 'news_article', 5, 'São Paulo', 'Evento de mercado', 'guedes-pec-domesticas-b137-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende PEC das Domésticas como marco civilizatório.', 'PEC das Domésticas foi ato civilizatório. Ninguém mais pode tirar direitos dessas trabalhadoras.', 'Discurso em evento do Dia das Mulheres.', 'verified', true, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/lula-domesticas-civilizatorio.ghtml', 'news_article', 1, 'Brasília', 'Cerimônia Palácio do Planalto', 'lula-domesticas-civilizatorio-b137-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende PEC do Fim do 6x1 como prioridade do mandato.', 'Meu mandato existe para acabar com escala 6x1. Seguimos na luta até aprovar.', 'Entrevista à TV 247.', 'verified', true, '2025-02-12', 'https://www.brasil247.com/politica/erika-hilton-tv247-6x1', 'news_article', 1, 'Brasília', 'TV 247', 'erika-tv247-6x1-b137-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz que vai ampliar Bolsa do Povo caso seja presidente.', 'O modelo de SP é melhor. Bolsa do Povo Nacional substituiria Bolsa Família.', 'Entrevista ao Valor sobre pré-campanha 2026.', 'verified', false, '2025-10-08', 'https://valor.globo.com/politica/noticia/2025/10/08/tarcisio-bolsa-do-povo-nacional.ghtml', 'news_article', 3, 'São Paulo', 'Entrevista Valor', 'tarcisio-bolsa-povo-nacional-b137-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dia, 'Wellington Dias rebate críticas e diz que Bolsa Família tem pente-fino permanente.', 'Retiramos 3 milhões de beneficiários irregulares. Programa é enxuto e bem fiscalizado.', 'Coletiva no MDS sobre balanço.', 'verified', false, '2024-12-20', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-12/wellington-pente-fino-balanco', 'news_article', 1, 'Brasília', 'MDS', 'wellington-pente-fino-balanco-b137-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho defende Reforma Sindical com fortalecimento das centrais.', 'Sindicato não pode continuar sem financiamento. Vamos debater reforma sindical.', 'Reunião com presidentes de centrais sindicais.', 'verified', false, '2024-09-30', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-09/reforma-sindical', 'news_article', 2, 'Brasília', 'Ministério do Trabalho', 'marinho-reforma-sindical-b137-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende fim de estabilidade de servidores públicos.', 'Servidor estável é herança getulista. Quem não produz tem que poder ser demitido.', 'Postagem em rede social.', 'verified', false, '2024-10-15', 'https://www.metropoles.com/brasil/politica-br/kim-estabilidade-servidor', 'social_media_post', 4, 'São Paulo', 'Postagem em rede social', 'kim-estabilidade-servidor-b137-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Esther Dweck defende estabilidade como garantia de serviço público independente.', 'Estabilidade não é privilégio, é proteção contra captura política da máquina pública.', 'Entrevista em evento da Enap.', 'verified', false, '2024-10-18', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-10/dweck-estabilidade', 'news_article', 1, 'Brasília', 'Enap', 'dweck-estabilidade-b137-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar defende Pé-de-Meia e cobra avaliação pedagógica.', 'Pé-de-Meia é ótimo. Mas precisamos também investir em qualidade do ensino médio.', 'Discurso em plenário.', 'verified', false, '2024-06-12', 'https://www.camara.leg.br/noticias/chico-pe-de-meia-qualidade', 'news_article', 1, 'Brasília', 'Plenário da Câmara', 'chico-pe-de-meia-qualidade-b137-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia resultados do Pé-de-Meia sobre evasão escolar.', 'Evasão caiu 27% nas escolas com Pé-de-Meia. Funciona e é para ficar.', 'Coletiva com dados do Inep.', 'verified', false, '2025-02-14', 'https://agenciabrasil.ebc.com.br/educacao/noticia/2025-02/pe-de-meia-evasao', 'news_article', 1, 'Brasília', 'MEC', 'camilo-pe-de-meia-evasao-b137-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jog, 'José Guimarães cobra líderes centrão apoio à PEC do Fim do 6x1.', 'Centrão precisa olhar pro povo. Pauta do 6x1 é prioridade da nossa bancada.', 'Entrevista em Brasília.', 'verified', false, '2025-05-15', 'https://www.camara.leg.br/noticias/jose-guimaraes-centrao-6x1', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'jose-guimaraes-centrao-6x1-b137-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta cria GT para estudar PEC do Fim da Escala 6x1.', 'Crio GT para estudar PEC com representantes de todos os setores.', 'Declaração à imprensa sobre GT.', 'verified', true, '2025-05-20', 'https://www1.folha.uol.com.br/poder/2025/05/hugo-motta-gt-6x1.shtml', 'news_article', 3, 'Brasília', 'Presidência da Câmara', 'hugo-motta-gt-6x1-b137-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias critica GT como manobra para esvaziar PEC do 6x1.', 'GT é prorrogação indefinida. É golpe contra o povo que quer fim do 6x1.', 'Declaração em entrevista coletiva em Brasília.', 'verified', false, '2025-05-21', 'https://www.camara.leg.br/noticias/lindbergh-gt-manobra', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'lindbergh-gt-manobra-b137-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marinho comemora geração recorde de empregos com carteira.', 'Criamos 1,8 milhão de empregos com carteira em 2024. É política funcionando.', 'Balanço anual do Caged.', 'verified', true, '2025-01-30', 'https://agenciabrasil.ebc.com.br/economia/noticia/2025-01/caged-2024', 'news_article', 1, 'Brasília', 'Coletiva Ministério do Trabalho', 'marinho-caged-2024-b137-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que dados de emprego do governo Lula são falsos.', 'Esses números do Caged são maquiados. Não confiamos em dados do governo.', 'Entrevista à Record News.', 'verified', false, '2025-02-03', 'https://recordtv.r7.com/record-news/bolsonaro-caged-falso.html', 'other', 5, 'Brasília', 'Record News', 'bolsonaro-caged-falso-b137-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia exploração de indígenas em trabalho rural.', 'Indígena segue sendo explorado como mão de obra barata. Vamos fiscalizar duro.', 'Coletiva do MPI sobre trabalho indígena.', 'verified', false, '2024-08-09', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-08/sonia-trabalho-indigena', 'news_article', 2, 'Brasília', 'MPI', 'sonia-trabalho-indigena-b137-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan2, 'André Janones defende Bolsa Família ampliado em live.', 'Quem ataca Bolsa Família ataca pobre. Vamos ampliar e dignificar o povo.', 'Live em rede social.', 'verified', false, '2024-10-20', 'https://www.metropoles.com/brasil/politica-br/janones-live-bolsa', 'social_media_post', 1, 'Brasília', 'Live em rede social', 'janones-live-bolsa-b137-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz que PEC do Fim do 6x1 só beneficia funcionalismo público.', 'Essa PEC só ajuda servidor público. Na iniciativa privada vai quebrar tudo.', 'Coletiva na Fiesp.', 'verified', false, '2024-12-12', 'https://www.fiesp.com.br/noticias/tarcisio-pec-funcionalismo/', 'news_article', 4, 'São Paulo', 'FIESP', 'tarcisio-pec-funcionalismo-b137-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reafirma compromisso com trabalhadores e Bolsa Família em 2026.', 'O povo brasileiro pode contar comigo. Trabalhador, aposentado e pobre seguem prioridade.', 'Discurso em ato do Primeiro de Maio em 2026.', 'verified', true, '2026-05-01', 'https://g1.globo.com/politica/noticia/2026/05/01/lula-primeiro-maio-2026.ghtml', 'news_article', 1, 'São Paulo', 'Ato Primeiro de Maio', 'lula-1-maio-2026-b137-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
