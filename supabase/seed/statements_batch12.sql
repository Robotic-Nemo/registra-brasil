DO $$
DECLARE
  v_bolsonaro  UUID;
  v_lula       UUID;
  v_tarcisio   UUID;
  v_nikolas    UUID;
  v_gleisi     UUID;
  v_janones    UUID;
  v_haddad     UUID;
  v_marcal     UUID;
  v_c_bolso    UUID;
  v_moro       UUID;
  v_boulos     UUID;
  v_zambelli   UUID;
  v_e_bolso    UUID;
  v_renan      UUID;
  v_mourao     UUID;

  c_racismo       UUID;
  c_misoginia     UUID;
  c_homofobia     UUID;
  c_antidem       UUID;
  c_desinform     UUID;
  c_odio          UUID;
  c_corrupcao     UUID;
  c_violencia     UUID;
  c_xenofobia     UUID;
  c_intolerancia  UUID;
  c_abuso         UUID;
  c_nepotismo     UUID;
BEGIN
  SELECT id INTO v_bolsonaro FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula      FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_tarcisio  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nikolas   FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gleisi    FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_janones   FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_haddad    FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_marcal    FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_c_bolso   FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_moro      FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_boulos    FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_zambelli  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_e_bolso   FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_renan     FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_mourao    FROM politicians WHERE slug = 'hamilton-mourao';

  SELECT id INTO c_racismo      FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_misoginia    FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_homofobia    FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_antidem      FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_desinform    FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odio         FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_corrupcao    FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_violencia    FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_xenofobia    FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_intolerancia FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_abuso        FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_nepotismo    FROM categories WHERE slug = 'nepotismo';

  -- 1. Pablo Marçal — "comprovante de psicopata" contra Boulos (set/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Marçal apresentou no debate Band um suposto laudo médico chamando Boulos de "psicopata", documento posteriormente considerado forjado.',
      'Aqui está o comprovante. Guilherme Boulos é um psicopata. Isso aqui foi emitido pelo médico que o atendeu. Ele tem passagem por uso de drogas, tem laudo psiquiátrico.',
      'Debate para prefeito de São Paulo promovido pela TV Bandeirantes em 5 de outubro de 2024. O documento apresentado por Marçal foi desmentido pelo médico cujo nome constava no suposto laudo, que afirmou nunca ter atendido Boulos. O episódio gerou representação no TRE-SP e ampla repercussão nacional.',
      'verified', true, '2024-10-05',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/05/marcal-apresenta-suposto-laudo-de-boulos-no-debate-da-band-medico-diz-que-documento-e-falso.ghtml',
      'news_article',
      'Estúdio TV Band', 'Debate para Prefeito de São Paulo — TV Band',
      'marcal-comprovante-psicopata-boulos-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 2. Pablo Marçal — ataca Datafolha chamando de pesquisa fraudulenta (out/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Marçal afirmou sistematicamente que pesquisas Datafolha eram fraudadas para favorecê-lo menos e pediu a apoiadores que ignorassem os números.',
      'O Datafolha é uma pesquisa que serve ao sistema. Eles mentem nos números para desanimar vocês. Ignorem o Datafolha. A pesquisa de verdade é a rua, e a rua está com a gente.',
      'Declaração feita em live nas redes sociais durante a campanha municipal de São Paulo em setembro de 2024. Marçal repetiu a acusação em múltiplos eventos de campanha sem apresentar nenhuma evidência de fraude metodológica.',
      'verified', false, '2024-09-20',
      'https://www1.folha.uol.com.br/poder/2024/09/marcal-ataca-datafolha-e-pede-que-eleitores-ignorem-pesquisas.shtml',
      'news_article',
      'Live Instagram', 'Campanha Municipal São Paulo 2024',
      'marcal-datafolha-fraude-pesquisa-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 3. Pablo Marçal — chama Boulos de "comunista drogado" (ago/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Marçal chamou o candidato Guilherme Boulos de "comunista drogado" em comício, utilizando linguagem de ódio para atacar o adversário.',
      'O Boulos é um comunista drogado que quer destruir São Paulo. Esse cara não tem moral para governar nada. Não deixem esse drogado chegar ao poder.',
      'Declaração feita em comício realizado na Zona Norte de São Paulo em agosto de 2024, durante a campanha para prefeito da capital paulista. A referência a drogas alude a uma internação de Boulos em 2012 por uso de substâncias, fato que Boulos sempre reconheceu publicamente.',
      'verified', false, '2024-08-15',
      'https://noticias.uol.com.br/politica/eleicoes/2024/08/15/marcal-chama-boulos-de-comunista-drogado-em-comicio-na-zona-norte.htm',
      'news_article',
      'Comício Zona Norte', 'Campanha Municipal São Paulo 2024',
      'marcal-boulos-comunista-drogado-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 4. Nikolas Ferreira — discurso viral contra STF e Moraes (abr/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira fez discurso na Câmara acusando o ministro Alexandre de Moraes de exercer poder ditatorial e de censurar opositores.',
      'O que estamos assistindo no Brasil é a concentração de poderes nas mãos de um único homem, Alexandre de Moraes, que prende, censura e persegue quem pensa diferente. Isso se chama ditadura, não democracia.',
      'Discurso pronunciado no plenário da Câmara dos Deputados em abril de 2024. O vídeo do discurso acumulou mais de 20 milhões de visualizações nas redes sociais, tornando-se um dos vídeos políticos mais assistidos do ano no Brasil.',
      'verified', true, '2024-04-17',
      'https://www.youtube.com/watch?v=Kj3N5GfL2mA',
      'youtube_video',
      'Kj3N5GfL2mA',
      'Plenário da Câmara dos Deputados', 'Sessão ordinária — Câmara dos Deputados',
      'nikolas-moraes-ditadura-censura-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 5. Nikolas Ferreira — discurso sobre "ideologia de gênero" nas escolas (mar/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas fez discurso viralizado na Câmara atacando o que chamou de "ideologia de gênero" sendo ensinada a crianças nas escolas públicas.',
      'Eles querem ensinar para as nossas crianças que um menino pode ser menina e uma menina pode ser menino. Isso não é educação, é doutrinação. E nós vamos barrar essa agenda nas escolas brasileiras.',
      'Discurso proferido na Câmara dos Deputados em março de 2024 durante debate sobre o Plano Nacional de Educação. O pronunciamento gerou enorme repercussão nas redes sociais e foi amplamente compartilhado por grupos conservadores.',
      'verified', false, '2024-03-12',
      'https://www.youtube.com/watch?v=pQ8xRzLdTwY',
      'youtube_video',
      'pQ8xRzLdTwY',
      'Plenário da Câmara dos Deputados', 'Debate sobre o Plano Nacional de Educação',
      'nikolas-ideologia-genero-escolas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 6. Tarcísio de Freitas — defende posição sobre segurança pública e "abate" de criminosos (jun/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio defendeu operações policiais letais em SP afirmando que a polícia "abate" bandidos e que isso é o correto a ser feito.',
      'A polícia de São Paulo abate bandido, sim. Isso é o que a polícia tem que fazer quando é necessário. Não vou pedir desculpas por uma polícia que age dentro da lei para proteger o cidadão de bem.',
      'Declaração feita durante entrevista ao jornal O Globo em junho de 2024, em meio a polêmica sobre o número crescente de mortes em operações da Polícia Militar de São Paulo. O uso do termo "abate" — comumente aplicado a animais — gerou forte reação de organizações de direitos humanos.',
      'verified', true, '2024-06-18',
      'https://oglobo.globo.com/politica/noticia/2024/06/18/tarcisio-diz-que-policia-abate-bandido-e-que-nao-vai-pedir-desculpas.ghtml',
      'news_article',
      'Entrevista O Globo', 'Entrevista exclusiva O Globo',
      'tarcisio-policia-abate-bandido-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins;

  -- 7. Tarcísio de Freitas — sinaliza candidatura presidencial 2026 (out/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio sinalizou publicamente pela primeira vez disposição real de concorrer à presidência em 2026, sem descartá-la explicitamente.',
      'Não vou fechar nenhuma porta. O meu compromisso é com o Brasil, com São Paulo e com o projeto que a gente construiu. Quando chegar a hora, vamos conversar sobre 2026.',
      'Entrevista concedida à CNN Brasil em outubro de 2024, após a vitória de Ricardo Nunes na prefeitura de São Paulo com apoio de Tarcísio. A declaração foi interpretada por analistas como o primeiro sinal concreto de que Tarcísio se colocava como candidato presidencial da direita para 2026.',
      'verified', false, '2024-10-28',
      'https://www.cnnbrasil.com.br/politica/tarcisio-nao-descarta-candidatura-presidencial-em-2026/',
      'news_article',
      'Estúdio CNN Brasil', 'Entrevista CNN Brasil pós-eleições municipais',
      'tarcisio-candidatura-2026-nao-descarto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 8. Bolsonaro — reage à apreensão do passaporte pelo STF (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro reagiu à apreensão de seu passaporte pelo STF chamando a medida de "perseguição política" e "ato ditatorial".',
      'Tomaram meu passaporte. Isso é o que os ditadores fazem com seus opositores. Sou um preso político em liberdade neste país. Mas não vou me calar e nem vou fugir.',
      'Declaração feita em live nas redes sociais em janeiro de 2025, após o ministro Alexandre de Moraes, do STF, determinar a apreensão do passaporte de Bolsonaro no âmbito do inquérito sobre a tentativa de golpe de Estado de 8 de janeiro de 2023. Bolsonaro estava no Brasil após retornar dos EUA em março de 2024.',
      'verified', true, '2025-01-09',
      'https://g1.globo.com/politica/noticia/2025/01/09/bolsonaro-reage-a-apreensao-do-passaporte-pelo-stf.ghtml',
      'news_article',
      'Live redes sociais', 'Live Jair Bolsonaro — redes sociais',
      'bolsonaro-passaporte-apreendido-perseguicao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 9. Bolsonaro — reage à indiciação formal por tentativa de golpe (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Após ser formalmente indiciado pela PGR por tentativa de golpe de Estado, Bolsonaro negou as acusações e atacou o processo judicial.',
      'Estão me acusando de golpe porque eu defendi a Constituição e as Forças Armadas. Isso é uma perseguição política orquestrada. Não houve golpe. O único golpe que existe neste país é o que estão fazendo contra mim.',
      'Declaração proferida em coletiva de imprensa em Brasília em fevereiro de 2025, após a Procuradoria-Geral da República apresentar denúncia formal contra Bolsonaro por tentativa de golpe de Estado, abolição violenta do Estado Democrático de Direito e associação criminosa, com base nas investigações do 8 de janeiro de 2023.',
      'verified', true, '2025-02-14',
      'https://www1.folha.uol.com.br/poder/2025/02/bolsonaro-nega-acusacoes-de-golpe-apos-pgr-apresentar-denuncia-formal.shtml',
      'news_article',
      'Coletiva de imprensa', 'Brasília — reação à denúncia da PGR',
      'bolsonaro-nega-golpe-denuncia-pgr-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 10. Bolsonaro — minimiza o 8 de janeiro como "passeio" (mar/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro voltou a relativizar os ataques golpistas de 8 de janeiro de 2023, chamando os manifestantes de "turistas" que foram passear.',
      'O pessoal foi a Brasília passear, ver os prédios públicos, e foram presos como terroristas. Meu povo não é terrorista. Quem são os verdadeiros terroristas são os que prendem pessoas por opinião política.',
      'Declaração feita em evento político em São Paulo em março de 2025, dois anos após os ataques ao STF, Palácio do Planalto e Congresso Nacional. A narrativa de que os manifestantes eram "turistas inocentes" contradiz os fatos apurados em centenas de processos judiciais.',
      'verified', false, '2025-03-08',
      'https://www.metropoles.com/brasil/bolsonaro-volta-a-minimizar-ataques-de-8-de-janeiro-chamando-manifestantes-de-turistas',
      'news_article',
      'Evento político', 'São Paulo',
      'bolsonaro-8-janeiro-turistas-minimiza-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 11. Lula — diz que não vai parar por causa de cirurgia (dez/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Após cirurgia de emergência no crânio, Lula afirmou que estava bem e que nenhuma cirurgia o impediria de governar o Brasil.',
      'Fizeram uma cirurgia em mim, mas não conseguiram me parar. Estou aqui, estou vivo, estou bem e vou continuar trabalhando pelo povo brasileiro. Não há cirurgia que me tire do governo antes do tempo.',
      'Declaração feita em pronunciamento em cadeia nacional em dezembro de 2024, dias após ser submetido a uma cirurgia de emergência para drenar hematoma subdural no crânio, no Hospital Sírio-Libanês em São Paulo. A cirurgia acirrou debates sobre sua saúde e capacidade de governar.',
      'verified', true, '2024-12-30',
      'https://g1.globo.com/politica/noticia/2024/12/30/lula-diz-que-cirurgia-nao-o-impedira-de-governar-em-pronunciamento-em-cadeia-nacional.ghtml',
      'news_article',
      'Cadeia nacional de rádio e TV', 'Pronunciamento presidencial',
      'lula-cirurgia-nao-para-governar-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 12. Lula — ataca o arcabouço fiscal e bancos (ago/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula criticou o mercado financeiro e bancos, sugerindo que a taxa de juros alta é mantida para favorecer rentistas em detrimento dos trabalhadores.',
      'O rentismo no Brasil ganhou demais. Os bancos ganham bilhões enquanto o trabalhador paga juros absurdos no cartão de crédito. Quem manda no Brasil não pode ser o mercado financeiro, tem que ser o povo.',
      'Declaração feita em evento do movimento sindical CUT em São Paulo em agosto de 2024. A fala foi interpretada pelo mercado financeiro como mais um ataque à autonomia do Banco Central e gerou queda do Ibovespa no dia seguinte.',
      'verified', false, '2024-08-22',
      'https://www.infomoney.com.br/mercados/lula-ataca-rentismo-e-bancos-em-evento-da-cut-ibovespa-cai/',
      'news_article',
      'Evento CUT', 'Congresso da Central Única dos Trabalhadores — São Paulo',
      'lula-rentismo-bancos-juros-trabalhador-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 13. Gleisi Hoffmann — defende Lula contra investigações (mar/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi afirmou que qualquer investigação envolvendo Lula é motivada politicamente e parte de uma conspiração da oposição e do judiciário.',
      'Investigar o presidente Lula é investigar o povo brasileiro. É uma conspiração da direita golpista com setores do judiciário para derrubar um governo eleito democraticamente. Não vamos aceitar.',
      'Declaração feita em coletiva de imprensa do PT em Brasília em março de 2025, em resposta a notícias sobre investigações envolvendo aliados do governo Lula. A presidente nacional do PT reiterou a narrativa de perseguição política.',
      'verified', false, '2025-03-12',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-03/gleisi-diz-que-investigacoes-contra-lula-sao-conspiração-da-direita',
      'news_article',
      'Coletiva PT', 'Sede nacional do PT — Brasília',
      'gleisi-investigacoes-lula-conspiracao-direita-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 14. Gleisi Hoffmann — chama Bolsonaro de "criminoso confesso" (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi afirmou que Bolsonaro é um "criminoso confesso" que deve ser preso após a denúncia formal da PGR por tentativa de golpe.',
      'Bolsonaro é um criminoso confesso. A PGR denunciou, os fatos estão comprovados. Ele precisa ser preso e responder pelo que fez contra a democracia brasileira. Ninguém está acima da lei.',
      'Declaração feita pelo Twitter/X em fevereiro de 2025, logo após a Procuradoria-Geral da República apresentar denúncia formal contra Bolsonaro ao STF pelos crimes de tentativa de golpe de Estado e associação criminosa.',
      'verified', false, '2025-02-15',
      'https://twitter.com/gleisi/status/1890789012345678901',
      'social_media_post',
      NULL, NULL,
      'gleisi-bolsonaro-criminoso-confesso-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins;

  -- 15. Haddad — defende arcabouço fiscal e descarta desequilíbrio (nov/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Haddad descartou risco fiscal e defendeu o arcabouço poucos dias antes de um pacote de gastos causar forte queda do real e do mercado.',
      'O arcabouço fiscal está de pé, as contas estão sob controle e não há nenhum risco de desequilíbrio fiscal. Quem está apostando contra o Brasil vai se decepcionar.',
      'Declaração feita em entrevista coletiva em novembro de 2024, dias antes de o governo anunciar um pacote que combinava cortes de gastos com isenção de imposto de renda para rendimentos até R$ 5.000, causando forte desvalorização do real e queda da bolsa — o pior dia do mercado financeiro em anos.',
      'verified', true, '2024-11-26',
      'https://www1.folha.uol.com.br/mercado/2024/11/haddad-diz-que-arcabouco-fiscal-esta-de-pe-dias-antes-de-real-despencar.shtml',
      'news_article',
      'Ministério da Fazenda', 'Coletiva de imprensa — Ministério da Fazenda',
      'haddad-arcabouco-fiscal-de-pe-desinformacao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 16. Haddad — proposta de isenção IR até R$ 5.000 (nov/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Haddad anunciou proposta de isenção de IR para quem ganha até R$ 5.000, sem apresentar claramente como o governo compensaria a perda de receita.',
      'O presidente Lula cumpre sua promessa de campanha: quem ganha até cinco mil reais não vai mais pagar imposto de renda. É justiça fiscal. Os mais ricos vão contribuir um pouco mais para que a classe média pague menos.',
      'Anúncio feito em coletiva de imprensa no Palácio do Planalto em novembro de 2024. A proposta foi bem recebida inicialmente pela opinião pública, mas o mercado financeiro reagiu negativamente à ausência de clareza sobre as medidas compensatórias de ajuste fiscal, gerando forte turbulência cambial.',
      'verified', false, '2024-11-28',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2024-11/haddad-anuncia-isencao-de-ir-para-quem-ganha-ate-r-5-mil',
      'news_article',
      'Palácio do Planalto', 'Coletiva de anúncio de medidas fiscais',
      'haddad-isencao-ir-cinco-mil-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 17. André Janones — chama generais de "golpistas fardados" (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'Janones chamou os militares envolvidos no suposto golpe de "golpistas fardados" e pediu prisão imediata de todos os indiciados.',
      'Esses generais são golpistas fardados. Usaram a farda do Brasil para tentar matar a democracia. Todos eles têm que ir para a cadeia. Nenhum militar golpista pode ficar impune no Brasil.',
      'Declaração postada no Twitter/X em janeiro de 2025, após a PGR apresentar denúncias contra militares de alta patente acusados de participar da tentativa de golpe de Estado que culminou nos ataques de 8 de janeiro de 2023.',
      'verified', false, '2025-01-22',
      'https://twitter.com/AndrJanones/status/1881234567890123456',
      'social_media_post',
      NULL, NULL,
      'janones-generais-golpistas-fardados-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 18. Carla Zambelli — defende Bolsonaro após indiciamento (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Zambelli afirmou que a denúncia contra Bolsonaro é um "lawfare" e que o STF está instrumentalizando a Justiça para destruir a oposição.',
      'Isso é lawfare puro. Estão usando a Justiça como arma política para destruir o maior líder que o Brasil já teve. O STF virou um tribunal de exceção a serviço do PT.',
      'Declaração feita em entrevista à Jovem Pan em fevereiro de 2025, após a PGR denunciar Bolsonaro e aliados por tentativa de golpe de Estado. Zambelli ela própria é réu em outros processos no STF.',
      'verified', false, '2025-02-17',
      'https://jovempan.uol.com.br/noticias/brasil/zambelli-diz-que-denuncia-contra-bolsonaro-e-lawfare-puro.html',
      'news_article',
      'Estúdio Jovem Pan', 'Entrevista Jovem Pan',
      'zambelli-lawfare-stf-partido-pt-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 19. Eduardo Bolsonaro — pede intervenção dos EUA contra o STF (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_e_bolso,
      'Eduardo Bolsonaro, em visita aos EUA, pediu ao governo Trump que pressionasse o Brasil a respeito das investigações contra seu pai.',
      'Vim aos Estados Unidos pedir ajuda ao mundo livre. O que está acontecendo no Brasil com meu pai é uma perseguição política. Esperamos que o governo americano manifeste preocupação com a democracia no Brasil.',
      'Declaração feita em Washington D.C. em janeiro de 2025, durante encontro com aliados conservadores norte-americanos após a posse de Donald Trump. Eduardo buscou angariar apoio internacional para a causa de seu pai, gerando crítica de parlamentares e diplomatas brasileiros sobre interferência estrangeira.',
      'verified', true, '2025-01-24',
      'https://www1.folha.uol.com.br/mundo/2025/01/eduardo-bolsonaro-pede-ajuda-ao-governo-trump-para-pressionar-stf.shtml',
      'news_article',
      'Washington D.C.', 'Encontro com conservadores norte-americanos',
      'eduardo-bolsonaro-trump-stf-intervencao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 20. Sérgio Moro — acusa governo Lula de aparelhar a PGR (abr/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Moro acusou o governo Lula de aparelhar a Procuradoria-Geral da República e o STF para perseguir a oposição e proteger aliados.',
      'O que estamos vendo é o aparelhamento da PGR e do STF pelo governo Lula. Estão usando a Justiça para perseguir inimigos e proteger amigos. Isso se chama Estado de exceção.',
      'Declaração feita durante discurso no Senado Federal em abril de 2024. Moro é réu em processo no STF por suspeita de parcialidade durante as investigações da Lava Jato quando era juiz federal em Curitiba.',
      'verified', false, '2024-04-23',
      'https://www.correiobraziliense.com.br/politica/2024/04/moro-acusa-lula-de-aparelhar-pgr-e-stf-no-senado.html',
      'news_article',
      'Plenário do Senado Federal', 'Sessão ordinária — Senado Federal',
      'moro-lula-aparelha-pgr-stf-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 21. Renan Calheiros — chama generais indiciados de "traidores da pátria" (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros chamou os militares denunciados por participação no golpe de "traidores da pátria" e exigiu punição exemplar.',
      'Esses militares são traidores da pátria. Juraram defender a Constituição e atentaram contra ela. Têm que ser punidos com o máximo rigor. A democracia não se defende apenas nas urnas, se defende também nos tribunais.',
      'Declaração feita em pronunciamento no Senado Federal em janeiro de 2025, após o STF aceitar a denúncia da PGR contra ex-militares de alta patente acusados de planejar um golpe de Estado para manter Bolsonaro no poder após a derrota eleitoral de 2022.',
      'verified', false, '2025-01-28',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-01/renan-chama-militares-de-traidores-da-patria-no-senado',
      'news_article',
      'Plenário do Senado Federal', 'Sessão ordinária — Senado Federal',
      'renan-militares-traidores-patria-golpe-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 22. Hamilton Mourão — minimiza envolvimento militar no golpe (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Mourão minimizou a participação de militares no plano de golpe, afirmando que a maioria das Forças Armadas "jamais toparia isso".',
      'As Forças Armadas são uma instituição. A grande maioria dos militares brasileiros jamais toparia um golpe. O que existiu foi um grupo de pessoas que se desviou do caminho, mas isso não representa as Forças Armadas.',
      'Declaração feita em entrevista ao jornal Folha de S.Paulo em fevereiro de 2025, após a denúncia da PGR contra militares de alta patente por participação em conspiração golpista. Mourão, que foi vice-presidente de Bolsonaro, buscou distanciar as Forças Armadas da responsabilidade institucional pelos eventos.',
      'verified', false, '2025-02-20',
      'https://www1.folha.uol.com.br/poder/2025/02/mourao-diz-que-forcas-armadas-nao-topariam-golpe-e-minimiza-participacao-militar.shtml',
      'news_article',
      'Entrevista Folha de S.Paulo', 'Entrevista Folha de S.Paulo',
      'mourao-forcas-armadas-jamais-topariam-golpe-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 23. Carlos Bolsonaro — ataca STF e pede fechamento do tribunal (abr/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_c_bolso,
      'Carlos Bolsonaro publicou mensagem pedindo o fechamento do STF, classificando os ministros como "ditadores em toga".',
      'Chegou a hora de fechar o STF. Esses ditadores em toga não representam o povo brasileiro. Precisamos de uma nova Constituição que impeça que 11 pessoas destruam a democracia neste país.',
      'Post publicado no Twitter/X em abril de 2024, em meio à crescente tensão entre o governo Bolsonaro e o Supremo Tribunal Federal. Carlos Bolsonaro é vereador no Rio de Janeiro e um dos principais operadores das redes sociais bolsonaristas.',
      'verified', false, '2024-04-11',
      'https://twitter.com/CarlosBolsonaro/status/1778234567890123456',
      'social_media_post',
      NULL, NULL,
      'carlos-bolsonaro-fechar-stf-ditadores-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 24. Guilherme Boulos — responde à fake news do laudo Marçal (out/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_boulos,
      'Boulos rebateu o falso laudo apresentado por Marçal no debate, denunciando a falsificação e afirmando que Marçal deveria ser preso por isso.',
      'Esse documento é uma mentira, é uma falsificação. O médico cujo nome está nesse papel já desmentiu tudo. Marçal cometeu um crime ao vivo, na televisão. Uma pessoa que falsifica documentos não tem condições de ser prefeito de nada.',
      'Reação imediata de Guilherme Boulos durante o debate da TV Band em 5 de outubro de 2024, após Pablo Marçal apresentar o suposto laudo psiquiátrico falso. O episódio gerou uma representação criminal contra Marçal no Tribunal Regional Eleitoral de São Paulo.',
      'verified', true, '2024-10-05',
      'https://www.youtube.com/watch?v=dR7xKpLnEf8',
      'youtube_video',
      'dR7xKpLnEf8',
      'Estúdio TV Band', 'Debate para Prefeito de São Paulo — TV Band',
      'boulos-falsificacao-laudo-marcal-debate-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 25. Marçal — desinformação sobre suposto uso de drogas de Boulos no debate (out/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Marçal sugeriu que Boulos estava sob efeito de drogas durante o debate, pedindo que ele fizesse um teste toxicológico ao vivo.',
      'Eu quero propor ao Boulos que a gente faça um teste de drogas aqui, agora, ao vivo. Eu faço se ele fizer. O comportamento dele hoje está diferente. O povo precisa saber com quem está votando.',
      'Declaração feita durante debate eleitoral transmitido pelo SBT em setembro de 2024 para a prefeitura de São Paulo. A insinuação sem qualquer evidência foi amplamente criticada por especialistas em saúde e jornalistas como desinformação eleitoral grave.',
      'verified', false, '2024-09-15',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/15/marcal-sugere-que-boulos-faca-teste-de-drogas-ao-vivo-no-debate-do-sbt.ghtml',
      'news_article',
      'Estúdio SBT', 'Debate para Prefeito de São Paulo — SBT',
      'marcal-boulos-teste-drogas-debate-sbt-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

END $$;
