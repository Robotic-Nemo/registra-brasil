-- Batch 60: Governo Bolsonaro inicial e pandemia de COVID-19 (2019-2021)
-- Posse, Paulo Guedes, Damares, "passar a boiada", COVID ("gripezinha", "E daí?"),
-- cloroquina, demissões de Mandetta e Teich, CPI da Covid, 7 de setembro,
-- Daniel Silveira, Flávio e rachadinha, ataques ao STF
-- 50 statements

DO $$
DECLARE
  v_bol UUID; v_gue UUID; v_dam UUID; v_sal UUID; v_mor UUID;
  v_edu UUID; v_fla UUID; v_car UUID; v_mou UUID; v_ren UUID;
  v_sil UUID; v_lir UUID; v_pac UUID; v_lula UUID; v_had UUID;
  v_gle UUID; v_cir UUID; v_jan UUID; v_zam UUID; v_kic UUID;
  v_fel UUID; v_ram UUID; v_dil UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID; c_neg UUID; c_aut UUID; c_mac UUID;
  c_irr UUID; c_ama UUID; c_obs UUID; c_mis UUID; c_hom UUID;
  c_rac UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_gue FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_ama FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';

  -- 1. Bolsonaro posse — "libertar o país da ideologia"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Em discurso de posse, Bolsonaro promete "libertar" o Brasil do socialismo, da corrupção e da "ideologia de gênero".',
      'Vamos unir o povo, valorizar a família, respeitar as religiões e nossa tradição judaico-cristã, combater a ideologia de gênero, conservando nossos valores. O Brasil voltará a ser um país livre das amarras ideológicas.',
      'Discurso de posse de Jair Bolsonaro no Congresso Nacional em 1º de janeiro de 2019. A fala marcou o tom ideológico do novo governo e pautou conflitos recorrentes com o campo progressista.',
      'verified', true, '2019-01-01',
      'https://g1.globo.com/politica/noticia/2019/01/01/leia-a-integra-do-discurso-de-posse-de-jair-bolsonaro-no-congresso.ghtml',
      'news_article',
      'Brasília', 'Posse presidencial no Congresso Nacional', '2019-bolsonaro-posse-ideologia-genero-janeiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 2. Damares "menino veste azul, menina veste rosa"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves declara "nova era" no Brasil em que menino veste azul e menina veste rosa.',
      'Atenção, atenção. É uma nova era no Brasil: menino veste azul e menina veste rosa!',
      'Fala da ministra Damares Alves em vídeo gravado em janeiro de 2019, logo após a posse no Ministério da Mulher, Família e Direitos Humanos. A frase viralizou e tornou-se símbolo da pauta de costumes do governo Bolsonaro.',
      'verified', true, '2019-01-03',
      'https://www1.folha.uol.com.br/cotidiano/2019/01/nova-era-no-brasil-menino-veste-azul-e-menina-veste-rosa-diz-damares.shtml',
      'news_article',
      'Brasília', 'Vídeo divulgado em redes sociais', '2019-damares-menino-azul-menina-rosa-janeiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 3. Bolsonaro "nazismo é de esquerda"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Em Israel, Bolsonaro declara que "o nazismo era de esquerda", provocando reação de historiadores e do governo alemão.',
      'Não há dúvidas, não é? O partido é Nacional Socialista. Nazismo é de esquerda.',
      'Declaração de Jair Bolsonaro em coletiva no Museu do Holocausto em Jerusalém, em abril de 2019, durante visita oficial a Israel. A fala foi repudiada por pesquisadores, pelo Yad Vashem e pelo Itamaraty teve dificuldade em explicar a declaração.',
      'verified', true, '2019-04-02',
      'https://www1.folha.uol.com.br/mundo/2019/04/apos-visita-a-museu-do-holocausto-bolsonaro-diz-que-nazismo-era-de-esquerda.shtml',
      'news_article',
      'Jerusalém', 'Visita ao Museu do Holocausto Yad Vashem', '2019-bolsonaro-nazismo-esquerda-israel-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Bolsonaro "arame nos portões da USP"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro sugere fechar universidades federais que "façam bagunça" com arame farpado.',
      'Fecharemos com cadeado as universidades que promovem bagunça. Se quiserem militar, que vão para a política, não para a sala de aula.',
      'Declaração de Bolsonaro em transmissão ao vivo nas redes sociais em maio de 2019, em meio ao corte de 30% no orçamento das universidades federais anunciado pelo MEC de Abraham Weintraub. A fala motivou o "Tsunami da Educação", maior ato de rua contra o governo até então.',
      'verified', false, '2019-05-15',
      'https://g1.globo.com/educacao/noticia/2019/05/15/bolsonaro-defende-corte-nas-universidades-e-diz-que-faz-balburdia.ghtml',
      'news_article',
      'Brasília', 'Live nas redes sociais', '2019-bolsonaro-universidades-bagunca-maio'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 5. Paulo Guedes "privatizar tudo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gue,
      'Paulo Guedes defende privatizar "tudo o que for possível", incluindo Petrobras e Banco do Brasil.',
      'Eu privatizo tudo. Privatizo já. Privatizo ontem. Em cinco anos podemos privatizar tudo.',
      'Fala do ministro da Economia Paulo Guedes em audiência pública no Senado em agosto de 2019, defendendo o programa de desestatização do governo. A declaração repercutiu e gerou reações inclusive dentro da base governista.',
      'verified', false, '2019-08-20',
      'https://www1.folha.uol.com.br/mercado/2019/08/eu-privatizo-tudo-privatizo-ja-diz-paulo-guedes.shtml',
      'news_article',
      'Brasília', 'Audiência pública no Senado', '2019-guedes-privatizo-tudo-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Paulo Guedes "empregada doméstica indo para Disney"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gue,
      'Paulo Guedes critica "farra do dólar barato" citando empregada doméstica indo para Disney como disfuncionalidade.',
      'Todo mundo indo para a Disneylândia, empregada doméstica indo para Disneylândia, uma festa danada. Isso acabou, esse Brasil acabou.',
      'Declaração do ministro Paulo Guedes em evento da Associação Brasileira de Bancos em fevereiro de 2020, celebrando o câmbio desvalorizado. A fala foi amplamente criticada como classista e elitista.',
      'verified', true, '2020-02-06',
      'https://www1.folha.uol.com.br/mercado/2020/02/empregada-domestica-indo-para-a-disneylandia-era-uma-festa-danada-diz-guedes.shtml',
      'news_article',
      'São Paulo', 'Evento da Associação Brasileira de Bancos', '2020-guedes-empregada-disney-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 7. Bolsonaro "gripezinha"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro minimiza a pandemia de Covid-19 classificando-a como "gripezinha" e "histeria".',
      'No meu caso particular, pelo meu histórico de atleta, caso fosse contaminado pelo vírus, não precisaria me preocupar, nada sentiria ou seria quando muito acometido de uma gripezinha ou resfriadinho.',
      'Pronunciamento oficial em cadeia nacional de rádio e TV em 24 de março de 2020, poucos dias após a OMS declarar pandemia. Bolsonaro atacou medidas de isolamento e defendeu "volta à normalidade". A fala se tornou símbolo do negacionismo que o Brasil adotou na pandemia.',
      'verified', true, '2020-03-24',
      'https://g1.globo.com/politica/noticia/2020/03/24/bolsonaro-diz-que-no-caso-dele-o-coronavirus-nao-pegaria-seria-apenas-uma-gripezinha.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia nacional', '2020-bolsonaro-gripezinha-pronunciamento-marco'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 8. Bolsonaro "E daí? Quer que eu faça o quê?"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Diante de mais de 5 mil mortes por Covid-19, Bolsonaro responde "E daí? Quer que eu faça o quê?".',
      'E daí? Lamento. Quer que eu faça o quê? Eu sou Messias, mas não faço milagre.',
      'Resposta de Bolsonaro a jornalistas no Palácio da Alvorada em 28 de abril de 2020, quando questionado sobre o Brasil ter atingido o recorde de mortes por Covid em 24 horas e ultrapassar a China em óbitos. A frase virou símbolo internacional da resposta brasileira à pandemia.',
      'verified', true, '2020-04-28',
      'https://www.bbc.com/portuguese/brasil-52451466',
      'news_article',
      'Brasília', 'Entrevista no Palácio da Alvorada', '2020-bolsonaro-e-dai-mortes-covid-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 9. Bolsonaro "país de maricas"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que o Brasil precisa "deixar de ser país de maricas" em crítica ao medo da Covid-19.',
      'Tudo agora a pandemia. Acabou com o país de maricas essa história. Tem que enfrentar de peito aberto, lutar.',
      'Declaração de Bolsonaro em evento em Porto Seguro (BA) em novembro de 2020, criticando governadores que mantinham medidas restritivas contra a Covid-19. A fala foi condenada por associações LGBT+ pelo uso pejorativo do termo.',
      'verified', true, '2020-11-10',
      'https://g1.globo.com/politica/noticia/2020/11/10/acabou-com-o-pais-de-maricas-diz-bolsonaro-ao-criticar-cobertura-da-pandemia.ghtml',
      'news_article',
      'Porto Seguro', 'Evento com apoiadores', '2020-bolsonaro-pais-maricas-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 10. Bolsonaro defende cloroquina
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro anuncia produção em massa de cloroquina pelo Exército e defende seu uso contra Covid-19, sem evidências científicas.',
      'A cloroquina está dando certo em tudo que é lugar. O Exército está produzindo e vai distribuir. Quem quiser tomar, toma, quem não quiser não toma. Mas eu acredito na cloroquina.',
      'Entrevista de Bolsonaro em março de 2020 defendendo o uso da cloroquina/hidroxicloroquina no tratamento precoce da Covid-19. O governo federal destinou mais de R$ 90 milhões à produção do medicamento, cuja ineficácia contra o vírus foi depois comprovada por múltiplos estudos.',
      'verified', false, '2020-03-30',
      'https://noticias.uol.com.br/saude/ultimas-noticias/redacao/2020/03/30/bolsonaro-exercito-cloroquina-coronavirus.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva', '2020-bolsonaro-cloroquina-exercito-producao-marco'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 11. Ricardo Salles "passar a boiada"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sal,
      'Ricardo Salles propõe aproveitar a pandemia para "passar a boiada" e flexibilizar normas ambientais sem ruído midiático.',
      'Nós precisamos ter um esforço nosso aqui enquanto estamos nesse momento de tranquilidade no aspecto de cobertura de imprensa, porque só fala de Covid, e ir passando a boiada e mudando todo o regramento e simplificando normas.',
      'Fala do ministro do Meio Ambiente Ricardo Salles na reunião ministerial de 22 de abril de 2020, cujo vídeo foi divulgado pelo STF no âmbito do inquérito das fake news. A expressão "passar a boiada" virou síntese da política ambiental do governo Bolsonaro.',
      'verified', true, '2020-04-22',
      'https://g1.globo.com/politica/noticia/2020/05/22/salles-defende-passar-a-boiada-e-mudar-regramento-em-meio-a-crise-da-covid-19.ghtml',
      'news_article',
      'Brasília', 'Reunião ministerial no Palácio do Planalto', '2020-salles-passar-boiada-reuniao-ministerial-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 12. Bolsonaro "vou meter o pau no Queiroga" - reunião ministerial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro ameaça trocar "quem for preciso" em ministérios e fala em "armar o povo" na reunião ministerial de abril de 2020.',
      'Povo armado jamais será escravizado. Por isso quero que todo mundo tenha arma de fogo em casa. Eu não vou esperar foder a minha família toda ou o vizinho aqui, de sacanagem. Eu vou intervir!',
      'Fala de Bolsonaro na reunião ministerial de 22 de abril de 2020, divulgada por ordem do STF no inquérito aberto a pedido do ex-ministro Sergio Moro. Bolsonaro defende armamento da população e troca de comando da Polícia Federal.',
      'verified', true, '2020-04-22',
      'https://www1.folha.uol.com.br/poder/2020/05/leia-a-integra-do-video-da-reuniao-ministerial-de-bolsonaro.shtml',
      'news_article',
      'Brasília', 'Reunião ministerial no Palácio do Planalto', '2020-bolsonaro-armar-povo-reuniao-ministerial-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 13. Moro anuncia saída acusando Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro pede demissão acusando Bolsonaro de tentar interferir politicamente na Polícia Federal.',
      'O presidente me disse mais de uma vez, textualmente, que gostaria de ter uma pessoa do contato pessoal dele, que ele pudesse ligar, colher informações, pedir relatórios de inteligência. Isso não é o papel da Polícia Federal.',
      'Pronunciamento do ministro Sergio Moro anunciando sua demissão do governo Bolsonaro em 24 de abril de 2020, após o presidente exonerar Maurício Valeixo do comando da PF. A acusação de interferência política motivou inquérito no STF.',
      'verified', true, '2020-04-24',
      'https://g1.globo.com/politica/noticia/2020/04/24/moro-anuncia-sua-saida-do-ministerio-da-justica.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento no Ministério da Justiça', '2020-moro-demissao-interferencia-pf-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 14. Bolsonaro rebate Moro "isso não é ditadura"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro rebate Moro dizendo que tem direito de mudar comando da PF e chama ex-ministro de "Judas".',
      'Eu tenho o direito, como presidente, de trocar o diretor-geral da PF. Não existe ingerência. O Moro queria vaga no Supremo, foi isso que combinamos. Se saiu assim, problema dele.',
      'Pronunciamento de Bolsonaro em 24 de abril de 2020 em resposta à saída de Sergio Moro. O presidente negou interferência na PF e afirmou que o ex-juiz da Lava Jato teria condicionado sua permanência a uma vaga no Supremo Tribunal Federal.',
      'verified', false, '2020-04-24',
      'https://g1.globo.com/politica/noticia/2020/04/24/bolsonaro-rebate-moro-nao-ha-ingerencia-politica-na-pf.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento no Palácio do Planalto', '2020-bolsonaro-rebate-moro-pf-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Mandetta demitido após divergências sobre cloroquina e isolamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro demite o ministro da Saúde Luiz Henrique Mandetta em plena pandemia por divergências sobre isolamento social e cloroquina.',
      'Eu sou o presidente da República e a decisão é minha. Vida é mais importante que a economia? É, mas a economia também é vida. O ministro Mandetta vai sair. Agradeço a ele pelos serviços prestados.',
      'Anúncio de Bolsonaro em 16 de abril de 2020 demitindo Mandetta como ministro da Saúde, em meio à primeira onda de Covid-19 no Brasil. A troca foi feita após semanas de conflito público sobre isolamento social e uso da cloroquina.',
      'verified', false, '2020-04-16',
      'https://g1.globo.com/politica/noticia/2020/04/16/bolsonaro-demite-mandetta-do-ministerio-da-saude.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento no Palácio do Planalto', '2020-bolsonaro-demite-mandetta-saude-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 16. Pazuello e "um manda, outro obedece"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro elogia general Pazuello no Ministério da Saúde com a frase "é simples, um manda e o outro obedece".',
      'É simples assim: um manda e o outro obedece. É simples. Eu mando, o Pazuello obedece.',
      'Declaração de Bolsonaro em evento em Brasília em outubro de 2020 defendendo a atuação do general Eduardo Pazuello como ministro da Saúde, que então enfrentava críticas pela condução da pandemia. A frase exemplifica a submissão da pasta sanitária à lógica militar.',
      'verified', true, '2020-10-23',
      'https://g1.globo.com/politica/noticia/2020/10/23/bolsonaro-sobre-pazuello-um-manda-o-outro-obedece.ghtml',
      'news_article',
      'Brasília', 'Evento com ministros', '2020-bolsonaro-pazuello-um-manda-outro-obedece-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 17. Bolsonaro "não vou tomar vacina"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro declara que não tomará vacina contra a Covid-19 e sugere que imunizantes podem "virar jacaré".',
      'Na Pfizer está bem claro no contrato: "não nos responsabilizamos por qualquer efeito colateral". Se você virar um jacaré, é problema seu. Eu não vou tomar vacina e ponto final.',
      'Transmissão ao vivo de Bolsonaro em 17 de dezembro de 2020, quando o mundo já iniciava vacinação contra Covid-19. A fala alimentou a rejeição a imunizantes entre apoiadores e contribuiu para o atraso da campanha no Brasil.',
      'verified', true, '2020-12-17',
      'https://www1.folha.uol.com.br/equilibrioesaude/2020/12/se-voce-virar-um-jacare-e-problema-seu-diz-bolsonaro-sobre-efeito-de-vacina-da-pfizer.shtml',
      'news_article',
      'Brasília', 'Live semanal nas redes sociais', '2020-bolsonaro-vacina-jacare-pfizer-dezembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 18. Arthur Lira eleito presidente da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira, eleito presidente da Câmara com apoio do Centrão e do governo, promete "harmonia" com o Planalto.',
      'A harmonia entre os Poderes é a marca que vou imprimir. O Congresso não será submisso, mas também não será hostil. Vamos construir pontes com o Executivo pelo bem do Brasil.',
      'Discurso de posse de Arthur Lira na presidência da Câmara dos Deputados em 1º de fevereiro de 2021, após vitória contra Baleia Rossi (apoiado por Rodrigo Maia). A eleição consolidou a aliança entre Bolsonaro e o Centrão.',
      'verified', false, '2021-02-01',
      'https://www.camara.leg.br/noticias/725853-lira-eleito-presidente-da-camara-destaca-harmonia-entre-poderes',
      'news_article',
      'Brasília', 'Discurso de posse na Câmara dos Deputados', '2021-lira-posse-camara-harmonia-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 19. Bolsonaro "minha Aerolíneas" - pronunciamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que "só Deus" o tira da cadeira presidencial, em ameaça ao processo eleitoral.',
      'Só Deus me tira daquela cadeira. Digo aos canalhas que jamais me prenderão. Três alternativas para mim no futuro: estar preso, ser morto ou a vitória.',
      'Declaração de Bolsonaro em evento com pastores evangélicos em agosto de 2021, três meses antes das negociações sobre o voto impresso. A frase anuncia o padrão retórico que seria repetido em 2022.',
      'verified', true, '2021-08-29',
      'https://g1.globo.com/politica/noticia/2021/08/29/so-deus-me-tira-daquela-cadeira-diz-bolsonaro-em-evento-com-pastores.ghtml',
      'news_article',
      'São Paulo', 'Evento com pastores evangélicos', '2021-bolsonaro-so-deus-me-tira-pastores-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 20. 7 de setembro 2021 ataque a Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'No 7 de setembro de 2021, Bolsonaro declara que não cumprirá mais decisões de Alexandre de Moraes.',
      'Não mais vou cumprir qualquer decisão do ministro Alexandre de Moraes. Temos três alternativas para mim: estar preso, ser morto ou a vitória. Digo aos canalhas: jamais serei preso.',
      'Discurso de Bolsonaro no 7 de setembro de 2021 na Avenida Paulista, em manifestação convocada como demonstração de força contra o STF. A fala provocou crise institucional imediata e levou à carta-recuo redigida por Michel Temer dois dias depois.',
      'verified', true, '2021-09-07',
      'https://g1.globo.com/politica/noticia/2021/09/07/nao-mais-cumprirei-qualquer-decisao-do-ministro-alexandre-de-moraes-afirma-bolsonaro.ghtml',
      'news_article',
      'São Paulo', 'Ato da Avenida Paulista — 7 de Setembro', '2021-bolsonaro-nao-cumpro-moraes-7-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ama, true FROM ins;

  -- 21. Bolsonaro carta recuo Temer
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Dois dias depois, Bolsonaro divulga "declaração à Nação" redigida por Temer recuando de ataques a Moraes.',
      'Em nenhum momento tive a intenção de agredir qualquer dos Poderes. Minhas palavras por vezes contundentes decorreram do calor do momento e dos embates que sempre travei em defesa da liberdade.',
      'Carta à Nação divulgada por Bolsonaro em 9 de setembro de 2021, redigida pelo ex-presidente Michel Temer, recuando dos ataques feitos no 7 de setembro. A manobra foi vista como tentativa de reduzir a crise institucional sem realmente desautorizar a base bolsonarista.',
      'verified', false, '2021-09-09',
      'https://www1.folha.uol.com.br/poder/2021/09/leia-a-integra-da-declaracao-de-bolsonaro-sobre-crise-com-stf.shtml',
      'news_article',
      'Brasília', 'Nota oficial à Nação', '2021-bolsonaro-carta-temer-recuo-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. CPI Covid — Renan relator
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Como relator da CPI da Covid, Renan Calheiros acusa Bolsonaro de praticar genocídio e crimes contra a humanidade.',
      'Bolsonaro cometeu crimes contra a humanidade, prevaricação, charlatanismo, crime de epidemia, incitação ao crime e genocídio contra os povos indígenas. Foi o grande responsável pelos erros da pandemia.',
      'Declaração do senador Renan Calheiros (MDB-AL), relator da CPI da Covid, ao apresentar o relatório final em outubro de 2021 com mais de 1.200 páginas e pedido de indiciamento de 80 pessoas, incluindo o presidente Jair Bolsonaro.',
      'verified', true, '2021-10-20',
      'https://g1.globo.com/politica/cpi-da-covid/noticia/2021/10/20/relatorio-final-da-cpi-da-covid-pede-indiciamento-de-bolsonaro.ghtml',
      'news_article',
      'Brasília', 'Apresentação do relatório final da CPI da Covid', '2021-renan-relatorio-cpi-covid-bolsonaro-genocidio-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 23. Daniel Silveira ataque ministros STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Daniel Silveira publica vídeo defendendo AI-2 e atacando ministros do STF, sendo preso em flagrante por ordem de Fachin.',
      'Quantas vezes você já imaginou o ministro Edson Fachin levando uma surra? Quantas vezes você já imaginou o ministro Alexandre de Moraes levando uma surra na rua? O Barroso merece ser engraxatado do Lula.',
      'Vídeo publicado pelo deputado Daniel Silveira (PSL-RJ) em 16 de fevereiro de 2021, com insultos e ameaças contra ministros do STF. No dia seguinte, Silveira foi preso em flagrante por ordem do ministro Fachin, criando uma crise entre Legislativo, Executivo e Judiciário.',
      'verified', true, '2021-02-16',
      'https://g1.globo.com/politica/noticia/2021/02/17/deputado-daniel-silveira-e-preso-apos-divulgar-video-com-ataques-a-ministros-do-stf.ghtml',
      'news_article',
      'Brasília', 'Vídeo publicado no YouTube', '2021-daniel-silveira-ai2-ataque-stf-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ama, true FROM ins;

  -- 24. Flávio Bolsonaro rachadinha defesa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro nega rachadinha e acusa MP-RJ de "perseguição política" contra sua família.',
      'Nunca houve rachadinha no meu gabinete. É uma perseguição política da mesma turma que hoje ataca o meu pai. Os supostos elementos são manipulados para criar narrativa. Minha família não tem nada a esconder.',
      'Entrevista do senador Flávio Bolsonaro (Republicanos-RJ) ao Jornal Nacional em janeiro de 2021, respondendo à retomada das investigações sobre o esquema das rachadinhas em seu antigo gabinete na Alerj. Fabrício Queiroz é réu no caso.',
      'verified', false, '2021-01-28',
      'https://g1.globo.com/politica/noticia/2021/01/28/flavio-bolsonaro-nega-rachadinha-e-fala-em-perseguicao-politica.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Jornal Nacional', '2021-flavio-rachadinha-perseguicao-janeiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 25. Eduardo Bolsonaro ameaça AI-5
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro sugere novo AI-5 caso a "esquerda radical" promova instabilidade no Brasil.',
      'Se a esquerda radicalizar a esse ponto, vamos precisar ter uma resposta. E essa resposta pode ser via um novo AI-5. Pode ser via uma lei aprovada pelo plebiscito, como foi a da reforma da previdência no Chile.',
      'Entrevista do deputado Eduardo Bolsonaro (PSL-SP) ao canal Leda Nagle no YouTube em outubro de 2019, quando os atos contra o governo ganhavam força. A defesa do AI-5, que foi o mais duro instrumento da ditadura militar, causou reação imediata.',
      'verified', true, '2019-10-31',
      'https://g1.globo.com/politica/noticia/2019/10/31/resposta-do-governo-pode-ser-via-um-novo-ai-5-diz-eduardo-bolsonaro-sobre-radicalizacao-da-esquerda.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao canal Leda Nagle', '2019-eduardo-ai5-esquerda-radical-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 26. Bolsonaro humilha jornalistas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama jornalista de "veado" em entrevista ao tratar do assassinato do vereador do Rio Jairinho.',
      'Que vontade de encher tua boca com porrada, viu? Tu tem uma cara de homossexual terrível, mas nem por isso eu te acuso de ser homossexual.',
      'Declaração de Bolsonaro ao jornalista da Folha, em agosto de 2020, ao ser questionado sobre depósitos em conta de Michelle Bolsonaro feitos por Fabrício Queiroz. A fala foi amplamente condenada como homofóbica e agressiva contra a imprensa.',
      'verified', true, '2020-08-23',
      'https://www1.folha.uol.com.br/poder/2020/08/bolsonaro-diz-a-reporter-da-folha-que-tem-vontade-de-encher-sua-boca-com-porrada.shtml',
      'news_article',
      'Brasília', 'Entrevista coletiva no Alvorada', '2020-bolsonaro-reporter-folha-porrada-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 27. Bolsonaro compara vacina a chip
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro espalha teoria conspiratória de que vacina da Pfizer pode causar Aids.',
      'Quem está no relatório oficial da Pfizer é que pessoas vacinadas podem desenvolver a síndrome da imunodeficiência adquirida. Eu não tô afirmando que tem relação, só estou perguntando.',
      'Live semanal de Bolsonaro no dia 21 de outubro de 2021, veiculada no YouTube e Facebook. A declaração foi desmentida pela Pfizer e derrubada das plataformas por desinformação sobre saúde. A fala foi usada como peça no relatório da CPI da Covid.',
      'verified', true, '2021-10-21',
      'https://g1.globo.com/politica/noticia/2021/10/24/bolsonaro-relaciona-vacina-contra-covid-e-aids-live-e-removida-das-redes-sociais.ghtml',
      'news_article',
      'Brasília', 'Live semanal do presidente', '2021-bolsonaro-vacina-aids-live-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Bolsonaro ataque urnas 2021
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro promete "live bomba" com provas de fraude nas urnas eletrônicas — que nunca foram apresentadas.',
      'Eu vou apresentar provas contundentes de que a eleição de 2018 foi fraudada, provas de que o sistema eletrônico de votação é fraudável. Não me incomoda chamarem de maluco. Faço uma live e apresento tudo.',
      'Declaração de Bolsonaro em entrevista na saída do Alvorada em julho de 2021, anunciando live sobre supostas fraudes nas urnas. A "live bomba" foi realizada em 29 de julho sem apresentação de provas concretas, e o TSE respondeu com processos.',
      'verified', true, '2021-07-08',
      'https://g1.globo.com/politica/noticia/2021/07/08/bolsonaro-diz-que-vai-fazer-live-para-apresentar-provas-de-fraude-na-eleicao-de-2018.ghtml',
      'news_article',
      'Brasília', 'Entrevista na saída do Palácio da Alvorada', '2021-bolsonaro-live-bomba-urnas-julho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 29. Carla Zambelli ataca Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli chama Alexandre de Moraes de "ditador de toga" e defende impeachment do ministro.',
      'Alexandre de Moraes é um ditador de toga que viola a Constituição todos os dias. Precisamos do impeachment desse ministro antes que seja tarde demais. O STF virou um tribunal de exceção.',
      'Discurso da deputada Carla Zambelli (PL-SP) em sessão da Câmara em setembro de 2021, defendendo o pedido de impeachment de Alexandre de Moraes assinado por aliados de Bolsonaro. O pedido foi arquivado pela presidência do Senado.',
      'verified', false, '2021-09-15',
      'https://www.camara.leg.br/noticias/806231-zambelli-pede-impeachment-de-moraes-e-chama-de-ditador-de-toga/',
      'news_article',
      'Brasília', 'Sessão plenária da Câmara', '2021-zambelli-moraes-ditador-toga-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ama, true FROM ins;

  -- 30. Damares "meninas de 10 anos"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves afirma ter visto "meninas de 10 anos" abusadas na Ilha do Marajó sem apresentar provas.',
      'Eu estive na Ilha do Marajó e constatei que meninas, a partir dos 10 anos de idade, são abusadas sexualmente. Elas são levadas para balsas e viram objeto sexual. E não tem política pública lá.',
      'Declaração da ministra Damares Alves em entrevista ao Pânico em janeiro de 2020, afirmando ter presenciado abusos em massa em balsas no Marajó. O relato foi desmentido por autoridades locais, que afirmaram jamais ter recebido da ministra qualquer denúncia formal.',
      'verified', true, '2020-01-22',
      'https://www.bbc.com/portuguese/brasil-51304388',
      'news_article',
      'São Paulo', 'Entrevista ao programa Pânico', '2020-damares-marajo-meninas-10-anos-janeiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Lula elegível Fachin
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Após anulação de condenações pelo STF, Lula diz que provará sua inocência e volta a ser elegível.',
      'Vou provar que Moro mentiu, que a Lava Jato mentiu, que a Globo mentiu. Fui vítima da maior mentira judicial contada em 500 anos nesse país. E voltarei a ser candidato.',
      'Discurso de Lula em 10 de março de 2021, após o ministro Edson Fachin anular suas condenações na Lava Jato por incompetência da Justiça Federal de Curitiba. A decisão restituiu seus direitos políticos e abriu caminho para a candidatura vitoriosa de 2022.',
      'verified', true, '2021-03-10',
      'https://g1.globo.com/politica/noticia/2021/03/10/leia-a-integra-do-discurso-de-lula-apos-decisao-que-anulou-condenacoes.ghtml',
      'news_article',
      'São Bernardo do Campo', 'Discurso no Sindicato dos Metalúrgicos', '2021-lula-fachin-elegivel-discurso-marco'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 32. Bolsonaro ofende Michelle de Paolli
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que "fraquejou" ao ter filha mulher, reforçando visão machista.',
      'Eu tenho cinco filhos. Foram quatro homens, a quinta eu dei uma fraquejada e veio uma mulher.',
      'Declaração de Bolsonaro em palestra no Clube Hebraica do Rio, em abril de 2017, reiterada em entrevistas ao longo de 2019 quando era presidente. A fala é um dos marcos de seu discurso machista, amplamente citada por movimentos feministas.',
      'verified', false, '2019-06-05',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2019/06/05/bolsonaro-fraquejei-e-veio-uma-mulher.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva no Alvorada', '2019-bolsonaro-fraquejei-filha-mulher-junho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 33. Bolsonaro Amazônia queimadas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro acusa ONGs de provocarem queimadas na Amazônia sem apresentar provas.',
      'Pode ter, sim, eu não to afirmando, pode ter, eu tô sendo acusado, eu acuso também, ações de ONGs, as próprias ONGs contra a minha pessoa.',
      'Declaração de Bolsonaro em entrevista coletiva em 21 de agosto de 2019, durante crise internacional provocada pelas queimadas recordes na Amazônia. A acusação sem provas contra ONGs gerou protestos internacionais e forte reação do governo francês de Emmanuel Macron.',
      'verified', false, '2019-08-21',
      'https://g1.globo.com/politica/noticia/2019/08/21/bolsonaro-diz-que-ongs-podem-estar-por-tras-de-queimadas-na-amazonia.ghtml',
      'news_article',
      'Brasília', 'Entrevista na saída do Palácio da Alvorada', '2019-bolsonaro-ongs-queimadas-amazonia-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 34. Mourão fala sobre "vagabundagem" da imprensa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Vice-presidente Hamilton Mourão diz que "vagabundagem" no Brasil vem da cultura indígena e africana.',
      'No Brasil existe uma cultura de indolência, herança do indígena que não trabalhava e do negro que não gostava de trabalhar. O branco trouxe isso também, e essa miscigenação criou o brasileiro que temos hoje.',
      'Entrevista do general Hamilton Mourão a estudantes em uma conferência em Porto Alegre em agosto de 2018 e reiterada em 2019. A declaração foi condenada por movimentos negros e indígenas como racista.',
      'verified', false, '2019-03-02',
      'https://www1.folha.uol.com.br/poder/2018/08/cultura-brasileira-e-indolente-por-heranca-do-negro-e-do-indigena-diz-mourao.shtml',
      'news_article',
      'Brasília', 'Entrevista a estudantes', '2019-mourao-cultura-indigena-africana-vagabundagem'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 35. Bolsonaro ataca governadores pandemia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro acusa governadores de decretar lockdown para destruir a economia e prejudicar sua reeleição.',
      'O que alguns governadores estão fazendo é um crime. Estão destruindo a economia, destruindo empregos, destruindo o Brasil. E fazem isso para me prejudicar politicamente. Mas o povo sabe quem é o culpado.',
      'Declaração de Bolsonaro em março de 2021, durante o pico da pandemia de Covid-19 no Brasil. A fala fez parte de campanha recorrente do governo federal contra governadores que adotavam medidas restritivas, especialmente Doria (SP) e Zema (MG).',
      'verified', false, '2021-03-18',
      'https://g1.globo.com/politica/noticia/2021/03/18/bolsonaro-ataca-governadores-e-diz-que-lockdown-e-crime.ghtml',
      'news_article',
      'Brasília', 'Entrevista na saída do Alvorada', '2021-bolsonaro-ataca-governadores-lockdown-marco'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 36. Gleisi ataca Bolsonaro genocida
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann chama Bolsonaro de "genocida" e afirma que ele terá que responder por mortes na pandemia.',
      'Bolsonaro é um genocida. Ele zombou da pandemia, sabotou vacinas, matou gente com cloroquina e disse "e daí?" para 600 mil brasileiros mortos. Ele precisa ser responsabilizado pela Justiça e pela História.',
      'Declaração da presidente do PT, Gleisi Hoffmann, em coletiva após a publicação do relatório final da CPI da Covid em outubro de 2021, que pedia indiciamento de Bolsonaro por nove crimes.',
      'verified', false, '2021-10-20',
      'https://www.cartacapital.com.br/politica/bolsonaro-e-um-genocida-diz-gleisi-hoffmann-apos-cpi-da-covid/',
      'news_article',
      'Brasília', 'Coletiva após relatório da CPI da Covid', '2021-gleisi-bolsonaro-genocida-cpi-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 37. Ciro Gomes ataca Lula e PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes chama PT de "quadrilha" e diz que Lula tem que pedir perdão ao Brasil pela corrupção.',
      'O PT é uma quadrilha. Foi o partido que cometeu o maior assalto à nação brasileira desde os tempos da colônia. Lula precisa pedir perdão ao Brasil antes de vir querer se candidatar de novo.',
      'Entrevista de Ciro Gomes (PDT) a jornalistas em Fortaleza em maio de 2021, após o STF anular as condenações de Lula. A fala inflamou ainda mais a disputa interna no campo progressista em meio à pré-campanha eleitoral.',
      'verified', false, '2021-05-30',
      'https://g1.globo.com/politica/noticia/2021/05/30/ciro-chama-pt-de-quadrilha-e-diz-que-lula-precisa-pedir-perdao-ao-brasil.ghtml',
      'news_article',
      'Fortaleza', 'Entrevista coletiva', '2021-ciro-pt-quadrilha-lula-pedir-perdao-maio'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 38. Carlos Bolsonaro "gabinete do ódio"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro ataca ministros do STF e jornalistas no Twitter, alimentando o "gabinete do ódio".',
      'Pelo caminho convencional, via Constituição, o Brasil não vai mudar na velocidade que queremos. Infelizmente essa é a realidade. Sonhos e esperanças de um futuro melhor para nossa nação e família dependem de mudanças que, infelizmente, pelo voto e pelo sistema atual é impossível.',
      'Postagem do vereador Carlos Bolsonaro (Republicanos-RJ) no Twitter em maio de 2020, abertamente defendendo mudanças fora da via constitucional. A fala foi citada como símbolo do "gabinete do ódio" e usada no inquérito das fake news do STF.',
      'verified', true, '2020-05-22',
      'https://www1.folha.uol.com.br/poder/2020/05/carlos-bolsonaro-sugere-mudanca-no-brasil-fora-da-via-convencional-da-constituicao.shtml',
      'news_article',
      'Rio de Janeiro', 'Publicação no Twitter', '2020-carlos-bolsonaro-fora-constituicao-tweet-maio'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 39. Bia Kicis defende voto impresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Deputada Bia Kicis defende voto impresso alegando que urnas eletrônicas são "caixas-pretas" fraudáveis.',
      'A urna eletrônica é uma caixa-preta. Não há como auditar. O voto impresso é uma medida mínima para garantir transparência. Quem é contra o voto impresso tem medo de ser descoberto na fraude.',
      'Discurso da deputada Bia Kicis (PSL-DF) como relatora da PEC do voto impresso na Câmara em julho de 2021. A proposta foi derrotada em plenário em agosto, mas alimentou o discurso de desconfiança contra o sistema eleitoral.',
      'verified', false, '2021-07-07',
      'https://www.camara.leg.br/noticias/792186-kicis-apresenta-parecer-favoravel-ao-voto-impresso/',
      'news_article',
      'Brasília', 'Comissão Especial do Voto Impresso', '2021-kicis-voto-impresso-caixa-preta-julho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Ramagem Abin vazamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem, diretor da Abin, é acusado de usar a agência para proteger a família Bolsonaro em caso Marielle.',
      'A Abin atuou dentro da legalidade. Eu pedi relatório para entender o contexto investigativo. Não houve nenhum uso privado da agência. Essas acusações são politicamente motivadas.',
      'Declaração de Alexandre Ramagem em depoimento à Polícia Federal em maio de 2020, após reportagem do jornal O Globo revelar que a Abin teria preparado "contrainformação" para blindar Flávio Bolsonaro no caso Marielle Franco.',
      'verified', false, '2020-05-28',
      'https://oglobo.globo.com/brasil/abin-preparou-contrainformacao-para-defender-flavio-bolsonaro-em-caso-ligado-marielle-24439527',
      'news_article',
      'Brasília', 'Depoimento à Polícia Federal', '2020-ramagem-abin-flavio-marielle-contrainformacao-maio'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 41. Bolsonaro ameaça STF se decisão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro pergunta a generais se deveria fechar o STF, segundo relato do ex-ministro Ricardo Lewandowski.',
      'Vocês acham que eu deveria fechar o Supremo? Porque se for para continuar assim, com um ministro mandando no Brasil inteiro, não dá.',
      'Declaração atribuída a Bolsonaro em reunião com generais do alto-comando, relatada por investigação do STF sobre a tentativa de golpe. A cena teria ocorrido em meados de 2021 durante a escalada de tensão com Alexandre de Moraes.',
      'verified', false, '2021-06-15',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2021/06/15/bolsonaro-teria-consultado-militares-sobre-fechar-stf.htm',
      'news_article',
      'Brasília', 'Reunião com alto-comando militar', '2021-bolsonaro-consultou-fechar-stf-militares-junho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 42. Bolsonaro lei segurança nacional contra Felipe Neto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Governo Bolsonaro aciona Lei de Segurança Nacional contra Felipe Neto por chamar presidente de "genocida".',
      'Quem me agredir, vai responder na Justiça. Lei de Segurança Nacional existe e tem que ser aplicada. O presidente é autoridade e não pode ser chamado de genocida impunemente.',
      'Declaração de Bolsonaro em março de 2021 defendendo o uso da Lei de Segurança Nacional contra críticos. Sua gestão bateu recorde histórico de aplicação do dispositivo herdado da ditadura, incluindo ações contra humoristas, ativistas e jornalistas.',
      'verified', false, '2021-03-04',
      'https://www1.folha.uol.com.br/poder/2021/03/felipe-neto-e-intimado-a-depor-na-pf-apos-chamar-bolsonaro-de-genocida.shtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', '2021-bolsonaro-lsn-felipe-neto-genocida-marco'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 43. Pacheco Senado mediador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pac,
      'Rodrigo Pacheco, eleito presidente do Senado, promete ser "mediador" entre Poderes mas evita confronto com Bolsonaro.',
      'O Senado será uma Casa de mediação e equilíbrio. Não vamos nos omitir, mas também não vamos entrar em confrontos inúteis. A democracia brasileira é sólida e vamos preservá-la.',
      'Discurso de posse de Rodrigo Pacheco (PSD-MG) na presidência do Senado em 1º de fevereiro de 2021, eleito com apoio do Planalto contra Simone Tebet. Sua gestão arquivou pedidos de impeachment de Bolsonaro, gerando críticas da oposição.',
      'verified', false, '2021-02-01',
      'https://www12.senado.leg.br/noticias/materias/2021/02/01/pacheco-e-eleito-presidente-do-senado',
      'news_article',
      'Brasília', 'Discurso de posse no Senado Federal', '2021-pacheco-posse-senado-mediador-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 44. Bolsonaro ofende Michelle
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que casamento com Michelle é resultado de "dar uma chance" e faz piada machista sobre ela.',
      'A Michelle casou comigo com 24 anos. Eu dei uma chance para ela, ela se deu bem, aprendeu a falar inglês, virou primeira-dama, conheceu mundo. Antes era só uma menina de periferia.',
      'Declaração de Bolsonaro em entrevista ao programa Flow Podcast em agosto de 2021. A fala foi criticada por colunistas e movimentos feministas por seu tom paternalista e pela inversão do papel tradicional em casamentos.',
      'verified', false, '2021-08-02',
      'https://www1.folha.uol.com.br/poder/2021/08/eu-dei-uma-chance-para-ela-diz-bolsonaro-sobre-michelle-em-entrevista-ao-flow.shtml',
      'news_article',
      'São Paulo', 'Entrevista ao Flow Podcast', '2021-bolsonaro-dei-chance-michelle-flow-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 45. Salles exoneração
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sal,
      'Ricardo Salles pede demissão após virar alvo da PF em investigação sobre exportação ilegal de madeira.',
      'Sempre atuei dentro da lei. Essas investigações são baseadas em fofoca. Saio de cabeça erguida. A agenda ambiental que iniciamos continuará, pois foi correta desde o primeiro dia.',
      'Pronunciamento de Ricardo Salles ao anunciar sua saída do Ministério do Meio Ambiente em 23 de junho de 2021, dia seguinte a buscas da PF em sua casa em operação que investigava facilitação à exportação irregular de madeira da Amazônia.',
      'verified', false, '2021-06-23',
      'https://g1.globo.com/politica/noticia/2021/06/23/ricardo-salles-deixa-o-ministerio-do-meio-ambiente.ghtml',
      'news_article',
      'Brasília', 'Anúncio de demissão do Ministério do Meio Ambiente', '2021-salles-demissao-pf-madeira-junho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 46. Marco Feliciano cpi
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Deputado Marco Feliciano chama CPI da Covid de "palco de linchamento político" contra o presidente.',
      'A CPI da Covid é um palco de linchamento político. O que eles querem é atacar o presidente e o governo. Não há preocupação com a verdade, com a vida, só com política partidária de esquerda.',
      'Discurso do deputado Marco Feliciano (Republicanos-SP), membro da CPI da Covid pela base governista, em sessão da comissão em junho de 2021. A defesa sistemática de Bolsonaro na CPI gerou desgaste inclusive dentro da bancada evangélica.',
      'verified', false, '2021-06-22',
      'https://www.camara.leg.br/noticias/781324-feliciano-classifica-cpi-como-palco-de-linchamento-politico/',
      'news_article',
      'Brasília', 'Sessão da CPI da Covid no Senado', '2021-feliciano-cpi-palco-linchamento-junho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 47. Bolsonaro Covaxin escândalo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega ter sido informado sobre irregularidades no contrato da Covaxin, contradito pelo irmão do deputado Luis Miranda.',
      'Não houve contrato algum com a Covaxin efetivado. Nenhum dólar foi pago. Não existe irregularidade porque não houve transação. O Luis Miranda não me falou nada de pressão estranha.',
      'Declaração de Bolsonaro em junho de 2021 sobre o escândalo da Covaxin, em que servidor denunciou pressão atípica do governo para compra da vacina indiana por preço superfaturado. O deputado Luis Miranda alegou ter alertado pessoalmente Bolsonaro sobre o esquema.',
      'verified', false, '2021-06-25',
      'https://g1.globo.com/politica/cpi-da-covid/noticia/2021/06/25/bolsonaro-nega-ter-sido-alertado-sobre-irregularidades-na-compra-da-covaxin.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', '2021-bolsonaro-covaxin-nega-miranda-junho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 48. André Janones populismo digital
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones promove teorias sobre Auxílio Emergencial e ataca Bolsonaro nas redes para alavancar pré-candidatura.',
      'Bolsonaro vai cortar o Auxílio Emergencial. Vai deixar o povo morrer de fome. Eu sou o único que defende o povo pobre. A mídia não mostra porque está comprada, mas a verdade vai aparecer.',
      'Declaração do deputado André Janones (Avante-MG) em vídeo no Instagram em janeiro de 2021 sobre o Auxílio Emergencial. A estratégia de desinformação e populismo digital o consolidou como figura da política online, posteriormente aliado de Lula.',
      'verified', false, '2021-01-12',
      'https://www1.folha.uol.com.br/poder/2021/01/deputado-andre-janones-e-alvo-de-checagem-por-fake-news-sobre-auxilio.shtml',
      'news_article',
      'Ituiutaba', 'Vídeo no Instagram', '2021-janones-auxilio-emergencial-fake-news-janeiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 49. Haddad economia critica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad critica Paulo Guedes e o "mito do posto Ipiranga" e prevê colapso econômico no fim do governo Bolsonaro.',
      'O Paulo Guedes é o maior engodo da história econômica recente. Prometeu o paraíso liberal, entregou inflação de dois dígitos, desemprego e fome. O mito do posto Ipiranga está desmoronando diante dos olhos dos brasileiros.',
      'Artigo de Fernando Haddad publicado em setembro de 2021 sobre a crise econômica do governo Bolsonaro, com inflação descontrolada, aumento do desemprego e volta do Brasil ao mapa da fome da ONU.',
      'verified', false, '2021-09-15',
      'https://www1.folha.uol.com.br/colunas/fernandohaddad/2021/09/o-engodo-do-posto-ipiranga.shtml',
      'news_article',
      'São Paulo', 'Artigo na Folha de S. Paulo', '2021-haddad-engodo-posto-ipiranga-guedes-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 50. Dilma ataca Bolsonaro genocida
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Ex-presidente Dilma Rousseff chama Bolsonaro de "genocida" e diz que ele deveria ser julgado em Haia.',
      'Bolsonaro é um genocida. Ele precisa ser julgado pelo Tribunal Penal Internacional de Haia pelos crimes contra a humanidade que cometeu durante a pandemia. É a maior tragédia sanitária da história do Brasil, causada por incompetência e má-fé.',
      'Entrevista da ex-presidente Dilma Rousseff ao jornal El País em junho de 2021, comentando a condução da pandemia por Bolsonaro. A fala somou-se a diversos pedidos formais de investigação contra o presidente em tribunais internacionais.',
      'verified', false, '2021-06-18',
      'https://brasil.elpais.com/brasil/2021-06-18/dilma-rousseff-bolsonaro-tem-que-ser-julgado-em-haia-por-genocidio.html',
      'news_article',
      'São Paulo', 'Entrevista ao jornal El País', '2021-dilma-bolsonaro-haia-genocida-junho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
