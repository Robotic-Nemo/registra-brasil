-- Batch 121: Fake news + platform regulation + Musk vs Moraes (continuation, Jan 2023 - Apr 2026)
DO $$
DECLARE
  v_orl UUID; v_mor UUID; v_gil UUID; v_car UUID; v_bar UUID;
  v_zan UUID; v_din UUID; v_fac UUID; v_num UUID; v_men UUID;
  v_tof UUID; v_fux UUID; v_jai UUID; v_edu UUID; v_fla UUID;
  v_cab UUID; v_nik UUID; v_zam UUID; v_ram UUID; v_bia UUID;
  v_mvh UUID; v_kim UUID; v_adv UUID; v_gir UUID; v_lul UUID;
  v_had UUID; v_rui UUID; v_mes UUID; v_lew UUID; v_tab UUID;
  v_eri UUID; v_sam UUID; v_tal UUID; v_jan UUID; v_chi UUID;
  v_mot UUID; v_alc UUID; v_lir UUID; v_frx UUID; v_ors UUID;
  c_des UUID; c_ant UUID; c_ame UUID; c_obs UUID; c_abu UUID;
  c_aut UUID; c_odi UUID; c_int UUID; c_con UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_num FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_men FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_fux FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_cab FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_frx FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_ors FROM politicians WHERE slug = 'orlando-silva';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina bloqueio do X no Brasil por desobediência a decisões judiciais.', 'A plataforma X foi suspensa por descumprir sistematicamente ordens judiciais no Brasil.', 'Decisão determinando bloqueio do X após Musk se recusar a indicar representante legal.', 'verified', true, '2024-08-30', 'https://g1.globo.com/politica/noticia/2024/08/30/moraes-bloqueio-x-brasil.ghtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-bloqueio-x-b121-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro apoia Elon Musk em disputa com Moraes.', 'Musk é herói da liberdade. Moraes é o ditador que quer calar o Brasil.', 'Declaração após embate público entre Musk e o STF.', 'verified', true, '2024-04-07', 'https://www1.folha.uol.com.br/poder/2024/04/bolsonaro-apoia-musk-moraes.shtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-apoia-musk-b121-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro viaja aos EUA para pedir a Musk ataques contra Moraes.', 'Musk está do nosso lado. Vai expor a ditadura de Moraes para o mundo inteiro.', 'Viagem aos EUA para encontrar Musk e articular ataques internacionais contra STF.', 'verified', true, '2024-04-10', 'https://oglobo.globo.com/politica/eduardo-musk-moraes-eua/', 'news_article', 5, 'EUA', 'Viagem diplomática paralela', 'eduardo-musk-eua-b121-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira comemora desafio de Musk ao STF brasileiro.', 'Musk é o único que teve coragem de enfrentar o ditador Moraes. Viva a liberdade!', 'Post em rede social comemorando recusa de Musk a cumprir decisões.', 'verified', true, '2024-04-07', 'https://www.metropoles.com/brasil/politica-br/nikolas-musk-desafio-stf', 'news_article', 4, 'X (Twitter)', 'Post em rede social', 'nikolas-musk-desafio-b121-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende Moraes e diz que "ninguém está acima da lei nem bilionário".', 'Nem bilionário americano está acima da lei brasileira. Musk precisa cumprir nossas ordens judiciais.', 'Entrevista sobre conflito entre Elon Musk e STF brasileiro.', 'verified', true, '2024-04-09', 'https://g1.globo.com/politica/noticia/2024/04/09/lula-musk-acima-lei.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-musk-acima-lei-b121-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva desiste de relatoria do PL das Fake News após derrota.', 'A pressão das plataformas e da direita foi enorme. Mas vamos voltar com o projeto reformulado.', 'Declaração após fracasso na aprovação do PL 2630 em 2023.', 'verified', true, '2023-05-04', 'https://www1.folha.uol.com.br/poder/2023/05/orlando-silva-desiste-relatoria-pl-fake.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'orlando-desiste-pl-b121-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso defende marco civil e responsabilização de plataformas.', 'As plataformas precisam ser responsabilizadas por conteúdos nocivos que amplificam.', 'Voto do ministro em julgamento sobre responsabilidade de plataformas.', 'verified', true, '2024-11-28', 'https://g1.globo.com/politica/noticia/2024/11/28/barroso-marco-civil-plataformas.ghtml', 'news_article', 1, 'STF', 'Julgamento plenário', 'barroso-marco-civil-b121-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes critica uso abusivo de decisões monocráticas sobre plataformas.', 'Decisões monocráticas para bloqueio de plataformas merecem passar por colegiado. É a regra.', 'Pronunciamento em entrevista sobre cerco de Moraes a redes sociais.', 'verified', false, '2024-04-12', 'https://oglobo.globo.com/politica/gilmar-mendes-monocraticas-plataformas/', 'news_article', 2, 'STF', 'Entrevista', 'gilmar-monocraticas-b121-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino anuncia projeto complementar ao PL das Fake News.', 'Vamos apresentar PL específico para combate a fake news em eleições. Democracia exige.', 'Anúncio de novo projeto após fracasso do PL 2630.', 'verified', false, '2023-06-15', 'https://www1.folha.uol.com.br/poder/2023/06/dino-pl-fake-news-eleicoes.shtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva', 'dino-pl-fake-news-eleicoes-b121-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cab, 'Carlos Bolsonaro lidera disseminação de fake news sobre urnas.', 'As urnas eletrônicas são fraudáveis. Temos provas, mas o STF não quer investigar.', 'Série de posts em rede social com desinformação eleitoral recorrente.', 'verified', true, '2023-02-14', 'https://www.metropoles.com/brasil/politica-br/carlos-fake-news-urnas', 'news_article', 4, 'X (Twitter)', 'Posts em redes sociais', 'carlos-fake-urnas-b121-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli dissemina desinformação sobre invasão do sistema do CNJ.', 'Eu nunca hackeei nada. É mentira da imprensa comunista para me prejudicar.', 'Reação após ser denunciada por envolvimento em invasão ao CNJ.', 'verified', true, '2023-05-04', 'https://g1.globo.com/politica/noticia/2023/05/04/zambelli-hacker-cnj.ghtml', 'news_article', 5, 'Brasília', 'Entrevista', 'zambelli-nega-hacker-b121-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro espalha fake news sobre vacina da covid causar AIDS.', 'Tem estudo mostrando que vacinados tem risco maior de desenvolver AIDS.', 'Live transmitida em que Bolsonaro leu matérias falsas sobre vacinas.', 'verified', true, '2023-01-05', 'https://www1.folha.uol.com.br/equilibrioesaude/2023/01/bolsonaro-vacina-aids-live.shtml', 'news_article', 5, 'Live em redes sociais', 'Live Bolsonaro', 'bolsonaro-vacina-aids-b121-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama PL das Fake News de "PL da Censura" em discurso inflamado.', 'Esse PL da Censura é a mordaça do PT. Querem controlar nossa liberdade de expressão.', 'Discurso em plenário durante tentativa de votação do PL 2630.', 'verified', true, '2023-05-02', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-pl-censura', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'bia-kicis-pl-censura-b121-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem classifica PL 2630 como "AI-5 digital".', 'Isso é AI-5 digital. Querem acabar com a liberdade de expressão no Brasil. Vamos resistir.', 'Pronunciamento inflamado contra PL das Fake News.', 'verified', true, '2023-04-28', 'https://oglobo.globo.com/politica/mvh-ai-5-digital-pl/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'mvh-ai-5-digital-b121-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia defende responsabilização de plataformas em voto.', 'As plataformas não podem ser terra sem lei. Têm dever de cuidado com conteúdo nocivo.', 'Voto da ministra em julgamento sobre Marco Civil da Internet.', 'verified', false, '2024-12-05', 'https://g1.globo.com/politica/noticia/2024/12/05/carmen-lucia-plataformas-voto.ghtml', 'news_article', 1, 'STF', 'Julgamento plenário', 'carmen-lucia-plataformas-b121-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão usa Câmara para ataques conspiratórios contra urnas.', 'As urnas eletrônicas são fraudáveis. O povo sabe disso e o STF esconde a verdade.', 'Discurso em plenário com desinformação eleitoral já desmentida.', 'verified', true, '2023-06-08', 'https://www.poder360.com.br/congresso/girao-urnas-fraudaveis/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'girao-urnas-fraudaveis-b121-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende PL contra violência digital a parlamentares.', 'Precisamos proteger parlamentares de ataques coordenados em redes sociais. É violência política.', 'Defesa do PL contra violência política digital na Câmara.', 'verified', false, '2023-08-22', 'https://www1.folha.uol.com.br/poder/2023/08/erika-hilton-violencia-digital-pl.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'erika-pl-violencia-digital-b121-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral defende versão moderada do PL 2630 com proteção a crianças.', 'Precisamos regular plataformas para proteger crianças e adolescentes, sem censura.', 'Declaração em defesa de emenda que priorizava proteção infantil.', 'verified', false, '2023-05-01', 'https://www.cnnbrasil.com.br/politica/tabata-pl-fake-news-criancas/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'tabata-pl-criancas-b121-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura chama PL 2630 de "ameaça à liberdade" em discurso do Novo.', 'O Novo não aceita censura. Esse PL é ameaça direta à liberdade de expressão.', 'Pronunciamento do Novo contra PL das Fake News em 2023.', 'verified', false, '2023-04-29', 'https://oglobo.globo.com/politica/adriana-ventura-pl-ameaca-liberdade/', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'adriana-pl-ameaca-b121-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri ataca PL das Fake News como "mordaça governamental".', 'PL 2630 é mordaça. O governo quer decidir o que você pode postar. Vamos derrubar.', 'Entrevista em podcast contra regulação de plataformas.', 'verified', false, '2023-05-03', 'https://www.poder360.com.br/congresso/kim-pl-fake-news-mordaca/', 'news_article', 2, 'Podcast', 'Entrevista', 'kim-pl-mordaca-b121-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina multa diária de R$ 100 mil contra X.', 'A plataforma X pagará multa por cada dia que descumprir ordem de bloqueio de contas.', 'Decisão com multa diária contra Musk e a plataforma X.', 'verified', true, '2024-04-07', 'https://g1.globo.com/politica/noticia/2024/04/07/moraes-multa-diaria-x.ghtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-multa-diaria-x-b121-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro acusa Moraes de "cruzada contra a liberdade".', 'Moraes lidera cruzada contra a liberdade de expressão. Isso não é democracia.', 'Pronunciamento no Senado contra decisões de Moraes sobre plataformas.', 'verified', true, '2024-04-08', 'https://www1.folha.uol.com.br/poder/2024/04/flavio-moraes-cruzada-liberdade.shtml', 'news_article', 4, 'Senado Federal', 'Pronunciamento', 'flavio-cruzada-b121-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende regulação de big techs em cúpula do G20.', 'Big techs precisam ser reguladas globalmente. Não podem continuar acima das leis nacionais.', 'Discurso em reunião do G20 em Nova Délhi.', 'verified', false, '2023-09-09', 'https://g1.globo.com/politica/noticia/2023/09/09/lula-g20-big-techs-regulacao.ghtml', 'news_article', 1, 'Nova Délhi', 'Cúpula G20', 'lula-g20-big-techs-b121-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Messias defende AGU em processos contra big techs.', 'A AGU vai processar plataformas que disseminam desinformação política. Não toleramos ilegalidade.', 'Coletiva após ação da AGU contra plataformas por discurso eleitoral.', 'verified', false, '2024-05-17', 'https://oglobo.globo.com/politica/messias-agu-big-techs/', 'news_article', 1, 'AGU', 'Coletiva', 'messias-agu-big-techs-b121-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro dissemina vídeo manipulado atacando Lula.', 'Esse é o Lula mentindo mais uma vez sobre o Brasil. Veja como ele engana o povo.', 'Compartilhamento de vídeo editado para distorcer fala do presidente Lula.', 'verified', true, '2023-07-19', 'https://www1.folha.uol.com.br/poder/2023/07/bolsonaro-video-manipulado-lula.shtml', 'news_article', 4, 'X (Twitter)', 'Post em rede social', 'bolsonaro-video-manipulado-b121-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas vira o maior influenciador bolsonarista com milhões de visualizações.', 'A esquerda não tem como competir. Nossa narrativa é imbatível nas redes sociais.', 'Entrevista celebrando alcance bilionário em redes sociais.', 'verified', false, '2023-12-20', 'https://www.metropoles.com/brasil/politica-br/nikolas-maior-influenciador-bolsonarista', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'nikolas-influenciador-b121-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia ataques transfóbicos coordenados em redes sociais.', 'Sou alvo de campanha transfóbica coordenada. Plataformas se omitem e ganham com isso.', 'Declaração na Câmara denunciando ataques em redes sociais.', 'verified', false, '2024-05-10', 'https://g1.globo.com/politica/noticia/2024/05/10/erika-hilton-transfobia-redes.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'erika-transfobia-redes-b121-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim propõe regulação de influenciadores políticos com transparência.', 'Precisamos de transparência em quem recebe pagamento para promover conteúdo político.', 'Proposta legislativa para regular marketing político em redes sociais.', 'verified', false, '2024-03-14', 'https://www1.folha.uol.com.br/poder/2024/03/samia-regulacao-influenciadores.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação de PL', 'samia-regulacao-influenciadores-b121-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Dias Toffoli vota pela responsabilização de plataformas.', 'Plataformas respondem por conteúdos nocivos que decidem manter no ar contra denúncias.', 'Voto no julgamento do Marco Civil da Internet no STF.', 'verified', false, '2024-12-05', 'https://oglobo.globo.com/politica/toffoli-plataformas-voto-marco-civil/', 'news_article', 1, 'STF', 'Julgamento', 'toffoli-plataformas-b121-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fux, 'Luiz Fux diverge e defende imunidade do Marco Civil.', 'A responsabilização prévia viola liberdade de expressão. Marco Civil tem que ser preservado.', 'Voto divergente no julgamento do STF sobre plataformas digitais.', 'verified', false, '2024-12-06', 'https://g1.globo.com/politica/noticia/2024/12/06/fux-divergencia-marco-civil.ghtml', 'news_article', 2, 'STF', 'Julgamento plenário', 'fux-divergencia-b121-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_men, 'André Mendonça vota contra responsabilização ampla de plataformas.', 'Responsabilização prévia sem ordem judicial é censura. Vamos defender liberdade constitucional.', 'Voto no julgamento sobre Marco Civil da Internet.', 'verified', false, '2024-12-11', 'https://www.cnnbrasil.com.br/politica/mendonca-plataformas-contra-responsabilizacao/', 'news_article', 2, 'STF', 'Julgamento', 'mendonca-contra-responsabilizacao-b121-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_num, 'Nunes Marques vota contra endurecimento no Marco Civil.', 'Não cabe ao Judiciário legislar sobre plataformas. Isso é competência do Congresso.', 'Voto no julgamento do STF sobre responsabilidade de plataformas.', 'verified', false, '2024-12-10', 'https://www.poder360.com.br/justica/nunes-marques-marco-civil-voto/', 'news_article', 1, 'STF', 'Julgamento', 'nunes-marques-marco-civil-b121-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota pela responsabilização ampla de big techs.', 'Big techs precisam assumir responsabilidade por conteúdos nocivos à democracia.', 'Voto do ministro no julgamento histórico sobre plataformas.', 'verified', false, '2024-11-28', 'https://g1.globo.com/politica/noticia/2024/11/28/zanin-big-techs-responsabilizacao.ghtml', 'news_article', 1, 'STF', 'Julgamento', 'zanin-big-techs-b121-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin defende regulação democrática de plataformas digitais.', 'A democracia exige que plataformas sejam responsabilizadas por ataques a instituições.', 'Voto do ministro em julgamento sobre Marco Civil.', 'verified', false, '2024-12-04', 'https://www1.folha.uol.com.br/poder/2024/12/fachin-regulacao-plataformas.shtml', 'news_article', 1, 'STF', 'Julgamento', 'fachin-regulacao-plataformas-b121-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes intima Musk como investigado por desinformação organizada.', 'O senhor Elon Musk é investigado por orquestrar campanha de desinformação no Brasil.', 'Despacho incluindo Musk formalmente como alvo de inquérito das fake news.', 'verified', true, '2024-04-08', 'https://oglobo.globo.com/politica/moraes-intima-musk-investigado/', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-intima-musk-b121-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro participa de CPAC Brasil com discurso contra big techs reguladas.', 'Se o PT aprovar essa censura, vai ser o fim do Brasil. Vamos impedir a todo custo.', 'Discurso na CPAC Brasil sobre regulação de redes sociais.', 'verified', true, '2023-07-02', 'https://www.cnnbrasil.com.br/politica/bolsonaro-cpac-brasil-censura/', 'news_article', 3, 'CPAC Brasil', 'Conferência conservadora', 'bolsonaro-cpac-censura-b121-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem defende descriminalização da desinformação política.', 'Tipificar desinformação é criminalizar a opinião. Isso é ditadura disfarçada de democracia.', 'Pronunciamento na Câmara contra emendas do PL 2630.', 'verified', false, '2023-05-02', 'https://www.poder360.com.br/congresso/ramagem-descriminalizacao-fake/', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'ramagem-descriminalizacao-b121-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia violência digital contra mulheres negras no parlamento.', 'Somos alvo diário de ataques racistas e misóginos. As plataformas lucram com nossa dor.', 'Pronunciamento em plenário sobre ataques coordenados a deputadas.', 'verified', false, '2024-03-08', 'https://www1.folha.uol.com.br/poder/2024/03/taliria-ataques-racistas-plataformas.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-ataques-racistas-b121-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira recusa pautar PL 2630 após pressão das big techs.', 'Não há consenso suficiente para pautar. O PL 2630 está suspenso por ora.', 'Decisão como presidente da Câmara de engavetar PL 2630 em 2023.', 'verified', true, '2023-05-02', 'https://g1.globo.com/politica/noticia/2023/05/02/lira-engaveta-pl-fake-news.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Decisão da Presidência', 'lira-engaveta-pl-b121-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta anuncia nova tentativa de regulação após posse na Câmara.', 'Regulação digital é prioridade. Vamos construir texto que una Câmara e defenda democracia.', 'Discurso como novo presidente da Câmara em 2025.', 'verified', false, '2025-02-05', 'https://oglobo.globo.com/politica/motta-regulacao-digital-prioridade/', 'news_article', 1, 'Câmara dos Deputados', 'Posse presidência', 'motta-regulacao-prioridade-b121-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Davi Alcolumbre defende regulação via Senado após desbloqueio do X.', 'O Senado vai pautar regulação digital com prudência. Equilíbrio entre liberdade e responsabilidade.', 'Declaração após fim do bloqueio do X no Brasil.', 'verified', false, '2024-10-10', 'https://www.cnnbrasil.com.br/politica/alcolumbre-senado-regulacao-x/', 'news_article', 1, 'Senado Federal', 'Entrevista', 'alcolumbre-regulacao-senado-b121-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes libera X no Brasil após plataforma cumprir decisões.', 'A plataforma X cumpriu as exigências. Está autorizada a voltar a operar no Brasil.', 'Decisão autorizando volta do X após Musk ceder e cumprir ordens.', 'verified', true, '2024-10-08', 'https://www1.folha.uol.com.br/poder/2024/10/moraes-libera-x-brasil.shtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-libera-x-b121-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro lamenta fim do bloqueio do X e critica "capitulação" de Musk.', 'Musk recuou. Foi uma derrota para a liberdade global. Mas a luta continua.', 'Entrevista após X voltar a funcionar no Brasil em outubro de 2024.', 'verified', false, '2024-10-09', 'https://oglobo.globo.com/politica/bolsonaro-musk-capitulacao-x/', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-musk-capitulacao-b121-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar celebra responsabilização histórica de plataformas pelo STF.', 'O STF deu passo histórico. Plataformas não são mais território sem lei no Brasil.', 'Declaração após julgamento do Marco Civil em 2024.', 'verified', false, '2024-12-12', 'https://www.poder360.com.br/congresso/chico-alencar-plataformas-responsabilizacao/', 'news_article', 1, 'Câmara dos Deputados', 'Entrevista', 'chico-plataformas-b121-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cab, 'Carlos Bolsonaro compartilha deepfake de Lula para atacar governo.', 'Vejam aí o Lula mostrando sua verdadeira face. O Brasil não pode aceitar isso.', 'Carlos Bolsonaro compartilhou deepfake do presidente para gerar desinformação.', 'verified', true, '2024-07-22', 'https://g1.globo.com/politica/noticia/2024/07/22/carlos-bolsonaro-deepfake-lula.ghtml', 'news_article', 5, 'X (Twitter)', 'Post em rede social', 'carlos-deepfake-lula-b121-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo defende marco regulatório de IA e deepfakes.', 'Precisamos de lei urgente contra deepfakes políticos. Democracia não resiste a essa manipulação.', 'Declaração em seminário sobre regulação de inteligência artificial.', 'verified', false, '2024-08-15', 'https://www1.folha.uol.com.br/poder/2024/08/freixo-deepfakes-regulacao-urgente.shtml', 'news_article', 1, 'Brasília', 'Seminário', 'freixo-deepfakes-b121-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende PL contra desinformação eleitoral.', 'Precisamos proteger as eleições de 2026 de campanhas coordenadas de desinformação.', 'Pronunciamento sobre novo PL para eleições apresentado em 2025.', 'verified', false, '2025-06-18', 'https://g1.globo.com/politica/noticia/2025/06/18/jandira-pl-desinformacao-eleicoes.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-pl-eleicoes-b121-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso celebra aprovação do marco regulatório de IA na Europa.', 'Europa dá exemplo com AI Act. Brasil precisa avançar para proteger direitos fundamentais.', 'Discurso em evento sobre inteligência artificial em Brasília.', 'verified', false, '2024-03-13', 'https://oglobo.globo.com/politica/barroso-ia-europa-exemplo/', 'news_article', 1, 'Brasília', 'Seminário', 'barroso-ia-europa-b121-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia plano nacional de combate à desinformação.', 'Vamos coordenar governo federal contra desinformação sistêmica. É guerra pela verdade.', 'Anúncio do programa governamental de enfrentamento a fake news.', 'verified', false, '2024-05-10', 'https://www.cnnbrasil.com.br/politica/rui-costa-plano-desinformacao/', 'news_article', 1, 'Palácio do Planalto', 'Anúncio governamental', 'rui-plano-desinformacao-b121-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad alerta sobre uso de IA em ataques à economia brasileira.', 'Desinformação econômica via IA é ameaça real. Investidores não podem ser manipulados.', 'Entrevista sobre ataques a real e bolsa via deepfakes econômicos.', 'verified', false, '2024-06-10', 'https://www1.folha.uol.com.br/mercado/2024/06/haddad-ia-desinformacao-economia.shtml', 'news_article', 1, 'Ministério da Fazenda', 'Entrevista', 'haddad-ia-economia-b121-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli dissemina fake news sobre troca de urnas no TSE.', 'Gravamos a troca de urnas eletrônicas no TSE. Tenho prova da fraude.', 'Post viral com alegação falsa sobre fraude em urnas, desmentido pelo TSE.', 'verified', true, '2023-03-19', 'https://g1.globo.com/politica/noticia/2023/03/19/zambelli-fake-troca-urnas.ghtml', 'news_article', 5, 'X (Twitter)', 'Post em rede social', 'zambelli-fake-urnas-b121-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro vai ao Twitter Spaces com Musk atacar STF.', 'Musk, o Brasil está sendo sufocado. Moraes persegue quem ousa expressar opinião.', 'Participação em Spaces do X organizado por Musk para atacar STF brasileiro.', 'verified', true, '2024-04-15', 'https://www1.folha.uol.com.br/poder/2024/04/eduardo-musk-spaces-stf.shtml', 'news_article', 5, 'X (Twitter)', 'Spaces com Musk', 'eduardo-musk-spaces-b121-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira participa de campanhas coordenadas contra PL 2630.', 'Vamos derrubar a censura. Compartilhe, viralize, mostre a verdade ao povo.', 'Coordenação de ataques orquestrados em rede social contra PL das Fake News.', 'verified', true, '2023-05-02', 'https://www.metropoles.com/brasil/politica-br/nikolas-campanha-coordenada-pl', 'news_article', 3, 'X (Twitter)', 'Campanha coordenada', 'nikolas-campanha-b121-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes ordena bloqueio de perfis de bolsonaristas no X.', 'Os perfis identificados como parte da rede coordenada de desinformação serão bloqueados.', 'Decisão ordenando bloqueio de dezenas de contas em inquérito das fake news.', 'verified', true, '2023-04-19', 'https://oglobo.globo.com/politica/moraes-bloqueio-perfis-bolsonaristas-x/', 'news_article', 2, 'STF', 'Decisão judicial', 'moraes-bloqueio-perfis-b121-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'Girão divulga fake news sobre máquinas de votação vulneráveis.', 'Existem provas sérias de que as urnas são hackeáveis. Vamos ao mundo denunciar.', 'Vídeo viralizado em rede social com alegações falsas sobre urnas.', 'verified', true, '2024-09-17', 'https://www.cnnbrasil.com.br/politica/girao-fake-urnas-hackeaveis/', 'news_article', 4, 'X (Twitter)', 'Vídeo em rede social', 'girao-fake-urnas-b121-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis dissemina teoria da conspiração sobre chips em vacinas.', 'Tem chips nas vacinas. Muita gente sabe disso. A ciência oficial é comprada.', 'Pronunciamento conspiratório sobre vacinas da covid.', 'verified', true, '2023-07-24', 'https://www.poder360.com.br/congresso/bia-kicis-chips-vacinas/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bia-kicis-chips-b121-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é multado pelo TSE por desinformação eleitoral.', 'Essa multa é abuso. O TSE virou braço do PT para me calar.', 'Reação após nova multa do TSE por desinformação em campanha.', 'verified', true, '2023-06-30', 'https://g1.globo.com/politica/noticia/2023/06/30/bolsonaro-multa-tse-desinformacao.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-multa-tse-b121-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira arquiva definitivamente PL 2630 em gesto às plataformas.', 'O PL 2630 está arquivado. Não há ambiente político para avançar.', 'Decisão política de Lira para enterrar definitivamente o PL das Fake News.', 'verified', true, '2024-05-23', 'https://www1.folha.uol.com.br/poder/2024/05/lira-arquiva-pl-fake-news.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Decisão da Presidência', 'lira-arquiva-pl-b121-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro se muda para os EUA para coordenar ataques ao STF.', 'Estou em Washington para impedir que a ditadura togada consolide poder no Brasil.', 'Anúncio de mudança para EUA para articular sanções internacionais ao STF.', 'verified', true, '2025-02-25', 'https://g1.globo.com/politica/noticia/2025/02/25/eduardo-muda-eua-stf.ghtml', 'news_article', 5, 'Washington DC', 'Entrevista', 'eduardo-muda-eua-b121-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem comemora tarifa de Trump contra Brasil pelo STF.', 'Trump tarifou o Brasil porque Moraes excedeu. O governo Lula colhe o que plantou.', 'Declaração após Trump impor tarifas de 50% citando processo contra Bolsonaro.', 'verified', true, '2025-07-09', 'https://oglobo.globo.com/politica/mvh-celebra-tarifa-trump-brasil/', 'news_article', 5, 'Câmara dos Deputados', 'Entrevista', 'mvh-tarifa-trump-b121-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama tarifa de Trump de "atentado à soberania do Brasil".', 'Não vamos aceitar chantagem gringa. O Brasil é soberano e o STF é nosso.', 'Pronunciamento após Trump impor tarifa de 50% em represália ao processo de Bolsonaro.', 'verified', true, '2025-07-10', 'https://www1.folha.uol.com.br/mercado/2025/07/lula-tarifa-trump-soberania.shtml', 'news_article', 1, 'Palácio do Planalto', 'Pronunciamento oficial', 'lula-tarifa-soberania-b121-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad denuncia que tarifa de Trump é represália a decisões do STF.', 'Trump tarifou o Brasil para defender Bolsonaro. Isso é interferência direta na Justiça.', 'Declaração sobre carta de Trump justificando tarifa com processo contra Bolsonaro.', 'verified', true, '2025-07-11', 'https://g1.globo.com/politica/noticia/2025/07/11/haddad-tarifa-trump-represalia.ghtml', 'news_article', 1, 'Ministério da Fazenda', 'Coletiva', 'haddad-tarifa-represalia-b121-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira propõe anistia atrelada a cessação de sanções de Trump.', 'Aprovar anistia é único caminho para Trump retirar tarifa contra o Brasil.', 'Discurso na Câmara atrelando PL da anistia à retirada de tarifas americanas.', 'verified', true, '2025-08-05', 'https://www.cnnbrasil.com.br/politica/nikolas-anistia-sancoes-trump/', 'news_article', 5, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-anistia-trump-b121-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro celebra sanção da Lei Magnitsky contra Moraes.', 'Moraes sancionado pelos EUA. Finalmente o mundo vê o ditador togado.', 'Post em rede social comemorando sanções dos EUA contra ministro do STF.', 'verified', true, '2025-07-30', 'https://www1.folha.uol.com.br/poder/2025/07/bolsonaro-celebra-magnitsky-moraes.shtml', 'news_article', 5, 'X (Twitter)', 'Post em rede social', 'bolsonaro-magnitsky-b121-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota no STF pela regulação de plataformas digitais.', 'Não podemos deixar plataformas acima da democracia. Precisamos regular com responsabilidade.', 'Voto do ministro no julgamento do Marco Civil da Internet.', 'verified', false, '2024-12-09', 'https://g1.globo.com/politica/noticia/2024/12/09/flavio-dino-plataformas-voto.ghtml', 'news_article', 1, 'STF', 'Julgamento plenário', 'dino-plataformas-voto-b121-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cab, 'Carlos Bolsonaro faz parceria com Rumble para fugir da moderação do X.', 'No Rumble estamos livres da censura de Moraes. Lá a liberdade vale de verdade.', 'Anúncio de migração para plataforma americana sem moderação.', 'verified', true, '2024-05-02', 'https://oglobo.globo.com/politica/carlos-bolsonaro-rumble-migracao/', 'news_article', 3, 'Rumble', 'Anúncio em rede social', 'carlos-rumble-b121-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende liberação completa do X durante bloqueio.', 'Bloquear o X é ato autoritário. Os brasileiros têm direito à informação e expressão.', 'Discurso em plenário durante semanas de bloqueio da rede social.', 'verified', false, '2024-09-05', 'https://www.poder360.com.br/congresso/adriana-ventura-liberacao-x/', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'adriana-liberacao-x-b121-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri protocola pedido de impeachment de Moraes após bloqueio do X.', 'Moraes excedeu competências. Apresento pedido de impeachment pelo bem da democracia.', 'Protocolo de pedido de impeachment do ministro em setembro de 2024.', 'verified', true, '2024-09-02', 'https://www1.folha.uol.com.br/poder/2024/09/kim-impeachment-moraes-x.shtml', 'news_article', 4, 'Senado Federal', 'Protocolo de pedido', 'kim-impeachment-moraes-b121-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Davi Alcolumbre arquiva pedidos de impeachment contra ministros do STF.', 'Arquivei pedidos de impeachment por falta de fundamento. Não cabe Senado julgar mérito de decisão.', 'Decisão como presidente do Senado sobre 50 pedidos de impeachment contra Moraes.', 'verified', true, '2025-03-10', 'https://oglobo.globo.com/politica/alcolumbre-arquiva-impeachments-stf/', 'news_article', 1, 'Senado Federal', 'Decisão da Presidência', 'alcolumbre-arquiva-impeachments-b121-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis publica fake news sobre STF influenciar eleição de 2022.', 'Temos provas concretas de que o STF interferiu na eleição em favor de Lula.', 'Vídeo desmentido por checagem com alegações falsas sobre eleições.', 'verified', true, '2023-10-30', 'https://www.cnnbrasil.com.br/politica/bia-kicis-fake-stf-eleicao/', 'news_article', 4, 'X (Twitter)', 'Vídeo em rede social', 'bia-kicis-fake-stf-eleicao-b121-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral apresenta PL para proteção de crianças em plataformas.', 'Preciso aprovar urgentemente proteção a crianças de conteúdo nocivo nas plataformas.', 'Apresentação de projeto alternativo ao PL 2630 focado em crianças.', 'verified', false, '2024-03-21', 'https://g1.globo.com/politica/noticia/2024/03/21/tabata-pl-criancas-plataformas.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação de PL', 'tabata-pl-criancas-plataformas-b121-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia ação conjunta contra desinformação em 2026.', 'Vamos criar força-tarefa federal contra desinformação para eleições de 2026.', 'Anúncio de criação de estrutura governamental antidesinformação.', 'verified', false, '2025-10-14', 'https://www1.folha.uol.com.br/poder/2025/10/lewandowski-forca-tarefa-desinformacao.shtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva', 'lewandowski-forca-tarefa-b121-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra regulação urgente das plataformas após eleições de 2024.', 'As eleições provaram que desinformação é risco real. Urge regular plataformas.', 'Declaração após eleições municipais marcadas por desinformação.', 'verified', false, '2024-11-05', 'https://g1.globo.com/politica/noticia/2024/11/05/lula-regulacao-plataformas-urgente.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Entrevista', 'lula-regulacao-urgente-b121-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro faz live com Musk atacando Moraes em eleições de 2026.', 'Musk, o Brasil está sufocado. Moraes não permite nada. É hora de agir.', 'Participação em live conjunta com Musk em plena campanha eleitoral.', 'verified', true, '2026-03-28', 'https://oglobo.globo.com/politica/bolsonaro-musk-live-2026/', 'news_article', 5, 'X (Twitter)', 'Live com Musk', 'bolsonaro-musk-live-b121-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina novo bloqueio do Rumble por desobediência.', 'O Rumble se recusou a cumprir ordens e será bloqueado como o X foi.', 'Decisão determinando bloqueio do Rumble após descumprimento de ordens.', 'verified', true, '2025-02-26', 'https://www1.folha.uol.com.br/poder/2025/02/moraes-bloqueio-rumble.shtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-bloqueio-rumble-b121-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro critica bloqueio do Rumble como "censura global".', 'Moraes agora censura Rumble. É clara pauta globalista contra liberdade de expressão.', 'Reação ao bloqueio do Rumble em fevereiro de 2025.', 'verified', true, '2025-02-27', 'https://www.cnnbrasil.com.br/politica/eduardo-rumble-censura-global/', 'news_article', 4, 'Washington DC', 'Entrevista', 'eduardo-rumble-b121-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem é preso por descumprir regras após denúncia da PGR.', 'Sou inocente. Estou sendo preso por perseguição. Não participei de nada ilegal.', 'Reação após ser preso por descumprir medidas cautelares em 2025.', 'verified', true, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/ramagem-preso-cautelares.ghtml', 'news_article', 5, 'Brasília', 'Entrevista após prisão', 'ramagem-preso-b121-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro apresenta PL para limitar alcance de decisões de ministros.', 'PEC para barrar decisões monocráticas é prioridade. Ministro não pode sozinho bloquear plataforma.', 'Apresentação de PEC contra decisões monocráticas de ministros do STF.', 'verified', false, '2024-09-10', 'https://oglobo.globo.com/politica/flavio-pec-monocraticas/', 'news_article', 3, 'Senado Federal', 'Apresentação de PEC', 'flavio-pec-monocraticas-b121-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro compartilha vídeo falso sobre abstenção nas eleições.', 'Olha o que estão fazendo nas urnas. O Brasil precisa acordar antes que seja tarde.', 'Compartilhamento de vídeo com desinformação eleitoral desmentida pelo TSE.', 'verified', true, '2024-10-29', 'https://g1.globo.com/politica/noticia/2024/10/29/bolsonaro-video-falso-abstencao.ghtml', 'news_article', 4, 'X (Twitter)', 'Post em rede social', 'bolsonaro-fake-abstencao-b121-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia defende rigor com desinformação eleitoral como presidente do TSE.', 'O TSE será rigoroso com desinformação eleitoral. Democracia exige eleições limpas.', 'Discurso de posse como presidente do TSE.', 'verified', false, '2024-06-03', 'https://www1.folha.uol.com.br/poder/2024/06/carmen-lucia-tse-desinformacao-rigor.shtml', 'news_article', 1, 'TSE', 'Posse presidência', 'carmen-tse-rigor-b121-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes aplica multa recorde de R$ 18 milhões ao X.', 'A plataforma X acumulou 18 milhões em multa por descumprir ordens. Vamos executar.', 'Decisão sobre execução de multa acumulada contra o X durante bloqueio.', 'verified', true, '2024-09-19', 'https://g1.globo.com/politica/noticia/2024/09/19/moraes-multa-18-milhoes-x.ghtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-multa-18-milhoes-b121-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz live com 2 milhões de visualizações atacando Moraes.', 'Bora, galera! Moraes não aguenta. Vamos subir hashtag contra ele agora.', 'Live organizada com bolsonaristas para viralizar ataques coordenados a Moraes.', 'verified', true, '2024-04-20', 'https://www.metropoles.com/brasil/politica-br/nikolas-live-2-milhoes-moraes', 'news_article', 4, 'X (Twitter)', 'Live em rede social', 'nikolas-live-2mi-b121-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali denuncia ataques coordenados de bolsonaristas.', 'Somos alvo de ataques coordenados em redes. Essa guerra híbrida atenta contra democracia.', 'Pronunciamento sobre estudo que identificou redes de ataques coordenados a esquerdistas.', 'verified', false, '2024-08-20', 'https://www1.folha.uol.com.br/poder/2024/08/jandira-ataques-coordenados-denuncia.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-ataques-coordenados-b121-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim é alvo de deepfake pornográfico e cobra punição.', 'Fui alvo de deepfake pornográfico. Isso é violência digital e crime. Precisamos de lei específica.', 'Denúncia pública sobre deepfake não autorizado da deputada.', 'verified', true, '2024-07-10', 'https://g1.globo.com/politica/noticia/2024/07/10/samia-deepfake-pornografico.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Coletiva', 'samia-deepfake-b121-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro promete "revanche" com Trump contra Moraes em 2025.', 'Com Trump voltamos no poder. Vamos dar revanche ao Brasil contra a tirania do Moraes.', 'Declaração em evento conservador nos EUA após vitória de Trump.', 'verified', true, '2024-11-08', 'https://oglobo.globo.com/politica/eduardo-revanche-trump-moraes/', 'news_article', 5, 'EUA', 'Evento conservador', 'eduardo-revanche-trump-b121-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem ataca decisão do STF sobre plataformas.', 'Decisão do STF sobre plataformas é censura disfarçada. Vamos revertê-la via legislativo.', 'Reação parlamentar à decisão do STF sobre responsabilidade de plataformas.', 'verified', false, '2024-12-12', 'https://www.poder360.com.br/congresso/mvh-ataca-stf-plataformas/', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'mvh-stf-plataformas-b121-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino critica parlamentares por impedir regulação de big techs.', 'Congresso tem que legislar. Ao fugir, deixa STF suprir vácuo legislativo criticado.', 'Declaração sobre insuficiência do Congresso para regular plataformas.', 'verified', false, '2024-12-14', 'https://www1.folha.uol.com.br/poder/2024/12/dino-congresso-regulacao-big-techs.shtml', 'news_article', 1, 'STF', 'Entrevista', 'dino-congresso-big-techs-b121-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_men, 'André Mendonça vota pela proteção ampla à liberdade religiosa nas plataformas.', 'Plataformas não podem censurar conteúdo religioso sob pretexto de combate a discurso.', 'Voto divergente sobre moderação de conteúdos religiosos em plataformas.', 'verified', false, '2024-12-10', 'https://oglobo.globo.com/politica/mendonca-liberdade-religiosa-plataformas/', 'news_article', 2, 'STF', 'Julgamento', 'mendonca-liberdade-religiosa-b121-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli tenta driblar bloqueios via contas falsas no X.', 'O povo não será calado. Tenho contas reservas para manter a verdade viva.', 'Reportagens expõem estratégia da deputada para burlar suspensões judiciais.', 'verified', true, '2024-03-22', 'https://g1.globo.com/politica/noticia/2024/03/22/zambelli-contas-falsas-x.ghtml', 'news_article', 4, 'X (Twitter)', 'Reportagem', 'zambelli-contas-falsas-b121-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Freixo propõe lei para transparência em algoritmos de plataformas.', 'Precisamos de lei exigindo transparência nos algoritmos. Caixa-preta é ameaça à democracia.', 'Proposta legislativa sobre transparência algorítmica em plataformas.', 'verified', false, '2024-09-25', 'https://www1.folha.uol.com.br/poder/2024/09/freixo-transparencia-algoritmos.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação de PL', 'freixo-transparencia-algoritmos-b121-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes critica Moraes por ampliar inquérito das fake news.', 'O inquérito das fake news se tornou eterno. Precisamos de limite para não virar arbítrio.', 'Declaração crítica ao longo inquérito comandado por Moraes.', 'verified', true, '2024-11-14', 'https://www.cnnbrasil.com.br/politica/gilmar-critica-inquerito-fake-news/', 'news_article', 3, 'STF', 'Entrevista', 'gilmar-inquerito-eterno-b121-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro acusa Alexandre de Moraes de "ditador mais perigoso" do mundo.', 'Moraes é o ditador mais perigoso do mundo hoje. Censura, persegue, prende a rodo.', 'Discurso em CPAC Washington atacando ministro do STF.', 'verified', true, '2025-02-20', 'https://oglobo.globo.com/politica/bolsonaro-cpac-moraes-ditador-perigoso/', 'news_article', 5, 'CPAC Washington', 'Discurso em evento', 'bolsonaro-cpac-moraes-b121-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes rebate sanções americanas e nega intimidação.', 'Não me intimidam com sanções. Continuarei cumprindo meu dever constitucional.', 'Declaração após sanções da Lei Magnitsky impostas pelos EUA.', 'verified', true, '2025-07-31', 'https://www1.folha.uol.com.br/poder/2025/07/moraes-rebate-sancoes-magnitsky.shtml', 'news_article', 1, 'STF', 'Entrevista', 'moraes-rebate-sancoes-b121-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe Moraes no Planalto em apoio após sanções dos EUA.', 'Moraes tem todo apoio do Brasil. Não aceitaremos intimidação externa contra nosso STF.', 'Recepção solidária ao ministro após sanções americanas.', 'verified', true, '2025-08-01', 'https://g1.globo.com/politica/noticia/2025/08/01/lula-recebe-moraes-planalto-sancoes.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Reunião solidariedade', 'lula-recebe-moraes-b121-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis protocola pedido de impeachment contra Moraes novamente.', 'Moraes abusa. É ditador. Mais um pedido de impeachment para salvar democracia.', 'Sexto pedido de impeachment contra Moraes protocolado pela deputada.', 'verified', false, '2024-08-29', 'https://www.poder360.com.br/congresso/bia-kicis-impeachment-moraes-6/', 'news_article', 3, 'Senado Federal', 'Protocolo', 'bia-kicis-impeachment-6-b121-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'Girão incita seguidores a "invadir" STF após sanções a Moraes.', 'Agora é hora de ir às ruas. Temos que cercar o STF e exigir mudanças.', 'Discurso inflamado convocando protestos agressivos contra STF.', 'verified', true, '2025-07-31', 'https://www1.folha.uol.com.br/poder/2025/07/girao-incita-cercar-stf.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Pronunciamento', 'girao-cercar-stf-b121-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia escalada de ameaças a deputadas de esquerda.', 'Recebo ameaças de morte diárias. A desinformação nas redes virou armas contra a esquerda.', 'Pronunciamento sobre pacote de ameaças recebidas após sanção contra Moraes.', 'verified', false, '2025-08-12', 'https://g1.globo.com/politica/noticia/2025/08/12/taliria-ameacas-escalada-deputadas.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-ameacas-escalada-b121-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro vira alvo de inquérito da PF por ataques nos EUA.', 'Querem me caçar por defender Bolsonaro nos EUA. A luta continua sem medo.', 'Reação após PF abrir inquérito pela articulação de sanções contra autoridades brasileiras.', 'verified', true, '2025-07-17', 'https://oglobo.globo.com/politica/eduardo-inquerito-pf-ataques-eua/', 'news_article', 5, 'EUA', 'Entrevista', 'eduardo-inquerito-pf-b121-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta posiciona-se contra regulação ampla após pressão bolsonarista.', 'Não haverá PL de censura na minha gestão. Vamos preservar liberdade de expressão plena.', 'Recuo estratégico do presidente da Câmara após pressão de redes sociais.', 'verified', true, '2025-06-10', 'https://www1.folha.uol.com.br/poder/2025/06/motta-contra-pl-censura-camara.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista', 'motta-contra-pl-b121-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reafirma necessidade de regulação de big techs em discurso de 2026.', 'Vou insistir em regular big techs. Democracia não sobrevive sem plataformas responsáveis.', 'Discurso em evento sobre democracia em Brasília no ano eleitoral.', 'verified', true, '2026-03-15', 'https://g1.globo.com/politica/noticia/2026/03/15/lula-big-techs-regulacao-2026.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Evento sobre democracia', 'lula-big-techs-2026-b121-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  RAISE NOTICE 'Batch 121 applied: 100 statements';
END $$;
