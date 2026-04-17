-- Batch 142: Petrobras + energy policy + Foz do Amazonas oil exploration 2023-2026 (Part 1)
DO $$
DECLARE
  v_lul UUID; v_had UUID; v_jea UUID; v_mag UUID; v_alv UUID; v_mar UUID; v_mer UUID;
  v_fav UUID; v_rui UUID; v_jaw UUID; v_hel UUID; v_wil UUID; v_mau UUID; v_rie UUID;
  v_bra UUID; v_gla UUID; v_cle UUID; v_teb UUID; v_din UUID; v_lew UUID; v_jom UUID;
  v_gle UUID; v_ran UUID; v_lin UUID; v_hum UUID; v_jai UUID; v_edu UUID; v_fla UUID;
  v_nik UUID; v_bia UUID; v_mor UUID; v_mvh UUID; v_pau UUID; v_ric UUID; v_ter UUID;
  v_tar UUID; v_fil UUID; v_kim UUID; v_adr UUID; v_art UUID; v_hug UUID; v_mou UUID;
  v_dam UUID; v_mfe UUID; v_mic UUID; v_car UUID; v_juz UUID; v_gir UUID;
  c_cor UUID; c_conf UUID; c_neg UUID; c_irr UUID; c_des UUID; c_abu UUID; c_ant UUID;
  c_int UUID; c_aut UUID; c_ame UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_jea FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magda-chambriard';
  SELECT id INTO v_alv FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_jaw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_rie FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_bra FROM politicians WHERE slug = 'carlos-brandao';
  SELECT id INTO v_gla FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_jom FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_pau FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_ric FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_fil FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_art FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_hug FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_juz FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_conf FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jea, 'Jean Paul Prates defende exploração na Foz do Amazonas já na posse.', 'A Margem Equatorial é prioridade estratégica para a Petrobras.', 'Discurso de posse como presidente da Petrobras no Rio de Janeiro.', 'verified', true, '2023-01-27', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-01/prates-toma-posse-petrobras', 'other', 3, 'Petrobras', 'Posse da presidência', 'prates-posse-margem-equatorial-b142-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva expressa preocupação com perfuração na Foz do Amazonas.', 'Não se explora petróleo em bioma sensível sem estudos rigorosos.', 'Entrevista após reunião no MMA sobre o licenciamento do bloco 59.', 'verified', true, '2023-02-20', 'https://www.gov.br/mma/pt-br/assuntos/noticias/2023/02/marina-foz-amazonas-preocupacao', 'other', 2, 'Ministério do Meio Ambiente', 'Coletiva', 'marina-preocupacao-foz-b142-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho cobra liberação imediata da exploração na Margem Equatorial.', 'O Pará não pode ficar fora desta janela de oportunidade.', 'Entrevista à TV Liberal em Belém defendendo royalties.', 'verified', true, '2023-03-15', 'https://globoplay.globo.com/v/helder-barbalho-margem-equatorial-marco2023', 'news_article', 3, 'TV Liberal', 'Entrevista', 'helder-liberacao-margem-b142-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clécio Luís declara que Amapá precisa do petróleo para desenvolvimento.', 'Sem a Foz do Amazonas, o Amapá não se desenvolve.', 'Entrevista à CNN Brasil defendendo a exploração.', 'verified', true, '2023-04-05', 'https://www.cnnbrasil.com.br/politica/clecio-amapa-petroleo-abril2023/', 'news_article', 3, 'CNN Brasil', 'Entrevista', 'clecio-amapa-petroleo-b142-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que exploração de petróleo pode conviver com transição energética.', 'Sonho dos ricos é que a África não explore nada. Vamos explorar o que for possível.', 'Entrevista à GloboNews após reunião com ministros sobre Foz do Amazonas.', 'verified', true, '2023-05-10', 'https://g1.globo.com/politica/noticia/2023/05/10/lula-petroleo-transicao-energetica.ghtml', 'news_article', 3, 'GloboNews', 'Entrevista', 'lula-sonho-ricos-petroleo-b142-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina rebate Lula e defende que Ibama tem autonomia técnica plena.', 'Ibama decide tecnicamente. Nenhum ministro ou presidente muda isso.', 'Declaração à Folha após fala de Lula sobre a Margem Equatorial.', 'verified', true, '2023-05-12', 'https://www1.folha.uol.com.br/ambiente/2023/05/marina-ibama-autonomia.shtml', 'news_article', 2, 'Folha de S.Paulo', 'Declaração', 'marina-ibama-autonomia-b142-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alv, 'Alexandre Silveira pressiona Ibama publicamente por licença à Petrobras.', 'A decisão do Ibama está contra o interesse nacional.', 'Entrevista ao Estadão pressionando por licença à perfuração.', 'verified', true, '2023-05-18', 'https://www.estadao.com.br/economia/alexandre-silveira-ibama-petrobras-maio2023/', 'news_article', 3, 'Estadão', 'Entrevista', 'silveira-pressao-ibama-b142-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe defende exploração na Foz do Amazonas e rompe com base ambientalista.', 'O Amapá precisa dos royalties. Não podemos repetir a lógica da pobreza.', 'Discurso no Senado em defesa da perfuração.', 'verified', true, '2023-05-22', 'https://www12.senado.leg.br/noticias/materias/2023/05/22/randolfe-foz-amapa-royalties', 'news_article', 3, 'Senado Federal', 'Discurso plenário', 'randolfe-foz-royalties-b142-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jea, 'Prates critica publicamente negativa do Ibama e pressiona Marina.', 'A decisão é infundada. A Petrobras tem capacidade técnica.', 'Entrevista à Reuters após Ibama indeferir licenciamento.', 'verified', true, '2023-05-19', 'https://www.reuters.com/brasil/prates-ibama-licenca-foz-maio2023/', 'news_article', 3, 'Reuters', 'Entrevista', 'prates-critica-ibama-b142-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima cobra União por royalties de campos amazônicos.', 'Amazonas precisa dos royalties para tocar serviços essenciais.', 'Entrevista em Manaus defendendo mais recursos.', 'verified', false, '2023-06-10', 'https://www.acritica.com/politica/wilson-lima-royalties-junho2023', 'news_article', 2, 'Manaus', 'Entrevista', 'wilson-royalties-amazonas-b142-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina alega que negativa do Ibama é ideológica.', 'A decisão técnica está contaminada por ideologia.', 'Entrevista à Jovem Pan após decisão do Ibama.', 'verified', false, '2023-05-20', 'https://jovempan.com.br/noticias/politica/tereza-ibama-ideologica.html', 'news_article', 3, 'Jovem Pan', 'Entrevista', 'tereza-ibama-ideologica-b142-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Fávaro defende perfuração e nega riscos para a pesca.', 'Não há risco para atividade pesqueira ou para povos originários.', 'Entrevista a Canal Rural sobre exploração na Foz.', 'verified', false, '2023-07-05', 'https://www.canalrural.com.br/politica/favaro-foz-pesca-julho2023', 'news_article', 3, 'Canal Rural', 'Entrevista', 'favaro-foz-pesca-b142-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Mercadante defende BNDES financiando projetos na Margem Equatorial.', 'O BNDES tem que estar junto com a Petrobras no esforço da Margem Equatorial.', 'Palestra em fórum sobre energia em São Paulo.', 'verified', false, '2023-08-15', 'https://www.bndes.gov.br/wps/portal/site/home/imprensa/noticias/conteudo/mercadante-margem-equatorial-bndes', 'other', 2, 'BNDES', 'Palestra', 'mercadante-bndes-margem-b142-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa diz que governo atuará para destravar exploração.', 'Casa Civil vai costurar solução. Não podemos paralisar investimento.', 'Entrevista à Globo sobre articulação entre ministérios.', 'verified', true, '2023-08-20', 'https://g1.globo.com/politica/noticia/2023/08/20/rui-costa-destravar-petrobras-foz.ghtml', 'news_article', 3, 'GloboNews', 'Entrevista', 'rui-destravar-exploracao-b142-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina alerta para risco de vazamento catastrófico na Foz do Amazonas.', 'Vazamento naquela região seria catástrofe irreversível.', 'Audiência pública na Câmara sobre o licenciamento.', 'verified', true, '2023-09-12', 'https://www.camara.leg.br/noticias/audiencia-marina-foz-setembro2023', 'news_article', 2, 'Câmara dos Deputados', 'Audiência pública', 'marina-vazamento-catastrofico-b142-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca Marina dizendo que ela quer país na miséria.', 'Essa moça quer o Brasil pobre. Petrobras tem que furar tudo.', 'Live de Bolsonaro após decisão do Ibama.', 'verified', true, '2023-05-25', 'https://www.youtube.com/watch?v=bolsonaro-marina-miseria-maio2023', 'social_media_post', 4, 'YouTube', 'Live', 'bolsonaro-ataca-marina-b142-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ric, 'Ricardo Salles celebra crise entre Marina e Petrobras.', 'A própria esquerda percebeu que Marina é obstáculo ao desenvolvimento.', 'Postagem no X no meio da crise interna do governo.', 'verified', true, '2023-06-01', 'https://twitter.com/rsallesmma/status/salles-marina-obstaculo-2023', 'social_media_post', 4, 'X (Twitter)', 'Postagem', 'salles-marina-obstaculo-b142-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jea, 'Prates anuncia plano de investimentos de 102 bi com R Margem Equatorial.', 'Nosso plano prevê mais de R$ 100 bilhões em exploração, muito na Margem.', 'Coletiva de divulgação do Plano Estratégico 2024-2028.', 'verified', true, '2023-11-23', 'https://petrobras.com.br/pt/noticias/plano-estrategico-prates-novembro2023', 'other', 3, 'Petrobras', 'Coletiva', 'prates-plano-margem-b142-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma em Dubai que Brasil vai explorar enquanto houver demanda.', 'Nós vamos explorar o nosso petróleo enquanto o mundo precisar.', 'Discurso na COP28 em Dubai.', 'verified', true, '2023-12-02', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2023/12/lula-cop28-petroleo', 'other', 4, 'COP28 Dubai', 'Discurso', 'lula-dubai-petroleo-b142-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jea, 'Prates defende dividendos extraordinários a governo em reunião de acionistas.', 'A Petrobras pagará todos os dividendos previstos. Cumprimos estatuto.', 'Coletiva após AGE que definiu pagamento de dividendos.', 'verified', false, '2024-03-10', 'https://petrobras.com.br/pt/noticias/dividendos-extraordinarios-marco2024', 'other', 2, 'Petrobras', 'Coletiva', 'prates-dividendos-marco-b142-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que dividendos retidos geraram prejuízo ao governo.', 'Havia acordo. A retenção feriu o entendimento.', 'Entrevista à Folha após nova rodada de queda das ações.', 'verified', true, '2024-03-11', 'https://www1.folha.uol.com.br/mercado/2024/03/haddad-dividendos-petrobras-retidos.shtml', 'news_article', 2, 'Folha de S.Paulo', 'Entrevista', 'haddad-dividendos-prejuizo-b142-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula demite Prates após desgaste sobre dividendos da Petrobras.', 'Fiz a troca porque precisamos de alinhamento total com o governo.', 'Declaração à imprensa no Planalto anunciando saída.', 'verified', true, '2024-05-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2024/05/lula-troca-prates-petrobras', 'other', 3, 'Palácio do Planalto', 'Anúncio', 'lula-demite-prates-b142-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard assume Petrobras e promete acelerar Margem Equatorial.', 'Minha prioridade é destravar o licenciamento da Margem Equatorial.', 'Pronunciamento de posse como presidente da Petrobras.', 'verified', true, '2024-05-24', 'https://petrobras.com.br/pt/noticias/magda-chambriard-posse-maio2024', 'other', 3, 'Petrobras', 'Posse', 'magda-posse-margem-b142-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jea, 'Prates ataca governo após demissão e fala em traição pessoal.', 'Eu cumpri o que combinei. Fui traído politicamente.', 'Entrevista ao Valor Econômico após sair da Petrobras.', 'verified', true, '2024-05-28', 'https://valor.globo.com/politica/noticia/2024/05/28/prates-traido-governo-demissao.ghtml', 'news_article', 3, 'Valor Econômico', 'Entrevista', 'prates-traido-b142-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem vai à Comissão de Minas e Energia e pede CPI da Petrobras.', 'Precisamos investigar essa gestão temerária.', 'Discurso em comissão propondo CPI.', 'verified', false, '2024-06-04', 'https://www.camara.leg.br/noticias/van-hattem-cpi-petrobras-junho2024', 'news_article', 3, 'Câmara dos Deputados', 'Comissão', 'van-hattem-cpi-petrobras-b142-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard diz que Ibama tem que liberar licença.', 'O Brasil precisa e a Petrobras está pronta. É hora de liberar.', 'Entrevista a CNN após reunião com Marina Silva.', 'verified', true, '2024-07-15', 'https://www.cnnbrasil.com.br/politica/magda-ibama-liberar-licenca-julho2024/', 'news_article', 3, 'CNN Brasil', 'Entrevista', 'magda-ibama-liberar-b142-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva diz que Ibama não sofre pressão para liberar Foz.', 'Não há caneta mágica. Licença ambiental segue rito técnico.', 'Entrevista à GloboNews em Brasília.', 'verified', true, '2024-07-18', 'https://globonews.globo.com/politica/marina-ibama-caneta-magica-julho2024', 'news_article', 2, 'GloboNews', 'Entrevista', 'marina-caneta-magica-b142-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alv, 'Alexandre Silveira defende PL que flexibiliza licenciamento ambiental.', 'O licenciamento precisa ser simplificado para destravar o Brasil.', 'Audiência pública no Senado sobre PL 2159.', 'verified', true, '2024-09-03', 'https://www12.senado.leg.br/noticias/materias/2024/09/03/alexandre-silveira-licenciamento-pl2159', 'news_article', 3, 'Senado Federal', 'Audiência', 'silveira-pl-licenciamento-b142-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva classifica PL do Licenciamento como PL da Devastação.', 'Esse é o PL da devastação. É retrocesso histórico.', 'Audiência pública no Senado sobre PL de licenciamento.', 'verified', true, '2024-09-03', 'https://www.gov.br/mma/pt-br/assuntos/noticias/2024/09/marina-pl-devastacao-licenciamento', 'other', 2, 'Senado Federal', 'Audiência', 'marina-pl-devastacao-b142-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_art, 'Arthur Lira apoia PL do Licenciamento e promete pautar em regime de urgência.', 'Vamos dar celeridade. O Brasil não pode parar.', 'Coletiva da Presidência da Câmara.', 'verified', false, '2024-09-10', 'https://www.camara.leg.br/noticias/arthur-lira-pl-licenciamento-urgencia-setembro2024', 'other', 3, 'Câmara dos Deputados', 'Coletiva', 'lira-pl-licenciamento-urgencia-b142-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes defende PL do Licenciamento e minimiza riscos climáticos.', 'O Brasil já tem licenciamento mais rígido do mundo. Essa PL só organiza.', 'Entrevista ao Valor Econômico em evento do agronegócio.', 'verified', false, '2024-09-20', 'https://valor.globo.com/agronegocios/noticia/2024/09/20/mauro-mendes-pl-licenciamento-agro.ghtml', 'news_article', 3, 'Valor Econômico', 'Entrevista', 'mauro-licenciamento-agro-b142-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rie, 'Eduardo Riedel defende autolicenciamento para obras de infraestrutura.', 'Autolicenciamento é avanço, não é risco ambiental.', 'Palestra na FIESP.', 'verified', false, '2024-10-02', 'https://www.ms.gov.br/riedel-autolicenciamento-fiesp-outubro2024/', 'news_article', 3, 'FIESP', 'Palestra', 'riedel-autolicenciamento-b142-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva diz temer pela vida após ameaças por pautas ambientais.', 'Recebi ameaças muito graves. Estou sendo escoltada.', 'Entrevista ao Fantástico sobre ameaças a ministra.', 'verified', true, '2024-11-03', 'https://globoplay.globo.com/v/fantastico-marina-ameacas-novembro2024', 'news_article', 3, 'Fantástico', 'Entrevista', 'marina-ameacas-vida-b142-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski reforça segurança da ministra Marina Silva após ameaças.', 'Determinei reforço imediato da proteção. Ameaça não será tolerada.', 'Coletiva no Ministério da Justiça.', 'verified', false, '2024-11-05', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-protecao-marina-novembro2024', 'other', 2, 'Ministério da Justiça', 'Coletiva', 'lewandowski-protecao-marina-b142-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda anuncia perfuração de poço de teste no Bloco 59 mesmo sem licença final.', 'Nossa posição é de avanço. Vamos estar prontos assim que sair a licença.', 'Entrevista à Petrobras Agência após apresentação de novo plano.', 'verified', true, '2025-01-20', 'https://agencia.petrobras.com.br/magda-bloco59-teste-janeiro2025', 'other', 3, 'Petrobras', 'Entrevista interna', 'magda-bloco59-pronta-b142-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alv, 'Alexandre Silveira impõe ultimato ao Ibama sobre licença da Foz.', 'Não aceitarei mais adiamentos. A licença sai no prazo técnico.', 'Entrevista à CNN Brasil em Brasília.', 'verified', true, '2025-02-05', 'https://www.cnnbrasil.com.br/politica/silveira-ultimato-ibama-fevereiro2025/', 'news_article', 4, 'CNN Brasil', 'Entrevista', 'silveira-ultimato-ibama-b142-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva rebate Alexandre Silveira sobre ultimato ao Ibama.', 'Ministro não dá ultimato a servidor. É contrariar a lei.', 'Declaração à Folha sobre fala do colega de ministério.', 'verified', true, '2025-02-06', 'https://www1.folha.uol.com.br/ambiente/2025/02/marina-ultimato-silveira-ibama.shtml', 'news_article', 2, 'Folha de S.Paulo', 'Declaração', 'marina-rebate-ultimato-b142-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a Foz do Amazonas não é foz do rio Amazonas.', 'Não é na foz do Amazonas. É a 500 km de distância. Vamos furar.', 'Café da manhã com jornalistas em Brasília.', 'verified', true, '2025-02-18', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/02/lula-cafe-jornalistas-foz', 'other', 3, 'Palácio do Planalto', 'Café com jornalistas', 'lula-foz-500km-b142-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende planejamento energético de longo prazo.', 'Energia não se pensa em ciclo político. Pensa-se em décadas.', 'Discurso no Fórum Econômico em Davos.', 'verified', false, '2025-01-25', 'https://www.weforum.org/brasil/tebet-energia-davos-janeiro2025', 'other', 1, 'Davos', 'Discurso', 'tebet-energia-davos-b142-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda defende que EIA da Foz está pronto após 5 anos de estudo.', 'Temos estudos robustos desde 2020. É injustificável o atraso.', 'Audiência na Comissão Mista de Orçamento.', 'verified', false, '2025-03-12', 'https://www12.senado.leg.br/noticias/materias/2025/03/12/magda-eia-foz-audiencia', 'news_article', 3, 'Senado Federal', 'Audiência', 'magda-eia-foz-pronto-b142-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gla, 'Gladson Cameli defende Acre receber royalties de qualquer produção amazônica.', 'Acre é Amazônia. Queremos participar dos royalties também.', 'Coletiva no Palácio Rio Branco.', 'verified', false, '2025-03-20', 'https://agencia.ac.gov.br/gladson-royalties-amazonia-marco2025', 'other', 2, 'Palácio Rio Branco', 'Coletiva', 'gladson-royalties-amazonia-b142-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bra, 'Carlos Brandão cobra mais investimentos em energia eólica no Maranhão.', 'O Maranhão tem vento. Queremos investimentos massivos.', 'Entrevista à TV Mirante.', 'verified', false, '2025-04-02', 'https://www.ma.gov.br/brandao-eolica-mirante-abril2025', 'news_article', 1, 'TV Mirante', 'Entrevista', 'brandao-eolica-b142-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro grava vídeo atacando proibição de exploração da Foz.', 'Se tivesse Bolsonaro, a Foz já estava bombeando há 3 anos.', 'Vídeo divulgado no Telegram e no X.', 'verified', true, '2025-04-15', 'https://twitter.com/jairbolsonaro/status/bolsonaro-foz-3anos-abril2025', 'social_media_post', 4, 'X (Twitter)', 'Vídeo', 'bolsonaro-foz-3anos-b142-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ric, 'Ricardo Salles critica Marina publicamente como ministra fracassada.', 'Marina é fracasso ambulante. Segura o país do lado errado.', 'Entrevista à Jovem Pan em SP.', 'verified', false, '2025-04-18', 'https://jovempan.com.br/noticias/politica/salles-marina-fracasso-abril2025.html', 'news_article', 4, 'Jovem Pan', 'Entrevista', 'salles-marina-fracasso-b142-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alv, 'Alexandre Silveira critica demora da COP 30 sem abrir Margem Equatorial.', 'Não podemos chegar à COP30 sem trazer investimentos.', 'Entrevista ao Valor em Belém.', 'verified', false, '2025-05-10', 'https://valor.globo.com/politica/noticia/2025/05/10/silveira-cop30-margem-equatorial.ghtml', 'news_article', 3, 'Valor Econômico', 'Entrevista', 'silveira-cop30-margem-b142-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva nega pressão política e defende independência do Ibama.', 'Não há pressão que mude a técnica. Ibama decide com base em ciência.', 'Entrevista ao jornal O Globo.', 'verified', false, '2025-05-15', 'https://oglobo.globo.com/politica/marina-ibama-independencia-maio2025.ghtml', 'news_article', 2, 'O Globo', 'Entrevista', 'marina-ibama-independencia-b142-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard defende que perfuração na Foz tem risco zero.', 'Risco nesse tipo de operação, para a Petrobras, é praticamente zero.', 'Entrevista à revista Exame em Brasília.', 'verified', true, '2025-05-22', 'https://exame.com/negocios/magda-chambriard-risco-zero-foz-maio2025/', 'news_article', 4, 'Exame', 'Entrevista', 'magda-risco-zero-b142-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho visita plataforma Petrobras e defende Margem Equatorial.', 'Vi de perto. É seguro. O Pará quer essa oportunidade.', 'Visita à plataforma durante agenda de pré-COP 30.', 'verified', true, '2025-06-05', 'https://www.agenciapara.com.br/helder-plataforma-margem-junho2025', 'other', 3, 'Plataforma Petrobras', 'Visita técnica', 'helder-plataforma-margem-b142-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clécio Luís insiste que Amapá tem direito a explorar a Foz.', 'Não vão nos impedir de crescer. O Amapá decide seu destino.', 'Entrevista à G1 Amapá.', 'verified', false, '2025-06-18', 'https://g1.globo.com/ap/amapa/noticia/2025/06/18/clecio-amapa-decide-destino-foz.ghtml', 'news_article', 3, 'G1 Amapá', 'Entrevista', 'clecio-amapa-decide-b142-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima declara apoio total à exploração do bloco 59.', 'Amazonas apoia. E quer royalties se descoberta for nossa.', 'Discurso na Assembleia Legislativa.', 'verified', false, '2025-06-25', 'https://www.acritica.com/politica/wilson-apoio-bloco59-junho2025', 'news_article', 2, 'Assembleia Legislativa AM', 'Discurso', 'wilson-apoio-bloco59-b142-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia que não disputará reeleição.', 'Cumpri meu papel. Nem por isso abandono a pauta ambiental.', 'Entrevista ao El País sobre decisão pessoal.', 'verified', true, '2025-07-08', 'https://brasil.elpais.com/brasil/2025-07-08/marina-silva-nao-disputa-reeleicao.html', 'news_article', 2, 'El País', 'Entrevista', 'marina-nao-reeleicao-b142-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alv, 'Alexandre Silveira anuncia leilão de blocos de petróleo na Margem Equatorial.', 'Leilão da Margem será marco do novo ciclo petrolífero.', 'Coletiva no MME.', 'verified', true, '2025-07-15', 'https://www.gov.br/mme/pt-br/assuntos/noticias/silveira-leilao-margem-julho2025', 'other', 3, 'MME', 'Coletiva', 'silveira-leilao-margem-b142-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina critica leilão e diz que era melhor priorizar energias renováveis.', 'O leilão vai na contramão da COP30. É contradição insustentável.', 'Entrevista à Folha de S.Paulo.', 'verified', true, '2025-07-17', 'https://www1.folha.uol.com.br/ambiente/2025/07/marina-leilao-cop30-contramao.shtml', 'news_article', 2, 'Folha de S.Paulo', 'Entrevista', 'marina-leilao-contramao-b142-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende leilão da Margem Equatorial dizendo que é soberania.', 'Soberania energética é soberania nacional. Ninguém vai nos ensinar o que fazer.', 'Declaração no Alvorada antes de viajar para Dubai.', 'verified', true, '2025-07-20', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/07/lula-soberania-energetica', 'other', 4, 'Alvorada', 'Declaração', 'lula-soberania-energetica-b142-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi defende PT comprometido com renováveis apesar de Foz.', 'O PT quer energia renovável. Mas quer justiça energética também.', 'Entrevista à Rede Brasil Atual.', 'verified', false, '2025-07-22', 'https://www.redebrasilatual.com.br/politica/gleisi-pt-renovaveis-justica-julho2025', 'news_article', 2, 'Rede Brasil Atual', 'Entrevista', 'gleisi-pt-renovaveis-b142-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda reage a críticas e diz que Petrobras é a mais verde do mundo.', 'Somos a petroleira mais limpa do mundo em carbono por barril.', 'Evento Offshore Technology Conference no Rio.', 'verified', false, '2025-08-05', 'https://www.offshore-technology.com/news/magda-petrobras-verde-agosto2025/', 'news_article', 3, 'OTC Rio', 'Palestra', 'magda-petroleira-verde-b142-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ironiza Lula defendendo petróleo após anos contra.', 'Lula virou bolsonarista do petróleo. É surreal.', 'Postagem no X após fala de Lula na Dubai Oil Summit.', 'verified', true, '2025-07-21', 'https://twitter.com/nikolas_dm/status/nikolas-lula-petroleo-julho2025', 'social_media_post', 3, 'X (Twitter)', 'Postagem', 'nikolas-lula-petroleo-b142-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis apresenta PL para proibir Ibama de negar licenças à Petrobras.', 'O Ibama não pode atrapalhar empresa estratégica. Vamos mudar a lei.', 'Apresentação de PL na Câmara.', 'verified', true, '2025-08-14', 'https://www.camara.leg.br/noticias/bia-kicis-pl-ibama-petrobras-agosto2025', 'news_article', 4, 'Câmara dos Deputados', 'Apresentação de PL', 'bia-pl-proibir-ibama-b142-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh rebate Bia Kicis e chama PL de desmonte ambiental.', 'Essa PL é aberração. É ofensiva à Constituição.', 'Discurso em plenário.', 'verified', false, '2025-08-15', 'https://www.camara.leg.br/noticias/lindbergh-pl-ibama-desmonte-agosto2025', 'news_article', 2, 'Câmara dos Deputados', 'Discurso plenário', 'lindbergh-pl-desmonte-b142-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fil, 'Filipe Barros defende privatização parcial da Petrobras.', 'Precisamos de governança de mercado na Petrobras, sem apadrinhamento.', 'Entrevista à InfoMoney.', 'verified', false, '2025-09-02', 'https://www.infomoney.com.br/politica/filipe-barros-privatizacao-petrobras-setembro2025/', 'news_article', 3, 'InfoMoney', 'Entrevista', 'filipe-privatizacao-petrobras-b142-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pau, 'Paulo Guedes afirma que intervenção na Petrobras custa trilhões.', 'Custou mais de 1 trilhão em valor de mercado perdido.', 'Entrevista à CNN Money.', 'verified', false, '2025-09-10', 'https://money.cnn.com.br/paulo-guedes-petrobras-trilhao-setembro2025/', 'news_article', 3, 'CNN Money', 'Entrevista', 'guedes-petrobras-trilhao-b142-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que Petrobras é orgulho e rebate ex-ministro.', 'Petrobras lucra, investe, gera emprego. Esse é o Brasil.', 'Entrevista à GloboNews.', 'verified', false, '2025-09-12', 'https://globonews.globo.com/politica/haddad-petrobras-orgulho-setembro2025', 'news_article', 1, 'GloboNews', 'Entrevista', 'haddad-petrobras-orgulho-b142-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes defende que MT tem direito a explorar novos campos.', 'Mato Grosso também pode explorar. Queremos também.', 'Entrevista à Record News.', 'verified', false, '2025-09-18', 'https://recordnews.r7.com/politica/mauro-mt-exploracao-setembro2025', 'news_article', 2, 'Record News', 'Entrevista', 'mauro-mt-exploracao-b142-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Ibama aprova licença ambiental para perfuração do bloco 59.', 'A Petrobras enfim teve o que merecia. Vamos furar o poço.', 'Coletiva no Palácio do Planalto após decisão do Ibama.', 'verified', true, '2025-10-20', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/10/lula-ibama-aprova-foz', 'other', 4, 'Palácio do Planalto', 'Coletiva', 'lula-ibama-aprova-foz-b142-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva pede exoneração e deixa o governo após licença do Ibama.', 'Há limites. Meu limite foi alcançado. Saio de cabeça erguida.', 'Pronunciamento no Palácio do Planalto anunciando saída.', 'verified', true, '2025-10-22', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/10/marina-demissao-pronunciamento', 'other', 3, 'Palácio do Planalto', 'Pronunciamento', 'marina-demissao-foz-b142-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard celebra licença e anuncia início da perfuração.', 'A Petrobras está pronta. Perfuração começa em 72 horas.', 'Coletiva na Petrobras após licença do Ibama.', 'verified', true, '2025-10-21', 'https://petrobras.com.br/pt/noticias/magda-perfuracao-72h-outubro2025', 'other', 4, 'Petrobras', 'Coletiva', 'magda-perfuracao-72h-b142-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino nega liminar de ONGs contra licença do Ibama.', 'Não há ilegalidade visível. O pedido é indeferido.', 'Decisão monocrática em ADI.', 'verified', true, '2025-10-23', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=dino-nega-liminar-foz-outubro2025', 'official_document', 2, 'STF', 'Decisão monocrática', 'dino-nega-liminar-foz-b142-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula abre COP 30 em Belém com discurso sobre transição justa.', 'Não há transição energética sem justiça social. O Brasil mostra o caminho.', 'Discurso de abertura da COP 30 em Belém.', 'verified', true, '2025-11-10', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/11/lula-discurso-cop30', 'other', 3, 'COP 30 Belém', 'Abertura', 'lula-cop30-abertura-b142-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva, já ex-ministra, critica contradição na COP 30.', 'Abriu a COP falando de transição e deixou a Petrobras furando a Foz.', 'Entrevista ao jornal The Guardian em Belém.', 'verified', true, '2025-11-12', 'https://www.theguardian.com/environment/2025/nov/12/marina-silva-cop30-foz-contradiction', 'news_article', 2, 'The Guardian', 'Entrevista', 'marina-contradicao-cop30-b142-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho apresenta pacote de desenvolvimento para a Margem Equatorial.', 'Pará vai se preparar. Refinaria, distribuição, tudo integrado.', 'Discurso na Casa do Pará na COP 30.', 'verified', false, '2025-11-13', 'https://www.agenciapara.com.br/helder-pacote-margem-cop30', 'other', 3, 'COP 30 Belém', 'Discurso', 'helder-pacote-margem-b142-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz que SP quer ser hub global de óleo e gás.', 'São Paulo tem portos. Queremos ser hub da nova Margem.', 'Entrevista a Exame em evento da FIESP.', 'verified', false, '2025-11-20', 'https://exame.com/politica/tarcisio-sp-hub-oleo-gas-novembro2025/', 'news_article', 2, 'FIESP', 'Entrevista', 'tarcisio-sp-hub-b142-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda anuncia descoberta de indícios de petróleo na Foz.', 'Há indícios fortes de acumulação de petróleo leve. Análise preliminar.', 'Coletiva da Petrobras após 3 semanas de perfuração.', 'verified', true, '2025-11-28', 'https://petrobras.com.br/pt/noticias/descoberta-foz-novembro2025', 'other', 4, 'Petrobras', 'Coletiva', 'magda-descoberta-foz-b142-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula celebra descoberta na Foz como vitória do Brasil.', 'Vitória do Brasil, do trabalhador, da Petrobras!', 'Pronunciamento no Alvorada após anúncio.', 'verified', true, '2025-11-29', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/11/lula-vitoria-foz', 'other', 3, 'Alvorada', 'Pronunciamento', 'lula-vitoria-foz-b142-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe afirma que Amapá terá mais recursos do que imagina.', 'Amapá vai ter revolução econômica nos próximos 10 anos.', 'Entrevista à Rede Amazônica.', 'verified', false, '2025-12-02', 'https://redeamazonica.globo.com/politica/randolfe-amapa-revolucao-dezembro2025', 'news_article', 2, 'Rede Amazônica', 'Entrevista', 'randolfe-amapa-revolucao-b142-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que descoberta na Foz é mérito dele.', 'Se a Petrobras descobriu, foi graças à preparação do meu governo.', 'Entrevista a podcast bolsonarista.', 'verified', true, '2025-12-04', 'https://www.youtube.com/watch?v=bolsonaro-descoberta-merito-dezembro2025', 'social_media_post', 4, 'Podcast', 'Entrevista', 'bolsonaro-merito-foz-b142-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro reage à descoberta afirmando ser propaganda do governo.', 'Descoberta de mentira. Governo quer mudar o assunto das fugas.', 'Postagem no X.', 'verified', false, '2025-12-01', 'https://twitter.com/BolsonaroSP/status/eduardo-foz-mentira-dezembro2025', 'social_media_post', 3, 'X (Twitter)', 'Postagem', 'eduardo-foz-mentira-b142-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro pede CPI da descoberta para evitar manipulação.', 'CPI vai verificar se não houve manipulação técnica.', 'Entrevista ao Metrópoles.', 'verified', false, '2025-12-05', 'https://www.metropoles.com/politica/flavio-cpi-descoberta-foz-dezembro2025', 'news_article', 3, 'Metrópoles', 'Entrevista', 'flavio-cpi-descoberta-b142-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Mercadante anuncia financiamento bilionário da BNDES para refinaria nova.', 'O BNDES vai injetar R$ 18 bilhões em nova refinaria no Pará.', 'Coletiva em Belém.', 'verified', false, '2025-12-15', 'https://www.bndes.gov.br/wps/portal/site/home/imprensa/noticias/conteudo/mercadante-refinaria-para-dezembro2025', 'other', 2, 'BNDES', 'Coletiva', 'mercadante-refinaria-para-b142-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende PT com agenda de soberania energética.', 'O PT faz política de soberania, não de apagão.', 'Discurso no Senado.', 'verified', false, '2025-12-10', 'https://www12.senado.leg.br/noticias/materias/2025/12/10/humberto-soberania-energetica', 'news_article', 1, 'Senado Federal', 'Discurso', 'humberto-soberania-b142-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem critica controle estatal da Petrobras e pede venda de ações.', 'Essa estatal gigante não é eficiência, é cabide.', 'Entrevista a Jovem Pan.', 'verified', false, '2025-12-18', 'https://jovempan.com.br/noticias/politica/van-hattem-petrobras-cabide-dezembro2025.html', 'news_article', 3, 'Jovem Pan', 'Entrevista', 'van-hattem-petrobras-cabide-b142-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro diz que concessão de licença sem exigências adequadas é grave.', 'Licença sem plano de emergência é irresponsabilidade.', 'Tribuna do Senado em pronunciamento.', 'verified', false, '2025-11-04', 'https://www12.senado.leg.br/noticias/materias/2025/11/04/moro-licenca-foz-emergencia', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'moro-licenca-emergencia-b142-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica preço dos combustíveis após descoberta.', 'Achamos petróleo e continuamos pagando caro. Só tem sentido monopolista.', 'Postagem no X sobre política de preços.', 'verified', false, '2025-12-19', 'https://twitter.com/KimKataguiri/status/kim-preco-combustivel-dezembro2025', 'social_media_post', 2, 'X (Twitter)', 'Postagem', 'kim-preco-combustivel-b142-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet pede que governo escute críticas sobre meio ambiente.', 'Não basta descobrir. Precisa escutar a ciência do clima.', 'Entrevista ao Estadão.', 'verified', false, '2025-12-22', 'https://www.estadao.com.br/politica/tebet-escutar-clima-dezembro2025/', 'news_article', 1, 'Estadão', 'Entrevista', 'tebet-escutar-clima-b142-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh aprova descoberta mas defende que 100% da exploração seja estatal.', 'Descoberta nossa só interessa se for estatal 100%.', 'Entrevista à RedeTV.', 'verified', false, '2026-01-05', 'https://www.redetv.uol.com.br/jornalismo/lindbergh-estatal-100-janeiro2026', 'news_article', 2, 'RedeTV', 'Entrevista', 'lindbergh-estatal-100-b142-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que Brasil tem que sair do Acordo de Paris.', 'Acordo de Paris é armadilha contra o Brasil. Teríamos saído.', 'Live no YouTube em janeiro.', 'verified', true, '2026-01-12', 'https://www.youtube.com/watch?v=bolsonaro-paris-sair-janeiro2026', 'social_media_post', 5, 'YouTube', 'Live', 'bolsonaro-sair-paris-b142-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro diz em culto que aquecimento global é exagero.', 'Criaram esse medo para nos controlar. Deus cuida da natureza.', 'Pregação em evento da Ministra Michelle em MG.', 'verified', true, '2026-01-18', 'https://www.gospelprime.com.br/michelle-aquecimento-exagero-janeiro2026', 'news_article', 5, 'Igreja em MG', 'Culto', 'michelle-aquecimento-exagero-b142-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fil, 'Filipe Barros assina PL para retirar Brasil do Acordo de Paris.', 'Se a direita ganha, saímos do acordo já no primeiro mês.', 'Apresentação de PL na Câmara.', 'verified', true, '2026-02-02', 'https://www.camara.leg.br/noticias/filipe-pl-sair-paris-fevereiro2026', 'news_article', 5, 'Câmara dos Deputados', 'Apresentação de PL', 'filipe-pl-sair-paris-b142-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano declara em culto que mudanças climáticas são fake news.', 'Isso de clima é golpe contra a economia. É fake news global.', 'Sermão na Assembleia de Deus em SP.', 'verified', true, '2026-01-25', 'https://www.gospelprime.com.br/marco-feliciano-clima-fake-news-janeiro2026', 'news_article', 5, 'São Paulo', 'Culto', 'feliciano-clima-fake-b142-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão diz que ESG é agenda globalista contra o Brasil.', 'ESG é arma globalista. Vamos derrubar tudo isso.', 'Entrevista à Jovem Pan.', 'verified', true, '2026-02-04', 'https://jovempan.com.br/noticias/politica/girao-esg-globalismo-fevereiro2026.html', 'news_article', 4, 'Jovem Pan', 'Entrevista', 'girao-esg-globalismo-b142-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta critica IPCC e acusa governo de seguir agenda internacional.', 'IPCC é cartilha. Governo Lula é marionete disso.', 'Tribuna da Câmara em fevereiro.', 'verified', true, '2026-02-10', 'https://www.camara.leg.br/noticias/julia-ipcc-cartilha-fevereiro2026', 'news_article', 5, 'Câmara dos Deputados', 'Discurso', 'julia-ipcc-cartilha-b142-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva responde negacionistas com dados de enchentes no RS.', 'Dizem que não existe? Olhem Rio Grande. Olhem o Nordeste.', 'Entrevista no podcast Mamilos.', 'verified', true, '2026-02-15', 'https://www.mamilos.com.br/marina-silva-negacionismo-rs-fevereiro2026', 'news_article', 2, 'Podcast Mamilos', 'Entrevista', 'marina-resposta-negacionismo-b142-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Hamilton Mourão defende equilíbrio entre agenda climática e industrialização.', 'Precisamos de equilíbrio. Negar clima ou negar economia são extremos.', 'Entrevista à GloboNews.', 'verified', false, '2026-02-22', 'https://globonews.globo.com/politica/mourao-equilibrio-clima-fevereiro2026', 'news_article', 1, 'GloboNews', 'Entrevista', 'mourao-equilibrio-clima-b142-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad assina programa de incentivo ao etanol de segunda geração.', 'Vamos fazer do etanol 2G a nossa bandeira verde.', 'Cerimônia no Ministério da Fazenda.', 'verified', false, '2026-03-04', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/haddad-etanol-2g-marco2026', 'other', 2, 'Ministério da Fazenda', 'Cerimônia', 'haddad-etanol-2g-b142-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende que agro resolve problema alimentar sem ESG.', 'Agro alimenta o mundo. ESG é invencionice.', 'Entrevista ao Canal Rural.', 'verified', false, '2026-03-10', 'https://www.canalrural.com.br/politica/tereza-cristina-esg-invencionice-marco2026', 'news_article', 4, 'Canal Rural', 'Entrevista', 'tereza-esg-invencionice-b142-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura sugere que país deveria rever compromisso climático.', 'Compromissos de carbono são engessamento. Precisamos rever.', 'Entrevista no Roda Viva.', 'verified', false, '2026-03-17', 'https://tvcultura.com.br/programas/rodaviva/adriana-ventura-compromisso-clima-marco2026', 'news_article', 3, 'TV Cultura', 'Entrevista', 'adriana-compromisso-clima-b142-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda anuncia novo poço e volume potencial bilionário na Foz.', 'Teremos anúncios de ordem gigantesca nos próximos meses.', 'Coletiva em março na Petrobras.', 'verified', true, '2026-03-25', 'https://petrobras.com.br/pt/noticias/magda-novo-poco-volume-marco2026', 'other', 3, 'Petrobras', 'Coletiva', 'magda-novo-poco-foz-b142-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alv, 'Alexandre Silveira assina renovação de contratos de partilha de pré-sal.', 'Contratos renovados garantem produção até 2050.', 'Coletiva no MME.', 'verified', false, '2026-04-02', 'https://www.gov.br/mme/pt-br/assuntos/noticias/silveira-renovacao-presal-abril2026', 'other', 2, 'MME', 'Coletiva', 'silveira-renovacao-presal-b142-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama descoberta de novo pré-sal e anuncia plano de 500 bi.', 'É o novo pré-sal. Plano de R$ 500 bilhões em 10 anos.', 'Cerimônia no Palácio do Planalto.', 'verified', true, '2026-04-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2026/04/lula-novo-presal-500bi', 'other', 4, 'Palácio do Planalto', 'Cerimônia', 'lula-novo-presal-500bi-b142-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva funda movimento para resistir à exploração na Amazônia.', 'Minha luta segue. Resistência vira movimento.', 'Evento de lançamento do movimento em São Paulo.', 'verified', true, '2026-04-12', 'https://www.cartacapital.com.br/politica/marina-movimento-resistencia-abril2026/', 'news_article', 2, 'São Paulo', 'Lançamento de movimento', 'marina-movimento-resistencia-b142-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta pauta PL do Licenciamento em regime de urgência após descoberta.', 'Vamos aprovar o licenciamento célere. Brasil não espera.', 'Coletiva na Presidência da Câmara.', 'verified', true, '2026-04-15', 'https://www.camara.leg.br/noticias/motta-pl-licenciamento-urgencia-abril2026', 'other', 3, 'Câmara dos Deputados', 'Coletiva', 'motta-pl-licenciamento-urgencia-b142-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

END $$;
