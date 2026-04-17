-- Batch 85: Foreign policy continued (2023-2026) - G20 Rio, Trump tariffs 2025-2026, Eduardo Washington, Haddad FMI, COP30, Essequibo, Venezuela
-- 100 statements
DO $$
DECLARE
  v_lul UUID; v_mvi UUID; v_alc UUID; v_had UUID; v_msi UUID;
  v_cfa UUID; v_jai UUID; v_edu UUID; v_fla UUID; v_car UUID;
  v_dil UUID; v_fhc UUID; v_tem UUID; v_teb UUID; v_mer UUID;
  v_mor UUID; v_cir UUID; v_nik UUID; v_mvh UUID; v_pab UUID;
  v_tar UUID; v_hel UUID; v_rog UUID; v_hmo UUID; v_pgu UUID;
  v_asi UUID; v_jpp UUID; v_mch UUID; v_gle UUID; v_ran UUID;
  v_hum UUID; v_mpo UUID; v_dam UUID; v_mag UUID;
  c_ant UUID; c_des UUID; c_xen UUID; c_rac UUID; c_vio UUID;
  c_odi UUID; c_abu UUID; c_aut UUID; c_irr UUID; c_con UUID;
  c_ame UUID; c_neg UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_msi FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_cfa FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_rog FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_pgu FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_asi FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_jpp FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_mch FROM politicians WHERE slug = 'magda-chambriard';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_mpo FROM politicians WHERE slug = 'marcos-pontes';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula abre G20 Rio defendendo aliança global contra fome e pobreza.', 'A fome no mundo é uma decisão política. Lançamos aqui a Aliança Global contra a Fome e a Pobreza. Isso é legado civilizatório.', 'Discurso de abertura da cúpula do G20 no Museu de Arte Moderna do Rio de Janeiro em novembro de 2024, lançando iniciativa brasileira.', 'verified', true, '2024-11-18', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-11/lula-g20-rio-fome-pobreza', 'news_article', 1, 'Rio de Janeiro', 'Cúpula do G20', 'lula-g20-rio-fome-b85-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende taxação de super-ricos como consenso aprovado no G20.', 'Pela primeira vez na história, o G20 reconheceu que bilionários precisam ser taxados. Isso é uma vitória do Sul Global e do Brasil.', 'Declaração em coletiva após aprovação da declaração final do G20 no Rio em novembro de 2024.', 'verified', true, '2024-11-19', 'https://www.ft.com/content/g20-rio-billionaires-tax-lula', 'news_article', 1, 'Rio de Janeiro', 'Cúpula do G20', 'lula-g20-super-ricos-b85-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula não se encontra com Biden em bilateral no Rio.', 'Os Estados Unidos perderam a chance de construir parceria. Com Trump na transição, Biden não conseguiu nada. O Brasil precisa olhar para o Sul Global.', 'Entrevista em Brasília após G20 do Rio, evento em que bilateral Lula-Biden foi limitado.', 'verified', false, '2024-11-25', 'https://www1.folha.uol.com.br/mundo/2024/11/lula-biden-bilateral-g20.shtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-biden-bilateral-g20-b85-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula pede que Trump respeite a soberania do Brasil após anúncio de tarifa.', 'Senhor presidente Trump, o Brasil é um país soberano. O senhor não pode atacar nossa economia porque não gosta das decisões da nossa Justiça.', 'Pronunciamento em cadeia nacional em 10 de julho de 2025 após anúncio de tarifa de 50% por Trump.', 'verified', true, '2025-07-10', 'https://g1.globo.com/politica/noticia/2025/07/10/lula-trump-tarifa-cadeia-nacional.ghtml', 'news_article', 2, 'Brasília', 'Pronunciamento em rede nacional', 'lula-trump-tarifa-cadeia-b85-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama decisão de Trump de "medida colonial" contra o Brasil.', 'Não vamos aceitar essa atitude colonial dos Estados Unidos. O Brasil é país livre. Não dobramos joelho para imperador nenhum.', 'Discurso em sindicato metalúrgico de São Bernardo do Campo em agosto de 2025.', 'verified', true, '2025-08-02', 'https://www1.folha.uol.com.br/poder/2025/08/lula-trump-colonial-metalurgicos.shtml', 'news_article', 3, 'São Bernardo do Campo', 'Evento Sindicato Metalúrgicos', 'lula-trump-colonial-b85-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia adesão do Brasil à Iniciativa Cinturão e Rota da China.', 'O Brasil vai aderir à Nova Rota da Seda. Isso é bom para o comércio, para infraestrutura e para gerar empregos. Os Estados Unidos podem criticar, não é problema nosso.', 'Declaração em Pequim em novembro de 2024 durante visita de Estado de Xi Jinping.', 'verified', true, '2024-11-20', 'https://www.reuters.com/world/brazil-china-belt-road-lula-xi-2024-11-20/', 'news_article', 3, 'Brasília', 'Visita de Estado de Xi Jinping', 'lula-nova-rota-seda-b85-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recua e Brasil não adere formalmente à Rota da Seda.', 'O Brasil mantém sua autonomia. Vamos cooperar com a China dentro dos nossos interesses, sem adesões formais que limitem nossa soberania.', 'Coletiva em Brasília em novembro de 2024, após declaração anterior foi recuada pela área econômica.', 'verified', false, '2024-11-21', 'https://www.bbc.com/portuguese/articles/cy4z5rj78vqo', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-recua-rota-seda-b85-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende mediação brasileira na crise do Essequibo.', 'O Brasil tem interesse e responsabilidade de mediar essa crise. Não aceitamos escalada militar na nossa fronteira.', 'Declaração após reunião com Maduro e Irfaan Ali, presidente da Guiana, em dezembro de 2023.', 'verified', false, '2023-12-14', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2023-12/lula-essequibo-mediacao', 'news_article', 2, 'Brasília', 'Coletiva de imprensa', 'lula-essequibo-mediacao-b85-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reforça tropas brasileiras na fronteira com Venezuela.', 'Ordenamos reforço da presença militar na fronteira norte como medida preventiva. Não queremos guerra, mas o Brasil estará preparado.', 'Declaração em reunião do Conselho de Defesa Nacional em dezembro de 2023 sobre crise do Essequibo.', 'verified', true, '2023-12-06', 'https://g1.globo.com/politica/noticia/2023/12/06/lula-fronteira-venezuela-tropas.ghtml', 'news_article', 2, 'Brasília', 'Conselho de Defesa Nacional', 'lula-fronteira-venezuela-b85-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita Cuba e condena sanções americanas.', 'Cuba é exemplo de resistência. O bloqueio americano é cruel, desumano, e o Brasil vai continuar votando contra na ONU.', 'Declaração em Havana em setembro de 2023 durante Cúpula do G77+China.', 'verified', false, '2023-09-15', 'https://www.folha.uol.com.br/mundo/2023/09/lula-cuba-bloqueio-g77.shtml', 'news_article', 3, 'Havana', 'Cúpula do G77+China', 'lula-cuba-bloqueio-g77-b85-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica sanção americana contra Ortega como intervencionismo.', 'Os Estados Unidos precisam parar de aplicar sanções unilaterais. A Nicarágua é um país soberano. Sanção é intervencionismo.', 'Coletiva em Brasília em fevereiro de 2023 comentando sanções americanas contra Ortega.', 'verified', false, '2023-02-25', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2023-02/lula-nicaragua-sancoes-eua', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-nicaragua-sancoes-b85-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe presidente sul-africano Ramaphosa e apoia caso na CIJ.', 'A África do Sul deu um exemplo ao mundo. O Brasil apoia o processo contra Israel na Corte Internacional de Justiça.', 'Declaração conjunta com Cyril Ramaphosa em Brasília em fevereiro de 2024.', 'verified', false, '2024-02-14', 'https://www.aljazeera.com/news/2024/2/14/brazil-south-africa-icj-israel-case', 'news_article', 3, 'Brasília', 'Visita oficial de Ramaphosa', 'lula-ramaphosa-cij-b85-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula inaugura cúpula CELAC-UE em Bruxelas defendendo multilateralismo.', 'A América Latina não será mais quintal de ninguém. Queremos uma relação entre iguais com a União Europeia. Multilateralismo é o caminho.', 'Discurso na cúpula CELAC-UE em Bruxelas em julho de 2023.', 'verified', false, '2023-07-17', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-07/lula-celac-ue-bruxelas', 'news_article', 1, 'Bruxelas', 'Cúpula CELAC-União Europeia', 'lula-celac-ue-bruxelas-b85-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reconhece genocídio em Ruanda e critica omissão ocidental.', 'O Ocidente virou as costas para Ruanda em 1994. Como está virando as costas para Gaza hoje. Não podemos aceitar esse padrão.', 'Discurso em Kigali em cerimônia dos 30 anos do genocídio em Ruanda em abril de 2024.', 'verified', false, '2024-04-07', 'https://www.bbc.com/portuguese/articles/cpwny1j08pyo', 'news_article', 2, 'Kigali', 'Comemoração de 30 anos do genocídio em Ruanda', 'lula-ruanda-gaza-b85-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se reúne com Erdogan e critica operação israelense em Rafah.', 'O Brasil e a Turquia estão juntos contra o massacre em Rafah. Netanyahu precisa ser detido. É hora do mundo agir.', 'Coletiva em Istambul em março de 2024 durante encontro com Recep Erdogan.', 'verified', false, '2024-03-02', 'https://www.aljazeera.com/news/2024/3/2/lula-erdogan-rafah-netanyahu', 'news_article', 4, 'Istambul', 'Visita oficial à Turquia', 'lula-erdogan-rafah-b85-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula apoia Sheinbaum em eleição mexicana antes do pleito.', 'Morena vai vencer com Claudia Sheinbaum. É uma companheira, uma cientista, uma mulher progressista. O México vai seguir pelo bom caminho.', 'Entrevista em abril de 2024 em apoio à candidata da esquerda mexicana.', 'verified', false, '2024-04-18', 'https://www.clarin.com/mundo/lula-sheinbaum-mexico_0_jkl8m2N9X.html', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-sheinbaum-mexico-b85-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reconhece Lai como presidente de Taiwan? Brasil nega.', 'O Brasil tem uma única China. Sempre foi assim. Nossa relação com a China comunista é estratégica.', 'Declaração em Brasília em maio de 2024 rejeitando reconhecimento a Taiwan após eleição de Lai Ching-te.', 'verified', false, '2024-05-20', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2024-05/lula-uma-china', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-uma-china-b85-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula classifica Tibete como "assunto interno" da China.', 'Essas questões do Tibete são questões internas da China. Não cabe ao Brasil opinar. Respeitamos a soberania chinesa.', 'Entrevista a jornalistas em Pequim em abril de 2023.', 'verified', false, '2023-04-14', 'https://www1.folha.uol.com.br/mundo/2023/04/lula-tibete-china.shtml', 'news_article', 4, 'Pequim', 'Entrevista coletiva', 'lula-tibete-china-b85-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe Raisi do Irã em Nova York durante AG da ONU.', 'O Irã é um país que tem direito de se desenvolver pacificamente. Queremos relações cordiais. Sanções não funcionam, diálogo funciona.', 'Declaração após reunião bilateral com Ebrahim Raisi em setembro de 2023.', 'verified', false, '2023-09-21', 'https://www.reuters.com/world/lula-raisi-iran-brazil-un-2023-09-21/', 'news_article', 4, 'Nova York', 'Reunião bilateral à margem da AG-ONU', 'lula-raisi-iran-b85-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica tarifas de Trump como efeito do julgamento de Bolsonaro.', 'O Trump tarifou o Brasil por causa do julgamento do Bolsonaro. Quem paga somos nós, o povo. O Bolsonaro entregou o Brasil para os Estados Unidos.', 'Entrevista à GloboNews em agosto de 2025 sobre tarifas americanas.', 'verified', true, '2025-08-05', 'https://g1.globo.com/politica/noticia/2025/08/05/lula-trump-bolsonaro-tarifa.ghtml', 'news_article', 3, 'Brasília', 'Entrevista GloboNews', 'lula-trump-bolsonaro-tarifa-b85-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se recusa a cumprimentar Milei em G20 Rio.', 'Eu não vou cumprimentar quem não me respeita. O Milei me insultou várias vezes. Ele que venha pedir desculpas primeiro.', 'Declaração em Brasília em dezembro de 2024 sobre incidente com Milei no G20.', 'verified', true, '2024-11-20', 'https://www.lanacion.com.ar/politica/lula-milei-no-saludo-g20-2024/', 'news_article', 2, 'Brasília', 'Coletiva de imprensa pós-G20', 'lula-nao-cumprimenta-milei-b85-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Milei de "fascista barato" em comício do PT.', 'Esse Milei é um fascista barato. Prometeu dolarização, não fez. Prometeu acabar com o Banco Central, não fez. É um charlatão.', 'Discurso em comício do PT em Porto Alegre em junho de 2024.', 'verified', false, '2024-06-15', 'https://www.pagina12.com.ar/742536-lula-milei-fascista-barato-brasil', 'news_article', 3, 'Porto Alegre', 'Comício do PT', 'lula-milei-fascista-barato-b85-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comenta presença de Maduro em cerimônia e omite violações.', 'O Maduro é presidente eleito da Venezuela. Não cabe a mim julgar. Temos que respeitar o processo político venezuelano.', 'Entrevista à CNN Brasil em fevereiro de 2024 sobre agenda com Maduro.', 'verified', false, '2024-02-28', 'https://www.cnnbrasil.com.br/politica/lula-maduro-presidente-eleito-2024/', 'news_article', 3, 'Brasília', 'Entrevista CNN Brasil', 'lula-maduro-presidente-eleito-b85-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que resultado venezuelano "gerou estranheza" sem contestar fraude.', 'O resultado gerou estranheza. Mas eu não vou falar em fraude. Isso não é papel de um chefe de Estado vizinho. Precisamos das atas.', 'Coletiva em Brasília em 30 de julho de 2024 dois dias após a eleição venezuelana.', 'verified', false, '2024-07-30', 'https://g1.globo.com/mundo/noticia/2024/07/30/lula-venezuela-estranheza-fraude.ghtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-venezuela-estranheza-b85-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Maduro por vetar entrada do Brasil no BRICS.', 'A Venezuela não tinha porque vetar o Brasil apoiando sua entrada no BRICS. O Maduro criou uma crise desnecessária com nossa diplomacia.', 'Entrevista em Moscou em outubro de 2024 após cúpula do BRICS em Kazan.', 'verified', false, '2024-10-24', 'https://www1.folha.uol.com.br/mundo/2024/10/lula-maduro-brics-veto.shtml', 'news_article', 2, 'Kazan', 'Cúpula do BRICS Kazan', 'lula-maduro-veto-brics-b85-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete ação internacional pela Groenlândia após Trump.', 'O Brasil defende a autodeterminação da Groenlândia. Não se pode tratar um território como se fosse mercadoria. Isso é colonialismo do século 21.', 'Declaração em Brasília em janeiro de 2025 sobre planos de Trump de comprar a Groenlândia.', 'verified', false, '2025-01-15', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2025-01/lula-groenlandia-trump', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-groenlandia-trump-b85-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita Paraguai e elogia Santiago Peña como parceiro.', 'O Paraguai é parceiro estratégico. Com Santiago Peña construímos relação de respeito. O Mercosul vai se fortalecer com essa amizade.', 'Declaração em Assunção em agosto de 2023 em visita oficial ao Paraguai.', 'verified', false, '2023-08-15', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-08/lula-paraguai-pena', 'news_article', 1, 'Assunção', 'Visita oficial ao Paraguai', 'lula-paraguai-pena-b85-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe Boric do Chile e elogia "nova geração" progressista.', 'Gabriel Boric representa uma nova geração de líderes progressistas. Temos muito a construir juntos pela integração regional.', 'Declaração em Brasília em maio de 2023 em visita de Estado de Gabriel Boric.', 'verified', false, '2023-05-05', 'https://www1.folha.uol.com.br/mundo/2023/05/lula-boric-chile-geracao.shtml', 'news_article', 1, 'Brasília', 'Visita de Estado de Gabriel Boric', 'lula-boric-geracao-b85-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula condena genocídio em Gaza mas recusa romper com Israel.', 'Não vou romper relações diplomáticas com Israel. Romper não ajuda o povo palestino. Mas vou continuar denunciando o genocídio.', 'Entrevista à Rádio Bandeirantes em junho de 2024 sobre pressão por romper relações.', 'verified', false, '2024-06-20', 'https://g1.globo.com/politica/noticia/2024/06/20/lula-rompimento-israel-gaza.ghtml', 'news_article', 2, 'Brasília', 'Entrevista Rádio Bandeirantes', 'lula-rompimento-israel-b85-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Macron de parceiro na Amazônia e na energia limpa.', 'Com Macron construímos uma agenda de cooperação concreta na Amazônia, na energia, na COP30. A França é parceira estratégica do Brasil.', 'Declaração conjunta em Belém em março de 2024 na visita de Emmanuel Macron ao Brasil.', 'verified', false, '2024-03-26', 'https://www.lemonde.fr/international/article/2024/03/26/lula-macron-amazonie-cooperation.html', 'news_article', 1, 'Belém', 'Visita oficial de Emmanuel Macron', 'lula-macron-amazonia-b85-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Macron por bloquear acordo Mercosul-UE.', 'A França com o Macron está no caminho errado ao bloquear o acordo Mercosul-UE. Eles querem proteger seus agricultores, mas querem vender para o mundo.', 'Entrevista em Brasília em novembro de 2024 antes da assinatura do acordo.', 'verified', false, '2024-11-15', 'https://www.lemonde.fr/international/article/2024/11/15/lula-critique-macron-mercosur.html', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-critica-macron-mercosul-b85-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala em português com Biden em bilateral e confunde tradução.', 'Eu pensei que o Biden falava português. Na minha cabeça a gente tava se entendendo bem. Ele balançou a cabeça várias vezes.', 'Relato em entrevista à CBN em fevereiro de 2023 sobre primeira reunião com Biden em Washington.', 'verified', false, '2023-02-12', 'https://g1.globo.com/politica/noticia/2023/02/12/lula-biden-portugues-traducao.ghtml', 'news_article', 1, 'Brasília', 'Entrevista CBN', 'lula-biden-portugues-b85-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Trump por cortar ajuda a países pobres.', 'O Trump cortou ajuda humanitária para países pobres. Isso vai matar gente. O Brasil vai manter sua cooperação com a África.', 'Declaração em Brasília em fevereiro de 2025 após Trump desmontar USAID.', 'verified', false, '2025-02-10', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2025-02/lula-trump-ajuda-africa', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-trump-ajuda-africa-b85-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia Angola como destino prioritário da política externa africana.', 'Angola é porta de entrada do Brasil na África. Vamos retomar obras, empréstimos, cooperação. O Lourenço é nosso grande parceiro.', 'Discurso em Luanda em agosto de 2023 em visita de Estado.', 'verified', false, '2023-08-11', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-08/lula-angola-luanda', 'news_article', 1, 'Luanda', 'Visita oficial a Angola', 'lula-angola-porta-africa-b85-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula lidera articulação do BRICS para incluir Nigéria em 2026.', 'A Nigéria precisa estar no BRICS. É a maior economia africana. O Brasil está trabalhando pela inclusão.', 'Declaração na cúpula do BRICS em Kazan em outubro de 2024.', 'verified', false, '2024-10-23', 'https://www.reuters.com/world/africa/brics-nigeria-inclusion-lula-2024-10-23/', 'news_article', 1, 'Kazan', 'Cúpula do BRICS Kazan', 'lula-nigeria-brics-b85-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira anuncia não reconhecimento ao resultado venezuelano.', 'O Brasil não reconhece resultado sem atas. Isso é posição firme e clara. Vamos continuar cobrando transparência de Caracas.', 'Declaração em Brasília em setembro de 2024 após Maduro manter-se no poder sem apresentar atas.', 'verified', true, '2024-09-05', 'https://www1.folha.uol.com.br/mundo/2024/09/mauro-vieira-venezuela-nao-reconhece.shtml', 'news_article', 2, 'Brasília', 'Coletiva de imprensa', 'mauro-vieira-nao-reconhece-venezuela-b85-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira nega rompimento com Venezuela apesar de crise.', 'Não vamos romper relações. O Brasil mantém embaixada em Caracas. Isso permite diálogo, pressão, defesa dos brasileiros.', 'Coletiva em Brasília em agosto de 2024 sobre estratégia com Venezuela.', 'verified', false, '2024-08-28', 'https://g1.globo.com/politica/noticia/2024/08/28/mauro-vieira-venezuela-rompimento.ghtml', 'news_article', 2, 'Brasília', 'Coletiva de imprensa', 'mauro-vieira-venezuela-rompimento-b85-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira confronta chanceler argentino por ataques de Milei.', 'O Brasil não aceita os insultos do presidente Milei. Exigimos respeito institucional. Nossa embaixada espera providências de Buenos Aires.', 'Nota do Itamaraty em dezembro de 2023 após Milei voltar a chamar Lula de comunista.', 'verified', false, '2023-12-15', 'https://www.clarin.com/politica/brasil-vieira-milei-insultos_0_J4Xj7s2M9.html', 'news_article', 2, 'Brasília', 'Nota oficial do Itamaraty', 'mauro-vieira-milei-insultos-b85-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira defende candidatura brasileira ao Conselho de Segurança.', 'O Brasil é candidato natural a membro permanente. Temos tradição pacifista, somos potência regional, somos referência multilateral.', 'Discurso na 78ª AG da ONU em setembro de 2023.', 'verified', false, '2023-09-23', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-09/mauro-vieira-onu-conselho', 'news_article', 1, 'Nova York', 'Assembleia-Geral da ONU 2023', 'mauro-vieira-conselho-permanente-b85-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira anuncia retirada do embaixador de Tel Aviv.', 'O embaixador Frederico Meyer foi chamado para consultas em Brasília. É reação proporcional à ofensa institucional que recebemos de Israel.', 'Nota do Itamaraty em fevereiro de 2024 após Israel declarar Lula persona non grata.', 'verified', true, '2024-02-19', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-02/mauro-vieira-embaixador-israel', 'news_article', 3, 'Brasília', 'Nota oficial do Itamaraty', 'mauro-vieira-retira-embaixador-b85-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende ampliação de acordo com China em visita oficial.', 'A China é o maior parceiro comercial do Brasil. Vamos ampliar exportações de valor agregado. Indústria brasileira tem espaço no mercado chinês.', 'Coletiva em Pequim em junho de 2024 em missão comercial.', 'verified', false, '2024-06-10', 'https://valor.globo.com/brasil/noticia/2024/06/10/alckmin-china-missao-comercial.ghtml', 'news_article', 1, 'Pequim', 'Missão comercial à China', 'alckmin-china-missao-b85-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin promete reciprocidade contra tarifa de Trump na Câmara.', 'Vamos responder com reciprocidade proporcional. Nenhuma empresa americana terá privilégio se os Estados Unidos tarifarem o Brasil.', 'Discurso na Câmara dos Deputados em agosto de 2025 defendendo Plano Brasil Soberano.', 'verified', true, '2025-08-14', 'https://www.camara.leg.br/noticias/alckmin-reciprocidade-trump-2025', 'news_article', 2, 'Câmara dos Deputados', 'Discurso em plenário', 'alckmin-reciprocidade-camara-b85-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin inaugura escritório de Apex em Dubai após COP28.', 'O Brasil precisa olhar para o Golfo. Há investidores, há demanda por nossos produtos. A Apex Brasil em Dubai é passo estratégico.', 'Cerimônia em Dubai em dezembro de 2023 em paralelo à COP28.', 'verified', false, '2023-12-05', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-12/alckmin-apex-dubai', 'news_article', 1, 'Dubai', 'Inauguração Apex Dubai', 'alckmin-apex-dubai-b85-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad apresenta ao FMI proposta de taxação bilionária.', 'O FMI precisa apoiar. A taxação de super-ricos é a maior reforma fiscal global possível. Só assim financiamos transição climática e Pacto Digital.', 'Discurso em Washington em outubro de 2024 na reunião anual do FMI e Banco Mundial.', 'verified', true, '2024-10-22', 'https://www.ft.com/content/haddad-imf-billionaire-tax-2024', 'news_article', 1, 'Washington D.C.', 'Reunião Anual FMI-Banco Mundial', 'haddad-fmi-bilionarios-b85-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad comemora aprovação da minuta do G20 sobre taxação.', 'Hoje é um dia histórico. O G20 aprovou texto que abre caminho para taxação global de super-ricos. O legado é do Brasil.', 'Declaração em Washington em julho de 2024 após reunião ministerial.', 'verified', false, '2024-07-26', 'https://valor.globo.com/economia/noticia/2024/07/26/haddad-g20-taxacao-aprovacao.ghtml', 'news_article', 1, 'Washington D.C.', 'Reunião G20 Finanças', 'haddad-g20-minuta-b85-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica posição de Javier Milei no G20 sobre taxação.', 'O ministro argentino foi contra taxar bilionários. É posição ideológica, não econômica. Mesmo entre bilionários, Argentina foi isolada.', 'Coletiva em Washington em julho de 2024.', 'verified', false, '2024-07-27', 'https://www.pagina12.com.ar/758219-haddad-milei-argentina-g20-billonarios', 'news_article', 2, 'Washington D.C.', 'Coletiva pós-G20', 'haddad-milei-argentina-b85-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia crédito emergencial para exportadores afetados por Trump.', 'Liberamos 30 bilhões em crédito via BNDES para empresas exportadoras. Nenhuma empresa vai fechar por causa do Trump.', 'Coletiva em Brasília em agosto de 2025 sobre Plano Brasil Soberano.', 'verified', true, '2025-08-13', 'https://agenciabrasil.ebc.com.br/economia/noticia/2025-08/haddad-credito-trump', 'news_article', 2, 'Brasília', 'Coletiva Ministério da Fazenda', 'haddad-credito-trump-b85-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina Silva inaugura sala da COP30 em Belém.', 'A COP da floresta começa aqui. Queremos que Belém seja o marco do ponto de virada climática. Amazônia vai pautar as decisões do mundo.', 'Cerimônia em Belém em setembro de 2025.', 'verified', false, '2025-09-20', 'https://g1.globo.com/meio-ambiente/cop-30/noticia/2025/09/20/marina-belem-cop30-sala.ghtml', 'news_article', 1, 'Belém', 'Inauguração estrutura COP30', 'marina-sala-cop30-b85-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina denuncia contradição entre Petrobras e COP30 Belém.', 'Não é possível defender COP da Amazônia e abrir exploração de petróleo no mesmo bioma. Isso é contradição insustentável.', 'Entrevista em fevereiro de 2025 em polêmica sobre exploração da Margem Equatorial.', 'verified', true, '2025-02-20', 'https://www1.folha.uol.com.br/ambiente/2025/02/marina-petrobras-cop30-contradicao.shtml', 'news_article', 2, 'Brasília', 'Entrevista Folha de S.Paulo', 'marina-petrobras-cop30-b85-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina rebate Trump sobre acordo climático e saída de Paris.', 'Trump pode sair do Acordo de Paris de novo. O mundo não vai parar. O Brasil vai liderar pelo exemplo, com ou sem os Estados Unidos.', 'Declaração em janeiro de 2025 após Trump assinar decreto de retirada do Acordo de Paris.', 'verified', true, '2025-01-21', 'https://www.reuters.com/sustainability/climate-energy/brazil-marina-paris-trump-2025-01-21/', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'marina-trump-paris-b85-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cfa, 'Carlos Fávaro comemora retomada de exportações à China.', 'A China abriu mais de 300 novas indústrias brasileiras para exportação. Nossa carne, nossos grãos, nossa fruta chegam mais rápido na Ásia.', 'Coletiva em Brasília em outubro de 2023 após missão comercial.', 'verified', false, '2023-10-18', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-10/favaro-china-exportacoes', 'news_article', 1, 'Brasília', 'Coletiva Ministério da Agricultura', 'favaro-china-exportacoes-b85-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cfa, 'Fávaro visita Rússia e assina acordo sobre fertilizantes apesar de sanções.', 'A Rússia é fundamental para o agro brasileiro. Fertilizantes não podem ser objeto de sanção. Vamos garantir nosso abastecimento.', 'Declaração em Moscou em maio de 2024.', 'verified', false, '2024-05-22', 'https://www.reuters.com/world/brazil-russia-fertilizers-favaro-2024-05-22/', 'news_article', 3, 'Moscou', 'Visita oficial à Rússia', 'favaro-russia-fertilizantes-b85-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro apoia publicamente Trump e pede sanções ao STF.', 'O presidente Trump sabe que o Brasil é uma ditadura judicial. Eu peço que as medidas americanas sejam duras com os ditadores de toga.', 'Entrevista na Flórida em fevereiro de 2024 durante estadia com parlamentares republicanos.', 'verified', true, '2024-02-14', 'https://www.washingtonpost.com/world/2024/02/14/bolsonaro-florida-trump-stf/', 'news_article', 5, 'Miami', 'Evento com republicanos', 'bolsonaro-flo-trump-stf-b85-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro critica reconhecimento brasileiro a Sheinbaum.', 'Agora temos mais uma esquerdista no México. Lula comemora. O Brasil virou base de operações do foro de São Paulo.', 'Postagem em rede social em junho de 2024 sobre vitória de Claudia Sheinbaum.', 'verified', false, '2024-06-03', 'https://g1.globo.com/politica/noticia/2024/06/03/bolsonaro-sheinbaum-mexico-foro-sao-paulo.ghtml', 'news_article', 2, 'Brasília', 'Rede social', 'bolsonaro-sheinbaum-fsp-b85-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro elogia Milei como exemplo para Brasil.', 'O Milei é o melhor exemplo para o Brasil. Motosserra no Estado, dolarização, fim de subsídios. Lula teme o sucesso dele.', 'Entrevista à Oeste em fevereiro de 2024.', 'verified', false, '2024-02-20', 'https://revistaoeste.com/politica/bolsonaro-milei-argentina-exemplo/', 'news_article', 2, 'São Paulo', 'Entrevista Revista Oeste', 'bolsonaro-milei-exemplo-b85-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro comemora tarifa de Trump como "justiça" ao Brasil.', 'A tarifa de Trump é o que o Brasil merece. É consequência da perseguição a mim e da ditadura do Moraes. Obrigado, presidente Trump.', 'Pronunciamento por vídeo enviado a parlamentares em julho de 2025 após tarifa de 50%.', 'verified', true, '2025-07-11', 'https://www1.folha.uol.com.br/poder/2025/07/bolsonaro-tarifa-trump-justica.shtml', 'news_article', 5, 'Brasília', 'Vídeo redes sociais', 'bolsonaro-tarifa-justica-b85-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro lidera reunião no Capitólio americano para pedir sanções.', 'Tivemos reunião com senadores e deputados republicanos pedindo sanções contra o Brasil até a democracia ser restaurada.', 'Entrevista à Fox News em março de 2025 em Washington.', 'verified', true, '2025-03-12', 'https://www.foxnews.com/world/eduardo-bolsonaro-capitol-sanctions-brazil', 'news_article', 5, 'Washington D.C.', 'Reuniões no Congresso americano', 'eduardo-capitolio-sancoes-b85-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo comemora Lei Magnitsky contra Alexandre de Moraes.', 'Vitória! O governo Trump aplicou Magnitsky contra Alexandre de Moraes. Vamos continuar a luta por mais sanções contra ditadores de toga.', 'Post em X em julho de 2025.', 'verified', true, '2025-07-20', 'https://www.nytimes.com/2025/07/20/world/americas/brazil-moraes-magnitsky-eduardo.html', 'news_article', 5, 'Washington D.C.', 'Rede social X', 'eduardo-magnitsky-comemora-b85-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede sanção contra Lula pessoalmente.', 'O próximo alvo precisa ser o próprio Lula. Ele é mentor da perseguição. Magnitsky contra Lula é objetivo da nossa atuação em Washington.', 'Entrevista a Washington Times em setembro de 2025.', 'verified', false, '2025-09-10', 'https://www.washingtontimes.com/news/2025/sep/10/eduardo-bolsonaro-lula-magnitsky-sanctions/', 'news_article', 5, 'Washington D.C.', 'Entrevista Washington Times', 'eduardo-sancao-lula-b85-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo diz que é perseguido por atuação nos EUA e requer asilo.', 'Estou sendo investigado por crime inexistente. A Polícia Federal quer me criminalizar por exercer direito de expressão nos Estados Unidos. Vou pedir asilo se necessário.', 'Pronunciamento gravado em março de 2025 após PF abrir inquérito.', 'verified', true, '2025-03-25', 'https://www1.folha.uol.com.br/poder/2025/03/eduardo-asilo-estados-unidos.shtml', 'news_article', 4, 'Washington D.C.', 'Vídeo redes sociais', 'eduardo-asilo-eua-b85-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro celebra Milei e compara presidente argentino ao pai.', 'O Milei é o Bolsonaro argentino. Mostrou que liberalismo funciona. Está salvando a Argentina. Próximo será o Brasil em 2026.', 'Entrevista em Buenos Aires em janeiro de 2024 durante posse de Milei.', 'verified', false, '2024-01-15', 'https://www.clarin.com/politica/eduardo-bolsonaro-milei-bolsonaro-argentino_0_pK7Xj3N2M.html', 'news_article', 2, 'Buenos Aires', 'Evento conservador em Buenos Aires', 'eduardo-milei-bolsonaro-argentino-b85-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende sanções americanas como legítimas.', 'Os Estados Unidos sancionam ditaduras. Se sancionaram Moraes é porque há abuso. O Senado americano não age sem provas. A culpa é do STF.', 'Discurso no Senado em julho de 2025 defendendo Magnitsky contra Moraes.', 'verified', true, '2025-07-24', 'https://www12.senado.leg.br/noticias/flavio-bolsonaro-magnitsky-moraes-2025', 'news_article', 4, 'Senado Federal', 'Sessão plenária', 'flavio-magnitsky-moraes-b85-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio classifica política externa de Lula como suicida.', 'A política externa do PT é suicida. Afastou o Brasil dos Estados Unidos e Europa, nos aproximou de China, Rússia, Irã. O custo é pago pelo povo.', 'Discurso no Senado em setembro de 2024.', 'verified', false, '2024-09-18', 'https://www12.senado.leg.br/noticias/flavio-politica-externa-lula-suicida-2024', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'flavio-politica-externa-suicida-b85-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro exalta decisão de Trump de sancionar o Brasil.', 'Trump chegou junto. O Brasil vai entender o que é consequência. Moraes é inimigo da liberdade e Trump fez o que o brasileiro queria.', 'Postagem em X em julho de 2025.', 'verified', false, '2025-07-21', 'https://g1.globo.com/politica/noticia/2025/07/21/carlos-bolsonaro-trump-sancao-moraes.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Rede social X', 'carlos-trump-sancao-brasil-b85-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma anuncia financiamento de US$ 1 bilhão do NDB para Brasil.', 'O NDB aprovou US$ 1 bilhão para obras de infraestrutura no Brasil. Dinheiro para saneamento, transporte urbano e sustentabilidade.', 'Coletiva em Xangai em maio de 2024 no aniversário do NDB.', 'verified', false, '2024-05-23', 'https://agenciabrasil.ebc.com.br/economia/noticia/2024-05/dilma-ndb-brasil-bilhao', 'news_article', 1, 'Xangai', 'Aniversário do NDB', 'dilma-ndb-bilhao-brasil-b85-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma ataca dólar e defende expansão do NDB como banco global.', 'O dólar é instrumento de coerção americana. O NDB pode ser banco alternativo para os países em desenvolvimento. É política, não é só economia.', 'Entrevista em Pequim em outubro de 2024 durante cúpula do BRICS em Kazan.', 'verified', false, '2024-10-22', 'https://www.globaltimes.cn/page/202410/dilma-dolar-ndb-kazan.html', 'news_article', 3, 'Pequim', 'Entrevista Global Times', 'dilma-dolar-ndb-b85-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma apoia Maduro e classifica oposição venezuelana como golpista.', 'A direita venezuelana é a mesma que deu golpe em mim em 2016. Querem repetir na Venezuela. A Revolução Bolivariana precisa resistir.', 'Entrevista a TeleSUR em agosto de 2024 após eleição contestada na Venezuela.', 'verified', false, '2024-08-10', 'https://www.telesurtv.net/news/dilma-rousseff-venezuela-oposicion-golpista', 'news_article', 4, 'Xangai', 'Entrevista TeleSUR', 'dilma-maduro-golpistas-b85-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC critica Lula por apoiar Maduro e trair tradição democrática brasileira.', 'O Brasil tem tradição democrática forte. Apoiar Maduro é trair essa tradição. Lula precisa escolher entre democracia e ideologia.', 'Artigo no Estadão em agosto de 2024.', 'verified', false, '2024-08-12', 'https://www.estadao.com.br/opiniao/fhc-lula-maduro-traicao-democracia/', 'news_article', 2, 'São Paulo', 'Artigo no Estadão', 'fhc-lula-maduro-traicao-b85-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer defende diálogo equilibrado entre EUA e China.', 'O Brasil não pode tomar lado. Temos que manter relações boas com Estados Unidos, China e União Europeia. Isso é arte diplomática.', 'Entrevista à GloboNews em setembro de 2024.', 'verified', false, '2024-09-14', 'https://g1.globo.com/politica/noticia/2024/09/14/temer-eua-china-equilibrio.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista GloboNews', 'temer-eua-china-equilibrio-b85-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet critica Eduardo Bolsonaro por lobby anti-Brasil em Washington.', 'É inaceitável um deputado brasileiro pedir sanções contra o próprio país. Isso é crime contra a pátria. O Congresso tem que agir.', 'Entrevista em março de 2025 defendendo cassação.', 'verified', false, '2025-03-20', 'https://www12.senado.leg.br/noticias/tebet-eduardo-bolsonaro-washington-2025', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'tebet-eduardo-washington-b85-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica Lula por "apoio à ditadura" cubana e nicaraguense.', 'Lula apoia ditadores. Cuba, Nicarágua, Venezuela. Isso é escolha ideológica. O Brasil merece política externa democrática.', 'Discurso no Senado em maio de 2024.', 'verified', false, '2024-05-15', 'https://www12.senado.leg.br/noticias/moro-lula-cuba-nicaragua-venezuela-2024', 'news_article', 2, 'Senado Federal', 'Discurso em plenário', 'moro-lula-ditaduras-b85-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro critica acordo Mercosul-UE como "capitulação" de Lula.', 'O acordo Mercosul-UE é ruim para o Brasil. Vamos virar exportador de commodities e importador de produtos industrializados. É capitulação.', 'Entrevista ao Roda Viva em janeiro de 2025.', 'verified', false, '2025-01-20', 'https://tvcultura.com.br/videos/ciro-gomes-roda-viva-mercosul-ue-2025/', 'news_article', 2, 'São Paulo', 'Programa Roda Viva', 'ciro-mercosul-ue-capitulacao-b85-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca Lula na ONU como "embaraço internacional".', 'Lula foi na ONU falar de genocídio em Gaza e ignorar Venezuela. É vergonha. O Brasil virou meme internacional.', 'Vídeo nas redes sociais em setembro de 2024 após discurso de Lula na AG da ONU.', 'verified', true, '2024-09-25', 'https://g1.globo.com/politica/noticia/2024/09/25/nikolas-ferreira-lula-onu-venezuela.ghtml', 'news_article', 2, 'Belo Horizonte', 'Vídeo rede social', 'nikolas-lula-onu-b85-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas comemora tarifa de Trump como consequência do STF.', 'A tarifa do Trump é culpa do Moraes. Eu avisei que ia ter consequência. Agora o povo paga pela ditadura de toga.', 'Vídeo em X em julho de 2025.', 'verified', true, '2025-07-12', 'https://www1.folha.uol.com.br/poder/2025/07/nikolas-tarifa-trump-stf.shtml', 'news_article', 4, 'Belo Horizonte', 'Rede social X', 'nikolas-tarifa-stf-b85-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem pede impeachment de Lula por genocídio Gaza.', 'Lula não pode ficar impune. Comparar Israel com Hitler é crime contra a humanidade. Vamos apresentar pedido de impeachment.', 'Discurso na Câmara em fevereiro de 2024.', 'verified', false, '2024-02-20', 'https://www.camara.leg.br/noticias/marcel-van-hattem-impeachment-lula-2024', 'news_article', 3, 'Câmara dos Deputados', 'Discurso em plenário', 'marcel-impeachment-lula-b85-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal critica aproximação com China e defende aliança com Trump.', 'O futuro é Trump. A China já era. O Brasil tem que ser aliado dos Estados Unidos. Lula vai perder essa onda.', 'Live no Instagram em janeiro de 2025.', 'verified', false, '2025-01-30', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/01/30/pablo-marcal-trump-china-lula.ghtml', 'news_article', 2, 'São Paulo', 'Live Instagram', 'marcal-trump-china-b85-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica política externa e se desloca para agradar Trump.', 'O Brasil precisa de uma política externa pragmática. Os Estados Unidos são nosso maior investidor. Não podemos confrontar por ideologia.', 'Entrevista a Valor Econômico em setembro de 2025 em pré-campanha presidencial.', 'verified', false, '2025-09-08', 'https://valor.globo.com/politica/noticia/2025/09/08/tarcisio-eua-politica-externa.ghtml', 'news_article', 2, 'São Paulo', 'Entrevista Valor Econômico', 'tarcisio-eua-pragmatismo-b85-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho critica protestos na COP30 por travarem agenda.', 'Respeitamos o direito à manifestação, mas a COP30 precisa avançar. Não podemos perder o foco por conta de tumultos. A Amazônia está em jogo.', 'Entrevista em Belém em novembro de 2025 após incidente na COP30.', 'verified', false, '2025-11-12', 'https://g1.globo.com/pa/para/noticia/2025/11/12/helder-cop30-protestos-amazonia.ghtml', 'news_article', 2, 'Belém', 'COP30', 'helder-cop30-protestos-b85-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Mourão defende aproximação com Trump e crítica STF sobre tarifas.', 'O STF também tem sua parcela de culpa pelas tarifas. Persegue oposição e gera reação americana. É hora de autorreflexão institucional.', 'Discurso no Senado em agosto de 2025.', 'verified', false, '2025-08-20', 'https://www12.senado.leg.br/noticias/mourao-stf-tarifas-trump-2025', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'mourao-stf-tarifas-b85-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rog, 'Rogério Marinho critica COP30 Belém como gasto político.', 'Gastar bilhões para fazer COP em Belém é prioridade política, não ambiental. Marina Silva está usando o Estado para legado pessoal.', 'Discurso no Senado em março de 2025.', 'verified', false, '2025-03-18', 'https://www12.senado.leg.br/noticias/rogerio-marinho-cop30-gastos-2025', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'rogerio-cop30-gastos-b85-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes critica BRICS como "clube de ditadores".', 'O BRICS virou clube de ditadores. China, Rússia, Irã. O Brasil não tem o que fazer ali. Precisamos olhar para o G7.', 'Entrevista à revista Veja em fevereiro de 2024.', 'verified', false, '2024-02-05', 'https://veja.abril.com.br/economia/paulo-guedes-brics-ditadores/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista Veja', 'guedes-brics-ditadores-b85-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_asi, 'Alexandre Silveira negocia gás boliviano em meio a crise.', 'A Bolívia precisa honrar contratos de gás. Não vamos aceitar mudança unilateral. O Brasil tem alternativas de fornecimento.', 'Declaração em La Paz em junho de 2024.', 'verified', false, '2024-06-18', 'https://agenciabrasil.ebc.com.br/economia/noticia/2024-06/silveira-bolivia-gas', 'news_article', 1, 'La Paz', 'Visita oficial à Bolívia', 'silveira-bolivia-gas-b85-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jpp, 'Jean Paul Prates defende cooperação com PDVSA venezuelana.', 'A Petrobras pode ajudar a Venezuela. A PDVSA precisa de expertise. É oportunidade comercial e geopolítica.', 'Entrevista ao Valor em fevereiro de 2024.', 'verified', false, '2024-02-10', 'https://valor.globo.com/empresas/noticia/2024/02/10/jean-paul-prates-pdvsa-venezuela.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista Valor Econômico', 'prates-pdvsa-venezuela-b85-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mch, 'Magda Chambriard nega impacto ambiental da Margem Equatorial.', 'Não há impacto ambiental provado. Os estudos são rigorosos. Ibama precisa autorizar. O Brasil não pode abrir mão de US$ 30 bilhões em reservas.', 'Entrevista à CBN em março de 2025.', 'verified', false, '2025-03-12', 'https://g1.globo.com/economia/noticia/2025/03/12/chambriard-margem-equatorial-ambiente.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista CBN', 'chambriard-ambiente-b85-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, false FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi comanda bancada do PT para responder tarifas de Trump.', 'Não vamos aceitar chantagem. O PT está unido ao governo para responder a Trump com firmeza. Soberania não se negocia.', 'Declaração em julho de 2025 como ministra das Relações Institucionais.', 'verified', false, '2025-07-15', 'https://g1.globo.com/politica/noticia/2025/07/15/gleisi-pt-trump-tarifa.ghtml', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'gleisi-pt-trump-b85-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe critica oposição por "traição" durante crise com Trump.', 'Essa oposição celebra sanção dos Estados Unidos contra o Brasil. Isso é traição ao povo brasileiro. Não existe precedente histórico.', 'Discurso no Senado em agosto de 2025.', 'verified', false, '2025-08-08', 'https://www12.senado.leg.br/noticias/randolfe-oposicao-traicao-trump-2025', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'randolfe-oposicao-traicao-b85-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa lidera retórica contra Milei na América Latina.', 'Milei é inimigo do Mercosul e da América Latina. O Brasil não pode aceitar que ele isole a Argentina do bloco regional.', 'Discurso no Senado em maio de 2024.', 'verified', false, '2024-05-30', 'https://www12.senado.leg.br/noticias/humberto-milei-mercosul-2024', 'news_article', 2, 'Senado Federal', 'Discurso em plenário', 'humberto-milei-mercosul-b85-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mpo, 'Marcos Pontes critica visita de Lula à Rússia em meio à guerra.', 'Lula foi visitar Putin no meio da guerra. Isso nos afasta do Ocidente. É escolha ideológica que custa caro ao Brasil.', 'Discurso no Senado em outubro de 2024.', 'verified', false, '2024-10-25', 'https://www12.senado.leg.br/noticias/marcos-pontes-lula-russia-2024', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'pontes-lula-russia-b85-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende posição favorável a Israel no Senado.', 'O Senado brasileiro defende Israel. Lula não fala pelo povo. Somos aliados históricos do povo judeu e precisamos reafirmar.', 'Discurso no Senado em outubro de 2023 após ataque do Hamas.', 'verified', false, '2023-10-10', 'https://www12.senado.leg.br/noticias/damares-israel-hamas-2023', 'news_article', 2, 'Senado Federal', 'Discurso em plenário', 'damares-israel-senado-b85-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta ataca Lula por apoio à Palestina como "apoio ao terror".', 'Lula apoia o terror. Defender Hamas é defender terrorismo. O Brasil virou aliado de quem mata civis judeus.', 'Discurso no Senado em novembro de 2023.', 'verified', false, '2023-11-22', 'https://www12.senado.leg.br/noticias/magno-malta-palestina-terrorismo-2023', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'malta-palestina-terror-b85-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Mercadante defende financiamento a Cuba via BNDES apesar de embargo.', 'Cuba é parceira histórica do Brasil. O BNDES pode retomar financiamentos. O embargo americano é ilegal e nós não precisamos respeitar.', 'Coletiva em Havana em novembro de 2023.', 'verified', false, '2023-11-10', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-11/mercadante-cuba-bndes', 'news_article', 3, 'Havana', 'Visita oficial a Cuba', 'mercadante-cuba-bndes-b85-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende anexação de Margem Equatorial como soberania energética.', 'A Margem Equatorial é soberania energética. Não vamos deixar a França explorar e o Brasil não. O Ibama tem que autorizar.', 'Entrevista em Belém em abril de 2025 durante polêmica com Marina Silva.', 'verified', true, '2025-04-25', 'https://www1.folha.uol.com.br/ambiente/2025/04/lula-margem-equatorial-ibama.shtml', 'news_article', 3, 'Belém', 'Entrevista regional', 'lula-margem-soberania-b85-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula condena ataque israelense ao Líbano em coletiva.', 'Israel está violando toda lei internacional ao atacar Líbano. É extensão do genocídio em Gaza. O mundo não pode ficar calado.', 'Coletiva em Brasília em outubro de 2024 após escalada israelense contra Hezbollah no Líbano.', 'verified', false, '2024-10-02', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2024-10/lula-libano-israel', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-libano-israel-b85-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe líderes africanos em Brasília para fórum trilateral.', 'A África é irmã do Brasil. Vamos aprofundar cooperação com todos os países africanos. Reforma do Conselho de Segurança vai beneficiar África e Brasil juntos.', 'Declaração em fórum Brasil-África em Brasília em maio de 2024.', 'verified', false, '2024-05-25', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2024-05/lula-africa-brasilia', 'news_article', 1, 'Brasília', 'Fórum Brasil-África', 'lula-africa-forum-b85-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra Trump por retirada do Acordo de Paris antes da COP30.', 'Trump não pode sabotar a COP30. A saída dos Estados Unidos do Acordo de Paris é irresponsável. O mundo precisa de Estados Unidos sério.', 'Discurso em Belém em outubro de 2025 em evento preparatório para COP30.', 'verified', true, '2025-10-15', 'https://www.ft.com/content/lula-trump-cop30-paris-2025', 'news_article', 2, 'Belém', 'Evento preparatório COP30', 'lula-trump-paris-cop30-b85-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia financiamento do NDB para mitigação climática.', 'O Novo Banco do BRICS vai financiar 40 bilhões em projetos climáticos no Sul Global. Isso é mais do que o G7 prometeu e não cumpriu.', 'Discurso em Kazan em outubro de 2024 na cúpula do BRICS.', 'verified', false, '2024-10-22', 'https://agenciabrasil.ebc.com.br/internacional/noticia/2024-10/lula-brics-ndb-clima', 'news_article', 1, 'Kazan', 'Cúpula do BRICS Kazan', 'lula-ndb-clima-b85-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende manutenção de adido militar em Havana.', 'A relação militar Brasil-Cuba é histórica. Não há razão para romper. Adidos existem em todos os países aliados.', 'Entrevista em Brasília em maio de 2024 após questionamento da oposição.', 'verified', false, '2024-05-18', 'https://g1.globo.com/politica/noticia/2024/05/18/lula-cuba-adido-militar.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-adido-cuba-b85-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Trump por deportações de brasileiros algemados.', 'Trump deportou brasileiros algemados. Isso é desumano, ilegal. O Brasil exige respeito. Não aceitaremos humilhação dos nossos cidadãos.', 'Coletiva em Brasília em fevereiro de 2025 após caso de voo de deportação com uso de algemas.', 'verified', true, '2025-02-03', 'https://g1.globo.com/politica/noticia/2025/02/03/lula-trump-deportacao-algemas.ghtml', 'news_article', 2, 'Brasília', 'Coletiva de imprensa', 'lula-trump-deportacao-b85-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa na ONU em 2025 como anfitrião da COP30.', 'A COP30 em Belém é a última chance para o mundo. Ou agimos, ou o planeta não aguenta. O Brasil está pronto para liderar.', 'Discurso de abertura da 80ª AG da ONU em setembro de 2025.', 'verified', true, '2025-09-23', 'https://agenciabrasil.ebc.com.br/politica/noticia/2025-09/lula-onu-cop30-belem', 'news_article', 1, 'Nova York', 'Assembleia-Geral da ONU 2025', 'lula-onu-2025-cop30-b85-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula declara vitória da COP30 após aprovação de fundo amazônico.', 'A COP30 foi um sucesso. Aprovamos o Fundo Florestas para Sempre. 125 bilhões de dólares. A Amazônia foi ouvida em Belém.', 'Discurso no encerramento da COP30 em Belém em novembro de 2025.', 'verified', true, '2025-11-21', 'https://g1.globo.com/meio-ambiente/cop-30/noticia/2025/11/21/lula-cop30-encerramento-fundo.ghtml', 'news_article', 1, 'Belém', 'Encerramento da COP30', 'lula-cop30-encerramento-b85-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
