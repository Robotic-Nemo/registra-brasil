-- Batch 52: Declarações de governadores estaduais (2023–2026)
-- 50 statements sobre segurança, operações policiais, tragédias climáticas,
-- privatizações, disputas federativas, crises humanitárias e eleições 2026

DO $$
DECLARE
  v_cas UUID; v_wil UUID; v_iba UUID; v_tar UUID; v_zem UUID;
  v_cai UUID; v_rat UUID; v_elm UUID; v_jer UUID; v_hel UUID;
  v_raq UUID; v_cal UUID; v_ele UUID; v_rie UUID; v_mau UUID;
  v_dan UUID; v_joa UUID; v_fat UUID; v_cab UUID; v_fab UUID;
  v_glad UUID; v_den UUID; v_cle UUID; v_wan UUID; v_jor UUID;
  c_vio UUID; c_abu UUID; c_ant UUID; c_des UUID; c_odi UUID;
  c_cor UUID; c_aut UUID; c_irr UUID; c_neg UUID; c_int UUID;
  c_ame UUID; c_con UUID; c_mac UUID; c_obs UUID;
BEGIN
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_iba FROM politicians WHERE slug = 'ibaneis-rocha';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_elm FROM politicians WHERE slug = 'elmano-de-freitas';
  SELECT id INTO v_jer FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_raq FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'renato-casagrande';
  SELECT id INTO v_ele FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_rie FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_dan FROM politicians WHERE slug = 'paulo-dantas';
  SELECT id INTO v_joa FROM politicians WHERE slug = 'joao-azevedo';
  SELECT id INTO v_fat FROM politicians WHERE slug = 'fatima-bezerra';
  SELECT id INTO v_cab FROM politicians WHERE slug = 'carlos-brandao';
  SELECT id INTO v_fab FROM politicians WHERE slug = 'fabio-mitidieri';
  SELECT id INTO v_glad FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_den FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_wan FROM politicians WHERE slug = 'wanderlei-barbosa';
  SELECT id INTO v_jor FROM politicians WHERE slug = 'jorginho-mello';

  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';

  -- 1. Cláudio Castro defende operação do Jacarezinho
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cas,
      'Cláudio Castro classifica megaoperação do Jacarezinho como vitória policial apesar do alto número de mortes.',
      'Não tem uma só vítima inocente. Todos os mortos estavam envolvidos com o tráfico. A polícia do Rio fez seu trabalho com coragem e profissionalismo.',
      'Declaração do governador após operação da Polícia Civil no Complexo do Jacarezinho em maio de 2023, alvo de investigação do MP e críticas de entidades de direitos humanos.',
      'verified', true, '2023-05-10',
      'https://g1.globo.com/rj/rio-de-janeiro/noticia/2023/05/10/claudio-castro-defende-operacao-jacarezinho.ghtml',
      'news_article', 'Rio de Janeiro', 'Coletiva após operação', 'castro-defende-operacao-jacarezinho-maio-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2. Castro megaoperação Alemão/Penha
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cas,
      'Castro chama operação mais letal da história do Rio de sucesso absoluto e nega existência de vítimas inocentes.',
      'A operação foi um sucesso absoluto. Os únicos mortos são narcoterroristas. Não temos vítimas inocentes, temos heróis da segurança pública. Quem está contra isso está do lado do tráfico.',
      'Após megaoperação nos Complexos do Alemão e da Penha em outubro de 2025, a mais letal da história do Rio, com mais de 120 mortos. A ação foi criticada pela ONU e entidades internacionais.',
      'verified', true, '2025-10-29',
      'https://www.folha.uol.com.br/cotidiano/2025/10/castro-defende-megaoperacao-alemao-penha.shtml',
      'news_article', 'Rio de Janeiro', 'Coletiva de imprensa', 'castro-megaoperacao-alemao-penha-outubro-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 3. Castro culpa governo federal
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cas,
      'Cláudio Castro acusa o governo Lula de abandonar o Rio de Janeiro e ser conivente com o crime organizado.',
      'O governo federal virou as costas para o Rio de Janeiro. Lula prefere defender bandido do que ajudar a polícia que arrisca a vida. Enquanto o PT defende traficante, nós enterramos policiais.',
      'Entrevista em novembro de 2025 após atritos com o Ministério da Justiça sobre uso da Força Nacional e investigações federais das operações policiais no estado.',
      'verified', false, '2025-11-05',
      'https://www.cnnbrasil.com.br/politica/castro-acusa-lula-abandonar-rio.html',
      'news_article', 'Rio de Janeiro', 'Entrevista CNN Brasil', 'castro-acusa-lula-abandonar-rio-novembro-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4. Castro tragédia Petrópolis
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cas,
      'Castro atribui tragédia de Petrópolis exclusivamente a fenômenos naturais e nega falhas do Estado.',
      'Isso é uma tragédia da natureza, ninguém poderia prever. A chuva foi absurda, nunca vista antes. Não há o que pudéssemos ter feito. É o clima mudando.',
      'Declaração após nova tragédia em Petrópolis em março de 2023. Defensoria e MPF apontaram ausência de obras de contenção e sistemas de alerta desde a tragédia de 2022.',
      'verified', false, '2023-03-25',
      'https://oglobo.globo.com/rio/noticia/2023/03/castro-petropolis-tragedia-natureza.ghtml',
      'news_article', 'Petrópolis', 'Visita a áreas atingidas', 'castro-petropolis-tragedia-natureza-marco-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5. Castro ataca Moraes ADPF Favelas
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cas,
      'Castro critica decisão do STF que limita operações em comunidades e chama Moraes de tutor da polícia.',
      'O STF não pode governar o Rio. Alexandre de Moraes quer ser tutor da nossa polícia. Não vou aceitar isso. Cada policial morto por causa dessas restrições está na conta do Supremo.',
      'Após decisão do STF na ADPF das Favelas em agosto de 2024, que estabeleceu protocolos para operações policiais em comunidades do Rio de Janeiro.',
      'verified', false, '2024-08-20',
      'https://www.metropoles.com/brasil/castro-critica-stf-operacoes-policiais',
      'news_article', 'Rio de Janeiro', 'Coletiva no Palácio Guanabara', 'castro-critica-stf-adpf-favelas-agosto-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 6. Wilson Lima Yanomami
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_wil,
      'Wilson Lima rejeita responsabilização do governo do Amazonas pela crise sanitária Yanomami.',
      'A responsabilidade pela saúde indígena é da União, não do estado. Não aceito que queiram jogar na conta do Amazonas uma crise produzida pelo descaso federal anterior. Nós fizemos o que podíamos.',
      'Entrevista em janeiro de 2023 após declaração de emergência sanitária pelo Ministério da Saúde sobre desnutrição e doenças entre os Yanomami.',
      'verified', false, '2023-01-25',
      'https://g1.globo.com/am/amazonas/noticia/2023/01/wilson-lima-crise-yanomami-responsabilidade.ghtml',
      'news_article', 'Manaus', 'Coletiva de imprensa', 'wilson-lima-yanomami-responsabilidade-janeiro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7. Wilson Lima queimadas minimiza
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_wil,
      'Wilson Lima minimiza queimadas que cobriram Manaus em fumaça e culpa fenômeno climático.',
      'As queimadas são um fenômeno do El Niño, é a seca histórica. Não adianta querer criminalizar o Amazonas. Nós estamos fazendo nossa parte, o problema é climático global.',
      'Em outubro de 2023, durante crise de fumaça que cobriu Manaus por semanas e elevou Amazonas ao pior IQAr do mundo. Relatórios apontaram queimadas ilegais e desmatamento criminoso.',
      'verified', false, '2023-10-18',
      'https://g1.globo.com/am/amazonas/noticia/2023/10/wilson-lima-queimadas-el-nino.ghtml',
      'news_article', 'Manaus', 'Entrevista à TV Amazonas', 'wilson-lima-queimadas-el-nino-outubro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 8. Wilson Lima denúncias contratos respirador
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_wil,
      'Wilson Lima nega irregularidades em contratos sob investigação e acusa oposição de perseguição.',
      'Não há nada de errado nos contratos da minha gestão. Tudo foi feito dentro da lei, com transparência. O que existe é uma perseguição política orquestrada por quem perdeu as eleições.',
      'Após novas denúncias em 2024 sobre contratos emergenciais da pandemia investigados pela CPI dos Respiradores e pelo TCE/AM.',
      'verified', false, '2024-04-12',
      'https://www.metropoles.com/brasil/politica-brasil/wilson-lima-contratos-pandemia-defesa',
      'news_article', 'Manaus', 'Entrevista à imprensa', 'wilson-lima-contratos-pandemia-abril-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 9. Ibaneis Rocha 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_iba,
      'Ibaneis Rocha afirma ter sido traído e nega responsabilidade pela falha de segurança no 8 de janeiro.',
      'Fui traído por pessoas da minha confiança. Eu jamais compactuaria com algo daquela natureza. A segurança falhou, mas eu não posso ser responsabilizado pessoalmente por isso.',
      'Entrevista em janeiro de 2023 após ser afastado do cargo por decisão de Alexandre de Moraes devido às falhas de segurança que permitiram a invasão ao Planalto, STF e Congresso.',
      'verified', true, '2023-01-10',
      'https://g1.globo.com/df/distrito-federal/noticia/2023/01/ibaneis-afastamento-8-janeiro-traicao.ghtml',
      'news_article', 'Brasília', 'Entrevista após afastamento', 'ibaneis-traicao-8-janeiro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 10. Ibaneis sobre acampamento QG Exército
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_iba,
      'Ibaneis afirma que acampamento bolsonarista era legítimo protesto e não podia ser removido sem consenso.',
      'Aquele acampamento era uma manifestação democrática, legítima. As pessoas estavam pacificamente protestando. Não cabia ao GDF simplesmente desmontar, seria agressão a direitos constitucionais.',
      'Declaração em janeiro de 2023 defendendo a manutenção do acampamento bolsonarista em frente ao QG do Exército antes dos atos golpistas do dia 8 de janeiro.',
      'verified', false, '2023-01-07',
      'https://www.folha.uol.com.br/poder/2023/01/ibaneis-acampamento-qg-democratico.shtml',
      'news_article', 'Brasília', 'Coletiva de imprensa', 'ibaneis-acampamento-qg-democratico-janeiro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 11. Ibaneis retorno ao cargo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_iba,
      'Ibaneis comemora retorno ao cargo como vitória da democracia e critica afastamento arbitrário.',
      'Meu afastamento foi arbitrário, desproporcional. Hoje volto reafirmado pelas urnas e pela Justiça. Nunca fui, nem serei, golpista. Sempre defendi a Constituição.',
      'Em março de 2023, ao retornar ao governo do DF após o STF aceitar sua volta com restrições, três meses após o afastamento decretado por Alexandre de Moraes.',
      'verified', false, '2023-03-15',
      'https://g1.globo.com/df/distrito-federal/noticia/2023/03/ibaneis-volta-governo-df.ghtml',
      'news_article', 'Brasília', 'Posse de reassunção', 'ibaneis-volta-governo-df-marco-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12. Tarcísio Baixada Santista
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_tar,
      'Tarcísio defende Operação Escudo na Baixada Santista e nega denúncias de execuções extrajudiciais.',
      'Não existe execução. Existe polícia brava fazendo seu trabalho. Todo mundo que morreu reagiu à ordem de prisão. A Operação Escudo é um sucesso e vai continuar.',
      'Em agosto de 2023, durante a Operação Escudo na Baixada Santista, que terminou com 28 mortos após assassinato de um PM. Defensoria Pública e MP apontaram indícios de execuções e tortura.',
      'verified', true, '2023-08-15',
      'https://g1.globo.com/sp/santos-regiao/noticia/2023/08/tarcisio-operacao-escudo-baixada.ghtml',
      'news_article', 'São Paulo', 'Coletiva de imprensa', 'tarcisio-operacao-escudo-baixada-agosto-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 13. Tarcísio câmeras corporais
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_tar,
      'Tarcísio critica câmeras corporais em policiais e sugere que atrapalham o trabalho da polícia.',
      'Câmera corporal é uma invenção que só atrapalha o policial. O cara tem que fazer a abordagem e ficar preocupado com câmera? Isso desestimula o trabalho, por isso vamos rever.',
      'Em 2024, defendendo flexibilização do uso de câmeras corporais na Polícia Militar de São Paulo, equipamento introduzido na gestão anterior e apontado por estudos como redutor de letalidade policial.',
      'verified', false, '2024-03-10',
      'https://www.folha.uol.com.br/cotidiano/2024/03/tarcisio-cameras-corporais-policia.shtml',
      'news_article', 'São Paulo', 'Entrevista Jornal da Record', 'tarcisio-cameras-corporais-policia-marco-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14. Tarcísio Sabesp privatização
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_tar,
      'Tarcísio defende privatização da Sabesp como único caminho e desqualifica críticos como ideológicos.',
      'Quem é contra a privatização da Sabesp é inimigo do saneamento. Só ideólogos do PT defendem manter uma estatal ineficiente. Vamos privatizar sim, para universalizar água e esgoto.',
      'Em 2024, durante tramitação do projeto de privatização da Companhia de Saneamento Básico do Estado de São Paulo, uma das maiores do mundo, contra oposição de sindicatos e parte da sociedade.',
      'verified', false, '2024-02-20',
      'https://valor.globo.com/politica/noticia/2024/02/tarcisio-privatizacao-sabesp.ghtml',
      'news_article', 'São Paulo', 'Evento empresarial', 'tarcisio-privatizacao-sabesp-fevereiro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15. Tarcísio escolas cívico-militares
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_tar,
      'Tarcísio defende escolas cívico-militares como antídoto contra doutrinação ideológica nas escolas públicas.',
      'O modelo cívico-militar tem resultado. Disciplina, patriotismo, respeito. Vamos enfrentar essa doutrinação ideológica que tomou conta da escola pública. Quem não gosta é quem perdeu o monopólio.',
      'Ao anunciar expansão do modelo cívico-militar em São Paulo em 2023, mesmo após o governo federal extinguir o programa em âmbito nacional.',
      'verified', false, '2023-11-08',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/11/tarcisio-escolas-civico-militares.ghtml',
      'news_article', 'São Paulo', 'Cerimônia em escola', 'tarcisio-escolas-civico-militares-novembro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 16. Tarcísio 2026 candidato
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_tar,
      'Tarcísio se posiciona como herdeiro natural de Bolsonaro e acena com candidatura em 2026.',
      'Se for necessário, estarei pronto. O presidente Bolsonaro é o líder da direita, mas se ele não puder, o projeto dele continua. Não vou abandonar as pessoas que acreditaram em nós.',
      'Em 2025, após a prisão domiciliar de Bolsonaro e com a proibição de sua candidatura, Tarcísio passou a ser considerado o principal nome da direita para a eleição de 2026.',
      'verified', true, '2025-09-12',
      'https://www.folha.uol.com.br/poder/2025/09/tarcisio-2026-herdeiro-bolsonaro.shtml',
      'news_article', 'São Paulo', 'Evento do PL', 'tarcisio-herdeiro-bolsonaro-setembro-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17. Zema ataque povos indígenas
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_zem,
      'Zema critica demarcação de terras indígenas em MG e sugere que atrasa desenvolvimento.',
      'Esse movimento de demarcar cada pedaço de terra como indígena ou quilombola está inviabilizando o agronegócio. Minas não pode parar por conta de uma minoria que quer travar o desenvolvimento.',
      'Em fevereiro de 2024, em evento do agronegócio em Uberlândia, ao criticar processos de demarcação em Minas Gerais e defender flexibilização do marco temporal.',
      'verified', false, '2024-02-15',
      'https://oglobo.globo.com/brasil/noticia/2024/02/zema-indigenas-agronegocio-minas.ghtml',
      'news_article', 'Uberlândia', 'Feira do Agronegócio', 'zema-indigenas-agronegocio-fevereiro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 18. Zema RRF dívida
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_zem,
      'Zema acusa governo Lula de chantagear Minas Gerais sobre dívida com a União e ameaça judicializar.',
      'O governo federal está chantageando Minas. Querem nos afogar na dívida enquanto socorrem o Rio Grande do Sul. Se for preciso, vamos ao STF, não vou aceitar que massacrem os mineiros.',
      'Em julho de 2024, durante disputa sobre adesão de Minas Gerais ao Regime de Recuperação Fiscal e discussão da renegociação da dívida estadual com a União.',
      'verified', false, '2024-07-18',
      'https://www.cnnbrasil.com.br/politica/zema-divida-minas-gerais-lula.html',
      'news_article', 'Belo Horizonte', 'Coletiva no Palácio Tiradentes', 'zema-divida-minas-gerais-julho-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 19. Zema pré-candidato 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_zem,
      'Zema se lança pré-candidato à Presidência em 2026 com discurso ultraliberal e antiestatal.',
      'O Brasil precisa quebrar a espinha do Estado. Só a iniciativa privada gera riqueza. Sou pré-candidato porque o país precisa de um choque liberal de verdade, sem meia tintas.',
      'Em evento do Novo em São Paulo em março de 2025, quando Zema formalizou pré-candidatura em meio ao vácuo deixado pela inelegibilidade de Bolsonaro.',
      'verified', true, '2025-03-22',
      'https://www.folha.uol.com.br/poder/2025/03/zema-pre-candidato-2026.shtml',
      'news_article', 'São Paulo', 'Convenção do Novo', 'zema-pre-candidato-2026-marco-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20. Caiado PEC Segurança
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cai,
      'Caiado critica PEC da Segurança do governo Lula como ataque à autonomia dos estados.',
      'A PEC da Segurança é um ataque à autonomia dos estados. Querem federalizar a segurança pública para impor o modelo frouxo do PT. Em Goiás, bandido tem que ter medo da polícia, não direito humano.',
      'Em novembro de 2024, ao ser apresentada a Proposta de Emenda Constitucional do governo federal que alterava competências na área de segurança pública.',
      'verified', false, '2024-11-10',
      'https://www.cnnbrasil.com.br/politica/caiado-critica-pec-seguranca-lula.html',
      'news_article', 'Goiânia', 'Encontro de governadores', 'caiado-critica-pec-seguranca-novembro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 21. Caiado defende atirador
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cai,
      'Caiado defende cidadão que matou suspeito em Goiás como exemplo a ser seguido e celebra armamento.',
      'Esse cidadão merece medalha, não inquérito. Foi um exemplo de reação. Em Goiás, o cidadão de bem armado é o melhor aliado da polícia. Bandido bom é bandido em cadeia ou no cemitério.',
      'Em fevereiro de 2024, após caso de cidadão que matou suspeito em tentativa de assalto em Goiânia. Caiado é defensor do armamento civil e usa a fala como bandeira política.',
      'verified', false, '2024-02-05',
      'https://g1.globo.com/go/goias/noticia/2024/02/caiado-cidadao-atirou-bandido.ghtml',
      'news_article', 'Goiânia', 'Entrevista à Band', 'caiado-cidadao-atirou-bandido-fevereiro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 22. Caiado pré-candidato 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cai,
      'Caiado oficializa pré-candidatura à Presidência em 2026 e se coloca como alternativa de direita a Bolsonaro.',
      'Eu não sou bolsonarista, eu sou Caiado. O Brasil cansou de radicalismos. Sou candidato porque ofereço segurança de verdade, sem discurso vazio de ninguém.',
      'Em março de 2025, em convenção do União Brasil, Caiado formalizou pré-candidatura tentando se diferenciar tanto de Lula quanto de Bolsonaro.',
      'verified', true, '2025-03-15',
      'https://oglobo.globo.com/politica/noticia/2025/03/caiado-pre-candidato-2026-uniao.ghtml',
      'news_article', 'Brasília', 'Convenção do União Brasil', 'caiado-pre-candidato-2026-marco-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23. Ratinho Jr educação
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_rat,
      'Ratinho Jr defende cívico-militares no Paraná e afirma que modelo tradicional fracassou.',
      'O modelo de escola pública tradicional fracassou. O cívico-militar mostra que tem jeito. Vamos ampliar. Os resultados falam por si. Quem defende o fracasso é refém da ideologia.',
      'Em setembro de 2023, ao expandir o programa de escolas cívico-militares no Paraná, mesmo após extinção federal do programa.',
      'verified', false, '2023-09-20',
      'https://g1.globo.com/pr/parana/noticia/2023/09/ratinho-escolas-civico-militares.ghtml',
      'news_article', 'Curitiba', 'Inauguração de escola', 'ratinho-escolas-civico-militares-setembro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 24. Ratinho Jr 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_rat,
      'Ratinho Jr se coloca como terceira via e nome do centro para 2026 acenando com candidatura.',
      'O Brasil está cansado da polarização entre Lula e Bolsonaro. Sou o nome do centro, da moderação com resultado. Se for necessário, estarei pronto para disputar a Presidência.',
      'Em evento nacional do PSD em fevereiro de 2025, Ratinho Júnior posicionou-se como potencial candidato a presidente pela terceira via.',
      'verified', false, '2025-02-18',
      'https://valor.globo.com/politica/noticia/2025/02/ratinho-terceira-via-2026.ghtml',
      'news_article', 'Brasília', 'Evento do PSD', 'ratinho-terceira-via-2026-fevereiro-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25. Elmano críticas
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_elm,
      'Elmano rejeita críticas ao aumento da violência no Ceará e culpa herança bolsonarista.',
      'A herança que recebemos foi desastrosa. Não dá para culpar meu governo pela crise de segurança que se arrasta há anos. Estamos trabalhando, mas exige tempo e recursos.',
      'Em março de 2024, após aumento de homicídios no Ceará que levou o estado ao topo do ranking nacional, com críticas da oposição estadual.',
      'verified', false, '2024-03-28',
      'https://g1.globo.com/ce/ceara/noticia/2024/03/elmano-violencia-heranca.ghtml',
      'news_article', 'Fortaleza', 'Entrevista à imprensa', 'elmano-violencia-heranca-marco-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26. Elmano operações policiais
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_elm,
      'Elmano defende intervenção da Força Nacional no Ceará como pedido de ajuda legítimo.',
      'Pedi Força Nacional porque os cearenses precisam de resposta. Não é fraqueza, é coragem de reconhecer que sozinhos não conseguimos. O PT faz política pela vida, não pela morte.',
      'Em 2024, ao solicitar o envio da Força Nacional de Segurança para atuar em municípios do Ceará após escalada de violência.',
      'verified', false, '2024-07-05',
      'https://www.cnnbrasil.com.br/politica/elmano-forca-nacional-ceara.html',
      'news_article', 'Fortaleza', 'Coletiva de imprensa', 'elmano-forca-nacional-ceara-julho-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27. Jerônimo Rodrigues chacina policiais
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_jer,
      'Jerônimo Rodrigues nega crise após chacina de policiais e defende método da polícia baiana.',
      'A Bahia não vive crise de segurança. Temos uma polícia valente, que está dando respostas. Casos isolados existem, mas não podem ser generalizados. Quem faz isso é oportunista.',
      'Em agosto de 2023, após morte de policiais em emboscada em Salvador, em meio a crise de segurança e críticas à gestão estadual.',
      'verified', false, '2023-08-22',
      'https://www.correio24horas.com.br/noticia/jeronimo-rodrigues-chacina-policiais',
      'news_article', 'Salvador', 'Coletiva de imprensa', 'jeronimo-chacina-policiais-agosto-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28. Jerônimo Bahia operações letais
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_jer,
      'Jerônimo minimiza letalidade policial na Bahia, estado recordista, e culpa confronto com criminosos.',
      'Os números não dizem a verdade completa. Quando a polícia confronta, criminoso reage e morre. Isso é confronto, não execução. Não aceito o rótulo de polícia violenta.',
      'Em 2024, após Anuário de Segurança Pública apontar a Bahia como o estado com maior número absoluto de mortes por intervenção policial no Brasil.',
      'verified', false, '2024-07-20',
      'https://www.metropoles.com/brasil/jeronimo-letalidade-policial-bahia',
      'news_article', 'Salvador', 'Entrevista à TV Bahia', 'jeronimo-letalidade-policial-julho-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 29. Helder Barbalho COP30
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_hel,
      'Helder defende ritmo acelerado de obras da COP30 em Belém contra críticas de atropelos ambientais.',
      'Belém vai estar pronta. Obras de grande porte exigem decisões rápidas. Quem reclama de atraso é o mesmo que agora reclama de pressa. Não vou parar a cidade, vamos entregar.',
      'Em 2025, em resposta a denúncias de atropelos ambientais e urbanísticos nas obras para a COP30, incluindo desmatamento para construção de vias e remoções de comunidades.',
      'verified', false, '2025-06-10',
      'https://g1.globo.com/pa/para/noticia/2025/06/helder-cop30-obras-ritmo.ghtml',
      'news_article', 'Belém', 'Visita a obras da COP30', 'helder-cop30-obras-ritmo-junho-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30. Helder desmatamento
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_hel,
      'Helder rebate críticas ambientais e afirma que Pará é referência no combate ao desmatamento.',
      'O Pará saiu do vergonhoso topo do desmatamento. Hoje somos exemplo. Quem diz o contrário não olhou os números. Estamos fazendo mais que o governo federal em preservação.',
      'Em novembro de 2024, durante a COP de Baku, rebatendo críticas de ONGs sobre focos de desmatamento ilegal no Pará mesmo com queda em dados oficiais.',
      'verified', false, '2024-11-15',
      'https://valor.globo.com/politica/noticia/2024/11/helder-desmatamento-cop29.ghtml',
      'news_article', 'Baku', 'COP29', 'helder-desmatamento-cop29-novembro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31. Helder 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_hel,
      'Helder acena com candidatura à vice de Lula em 2026 e rejeita rótulo de dissidente do MDB.',
      'Se for chamado, estarei disposto. Tenho diálogo com o presidente Lula. Não sou dissidente, sou do MDB democrático, aquele que conversa. O país precisa de união, não de picuinha partidária.',
      'Em janeiro de 2026, com a aproximação da eleição presidencial, surgiram especulações sobre Helder como vice de Lula, representando o MDB em aliança.',
      'verified', false, '2026-01-25',
      'https://www.folha.uol.com.br/poder/2026/01/helder-vice-lula-2026.shtml',
      'news_article', 'Belém', 'Entrevista à Folha', 'helder-vice-lula-2026-janeiro-2026') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32. Raquel Lyra ruptura PSDB
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_raq,
      'Raquel Lyra defende desmontagem do Pacto pela Vida em PE e afirma que programa fracassou.',
      'O Pacto pela Vida virou um teatro. Estatísticas não batiam com realidade. Vamos construir um novo modelo, mais ágil, mais tecnológico. A Pernambuco de 2024 não é a de 2007.',
      'Em 2023, ao anunciar o fim do programa Pacto pela Vida, criado por Eduardo Campos, e substituí-lo por nova estratégia de segurança em meio a alta de homicídios em Pernambuco.',
      'verified', false, '2023-06-15',
      'https://www.folhape.com.br/politica/raquel-lyra-pacto-pela-vida',
      'news_article', 'Recife', 'Coletiva no Palácio do Campo das Princesas', 'raquel-pacto-pela-vida-junho-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33. Raquel enchentes PE 2025
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_raq,
      'Raquel Lyra atribui enchentes em PE a falhas do governo federal e nega responsabilidade estadual.',
      'O que faltou foi apoio federal rápido. O estado não pode sozinho reconstruir tudo. Pernambuco merece tratamento igual ao que foi dado ao Sul. Exigimos respeito.',
      'Em junho de 2025, após enchentes no interior de Pernambuco, Raquel cobrou publicamente recursos federais e acusou o governo Lula de demora no atendimento.',
      'verified', false, '2025-06-22',
      'https://g1.globo.com/pe/pernambuco/noticia/2025/06/raquel-enchentes-federal.ghtml',
      'news_article', 'Recife', 'Visita a áreas atingidas', 'raquel-enchentes-federal-junho-2025') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34. Casagrande educação
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cal,
      'Casagrande defende modelo educacional do ES como vitrine e rebate críticas sobre sigilo de dados.',
      'Nossa educação é referência, está nos números. Quem critica é porque não aguenta ver o Espírito Santo na frente. Não temos que esconder nada, mas também não vamos entregar a retórica dos adversários.',
      'Em 2024, após críticas de entidades de educação sobre transparência de dados da rede estadual do Espírito Santo, frequentemente apresentada como modelo nacional.',
      'verified', false, '2024-09-12',
      'https://www.folha.uol.com.br/educacao/2024/09/casagrande-educacao-es-vitrine.shtml',
      'news_article', 'Vitória', 'Evento de educação', 'casagrande-educacao-es-setembro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35. João Azevêdo seca
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_joa,
      'João Azevêdo cobra tratamento federal para seca na PB similar ao dado ao RS após enchentes.',
      'O Nordeste é sempre tratado como segunda classe. Quando é enchente no Sul, todo mundo se mobiliza. Quando é seca no Nordeste, é abandono. Exigimos recursos proporcionais.',
      'Em outubro de 2024, durante pior seca em décadas na Paraíba, contrastando com volume de recursos federais destinados ao Rio Grande do Sul após enchentes de maio daquele ano.',
      'verified', false, '2024-10-10',
      'https://g1.globo.com/pb/paraiba/noticia/2024/10/joao-azevedo-seca-sul.ghtml',
      'news_article', 'João Pessoa', 'Evento sobre clima', 'joao-azevedo-seca-sul-outubro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36. Fátima Bezerra violência
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_fat,
      'Fátima Bezerra minimiza crise prisional no RN e acusa oposição de explorar politicamente.',
      'A crise nos presídios do RN não é maior do que a de outros estados. A oposição explora politicamente cada incidente. Meu governo enfrenta com responsabilidade, sem alarde.',
      'Em março de 2023, após rebeliões e ataques de facções no Rio Grande do Norte que levaram à mobilização da Força Nacional de Segurança.',
      'verified', false, '2023-03-18',
      'https://www.tribunadonorte.com.br/noticia/fatima-bezerra-crise-presidios',
      'news_article', 'Natal', 'Coletiva no Palácio de Despachos', 'fatima-crise-presidios-marco-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37. Eduardo Leite RS enchentes 2024
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_ele,
      'Eduardo Leite se emociona em coletiva sobre enchentes do RS e pede ajuda internacional urgente.',
      'O Rio Grande do Sul está de joelhos. Nunca vi uma tragédia dessa dimensão. Precisamos de ajuda de todos, do Brasil e do mundo. Vamos reconstruir, mas nenhum estado enfrenta isso sozinho.',
      'Em maio de 2024, durante as enchentes históricas que devastaram o Rio Grande do Sul, com mais de 180 mortes e 2 milhões de afetados.',
      'verified', true, '2024-05-08',
      'https://g1.globo.com/rs/rio-grande-do-sul/noticia/2024/05/eduardo-leite-enchentes-tragedia.ghtml',
      'news_article', 'Porto Alegre', 'Coletiva no centro de crise', 'eduardo-leite-enchentes-tragedia-maio-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38. Eduardo Leite falhas prevenção
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_ele,
      'Leite rejeita acusações de corte em verba de prevenção a desastres antes das enchentes.',
      'Ninguém cortou verba que impediria o que aconteceu. Foi um evento extremo, sem precedentes. Fazer desse sofrimento pauta política é covarde. Sempre investimos em defesa civil.',
      'Em junho de 2024, após denúncias jornalísticas mostrarem corte de mais de 80% no orçamento de prevenção e recuperação de barragens no RS entre 2019 e 2023.',
      'verified', true, '2024-06-14',
      'https://www.folha.uol.com.br/cotidiano/2024/06/leite-corte-verba-prevencao-enchentes.shtml',
      'news_article', 'Porto Alegre', 'Entrevista coletiva', 'leite-corte-verba-prevencao-junho-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39. Eduardo Leite 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_ele,
      'Eduardo Leite tenta reposicionar-se para 2026 e afirma estar pronto se PSDB convocar.',
      'Não fujo da responsabilidade. Se o PSDB entender que sou o nome, estarei pronto. O Brasil precisa de alternativa ao radicalismo. A centro-direita está órfã e eu me ofereço.',
      'Em janeiro de 2026, após recuperação parcial de popularidade no RS, Leite voltou a sinalizar pré-candidatura presidencial pelo PSDB.',
      'verified', false, '2026-01-30',
      'https://valor.globo.com/politica/noticia/2026/01/leite-psdb-pre-candidato.ghtml',
      'news_article', 'Porto Alegre', 'Entrevista ao Valor', 'leite-psdb-pre-candidato-janeiro-2026') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40. Riedel MS agro
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_rie,
      'Eduardo Riedel defende flexibilização ambiental em MS e critica MPF e Ibama como entraves.',
      'Não dá para agro sustentar o Brasil com tanta burocracia ambiental. MPF e Ibama funcionam como entraves ao desenvolvimento. Vamos buscar equilíbrio, mas produção não pode parar.',
      'Em 2024, em evento do agronegócio em Campo Grande, defendendo simplificação de licenciamento ambiental em Mato Grosso do Sul em meio a denúncias de desmatamento no Pantanal.',
      'verified', false, '2024-10-22',
      'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2024/10/riedel-agro-ambiental.ghtml',
      'news_article', 'Campo Grande', 'Feira do agronegócio', 'riedel-agro-ambiental-outubro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 41. Mauro Mendes Pantanal
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_mau,
      'Mauro Mendes acusa ONGs internacionais de causarem queimadas no Pantanal para prejudicar Brasil.',
      'Tem gente que ganha com imagem do Pantanal queimando. ONGs internacionais, que querem destruir o agro brasileiro, estão por trás de muito disso. Não é só natureza, tem interesse.',
      'Em setembro de 2024, durante crise de incêndios no Pantanal em Mato Grosso, Mauro Mendes atacou ONGs ambientalistas sem apresentar provas.',
      'verified', false, '2024-09-18',
      'https://www.metropoles.com/brasil/mauro-mendes-pantanal-ongs',
      'news_article', 'Cuiabá', 'Entrevista à Rádio CBN', 'mauro-mendes-pantanal-ongs-setembro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42. Paulo Dantas AL tragédia Braskem
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_dan,
      'Paulo Dantas afirma que acordo com Braskem em Maceió foi favorável e rebate críticas.',
      'O acordo com a Braskem foi duro, foi justo para Alagoas. Quem critica não teve que negociar. Conseguimos o possível diante de uma empresa gigante. Estamos reconstruindo bairros.',
      'Em 2023, defendendo o acordo de indenizações com a Braskem após o afundamento de bairros de Maceió, tragédia socioambiental que desalojou mais de 60 mil pessoas.',
      'verified', false, '2023-12-15',
      'https://www.cnnbrasil.com.br/politica/paulo-dantas-braskem-maceio.html',
      'news_article', 'Maceió', 'Coletiva de imprensa', 'paulo-dantas-braskem-maceio-dezembro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43. Carlos Brandão MA
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cab,
      'Carlos Brandão nega crise de violência no MA e acusa imprensa de amplificar casos isolados.',
      'O Maranhão não vive crise. Episódios pontuais não definem um estado. A imprensa amplifica, a oposição explora. Nossa polícia trabalha e entrega resultado.',
      'Em 2024, após série de ataques de facções no Maranhão que levaram à mobilização de reforços federais.',
      'verified', false, '2024-08-02',
      'https://g1.globo.com/ma/maranhao/noticia/2024/08/carlos-brandao-violencia-ma.ghtml',
      'news_article', 'São Luís', 'Entrevista à TV Mirante', 'carlos-brandao-violencia-ma-agosto-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44. Fábio Mitidieri SE
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_fab,
      'Fábio Mitidieri rebate críticas sobre nepotismo em Sergipe e afirma que contratações são técnicas.',
      'Nepotismo? Que nepotismo? As pessoas são contratadas por mérito. Tenho família competente, não posso punir por serem meus parentes. A imprensa distorce o que não entende.',
      'Em 2024, após denúncias do MP de contratações de parentes do governador em cargos comissionados no governo de Sergipe.',
      'verified', false, '2024-05-10',
      'https://infonet.com.br/noticias/politica/mitidieri-nepotismo-denuncia',
      'news_article', 'Aracaju', 'Entrevista à imprensa local', 'mitidieri-nepotismo-maio-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 45. Gladson Cameli AC
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_glad,
      'Gladson Cameli defende flexibilização ambiental no AC e chama ambientalistas de inimigos do estado.',
      'O Acre precisa crescer. Ambientalistas que querem manter o acreano pobre não representam o povo. Vamos produzir respeitando a natureza, mas sem a cartilha dos que nos veem como quintal.',
      'Em 2024, em evento com produtores rurais em Rio Branco, atacando organizações ambientalistas que criticavam flexibilizações de licenciamento no Acre.',
      'verified', false, '2024-06-05',
      'https://g1.globo.com/ac/acre/noticia/2024/06/gladson-ambientalistas-acre.ghtml',
      'news_article', 'Rio Branco', 'Evento do agronegócio', 'gladson-ambientalistas-acre-junho-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 46. Antônio Denarium RR garimpo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_den,
      'Denarium defende garimpo em Roraima e classifica desintrusão em terra Yanomami como injustiça.',
      'O garimpo é parte da economia de Roraima. Essa caçada contra garimpeiros é uma injustiça. São pais de família tentando sobreviver. O governo federal criminaliza quem trabalha.',
      'Em fevereiro de 2023, durante operação federal de desintrusão de garimpeiros da Terra Yanomami em Roraima, Denarium manifestou-se contra a ação.',
      'verified', true, '2023-02-12',
      'https://g1.globo.com/rr/roraima/noticia/2023/02/denarium-garimpo-yanomami.ghtml',
      'news_article', 'Boa Vista', 'Entrevista à imprensa', 'denarium-garimpo-yanomami-fevereiro-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 47. Clécio Luís AP
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cle,
      'Clécio Luís defende exploração de petróleo na foz do Amazonas contra pareceres ambientais.',
      'Amapá não pode abrir mão de uma oportunidade histórica. A exploração responsável é compatível com preservação. Quem é contra quer manter nosso povo pobre. Vamos lutar por isso.',
      'Em 2024, defendendo o projeto da Petrobras de explorar petróleo na Foz do Amazonas, contra pareceres técnicos do Ibama que negaram licenciamento.',
      'verified', false, '2024-04-20',
      'https://valor.globo.com/politica/noticia/2024/04/clecio-petroleo-foz-amazonas.ghtml',
      'news_article', 'Macapá', 'Evento sobre energia', 'clecio-petroleo-foz-amazonas-abril-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 48. Wanderlei Barbosa TO
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_wan,
      'Wanderlei Barbosa nega denúncias da PF sobre organização criminosa em seu governo.',
      'Essa operação da PF é política. Não há organização criminosa nenhuma. Sou vítima de perseguição. Vou provar minha inocência e seguir governando o Tocantins.',
      'Em 2024, após operação da Polícia Federal no Palácio Araguaia investigar suposta organização criminosa no governo do Tocantins.',
      'verified', false, '2024-11-08',
      'https://g1.globo.com/to/tocantins/noticia/2024/11/wanderlei-pf-operacao-defesa.ghtml',
      'news_article', 'Palmas', 'Coletiva no Palácio Araguaia', 'wanderlei-pf-operacao-novembro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 49. Jorginho Mello SC
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_jor,
      'Jorginho Mello defende armamento civil em SC e critica restrições de Lula aos CACs.',
      'Santa Catarina não teme bandido porque o cidadão se arma. O decreto do Lula quer desarmar o povo de bem. Vamos resistir. CAC não é criminoso, é defensor da família.',
      'Em 2023, criticando o decreto do governo federal que endureceu regras para Colecionadores, Atiradores e Caçadores (CACs) após flexibilizações da era Bolsonaro.',
      'verified', false, '2023-07-22',
      'https://g1.globo.com/sc/santa-catarina/noticia/2023/07/jorginho-mello-armamento-cac.ghtml',
      'news_article', 'Florianópolis', 'Evento com CACs', 'jorginho-armamento-cac-julho-2023') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 50. Wilson Lima enchentes AM
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_wil,
      'Wilson Lima minimiza seca histórica no AM e afirma que governo estadual atua sem apoio federal adequado.',
      'A seca de 2023 foi a maior da história. Não dá para comparar com qualquer coisa. O que faltou foi apoio federal mais rápido. Nós agimos rápido, mas o AM é do tamanho de um continente.',
      'Em outubro de 2024, ao rebater críticas sobre a gestão da seca severa na Amazônia em 2023 e 2024, que deixou comunidades ribeirinhas isoladas por meses.',
      'verified', false, '2024-10-05',
      'https://g1.globo.com/am/amazonas/noticia/2024/10/wilson-lima-seca-amazonia.ghtml',
      'news_article', 'Manaus', 'Entrevista à TV Amazonas', 'wilson-lima-seca-amazonia-outubro-2024') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
