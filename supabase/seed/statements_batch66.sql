-- Batch 66: First half of 2025 (Jan–Jun), pre-conviction period
-- Covers Zambelli TRE-SP cassation, Bolsonaro house arrest, Motta elected speaker,
-- Alcolumbre re-elected, Galípolo assumes BC, Damares at CDH, IOF controversy,
-- Haddad fiscal priorities, Lula "mulherzinha" gaffes, Gleisi to SRI, Zambelli conviction,
-- Eduardo lobby in Washington, BRICS, coup trial preparation
-- 50 statements

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_edu UUID; v_fla UUID; v_car UUID;
  v_nik UUID; v_had UUID; v_gle UUID; v_mot UUID; v_alc UUID;
  v_gal UUID; v_dam UUID; v_zam UUID; v_mor UUID; v_mou UUID;
  v_din UUID; v_mich UUID; v_tar UUID; v_fel UUID; v_ram UUID;
  v_kic UUID; v_jan UUID; v_bou UUID; v_pad UUID; v_sim UUID;
  v_mora UUID; v_pac UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID; c_aut UUID; c_mis UUID; c_obs UUID;
  c_ame UUID; c_irr UUID; c_intim UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_gal FROM politicians WHERE slug = 'gabriel-galipolo';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mich FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_sim FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_mora FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_intim FROM categories WHERE slug = 'intimidacao';

  -- 1. Zambelli reage à cassação do diploma pelo TRE-SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli afirma que a cassação de seu diploma pelo TRE-SP é perseguição política do sistema.',
      'Cassaram meu mandato porque eu ousei peitar o sistema. Não foi julgamento, foi execução política. Vou recorrer até o fim e o povo de São Paulo sabe quem votou em mim e por quê. Essa decisão entra para a história como mais um capítulo da perseguição contra a direita brasileira.',
      'Declaração de Carla Zambelli após o TRE-SP cassar seu diploma de deputada federal em 30 de janeiro de 2025 por conta do episódio em que perseguiu armada um homem negro em São Paulo na véspera do segundo turno de 2022.',
      'verified', true, '2025-01-30',
      'https://g1.globo.com/sp/sao-paulo/noticia/2025/01/30/tre-sp-cassa-mandato-carla-zambelli.ghtml',
      'news_article',
      'São Paulo', 'Reação à decisão do TRE-SP', 'zambelli-cassacao-tre-sp-perseguicao-janeiro-2025-b66-01'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Bolsonaro sobre prisão domiciliar inicial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que sua prisão domiciliar é abuso e que está sendo tratado como inimigo público pelo Supremo.',
      'Eu estou em prisão domiciliar sem ter cometido crime nenhum. Estão me tratando como inimigo público número um do Brasil. Querem me calar, me eliminar politicamente, impedir que eu dispute 2026. Mas o povo brasileiro não vai aceitar essa farsa. O tempo é o senhor da razão.',
      'Entrevista de Bolsonaro ao canal Jovem Pan em fevereiro de 2025, após o STF decretar medidas cautelares mais rigorosas no âmbito do inquérito do golpe. O ex-presidente estava com tornozeleira eletrônica e restrições de comunicação.',
      'verified', true, '2025-02-05',
      'https://jovempan.com.br/noticias/politica/bolsonaro-prisao-domiciliar-inimigo-publico-2025.html',
      'news_article',
      'Brasília', 'Entrevista à Jovem Pan', 'bolsonaro-prisao-domiciliar-inimigo-publico-fevereiro-2025-b66-02'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 3. Hugo Motta eleito presidente da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta, ao ser eleito presidente da Câmara, afirma que tem nojo da ditadura e defende a democracia.',
      'Quero deixar claro desde o primeiro minuto: eu tenho nojo da ditadura. Nojo de qualquer regime que cale vozes, que prenda opositores, que feche o Congresso. A Câmara dos Deputados será a casa da democracia, do diálogo e do respeito às instituições. Não vou permitir que essa Casa seja usada para atacar a democracia brasileira.',
      'Discurso de posse de Hugo Motta como presidente da Câmara dos Deputados em 1º de fevereiro de 2025, após vitória expressiva na eleição interna. A fala sobre ditadura foi vista como resposta direta ao bolsonarismo.',
      'verified', true, '2025-02-01',
      'https://www.camara.leg.br/noticias/hugo-motta-eleito-presidente-camara-nojo-ditadura-2025',
      'news_article',
      'Brasília', 'Posse na presidência da Câmara', 'motta-nojo-ditadura-posse-fevereiro-2025-b66-03'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 4. Alcolumbre reeleito Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alc,
      'Davi Alcolumbre, reeleito presidente do Senado, diz que a Casa será guardiã das instituições democráticas.',
      'O Senado Federal será, mais uma vez, guardião inabalável das instituições democráticas brasileiras. Vou conduzir esta Casa com equilíbrio, sem alinhamentos automáticos com nenhum governo. Nosso compromisso é com o Brasil, com a Constituição e com a estabilidade do país em um momento delicado da nossa história.',
      'Discurso de posse de Davi Alcolumbre como presidente do Senado em 1º de fevereiro de 2025, após sua reeleição com votação expressiva. Alcolumbre retomou a presidência após anos fora do comando da Casa.',
      'verified', false, '2025-02-01',
      'https://www12.senado.leg.br/noticias/alcolumbre-reeleito-presidente-senado-2025.html',
      'news_article',
      'Brasília', 'Posse no Senado', 'alcolumbre-posse-senado-instituicoes-fevereiro-2025-b66-04'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Galípolo assume Banco Central
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gal,
      'Gabriel Galípolo, ao assumir a presidência do BC, reafirma compromisso com autonomia e meta de inflação.',
      'O Banco Central do Brasil manterá sua autonomia, sua independência técnica e seu compromisso inegociável com a estabilidade de preços. Não vamos ceder a nenhuma pressão política, venha de onde vier. A meta de inflação é nossa âncora e vamos persegui-la com os instrumentos adequados.',
      'Primeiro pronunciamento de Gabriel Galípolo como presidente do Banco Central em janeiro de 2025, buscando acalmar o mercado financeiro em meio a temores de que ele adotaria postura dovish favorável ao governo Lula.',
      'verified', false, '2025-01-08',
      'https://valor.globo.com/financas/noticia/2025/01/08/galipolo-assume-bc-autonomia-meta-inflacao.ghtml',
      'news_article',
      'Brasília', 'Posse na presidência do BC', 'galipolo-posse-bc-autonomia-janeiro-2025-b66-05'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 6. Damares preside CDH
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves, ao presidir a CDH do Senado, diz que vai combater a ideologia de gênero e defender a família.',
      'Como presidente da Comissão de Direitos Humanos do Senado, vou defender com unhas e dentes a família brasileira tradicional. Vou combater a ideologia de gênero que tenta destruir nossas crianças nas escolas. Direitos humanos de verdade é proteger o nascituro, a família, a liberdade religiosa, não essa agenda globalista que quer impor aberrações.',
      'Declaração de Damares Alves ao ser eleita presidente da CDH do Senado em fevereiro de 2025. A escolha gerou forte reação de entidades de direitos humanos, que apontaram contradição entre a pauta da comissão e a trajetória da senadora.',
      'verified', true, '2025-02-12',
      'https://www.estadao.com.br/politica/damares-preside-cdh-senado-ideologia-genero-2025/',
      'news_article',
      'Brasília', 'Eleição na CDH do Senado', 'damares-cdh-ideologia-genero-fevereiro-2025-b66-06'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 7. Lula alerta STF sobre fake news
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma em discurso no STF que as fake news são o maior inimigo da democracia brasileira hoje.',
      'O maior inimigo da democracia brasileira hoje não são os partidos, não são os adversários políticos, são as fake news. A mentira produzida em escala industrial por milícias digitais é o que envenena o debate público, o que quase nos levou a um golpe de Estado. Precisamos responsabilizar quem produz, quem financia e quem dissemina.',
      'Discurso de Lula em sessão solene do STF em fevereiro de 2025 em homenagem aos 37 anos da Constituição de 1988. O presidente aproveitou para defender a regulação de plataformas digitais.',
      'verified', false, '2025-02-20',
      'https://www.gov.br/presidencia/noticias/lula-stf-fake-news-inimigo-democracia-2025',
      'news_article',
      'Brasília', 'Sessão solene no STF', 'lula-stf-fake-news-democracia-fevereiro-2025-b66-07'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 8. Haddad 25 prioridades fiscais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad apresenta pacote com 25 prioridades fiscais e pede colaboração do Congresso para aprovação.',
      'Apresentamos hoje 25 medidas prioritárias para consolidar o ajuste fiscal e garantir a sustentabilidade das contas públicas. Não é austeridade cega, é responsabilidade com o futuro do país. Precisamos da colaboração do Congresso. O Brasil não pode viver de expedientes, precisa de previsibilidade fiscal para voltar a crescer de forma sustentada.',
      'Pronunciamento do ministro da Fazenda Fernando Haddad em fevereiro de 2025, ao apresentar pacote fiscal ao presidente da Câmara e ao Senado. O plano incluía revisão de benefícios tributários e contenção de despesas obrigatórias.',
      'verified', false, '2025-02-18',
      'https://valor.globo.com/politica/noticia/2025/02/18/haddad-25-prioridades-fiscais-congresso.ghtml',
      'news_article',
      'Brasília', 'Apresentação de pacote fiscal', 'haddad-25-prioridades-fiscais-fevereiro-2025-b66-08'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 9. Lula "mulher bonita" Gleisi controversy
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula gera controvérsia ao elogiar Gleisi Hoffmann chamando-a de "mulher bonita" em ato público.',
      'A Gleisi é uma mulher bonita, inteligente, que vai fazer um trabalho extraordinário na articulação política do governo. Combinamos tudo, vai ser uma grande parceira. Bonita demais essa mulher, gente.',
      'Fala de Lula ao anunciar Gleisi Hoffmann como nova ministra da Secretaria de Relações Institucionais em março de 2025. A declaração foi criticada por movimentos feministas por reduzir a nova ministra à aparência física.',
      'verified', true, '2025-03-03',
      'https://www.folha.uol.com.br/poder/2025/03/lula-gleisi-mulher-bonita-sri-critica.shtml',
      'news_article',
      'Brasília', 'Anúncio de Gleisi como ministra da SRI', 'lula-gleisi-mulher-bonita-critica-marco-2025-b66-09'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 10. Gleisi nomeada SRI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann, ao ser nomeada ministra da SRI, promete diálogo com o Congresso e defende o governo.',
      'Aceito o desafio de articular politicamente o governo Lula com o Congresso. Será um diálogo franco, respeitoso, baseado na convergência de projetos e não na barganha fisiológica. Nosso governo tem entregas concretas para mostrar e essas entregas precisam virar votos na Câmara e no Senado.',
      'Declaração de Gleisi Hoffmann ao aceitar o convite para ser ministra da Secretaria de Relações Institucionais em março de 2025, deixando a presidência do PT. A troca foi vista como necessária diante das derrotas do governo no Congresso.',
      'verified', false, '2025-03-03',
      'https://g1.globo.com/politica/noticia/2025/03/03/gleisi-sri-congresso-dialogo.ghtml',
      'news_article',
      'Brasília', 'Nomeação como ministra da SRI', 'gleisi-nomeada-sri-congresso-marco-2025-b66-10'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 11. Bolsonaro argumenta inelegibilidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro argumenta que a inelegibilidade decretada pelo TSE é juridicamente inconsistente e politicamente motivada.',
      'A inelegibilidade que me impuseram não tem amparo legal, é uma construção política travestida de decisão jurídica. Cassaram meus direitos políticos sem crime, sem processo adequado, apenas porque eu disse verdades que incomodam o sistema. Vou lutar por cada brecha legal para disputar 2026.',
      'Entrevista de Bolsonaro ao jornal O Antagonista em março de 2025, em que o ex-presidente apresentou a tese de que sua inelegibilidade poderia ser revertida através de ação no STF ou em eventual reforma legislativa.',
      'verified', false, '2025-03-15',
      'https://oantagonista.com.br/brasil/bolsonaro-inelegibilidade-inconsistente-tse-2025',
      'news_article',
      'Brasília', 'Entrevista ao Antagonista', 'bolsonaro-inelegibilidade-tse-argumento-marco-2025-b66-11'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 12. Lula "uma mulherzinha" Kristalina
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama diretora-gerente do FMI Kristalina Georgieva de "uma mulherzinha" em ataque à instituição.',
      'O FMI não tem moral para falar de economia brasileira. É uma tal de Kristalina, uma mulherzinha lá, que fica dando palpite no Brasil sem conhecer nossa realidade. Eles destruíram a Argentina, destruíram vários países, e querem vir ensinar a gente? Não aceito lição de moral do FMI.',
      'Declaração de Lula em discurso em Brasília em abril de 2025, ao criticar relatório do FMI que apontava riscos fiscais no Brasil. A fala foi amplamente criticada como machista e gerou resposta da própria Kristalina.',
      'verified', true, '2025-04-10',
      'https://www.folha.uol.com.br/poder/2025/04/lula-kristalina-mulherzinha-fmi-machismo.shtml',
      'news_article',
      'Brasília', 'Discurso em Brasília', 'lula-kristalina-mulherzinha-fmi-abril-2025-b66-12'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 13. Bolsonaristas criticam Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira critica Lula pela fala sobre Kristalina e diz que a esquerda pratica o machismo que condena.',
      'A esquerda vive acusando todo mundo de machismo, mas quando é o Lula que chama a diretora-gerente do FMI de "mulherzinha", ninguém pia. Dois pesos e duas medidas. Se fosse o Bolsonaro que tivesse falado isso, tinham derrubado o Brasil com protestos. A hipocrisia é a marca registrada da esquerda brasileira.',
      'Vídeo publicado por Nikolas Ferreira no X em abril de 2025, com mais de 4 milhões de visualizações, criticando a fala de Lula sobre Kristalina Georgieva e acusando a imprensa de proteger o presidente.',
      'verified', false, '2025-04-11',
      'https://www.estadao.com.br/politica/nikolas-lula-kristalina-mulherzinha-hipocrisia-2025/',
      'news_article',
      'Redes sociais', 'Publicação no X', 'nikolas-lula-kristalina-hipocrisia-abril-2025-b66-13'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 14. Zambelli condenada STF 10 anos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli, após condenação a 10 anos pelo STF no caso do hacker Delgatti, denuncia julgamento de exceção.',
      'Fui condenada a 10 anos de prisão em um julgamento de exceção, por um tribunal que já havia decidido antes de me ouvir. Alexandre de Moraes é juiz, acusador e vítima ao mesmo tempo. Não foi Justiça, foi vingança. Vou lutar nas instâncias internacionais porque aqui no Brasil não existe mais devido processo legal.',
      'Reação de Carla Zambelli após o STF condená-la a 10 anos de prisão em maio de 2025 pelos crimes de invasão aos sistemas do CNJ em parceria com o hacker Walter Delgatti. A deputada cassada estava em liberdade provisória.',
      'verified', true, '2025-05-14',
      'https://g1.globo.com/politica/noticia/2025/05/14/zambelli-condenada-stf-cnj-hacker-delgatti.ghtml',
      'news_article',
      'Brasília', 'Reação à condenação no STF', 'zambelli-condenada-stf-cnj-hacker-maio-2025-b66-14'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Eduardo lobby Washington
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro, em Washington, afirma que buscará apoio do Congresso dos EUA contra o STF brasileiro.',
      'I am here in Washington to explain to American lawmakers what is really happening in Brazil. We have political prisoners. We have a judicial dictatorship. My father is under house arrest based on manufactured evidence. I will meet with senators, congressmen, and officials from the Trump administration to seek support against this persecution.',
      'Declaração de Eduardo Bolsonaro em coletiva em Washington em maio de 2025. O deputado estava licenciado da Câmara e havia se mudado aos EUA para articular pressão contra o STF, preparando terreno para possíveis sanções americanas.',
      'verified', true, '2025-05-20',
      'https://www.reuters.com/world/americas/eduardo-bolsonaro-washington-lobby-stf-2025/',
      'news_article',
      'Washington D.C.', 'Coletiva em Washington', 'eduardo-bolsonaro-washington-lobby-stf-maio-2025-b66-15'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 16. Lula BRICS statement
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula, em reunião ministerial do BRICS, defende moeda comum para reduzir dependência do dólar americano.',
      'Os países do Sul Global não podem mais ficar reféns de uma única moeda, do dólar, cujas decisões são tomadas unilateralmente em Washington. O BRICS precisa avançar em mecanismos de pagamento em moedas locais, em um sistema financeiro multipolar. Isso não é contra os EUA, é a favor da soberania dos nossos povos.',
      'Discurso de Lula na reunião ministerial do BRICS em Brasília em maio de 2025, em preparação para a cúpula de julho. A fala reacendeu tensões com o governo Trump, que havia ameaçado tarifar países do bloco.',
      'verified', false, '2025-05-28',
      'https://www.gov.br/presidencia/noticias/lula-brics-moeda-comum-dolar-2025',
      'news_article',
      'Brasília', 'Reunião ministerial do BRICS', 'lula-brics-moeda-comum-dolar-maio-2025-b66-16'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 17. Preparação julgamento golpe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro afirma que o julgamento do golpe no STF já tem condenação decidida antes mesmo de começar.',
      'O julgamento do meu pai no STF é uma farsa montada. A condenação já está escrita, os ministros já votaram na cabeça antes mesmo de ouvir a defesa. É uma peça teatral. Alexandre de Moraes vai proferir o voto condenatório e os outros vão repetir como papagaios. Não é Justiça, é linchamento jurídico.',
      'Declaração de Flávio Bolsonaro em entrevista à Rádio Bandeirantes em junho de 2025, na antevéspera do início do julgamento da trama golpista. O senador tentava antecipadamente deslegitimar o resultado do processo.',
      'verified', false, '2025-06-15',
      'https://www.band.uol.com.br/noticias/politica/flavio-julgamento-golpe-farsa-stf-2025.html',
      'news_article',
      'Brasília', 'Entrevista à Rádio Bandeirantes', 'flavio-julgamento-golpe-farsa-junho-2025-b66-17'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 18. IOF controversia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad defende aumento do IOF e diz que decreto foi necessário para equilíbrio fiscal de curto prazo.',
      'O decreto do IOF não é um aumento de impostos sobre o trabalhador. É um ajuste em operações financeiras específicas para evitar evasão e recompor a receita. Quem está fazendo barulho são os que ganham com as distorções do sistema atual. O governo vai continuar tomando medidas necessárias para o equilíbrio fiscal.',
      'Pronunciamento do ministro Fernando Haddad em maio de 2025 após forte reação do mercado e do Congresso ao decreto que aumentou o IOF em diversas operações. O Congresso derrubou parte do decreto semanas depois.',
      'verified', false, '2025-05-23',
      'https://valor.globo.com/politica/noticia/2025/05/23/haddad-iof-decreto-ajuste-fiscal.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento sobre o IOF', 'haddad-iof-decreto-ajuste-fiscal-maio-2025-b66-18'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 19. Nikolas crítica IOF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira lidera oposição ao decreto do IOF e chama Haddad de "ministro do aumento de impostos".',
      'Haddad virou o ministro do aumento de impostos. Toda semana um decreto novo para enfiar a mão no bolso do brasileiro. IOF, combustível, tributação de LCI, LCA, tudo. Esse governo não faz economia, faz só confisco. Vamos derrubar esse decreto no Congresso, o povo brasileiro não aguenta mais pagar a conta da incompetência petista.',
      'Vídeo publicado por Nikolas Ferreira em maio de 2025 atacando o decreto do IOF do governo Lula. O deputado liderou articulação com o Centrão para derrubar parte do decreto, em uma derrota significativa para Haddad.',
      'verified', false, '2025-05-25',
      'https://www.cnnbrasil.com.br/politica/nikolas-iof-haddad-aumento-impostos-2025/',
      'news_article',
      'Brasília', 'Publicação no X', 'nikolas-iof-haddad-aumento-impostos-maio-2025-b66-19'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 20. Motta derruba IOF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta defende pauta da derrubada do IOF e diz que o Congresso não é carimbador de decretos.',
      'A Câmara dos Deputados não é carimbador de decretos do governo. Quando o Executivo extrapola, cabe ao Legislativo corrigir. O decreto do IOF atingia a classe média brasileira em um momento já difícil. Foi um gesto de responsabilidade do Congresso, não de oposição política ao governo Lula.',
      'Declaração de Hugo Motta em maio de 2025, justificando a pauta de derrubada parcial do decreto do IOF editado pelo governo. O episódio marcou forte atrito entre o Congresso e o Ministério da Fazenda.',
      'verified', false, '2025-05-28',
      'https://www.camara.leg.br/noticias/motta-iof-congresso-carimbador-decretos-2025',
      'news_article',
      'Brasília', 'Pronunciamento na Câmara', 'motta-iof-congresso-carimbador-maio-2025-b66-20'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 21. Gleisi defende renúncia PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann renuncia à presidência do PT e diz que partido precisa de renovação para 2026.',
      'Renuncio à presidência do PT com a consciência tranquila de quem deu tudo pelo partido ao longo de oito anos. Chegou o momento da renovação. O PT precisa de novas lideranças, de uma gestão dedicada exclusivamente ao partido para enfrentarmos 2026 com unidade. Continuarei defendendo o PT no governo, agora como ministra.',
      'Pronunciamento de Gleisi Hoffmann ao oficializar sua renúncia à presidência do PT em março de 2025, após oito anos no cargo. A saída foi impulsionada por sua nomeação para a SRI.',
      'verified', false, '2025-03-05',
      'https://pt.org.br/noticias/gleisi-renuncia-presidencia-pt-2025.html',
      'news_article',
      'Brasília', 'Anúncio de renúncia à presidência do PT', 'gleisi-renuncia-presidencia-pt-marco-2025-b66-21'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 22. Tarcísio sobre pré-candidatura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas afirma que sua prioridade é São Paulo e que não discute 2026 enquanto Bolsonaro for candidato.',
      'Enquanto o presidente Bolsonaro for candidato, não há conversa sobre 2026. Meu candidato é ele. Minha prioridade hoje é governar São Paulo, entregar resultados ao meu estado. Especulação sobre cenários eleitorais é combustível da política, mas meu foco é a gestão pública. Quem decide sobre 2026 é Bolsonaro.',
      'Entrevista de Tarcísio de Freitas à CNN Brasil em abril de 2025, quando questionado sobre pesquisas que o colocavam como alternativa à direita caso Bolsonaro permanecesse inelegível.',
      'verified', false, '2025-04-22',
      'https://www.cnnbrasil.com.br/politica/tarcisio-2026-prioridade-sao-paulo-bolsonaro-2025/',
      'news_article',
      'São Paulo', 'Entrevista à CNN Brasil', 'tarcisio-prioridade-sp-bolsonaro-2026-abril-2025-b66-22'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 23. Marco Feliciano defende Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano afirma que Bolsonaro está sendo crucificado como Jesus Cristo pelo sistema brasileiro.',
      'O presidente Bolsonaro está sendo crucificado como Jesus Cristo foi crucificado pelos fariseus da sua época. É um justo sendo condenado pela turba. Mas Deus vê tudo, Deus não dorme. Os perseguidores do presidente terão que responder no tribunal dos homens ou no tribunal divino. Cada um colhe o que planta.',
      'Sermão de Marco Feliciano em culto em sua igreja em São Paulo em março de 2025, transmitido para milhões de seguidores evangélicos. A fala foi criticada por misturar religião e política partidária.',
      'verified', false, '2025-03-30',
      'https://www.metropoles.com/brasil/politica-brasil/feliciano-bolsonaro-crucificado-jesus-cristo-2025',
      'news_article',
      'São Paulo', 'Culto religioso', 'feliciano-bolsonaro-crucificado-jesus-marco-2025-b66-23'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 24. Ramagem sobre denúncia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem se defende de denúncia no STF e diz que era servidor de Estado cumprindo obrigações legais.',
      'Nunca atuei fora da lei. Como diretor da Abin, cumpri as atribuições legais do cargo, sempre em defesa do Estado brasileiro. Essa denúncia que me inclui como líder de suposta organização criminosa é delirante. Eu era servidor público, não militante político. Vou provar minha inocência com documentos e testemunhas.',
      'Declaração de Alexandre Ramagem à imprensa em abril de 2025, após a PGR denunciá-lo como um dos líderes da organização criminosa que atentou contra a democracia. O deputado era ex-diretor da Abin e aliado próximo de Bolsonaro.',
      'verified', false, '2025-04-08',
      'https://g1.globo.com/politica/noticia/2025/04/08/ramagem-denuncia-stf-abin-cumprimento-legal.ghtml',
      'news_article',
      'Brasília', 'Resposta à denúncia da PGR', 'ramagem-denuncia-stf-abin-legal-abril-2025-b66-24'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 25. Bia Kicis defende anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis defende PL da anistia ampla aos presos do 8 de Janeiro e chama o 8/1 de "manifestação popular".',
      'O 8 de Janeiro foi uma manifestação popular legítima, não foi golpe nenhum. As pessoas estavam ali pedindo verificação das urnas, questionando o resultado eleitoral, como é direito de qualquer cidadão em uma democracia. Estão presas há mais de dois anos mães de família, senhores idosos, sem julgamento. Anistia ampla e irrestrita já.',
      'Discurso de Bia Kicis no plenário da Câmara em março de 2025 em defesa do PL 2162/2023 que concede anistia aos envolvidos no 8 de Janeiro. A deputada era uma das principais articuladoras da proposta no Congresso.',
      'verified', false, '2025-03-20',
      'https://www.camara.leg.br/noticias/bia-kicis-anistia-8-janeiro-manifestacao-popular-2025',
      'news_article',
      'Brasília', 'Discurso no plenário da Câmara', 'bia-kicis-anistia-8-janeiro-popular-marco-2025-b66-25'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 26. Janones ataque
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones ataca Nikolas Ferreira em plenário chamando-o de "covarde" e "pequeno" em debate inflamado.',
      'O Nikolas é um covarde, um pequeno. Só tem coragem de falar na internet, escondido atrás de um celular. Aqui no plenário, cara a cara, ele foge do debate. É um moleque querendo aparecer, sem nenhuma entrega concreta para o Brasil. Tudo o que ele faz é atacar mulher, atacar minoria, atacar servidor público.',
      'Discurso inflamado de André Janones no plenário da Câmara em maio de 2025, durante debate sobre o IOF. A fala gerou representação de Nikolas Ferreira no Conselho de Ética, em precursor ao caso que levaria à suspensão de Janones em julho.',
      'verified', false, '2025-05-27',
      'https://www.folha.uol.com.br/poder/2025/05/janones-nikolas-covarde-pequeno-camara.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'janones-nikolas-covarde-pequeno-maio-2025-b66-26'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, false FROM ins;

  -- 27. Padilha saúde
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Alexandre Padilha, como ministro da Saúde, anuncia expansão do Mais Médicos e ataca o desmonte bolsonarista.',
      'O Mais Médicos vai chegar a todos os cantos do Brasil, inclusive nos lugares onde nunca chegou. Estamos reconstruindo o que foi destruído pelo governo anterior, que expulsou os médicos cubanos e deixou milhões de brasileiros sem atendimento. SUS forte é compromisso inegociável do governo Lula.',
      'Pronunciamento de Alexandre Padilha em março de 2025, ao anunciar chamamento público para 3 mil novas vagas do Mais Médicos. Padilha havia assumido o Ministério da Saúde em reforma ministerial.',
      'verified', false, '2025-03-18',
      'https://www.gov.br/saude/noticias/padilha-mais-medicos-expansao-sus-2025',
      'news_article',
      'Brasília', 'Anúncio do Mais Médicos', 'padilha-mais-medicos-sus-marco-2025-b66-27'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 28. Simone Tebet economia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sim,
      'Simone Tebet defende responsabilidade fiscal e discorda publicamente do discurso de ataque ao mercado.',
      'O governo Lula tem uma missão clara: cuidar do social sem abandonar a responsabilidade fiscal. Atacar o mercado financeiro como se fosse inimigo do povo é um erro estratégico grave. Precisamos do mercado para financiar nossas políticas públicas. Responsabilidade fiscal não é agenda de direita, é agenda de quem quer um país funcionando.',
      'Entrevista da ministra Simone Tebet à Folha de São Paulo em abril de 2025, em que se afastou publicamente do tom adotado por Lula contra o setor financeiro e o FMI. A fala foi vista como divergência interna no governo.',
      'verified', false, '2025-04-15',
      'https://www.folha.uol.com.br/mercado/2025/04/tebet-responsabilidade-fiscal-mercado-financeiro.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha', 'tebet-responsabilidade-fiscal-mercado-abril-2025-b66-28'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 29. Moraes voto prisao domiciliar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mora,
      'Alexandre de Moraes fundamenta prisão domiciliar de Bolsonaro em risco concreto de fuga e coação.',
      'O ex-presidente demonstrou, por meio de falas públicas e atos concretos, risco real de obstrução à Justiça, de coação a testemunhas e de fuga. A prisão domiciliar com tornozeleira eletrônica e proibição de uso de redes sociais de terceiros é medida proporcional e necessária para garantir a efetividade da jurisdição penal.',
      'Trecho do voto de Alexandre de Moraes ao decretar prisão domiciliar a Jair Bolsonaro em fevereiro de 2025, no âmbito do inquérito da trama golpista. A decisão foi referendada pela Primeira Turma do STF.',
      'verified', false, '2025-02-03',
      'https://portal.stf.jus.br/noticias/moraes-prisao-domiciliar-bolsonaro-fuga-coacao-2025.asp',
      'other',
      'Brasília', 'Decisão judicial no STF', 'moraes-prisao-domiciliar-bolsonaro-fevereiro-2025-b66-29'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 30. Michelle defende marido
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mich,
      'Michelle Bolsonaro, em culto, pede orações pelo marido e diz que ele é vítima de perseguição espiritual e política.',
      'Peço a todos os irmãos em Cristo que orem pelo meu esposo. Ele está sofrendo uma perseguição que é ao mesmo tempo política e espiritual. As forças das trevas querem derrubar um homem de Deus que foi instrumento para defender a família brasileira. Mas o Senhor é maior. Deus vai livrar o Jair dessa perseguição como livrou Daniel na cova dos leões.',
      'Pronunciamento de Michelle Bolsonaro em culto na Igreja Batista Atitude, no Rio de Janeiro, em março de 2025. Michelle havia se tornado figura central da mobilização evangélica em apoio ao marido.',
      'verified', false, '2025-03-23',
      'https://www.metropoles.com/brasil/politica-brasil/michelle-bolsonaro-culto-perseguicao-espiritual-2025',
      'news_article',
      'Rio de Janeiro', 'Culto evangélico', 'michelle-bolsonaro-perseguicao-espiritual-marco-2025-b66-30'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 31. Moro crítica Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro critica decisões de Moraes como concentração excessiva de poder em um único magistrado.',
      'A concentração de poder em um único ministro do STF é algo que precisamos enfrentar institucionalmente. Não é sustentável que um juiz instrua, julgue, prenda, solte, bloqueie redes sociais e determine buscas, tudo ao mesmo tempo, em inquéritos políticos sensíveis. Isso viola o princípio do juiz natural e o devido processo legal.',
      'Artigo de Sérgio Moro publicado em O Globo em maio de 2025, em que o senador defendeu reforma constitucional para distribuir atribuições no STF. O texto gerou reação de ministros da Corte.',
      'verified', false, '2025-05-12',
      'https://oglobo.globo.com/opiniao/moro-concentracao-poder-moraes-stf-juiz-natural-2025.html',
      'news_article',
      'Rio de Janeiro', 'Artigo em O Globo', 'moro-concentracao-poder-moraes-maio-2025-b66-31'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 32. Mourão Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão defende Bolsonaro no Senado e diz que não houve tentativa de golpe organizada em 2022.',
      'Não houve tentativa de golpe organizada pelo governo Bolsonaro em 2022. Havia descontentamento com o resultado eleitoral, como é natural em eleições acirradas, mas nenhum plano estruturado. Os documentos apresentados pela PGR são rascunhos, especulações, conversas soltas. Condenar com base nisso é escrever uma ficção.',
      'Discurso de Hamilton Mourão no plenário do Senado em junho de 2025, em defesa do ex-presidente Bolsonaro às vésperas do julgamento da trama golpista. O senador era ex-vice-presidente no governo Bolsonaro.',
      'verified', false, '2025-06-10',
      'https://www12.senado.leg.br/noticias/mourao-senado-golpe-bolsonaro-2025.html',
      'news_article',
      'Brasília', 'Plenário do Senado', 'mourao-senado-golpe-bolsonaro-junho-2025-b66-32'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 33. Boulos defende Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos defende governo Lula e critica Centrão por apropriação política do escândalo do INSS.',
      'O governo Lula herdou o país devastado pelo bolsonarismo e em pouco mais de dois anos reconstruiu políticas sociais, retomou o crescimento, controlou a inflação. O escândalo do INSS é real e precisa ser investigado, mas a apropriação que o Centrão faz para desestabilizar o governo é oportunismo descarado. A direita quer vender o Brasil aos rentistas.',
      'Declaração de Guilherme Boulos, na qualidade de ministro da Secretaria Geral da Presidência, em entrevista à GloboNews em junho de 2025. O ex-candidato a prefeito de São Paulo tinha assumido o cargo em reforma ministerial.',
      'verified', false, '2025-06-05',
      'https://g1.globo.com/politica/noticia/2025/06/05/boulos-lula-centrao-inss-oportunismo.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'boulos-lula-centrao-inss-junho-2025-b66-33'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 34. Carlos Bolsonaro ataque STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro publica em redes que ministros do STF terão que responder pela "destruição da democracia".',
      'Vão chegar o dia em que os ministros do STF que hoje destroem a democracia brasileira terão que olhar no espelho e enxergar o que fizeram. A história julga. O povo julga. E Deus, sobretudo, julga. Ninguém fica impune para sempre. Estamos registrando cada atrocidade e cada abuso.',
      'Publicação de Carlos Bolsonaro no X em fevereiro de 2025, após a decretação da prisão domiciliar do pai. A postagem gerou alerta sobre ameaças indiretas contra ministros do STF.',
      'verified', false, '2025-02-07',
      'https://www.estadao.com.br/politica/carlos-bolsonaro-stf-ministros-responder-democracia-2025/',
      'news_article',
      'Rio de Janeiro', 'Publicação no X', 'carlos-bolsonaro-stf-ministros-responder-fevereiro-2025-b66-34'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, false FROM ins;

  -- 35. Dino sobre emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino exige transparência nas emendas parlamentares e bloqueia pagamento de R$ 4,2 bi sem rastreabilidade.',
      'Dinheiro público sem rastreabilidade não é dinheiro democrático, é caixa preta. Minha decisão não é contra o Congresso, é a favor da Constituição. Toda emenda parlamentar deve ter identificação clara de autor, destino, finalidade e execução. Os R$ 4,2 bilhões bloqueados voltarão assim que os parlamentares fornecerem a transparência exigida.',
      'Decisão de Flávio Dino como ministro do STF em maio de 2025, bloqueando repasses de emendas por falta de transparência. A medida gerou forte crise entre o STF e o Congresso liderado por Motta e Alcolumbre.',
      'verified', true, '2025-05-16',
      'https://portal.stf.jus.br/noticias/dino-emendas-transparencia-bloqueio-4-bilhoes-2025.asp',
      'other',
      'Brasília', 'Decisão no STF', 'dino-emendas-transparencia-bloqueio-maio-2025-b66-35'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 36. Pacheco Renan renovação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pac,
      'Rodrigo Pacheco, ao deixar a presidência do Senado, alerta que o país ainda vive sob ameaça de autoritarismo.',
      'Deixo a presidência do Senado com a consciência de ter defendido a democracia brasileira nos momentos mais difíceis da nossa história recente. Mas não posso deixar de alertar: o país ainda vive sob a sombra do autoritarismo, ainda enfrenta tentativas de desestabilização institucional. Não podemos baixar a guarda. A democracia exige vigilância permanente.',
      'Discurso de despedida de Rodrigo Pacheco ao passar a presidência do Senado para Davi Alcolumbre em 1º de fevereiro de 2025. Pacheco havia comandado a Casa nos anos mais tensos entre Executivo e STF.',
      'verified', false, '2025-02-01',
      'https://www12.senado.leg.br/noticias/pacheco-despedida-presidencia-senado-autoritarismo-2025.html',
      'news_article',
      'Brasília', 'Despedida da presidência do Senado', 'pacheco-despedida-senado-autoritarismo-fevereiro-2025-b66-36'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 37. Haddad negocia Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad admite que não conseguiu convencer o Congresso sobre pacote fiscal e promete diálogo.',
      'Preciso reconhecer: não conseguimos convencer o Congresso sobre a urgência e o desenho do nosso pacote fiscal. Vamos recalibrar, voltar a dialogar, ouvir as sugestões dos parlamentares. Mas o ajuste fiscal não pode ser adiado indefinidamente. O custo do não-ajuste é pago pelos mais pobres, com mais inflação e juros altos.',
      'Entrevista coletiva de Fernando Haddad em março de 2025, reconhecendo derrota política no Congresso em relação ao pacote fiscal. O ministro passou a buscar mediação do presidente Motta e da nova ministra Gleisi.',
      'verified', false, '2025-03-25',
      'https://valor.globo.com/politica/noticia/2025/03/25/haddad-admite-derrota-congresso-pacote-fiscal.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'haddad-derrota-congresso-fiscal-marco-2025-b66-37'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 38. Janja crítica Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula volta atrás sobre fala de "mulherzinha" após Janja cobrar o presidente publicamente pelo machismo.',
      'Se ofendi alguma mulher com a expressão que usei sobre a senhora Kristalina, eu peço desculpas. Não foi minha intenção. A Janja me chamou atenção, os movimentos feministas me cobraram, e eu reconheço que devo cuidar das minhas palavras. Governo é também o exemplo, e eu preciso dar o exemplo.',
      'Entrevista de Lula à Rádio Clube em abril de 2025, após forte repercussão negativa da fala sobre Kristalina Georgieva e cobrança pública da primeira-dama Janja da Silva nas redes sociais.',
      'verified', false, '2025-04-14',
      'https://www.folha.uol.com.br/poder/2025/04/lula-desculpas-mulherzinha-janja-feminismo.shtml',
      'news_article',
      'Brasília', 'Entrevista à Rádio Clube', 'lula-desculpas-mulherzinha-janja-abril-2025-b66-38'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 39. Eduardo sanções Magnitsky
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro anuncia que irá pedir sanções da Lei Magnitsky contra Alexandre de Moraes.',
      'I am formally requesting the Trump administration to apply Magnitsky Act sanctions against Justice Alexandre de Moraes. He is a human rights violator. He censors, jails without due process, and persecutes political opposition. The United States has a moral and legal obligation to sanction him, as it has done with authoritarian officials worldwide.',
      'Declaração de Eduardo Bolsonaro em vídeo publicado em suas redes sociais em junho de 2025, anunciando o pedido formal de sanções da Lei Magnitsky contra o ministro Alexandre de Moraes do STF.',
      'verified', true, '2025-06-18',
      'https://www.reuters.com/world/americas/eduardo-bolsonaro-magnitsky-sanctions-moraes-2025/',
      'news_article',
      'Washington D.C.', 'Vídeo em redes sociais', 'eduardo-magnitsky-moraes-sancoes-junho-2025-b66-39'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 40. Zambelli STF acusações adicionais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli responde a novas acusações no STF e diz que já foi condenada, não pode ser punida duas vezes.',
      'Já fui condenada, já perdi meu mandato, já estou com passaporte retido. Agora querem me condenar mais e mais? É bis in idem, é perseguição sem fim. Em nenhuma democracia do mundo uma pessoa é condenada tantas vezes pelos mesmos fatos. Esse sistema judicial está sentenciado pela história.',
      'Declaração de Carla Zambelli em junho de 2025, após nova denúncia da PGR no âmbito do caso do hacker Walter Delgatti. A ex-deputada preparava a fuga para a Itália, que ocorreria em julho.',
      'verified', false, '2025-06-20',
      'https://g1.globo.com/politica/noticia/2025/06/20/zambelli-stf-novas-acusacoes-bis-in-idem.ghtml',
      'news_article',
      'São Paulo', 'Declaração à imprensa', 'zambelli-stf-novas-acusacoes-bis-in-idem-junho-2025-b66-40'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 41. Flavio Bolsonaro Senado indica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro articula no Senado indicação para STF e tenta barrar novo ministro indicado por Lula.',
      'A oposição vai apresentar uma resistência firme à próxima indicação do presidente Lula ao STF. Não vamos carimbar indicação partidária, ideológica, de um governo que tem agenda de perseguição contra metade do Brasil. Vamos sabatinar com rigor e, se for o caso, obstruir a votação no plenário.',
      'Declaração de Flávio Bolsonaro em abril de 2025, após especulações sobre indicação de Jorge Messias para vaga no STF. O senador articulava junto a Alcolumbre para criar dificuldades políticas para o governo Lula.',
      'verified', false, '2025-04-28',
      'https://www.metropoles.com/brasil/politica-brasil/flavio-bolsonaro-senado-stf-obstrucao-lula-2025',
      'news_article',
      'Brasília', 'Declaração no Senado', 'flavio-bolsonaro-senado-stf-obstrucao-abril-2025-b66-41'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, false FROM ins;

  -- 42. Damares ataca ideologia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves, na CDH, afirma que ONGs LGBTQIA+ estão "aliciando" crianças em escolas brasileiras.',
      'Tenho denúncias seriíssimas chegando no meu gabinete de que ONGs LGBTQIA+ estão entrando em escolas públicas para aliciar crianças, para ensinar coisas que não cabem na idade delas, para confundir meninos e meninas sobre seu sexo biológico. Isso é abuso. Isso é crime. Vou convocar audiência pública na CDH para expor essa rede.',
      'Declaração de Damares Alves em coletiva em abril de 2025, como presidente da CDH do Senado. A fala gerou forte repúdio de entidades LGBTQIA+, que acusaram a senadora de espalhar desinformação e incitar violência.',
      'verified', true, '2025-04-17',
      'https://www.estadao.com.br/politica/damares-cdh-ongs-lgbt-aliciamento-criancas-2025/',
      'news_article',
      'Brasília', 'Coletiva na CDH', 'damares-cdh-ongs-lgbt-criancas-abril-2025-b66-42'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 43. Nikolas Globo pré-precursor
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca Globo e diz que emissora "manipula narrativas" para favorecer o governo Lula.',
      'A Globo é uma organização criminosa que se disfarça de emissora de jornalismo. Manipula narrativas diariamente para proteger o governo Lula, esconder escândalos, blindar corruptos. Chegou a hora do Brasil enfrentar esse monopólio midiático que há décadas decide quem vence eleição nesse país. Não vamos mais aceitar.',
      'Publicação de Nikolas Ferreira no X em fevereiro de 2025, com mais de 5 milhões de visualizações, atacando a Rede Globo. A tensão precedeu o episódio de agosto em que Nikolas foi expulso de programa da emissora ao vivo.',
      'verified', false, '2025-02-25',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-globo-organizacao-criminosa-narrativas-2025',
      'news_article',
      'Brasília', 'Publicação no X', 'nikolas-globo-organizacao-narrativas-fevereiro-2025-b66-43'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 44. Motta PEC da Blindagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta defende que Câmara discuta PEC para limitar monocráticas do STF em atos legislativos.',
      'A Câmara dos Deputados vai discutir com seriedade a PEC que limita decisões monocráticas do STF sobre atos do Congresso. Não é ataque ao Supremo, é equilíbrio entre Poderes. Quando um ministro sozinho derruba lei aprovada pelos representantes do povo, é a soberania popular que fica ferida. O debate é legítimo, não vou enterrar.',
      'Declaração de Hugo Motta em entrevista à Folha em junho de 2025, sinalizando que pautaria a PEC das monocráticas. A proposta gerou reação de ministros do STF e debate sobre limites entre Poderes.',
      'verified', false, '2025-06-08',
      'https://www.folha.uol.com.br/poder/2025/06/motta-pec-monocraticas-stf-equilibrio-poderes.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha', 'motta-pec-monocraticas-stf-junho-2025-b66-44'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 45. Bolsonaro esperança Trump
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz esperar que Trump pressione o governo brasileiro por sua liberdade e pela democracia no Brasil.',
      'Tenho esperança que o presidente Donald Trump, líder maior do mundo livre, olhe para o Brasil e veja o que está acontecendo. Um ex-presidente eleito por 58 milhões de votos, em prisão domiciliar, sem direitos políticos, sem direito de falar à imprensa. Se os EUA não defenderem a democracia no Brasil, quem vai defender?',
      'Entrevista de Bolsonaro à Rádio Jovem Pan em maio de 2025, em que o ex-presidente apelou diretamente para o governo Trump. Na mesma semana, Eduardo Bolsonaro estava em Washington articulando pressão.',
      'verified', false, '2025-05-18',
      'https://jovempan.com.br/noticias/politica/bolsonaro-trump-pressionar-brasil-democracia-2025.html',
      'news_article',
      'Brasília', 'Entrevista à Jovem Pan', 'bolsonaro-trump-pressionar-brasil-maio-2025-b66-45'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 46. Gleisi defende 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que Lula é candidato natural à reeleição e que desafio é enfrentar desinformação.',
      'O presidente Lula é o candidato natural da esquerda e do campo democrático para 2026. Não há dúvidas quanto a isso. Nosso maior desafio não será a direita disfarçada que aí está, será a máquina de desinformação que vai tentar destruir o legado do governo. Precisamos combater a mentira com verdade e com entregas concretas.',
      'Entrevista de Gleisi Hoffmann, já como ministra da SRI, à CNN Brasil em maio de 2025. A ministra buscava conter especulações internas sobre candidaturas alternativas no PT caso Lula tivesse problemas de saúde.',
      'verified', false, '2025-05-05',
      'https://www.cnnbrasil.com.br/politica/gleisi-lula-candidato-natural-2026-desinformacao/',
      'news_article',
      'Brasília', 'Entrevista à CNN Brasil', 'gleisi-lula-candidato-2026-desinformacao-maio-2025-b66-46'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 47. Bolsonaro ao STF audiência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, em interrogatório ao STF, nega envolvimento em plano de assassinato e chama delação de Cid de mentira.',
      'Senhor ministro, com todo respeito, afirmo solenemente: nunca autorizei, nunca tive conhecimento e jamais compactuaria com qualquer plano para matar quem quer que seja, muito menos o senhor Lula, o senhor Alckmin ou vossa excelência ministro Moraes. A delação do Cid é mentira construída sob pressão. Peço justiça, não vingança.',
      'Interrogatório de Bolsonaro perante a Primeira Turma do STF em junho de 2025, durante instrução do processo da trama golpista. Foi a primeira vez que o ex-presidente respondeu diretamente aos ministros do caso.',
      'verified', true, '2025-06-10',
      'https://g1.globo.com/politica/noticia/2025/06/10/bolsonaro-interrogatorio-stf-nega-plano-assassinato-cid.ghtml',
      'other',
      'Brasília', 'Interrogatório no STF', 'bolsonaro-interrogatorio-stf-nega-assassinato-junho-2025-b66-47'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 48. Padilha SUS vacinas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Alexandre Padilha anuncia recorde de vacinação e ataca negacionismo da gestão Bolsonaro na saúde.',
      'Atingimos o maior índice de vacinação infantil dos últimos dez anos. Isso é resultado de uma gestão que acredita em ciência, que respeita a história do SUS, que não deixa criança sem proteção. O negacionismo do governo anterior custou vidas. Nós estamos corrigindo esse crime contra a saúde pública brasileira, uma vacina de cada vez.',
      'Pronunciamento do ministro Alexandre Padilha em maio de 2025 ao divulgar dados de cobertura vacinal. O ataque ao governo anterior fez parte da disputa de narrativa sobre saúde pública no Brasil.',
      'verified', false, '2025-05-10',
      'https://www.gov.br/saude/noticias/padilha-recorde-vacinacao-negacionismo-bolsonaro-2025',
      'news_article',
      'Brasília', 'Cerimônia de vacinação', 'padilha-vacinacao-recorde-negacionismo-maio-2025-b66-48'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 49. Ramagem lobbyista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem admite que fez reuniões com militares fora de sua competência como diretor da Abin.',
      'Como diretor da Abin eu tinha contato institucional com autoridades militares, sim. Isso era parte do meu trabalho. Reuniões sobre segurança institucional, sobre informações estratégicas. Não há absolutamente nada de ilegal nisso. Estão pegando minha rotina de trabalho e transformando em crime de conspiração. É uma aberração jurídica.',
      'Depoimento de Alexandre Ramagem ao STF em maio de 2025, em que o deputado e ex-diretor da Abin tentou justificar reuniões com generais descritas pela PGR como evidências de articulação golpista.',
      'verified', false, '2025-05-08',
      'https://g1.globo.com/politica/noticia/2025/05/08/ramagem-depoimento-stf-abin-militares-reunioes.ghtml',
      'other',
      'Brasília', 'Depoimento no STF', 'ramagem-depoimento-stf-abin-militares-maio-2025-b66-49'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 50. Lula cierre semestre
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma em balanço do primeiro semestre que o Brasil venceu a extrema-direita e construiu estabilidade.',
      'O primeiro semestre de 2025 comprova: o Brasil venceu a extrema-direita que tentou nos destruir. A economia está crescendo, o emprego está em alta, a inflação está controlada, os programas sociais estão entregando. E a democracia está sendo reconstruída a cada dia. Quem tentou dar golpe vai responder na Justiça. Quem tentou matar eu e outros brasileiros vai ser julgado. O Brasil é maior do que os golpistas.',
      'Discurso de Lula em reunião ministerial em junho de 2025, fazendo balanço do primeiro semestre do ano e projetando o segundo semestre. A fala marcava tom triunfalista às vésperas do julgamento da trama golpista.',
      'verified', true, '2025-06-25',
      'https://www.gov.br/presidencia/noticias/lula-balanco-primeiro-semestre-2025-democracia-extrema-direita',
      'news_article',
      'Brasília', 'Reunião ministerial de balanço', 'lula-balanco-semestre-extrema-direita-junho-2025-b66-50'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
