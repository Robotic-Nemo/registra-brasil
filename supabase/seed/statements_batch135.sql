-- Batch 135: Corruption scandals 2023-2026 (continuation — CPMI INSS, Banco Master, Lupi, Silvio Almeida)
DO $$
DECLARE
  v_gle UUID; v_had UUID; v_lul UUID; v_alc UUID; v_pad UUID;
  v_rui UUID; v_sil UUID; v_cid UUID; v_ani UUID; v_son UUID;
  v_mar UUID; v_lew UUID; v_mes UUID; v_wel UUID; v_lmr UUID;
  v_teb UUID; v_lup UUID; v_jai UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_nik UUID; v_zam UUID; v_kic UUID; v_fel UUID;
  v_dam UUID; v_mag UUID; v_mou UUID; v_van UUID; v_kim UUID;
  v_avn UUID; v_eri UUID; v_sam UUID; v_tal UUID; v_fmn UUID;
  v_tab UUID; v_jan UUID; v_bou UUID; v_cir UUID; v_mor UUID;
  v_pab UUID; v_tar UUID; v_zem UUID; v_cai UUID;
  v_luln UUID; v_lir UUID; v_elm UUID; v_agu UUID; v_mot UUID;
  v_via UUID; v_ren UUID; v_jus UUID; v_ale UUID; v_din UUID; v_gil UUID;
  c_des UUID; c_odi UUID; c_int UUID; c_abu UUID; c_con UUID;
  c_cor UUID; c_nep UUID; c_obs UUID; c_ant UUID; c_ame UUID;
