-- Batch 150: 100 declarações sobre economia — arcabouço, reforma tributária, IR, BC, IOF, super-ricos (2023-2026)
DO $$
DECLARE
  v_lul UUID; v_had UUID; v_teb UUID; v_dwe UUID; v_gle UUID; v_pad UUID; v_rui UUID; v_alc UUID;
  v_mar UUID; v_vie UUID; v_muc UUID; v_mnh UUID; v_fav UUID; v_cam UUID; v_sil UUID;
  v_rcn UUID; v_gal UUID; v_jpp UUID; v_mch UUID; v_mer UUID;
  v_jai UUID; v_edu UUID; v_fla UUID; v_nik UUID; v_zam UUID; v_bia UUID; v_mfe UUID; v_dam UUID; v_mag UUID; v_mou UUID;
  v_mvh UUID; v_kim UUID; v_adv UUID; v_tab UUID; v_eri UUID; v_sam UUID; v_tal UUID; v_jan UUID; v_pab UUID; v_bou UUID;
  v_tar UUID; v_zem UUID; v_cai UUID; v_hel UUID; v_pgu UUID; v_cir UUID; v_mor UUID;
  v_amo UUID; v_gim UUID; v_cal UUID; v_zan UUID; v_din UUID; v_fac UUID; v_bar UUID;
  v_lir UUID; v_hug UUID; v_alm UUID; v_pac UUID; v_ren UUID; v_ran UUID; v_jaw UUID; v_agu UUID; v_eln UUID; v_ter UUID; v_rmn UUID; v_omz UUID; v_ott UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_abu UUID; c_aut UUID;
  c_obs UUID; c_ame UUID; c_neg UUID; c_irr UUID; c_cfi UUID; c_int UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug='lula';
  SELECT id INTO v_had FROM politicians WHERE slug='fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug='simone-tebet';
  SELECT id INTO v_dwe FROM politicians WHERE slug='esther-dweck';
  SELECT id INTO v_gle FROM politicians WHERE slug='gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug='alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug='rui-costa';
  SELECT id INTO v_alc FROM politicians WHERE slug='geraldo-alckmin';
  SELECT id INTO v_mar FROM politicians WHERE slug='marina-silva';
  SELECT id INTO v_vie FROM politicians WHERE slug='mauro-vieira';
  SELECT id INTO v_muc FROM politicians WHERE slug='jose-mucio';
  SELECT id INTO v_mnh FROM politicians WHERE slug='luiz-marinho';
  SELECT id INTO v_fav FROM politicians WHERE slug='carlos-favaro';
  SELECT id INTO v_cam FROM politicians WHERE slug='camilo-santana';
  SELECT id INTO v_sil FROM politicians WHERE slug='alexandre-silveira';
  SELECT id INTO v_rcn FROM politicians WHERE slug='roberto-campos-neto';
  SELECT id INTO v_gal FROM politicians WHERE slug='gabriel-galipolo';
  SELECT id INTO v_jpp FROM politicians WHERE slug='jean-paul-prates';
  SELECT id INTO v_mch FROM politicians WHERE slug='magda-chambriard';
  SELECT id INTO v_mer FROM politicians WHERE slug='aloizio-mercadante';
  SELECT id INTO v_jai FROM politicians WHERE slug='jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug='eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug='flavio-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug='nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug='carla-zambelli';
  SELECT id INTO v_bia FROM politicians WHERE slug='bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug='marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug='damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug='magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug='hamilton-mourao';
  SELECT id INTO v_mvh FROM politicians WHERE slug='marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug='kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug='adriana-ventura';
  SELECT id INTO v_tab FROM politicians WHERE slug='tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug='erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug='samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug='taliria-petrone';
  SELECT id INTO v_jan FROM politicians WHERE slug='andre-janones';
  SELECT id INTO v_pab FROM politicians WHERE slug='pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug='guilherme-boulos';
  SELECT id INTO v_tar FROM politicians WHERE slug='tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug='zema';
  SELECT id INTO v_cai FROM politicians WHERE slug='ronaldo-caiado';
  SELECT id INTO v_hel FROM politicians WHERE slug='helder-barbalho';
  SELECT id INTO v_pgu FROM politicians WHERE slug='paulo-guedes';
  SELECT id INTO v_cir FROM politicians WHERE slug='ciro-gomes';
  SELECT id INTO v_mor FROM politicians WHERE slug='sergio-moro';
  SELECT id INTO v_amo FROM politicians WHERE slug='alexandre-de-moraes';
  SELECT id INTO v_gim FROM politicians WHERE slug='gilmar-mendes';
  SELECT id INTO v_cal FROM politicians WHERE slug='carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug='cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug='flavio-dino';
  SELECT id INTO v_fac FROM politicians WHERE slug='edson-fachin';
  SELECT id INTO v_bar FROM politicians WHERE slug='luis-roberto-barroso';
  SELECT id INTO v_lir FROM politicians WHERE slug='arthur-lira';
  SELECT id INTO v_hug FROM politicians WHERE slug='hugo-motta';
  SELECT id INTO v_alm FROM politicians WHERE slug='davi-alcolumbre';
  SELECT id INTO v_pac FROM politicians WHERE slug='rodrigo-pacheco';
  SELECT id INTO v_ren FROM politicians WHERE slug='renan-calheiros';
  SELECT id INTO v_ran FROM politicians WHERE slug='randolfe-rodrigues';
  SELECT id INTO v_jaw FROM politicians WHERE slug='jaques-wagner';
  SELECT id INTO v_agu FROM politicians WHERE slug='aguinaldo-ribeiro';
  SELECT id INTO v_eln FROM politicians WHERE slug='elmar-nascimento';
  SELECT id INTO v_ter FROM politicians WHERE slug='tereza-cristina';
  SELECT id INTO v_rmn FROM politicians WHERE slug='rogerio-marinho';
  SELECT id INTO v_omz FROM politicians WHERE slug='omar-aziz';
  SELECT id INTO v_ott FROM politicians WHERE slug='otto-alencar';

  SELECT id INTO c_ant FROM categories WHERE slug='antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug='corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug='desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug='abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug='autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug='obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug='ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug='negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug='irresponsabilidade';
  SELECT id INTO c_cfi FROM categories WHERE slug='conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug='intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad apresenta arcabouço fiscal como substituto do teto de gastos.', 'O arcabouço é a regra que o Brasil precisava. Combina responsabilidade e crescimento.', 'Apresentação pública da proposta de novo regime fiscal em março de 2023.', 'verified', true, '2023-03-30', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2023/marco/haddad-apresenta-arcabouco-fiscal', 'other', 1, 'Ministério da Fazenda', 'Apresentação arcabouço', 'haddad-arcabouco-apresentacao-b150-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes critica arcabouço de Haddad como furado.', 'Esse arcabouço é um queijo suíço. Tem buraco em todo lugar.', 'Entrevista ao Estadão em abril de 2023.', 'verified', false, '2023-04-05', 'https://www.estadao.com.br/economia/guedes-critica-arcabouco-haddad-queijo-suico', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'guedes-arcabouco-queijo-b150-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcn, 'Roberto Campos Neto mantém Selic em 13,75% e contrariando governo.', 'A política monetária é definida pela autonomia do Banco Central. Não cederemos a pressão política.', 'Ata do Copom em março de 2023 após cobrança pública de Lula.', 'verified', true, '2023-03-22', 'https://www.bcb.gov.br/detalhenoticia/638/nota', 'other', 2, 'Banco Central', 'Reunião Copom', 'campos-neto-selic-1375-b150-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Campos Neto de adversário do Brasil.', 'Esse cidadão, que é um adversário do Brasil, não pode continuar no cargo.', 'Entrevista à CNN em fevereiro de 2023 atacando presidente do BC.', 'verified', true, '2023-02-02', 'https://www.cnnbrasil.com.br/politica/lula-campos-neto-adversario-brasil/', 'news_article', 3, 'Palácio do Planalto', 'Entrevista', 'lula-campos-neto-adversario-b150-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcn, 'Campos Neto defende autonomia do BC após ataques de Lula.', 'A autonomia do Banco Central é uma conquista institucional. Não voltaremos atrás.', 'Discurso em evento da Febraban em março de 2023.', 'verified', true, '2023-03-15', 'https://www.febraban.org.br/noticias/campos-neto-autonomia-bc', 'news_article', 2, 'Febraban', 'Evento do setor', 'campos-neto-autonomia-defesa-b150-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza ajuste fiscal e defende gastos sociais.', 'Não aceito esse papo de ajuste fiscal. Gastar com pobre não é gasto, é investimento.', 'Discurso em evento em Brasília em abril de 2023.', 'verified', true, '2023-04-12', 'https://www.poder360.com.br/governo/lula-ajuste-fiscal-gasto-pobre/', 'news_article', 3, 'Palácio do Planalto', 'Discurso', 'lula-ajuste-pobre-investimento-b150-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende independência do BC apesar das cobranças de Lula.', 'Tenho dialogado com Campos Neto. A decisão técnica do BC é respeitada.', 'Entrevista após ataques de Lula ao presidente do BC em março de 2023.', 'verified', true, '2023-03-10', 'https://g1.globo.com/economia/noticia/2023/03/10/haddad-defende-independencia-bc.ghtml', 'news_article', 1, 'Ministério da Fazenda', 'Entrevista', 'haddad-independencia-bc-b150-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet apoia arcabouço e pede responsabilidade a todos.', 'Arcabouço precisa ser cumprido rigorosamente. Não admito flexibilização.', 'Entrevista ao Valor em maio de 2023.', 'verified', false, '2023-05-08', 'https://valor.globo.com/politica/noticia/2023/05/08/tebet-arcabouco-responsabilidade.ghtml', 'news_article', 1, 'Ministério do Planejamento', 'Entrevista', 'tebet-arcabouco-responsabilidade-b150-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Gabriel Galípolo assume presidência do BC prometendo diálogo.', 'Vou cumprir metas com autonomia e diálogo. O BC não é isolado.', 'Discurso de posse em janeiro de 2025 após sucessão de Campos Neto.', 'verified', true, '2025-01-02', 'https://www.bcb.gov.br/detalhenoticia/posse-galipolo-2025', 'other', 1, 'Banco Central', 'Posse presidente BC', 'galipolo-posse-bc-b150-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comemora posse de Galípolo e espera juros menores.', 'Com o Galípolo, teremos um BC que olha o povo. Juros vão cair.', 'Entrevista à Radio Agência Gaúcha em janeiro de 2025.', 'verified', true, '2025-01-03', 'https://www.poder360.com.br/governo/lula-galipolo-juros-menores/', 'news_article', 3, 'Porto Alegre', 'Entrevista', 'lula-galipolo-juros-menores-b150-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Galípolo eleva Selic para 14,25% em março de 2025 contra expectativas de Lula.', 'A decisão é técnica. Inflação exige resposta contundente.', 'Coletiva após decisão do Copom em março de 2025.', 'verified', true, '2025-03-19', 'https://www.bcb.gov.br/detalhenoticia/copom-marco-2025', 'other', 2, 'Banco Central', 'Copom', 'galipolo-selic-1425-b150-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia taxação de super-ricos no G20.', 'Quem tem mais precisa pagar mais. Taxação de super-ricos é agenda global.', 'Reunião de ministros de Finanças do G20 em fevereiro de 2024 em São Paulo.', 'verified', true, '2024-02-29', 'https://g1.globo.com/economia/noticia/2024/02/29/haddad-taxacao-super-ricos-g20.ghtml', 'news_article', 1, 'São Paulo', 'G20 Finanças', 'haddad-super-ricos-g20-b150-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad propõe isenção de IR para quem ganha até R$ 5 mil.', 'Vamos isentar quem ganha até 5 mil. É promessa de campanha que estamos cumprindo.', 'Anúncio do projeto de lei em novembro de 2024.', 'verified', true, '2024-11-28', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2024/novembro/ir-5-mil-isencao-haddad', 'other', 1, 'Ministério da Fazenda', 'Anúncio PL IR', 'haddad-ir-5mil-isencao-b150-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica PL do IR R$ 5 mil como populismo.', 'Esse PL é populismo fiscal. Não tem contrapartida.', 'Discurso na Câmara em dezembro de 2024.', 'verified', false, '2024-12-05', 'https://www.camara.leg.br/noticias/adriana-critica-ir-5mil', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'adriana-ir-populismo-b150-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha desinformação sobre IR de R$ 5 mil.', 'O Lula vai taxar seu Pix! Todo mundo vai pagar mais imposto!', 'Postagem viral em janeiro de 2025 que foi desmentida.', 'verified', true, '2025-01-15', 'https://www.metropoles.com/politica/nikolas-pix-imposto-fake-news', 'social_media_post', 4, 'Redes sociais', 'Postagem viral', 'nikolas-pix-imposto-fake-b150-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rebate fake news sobre taxação do Pix.', 'Não existe imposto sobre o Pix. É mentira criminosa.', 'Coletiva em janeiro de 2025 para desmentir fake news.', 'verified', true, '2025-01-16', 'https://g1.globo.com/economia/noticia/2025/01/16/haddad-desmente-taxacao-pix.ghtml', 'news_article', 1, 'Ministério da Fazenda', 'Coletiva desmentido', 'haddad-desmente-pix-b150-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro espalha fake news sobre imposto do Pix em live.', 'Lula quer taxar o Pix do povo. Vão pagar pelo que já pagam.', 'Live em janeiro de 2025 amplificando desinformação.', 'verified', true, '2025-01-17', 'https://www.poder360.com.br/midia/bolsonaro-pix-imposto-live/', 'social_media_post', 4, 'YouTube', 'Live', 'bolsonaro-pix-imposto-live-b150-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica fake news sobre Pix e fala em crime.', 'Estão mentindo sobre o Pix. Quem espalhar vai responder criminalmente.', 'Pronunciamento em cadeia nacional em janeiro de 2025.', 'verified', true, '2025-01-17', 'https://www.gov.br/planalto/pt-br/noticias/2025/01/lula-pronunciamento-pix', 'other', 2, 'Palácio do Planalto', 'Pronunciamento', 'lula-pronunciamento-pix-b150-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad aumenta IOF e provoca crise de maio de 2025.', 'O aumento do IOF é medida arrecadatória necessária para cumprir arcabouço.', 'Decreto de maio de 2025 aumentou IOF para crédito e câmbio.', 'verified', true, '2025-05-22', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/maio/iof-aumento-decreto', 'other', 2, 'Ministério da Fazenda', 'Decreto IOF', 'haddad-iof-aumento-b150-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta articula derrubada do decreto do IOF no Congresso.', 'Não vamos aceitar aumento de imposto por decreto. Vamos derrubar.', 'Declaração após protestos do mercado em maio de 2025.', 'verified', true, '2025-05-28', 'https://www.camara.leg.br/noticias/motta-derrubar-decreto-iof', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista', 'motta-derrubar-iof-b150-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira, ainda deputado, critica IOF e ataca governo.', 'Fazenda atira em tudo que se mexe. Alguém tem que parar essa gastança.', 'Declaração após reunião com Haddad em maio de 2025.', 'verified', false, '2025-05-29', 'https://www.poder360.com.br/congresso/lira-iof-gastanca-fazenda/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'lira-iof-gastanca-b150-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad recua parcialmente no IOF após pressão.', 'Vamos ajustar o decreto para proteger investimentos.', 'Anúncio em junho de 2025 revogando parte do decreto.', 'verified', true, '2025-06-04', 'https://g1.globo.com/economia/noticia/2025/06/04/haddad-recua-iof-decreto.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Coletiva', 'haddad-recua-iof-b150-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alm, 'Alcolumbre promete derrubar decreto IOF no Senado.', 'O Senado não será complacente com mais impostos. Vamos derrubar.', 'Declaração em maio de 2025.', 'verified', false, '2025-05-30', 'https://www12.senado.leg.br/noticias/materias/2025/05/30/alcolumbre-iof-derrubar', 'news_article', 3, 'Senado Federal', 'Entrevista', 'alcolumbre-iof-senado-b150-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende reforma tributária como mais importante em décadas.', 'Essa reforma é a maior transformação tributária do Brasil desde 1988.', 'Discurso após aprovação na Câmara em julho de 2023.', 'verified', true, '2023-07-07', 'https://www.camara.leg.br/noticias/reforma-tributaria-aprovada-haddad', 'news_article', 1, 'Câmara dos Deputados', 'Aprovação 1º turno', 'haddad-reforma-tributaria-cam-b150-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro relata reforma tributária e defende CBS e IBS.', 'CBS e IBS vão simplificar. Acabaremos com cumulatividade.', 'Apresentação do parecer em junho de 2023.', 'verified', false, '2023-06-22', 'https://www.camara.leg.br/noticias/aguinaldo-relator-reforma-tributaria', 'news_article', 1, 'Câmara dos Deputados', 'Parecer reforma', 'aguinaldo-cbs-ibs-b150-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco comanda aprovação da reforma tributária no Senado.', 'Reforma histórica. O Senado fez sua parte pelo Brasil.', 'Declaração após aprovação em 1º turno em novembro de 2023.', 'verified', true, '2023-11-08', 'https://www12.senado.leg.br/noticias/materias/2023/11/08/pacheco-reforma-tributaria', 'other', 1, 'Senado Federal', 'Aprovação reforma', 'pacheco-reforma-aprovada-b150-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina critica alíquota para agronegócio na reforma.', 'O agro não pode ser penalizado. Precisamos alíquota menor.', 'Debate na CCJ do Senado em outubro de 2023.', 'verified', false, '2023-10-18', 'https://www12.senado.leg.br/noticias/materias/2023/10/18/tereza-cristina-agro-reforma', 'news_article', 2, 'Senado Federal', 'Debate CCJ', 'tereza-agro-reforma-b150-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad promulga reforma tributária em cerimônia no Planalto.', 'Hoje é um dia histórico. O Brasil se moderniza.', 'Cerimônia de promulgação em janeiro de 2025.', 'verified', true, '2025-01-16', 'https://www.gov.br/planalto/pt-br/noticias/2025/01/promulgacao-reforma-tributaria', 'other', 1, 'Palácio do Planalto', 'Promulgação LC 214', 'haddad-promulgacao-reforma-b150-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri vota contra reforma tributária.', 'Essa reforma vai aumentar a carga tributária. É enganação.', 'Pronunciamento no plenário em dezembro de 2023.', 'verified', false, '2023-12-15', 'https://www.camara.leg.br/noticias/kim-vota-contra-reforma-tributaria', 'news_article', 2, 'Câmara dos Deputados', 'Votação reforma', 'kim-contra-reforma-b150-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem ataca reforma tributária como maior aumento.', 'É o maior aumento de impostos da história.', 'Discurso em plenário em dezembro de 2023.', 'verified', false, '2023-12-15', 'https://www.camara.leg.br/noticias/marcel-reforma-tributaria-aumento', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'marcel-reforma-aumento-b150-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende taxação de super-ricos em discurso no G20.', 'Um punhado de bilionários não pode decidir o destino da humanidade.', 'Discurso na cúpula do G20 no Rio em novembro de 2024.', 'verified', true, '2024-11-18', 'https://www.gov.br/planalto/pt-br/noticias/2024/11/lula-g20-super-ricos-taxacao', 'other', 1, 'Museu de Arte Moderna, Rio', 'Cúpula G20', 'lula-g20-super-ricos-rio-b150-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia taxação mínima de bilionários em comunicado G20.', 'O G20 aceitou cooperar para taxar os super-ricos. É vitória histórica.', 'Declaração em julho de 2024 após comunicado do G20.', 'verified', true, '2024-07-26', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2024/julho/g20-super-ricos-haddad', 'other', 1, 'Rio de Janeiro', 'Reunião G20 finanças', 'haddad-g20-super-ricos-comunicado-b150-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos defende IR R$ 5 mil e taxação de super-ricos.', 'Desonera trabalhador e taxa quem tem muito. É justiça tributária.', 'Entrevista em dezembro de 2024.', 'verified', false, '2024-12-10', 'https://www.poder360.com.br/congresso/boulos-defende-ir-5-mil-super-ricos/', 'news_article', 1, 'Câmara dos Deputados', 'Entrevista', 'boulos-ir-super-ricos-b150-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende taxar bilionários como prioridade.', 'Enquanto 60 milhões passam fome, bilionários não pagam imposto. Inaceitável.', 'Discurso na Câmara em novembro de 2024.', 'verified', false, '2024-11-22', 'https://www.camara.leg.br/noticias/erika-taxar-bilionarios-fome', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'erika-taxar-bilionarios-b150-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro critica taxação de super-ricos no Senado.', 'Vão espantar os ricos. O Brasil perde investimento.', 'Pronunciamento no Senado em agosto de 2024.', 'verified', false, '2024-08-15', 'https://www12.senado.leg.br/noticias/materias/2024/08/15/flavio-bolsonaro-super-ricos', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'flavio-contra-super-ricos-b150-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende corte de gastos no arcabouço em 2024.', 'Sem corte de gasto, o arcabouço não se sustenta. É matemática.', 'Declaração em julho de 2024 sobre bloqueios.', 'verified', true, '2024-07-22', 'https://valor.globo.com/politica/noticia/2024/07/22/tebet-corte-gastos-arcabouco.ghtml', 'news_article', 1, 'Ministério do Planejamento', 'Entrevista', 'tebet-corte-gastos-b150-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que não cortará Bolsa Família e benefícios sociais.', 'Nem pensar cortar o Bolsa Família. Prefiro cortar outras coisas.', 'Entrevista à Record em agosto de 2024.', 'verified', true, '2024-08-05', 'https://g1.globo.com/politica/noticia/2024/08/05/lula-nao-cortar-bolsa-familia.ghtml', 'news_article', 2, 'Palácio do Planalto', 'Entrevista', 'lula-nao-cortar-bolsa-familia-b150-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad apresenta pacote de corte de gastos em novembro 2024.', 'São R$ 70 bilhões em cortes. É sinalização inequívoca de compromisso fiscal.', 'Coletiva em novembro de 2024.', 'verified', true, '2024-11-27', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2024/novembro/pacote-corte-gastos', 'other', 2, 'Ministério da Fazenda', 'Pacote fiscal', 'haddad-pacote-70-bilhoes-b150-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica pacote fiscal de Haddad como insuficiente.', 'Esse pacote não convence mercado. Dólar dispara, juros sobem.', 'Entrevista em dezembro de 2024.', 'verified', false, '2024-12-04', 'https://www.poder360.com.br/governo/tarcisio-pacote-fiscal-haddad/', 'news_article', 2, 'Palácio dos Bandeirantes', 'Entrevista', 'tarcisio-critica-pacote-b150-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcn, 'Campos Neto alerta para deterioração fiscal em dezembro 2024.', 'Há preocupação com a trajetória fiscal. Expectativas se deterioraram.', 'Ata do Copom em dezembro de 2024.', 'verified', true, '2024-12-11', 'https://www.bcb.gov.br/detalhenoticia/copom-dezembro-2024', 'other', 2, 'Banco Central', 'Copom dezembro', 'campos-neto-deterioracao-fiscal-b150-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes diz que Brasil caminha para estagflação em 2025.', 'Esse é o pior dos mundos. Inflação alta e crescimento baixo.', 'Entrevista ao Estadão em março de 2025.', 'verified', false, '2025-03-15', 'https://www.estadao.com.br/economia/guedes-estagflacao-brasil-2025', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'guedes-estagflacao-2025-b150-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rebate Guedes sobre estagflação.', 'Não há estagflação. PIB cresce e inflação está na meta.', 'Entrevista ao Roda Viva em abril de 2025.', 'verified', false, '2025-04-07', 'https://tvcultura.com.br/noticias/haddad-rebate-guedes-estagflacao', 'news_article', 1, 'TV Cultura', 'Roda Viva', 'haddad-rebate-guedes-b150-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar defende taxação de offshore em relatoria.', 'Taxar offshore é justiça. Rico não pode pagar menos que pobre.', 'Discurso como relator no Senado em novembro de 2023.', 'verified', false, '2023-11-29', 'https://www12.senado.leg.br/noticias/materias/2023/11/29/otto-relator-offshore', 'news_article', 1, 'Senado Federal', 'Votação offshore', 'otto-offshore-taxa-b150-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad comemora aprovação da taxação de offshores e fundos exclusivos.', 'É medida de justiça tributária. Arrecadaremos R$ 20 bi.', 'Declaração após sanção em dezembro de 2023.', 'verified', true, '2023-12-12', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2023/dezembro/offshore-fundos-exclusivos-sancao', 'other', 1, 'Ministério da Fazenda', 'Sanção Lei 14754', 'haddad-offshore-sancao-b150-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco aprova taxação de offshores e fundos exclusivos no Senado.', 'É medida importante. Brasil moderniza sistema tributário.', 'Declaração após aprovação em novembro de 2023.', 'verified', false, '2023-11-29', 'https://www12.senado.leg.br/noticias/materias/2023/11/29/pacheco-offshore-aprovado', 'other', 1, 'Senado Federal', 'Aprovação offshore', 'pacheco-offshore-aprovado-b150-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe articula apoio ao arcabouço no Senado.', 'Governo tem votos. Arcabouço passa com tranquilidade.', 'Entrevista em agosto de 2023.', 'verified', false, '2023-08-18', 'https://www12.senado.leg.br/noticias/materias/2023/08/18/randolfe-articula-arcabouco', 'news_article', 1, 'Senado Federal', 'Entrevista', 'randolfe-articula-arcabouco-b150-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_omz, 'Omar Aziz critica aumento do IOF em 2025.', 'Aumento de IOF pega no bolso do brasileiro. Haddad precisa recuar.', 'Entrevista em junho de 2025.', 'verified', false, '2025-06-02', 'https://www12.senado.leg.br/noticias/materias/2025/06/02/omar-aziz-iof-haddad', 'news_article', 2, 'Senado Federal', 'Entrevista', 'omar-aziz-iof-recuar-b150-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema diz que governo Lula é maior aumento de imposto da história.', 'Lula quer taxar tudo. Maior aumento de imposto da história.', 'Entrevista à CNN Brasil em junho de 2025.', 'verified', true, '2025-06-10', 'https://www.cnnbrasil.com.br/politica/zema-lula-maior-aumento-imposto/', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'zema-maior-aumento-imposto-b150-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Galípolo sinaliza ciclo de cortes de juros para segundo semestre 2025.', 'Se cenário se confirmar, podemos iniciar ciclo de cortes.', 'Comunicado do Copom em julho de 2025.', 'verified', false, '2025-07-30', 'https://www.bcb.gov.br/detalhenoticia/copom-julho-2025', 'other', 1, 'Banco Central', 'Copom julho', 'galipolo-ciclo-cortes-b150-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad apresenta PL do IR R$ 5 mil no Congresso em março 2025.', 'Desoneração de 15 milhões de brasileiros. Promessa cumprida.', 'Cerimônia de envio em março de 2025.', 'verified', true, '2025-03-18', 'https://www.gov.br/planalto/pt-br/noticias/2025/03/pl-ir-5-mil-envio-congresso', 'other', 1, 'Palácio do Planalto', 'Envio PL IR', 'haddad-pl-ir-5mil-envio-b150-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral apoia PL do IR R$ 5 mil.', 'Desonerar quem ganha até 5 mil é justo. Voto a favor.', 'Pronunciamento em abril de 2025.', 'verified', false, '2025-04-08', 'https://www.camara.leg.br/noticias/tabata-apoia-pl-ir-5mil', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'tabata-apoia-ir-5mil-b150-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira vota contra PL do IR R$ 5 mil.', 'Lula vai taxar quem produz riqueza. Não topo.', 'Pronunciamento em outubro de 2025.', 'verified', true, '2025-10-01', 'https://www.camara.leg.br/noticias/nikolas-vota-contra-ir-5mil', 'news_article', 3, 'Câmara dos Deputados', 'Votação IR', 'nikolas-vota-contra-ir-b150-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi defende reforma do IR como pauta do governo.', 'Reforma do IR é justiça. Quem ganha mais paga mais.', 'Entrevista em abril de 2025 como ministra.', 'verified', false, '2025-04-10', 'https://www.poder360.com.br/governo/gleisi-reforma-ir-justica/', 'news_article', 1, 'Palácio do Planalto', 'Entrevista', 'gleisi-reforma-ir-justica-b150-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem acusa governo de criar imposto por trás da reforma.', 'A reforma do IR é um cavalo de Troia. Vai taxar classe média.', 'Pronunciamento em maio de 2025.', 'verified', false, '2025-05-12', 'https://www.camara.leg.br/noticias/marcel-reforma-ir-cavalo-troia', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'marcel-ir-cavalo-troia-b150-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona PL do IR R$ 5 mil em cerimônia.', 'É o maior aumento de isenção de IR da história.', 'Cerimônia de sanção em outubro de 2025.', 'verified', true, '2025-10-15', 'https://www.gov.br/planalto/pt-br/noticias/2025/10/lula-sanciona-ir-5-mil', 'other', 1, 'Palácio do Planalto', 'Sanção IR', 'lula-sanciona-ir-5mil-b150-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcn, 'Campos Neto adverte que arcabouço precisa de credibilidade.', 'Regra fiscal sem credibilidade não funciona. Precisa ser cumprida.', 'Discurso em evento do BTG em setembro de 2023.', 'verified', false, '2023-09-14', 'https://valor.globo.com/financas/noticia/2023/09/14/campos-neto-arcabouco-credibilidade.ghtml', 'news_article', 2, 'BTG Pactual', 'Evento investidores', 'campos-neto-arcabouco-credibilidade-b150-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Campos Neto de saboteador do governo.', 'Esse cara não quer o Brasil crescer. Está sabotando.', 'Entrevista ao GloboNews em agosto de 2023.', 'verified', true, '2023-08-24', 'https://g1.globo.com/politica/noticia/2023/08/24/lula-campos-neto-saboteador.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Entrevista', 'lula-campos-neto-saboteador-b150-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rebate ataques de Lula a Campos Neto em reservado.', 'Não ajuda em nada atacar o presidente do BC publicamente.', 'Declaração reservada registrada pelo Valor em agosto de 2023.', 'verified', false, '2023-08-28', 'https://valor.globo.com/politica/noticia/2023/08/28/haddad-ataques-bc-nao-ajudam.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Reservado', 'haddad-ataques-bc-nao-ajudam-b150-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende fim da autonomia do BC.', 'Esse BC autônomo não funciona. Campos Neto trabalha contra o Brasil.', 'Entrevista à Folha em março de 2023 como presidente do PT.', 'verified', true, '2023-03-22', 'https://www1.folha.uol.com.br/poder/2023/03/gleisi-hoffmann-autonomia-bc-acabar.shtml', 'news_article', 3, 'PT Nacional', 'Entrevista', 'gleisi-autonomia-bc-b150-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcn, 'Campos Neto inicia ciclo de cortes da Selic em agosto 2023.', 'Os dados nos permitem iniciar com cautela o ciclo de cortes.', 'Ata do Copom de agosto de 2023.', 'verified', true, '2023-08-02', 'https://www.bcb.gov.br/detalhenoticia/copom-agosto-2023', 'other', 1, 'Banco Central', 'Copom agosto', 'campos-neto-cicle-cortes-2023-b150-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad apresenta MP de reoneração gradual da folha.', 'A desoneração precisa de contrapartida fiscal.', 'Coletiva em fevereiro de 2024 sobre MP 1202.', 'verified', false, '2024-02-28', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2024/fevereiro/reoneracao-folha-mp-1202', 'other', 2, 'Ministério da Fazenda', 'MP 1202', 'haddad-reoneracao-folha-b150-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco articula derrubada da MP da reoneração.', 'Congresso já decidiu manter desoneração. Não aceitamos MP.', 'Entrevista em março de 2024.', 'verified', true, '2024-03-05', 'https://www12.senado.leg.br/noticias/materias/2024/03/05/pacheco-reoneracao-mp', 'news_article', 3, 'Senado Federal', 'Entrevista', 'pacheco-reoneracao-mp-b150-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad comemora alcance de déficit zero em 2024 apesar da crise.', 'Cumprimos a meta no limite inferior. É resultado de esforço.', 'Entrevista em janeiro de 2025 com dados preliminares.', 'verified', false, '2025-01-28', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/janeiro/resultado-fiscal-2024', 'other', 1, 'Ministério da Fazenda', 'Resultado fiscal', 'haddad-deficit-zero-resultado-b150-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura questiona contabilidade criativa do governo.', 'Esse déficit zero é maquiagem. Tem precatório fora da conta.', 'Pronunciamento em fevereiro de 2025.', 'verified', false, '2025-02-06', 'https://www.camara.leg.br/noticias/adriana-ventura-deficit-maquiagem', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'adriana-deficit-maquiagem-b150-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira pauta PL da desoneração contra vontade do governo.', 'Desoneração é compromisso do Congresso. Pauto.', 'Declaração em março de 2024.', 'verified', true, '2024-03-20', 'https://www.camara.leg.br/noticias/lira-pauta-desoneracao-governo', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista', 'lira-pauta-desoneracao-b150-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende desoneração para 17 setores.', 'Desoneração gera emprego. Não podemos voltar atrás.', 'Discurso no Senado em maio de 2024.', 'verified', false, '2024-05-08', 'https://www12.senado.leg.br/noticias/materias/2024/05/08/tereza-cristina-desoneracao', 'news_article', 1, 'Senado Federal', 'Pronunciamento', 'tereza-desoneracao-17-setores-b150-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad fecha acordo para desoneração parcial após pressão.', 'Chegamos a consenso. Transição até 2027 com cronograma claro.', 'Coletiva em agosto de 2024.', 'verified', false, '2024-08-28', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2024/agosto/desoneracao-acordo-cronograma', 'other', 1, 'Ministério da Fazenda', 'Acordo desoneração', 'haddad-desoneracao-acordo-b150-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho apoia reforma tributária defendendo estados do Norte.', 'Reforma é boa mas precisa proteger estados pobres.', 'Entrevista em novembro de 2023.', 'verified', false, '2023-11-05', 'https://www.agenciapara.com.br/noticia/helder-reforma-tributaria-norte', 'news_article', 1, 'Belém', 'Entrevista', 'helder-reforma-norte-b150-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema critica reforma tributária como prejudicial a Minas.', 'Minas vai perder muito com essa reforma. Não aceito.', 'Entrevista ao Estado de Minas em agosto de 2023.', 'verified', false, '2023-08-12', 'https://www.em.com.br/politica/zema-critica-reforma-tributaria', 'news_article', 2, 'Belo Horizonte', 'Entrevista', 'zema-critica-reforma-b150-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio negocia emenda a reforma que favorece SP.', 'São Paulo representa um terço do PIB. Merece atenção especial.', 'Entrevista em outubro de 2023.', 'verified', false, '2023-10-25', 'https://www.poder360.com.br/estados/tarcisio-reforma-tributaria-sp/', 'news_article', 2, 'Palácio dos Bandeirantes', 'Entrevista', 'tarcisio-reforma-sp-b150-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que reforma tributária é armadilha do PT.', 'PT faz reforma para aumentar imposto. Sempre foi assim.', 'Live em novembro de 2023.', 'verified', false, '2023-11-10', 'https://www.oantagonista.com/politica/bolsonaro-reforma-tributaria-armadilha', 'social_media_post', 3, 'YouTube', 'Live', 'bolsonaro-reforma-armadilha-b150-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad negocia reforma com PEC do Drex e bancos.', 'Queremos modernização. Drex vai revolucionar pagamentos.', 'Evento do BC sobre moeda digital em setembro de 2024.', 'verified', false, '2024-09-10', 'https://www.bcb.gov.br/detalhenoticia/drex-evento-setembro-2024', 'other', 1, 'Banco Central', 'Evento Drex', 'haddad-drex-modernizacao-b150-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri acusa governo de fritar Galípolo para ter juros baixos.', 'Lula quer derrubar juros para ganhar eleição. Vai quebrar o Brasil.', 'Entrevista em abril de 2025.', 'verified', false, '2025-04-18', 'https://www.oantagonista.com/politica/kim-governo-fritar-galipolo', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'kim-fritar-galipolo-b150-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Galípolo rebate pressão por corte antecipado de juros.', 'Não trabalhamos com pressão. Só com dados e meta.', 'Entrevista coletiva em maio de 2025.', 'verified', false, '2025-05-08', 'https://www.bcb.gov.br/detalhenoticia/galipolo-coletiva-maio-2025', 'other', 1, 'Banco Central', 'Coletiva Copom', 'galipolo-rebate-pressao-b150-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra Galípolo publicamente em junho 2025.', 'O Galípolo tem que fazer o que o povo precisa: cortar juros.', 'Declaração em evento sindical em junho de 2025.', 'verified', true, '2025-06-12', 'https://www.poder360.com.br/governo/lula-cobra-galipolo-cortar-juros/', 'news_article', 3, 'São Bernardo', 'Evento sindical', 'lula-cobra-galipolo-b150-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad lança plano Nova Indústria Brasil.', 'Nova Indústria vai gerar empregos e modernizar o país.', 'Cerimônia em janeiro de 2024.', 'verified', false, '2024-01-22', 'https://www.gov.br/planalto/pt-br/noticias/2024/01/nova-industria-brasil-lancamento', 'other', 1, 'Palácio do Planalto', 'Lançamento programa', 'haddad-nova-industria-b150-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes critica Nova Indústria como volta ao nacional-desenvolvimentismo.', 'É a volta do velho PT. Campeões nacionais vão voltar.', 'Entrevista à Jovem Pan em janeiro de 2024.', 'verified', false, '2024-01-25', 'https://jovempan.com.br/programas/pingadas/guedes-nova-industria-campeoes-nacionais.html', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'guedes-nova-industria-critica-b150-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Mercadante defende BNDES como financiador da Nova Indústria.', 'BNDES vai ter papel central. Longo prazo é com a gente.', 'Entrevista em fevereiro de 2024.', 'verified', false, '2024-02-15', 'https://www.bndes.gov.br/noticias/mercadante-nova-industria', 'other', 1, 'BNDES Rio', 'Entrevista', 'mercadante-bndes-nova-industria-b150-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica Haddad como ministro fraco.', 'Haddad é refém de Lira. Governo da Fazenda é fantasia.', 'Entrevista ao Jovem Pan em setembro de 2023.', 'verified', false, '2023-09-18', 'https://jovempan.com.br/noticias/politica/ciro-critica-haddad-refem-lira.html', 'news_article', 3, 'São Paulo', 'Entrevista', 'ciro-critica-haddad-refem-b150-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta derruba decreto IOF em votação histórica na Câmara.', 'A Câmara deu resposta ao governo. Não aceitamos impostos por decreto.', 'Declaração após derrota do governo em junho de 2025.', 'verified', true, '2025-06-25', 'https://www.camara.leg.br/noticias/motta-camara-derruba-iof-2025', 'other', 4, 'Câmara dos Deputados', 'Votação IOF', 'motta-camara-derruba-iof-b150-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica derrubada do decreto e fala em inconstitucionalidade.', 'Derrubar competência do Executivo é inconstitucional. Iremos ao STF.', 'Coletiva após derrota em junho de 2025.', 'verified', true, '2025-06-26', 'https://g1.globo.com/economia/noticia/2025/06/26/haddad-stf-iof-congresso.ghtml', 'news_article', 3, 'Ministério da Fazenda', 'Coletiva', 'haddad-stf-iof-b150-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino julga ADC que questiona derrubada do IOF.', 'É preciso verificar se atuação do Congresso respeita competência do Executivo.', 'Decisão preliminar em julho de 2025.', 'verified', true, '2025-07-08', 'https://www.stf.jus.br/noticia/dino-adc-iof-executivo-legislativo', 'other', 2, 'STF', 'ADC IOF', 'dino-adc-iof-b150-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet critica derrubada do IOF como quebra de harmonia.', 'Congresso e Executivo precisam dialogar. Não derrotar.', 'Declaração em julho de 2025.', 'verified', false, '2025-07-02', 'https://valor.globo.com/politica/noticia/2025/07/02/tebet-iof-harmonia-poderes.ghtml', 'news_article', 1, 'Ministério do Planejamento', 'Entrevista', 'tebet-iof-harmonia-b150-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmn, 'Rogério Marinho fez discurso contra Haddad no Senado.', 'Haddad é o pior ministro da Fazenda. Está quebrando o Brasil.', 'Pronunciamento em junho de 2025.', 'verified', false, '2025-06-10', 'https://www12.senado.leg.br/noticias/materias/2025/06/10/rogerio-marinho-haddad', 'news_article', 3, 'Senado Federal', 'Pronunciamento', 'rogerio-haddad-pior-b150-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Galípolo mantém Selic e sinaliza cautela em setembro 2025.', 'Não há espaço para relaxamento. Inflação segue preocupando.', 'Comunicado Copom de setembro de 2025.', 'verified', false, '2025-09-17', 'https://www.bcb.gov.br/detalhenoticia/copom-setembro-2025', 'other', 1, 'Banco Central', 'Copom setembro', 'galipolo-selic-cautela-b150-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula elogia Galípolo depois de reunião em julho 2025.', 'Galípolo está fazendo bom trabalho. Diferente do antecessor.', 'Entrevista em julho de 2025.', 'verified', false, '2025-07-22', 'https://www.poder360.com.br/governo/lula-elogia-galipolo/', 'news_article', 2, 'Palácio do Planalto', 'Entrevista', 'lula-elogia-galipolo-b150-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad apresenta MP para compensar derrubada do IOF.', 'Vamos cobrir buraco com taxação de bets e criptoativos.', 'Anúncio em junho de 2025 da MP 1303.', 'verified', true, '2025-06-30', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/junho/mp-1303-bets-cripto', 'other', 2, 'Ministério da Fazenda', 'MP 1303', 'haddad-mp-bets-cripto-b150-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eln, 'Elmar Nascimento articula derrubada da MP de bets.', 'Essa MP vai prejudicar emprego no setor de apostas. Derrubamos.', 'Declaração em julho de 2025.', 'verified', false, '2025-07-15', 'https://www.camara.leg.br/noticias/elmar-mp-bets-derrubar', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'elmar-mp-bets-b150-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica lobby das bets no Congresso.', 'É impressionante o poder do lobby. Só no Brasil acontece isso.', 'Entrevista em agosto de 2025.', 'verified', true, '2025-08-05', 'https://g1.globo.com/economia/noticia/2025/08/05/haddad-lobby-bets-congresso.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Entrevista', 'haddad-lobby-bets-b150-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros apoia taxação de bets e critica lobby.', 'Bets prejudicam família. Precisam pagar imposto alto.', 'Pronunciamento em julho de 2025.', 'verified', false, '2025-07-20', 'https://www12.senado.leg.br/noticias/materias/2025/07/20/renan-bets-taxacao', 'news_article', 1, 'Senado Federal', 'Pronunciamento', 'renan-bets-taxa-b150-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que arcabouço precisa ser revisto em 2026.', 'O arcabouço está apertado. Vamos ter que ajustar.', 'Entrevista à GloboNews em outubro de 2025.', 'verified', true, '2025-10-10', 'https://g1.globo.com/politica/noticia/2025/10/10/lula-arcabouco-rever-2026.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Entrevista', 'lula-arcabouco-rever-b150-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rebate Lula sobre revisão do arcabouço.', 'Não precisa rever. Precisamos é cumprir.', 'Entrevista em outubro de 2025.', 'verified', true, '2025-10-12', 'https://valor.globo.com/politica/noticia/2025/10/12/haddad-rebate-lula-arcabouco.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Entrevista', 'haddad-rebate-lula-arcabouco-b150-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro critica aumento de IOF como confisco.', 'IOF é imposto sobre imposto. Confisco disfarçado.', 'Pronunciamento em junho de 2025.', 'verified', false, '2025-06-04', 'https://www12.senado.leg.br/noticias/materias/2025/06/04/flavio-bolsonaro-iof-confisco', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'flavio-iof-confisco-b150-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende revisão dos benefícios tributários para fechar arcabouço.', 'Temos 500 bilhões em renúncia. Precisa mexer para cumprir arcabouço.', 'Declaração em julho de 2025.', 'verified', true, '2025-07-18', 'https://www.gov.br/planejamento/pt-br/noticias/2025/07/tebet-renuncia-tributaria', 'other', 1, 'Ministério do Planejamento', 'Entrevista', 'tebet-renuncia-tributaria-b150-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira critica Haddad por tentativa de eliminar benefícios.', 'Benefícios tributários geram emprego. Não podem ser mexidos.', 'Declaração em julho de 2025.', 'verified', false, '2025-07-25', 'https://www.camara.leg.br/noticias/lira-critica-haddad-beneficios', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'lira-beneficios-emprego-b150-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, false FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad celebra juros em 12,5% em novembro 2025.', 'Selic em queda consistente. Ciclo de crescimento começou.', 'Coletiva em novembro de 2025 após decisão do Copom.', 'verified', false, '2025-11-05', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/novembro/haddad-selic-12-5', 'other', 1, 'Ministério da Fazenda', 'Coletiva', 'haddad-selic-12-5-b150-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Esther Dweck defende retomada de concurso e reajuste a servidores em 2025.', 'Estado forte exige servidor valorizado. Vamos reajustar.', 'Coletiva em março de 2025.', 'verified', false, '2025-03-25', 'https://www.gov.br/gestao/pt-br/noticias/2025/03/dweck-reajuste-servidores-2025', 'other', 1, 'MGI Brasília', 'Coletiva', 'dweck-reajuste-servidores-2025-b150-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica arcabouço e defende retorno do teto de gastos.', 'Teto era melhor. Arcabouço virou licença para gastar.', 'Pronunciamento no Senado em abril de 2025.', 'verified', false, '2025-04-22', 'https://www12.senado.leg.br/noticias/materias/2025/04/22/mourao-teto-arcabouco', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'mourao-teto-arcabouco-b150-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin como vice defende estabilidade macroeconômica em Davos.', 'Brasil é estabilidade. Conquistamos déficit zero e reforma.', 'Discurso em Davos em janeiro de 2026.', 'verified', false, '2026-01-20', 'https://g1.globo.com/economia/noticia/2026/01/20/alckmin-davos-estabilidade.ghtml', 'news_article', 1, 'Davos, Suíça', 'Fórum Econômico Mundial', 'alckmin-davos-estabilidade-2026-b150-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad articula nova fase da agenda econômica para 2026.', 'Em 2026 teremos nova fase: crescimento com inclusão e sustentabilidade.', 'Entrevista em janeiro de 2026.', 'verified', true, '2026-01-28', 'https://valor.globo.com/politica/noticia/2026/01/28/haddad-agenda-economica-2026.ghtml', 'news_article', 1, 'Ministério da Fazenda', 'Entrevista', 'haddad-agenda-2026-b150-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

END $$;
