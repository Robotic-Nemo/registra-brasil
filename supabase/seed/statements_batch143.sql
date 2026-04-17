-- Batch 143: Petrobras + energia 2023-2026 (parte 2)
DO $$
DECLARE
  v_pra UUID; v_mag UUID; v_sil UUID; v_mar UUID; v_lul UUID;
  v_had UUID; v_mer UUID; v_teb UUID; v_fav UUID; v_rui UUID;
  v_pad UUID; v_muc UUID; v_mvi UUID; v_jai UUID; v_gue UUID;
  v_sal UUID; v_tcr UUID; v_edu UUID; v_mou UUID; v_mvh UUID;
  v_ave UUID; v_nik UUID; v_tar UUID; v_hel UUID; v_wil UUID;
  v_mme UUID; v_rie UUID; v_brd UUID; v_cam UUID; v_cle UUID;
  v_lir UUID; v_hmo UUID; v_ele UUID; v_sme UUID; v_pte UUID;
  v_wde UUID; v_wgo UUID; v_lew UUID; v_nis UUID; v_cas UUID;
  v_cai UUID; v_zem UUID; v_rat UUID; v_pab UUID; v_jaw UUID;
  v_hum UUID; v_ran UUID; v_ors UUID; v_jan UUID; v_cha UUID;
  v_sam UUID; v_tal UUID; v_fme UUID; v_eri UUID;
  c_irr UUID; c_des UUID; c_neg UUID; c_con UUID; c_abu UUID;
  c_odi UUID; c_ame UUID; c_aut UUID; c_cor UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_pra FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magda-chambriard';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_gue FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_tcr FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_ave FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_mme FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_rie FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_brd FROM politicians WHERE slug = 'carlos-brandao';
  SELECT id INTO v_cam FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_ele FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_sme FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_pte FROM politicians WHERE slug = 'paulo-teixeira';
  SELECT id INTO v_wde FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_wgo FROM politicians WHERE slug = 'waldez-goes';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jaw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_ors FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fme FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';

  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pra, 'Prates defende dividendos extraordinários antes de demissão por atrito com Lula.', 'A Petrobras é uma empresa de mercado e precisa respeitar acionistas minoritários.', 'Entrevista ao Valor Econômico em meio à crise com o Planalto sobre distribuição de lucros.', 'verified', true, '2024-05-10', 'https://valor.globo.com/empresas/noticia/2024/05/10/prates-defende-dividendos-petrobras.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista Valor', 'prates-dividendos-petrobras-b143-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Petrobras é sócia do povo e não do mercado financeiro.', 'A Petrobras não é sócia do mercado financeiro, é sócia do povo brasileiro.', 'Declaração em cerimônia no Planalto dias antes de anunciar a demissão de Prates.', 'verified', true, '2024-05-13', 'https://www.poder360.com.br/governo/lula-petrobras-socia-do-povo/', 'news_article', 3, 'Palácio do Planalto', 'Cerimônia', 'lula-petrobras-povo-b143-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard assume Petrobras prometendo alinhamento com governo.', 'A empresa vai cumprir o papel de desenvolver o Brasil, não apenas remunerar acionista.', 'Posse como nova presidente da Petrobras após saída de Prates.', 'verified', true, '2024-05-24', 'https://petronoticias.com.br/magda-chambriard-assume-petrobras/', 'news_article', 2, 'Rio de Janeiro', 'Posse', 'magda-assume-petrobras-b143-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira critica licenciamento ambiental que atrasa exploração na Foz do Amazonas.', 'Não podemos depender da canetada do Ibama para garantir a soberania energética.', 'Entrevista em Brasília defendendo flexibilização da análise ambiental do bloco 59.', 'verified', true, '2024-06-18', 'https://www.correiobraziliense.com.br/politica/2024/06/silveira-foz-amazonas-ibama.html', 'news_article', 4, 'Brasília', 'Entrevista', 'silveira-foz-amazonas-ibama-b143-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva rebate pressão pela exploração da Margem Equatorial na COP29.', 'Licença ambiental não é ato político, é ato técnico. Não se negocia proteção da Amazônia.', 'Declaração na COP29 em Baku após questionamentos sobre bloco 59 da Petrobras.', 'verified', true, '2024-11-12', 'https://g1.globo.com/natureza/cop-29/noticia/2024/11/12/marina-silva-cop29-foz-amazonas.ghtml', 'news_article', 2, 'Baku, Azerbaijão', 'COP29', 'marina-cop29-licenca-b143-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca política energética de Lula em ato em Copacabana.', 'Estão destruindo a Petrobras. No meu governo a gasolina baixou e agora sobe toda semana.', 'Discurso em ato bolsonarista em Copacabana com críticas à gestão Prates.', 'verified', true, '2024-02-25', 'https://oglobo.globo.com/politica/noticia/2024/02/25/bolsonaro-ataca-petrobras-lula-copacabana.ghtml', 'news_article', 3, 'Copacabana, RJ', 'Ato bolsonarista', 'bolsonaro-petrobras-copacabana-b143-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende fim da paridade internacional nos preços dos combustíveis.', 'O PPI foi uma aberração que quebrou caminhoneiros e taxistas. Isso não volta.', 'Coletiva no Ministério da Fazenda sobre política de preços da Petrobras.', 'verified', false, '2023-05-18', 'https://valor.globo.com/politica/noticia/2023/05/18/haddad-ppi-petrobras.ghtml', 'news_article', 2, 'Brasília', 'Coletiva', 'haddad-ppi-petrobras-b143-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Paulo Guedes nega responsabilidade por aumento de combustíveis antes da eleição.', 'O problema é internacional. Ninguém controla o petróleo lá fora.', 'Entrevista à CNN Brasil em meio a crise de preços da gasolina pré-eleição.', 'verified', false, '2023-03-12', 'https://www.cnnbrasil.com.br/economia/guedes-combustiveis-internacional/', 'news_article', 3, 'São Paulo', 'Entrevista', 'guedes-combustiveis-internacional-b143-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica preço de combustíveis e ataca governo Lula em SP.', 'O governo federal perdeu o controle da inflação e da Petrobras.', 'Discurso em evento empresarial na FIESP em São Paulo.', 'verified', false, '2024-07-30', 'https://www1.folha.uol.com.br/mercado/2024/07/tarcisio-combustiveis-lula.shtml', 'news_article', 2, 'São Paulo', 'Evento FIESP', 'tarcisio-combustiveis-sp-b143-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho pressiona por exploração na Foz do Amazonas.', 'Não podemos renunciar a trilhões em royalties que podem transformar o Pará.', 'Entrevista no Pará defendendo aprovação do licenciamento ambiental do bloco 59.', 'verified', true, '2024-08-05', 'https://g1.globo.com/pa/para/noticia/2024/08/05/helder-foz-amazonas-petrobras.ghtml', 'news_article', 4, 'Belém', 'Entrevista', 'helder-foz-amazonas-royalties-b143-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima critica demora do Ibama em blocos no Amazonas.', 'O Ibama trava o desenvolvimento e gera pobreza no norte do país.', 'Discurso na Assembleia Legislativa do Amazonas sobre exploração de petróleo.', 'verified', false, '2024-09-12', 'https://d24am.com/politica/wilson-lima-ibama-petroleo/', 'news_article', 3, 'Manaus', 'Aleam', 'wilson-lima-ibama-petroleo-b143-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva defende transição energética durante crise hídrica.', 'O Brasil não pode continuar apostando só no fóssil enquanto secamos nossos rios.', 'Fala na abertura do Diálogos Amazônicos em Belém antes da COP30.', 'verified', true, '2025-08-06', 'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-dialogos-amazonicos', 'other', 2, 'Belém', 'Diálogos Amazônicos', 'marina-transicao-energetica-b143-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles nega mudanças climáticas durante debate sobre petróleo na Amazônia.', 'Esse discurso climático é para enfraquecer o Brasil. Petróleo é riqueza.', 'Participação no podcast Inteligência Ltda falando da Foz do Amazonas.', 'verified', true, '2024-03-22', 'https://www.metropoles.com/brasil/salles-clima-petroleo-amazonia', 'news_article', 5, 'São Paulo', 'Podcast', 'salles-clima-petroleo-b143-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende privatização da Petrobras.', 'Enquanto for estatal, vai ser usada politicamente. Tem que vender logo.', 'Postagem em rede social após demissão de Prates por Lula.', 'verified', false, '2024-05-15', 'https://www.poder360.com.br/governo/eduardo-bolsonaro-privatizar-petrobras/', 'news_article', 3, 'Redes sociais', 'Postagem X', 'eduardo-privatizar-petrobras-b143-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende equilíbrio fiscal e critica pressão por dividendos extras.', 'A Petrobras precisa investir no futuro, não pode sangrar caixa.', 'Coletiva do Ministério do Planejamento sobre arcabouço fiscal.', 'verified', false, '2024-03-08', 'https://valor.globo.com/politica/noticia/2024/03/08/tebet-petrobras-dividendos.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MPO', 'tebet-petrobras-caixa-b143-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel ataca política energética de Lula em discurso na Câmara.', 'O PT já destruiu a Petrobras uma vez e está fazendo de novo.', 'Discurso em plenário contra indicações do governo para a estatal.', 'verified', false, '2024-06-04', 'https://www.camara.leg.br/noticias/marcel-petrobras-pt', 'other', 2, 'Câmara dos Deputados', 'Sessão plenária', 'marcel-petrobras-pt-b143-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha informação falsa sobre preço de gasolina.', 'A gasolina no governo Lula já custa mais que nos EUA. Fracasso total.', 'Postagem em rede social com comparação distorcida que ignora impostos e câmbio.', 'verified', true, '2024-08-02', 'https://www.metropoles.com/brasil/nikolas-gasolina-eua-fake', 'news_article', 3, 'Redes sociais', 'Postagem', 'nikolas-gasolina-eua-b143-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard anuncia retomada de obras da Refinaria Abreu e Lima.', 'A Petrobras vai voltar a investir em refino. Esse é o caminho.', 'Entrevista em Pernambuco anunciando retomada de obras interrompidas.', 'verified', false, '2024-07-15', 'https://petronoticias.com.br/magda-refinaria-abreu-e-lima/', 'news_article', 2, 'Recife', 'Visita técnica', 'magda-abreu-lima-b143-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina critica indicações do PT para Petrobras.', 'Estão transformando a Petrobras em cabide de emprego político novamente.', 'Discurso no Senado contra indicação de ex-parlamentares para conselho da estatal.', 'verified', false, '2024-04-17', 'https://www12.senado.leg.br/noticias/materias/2024/04/17/tereza-cristina-petrobras', 'other', 2, 'Senado Federal', 'Sessão', 'tereza-petrobras-cabide-b143-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira defende leilões de petróleo na Margem Equatorial.', 'Vamos leiloar novos blocos mesmo com a oposição ambientalista.', 'Anúncio em Brasília sobre novo ciclo de leilões da ANP.', 'verified', true, '2024-10-22', 'https://valor.globo.com/empresas/noticia/2024/10/22/silveira-leilao-petroleo-margem-equatorial.ghtml', 'news_article', 4, 'Brasília', 'Anúncio ANP', 'silveira-leilao-margem-equatorial-b143-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro cobra royalties do pré-sal e defende exploração.', 'O Rio depende dos royalties do petróleo. Sem isso não há saúde nem educação.', 'Entrevista ao Globo sobre discussão sobre distribuição dos royalties.', 'verified', false, '2024-02-14', 'https://oglobo.globo.com/rio/noticia/2024/02/14/castro-royalties-petroleo-rio.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'castro-royalties-rio-b143-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe defende exploração de petróleo no Amapá em contraponto a Marina.', 'O Amapá não pode ser proibido de se desenvolver enquanto outros estados exploram.', 'Discurso no Senado pressionando por autorização do Ibama ao bloco 59.', 'verified', true, '2024-06-25', 'https://www12.senado.leg.br/noticias/materias/2024/06/25/randolfe-amapa-petroleo', 'other', 3, 'Senado Federal', 'Sessão', 'randolfe-amapa-petroleo-b143-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clécio Luís pressiona governo federal por licença da Foz do Amazonas.', 'O povo do Amapá merece desenvolvimento. Essa licença precisa sair.', 'Entrevista em Macapá cobrando posicionamento do Ibama.', 'verified', false, '2024-07-03', 'https://g1.globo.com/ap/amapa/noticia/2024/07/03/clecio-foz-amazonas-licenca.ghtml', 'news_article', 3, 'Macapá', 'Entrevista', 'clecio-foz-amazonas-b143-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wgo, 'Waldez Góes defende exploração de petróleo no Amapá.', 'Não é justo negar ao Amapá o que outros estados têm há décadas.', 'Entrevista como ministro da Integração defendendo licenciamento do bloco 59.', 'verified', false, '2024-05-30', 'https://www.correiobraziliense.com.br/politica/2024/05/waldez-foz-amazonas.html', 'news_article', 3, 'Brasília', 'Entrevista', 'waldez-amapa-petroleo-b143-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim critica exploração na Foz do Amazonas.', 'Enquanto o Brasil se afoga em enchentes, querem furar a boca do Amazonas.', 'Discurso na Câmara criticando pressão do governo sobre o Ibama.', 'verified', true, '2024-07-08', 'https://www.camara.leg.br/noticias/samia-foz-amazonas-enchentes', 'other', 3, 'Câmara dos Deputados', 'Sessão', 'samia-foz-amazonas-b143-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia fossilismo do governo em plena crise climática.', 'Não dá para dizer que é transição energética e ampliar fronteira do petróleo.', 'Entrevista em evento sobre clima em São Paulo.', 'verified', false, '2024-11-04', 'https://www1.folha.uol.com.br/ambiente/2024/11/erika-hilton-fossilismo.shtml', 'news_article', 2, 'São Paulo', 'Evento clima', 'erika-fossilismo-b143-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende exploração da Foz do Amazonas mesmo contra Marina.', 'Se tiver petróleo, vamos tirar. O povo precisa de emprego e renda.', 'Entrevista a rádio no Pará gerando atrito público com ministra do Meio Ambiente.', 'verified', true, '2024-03-15', 'https://g1.globo.com/politica/noticia/2024/03/15/lula-foz-amazonas-petroleo.ghtml', 'news_article', 4, 'Belém', 'Entrevista radio', 'lula-foz-amazonas-petroleo-b143-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina rebate Lula em público sobre Foz do Amazonas.', 'Proteção ambiental não é cláusula negociável. O Ibama decide tecnicamente.', 'Resposta na mesma semana após declaração do presidente sobre bloco 59.', 'verified', true, '2024-03-20', 'https://valor.globo.com/politica/noticia/2024/03/20/marina-rebate-lula-foz-amazonas.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'marina-rebate-lula-b143-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pra, 'Prates critica publicamente ingerência do governo na Petrobras.', 'Gestão técnica vira casuística quando o curto prazo fala mais alto.', 'Entrevista à Petronotícias após sua demissão da presidência.', 'verified', false, '2024-06-10', 'https://petronoticias.com.br/prates-ingerencia-governo/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'prates-ingerencia-governo-b143-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira promete ajuda a RS com subsídio a energia em plena enchente.', 'O governo federal vai zerar conta de energia para quem perdeu tudo.', 'Anúncio em maio de 2024 no auge da enchente gaúcha.', 'verified', true, '2024-05-15', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/silveira-conta-luz-rs.html', 'news_article', 1, 'Porto Alegre', 'Anúncio RS', 'silveira-energia-rs-b143-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Eduardo Leite pede socorro em energia durante apagão no RS.', 'Não podemos deixar gaúchos sem luz depois de perderem tudo.', 'Coletiva em Porto Alegre cobrando resposta federal à crise energética pós-enchentes.', 'verified', true, '2024-05-10', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/leite-energia-apagao.html', 'news_article', 2, 'Porto Alegre', 'Coletiva', 'leite-energia-rs-b143-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema ataca política de preços da Petrobras e defende privatização.', 'A Petrobras tem que ser vendida. Enquanto for pública, servirá a governos.', 'Entrevista em Belo Horizonte no CNN Brasil.', 'verified', false, '2024-04-09', 'https://www.cnnbrasil.com.br/politica/zema-privatizar-petrobras/', 'news_article', 3, 'Belo Horizonte', 'Entrevista CNN', 'zema-privatizar-petrobras-b143-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado critica aumento da gasolina e ataca governo federal.', 'Goiás sofre com o preço enquanto o governo paga dividendos na mão grande.', 'Discurso em Goiânia durante evento do agronegócio.', 'verified', false, '2024-09-05', 'https://g1.globo.com/go/goias/noticia/2024/09/05/caiado-gasolina-governo.ghtml', 'news_article', 2, 'Goiânia', 'Evento agro', 'caiado-gasolina-go-b143-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr critica política energética e pede volta do PPI.', 'Sem regra clara, o brasileiro é vítima das decisões políticas do Planalto.', 'Entrevista em Curitiba em evento do agronegócio paranaense.', 'verified', false, '2024-06-20', 'https://www.gazetadopovo.com.br/politica/ratinho-ppi-petrobras/', 'news_article', 2, 'Curitiba', 'Evento PR', 'ratinho-ppi-b143-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal defende demissão em massa na Petrobras.', 'Tem que privatizar e mandar embora metade dos funcionários.', 'Declaração em live durante campanha à prefeitura de SP.', 'verified', true, '2024-08-24', 'https://www1.folha.uol.com.br/poder/2024/08/marcal-petrobras-demissao.shtml', 'news_article', 3, 'São Paulo', 'Live campanha', 'marcal-petrobras-demissao-b143-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva defende papel social da Petrobras em debate.', 'A Petrobras é patrimônio estratégico. Não pode ser tratada como sociedade privada.', 'Discurso em plenário defendendo nova política de preços.', 'verified', false, '2023-08-10', 'https://www.camara.leg.br/noticias/orlando-silva-petrobras', 'other', 1, 'Câmara dos Deputados', 'Sessão', 'orlando-petrobras-patrimonio-b143-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa apoia gestão Magda e critica Prates.', 'A Petrobras agora tem rumo nacional. O período anterior foi de submissão ao mercado.', 'Entrevista no Senado sobre nova presidência da estatal.', 'verified', false, '2024-06-01', 'https://www12.senado.leg.br/noticias/materias/2024/06/01/humberto-magda-petrobras', 'other', 1, 'Senado Federal', 'Entrevista', 'humberto-magda-petrobras-b143-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar critica pressão por petróleo na Amazônia.', 'Queremos desenvolvimento? Sim, mas não à custa da sobrevivência da Amazônia.', 'Discurso na Câmara antes da COP30.', 'verified', false, '2025-03-12', 'https://www.camara.leg.br/noticias/chico-alencar-amazonia-petroleo', 'other', 2, 'Câmara dos Deputados', 'Sessão', 'chico-alencar-amazonia-b143-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende política de preços nacional e critica PPI.', 'Não podemos entregar o povo brasileiro à ciranda do mercado internacional.', 'Discurso no 7º Congresso do PCdoB sobre soberania energética.', 'verified', false, '2023-06-24', 'https://www.camara.leg.br/noticias/jandira-petrobras-soberania', 'other', 1, 'Brasília', 'Congresso PCdoB', 'jandira-petrobras-soberania-b143-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro volta a mentir sobre combustíveis em live com Milei.', 'No meu governo o combustível era o mais barato do mundo.', 'Declaração em live com Javier Milei contendo afirmação comprovadamente falsa.', 'verified', true, '2024-12-07', 'https://www.uol.com.br/noticias/bolsonaro-milei-combustivel-barato', 'news_article', 4, 'Redes sociais', 'Live Milei', 'bolsonaro-milei-combustivel-b143-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica política ambiental que trava exploração na Foz.', 'Enquanto pedimos licença, os franceses exploram o mesmo oceano.', 'Discurso no Senado defendendo aprovação do bloco 59.', 'verified', false, '2024-04-23', 'https://www12.senado.leg.br/noticias/materias/2024/04/23/mourao-foz-amazonas', 'other', 3, 'Senado Federal', 'Sessão', 'mourao-foz-amazonas-b143-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ave, 'Adriana Ventura critica governo por ingerência na Petrobras.', 'O Lula trata a Petrobras como se fosse caixa do PT.', 'Discurso em plenário da Câmara em fevereiro de 2024.', 'verified', false, '2024-02-28', 'https://www.camara.leg.br/noticias/adriana-ventura-petrobras', 'other', 2, 'Câmara dos Deputados', 'Sessão', 'adriana-petrobras-caixa-b143-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Favaro defende diesel mais barato e pressiona Petrobras.', 'O agricultor não aguenta mais o preço do diesel.', 'Entrevista à Valor Investe sobre política agrícola e energética.', 'verified', false, '2024-05-28', 'https://valorinveste.globo.com/mercados/agronegocio/favaro-diesel.html', 'news_article', 2, 'Brasília', 'Entrevista', 'favaro-diesel-petrobras-b143-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra ampliação do refino para reduzir dependência de importados.', 'Não faz sentido sermos grandes produtores e importarmos derivados.', 'Fala no aniversário da Petrobras em outubro de 2023.', 'verified', false, '2023-10-03', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-petrobras-refino', 'other', 2, 'Rio de Janeiro', 'Aniversário Petrobras', 'lula-refino-petrobras-b143-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende papel da Petrobras em obras do PAC.', 'A Petrobras é indutora do desenvolvimento nacional.', 'Anúncio de investimentos em infraestrutura com recursos da estatal.', 'verified', false, '2023-08-11', 'https://www.gov.br/casacivil/pt-br/assuntos/noticias/2023/rui-costa-pac-petrobras', 'other', 1, 'Brasília', 'Lançamento PAC', 'rui-costa-pac-petrobras-b143-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Mercadante defende uso de BNDES em projetos de transição energética.', 'O BNDES vai bancar a reindustrialização verde do Brasil.', 'Entrevista sobre planos do banco para transição energética.', 'verified', false, '2023-07-05', 'https://valor.globo.com/financas/noticia/2023/07/05/mercadante-bndes-transicao.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Entrevista', 'mercadante-bndes-transicao-b143-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes critica preço do diesel e ataca política do governo.', 'O agro de MT sofre. O Planalto brinca com a Petrobras.', 'Entrevista em Cuiabá durante evento do setor.', 'verified', false, '2024-08-16', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/08/16/mauro-mendes-diesel.ghtml', 'news_article', 2, 'Cuiabá', 'Evento agro', 'mauro-mendes-diesel-b143-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rie, 'Eduardo Riedel pede diesel mais barato para agro do MS.', 'Não podemos pagar mais caro que um fazendeiro argentino.', 'Entrevista em Campo Grande durante feira agro do MS.', 'verified', false, '2024-05-03', 'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2024/05/03/riedel-diesel.ghtml', 'news_article', 2, 'Campo Grande', 'Feira agro MS', 'riedel-diesel-argentina-b143-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_brd, 'Carlos Brandão defende obras de transmissão de energia para MA.', 'Precisamos de mais linhas para garantir energia ao Nordeste.', 'Entrevista em São Luís sobre obras de transmissão.', 'verified', false, '2024-09-18', 'https://g1.globo.com/ma/maranhao/noticia/2024/09/18/brandao-transmissao.ghtml', 'news_article', 1, 'São Luís', 'Entrevista', 'brandao-transmissao-ma-b143-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Gladson Cameli defende exploração de gás e petróleo no Acre.', 'O Acre tem gás. Precisa ser explorado com responsabilidade.', 'Entrevista em Rio Branco sobre descobertas no Juruá.', 'verified', false, '2024-03-11', 'https://g1.globo.com/ac/acre/noticia/2024/03/11/cameli-gas-acre.ghtml', 'news_article', 2, 'Rio Branco', 'Entrevista', 'cameli-gas-acre-b143-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira pressiona Petrobras a baixar gasolina antes da eleição municipal.', 'A gasolina precisa cair antes de outubro. É o que o povo cobra.', 'Declaração em Maceió em reunião com prefeitos aliados.', 'verified', false, '2024-07-22', 'https://www.poder360.com.br/congresso/lira-petrobras-eleicao/', 'news_article', 3, 'Maceió', 'Reunião prefeitos', 'lira-petrobras-eleicao-b143-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta diz que Congresso vai vetar venda de refinarias.', 'A base aliada não vai permitir desmonte da Petrobras no Legislativo.', 'Entrevista como presidente da Câmara em 2025.', 'verified', false, '2025-03-05', 'https://www.camara.leg.br/noticias/hugo-motta-refinarias', 'other', 1, 'Câmara dos Deputados', 'Entrevista', 'hugo-motta-refinarias-b143-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sme, 'Sebastião Melo cobra conta de luz subsidiada para comerciantes de POA.', 'Quem perdeu tudo na enchente não pode pagar energia cheia.', 'Coletiva em Porto Alegre após enchentes de maio de 2024.', 'verified', false, '2024-05-20', 'https://www.correiodopovo.com.br/noticias/politica/melo-energia-porto-alegre.html', 'news_article', 2, 'Porto Alegre', 'Coletiva', 'melo-energia-poa-b143-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pte, 'Paulo Teixeira cobra investimento da Petrobras em biocombustíveis.', 'A Petrobras precisa ser protagonista da transição do agro brasileiro.', 'Entrevista em Brasília sobre política agrícola.', 'verified', false, '2024-04-10', 'https://www.gov.br/mda/pt-br/noticias/2024/paulo-teixeira-biocombustiveis', 'other', 1, 'Brasília', 'Entrevista', 'paulo-teixeira-biocombustiveis-b143-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wde, 'Wellington Dias defende gás natural para cozinhas populares.', 'Precisamos reduzir o preço do botijão para as famílias pobres.', 'Entrevista sobre programa Auxílio Gás.', 'verified', false, '2023-04-27', 'https://www.gov.br/mds/pt-br/noticias/2023/wellington-dias-auxilio-gas', 'other', 1, 'Brasília', 'Programa Auxílio Gás', 'wellington-auxilio-gas-b143-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'José Múcio defende Petrobras como estatal estratégica em reunião do CDN.', 'A Petrobras é tema de segurança nacional. Não é mero ativo.', 'Declaração no Conselho de Defesa Nacional sobre Margem Equatorial.', 'verified', false, '2024-06-06', 'https://www.gov.br/defesa/pt-br/assuntos/noticias/2024/mucio-petrobras-cdn', 'other', 1, 'Brasília', 'CDN', 'mucio-petrobras-cdn-b143-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira defende posição brasileira sobre petróleo na ONU.', 'Não pode haver dois pesos na transição energética. Países ricos também poluem.', 'Discurso na Assembleia Geral da ONU em 2024.', 'verified', false, '2024-09-24', 'https://www.gov.br/mre/pt-br/canais_atendimento/imprensa/mauro-vieira-onu-2024', 'other', 2, 'Nova York', 'AGNU 2024', 'mauro-vieira-onu-petroleo-b143-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha defende papel da Petrobras em gás para indústria.', 'Gás barato para indústria é missão do Estado brasileiro.', 'Entrevista como ministro das Relações Institucionais.', 'verified', false, '2024-02-07', 'https://valor.globo.com/politica/noticia/2024/02/07/padilha-gas-industria.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'padilha-gas-industria-b143-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende segurança pública integrada em ativos da Petrobras.', 'Refinarias e plataformas são estruturas estratégicas.', 'Entrevista como ministro da Justiça sobre furtos em dutos.', 'verified', false, '2024-03-26', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2024/lewandowski-dutos-petrobras', 'other', 1, 'Brasília', 'Entrevista', 'lewandowski-dutos-b143-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade critica poluição do ar por termelétricas.', 'A saúde pública paga a conta das emissões das termelétricas.', 'Coletiva como ministra da Saúde sobre poluição em regiões industriais.', 'verified', false, '2024-06-14', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/nisia-termeletricas', 'other', 1, 'Brasília', 'Coletiva', 'nisia-termeletricas-b143-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner defende manutenção de preços sociais na Petrobras.', 'A Petrobras não pode ser tratada só como ativo financeiro.', 'Discurso no Senado em defesa da política de preços nacional.', 'verified', false, '2024-03-19', 'https://www12.senado.leg.br/noticias/materias/2024/03/19/jaques-wagner-petrobras', 'other', 1, 'Senado Federal', 'Sessão', 'jaques-wagner-precos-b143-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna defende plano urgente de transição.', 'Investir em petróleo fóssil em 2024 é suicídio planetário.', 'Discurso em plenário da Câmara defendendo moratória do bloco 59.', 'verified', false, '2024-07-16', 'https://www.camara.leg.br/noticias/melchionna-petroleo-transicao', 'other', 2, 'Câmara dos Deputados', 'Sessão', 'melchionna-transicao-b143-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone cobra políticas para trabalhadores do petróleo no RJ.', 'Os trabalhadores de Campos não podem pagar o preço da transição sozinhos.', 'Discurso em Niterói sobre reconversão produtiva.', 'verified', false, '2024-10-10', 'https://www.brasildefato.com.br/2024/10/10/taliria-petroleo-rj', 'news_article', 1, 'Niterói', 'Ato sindical', 'taliria-petroleo-rj-b143-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira diz que não há plano B se Ibama vetar Foz do Amazonas.', 'Vamos insistir até conseguir a licença. Não há alternativa.', 'Entrevista à Petronotícias reforçando pressão sobre o Ibama.', 'verified', true, '2024-10-30', 'https://petronoticias.com.br/silveira-foz-amazonas-plano-b/', 'news_article', 4, 'Brasília', 'Entrevista', 'silveira-plano-b-foz-b143-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda defende Foz do Amazonas em evento no Rio.', 'A Petrobras tem capacidade técnica e ambiental para a Margem Equatorial.', 'Fala na Rio Oil and Gas defendendo licenciamento.', 'verified', true, '2024-09-24', 'https://petronoticias.com.br/magda-rio-oil-gas/', 'news_article', 3, 'Rio de Janeiro', 'Rio Oil and Gas', 'magda-rio-oil-gas-b143-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pra, 'Prates admite erro de comunicação em crise dos dividendos.', 'Errei na comunicação, mas estava defendendo a empresa.', 'Entrevista pós-demissão à Folha de S.Paulo.', 'verified', false, '2024-07-18', 'https://www1.folha.uol.com.br/mercado/2024/07/prates-erro-comunicacao.shtml', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'prates-erro-comunicacao-b143-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede intervenção estrangeira em política energética.', 'Investidores estrangeiros precisam pressionar o Brasil.', 'Postagem em inglês no X em setembro de 2024.', 'verified', true, '2024-09-11', 'https://www.metropoles.com/brasil/eduardo-bolsonaro-investidor-estrangeiro', 'news_article', 4, 'Redes sociais', 'Postagem X', 'eduardo-investidor-estrangeiro-b143-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro espalha boato sobre privatização da Petrobras pelo PT.', 'O PT quer vender a Petrobras para chineses. Estão vendo o que vai acontecer?', 'Live em agosto de 2024 com mentira explícita sobre vendas.', 'verified', true, '2024-08-09', 'https://www.poder360.com.br/politica/bolsonaro-chineses-petrobras/', 'news_article', 4, 'Redes sociais', 'Live', 'bolsonaro-chineses-petrobras-b143-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca sindicato dos petroleiros.', 'Sindicato petista só pensa em greve e dinheiro público.', 'Postagem em rede social sobre greve na Refinaria Landulpho Alves.', 'verified', false, '2023-06-01', 'https://www.metropoles.com/brasil/nikolas-petroleiros-sindicato', 'news_article', 3, 'Redes sociais', 'Postagem', 'nikolas-petroleiros-b143-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira anuncia plano para instalar GNL no Norte sem detalhar custos.', 'Vamos levar gás natural ao Amazonas custe o que custar.', 'Anúncio em Manaus sem apresentar estudo de viabilidade.', 'verified', false, '2024-09-19', 'https://d24am.com/politica/silveira-gnl-amazonas/', 'news_article', 3, 'Manaus', 'Anúncio', 'silveira-gnl-amazonas-b143-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina defende taxa sobre petróleo para financiar Fundo Clima.', 'Quem polui mais tem que pagar mais. É princípio básico.', 'Entrevista sobre reforma tributária verde.', 'verified', false, '2024-12-05', 'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-tributaria-verde', 'other', 2, 'Brasília', 'Entrevista', 'marina-tributaria-verde-b143-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio articula com Lira pressão sobre Petrobras.', 'Precisamos cobrar a Petrobras ou os estados vão falir.', 'Reunião com Lira no Congresso sobre ICMS e combustíveis.', 'verified', false, '2024-02-20', 'https://valor.globo.com/politica/noticia/2024/02/20/tarcisio-lira-petrobras.ghtml', 'news_article', 2, 'Brasília', 'Reunião', 'tarcisio-lira-petrobras-b143-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema volta a atacar Petrobras por preços.', 'Enquanto não privatizar, teremos combustível caro.', 'Declaração a jornalistas em BH em novembro de 2024.', 'verified', false, '2024-11-14', 'https://g1.globo.com/mg/minas-gerais/noticia/2024/11/14/zema-petrobras-preco.ghtml', 'news_article', 2, 'Belo Horizonte', 'Coletiva', 'zema-petrobras-preco-b143-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula assina decreto para retomar construção de navios em estaleiros brasileiros.', 'Vamos voltar a produzir navios e sondas no Brasil.', 'Cerimônia em Angra dos Reis relançando programa da indústria naval.', 'verified', false, '2023-09-15', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-industria-naval', 'other', 1, 'Angra dos Reis', 'Cerimônia', 'lula-industria-naval-b143-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira anuncia programa de biogás com pouca definição técnica.', 'Vamos transformar lixo em energia em todo o país.', 'Coletiva em Brasília sobre programa de biometano.', 'verified', false, '2024-08-06', 'https://www.gov.br/mme/pt-br/assuntos/noticias/2024/silveira-biogas', 'other', 1, 'Brasília', 'Coletiva', 'silveira-biogas-b143-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda assume pressa em anunciar dividendos menores que Prates.', 'Vamos priorizar investimento de longo prazo.', 'Entrevista à Valor Investe sobre mudança de estratégia.', 'verified', false, '2024-08-12', 'https://valorinveste.globo.com/mercados/magda-dividendos.html', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'magda-dividendos-investe-b143-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro minimiza aquecimento global em fala sobre petróleo.', 'Aquecimento global é fake. O povo precisa de petróleo.', 'Live em março de 2024 com negacionismo explícito.', 'verified', true, '2024-03-30', 'https://www.metropoles.com/brasil/bolsonaro-aquecimento-fake', 'news_article', 5, 'Redes sociais', 'Live', 'bolsonaro-aquecimento-fake-b143-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão nega gravidade do aquecimento em debate.', 'O Brasil emite pouco. Não temos que frear nossa economia.', 'Debate na TV Brasil com representantes ambientais.', 'verified', false, '2024-04-16', 'https://www.poder360.com.br/politica/mourao-emissoes-brasil/', 'news_article', 3, 'Brasília', 'Debate TV', 'mourao-emissoes-b143-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles promete revogar tudo que Marina fez na COP29.', 'Quando voltarmos, vamos desfazer toda essa agenda climática da Marina.', 'Live após resultados da COP29 em novembro de 2024.', 'verified', true, '2024-11-25', 'https://www.metropoles.com/brasil/salles-revogar-marina-cop29', 'news_article', 4, 'Redes sociais', 'Live', 'salles-revogar-cop29-b143-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ridiculariza carro elétrico em postagem viral.', 'Carro elétrico é moda de rico. Povão quer gasolina barata.', 'Postagem com deboche após lançamento de programa de eletromobilidade.', 'verified', true, '2024-11-02', 'https://www.metropoles.com/brasil/nikolas-carro-eletrico', 'news_article', 3, 'Redes sociais', 'Postagem', 'nikolas-carro-eletrico-b143-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro defende obra de GNL em São João da Barra sem mitigação.', 'Não podemos parar o gás por causa de cata-vento.', 'Fala em evento em Macaé sobre terminal de GNL no RJ.', 'verified', false, '2024-06-29', 'https://oglobo.globo.com/rio/noticia/2024/06/29/castro-gnl-macae.ghtml', 'news_article', 3, 'Macaé', 'Evento GNL', 'castro-gnl-macae-b143-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira promete que bloco 59 sai em 2026.', 'Em 2026 vamos perfurar a Foz do Amazonas, com ou sem Ibama.', 'Entrevista desafiadora ao Correio Braziliense em março de 2026.', 'verified', true, '2026-03-05', 'https://www.correiobraziliense.com.br/politica/2026/03/silveira-bloco-59-2026.html', 'news_article', 5, 'Brasília', 'Entrevista', 'silveira-bloco-59-2026-b143-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina alerta sobre blackout climático após enchentes.', 'A conta do negacionismo chega rápido e custa vidas.', 'Discurso na ONU após enchentes do RS em 2024.', 'verified', true, '2024-09-22', 'https://g1.globo.com/natureza/noticia/2024/09/22/marina-blackout-climatico.ghtml', 'news_article', 3, 'Nova York', 'ONU', 'marina-blackout-climatico-b143-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pra, 'Prates se declara candidato a presidência da Petrobras novamente.', 'Se chamarem, volto para colocar a empresa no rumo técnico.', 'Entrevista em 2026 durante rumores de troca na estatal.', 'verified', false, '2026-02-18', 'https://petronoticias.com.br/prates-volta-petrobras-2026/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'prates-volta-2026-b143-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reclama de preço de combustível em evento.', 'A Petrobras tem que olhar pelo povo, não por bolso de acionista.', 'Discurso em Caxias do Sul em abril de 2026.', 'verified', true, '2026-04-02', 'https://gauchazh.clicrbs.com.br/politica/noticia/2026/04/lula-caxias-petrobras.html', 'news_article', 3, 'Caxias do Sul', 'Evento', 'lula-caxias-petrobras-b143-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende arrecadação com IBS sobre combustíveis.', 'A regulamentação do IBS vai ajudar a baratear combustíveis.', 'Entrevista em Brasília após aprovação da reforma tributária.', 'verified', false, '2025-05-12', 'https://valor.globo.com/politica/noticia/2025/05/12/haddad-ibs-combustiveis.ghtml', 'news_article', 2, 'Brasília', 'Entrevista', 'haddad-ibs-combustiveis-b143-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda critica reação política após veto do Ibama ao bloco 59.', 'O Ibama tem sua autonomia. A Petrobras vai trabalhar em novos estudos.', 'Comunicado à imprensa após decisão do Ibama em 2025.', 'verified', true, '2025-06-18', 'https://petronoticias.com.br/magda-ibama-bloco-59-veto/', 'news_article', 3, 'Rio de Janeiro', 'Comunicado', 'magda-ibama-veto-b143-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira ataca Ibama após veto e ameaça rever estrutura do órgão.', 'Vamos revisar todo o funcionamento do Ibama. Isso não pode continuar.', 'Coletiva furiosa em Brasília após veto do bloco 59.', 'verified', true, '2025-06-20', 'https://valor.globo.com/politica/noticia/2025/06/20/silveira-ataca-ibama.ghtml', 'news_article', 5, 'Brasília', 'Coletiva', 'silveira-ataca-ibama-b143-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina defende Ibama após veto ao bloco 59.', 'O Ibama cumpriu a lei. Punir o órgão por isso seria autoritarismo.', 'Coletiva em Brasília em resposta a ataques de Silveira.', 'verified', true, '2025-06-22', 'https://g1.globo.com/natureza/noticia/2025/06/22/marina-defende-ibama.ghtml', 'news_article', 4, 'Brasília', 'Coletiva', 'marina-defende-ibama-b143-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho pressiona Lula por superação do veto do Ibama.', 'O presidente precisa resolver politicamente essa questão.', 'Entrevista em Belém durante COP30.', 'verified', true, '2025-11-14', 'https://g1.globo.com/pa/para/cop-30/noticia/2025/11/14/helder-ibama-lula.ghtml', 'news_article', 4, 'Belém', 'COP30', 'helder-ibama-cop30-b143-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete solução política para licença do bloco 59 durante COP30.', 'Vamos resolver. O Ibama tem sua autonomia, mas o Estado é um só.', 'Entrevista ambígua em Belém durante COP30.', 'verified', true, '2025-11-16', 'https://www1.folha.uol.com.br/ambiente/2025/11/lula-bloco-59-cop30.shtml', 'news_article', 4, 'Belém', 'COP30', 'lula-bloco-59-cop30-b143-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia pressão sobre Ibama na COP30.', 'O Brasil presidente da COP30 não pode chantagear o próprio Ibama.', 'Intervenção em painel paralelo da COP30 em Belém.', 'verified', true, '2025-11-17', 'https://www.brasildefato.com.br/2025/11/17/erika-ibama-cop30', 'news_article', 3, 'Belém', 'COP30', 'erika-ibama-cop30-b143-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles ironiza COP30 e Lula.', 'COP de Belém é festa para ONG europeia. Brasileiro continua com gasolina cara.', 'Postagem em redes sociais durante COP30.', 'verified', true, '2025-11-12', 'https://www.metropoles.com/brasil/salles-cop30-ironia', 'news_article', 4, 'Redes sociais', 'Postagem', 'salles-cop30-ironia-b143-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio pede fim do monopólio da Petrobras em refino.', 'É hora de abrir o refino para o mercado livre.', 'Discurso em evento da Fiesp em novembro de 2025.', 'verified', false, '2025-11-20', 'https://valor.globo.com/empresas/noticia/2025/11/20/tarcisio-refino-mercado.ghtml', 'news_article', 3, 'São Paulo', 'FIESP', 'tarcisio-refino-mercado-b143-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel defende projeto para liberar exploração sem licença ambiental.', 'Temos projeto pronto para destravar a Petrobras.', 'Entrevista ao Poder360 sobre pauta energética da oposição.', 'verified', true, '2025-07-09', 'https://www.poder360.com.br/congresso/marcel-projeto-ibama/', 'news_article', 4, 'Brasília', 'Entrevista', 'marcel-projeto-ibama-b143-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe critica Ibama em 2026.', 'O órgão está travando o Amapá por pressão de ONGs estrangeiras.', 'Discurso no Senado em abril de 2026.', 'verified', false, '2026-04-08', 'https://www12.senado.leg.br/noticias/materias/2026/04/08/randolfe-ibama-ongs', 'other', 4, 'Senado Federal', 'Sessão', 'randolfe-ibama-ongs-b143-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia terminal de GNL em Suape sem etapa pública ampla.', 'Vamos colocar o gás barato no Nordeste.', 'Anúncio em Recife em fevereiro de 2026 sem consulta ampla.', 'verified', false, '2026-02-09', 'https://www.correiobraziliense.com.br/politica/2026/02/lula-gnl-suape.html', 'news_article', 2, 'Recife', 'Anúncio', 'lula-gnl-suape-b143-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina se despede do MMA reafirmando Ibama técnico.', 'Deixo o ministério com a certeza de que o Ibama precisa seguir sendo técnico.', 'Pronunciamento em cerimônia em Brasília em março de 2026.', 'verified', true, '2026-03-18', 'https://g1.globo.com/politica/noticia/2026/03/18/marina-despedida-mma.ghtml', 'news_article', 3, 'Brasília', 'Cerimônia', 'marina-despedida-mma-b143-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira comemora saída de Marina e promete destravar licenças.', 'Agora vamos destravar tudo que estava parado.', 'Entrevista à Petronotícias em março de 2026 após saída da ministra.', 'verified', true, '2026-03-20', 'https://petronoticias.com.br/silveira-saida-marina/', 'news_article', 5, 'Brasília', 'Entrevista', 'silveira-saida-marina-b143-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda anuncia início da perfuração no bloco 59 em abril de 2026.', 'A Petrobras vai começar a perfurar a Margem Equatorial.', 'Coletiva no Rio em abril de 2026 anunciando início das operações.', 'verified', true, '2026-04-15', 'https://petronoticias.com.br/magda-perfuracao-bloco-59/', 'news_article', 4, 'Rio de Janeiro', 'Coletiva', 'magda-perfuracao-bloco-59-b143-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