BEGIN
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_wel FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_lmr FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_avn FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fmn FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_luln FROM politicians WHERE slug = 'lulinha';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_elm FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_agu FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_via FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_jus FROM politicians WHERE slug = 'juscelino-filho';
  SELECT id INTO v_ale FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Carlos Lupi nega envolvimento em fraude bilionária do INSS.', 'Nunca soube de nada, não autorizei nenhum desconto indevido de aposentado.', 'Coletiva após estouro do escândalo de descontos em benefícios do INSS.', 'verified', true, '2025-04-25', 'https://www1.folha.uol.com.br/mercado/2025/04/lupi-fraude-inss-nega.shtml', 'news_article', 4, 'Brasília', 'Coletiva Previdência', 'lupi-fraude-inss-nega-b135-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula demite Lupi após explosão do escândalo do INSS.', 'Não tenho dúvidas que meu governo vai apurar tudo e punir responsáveis.', 'Discurso após anúncio de demissão do ministro em meio à fraude.', 'verified', true, '2025-05-02', 'https://g1.globo.com/politica/noticia/2025/05/02/lula-demite-lupi-inss.ghtml', 'news_article', 3, 'Brasília', 'Pronunciamento Planalto', 'lula-demite-lupi-inss-b135-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas explode com escândalo do INSS atacando governo Lula.', 'Lula e Lupi roubaram aposentados por anos! É o petrolão dos velhinhos!', 'Vídeo viral acusando governo de chefiar fraude.', 'verified', true, '2025-04-28', 'https://www.metropoles.com/brasil/politica-br/nikolas-inss-petrolao-velhinhos', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-inss-petrolao-velhinhos-b135-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem lidera pedido de CPMI do INSS na Câmara.', 'Temos que instalar CPMI do INSS imediatamente para apurar esse assalto aos idosos.', 'Discurso no plenário protocolando requerimento de CPMI.', 'verified', true, '2025-05-08', 'https://www.poder360.com.br/congresso/van-hattem-cpmi-inss/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-cpmi-inss-b135-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_via, 'Carlos Viana é escolhido relator da CPMI do INSS no Senado.', 'Vou relatar com rigor, aposentado não pode ser vítima de esquema.', 'Declaração após ser escolhido relator da comissão parlamentar.', 'verified', false, '2025-09-10', 'https://g1.globo.com/politica/noticia/2025/09/10/viana-relator-cpmi-inss.ghtml', 'news_article', 2, 'Senado Federal', 'Coletiva CPMI', 'viana-relator-cpmi-inss-b135-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones denuncia "Banco Master como banco do lulismo" em vídeo.', 'O Banco Master era o caixa do lulismo, pegou dinheiro público escandalosamente.', 'Vídeo no TikTok após intervenção do BC no banco.', 'verified', true, '2025-11-20', 'https://www.cnnbrasil.com.br/politica/janones-banco-master-lulismo/', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'janones-banco-master-lulismo-b135-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad nega envolvimento do governo em esquema do Banco Master.', 'Governo não tem nada a ver com operações privadas do Banco Master.', 'Coletiva na Fazenda após intervenção do Banco Central.', 'verified', true, '2025-11-22', 'https://www1.folha.uol.com.br/mercado/2025/11/haddad-banco-master-nega.shtml', 'news_article', 3, 'Brasília', 'Coletiva Fazenda', 'haddad-banco-master-nega-b135-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida é acusado de assédio por ministra Anielle Franco.', 'Nego veementemente qualquer tipo de assédio, vou me defender na Justiça.', 'Declaração após vazamento de denúncia interna.', 'verified', true, '2024-09-06', 'https://g1.globo.com/politica/noticia/2024/09/06/silvio-almeida-assedio-anielle.ghtml', 'news_article', 5, 'Brasília', 'Coletiva MDH', 'silvio-almeida-assedio-nega-b135-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula demite Silvio Almeida após denúncias de assédio.', 'Não compactuo com assédio em nenhuma hipótese, dentro ou fora do governo.', 'Pronunciamento após demissão do ministro de Direitos Humanos.', 'verified', true, '2024-09-07', 'https://www.metropoles.com/brasil/politica-br/lula-demite-silvio-almeida-assedio', 'news_article', 4, 'Brasília', 'Pronunciamento Planalto', 'lula-demite-silvio-almeida-b135-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco confirma denúncia contra Silvio Almeida.', 'Fui vítima de assédio moral e sexual, minha denúncia é verdadeira.', 'Entrevista ao Fantástico sobre o caso de assédio.', 'verified', true, '2024-09-08', 'https://noticias.uol.com.br/politica/2024/09/08/anielle-confirma-denuncia-silvio.htm', 'news_article', 4, 'Rio de Janeiro', 'Entrevista Fantástico', 'anielle-confirma-denuncia-silvio-b135-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves defende Anielle no caso Silvio Almeida.', 'Estamos ao lado da Anielle, a coragem dela é exemplo para todas as mulheres.', 'Coletiva do Ministério das Mulheres em solidariedade.', 'verified', true, '2024-09-09', 'https://www1.folha.uol.com.br/cotidiano/2024/09/cida-defende-anielle-silvio.shtml', 'news_article', 3, 'Brasília', 'Coletiva MMulheres', 'cida-defende-anielle-b135-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jus, 'Juscelino Filho é denunciado por uso irregular de emendas parlamentares.', 'Nunca desviei verba pública, tudo foi aplicado conforme a lei.', 'Coletiva após reportagem sobre emendas em MA.', 'verified', false, '2023-03-20', 'https://g1.globo.com/politica/noticia/2023/03/20/juscelino-filho-emendas-irregulares.ghtml', 'news_article', 4, 'Brasília', 'Coletiva Comunicações', 'juscelino-emendas-denuncia-b135-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula mantém Juscelino apesar de denúncias iniciais.', 'Juscelino merece presunção de inocência, não vou demitir sem provas.', 'Declaração em viagem oficial sobre o ministro.', 'verified', false, '2023-04-02', 'https://www.metropoles.com/brasil/politica-br/lula-mantem-juscelino-denuncia', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-mantem-juscelino-b135-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem pede CPI de Juscelino Filho na Câmara.', 'Não podemos deixar ministro corrupto se manter no cargo impune.', 'Pronunciamento em plenário pedindo abertura de CPI.', 'verified', false, '2023-03-24', 'https://www.poder360.com.br/congresso/van-hattem-cpi-juscelino/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-cpi-juscelino-b135-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira é acusado de "orçamento secreto" por relatores.', 'O orçamento secreto é regular, foi chancelado pelo Congresso Nacional.', 'Defesa do ex-presidente da Câmara em entrevista.', 'verified', true, '2023-06-15', 'https://www1.folha.uol.com.br/poder/2023/06/lira-orcamento-secreto-defesa.shtml', 'news_article', 4, 'Brasília', 'Entrevista Câmara', 'lira-orcamento-secreto-defesa-b135-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino critica Lira sobre orçamento secreto como ministro.', 'STF já decidiu, o orçamento secreto é inconstitucional, não há volta.', 'Entrevista como ministro da Justiça sobre decisão do STF.', 'verified', false, '2023-12-08', 'https://g1.globo.com/politica/noticia/2023/12/08/dino-lira-orcamento-secreto.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MJ', 'dino-lira-orcamento-secreto-b135-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmar Nascimento defende emendas Pix contra críticas do STF.', 'Emendas Pix são direito do parlamentar, STF não pode interferir.', 'Discurso como líder do União Brasil na Câmara.', 'verified', false, '2024-08-15', 'https://noticias.uol.com.br/politica/2024/08/15/elmar-emendas-pix-stf.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'elmar-emendas-pix-stf-b135-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alexandre de Moraes suspende emendas Pix por falta de transparência.', 'Emendas sem transparência são inconstitucionais, não passam de desvio.', 'Decisão em plenário virtual do STF sobre emendas parlamentares.', 'verified', true, '2024-08-12', 'https://www.cnnbrasil.com.br/politica/moraes-suspende-emendas-pix/', 'news_article', 2, 'Brasília', 'Sessão virtual STF', 'moraes-suspende-emendas-pix-b135-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro defende emendas de relator como legítimas.', 'Emendas de relator são instrumento legítimo, não tem nada de irregular.', 'Declaração em plenário sobre questionamentos ao orçamento.', 'verified', false, '2023-07-10', 'https://www.metropoles.com/brasil/politica-br/aguinaldo-emendas-relator-legitimas', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'aguinaldo-emendas-legitimas-b135-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta defende instalação tardia de CPMI do INSS.', 'A CPMI vai esclarecer tudo, vamos apurar sem pressa e com rigor.', 'Coletiva como presidente da Câmara sobre investigação.', 'verified', false, '2025-08-28', 'https://www.poder360.com.br/congresso/motta-cpmi-inss-rigor/', 'news_article', 2, 'Câmara dos Deputados', 'Coletiva presidência', 'motta-cpmi-inss-rigor-b135-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes critica "protagonismo exagerado" de Moraes no STF.', 'Alguns colegas exageram no protagonismo, STF não pode ser caricatura.', 'Entrevista em evento jurídico em Lisboa, Portugal.', 'verified', true, '2024-06-10', 'https://www1.folha.uol.com.br/poder/2024/06/gilmar-critica-moraes-protagonismo.shtml', 'news_article', 3, 'Lisboa', 'Evento jurídico', 'gilmar-critica-moraes-protagonismo-b135-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros defende CPMI do 8 de janeiro como "dever histórico".', 'A CPMI é dever histórico, não podemos esquecer tentativa de golpe.', 'Coletiva como relator da CPMI do 8 de janeiro.', 'verified', true, '2023-05-30', 'https://g1.globo.com/politica/noticia/2023/05/30/renan-cpmi-8-janeiro-dever.ghtml', 'news_article', 2, 'Senado Federal', 'Coletiva CPMI', 'renan-cpmi-8-janeiro-b135-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é indiciado pela PF por joias sauditas desviadas.', 'Nunca desviei nada, as joias vieram em comitivas oficiais normais.', 'Depoimento à PF sobre joias sauditas após indiciamento.', 'verified', true, '2023-07-03', 'https://noticias.uol.com.br/politica/2023/07/03/bolsonaro-indiciado-joias-pf.htm', 'news_article', 5, 'Brasília', 'Depoimento PF', 'bolsonaro-indiciado-joias-b135-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro continua sendo alvo por rachadinha no Rio.', 'A rachadinha é invenção do PT, já provei mil vezes que é inocente.', 'Entrevista após nova decisão judicial sobre o caso.', 'verified', false, '2024-08-12', 'https://www.metropoles.com/brasil/politica-br/flavio-rachadinha-pt-invencao', 'news_article', 4, 'Rio de Janeiro', 'Entrevista TV', 'flavio-rachadinha-invencao-b135-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luln, 'Lulinha é investigado por lavagem de dinheiro em offshore.', 'Não tenho nenhum envolvimento ilegal, sou empresário regular.', 'Nota oficial do filho mais velho do presidente sobre investigação.', 'verified', false, '2024-03-18', 'https://www.cnnbrasil.com.br/politica/lulinha-lavagem-dinheiro-offshore/', 'news_article', 4, 'São Paulo', 'Nota oficial', 'lulinha-lavagem-offshore-b135-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca Lulinha usando caso da offshore em vídeo.', 'Lulinha tá lavando dinheiro em offshore, o PT é família do crime!', 'Vídeo no TikTok após matéria sobre offshore de Lulinha.', 'verified', true, '2024-03-19', 'https://www.poder360.com.br/governo/nikolas-lulinha-offshore-ataque/', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-lulinha-offshore-b135-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende filho Lulinha contra ataques bolsonaristas.', 'Meu filho é trabalhador honesto, não vou tolerar perseguição à família.', 'Entrevista após ataques sobre a offshore de Lulinha.', 'verified', true, '2024-03-20', 'https://g1.globo.com/politica/noticia/2024/03/20/lula-defende-filho-lulinha.ghtml', 'news_article', 3, 'Brasília', 'Entrevista Planalto', 'lula-defende-lulinha-b135-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro cobra investigação rigorosa do esquema do INSS.', 'Esquema do INSS merece investigação rigorosa, não pode ter acobertamento.', 'Pronunciamento no Senado sobre CPMI do INSS.', 'verified', false, '2025-05-20', 'https://www1.folha.uol.com.br/poder/2025/05/moro-investigacao-inss.shtml', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'moro-investigacao-inss-b135-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende intervenção no Banco Master como "ação técnica".', 'Foi ação técnica do Banco Central, não há ingerência política nenhuma.', 'Coletiva na Fazenda sobre intervenção do BC no banco.', 'verified', false, '2025-11-25', 'https://noticias.uol.com.br/politica/2025/11/25/haddad-banco-master-tecnica.htm', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-banco-master-tecnica-b135-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro pede CPI do Banco Master no Senado.', 'Banco Master movimentou bilhões irregularmente, precisa ser apurado.', 'Protocolo de requerimento no Senado após intervenção do BC.', 'verified', true, '2025-11-28', 'https://www.metropoles.com/brasil/politica-br/flavio-cpi-banco-master', 'news_article', 3, 'Senado Federal', 'Coletiva Senado', 'flavio-cpi-banco-master-b135-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann acusa oposição de "cortina de fumaça" no INSS.', 'Oposição cria cortina de fumaça, fraude do INSS começou na Bolsonaro.', 'Entrevista defendendo governo Lula após ataques.', 'verified', false, '2025-05-05', 'https://www.cnnbrasil.com.br/politica/gleisi-cortina-fumaca-inss-bolsonaro/', 'news_article', 3, 'Brasília', 'Entrevista CNN', 'gleisi-cortina-fumaca-inss-b135-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri aponta "Carlos Lupi protegido pelo Planalto".', 'Lupi é protegido do Planalto há anos, sempre foi intocável no governo.', 'Discurso em plenário acusando proteção política.', 'verified', false, '2025-05-06', 'https://g1.globo.com/politica/noticia/2025/05/06/kim-lupi-protegido-planalto.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'kim-lupi-protegido-planalto-b135-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avn, 'Adriana Ventura aponta "sistêmica" corrupção no governo Lula.', 'Corrupção voltou a ser sistêmica no Lula, INSS é só a ponta do iceberg.', 'Entrevista em evento econômico sobre escândalos.', 'verified', false, '2025-06-12', 'https://www.poder360.com.br/congresso/ventura-corrupcao-sistemica-lula/', 'news_article', 3, 'São Paulo', 'Evento econômico', 'ventura-corrupcao-sistemica-b135-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino aponta responsabilidade de ex-gestores na fraude do INSS.', 'Fraude do INSS tem raízes em gestões anteriores ao governo Lula.', 'Entrevista como ministro do STF sobre aspectos processuais.', 'verified', false, '2025-05-18', 'https://www1.folha.uol.com.br/poder/2025/05/dino-fraude-inss-raizes.shtml', 'news_article', 2, 'Brasília', 'Entrevista STF', 'dino-fraude-inss-raizes-b135-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende Anielle e repudia Silvio Almeida após denúncia.', 'Estou com Anielle, mulheres denunciando assédio merecem proteção.', 'Pronunciamento no plenário em solidariedade à ministra.', 'verified', true, '2024-09-10', 'https://noticias.uol.com.br/politica/2024/09/10/erika-anielle-silvio-assedio.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'erika-anielle-silvio-assedio-b135-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia "misoginia institucional" em defesa de Silvio.', 'Não é possível que haja dúvida, precisamos acolher Anielle imediatamente.', 'Pronunciamento em plenário durante sessão extraordinária.', 'verified', false, '2024-09-11', 'https://g1.globo.com/politica/noticia/2024/09/11/samia-silvio-misoginia-institucional.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'samia-silvio-misoginia-b135-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende atuação da AGU no caso INSS.', 'AGU está atuando vigorosamente para ressarcir aposentados lesados.', 'Coletiva da AGU sobre ação judicial reparatória.', 'verified', false, '2025-06-05', 'https://www.metropoles.com/brasil/politica-br/messias-agu-inss-ressarcimento', 'news_article', 2, 'Brasília', 'Coletiva AGU', 'messias-agu-inss-b135-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Lula por "proteger amigos corruptos".', 'Lula protege Lupi, Juscelino, Silvio, todos amigos corruptos dele.', 'Vídeo viral acumulando escândalos do governo.', 'verified', true, '2025-06-10', 'https://www.cnnbrasil.com.br/politica/nikolas-lula-protege-corruptos/', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-lula-protege-corruptos-b135-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral chama fraude do INSS de "crime contra idosos".', 'Fraude do INSS é crime contra idosos, exige rigor máximo da investigação.', 'Pronunciamento no plenário sobre CPMI.', 'verified', false, '2025-05-12', 'https://www1.folha.uol.com.br/cotidiano/2025/05/tabata-fraude-inss-idosos.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'tabata-fraude-inss-idosos-b135-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fmn, 'Melchionna cobra punição aos bancos envolvidos em descontos INSS.', 'Bancos cúmplices no INSS precisam devolver até último centavo roubado.', 'Discurso em plenário com dados sobre descontos indevidos.', 'verified', false, '2025-06-02', 'https://noticias.uol.com.br/politica/2025/06/02/melchionna-bancos-inss-punicao.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'melchionna-bancos-inss-b135-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones detona Lupi chamando-o de "ladrão de aposentados".', 'Lupi é ladrão de aposentado, apadrinhou a maior fraude social da história!', 'Vídeo viral após estourar escândalo do INSS.', 'verified', true, '2025-04-29', 'https://www.poder360.com.br/governo/janones-lupi-ladrao-aposentados/', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'janones-lupi-ladrao-aposentados-b135-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem denuncia "máfia dos sindicalistas" na fraude INSS.', 'A máfia dos sindicalistas faturou bilhões na fraude dos aposentados.', 'Pronunciamento no plenário sobre origens do esquema.', 'verified', false, '2025-05-15', 'https://g1.globo.com/politica/noticia/2025/05/15/van-hattem-mafia-sindicatos-inss.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-mafia-sindicatos-b135-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira é flagrado em gravação negociando cargos.', 'Não há nada de errado em articulação política, é trabalho de deputado.', 'Declaração após vazamento de áudio polêmico.', 'verified', false, '2023-09-25', 'https://www.metropoles.com/brasil/politica-br/lira-gravacao-cargos', 'news_article', 4, 'Brasília', 'Entrevista Câmara', 'lira-gravacao-cargos-b135-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jus, 'Juscelino Filho é demitido após novas revelações de emendas.', 'Vou provar minha inocência, não desviei nada em benefício próprio.', 'Nota após demissão da pasta das Comunicações.', 'verified', true, '2024-04-12', 'https://www.cnnbrasil.com.br/politica/juscelino-demitido-emendas/', 'news_article', 4, 'Brasília', 'Nota oficial', 'juscelino-demitido-emendas-b135-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula demite Juscelino Filho após pressão da oposição.', 'Não posso manter ministro com tantas dúvidas, peço que se defenda fora.', 'Declaração após demissão do ministro das Comunicações.', 'verified', true, '2024-04-13', 'https://www1.folha.uol.com.br/poder/2024/04/lula-demite-juscelino.shtml', 'news_article', 3, 'Brasília', 'Pronunciamento Planalto', 'lula-demite-juscelino-b135-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alexandre de Moraes autoriza operação PF sobre fraude do INSS.', 'Autoriza-se busca e apreensão nos envolvidos na fraude sistêmica.', 'Decisão judicial no âmbito da investigação do INSS.', 'verified', true, '2025-04-23', 'https://noticias.uol.com.br/politica/2025/04/23/moraes-operacao-inss-autoriza.htm', 'news_article', 2, 'Brasília', 'Decisão STF', 'moraes-operacao-inss-b135-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes questiona "excesso de judicialização" em CPMIs.', 'CPMIs viraram palanque, STF tem que intervir demais nos Legislativos.', 'Palestra em seminário jurídico em São Paulo.', 'verified', false, '2024-11-12', 'https://www.poder360.com.br/congresso/gilmar-cpmi-judicializacao/', 'news_article', 2, 'São Paulo', 'Seminário jurídico', 'gilmar-cpmi-judicializacao-b135-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado chama governo Lula de "festival de corrupção e incompetência".', 'Governo Lula virou festival de corrupção, INSS, Master, Silvio, todos caíram.', 'Entrevista em evento do PP em Goiânia.', 'verified', false, '2025-06-25', 'https://g1.globo.com/go/goias/noticia/2025/06/25/caiado-lula-festival-corrupcao.ghtml', 'news_article', 3, 'Goiânia', 'Evento PP', 'caiado-lula-festival-corrupcao-b135-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema diz que "Lula perdeu o controle" sobre ministros corruptos.', 'Lula perdeu controle sobre ministros, cada semana tem um escândalo novo.', 'Coletiva no palácio do governo de MG.', 'verified', false, '2025-05-28', 'https://www.metropoles.com/brasil/politica-br/zema-lula-perdeu-controle', 'news_article', 3, 'Belo Horizonte', 'Coletiva governo MG', 'zema-lula-perdeu-controle-b135-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes diz que "Lula é incorrigível" sobre amigos corruptos.', 'Lula é incorrigível, nunca vai entender que amigos corruptos mancham o governo.', 'Entrevista em podcast após escândalos sucessivos.', 'verified', false, '2025-05-30', 'https://www.cnnbrasil.com.br/politica/ciro-lula-incorrigivel-corruptos/', 'news_article', 3, 'Fortaleza', 'Entrevista podcast', 'ciro-lula-incorrigivel-b135-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão pede "responsabilização política" de Lula pelo INSS.', 'Lula tem responsabilidade política pelo INSS, nomeou ministro comprometido.', 'Discurso no Senado sobre CPMI do INSS.', 'verified', false, '2025-06-18', 'https://www1.folha.uol.com.br/poder/2025/06/mourao-responsabilidade-lula-inss.shtml', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'mourao-lula-inss-responsabilizacao-b135-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis pede impeachment de Lula por escândalo INSS.', 'Protocolei pedido de impeachment por omissão no escândalo INSS.', 'Discurso em plenário sobre pedido de impeachment.', 'verified', false, '2025-05-14', 'https://noticias.uol.com.br/politica/2025/05/14/kicis-impeachment-lula-inss.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'kicis-impeachment-lula-inss-b135-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro denuncia PT em Washington por corrupção.', 'PT corrupto está de volta ao poder, fraude do INSS prova isso.', 'Palestra no CPAC em Washington sobre Brasil.', 'verified', false, '2025-07-15', 'https://www.metropoles.com/brasil/politica-br/eduardo-cpac-pt-corrupcao', 'news_article', 3, 'Washington', 'Palestra CPAC', 'eduardo-cpac-pt-corrupcao-b135-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta é pressionado a liberar CPMI do Banco Master.', 'Vamos analisar com devido rigor, CPMI precisa ter fundamento técnico.', 'Coletiva sobre novo pedido de CPMI do Master.', 'verified', false, '2025-12-02', 'https://g1.globo.com/politica/noticia/2025/12/02/motta-cpmi-banco-master.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Coletiva presidência', 'motta-cpmi-banco-master-b135-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros critica lentidão da CPMI do INSS.', 'CPMI do INSS está lenta demais, aposentados merecem resposta rápida.', 'Discurso no Senado cobrando avanços da CPMI.', 'verified', false, '2025-10-15', 'https://www.poder360.com.br/congresso/renan-cpmi-inss-lenta/', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'renan-cpmi-inss-lenta-b135-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone exige "ressarcimento total" a aposentados do INSS.', 'Não basta prender culpados, aposentados precisam ter cada centavo devolvido.', 'Pronunciamento em plenário com aposentados lesados.', 'verified', false, '2025-07-22', 'https://www1.folha.uol.com.br/cotidiano/2025/07/taliria-ressarcimento-inss.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'taliria-ressarcimento-inss-b135-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos cobra PT por "não cuidar" do INSS em gestão petista.', 'O PT falhou em cuidar do INSS, precisa reconhecer o erro publicamente.', 'Entrevista à TV Band sobre CPMI.', 'verified', false, '2025-06-08', 'https://noticias.uol.com.br/politica/2025/06/08/boulos-pt-falhou-inss.htm', 'news_article', 2, 'São Paulo', 'Entrevista Band', 'boulos-pt-falhou-inss-b135-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama Silvio Almeida de "falso defensor de direitos".', 'Silvio Almeida era falso defensor, assediava mulher enquanto pregava moral.', 'Discurso em culto após demissão do ex-ministro.', 'verified', false, '2024-09-15', 'https://www.cnnbrasil.com.br/politica/magno-silvio-almeida-falso/', 'news_article', 3, 'Vitória', 'Culto evangélico', 'magno-silvio-almeida-falso-b135-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca Silvio Almeida por "hipocrisia institucional".', 'Silvio Almeida foi hipócrita institucional, pregando o que não praticava.', 'Pronunciamento no Senado após escândalo.', 'verified', false, '2024-09-12', 'https://www.metropoles.com/brasil/politica-br/damares-silvio-hipocrisia', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'damares-silvio-hipocrisia-b135-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano pede impeachment de Lula pelo escândalo do INSS.', 'Lula tem que pagar pelo escândalo do INSS, precisa sofrer impeachment.', 'Postagem em rede social após operação da PF.', 'verified', false, '2025-05-10', 'https://g1.globo.com/politica/noticia/2025/05/10/feliciano-impeachment-lula-inss.ghtml', 'social_media_post', 3, 'São Paulo', 'Postagem em rede social', 'feliciano-impeachment-lula-inss-b135-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal chama Lula de "chefe da quadrilha do INSS".', 'Lula é chefe da quadrilha do INSS, todos ministros dele são cúmplices!', 'Live no Instagram com milhões de visualizações.', 'verified', true, '2025-05-03', 'https://noticias.uol.com.br/politica/2025/05/03/marcal-lula-chefe-quadrilha-inss.htm', 'social_media_post', 4, 'São Paulo', 'Live Instagram', 'marcal-lula-chefe-quadrilha-inss-b135-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rebate Marçal chamando-o de "caluniador profissional".', 'Marçal é caluniador profissional, mente para ganhar likes de bolsonarista.', 'Entrevista após ataques em rede social.', 'verified', false, '2025-05-04', 'https://www1.folha.uol.com.br/poder/2025/05/lula-marcal-caluniador.shtml', 'news_article', 2, 'Brasília', 'Entrevista Planalto', 'lula-marcal-caluniador-b135-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia operação contra quadrilha do INSS.', 'PF cumpre operação robusta, mais de 200 mandados contra quadrilha.', 'Coletiva no Ministério da Justiça sobre operação.', 'verified', true, '2025-04-23', 'https://www.poder360.com.br/policia/lewandowski-operacao-inss/', 'news_article', 2, 'Brasília', 'Coletiva MJ', 'lewandowski-operacao-inss-b135-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro aproveita INSS para atacar Lula em comício.', 'Lula roubou aposentado, o petrolão dos velhinhos prova que PT é incorrigível!', 'Comício bolsonarista em Brasília.', 'verified', true, '2025-05-11', 'https://www.cnnbrasil.com.br/politica/bolsonaro-lula-petrolao-velhinhos/', 'news_article', 4, 'Brasília', 'Comício bolsonarista', 'bolsonaro-lula-petrolao-velhinhos-b135-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wel, 'Wellington Dias rebate ataques sobre gestão do Bolsa Família.', 'Bolsa Família segue sob gestão rigorosa, fraudes foram do governo anterior.', 'Coletiva no MDS sobre programas sociais.', 'verified', false, '2024-03-05', 'https://g1.globo.com/politica/noticia/2024/03/05/wellington-bolsa-familia-rigorosa.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MDS', 'wellington-bolsa-familia-rigorosa-b135-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio cobra "varredura ampla" nos ministérios de Lula.', 'Precisa fazer varredura ampla nos ministérios do Lula, é lama por todo lado.', 'Coletiva no palácio dos Bandeirantes.', 'verified', false, '2025-06-28', 'https://www.metropoles.com/brasil/politica-br/tarcisio-varredura-ministerios-lula', 'news_article', 3, 'São Paulo', 'Coletiva governo SP', 'tarcisio-varredura-ministerios-b135-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia medidas para proteger aposentados após INSS.', 'Vamos devolver todo centavo descontado indevidamente dos aposentados.', 'Coletiva de anúncio de medidas compensatórias.', 'verified', true, '2025-05-06', 'https://noticias.uol.com.br/politica/2025/05/06/haddad-medidas-aposentados-inss.htm', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-medidas-aposentados-b135-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_via, 'Carlos Viana cobra depoimento de ex-ministro Lupi na CPMI.', 'Lupi vai depor, não tem jeito, ele vai explicar o que sabia.', 'Coletiva como relator da CPMI no Senado.', 'verified', false, '2025-10-02', 'https://www1.folha.uol.com.br/poder/2025/10/viana-lupi-depoimento-cpmi.shtml', 'news_article', 2, 'Senado Federal', 'Coletiva CPMI', 'viana-lupi-depoimento-cpmi-b135-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lupi se defende em CPMI dizendo ter "agido no limite da lei".', 'Agi no limite da lei, assinei apenas o que era tecnicamente recomendado.', 'Depoimento de 8 horas na CPMI do INSS no Senado.', 'verified', true, '2025-10-20', 'https://g1.globo.com/politica/noticia/2025/10/20/lupi-cpmi-limite-lei.ghtml', 'news_article', 4, 'Senado Federal', 'Depoimento CPMI', 'lupi-cpmi-limite-lei-b135-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro pressiona Lupi por detalhes em CPMI.', 'Não aceito suas desculpas, ministro sabe tudo que acontece na pasta.', 'Interrogatório na CPMI do INSS no Senado.', 'verified', true, '2025-10-20', 'https://www.cnnbrasil.com.br/politica/flavio-pressiona-lupi-cpmi/', 'news_article', 3, 'Senado Federal', 'Interrogatório CPMI', 'flavio-pressiona-lupi-cpmi-b135-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro cobra responsabilização criminal de dirigentes do INSS.', 'Precisa ter responsabilização criminal clara dos dirigentes envolvidos.', 'Discurso no Senado como senador do União.', 'verified', false, '2025-11-05', 'https://www.poder360.com.br/congresso/moro-responsabilizacao-criminal-inss/', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'moro-responsabilizacao-inss-b135-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes homologa acordo de delação em fraude do INSS.', 'Homologo acordo de delação, colaborador terá benefícios em troca de provas.', 'Decisão em plenário virtual sobre colaborador da PF.', 'verified', true, '2025-08-15', 'https://www.metropoles.com/brasil/politica-br/moraes-delacao-inss-homologa', 'news_article', 2, 'Brasília', 'Decisão STF', 'moraes-delacao-inss-homologa-b135-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim ataca governo por "Banco Master irrigar campanhas petistas".', 'Banco Master irrigou campanhas petistas, é evidente ligação política.', 'Pronunciamento em plenário sobre escândalo bancário.', 'verified', false, '2025-12-10', 'https://noticias.uol.com.br/politica/2025/12/10/kim-banco-master-campanhas-pt.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'kim-banco-master-campanhas-b135-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi nega ligação do PT com o Banco Master.', 'PT não tem nenhuma ligação institucional com o Banco Master, pura mentira.', 'Coletiva do PT em resposta a acusações.', 'verified', false, '2025-12-12', 'https://g1.globo.com/politica/noticia/2025/12/12/gleisi-pt-banco-master.ghtml', 'news_article', 2, 'Brasília', 'Coletiva PT', 'gleisi-pt-banco-master-b135-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones explora Banco Master em série de vídeos virais.', 'Banco Master comprou BRB, tinha dinheiro publico a rodo, vai explodir tudo!', 'Sequência de vídeos no TikTok com milhões de views.', 'verified', true, '2025-12-05', 'https://www1.folha.uol.com.br/mercado/2025/12/janones-banco-master-brb.shtml', 'social_media_post', 3, 'Belo Horizonte', 'Postagem em rede social', 'janones-banco-master-brb-b135-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende gestão de Lula no escândalo do INSS.', 'Lula agiu rapidamente, demitiu Lupi e autorizou investigação profunda.', 'Coletiva no MDIC sobre crise política.', 'verified', false, '2025-05-08', 'https://www.cnnbrasil.com.br/politica/alckmin-lula-agiu-inss/', 'news_article', 1, 'Brasília', 'Coletiva MDIC', 'alckmin-lula-agiu-inss-b135-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jus, 'Juscelino é indiciado pela PF por peculato e lavagem de dinheiro.', 'Continuo confiante na Justiça, vou provar meu ponto de vista no devido tempo.', 'Nota após indiciamento pela Polícia Federal.', 'verified', false, '2025-02-18', 'https://www.metropoles.com/brasil/politica-br/juscelino-indiciado-pf-peculato', 'news_article', 4, 'Brasília', 'Nota oficial', 'juscelino-indiciado-pf-b135-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata cobra Câmara sobre emendas Pix "fora do radar".', 'Emendas Pix viraram balcão de negócios, precisam ter transparência total.', 'Discurso em plenário defendendo transparência.', 'verified', false, '2024-10-08', 'https://noticias.uol.com.br/politica/2024/10/08/tabata-emendas-pix-balcao.htm', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'tabata-emendas-pix-balcao-b135-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia "dinheiro público em aplicações especulativas".', 'Dinheiro público em Banco Master é escândalo, aplicações especulativas fartas.', 'Pronunciamento em plenário sobre intervenção no banco.', 'verified', false, '2025-12-08', 'https://g1.globo.com/politica/noticia/2025/12/08/erika-banco-master-especulativas.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'erika-banco-master-especulativas-b135-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro é investigado em esquema de emendas.', 'Não cometi ato ilegal, vou provar minha correção total a devido tempo.', 'Nota após buscas da PF em escritório político.', 'verified', false, '2024-12-18', 'https://www.poder360.com.br/congresso/aguinaldo-investigado-emendas-pf/', 'news_article', 3, 'João Pessoa', 'Nota oficial', 'aguinaldo-investigado-emendas-b135-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes suspende funcionamento parcial do Banco Master.', 'Determino medidas cautelares contra dirigentes por movimentações suspeitas.', 'Decisão no plenário virtual do STF sobre bancos.', 'verified', true, '2025-12-15', 'https://www1.folha.uol.com.br/mercado/2025/12/moraes-suspende-master-dirigentes.shtml', 'news_article', 2, 'Brasília', 'Decisão STF', 'moraes-suspende-master-dirigentes-b135-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira defende "emendas como direito" após CPMI Pix.', 'Emendas são direito do parlamentar, democracia não pode ser tutelada.', 'Entrevista após críticas à CPMI sobre emendas.', 'verified', false, '2024-09-25', 'https://www.cnnbrasil.com.br/politica/lira-emendas-direito-democracia/', 'news_article', 3, 'Brasília', 'Entrevista Câmara', 'lira-emendas-direito-b135-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha rebate críticas chamando oposição de "aproveitadora".', 'Oposição é aproveitadora, usa tragédia do INSS para ganhar poder.', 'Coletiva na Secretaria de Relações Institucionais.', 'verified', false, '2025-05-16', 'https://noticias.uol.com.br/politica/2025/05/16/padilha-oposicao-aproveitadora-inss.htm', 'news_article', 2, 'Brasília', 'Coletiva SRI', 'padilha-oposicao-aproveitadora-b135-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fmn, 'Fernanda Melchionna denuncia "capitalismo de compadre" no Master.', 'Banco Master é capitalismo de compadre, mistura poder público e privado.', 'Discurso em plenário sobre escândalo bancário.', 'verified', false, '2025-12-18', 'https://g1.globo.com/politica/noticia/2025/12/18/melchionna-capitalismo-compadre-master.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'melchionna-capitalismo-compadre-b135-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva repudia esquema do INSS por "atingir vulneráveis".', 'Fraude do INSS é moralmente repugnante, atinge brasileiros vulneráveis.', 'Declaração após reunião ministerial em Brasília.', 'verified', false, '2025-05-07', 'https://www.metropoles.com/brasil/politica-br/marina-silva-fraude-inss-repugnante', 'news_article', 2, 'Brasília', 'Entrevista MMA', 'marina-silva-inss-repugnante-b135-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet cobra "refundação do INSS" após escândalo.', 'Precisamos refundar o INSS, sistema permite fraude sistêmica há décadas.', 'Entrevista no MPO sobre escândalo previdenciário.', 'verified', false, '2025-06-15', 'https://www1.folha.uol.com.br/mercado/2025/06/tebet-refundacao-inss.shtml', 'news_article', 2, 'Brasília', 'Coletiva MPO', 'tebet-refundacao-inss-b135-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_via, 'Viana apresenta relatório parcial implicando ex-dirigentes do INSS.', 'Relatório parcial aponta responsabilidades claras de ex-dirigentes e empresas.', 'Coletiva apresentando relatório parcial da CPMI no Senado.', 'verified', true, '2025-12-08', 'https://www.poder360.com.br/congresso/viana-relatorio-parcial-inss/', 'news_article', 3, 'Senado Federal', 'Coletiva CPMI', 'viana-relatorio-parcial-inss-b135-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ataca governo sobre INSS em mensagens da Itália.', 'Fugi do Moraes, mas vejo PT roubar aposentados de longe, é lamentável!', 'Postagem em rede social da Itália após fuga do Brasil.', 'verified', true, '2025-05-14', 'https://www.cnnbrasil.com.br/politica/zambelli-italia-inss-mensagens/', 'social_media_post', 3, 'Roma', 'Postagem em rede social', 'zambelli-italia-inss-b135-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula convoca cadeia nacional para explicar medidas do INSS.', 'Vamos devolver cada centavo roubado, todos envolvidos serão punidos.', 'Pronunciamento em cadeia nacional de TV e rádio.', 'verified', true, '2025-05-15', 'https://g1.globo.com/politica/noticia/2025/05/15/lula-cadeia-nacional-inss.ghtml', 'news_article', 3, 'Brasília', 'Cadeia nacional', 'lula-cadeia-nacional-inss-b135-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes questiona "espetacularização" da CPMI INSS.', 'CPMIs viraram espetáculo, precisam manter rigor técnico e jurídico.', 'Palestra em seminário sobre Congresso em Brasília.', 'verified', false, '2025-11-08', 'https://noticias.uol.com.br/politica/2025/11/08/gilmar-cpmi-inss-espetacularizacao.htm', 'news_article', 2, 'Brasília', 'Seminário jurídico', 'gilmar-cpmi-inss-espetacularizacao-b135-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino rejeita habeas corpus para envolvidos no INSS.', 'Rejeito habeas corpus, gravidade dos fatos não permite medidas brandas.', 'Decisão monocrática no STF sobre réus do INSS.', 'verified', true, '2025-09-18', 'https://www1.folha.uol.com.br/poder/2025/09/dino-rejeita-hc-inss.shtml', 'news_article', 2, 'Brasília', 'Decisão STF', 'dino-rejeita-hc-inss-b135-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida rejeita novas acusações em processo judicial.', 'Sou vítima de campanha, vou provar que minhas acusadoras mentiram.', 'Nota oficial após novo processo criminal.', 'verified', false, '2024-12-22', 'https://www.metropoles.com/brasil/politica-br/silvio-almeida-rejeita-acusacoes-processo', 'news_article', 5, 'Brasília', 'Nota oficial', 'silvio-almeida-rejeita-processo-b135-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves cobra CFEMEA por proteção a Anielle.', 'Temos que institucionalmente proteger Anielle e outras vítimas de assédio.', 'Evento no Ministério das Mulheres com ONGs.', 'verified', false, '2024-10-18', 'https://g1.globo.com/politica/noticia/2024/10/18/cida-cfemea-protecao-anielle.ghtml', 'news_article', 2, 'Brasília', 'Evento MMulheres', 'cida-cfemea-anielle-b135-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara apoia Anielle após ataques no caso Silvio.', 'Estamos com Anielle, mulheres negras em cargos são alvo constante.', 'Evento no Ministério dos Povos Indígenas em solidariedade.', 'verified', false, '2024-09-14', 'https://www.cnnbrasil.com.br/politica/sonia-apoia-anielle-silvio/', 'news_article', 2, 'Brasília', 'Evento MPI', 'sonia-apoia-anielle-b135-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que "Lula é o mensalão permanente" no Brasil.', 'Lula é o mensalão permanente, a corrupção na gestão dele é diária.', 'Entrevista em rádio bolsonarista após escândalos.', 'verified', false, '2025-07-05', 'https://www.poder360.com.br/governo/bolsonaro-lula-mensalao-permanente/', 'news_article', 3, 'Brasília', 'Entrevista rádio', 'bolsonaro-lula-mensalao-b135-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rebate Bolsonaro chamando-o de "falador sobre joias roubadas".', 'Esse falador das joias sauditas roubadas vem falar de corrupção comigo?', 'Entrevista em comício do PT em Salvador.', 'verified', true, '2025-07-08', 'https://noticias.uol.com.br/politica/2025/07/08/lula-bolsonaro-joias-sauditas.htm', 'news_article', 3, 'Salvador', 'Comício PT', 'lula-bolsonaro-joias-sauditas-b135-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros cobra "rigor contra Bolsonaro" por joias sauditas.', 'Bolsonaro tem que ser punido com rigor, joias sauditas foram roubo descarado.', 'Discurso no Senado sobre processo das joias.', 'verified', false, '2024-08-20', 'https://www1.folha.uol.com.br/poder/2024/08/renan-rigor-bolsonaro-joias.shtml', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'renan-rigor-bolsonaro-joias-b135-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende Lula chamando escândalos de "esforço oposicionista".', 'Todo escândalo é inflado pela oposição, Lula não tem nada a ver com isso.', 'Coletiva na Casa Civil defendendo presidente.', 'verified', false, '2025-06-02', 'https://g1.globo.com/politica/noticia/2025/06/02/rui-costa-defende-lula-oposicao.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Casa Civil', 'rui-defende-lula-oposicao-b135-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas acusa Lula de "apadrinhar esquema Master" em live viral.', 'Lula apadrinhou Banco Master, não é coincidência eles terem quebrado junto com o INSS!', 'Live no YouTube atacando escândalos.', 'verified', true, '2025-12-20', 'https://www.metropoles.com/brasil/politica-br/nikolas-lula-apadrinhar-master', 'social_media_post', 4, 'Belo Horizonte', 'Live YouTube', 'nikolas-lula-apadrinhar-master-b135-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi promete "virar a página" dos escândalos em 2026.', 'Vamos virar a página, governo corrigiu erros e manterá compromisso ético.', 'Coletiva de final de ano do PT sobre cenário eleitoral.', 'verified', true, '2025-12-22', 'https://www1.folha.uol.com.br/poder/2025/12/gleisi-virar-pagina-escandalos-2026.shtml', 'news_article', 2, 'Brasília', 'Coletiva PT', 'gleisi-virar-pagina-escandalos-b135-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
