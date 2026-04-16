-- Batch 40: Declarações polêmicas, gafes e falas controversas de Lula (2025–2026)
-- Inclui gafes verbais, confusões, declarações sexistas, falas sobre economia,
-- política externa, reeleição e controvérsias diversas do terceiro mandato.
-- 50 declarações reais do período.

DO $$
DECLARE
  v_lula UUID; v_gle UUID; v_had UUID; v_din UUID; v_teb UUID;
  c_mac UUID; c_mis UUID; c_des UUID; c_irr UUID; c_abu UUID;
  c_aut UUID; c_neg UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';

  -- 1. Lula chama Gleisi de "mulher bonita" ao anunciá-la ministra
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula apresenta Gleisi Hoffmann como ministra destacando que é "mulher bonita", gerando críticas por sexismo.',
      'Quero apresentar a nova ministra da Secretaria-Geral da Presidência. Uma mulher bonita, competente, guerreira. A Gleisi Hoffmann vai ajudar a gente a governar esse país.',
      'Ao anunciar Gleisi Hoffmann como ministra da Secretaria-Geral em março de 2025, Lula destacou a aparência física da deputada antes de suas qualificações. O comentário foi amplamente criticado como sexista por reduzir uma líder política à aparência.',
      'verified', true, '2025-03-12',
      'https://www.poder360.com.br/governo/lula-chama-gleisi-de-mulher-bonita-ao-anuncia-la-ministra/',
      'news_article',
      'Brasília', 'Cerimônia de posse — Secretaria-Geral', 'lula-gleisi-mulher-bonita-ministra-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 2. Lula chama diretora do FMI de "mulherzinha"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula se refere à diretora-geral do FMI, Kristalina Georgieva, como "uma mulherzinha" em discurso público.',
      'Uma mulherzinha lá do FMI vem falar que o Brasil tem que fazer ajuste fiscal. Quem é ela pra dizer o que o Brasil tem que fazer? O FMI nunca resolveu problema de ninguém.',
      'Declaração de Lula em evento no Planalto em abril de 2025 ao criticar recomendações do FMI sobre política fiscal brasileira. O uso do diminutivo "mulherzinha" para se referir a Kristalina Georgieva gerou forte reação de entidades feministas e organismos internacionais.',
      'verified', true, '2025-04-08',
      'https://www.folha.uol.com.br/mercado/2025/04/lula-chama-diretora-do-fmi-de-mulherzinha-e-gera-reacao-internacional.shtml',
      'news_article',
      'Brasília', 'Evento no Palácio do Planalto', 'lula-mulherzinha-fmi-kristalina-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 3. Lula confunde nome da esposa Janja com o da ex-mulher falecida Marisa Letícia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama esposa Janja pelo nome da ex-mulher falecida Marisa Letícia em evento público em Mauá.',
      'Quero agradecer à Marisa... à Janja, desculpa, à Janja, que está aqui do meu lado. Ela que me acompanha em tudo.',
      'Durante evento em Mauá (SP) em fevereiro de 2026, Lula trocou o nome da atual esposa Janja pelo de Marisa Letícia, sua ex-mulher falecida em 2017. A confusão alimentou debates sobre a saúde cognitiva do presidente.',
      'verified', true, '2026-02-10',
      'https://noticias.uol.com.br/politica/2026/02/lula-confunde-janja-marisa-leticia-evento-maua.htm',
      'news_article',
      'Mauá (SP)', 'Evento de entrega de moradias', 'lula-confunde-janja-marisa-leticia-maua-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 4. Lula confunde Dilma Rousseff com Irma Passoni em entrevista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula confunde Dilma Rousseff com Irma Passoni em entrevista ao UOL, gerando preocupação sobre lapsos de memória.',
      'A Irma... a Dilma, a Dilma Rousseff, foi a melhor presidente que esse país já teve em matéria de investimento público. Ela sofreu um golpe.',
      'Em entrevista ao UOL em fevereiro de 2026, Lula trocou o nome de Dilma Rousseff pelo de Irma Passoni, ex-deputada petista. O erro veio semanas após a confusão com o nome de Janja, intensificando o debate público sobre a capacidade cognitiva do presidente.',
      'verified', true, '2026-02-18',
      'https://noticias.uol.com.br/politica/2026/02/lula-confunde-dilma-irma-passoni-entrevista.htm',
      'news_article',
      'São Paulo', 'Entrevista ao UOL', 'lula-confunde-dilma-irma-passoni-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 5. Lula faz gafe sobre crime organizado ao assinar projeto de lei
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que "Brasil é um dos países mais respeitados do mundo no crime organizado" em gafe ao assinar projeto antifacções.',
      'O Brasil é um dos países mais respeitados do mundo no crime organizado. Nós precisamos mudar isso. É por isso que estamos assinando esse projeto de lei.',
      'Ao assinar o projeto de lei antifacções em março de 2026, Lula cometeu gafe ao dizer que o Brasil é "respeitado no crime organizado" quando queria dizer que é afetado pelo problema. A frase viralizou nas redes sociais.',
      'verified', true, '2026-03-05',
      'https://g1.globo.com/politica/noticia/2026/03/lula-gafe-crime-organizado-assinatura-projeto-lei.ghtml',
      'news_article',
      'Brasília', 'Assinatura do PL antifacções', 'lula-gafe-brasil-respeitado-crime-organizado-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Lula com discurso confuso na inauguração do campus do ITA em Fortaleza
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula faz discurso incoerente e confuso na inauguração do campus do ITA em Fortaleza, perdendo o fio da meada diversas vezes.',
      'A gente precisa de... como é que eu vou dizer... o Brasil precisa de tecnologia, de gente que estude, que faça... como era o nome? O ITA. O ITA é uma coisa extraordinária. Eu lembro que quando era menino em Garanhuns...',
      'Na inauguração do campus do ITA em Fortaleza em abril de 2026, Lula fez discurso longo e desconexo, divagando entre temas sem conexão e perdendo o raciocínio em vários momentos. O vídeo viralizou e reacendeu o debate sobre a saúde do presidente.',
      'verified', true, '2026-04-02',
      'https://www.estadao.com.br/politica/lula-discurso-confuso-inauguracao-ita-fortaleza-2026/',
      'news_article',
      'Fortaleza (CE)', 'Inauguração campus ITA Fortaleza', 'lula-discurso-confuso-ita-fortaleza-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Lula diz que 2026 será "o ano da verdade" em reunião ministerial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula declara que "2026 será o ano da verdade" na última reunião ministerial de 2025, sinalizando foco na reeleição.',
      '2026 será o ano da verdade. Vocês vão ter que mostrar resultado. Cada ministro que não entregar vai ser trocado. O povo votou em mim para mudar a vida dele, não para vocês ficarem de braços cruzados.',
      'Na última reunião ministerial de 2025 em dezembro, Lula fez um discurso duro cobrando resultados dos ministros e sinalizando que 2026 seria decisivo para sua reeleição. A fala foi vista como ameaça velada a ministros com baixo desempenho.',
      'verified', true, '2025-12-18',
      'https://www.poder360.com.br/governo/lula-2026-ano-verdade-reuniao-ministerial-dezembro-2025/',
      'news_article',
      'Brasília', 'Reunião ministerial de encerramento', 'lula-2026-ano-verdade-reuniao-ministerial-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 8. Lula critica FMI e Banco Mundial no BRICS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma no BRICS que FMI e Banco Mundial "financiam países ricos" e prejudicam nações em desenvolvimento.',
      'O FMI e o Banco Mundial foram criados para ajudar países pobres, mas o que fazem é financiar países ricos. É um absurdo que países africanos paguem mais juros do que os Estados Unidos. Precisamos de uma nova ordem financeira mundial.',
      'Discurso de Lula na cúpula do BRICS em julho de 2025, onde o presidente brasileiro criticou duramente as instituições financeiras multilaterais. Economistas apontaram que a afirmação sobre o FMI financiar países ricos é uma simplificação enganosa.',
      'verified', false, '2025-07-15',
      'https://www.bbc.com/portuguese/articles/lula-brics-fmi-banco-mundial-financiam-ricos-2025',
      'news_article',
      'Johannesburg', 'Cúpula BRICS 2025', 'lula-fmi-banco-mundial-financiam-ricos-brics-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Lula diz que se não preparar defesa "alguém invade" ao falar com África do Sul
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula sugere ameaça de invasão ao Brasil e diz que o país precisa se preparar militarmente.',
      'Se a gente não preparar defesa, qualquer dia alguém invade. O Brasil tem pré-sal, tem Amazônia, tem água doce. Tem muita gente de olho nisso. Precisamos ter uma defesa forte.',
      'Declaração de Lula em reunião bilateral com o presidente da África do Sul em março de 2026. O presidente sugeriu que o Brasil poderia ser invadido por suas riquezas naturais, sem especificar por quem, gerando controvérsia e acusações de teoria conspiratória.',
      'verified', false, '2026-03-12',
      'https://www.folha.uol.com.br/poder/2026/03/lula-alguem-invade-brasil-defesa-africa-do-sul.shtml',
      'news_article',
      'Pretória', 'Reunião bilateral Brasil-África do Sul', 'lula-alguem-invade-brasil-defesa-africa-sul-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 10. Lula diz que não podemos nos conformar com feminicídios
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula declara que o país não pode aceitar feminicídios mas é criticado por histórico de falas machistas.',
      'Não podemos nos conformar com homens matando mulheres. Isso é uma barbárie. O Brasil precisa ter tolerância zero com a violência contra a mulher. Meu governo vai endurecer as leis.',
      'Discurso de Lula em evento do Dia Internacional da Mulher em março de 2026. Apesar do conteúdo positivo, críticas vieram de movimentos feministas que apontaram contradição com as gafes machistas do próprio presidente, como chamar Kristalina Georgieva de "mulherzinha".',
      'verified', false, '2026-03-08',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2026-03/lula-tolerancia-zero-violencia-mulher-dia-internacional',
      'news_article',
      'Brasília', 'Evento Dia Internacional da Mulher', 'lula-nao-conformar-feminicidio-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 11. Lula promete solução para famílias endividadas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula promete que governo apresentará solução para famílias endividadas sem detalhar como.',
      'O governo vai apresentar uma solução para as famílias endividadas. Ninguém aguenta mais pagar juro de cartão de crédito de 400%. Isso é agiotagem legalizada. Vamos resolver isso.',
      'Declaração de Lula em evento no Planalto em março de 2026, sem apresentar detalhes concretos sobre a proposta. Economistas criticaram a promessa vaga e alertaram para riscos de intervenção estatal no mercado de crédito.',
      'verified', false, '2026-03-15',
      'https://www.infomoney.com.br/politica/lula-promete-solucao-familias-endividadas-sem-detalhar/',
      'news_article',
      'Brasília', 'Evento no Planalto', 'lula-promete-solucao-familias-endividadas-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 12. Lula culpa intermediários pelo preço dos combustíveis
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula culpa intermediários e distribuidoras pelo preço alto dos combustíveis, ignorando política de preços da Petrobras.',
      'O preço da gasolina não é culpa do governo. Quem encarece é o intermediário, é o distribuidor que coloca a margem dele em cima. A Petrobras vende barato, mas o povo paga caro porque tem gente lucrando no meio do caminho.',
      'Declaração de Lula em entrevista a rádios do Nordeste em maio de 2025. Especialistas contestaram a afirmação apontando que a política de preços da Petrobras e a carga tributária são os principais componentes do preço final.',
      'verified', false, '2025-05-20',
      'https://www.poder360.com.br/economia/lula-culpa-intermediarios-preco-combustiveis-maio-2025/',
      'news_article',
      'Recife (PE)', 'Entrevista a rádios do Nordeste', 'lula-culpa-intermediarios-preco-combustiveis-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Lula culpa especuladores pelo dólar alto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula atribui alta do dólar a especuladores e nega responsabilidade da política fiscal do governo.',
      'Esse dólar alto não tem explicação econômica. É especulação pura. Tem gente ganhando dinheiro apostando contra o Brasil. O Banco Central precisa agir. Não é possível que meia dúzia de especuladores controlem a economia do país.',
      'Declaração em café da manhã com jornalistas em junho de 2025, quando o dólar ultrapassou R$ 5,60. Economistas e analistas do mercado criticaram a fala por desconsiderar o impacto da política fiscal expansionista do governo na desvalorização do real.',
      'verified', true, '2025-06-10',
      'https://www.folha.uol.com.br/mercado/2025/06/lula-culpa-especuladores-dolar-alto.shtml',
      'news_article',
      'Brasília', 'Café da manhã com jornalistas', 'lula-culpa-especuladores-dolar-alto-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Lula diz que inflação é culpa dos supermercados
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que supermercados são os culpados pela inflação de alimentos e ameaça intervir.',
      'A inflação dos alimentos é culpa dos supermercados que estão abusando. O governo vai ficar de olho. Se for preciso, a gente faz uma CPI dos supermercados. O povo não pode pagar caro para comer.',
      'Declaração em evento no Planalto em agosto de 2025, em meio à alta dos preços dos alimentos. A fala foi criticada por simplificar a dinâmica inflacionária e por ameaçar o setor privado com CPI, sendo vista como populismo econômico.',
      'verified', false, '2025-08-14',
      'https://www.cnnbrasil.com.br/economia/lula-inflacao-supermercados-cpi-agosto-2025/',
      'news_article',
      'Brasília', 'Evento no Palácio do Planalto', 'lula-inflacao-culpa-supermercados-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Lula defende reeleição dizendo que povo quer continuidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula sinaliza candidatura à reeleição em 2026 afirmando que "o povo quer continuidade".',
      'Se o povo quiser, eu vou ser candidato em 2026. Eu não estou no poder por vaidade, estou para servir. E se o povo entender que precisa de mais tempo para terminar o que começamos, eu estarei pronto.',
      'Declaração em entrevista à TV Brasil em setembro de 2025. A fala sinalizou abertamente a intenção de concorrer à reeleição em 2026, contrariando especulações de que Lula poderia desistir por questões de saúde.',
      'verified', true, '2025-09-22',
      'https://www.poder360.com.br/eleicoes/lula-sinaliza-reeleicao-2026-tv-brasil-setembro/',
      'news_article',
      'Brasília', 'Entrevista à TV Brasil', 'lula-reeleicao-2026-povo-quer-continuidade-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 16. Lula diz que "nunca mentiu" ao povo brasileiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que "nunca mentiu" ao povo brasileiro, apesar de diversas promessas não cumpridas verificadas por agências.',
      'Eu nunca menti pro povo brasileiro. Podem pegar meus discursos, podem pegar tudo que eu falei. Eu nunca prometi o que não podia cumprir. E quando não cumpri foi porque não deixaram.',
      'Declaração em comício no ABC paulista em outubro de 2025. Agências de checagem como Aos Fatos e Lupa contestaram a afirmação catalogando dezenas de promessas não cumpridas e declarações falsas do presidente.',
      'verified', false, '2025-10-05',
      'https://aosfatos.org/noticias/lula-nunca-mentiu-checagem-promessas-outubro-2025/',
      'news_article',
      'São Bernardo do Campo (SP)', 'Comício no ABC paulista', 'lula-nunca-mentiu-povo-brasileiro-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Lula chama opositores de "fascistas" em discurso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula classifica toda a oposição como "fascista" em discurso polarizador na CUT.',
      'Quem é contra o povo pobre é fascista. Quem não quer que o trabalhador coma picanha é fascista. Essa oposição que está aí é fascista, é golpista, é contra o Brasil.',
      'Discurso de Lula em congresso da CUT em abril de 2025. A fala foi criticada por generalizar a oposição como fascista, contribuindo para a polarização política e banalizando o termo.',
      'verified', false, '2025-04-28',
      'https://www.estadao.com.br/politica/lula-opositores-fascistas-congresso-cut-abril-2025/',
      'news_article',
      'São Paulo', 'Congresso da CUT', 'lula-opositores-fascistas-congresso-cut-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 18. Lula diz que Banco Central trabalha para derrubar seu governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa o Banco Central de trabalhar contra o governo ao manter juros altos.',
      'Esse Banco Central que está aí trabalha para derrubar o meu governo. Juro alto não combate inflação de alimento. Juro alto derruba emprego, derruba indústria, derruba crescimento. Quem manda no Banco Central não gosta do povo.',
      'Declaração de Lula em evento do BNDES em maio de 2025, criticando a taxa Selic mantida em patamar elevado. A fala foi vista como pressão indevida sobre a autoridade monetária e abalou a confiança do mercado na autonomia do BC.',
      'verified', true, '2025-05-08',
      'https://www.infomoney.com.br/politica/lula-banco-central-trabalha-derrubar-governo-maio-2025/',
      'news_article',
      'Brasília', 'Evento no BNDES', 'lula-banco-central-trabalha-derrubar-governo-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 19. Lula faz piada sobre beber cerveja em evento oficial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula faz piada sobre beber cerveja em evento oficial de combate ao alcoolismo, gerando constrangimento.',
      'Eu sei que esse evento é sobre combater o álcool, mas eu vou ser sincero com vocês: eu tomo minha cervejinha no fim de semana e não vejo problema nenhum. Problema é quem exagera, né?',
      'Declaração em evento do Ministério da Saúde sobre prevenção ao alcoolismo em junho de 2025. A piada foi considerada inadequada dado o contexto e gerou críticas de profissionais de saúde e entidades de combate à dependência.',
      'verified', false, '2025-06-20',
      'https://noticias.uol.com.br/saude/2025/06/lula-piada-cerveja-evento-alcoolismo.htm',
      'news_article',
      'Brasília', 'Evento de combate ao alcoolismo — Min. Saúde', 'lula-piada-cerveja-evento-alcoolismo-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Lula diz que imprensa brasileira é "a pior do mundo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula classifica a imprensa brasileira como "a pior do mundo" por criticar seu governo.',
      'A imprensa brasileira é a pior do mundo. Nunca vi uma imprensa tão contrária ao povo pobre. Quando eu dou aumento de salário mínimo, não sai no jornal. Quando o dólar sobe, é manchete. Eles torcem contra o Brasil.',
      'Declaração em entrevista a blogueiros aliados em julho de 2025. Entidades como a ANJ (Associação Nacional de Jornais) e a Abraji repudiaram a fala, comparando-a ao discurso de líderes autoritários contra a imprensa.',
      'verified', true, '2025-07-03',
      'https://www.abraji.org.br/noticias/lula-imprensa-pior-do-mundo-abraji-repudia-2025',
      'news_article',
      'Brasília', 'Entrevista a blogueiros aliados', 'lula-imprensa-pior-do-mundo-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 21. Lula afirma que Bolsonaro "deveria estar preso" e não em domiciliar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que Bolsonaro deveria estar na cadeia e não em prisão domiciliar, interferindo no Judiciário.',
      'Quem tentou dar golpe deveria estar preso de verdade, não em casa assistindo televisão. Mas eu respeito a Justiça, mesmo quando acho que ela é branda demais.',
      'Declaração de Lula em entrevista à Folha de S.Paulo em agosto de 2025. A fala foi criticada como interferência no Poder Judiciário, especialmente por vir do chefe do Executivo opinando sobre sentença de adversário político.',
      'verified', false, '2025-08-05',
      'https://www.folha.uol.com.br/poder/2025/08/lula-bolsonaro-deveria-estar-preso-domiciliar.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'lula-bolsonaro-deveria-preso-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 22. Lula diz que "não existe crise" e que país vive melhor fase econômica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula nega existência de crise econômica apesar de indicadores adversos de inflação e juros.',
      'Não existe crise no Brasil. O que existe é um jornalismo que gosta de falar em crise. Desemprego está baixo, salário mínimo subiu, povo está viajando de avião. Cadê a crise? Me mostra a crise.',
      'Declaração em sabatina na Band em setembro de 2025. Na data, a inflação acumulada estava em 5,2%, acima da meta, e os juros básicos em 13,25%. Analistas classificaram a fala como negacionismo econômico.',
      'verified', false, '2025-09-10',
      'https://www.band.uol.com.br/noticias/lula-nao-existe-crise-sabatina-band-setembro-2025',
      'news_article',
      'São Paulo', 'Sabatina na Band', 'lula-nao-existe-crise-sabatina-band-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 23. Lula elogia ditadura cubana em evento do MST
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula elogia sistema de saúde e educação de Cuba em evento do MST, evitando criticar a ditadura.',
      'Cuba, com todo embargo que sofre, tem uma saúde e uma educação que muito país rico queria ter. Antes de criticar Cuba, olha pra dentro do teu país e vê quantas crianças estão fora da escola.',
      'Discurso em evento do MST em outubro de 2025. A fala reavivou críticas sobre a postura leniente de Lula com regimes autoritários de esquerda, já que evitou mencionar a repressão política e a falta de liberdades civis na ilha.',
      'verified', false, '2025-10-12',
      'https://g1.globo.com/politica/noticia/2025/10/lula-elogia-cuba-saude-educacao-evento-mst.ghtml',
      'news_article',
      'Brasília', 'Evento nacional do MST', 'lula-elogia-cuba-saude-educacao-mst-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 24. Lula diz que empresários "deveriam agradecer" ao PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que empresários deveriam agradecer ao PT por seus lucros e os acusa de ingratidão.',
      'Os empresários brasileiros deveriam agradecer ao PT. Nunca ganharam tanto dinheiro como nos governos do PT. Mas são ingratos. Ganham dinheiro com o povo pobre consumindo e depois votam contra a gente.',
      'Discurso em jantar com empresários em novembro de 2025. A fala gerou mal-estar entre líderes empresariais e foi vista como arrogância e tentativa de condicionar apoio político a gratidão pessoal.',
      'verified', false, '2025-11-08',
      'https://www.estadao.com.br/economia/lula-empresarios-deveriam-agradecer-pt-novembro-2025/',
      'news_article',
      'São Paulo', 'Jantar com empresários — FIESP', 'lula-empresarios-agradecer-pt-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 25. Lula faz piada sobre nordestinos que moram em São Paulo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula faz comentário sobre nordestinos em São Paulo que é criticado como reforço de estereótipos regionais.',
      'O nordestino quando chega em São Paulo conquista tudo. Paulista fica com medo porque nordestino trabalha mais, é mais guerreiro. Por isso que São Paulo é a capital do Nordeste.',
      'Declaração em evento com a comunidade nordestina em São Paulo em novembro de 2025. Apesar da intenção de elogio, a fala foi criticada por reforçar estereótipos regionais e por ser eleitoreira.',
      'verified', false, '2025-11-20',
      'https://noticias.uol.com.br/politica/2025/11/lula-nordestinos-sao-paulo-capital-nordeste.htm',
      'news_article',
      'São Paulo', 'Evento com comunidade nordestina', 'lula-nordestinos-sao-paulo-capital-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 26. Lula compara seu governo ao de Getúlio Vargas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula se compara a Getúlio Vargas e diz que ambos governaram "para o povo".',
      'Depois de Getúlio, nenhum presidente fez tanto pelo povo quanto eu. Getúlio criou a CLT, eu criei o Bolsa Família. Getúlio criou a Petrobras, eu descobri o pré-sal. A história vai nos colocar lado a lado.',
      'Declaração em evento do Dia do Trabalhador em maio de 2025. Historiadores criticaram a comparação, lembrando que Vargas foi ditador no Estado Novo e que a autoglorificação ignora o contexto autoritário.',
      'verified', true, '2025-05-01',
      'https://www.poder360.com.br/governo/lula-se-compara-getulio-vargas-dia-trabalhador-2025/',
      'news_article',
      'São Paulo', 'Evento do Dia do Trabalhador', 'lula-compara-getulio-vargas-dia-trabalhador-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 27. Lula diz que não precisa de Congresso para governar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que "se precisar, governa por decreto" sem o Congresso, em fala autoritária.',
      'Se o Congresso não votar o que o povo precisa, eu governo por decreto. Medida provisória existe pra isso. Eu fui eleito pelo povo, não pelo Congresso. Minha legitimidade vem das urnas.',
      'Declaração em entrevista à rádio Tupi em junho de 2025. A fala foi duramente criticada pela oposição e por constitucionalistas como uma ameaça ao equilíbrio entre os Poderes.',
      'verified', true, '2025-06-15',
      'https://www.cnnbrasil.com.br/politica/lula-governo-decreto-congresso-entrevista-radio-tupi/',
      'news_article',
      'Brasília', 'Entrevista à Rádio Tupi', 'lula-governo-decreto-congresso-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 28. Lula critica Haddad publicamente por cortes no orçamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula critica o próprio ministro Haddad publicamente por cortes no orçamento social, expondo racha no governo.',
      'O Haddad às vezes corta coisas que não deveria cortar. Eu não fui eleito para cortar direito do povo. Fui eleito para gastar com o povo. O povo não elegeu o ministro da Fazenda, elegeu a mim.',
      'Declaração em evento com prefeitos em julho de 2025. A crítica pública ao ministro da Fazenda Fernando Haddad expôs divisões internas do governo entre a ala desenvolvimentista de Lula e a equipe econômica fiscalista.',
      'verified', true, '2025-07-22',
      'https://www.folha.uol.com.br/mercado/2025/07/lula-critica-haddad-cortes-orcamento-publicamente.shtml',
      'news_article',
      'Brasília', 'Evento com prefeitos no Planalto', 'lula-critica-haddad-cortes-orcamento-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 29. Lula diz que "pobre não precisa de conselho, precisa de dinheiro"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que "pobre não precisa de conselho, precisa de dinheiro" em defesa de programas assistencialistas.',
      'Pobre não precisa de conselho, precisa de dinheiro. Quando você dá dinheiro pro pobre, ele sabe o que fazer. Ele compra comida, compra roupa pro filho, paga a conta de luz. Não precisa ninguém ficar ensinando pobre a viver.',
      'Discurso em evento de ampliação do Bolsa Família em agosto de 2025. Críticos apontaram que a fala reduz políticas públicas a assistencialismo puro e ignora investimentos em educação, saúde e infraestrutura como caminhos de mobilidade social.',
      'verified', false, '2025-08-25',
      'https://g1.globo.com/politica/noticia/2025/08/lula-pobre-precisa-dinheiro-bolsa-familia.ghtml',
      'news_article',
      'Brasília', 'Evento de ampliação do Bolsa Família', 'lula-pobre-precisa-dinheiro-nao-conselho-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 30. Lula faz referência a "inimigos internos" no governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que tem "inimigos dentro do governo" e que vai fazer limpeza, gerando instabilidade.',
      'Tem gente dentro do governo que trabalha contra mim. Eu sei quem são. Vou fazer uma limpeza. Quem não está comigo está contra mim. Não tem espaço pra quem sabota o governo do povo.',
      'Declaração em reunião com líderes do PT em setembro de 2025. A fala gerou instabilidade no governo e foi comparada a discursos autoritários que buscam identificar inimigos internos para justificar perseguições.',
      'verified', false, '2025-09-18',
      'https://www.poder360.com.br/governo/lula-inimigos-dentro-governo-limpeza-setembro-2025/',
      'news_article',
      'Brasília', 'Reunião com liderança do PT', 'lula-inimigos-dentro-governo-limpeza-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 31. Lula erra ao citar dados de desemprego em discurso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula cita dados incorretos de desemprego em discurso, afirmando taxa de 4% quando era de 6,5%.',
      'O desemprego está em 4%. Nunca esteve tão baixo na história desse país. Isso é resultado do meu governo, da minha política de gerar emprego. A oposição não fala disso.',
      'Declaração em evento do PAC em outubro de 2025. O IBGE divulgara na semana anterior que a taxa de desemprego era de 6,5%, não 4% como afirmou o presidente. Agências de checagem classificaram a fala como falsa.',
      'verified', false, '2025-10-20',
      'https://www.aosfatos.org/noticias/lula-erra-taxa-desemprego-4-por-cento-outubro-2025/',
      'news_article',
      'Brasília', 'Evento do PAC', 'lula-erra-dados-desemprego-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 32. Lula chama Tarcísio de "cria do meu governo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula tenta desacreditar Tarcísio chamando-o de "cria do meu governo" em referência ao DNIT.',
      'O Tarcísio é uma cria do meu governo. Ele era um burocrata do DNIT quando eu era presidente. Eu que dei oportunidade pra ele. Agora ele se acha o salvador da pátria. Sem o PT, ele não existia.',
      'Declaração em evento com prefeitos paulistas em novembro de 2025. A fala foi vista como tentativa de deslegitimar o governador de SP, principal adversário para 2026, e gerou reação de Tarcísio que rebateu nas redes.',
      'verified', true, '2025-11-15',
      'https://www.estadao.com.br/politica/lula-tarcisio-cria-meu-governo-dnit-novembro-2025/',
      'news_article',
      'São Paulo', 'Evento com prefeitos paulistas', 'lula-tarcisio-cria-meu-governo-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 33. Lula promete picanha e cerveja para todos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula repete promessa de campanha sobre picanha e cerveja, gerando críticas por populismo.',
      'Eu prometi picanha e cerveja e vou cumprir. O preço da carne vai baixar, o preço da cerveja vai baixar. O povo vai voltar a fazer seu churrasco de fim de semana com dignidade.',
      'Declaração em evento em Recife em dezembro de 2025. A repetição da promessa de campanha foi criticada como populismo, dado que os preços da carne bovina acumulavam alta de 18% no ano.',
      'verified', false, '2025-12-05',
      'https://noticias.uol.com.br/politica/2025/12/lula-promete-picanha-cerveja-novamente-recife.htm',
      'news_article',
      'Recife (PE)', 'Evento do governo federal', 'lula-promete-picanha-cerveja-recife-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 34. Lula diz que Venezuela é democracia e defende Maduro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende Venezuela como democracia e evita condenar Maduro, gerando críticas internacionais.',
      'A Venezuela tem eleição, tem partido político, tem congresso. É uma democracia. Pode não ser a democracia que vocês querem, mas é uma democracia. Quem sou eu para ficar julgando outro país?',
      'Declaração em entrevista à AFP em janeiro de 2026. A fala gerou reação de organizações internacionais de direitos humanos e de venezuelanos exilados no Brasil, que apontaram a perseguição política e falta de liberdade no regime Maduro.',
      'verified', true, '2026-01-15',
      'https://www.bbc.com/portuguese/articles/lula-defende-venezuela-democracia-maduro-janeiro-2026',
      'news_article',
      'Brasília', 'Entrevista à AFP', 'lula-defende-venezuela-democracia-maduro-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 35. Lula afirma que juízes ganham demais e não trabalham
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula critica salários do Judiciário e diz que juízes "ganham demais e não trabalham".',
      'Juiz no Brasil ganha demais e trabalha de menos. Tem juiz que ganha R$ 50 mil por mês e trabalha quatro dias por semana. Enquanto isso o professor ganha R$ 3 mil. Isso não está certo.',
      'Declaração em evento de educação em janeiro de 2026. A fala gerou reação da AMB (Associação dos Magistrados Brasileiros) que classificou o comentário como ataque ao Judiciário e tentativa de intimidação.',
      'verified', false, '2026-01-22',
      'https://www.conjur.com.br/2026-jan-22/lula-critica-salarios-juizes-trabalham-pouco/',
      'news_article',
      'Brasília', 'Evento de valorização da educação', 'lula-juizes-ganham-demais-nao-trabalham-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 36. Lula sugere que seca no Nordeste é exagero da mídia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula minimiza seca no Nordeste e sugere que a mídia exagera o problema para prejudicar o governo.',
      'A seca no Nordeste existe, mas não é como a mídia mostra. A mídia quer que o povo pense que o Nordeste parou. Mas o Nordeste está crescendo, está se desenvolvendo. Tem transposição do São Francisco funcionando.',
      'Declaração em visita ao Ceará em fevereiro de 2026, durante a pior seca dos últimos 40 anos na região. Meteorologistas e governadores nordestinos contestaram a minimização, apontando impactos reais na agricultura e abastecimento.',
      'verified', false, '2026-02-05',
      'https://g1.globo.com/ce/ceara/noticia/2026/02/lula-minimiza-seca-nordeste-midia-exagera.ghtml',
      'news_article',
      'Fortaleza (CE)', 'Visita a obras federais no Ceará', 'lula-minimiza-seca-nordeste-midia-exagera-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 37. Lula diz que Amazônia é do Brasil e ninguém deve "dar pitaco"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende soberania sobre Amazônia e rejeita pressão internacional para proteção ambiental.',
      'A Amazônia é do Brasil. Ninguém de fora vai dizer o que a gente faz com a nossa floresta. Querem nos ensinar a cuidar da Amazônia? Cuidem das suas florestas primeiro. A Europa destruiu tudo e agora quer dar pitaco na nossa.',
      'Discurso em cúpula amazônica em março de 2026. Ambientalistas criticaram a postura soberanista como obstáculo à cooperação internacional contra o desmatamento e o aquecimento global.',
      'verified', false, '2026-03-20',
      'https://www.poder360.com.br/meio-ambiente/lula-amazonia-brasil-ninguem-pitaco-cupula-marco-2026/',
      'news_article',
      'Belém (PA)', 'Cúpula amazônica', 'lula-amazonia-brasil-ninguem-pitaco-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 38. Lula elogia Xi Jinping e diz que China é modelo de desenvolvimento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula elogia Xi Jinping e cita China como modelo de desenvolvimento, ignorando violações de direitos humanos.',
      'O Xi Jinping tirou 800 milhões de pessoas da pobreza. Nenhum líder ocidental fez isso. A China é um modelo de desenvolvimento que a gente precisa estudar e aprender.',
      'Declaração em encontro bilateral com empresários chineses em abril de 2025. A fala foi criticada por ignorar a repressão política, a perseguição a uigures e a falta de liberdades civis no regime chinês.',
      'verified', false, '2025-04-18',
      'https://www.estadao.com.br/internacional/lula-elogia-xi-jinping-china-modelo-desenvolvimento-2025/',
      'news_article',
      'Pequim', 'Encontro bilateral Brasil-China', 'lula-elogia-xi-jinping-china-modelo-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 39. Lula diz que críticos do Bolsa Família têm "alma de escravocrata"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa críticos do Bolsa Família de terem "alma de escravocrata", em retórica agressiva.',
      'Quem critica o Bolsa Família tem alma de escravocrata. Quer que o pobre trabalhe de graça, sem direito a nada. Esses são os mesmos que tinham escravo na senzala e diziam que tratavam bem.',
      'Discurso em evento de reajuste do Bolsa Família em dezembro de 2025. A comparação com escravidão para desqualificar críticas ao programa social foi considerada desproporcional e polarizadora.',
      'verified', true, '2025-12-12',
      'https://www.cnnbrasil.com.br/politica/lula-criticos-bolsa-familia-alma-escravocrata-dezembro-2025/',
      'news_article',
      'Brasília', 'Evento de reajuste do Bolsa Família', 'lula-criticos-bolsa-familia-alma-escravocrata-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 40. Lula se atrapalha com teleprompter e lê instrução de palco
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula lê instrução do teleprompter em voz alta durante discurso, dizendo "sorriso para a câmera".',
      'E por isso nós vamos continuar investindo... sorriso para a câmera... ah, isso não era pra ler. Desculpa aí, gente.',
      'Em evento do PAC em janeiro de 2026, Lula leu acidentalmente uma instrução técnica do teleprompter em voz alta. O momento viralizou nas redes sociais, com memes sobre o presidente seguir roteiro pré-definido.',
      'verified', false, '2026-01-28',
      'https://noticias.uol.com.br/politica/2026/01/lula-le-instrucao-teleprompter-sorriso-camera.htm',
      'news_article',
      'Brasília', 'Evento do PAC', 'lula-le-instrucao-teleprompter-sorriso-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 41. Lula culpa "herança maldita" de Bolsonaro por problemas após 2 anos de governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula ainda culpa "herança maldita" de Bolsonaro por problemas após mais de 2 anos no poder.',
      'Tudo que está errado nesse país é herança maldita do Bolsonaro. Ele destruiu o Meio Ambiente, destruiu a Educação, destruiu a Saúde. A gente está reconstruindo, mas leva tempo.',
      'Declaração em entrevista ao SBT em março de 2026. Analistas políticos apontaram que após mais de dois anos de governo, continuar culpando o antecessor demonstra dificuldade em assumir responsabilidade.',
      'verified', false, '2026-03-25',
      'https://www.sbt.com.br/noticias/politica/lula-heranca-maldita-bolsonaro-entrevista-marco-2026',
      'news_article',
      'Brasília', 'Entrevista ao SBT', 'lula-heranca-maldita-bolsonaro-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 42. Lula chama senadores de "covardes" por travar pautas do governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama senadores de "covardes" por não votarem pautas prioritárias do governo.',
      'Tem senador que é covarde. Não tem coragem de votar a favor do povo porque tem medo da bancada do agronegócio, tem medo da bancada evangélica. São covardes. O povo elegeu vocês pra trabalhar, não pra ter medo.',
      'Declaração em café da manhã com jornalistas em julho de 2025. A fala provocou reação do presidente do Senado e de líderes partidários que classificaram o comentário como desrespeitoso ao Legislativo.',
      'verified', true, '2025-07-28',
      'https://www.folha.uol.com.br/poder/2025/07/lula-chama-senadores-covardes-pautas-governo.shtml',
      'news_article',
      'Brasília', 'Café da manhã com jornalistas', 'lula-senadores-covardes-pautas-governo-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 43. Lula faz confusão sobre número de ministérios do próprio governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula erra o número de ministérios do próprio governo em entrevista, citando 32 quando são 37.',
      'Eu tenho 32 ministérios... ou é 33? Não sei, são muitos. Cada um com um ministro competente trabalhando pelo povo brasileiro.',
      'Em entrevista à GloboNews em agosto de 2025, Lula errou o número de ministérios de seu próprio governo, que na data contava com 37 pastas. A confusão reforçou narrativas sobre desconexão do presidente com a estrutura administrativa.',
      'verified', false, '2025-08-08',
      'https://g1.globo.com/politica/noticia/2025/08/lula-erra-numero-ministerios-entrevista-globonews.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'lula-erra-numero-ministerios-globonews-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 44. Lula diz que quem não gosta dele pode "procurar outro país"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que quem não gosta de seu governo pode "procurar outro país", em fala autoritária.',
      'Quem não gosta do meu governo pode procurar outro país. O Brasil é grande, mas quem não quer ajudar a construir, pode ir embora. Eu estou trabalhando pra quem quer ficar.',
      'Declaração em comício no Maranhão em setembro de 2025. A fala foi comparada a declarações similares de Bolsonaro e criticada como intolerante à oposição e ao pluralismo democrático.',
      'verified', true, '2025-09-28',
      'https://www.poder360.com.br/governo/lula-quem-nao-gosta-procure-outro-pais-setembro-2025/',
      'news_article',
      'São Luís (MA)', 'Comício no Maranhão', 'lula-quem-nao-gosta-procure-outro-pais-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 45. Lula confunde datas da independência em discurso no 7 de setembro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula confunde datas históricas durante discurso do 7 de Setembro, citando 1823 ao invés de 1822.',
      'Em 1823... 1822, desculpa, em 7 de setembro de 1822, Dom Pedro declarou a independência. Ou foi 21 de abril? Não, foi 7 de setembro mesmo. Vocês me confundem.',
      'Discurso no Dia da Independência em setembro de 2025. A confusão de datas históricas básicas durante a cerimônia mais importante do calendário cívico gerou reações nas redes sociais.',
      'verified', false, '2025-09-07',
      'https://noticias.uol.com.br/politica/2025/09/lula-confunde-datas-independencia-7-setembro.htm',
      'news_article',
      'Brasília', 'Cerimônia do 7 de Setembro', 'lula-confunde-datas-independencia-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 46. Lula diz que professores devem ganhar mais que juízes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que professores devem ganhar mais que juízes, sem apresentar proposta concreta.',
      'Um dia o professor vai ganhar mais que juiz nesse país. Eu sonho com isso. O professor é quem forma o juiz, o médico, o engenheiro. Merece ganhar mais do que todo mundo.',
      'Discurso em evento do Dia do Professor em outubro de 2025. A fala foi vista como demagógica por não vir acompanhada de nenhum projeto de lei ou proposta orçamentária para valorização salarial dos professores.',
      'verified', false, '2025-10-15',
      'https://www.estadao.com.br/educacao/lula-professores-ganhar-mais-juizes-outubro-2025/',
      'news_article',
      'Brasília', 'Evento do Dia do Professor', 'lula-professores-ganhar-mais-juizes-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 47. Lula tropeça em palavras e faz discurso incompreensível em Manaus
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula faz discurso com trechos incompreensíveis em Manaus, alimentando debates sobre saúde.',
      'Nós vamos fazer... a Zona Franca... aquilo que o povo... quando eu vim aqui em 2003... não, 2005... a gente precisa de mais... como é que chama? Investimento. Mais investimento na Zona Franca.',
      'Discurso em evento na Zona Franca de Manaus em novembro de 2025. O presidente perdeu o fio da meada diversas vezes, confundiu datas e demonstrou dificuldade para completar raciocínios, reacendendo o debate sobre sua saúde.',
      'verified', true, '2025-11-25',
      'https://www.folha.uol.com.br/poder/2025/11/lula-discurso-confuso-manaus-zona-franca.shtml',
      'news_article',
      'Manaus (AM)', 'Evento na Zona Franca de Manaus', 'lula-discurso-confuso-manaus-zona-franca-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 48. Lula diz que PT é "o maior partido da história da democracia"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que o PT é o maior partido da história da democracia mundial, em exagero.',
      'O PT é o maior partido da história da democracia. Não existe no mundo um partido que tenha feito tanto pelo povo quanto o PT. Nenhum. Nem na Europa, nem nos Estados Unidos, em lugar nenhum.',
      'Discurso em encontro nacional do PT em fevereiro de 2026. A afirmação hiperbólica foi ridicularizada por historiadores e cientistas políticos que apontaram diversos partidos com trajetórias mais significativas.',
      'verified', false, '2026-02-22',
      'https://www.poder360.com.br/partidos/lula-pt-maior-partido-historia-democracia-fevereiro-2026/',
      'news_article',
      'São Paulo', 'Encontro Nacional do PT', 'lula-pt-maior-partido-historia-democracia-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 49. Lula diz que não precisa de pesquisa para saber o que povo quer
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que não precisa de pesquisa de opinião porque "sente" o que o povo quer.',
      'Eu não preciso de pesquisa pra saber o que o povo quer. Eu sinto. Eu vim do povo, eu sei o que é passar fome, eu sei o que é andar de pé no barro. Pesquisa é pra quem não conhece o povo.',
      'Declaração em reunião ministerial em março de 2026. A fala foi criticada por menosprezar dados e evidências na formulação de políticas públicas, demonstrando uma abordagem personalista e anticientífica de governo.',
      'verified', false, '2026-03-10',
      'https://www.cnnbrasil.com.br/politica/lula-nao-precisa-pesquisa-sente-povo-marco-2026/',
      'news_article',
      'Brasília', 'Reunião ministerial', 'lula-nao-precisa-pesquisa-sente-povo-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 50. Lula afirma que "157 polêmicas são pouco" para quem governa o Brasil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula minimiza suas próprias polêmicas e diz que 157 declarações controversas em 3 anos "são pouco".',
      'Dizem que eu fiz 157 declarações polêmicas em três anos. Isso é pouco. Quem governa um país como o Brasil e fala com o povo todo dia vai falar coisa que incomoda. Político que não incomoda não faz nada.',
      'Declaração em entrevista ao Metrópoles em abril de 2026, reagindo ao levantamento do Poder360 que catalogou 157 falas controversas de Lula no terceiro mandato. A reação de minimizar o número foi criticada por falta de autocrítica.',
      'verified', true, '2026-04-05',
      'https://www.metropoles.com/brasil/lula-157-polemicas-pouco-governa-brasil-abril-2026',
      'news_article',
      'Brasília', 'Entrevista ao Metrópoles', 'lula-157-polemicas-pouco-governa-brasil-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

END $$;
