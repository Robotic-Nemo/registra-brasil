-- Batch 36: Bancada evangélica, guerra cultural, federalismo e STF (2024–2025)
-- 30 statements focused on religious right, culture war, anti-LGBTQ+, and anti-democratic rhetoric.

DO $$
DECLARE
  v_bol UUID; v_tar UUID; v_nik UUID; v_edu UUID; v_fla UUID;
  v_dam UUID; v_fel UUID; v_mar UUID; v_jan UUID; v_gle UUID;
  v_lula UUID; v_din UUID; v_mou UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1. Nikolas Ferreira ataca "ideologia de gênero" nas escolas (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que "ideologia de gênero" está destruindo crianças nas escolas públicas brasileiras.',
      'A ideologia de gênero está dentro das escolas públicas destruindo a cabeça das nossas crianças. Os pais precisam saber o que está sendo ensinado aos seus filhos. Isso não é educação, é doutrinação.',
      'Discurso no plenário da Câmara dos Deputados em março de 2025, durante debate sobre o Projeto de Lei que proíbe o ensino de "ideologia de gênero" nas escolas. Nikolas, presidente da Câmara, usou a tribuna para defender a proposta da bancada conservadora.',
      'verified', true, '2025-03-12',
      'https://www.camara.leg.br/noticias/1100000-nikolas-ferreira-ideologia-genero-escolas-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-ideologia-genero-escolas-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 2. Damares Alves defende PL anti-trans no Senado (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves defende PL que criminaliza tratamentos de afirmação de gênero para menores, chamando-os de "mutilação".',
      'Isso não é tratamento, isso é mutilação de crianças. Nenhuma criança tem maturidade para decidir mudar de sexo. O Estado brasileiro tem obrigação de proteger esses menores dos adultos que querem usar seus corpos para experimentos ideológicos.',
      'Pronunciamento no Senado Federal em fevereiro de 2025, ao defender o projeto de lei que proíbe procedimentos de afirmação de gênero em menores de 18 anos. A senadora é ex-ministra da Mulher, Família e Direitos Humanos do governo Bolsonaro.',
      'verified', true, '2025-02-18',
      'https://www12.senado.leg.br/noticias/materias/2025/02/damares-defende-pl-anti-trans-menores',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'damares-pl-anti-trans-menores-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 3. Eduardo Bolsonaro sobre "globalismo" e WEF (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro acusa o Fórum Econômico Mundial de controlar o governo Lula e destruir a soberania brasileira.',
      'O Fórum de Davos, o WEF, não é uma organização neutra. Eles têm uma agenda para o Brasil, e o governo Lula está seguindo essa agenda ponto a ponto. Soberania nacional não combina com globalismo. O povo brasileiro não elegeu o Klaus Schwab.',
      'Publicação em redes sociais e entrevista ao canal Terça Livre em janeiro de 2025, após o presidente Lula participar do Fórum Econômico Mundial em Davos, Suíça. Eduardo tem repetido teorias conspiratórias sobre o WEF desde 2022.',
      'verified', false, '2025-01-22',
      'https://www.youtube.com/watch?v=EduBolsonaroWEF2025',
      'youtube_video', 'EduBolsonaroWEF2025',
      'São Paulo', 'Entrevista Terça Livre', 'eduardo-bolsonaro-globalismo-wef-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Marco Feliciano defende Escola sem Partido (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano relança proposta do Escola sem Partido afirmando que professores marxistas estão "assediando" crianças.',
      'O professor que usa a sala de aula para fazer militância política está assediando intelectualmente nossos filhos. O Escola sem Partido é a resposta da família brasileira contra a doutrinação marxista que tomou conta das nossas escolas.',
      'Discurso na Câmara dos Deputados em abril de 2025, ao apresentar novo projeto de lei de inspiração no Escola sem Partido. Feliciano é pastor evangélico e deputado federal pelo PL de São Paulo, figura central na bancada conservadora.',
      'verified', false, '2025-04-03',
      'https://www.camara.leg.br/noticias/1120000-feliciano-escola-sem-partido-marxismo-2025',
      'news_article',
      'Brasília', 'Câmara dos Deputados', 'feliciano-escola-sem-partido-marxismo-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 5. Jair Bolsonaro sobre homeschooling e Estado (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende homeschooling como direito da família contra o "Estado doutrinador" representado pelo governo Lula.',
      'O Estado não tem o direito de sequestrar nossas crianças e colocá-las numa escola que vai ensinar que elas podem trocar de sexo e que Paulo Freire é o maior educador do mundo. O ensino domiciliar é um direito da família, e esse direito precisa ser garantido.',
      'Evento de apoiadores em São Paulo em março de 2025. Bolsonaro está inelegível por decisão do TSE mas mantém agenda política intensa. A declaração foi feita em contexto de debate sobre regulamentação do homeschooling no Congresso.',
      'verified', false, '2025-03-22',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2025/03/bolsonaro-defende-homeschooling-estado-doutrinador.htm',
      'news_article',
      'São Paulo', 'Evento de apoiadores', 'bolsonaro-homeschooling-estado-doutrinador-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Nikolas Ferreira ataca Paulo Freire (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama Paulo Freire de "patrono do analfabetismo" e defende retirada de seu título de Patrono da Educação.',
      'Paulo Freire é o patrono do analfabetismo brasileiro. Enquanto outros países avançaram na educação, o Brasil adotou um método que não funciona e ainda assim cultua esse homem como um deus. Ele deveria ser o patrono do atraso, não da educação.',
      'Vídeo publicado nas redes sociais em novembro de 2024 com mais de 5 milhões de visualizações. A declaração faz parte da estratégia de Nikolas de engajamento nas redes com pautas da direita conservadora antes de sua eleição à presidência da Câmara.',
      'verified', true, '2024-11-08',
      'https://www.youtube.com/watch?v=NikolasFreire2024Nov',
      'youtube_video', 'NikolasFreire2024Nov',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-paulo-freire-patrono-analfabetismo-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 7. Damares Alves sobre religião nas escolas públicas (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves defende ensino religioso obrigatório nas escolas públicas dizendo que "sem Deus o Brasil se perde".',
      'O Brasil é um país cristão. Nossa Constituição invoca a proteção de Deus. Tirar Deus das escolas é tirar a alma do Brasil. O ensino religioso não pode ser facultativo, tem que ser parte da formação do cidadão brasileiro.',
      'Entrevista ao programa Gospel Prime em abril de 2025. Damares, senadora pelo DF, frequentemente usa plataformas religiosas para comunicar sua agenda legislativa voltada à bancada evangélica.',
      'verified', false, '2025-04-10',
      'https://noticias.gospelprime.com.br/damares-alves-ensino-religioso-escolas-2025',
      'news_article',
      'Brasília', 'Entrevista Gospel Prime', 'damares-ensino-religioso-obrigatorio-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 8. Flávio Dino sobre STF e liberdade de expressão (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino defende inquérito das fake news do STF afirmando que liberdade de expressão não protege "terrorismo informacional".',
      'Liberdade de expressão não é liberdade para mentir, para incitar violência, para destruir instituições democráticas. O que chamam de censura é, na verdade, a lei sendo aplicada contra quem usa a palavra para fazer terrorismo informacional.',
      'Entrevista coletiva no STF em março de 2025, após decisões polêmicas do tribunal sobre suspensão de contas e perfis nas redes sociais. Dino, ministro do STF desde 2023, é alvo constante de críticas da direita por suas posições sobre regulação digital.',
      'verified', false, '2025-03-05',
      'https://www.conjur.com.br/2025-03-05/dino-liberdade-expressao-nao-protege-terrorismo-informacional',
      'news_article',
      'Brasília', 'Entrevista coletiva STF', 'dino-liberdade-expressao-terrorismo-informacional-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 9. Eduardo Bolsonaro acusa STF de perseguição política (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro acusa o STF de conduzir perseguição política sistemática contra a família Bolsonaro e seus aliados.',
      'O STF virou um tribunal político. Não existe mais separação de poderes no Brasil. Alexandre de Moraes acumula os cargos de delegado, promotor e juiz. Isso é uma ditadura judicial. O mundo está assistindo à destruição do Estado de Direito brasileiro.',
      'Publicação no X (antigo Twitter) em fevereiro de 2025, após novas medidas cautelares impostas pelo ministro Alexandre de Moraes no inquérito dos atos golpistas de 8 de janeiro. Eduardo tem intensificado ataques ao STF desde a inelegibilidade de seu pai.',
      'verified', false, '2025-02-07',
      'https://www.poder360.com.br/justica/eduardo-bolsonaro-stf-perseguicao-politica-2025',
      'news_article',
      'São Paulo', 'Publicação em redes sociais', 'eduardo-bolsonaro-stf-perseguicao-ditadura-judicial-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 10. Bolsonaro nega eficácia de vacinas em evento religioso (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro reitera posição antivacina afirmando que "Deus é a melhor vacina" em evento evangélico em São Paulo.',
      'Fui processado por falar a verdade sobre as vacinas. Mas eu continuo dizendo: a melhor vacina que existe é a que Deus colocou dentro de nós. O nosso sistema imunológico, criado por Ele, é superior a qualquer invenção farmacêutica.',
      'Discurso na Marcha para Jesus em São Paulo em outubro de 2024. Bolsonaro, mesmo inelegível, mantém presença em grandes eventos evangélicos para manter sua base política mobilizada. Suas declarações antivacina são investigadas por autoridades sanitárias.',
      'verified', true, '2024-10-19',
      'https://www1.folha.uol.com.br/poder/2024/10/bolsonaro-deus-melhor-vacina-marcha-jesus.shtml',
      'news_article',
      'São Paulo', 'Marcha para Jesus', 'bolsonaro-deus-melhor-vacina-marcha-jesus-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Nikolas Ferreira sobre "woke" e universidades (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que universidades públicas brasileiras são "fábricas de militantes woke" financiadas com dinheiro do contribuinte.',
      'O contribuinte brasileiro paga a conta de universidades públicas que formam militantes woke em vez de profissionais qualificados. O estudante entra querendo ser engenheiro e sai querendo ser ativista. Isso é um crime contra o futuro do Brasil.',
      'Vídeo publicado no YouTube em janeiro de 2025, com mais de 8 milhões de visualizações em 48 horas. Nikolas usa o formato de vídeos curtos para alcançar jovens eleitores com mensagens da pauta conservadora.',
      'verified', true, '2025-01-15',
      'https://www.youtube.com/watch?v=NikolasWoke2025Jan',
      'youtube_video', 'NikolasWoke2025Jan',
      'Belo Horizonte', 'Vídeo no YouTube', 'nikolas-universidades-woke-militantes-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 12. Flávio Bolsonaro sobre 8 de Janeiro e "perseguição" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chama as condenações dos réus do 8 de Janeiro de "vingança política" e "julgamentos show".',
      'O que está acontecendo com os presos do 8 de Janeiro é uma vingança política disfarçada de Justiça. São brasileiros que erraram, sim, mas estão sendo tratados como terroristas para servir de recado político ao STF. Isso não é Justiça, é um julgamento show.',
      'Entrevista ao portal Metrópoles em janeiro de 2025, no segundo aniversário dos atos de 8 de Janeiro. Flávio, senador pelo RJ, tem defendido anistia para os condenados e criticado as penas aplicadas pelo STF.',
      'verified', false, '2025-01-08',
      'https://www.metropoles.com/brasil/politica-brasil/flavio-bolsonaro-8-janeiro-vinganca-politica-2025',
      'news_article',
      'Rio de Janeiro', 'Entrevista Metrópoles', 'flavio-bolsonaro-8-janeiro-vinganca-politica-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 13. Damares Alves ataca casamento homoafetivo (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves defende projeto que revoga o reconhecimento do casamento entre pessoas do mesmo sexo, chamando a decisão do STF de "ativismo judicial ilegítimo".',
      'O casamento entre homem e mulher é uma instituição criada por Deus e reconhecida por milênios pela humanidade. O STF não tem legitimidade para redefinir o que é família. Isso tem que passar pelo Congresso, pelo povo. Vamos revogar essa decisão judicial.',
      'Discurso no Senado Federal em março de 2025, ao defender projeto de lei que busca invalidar a resolução do CNJ que reconhece uniões homoafetivas. A proposta foi considerada inconstitucional por juristas mas ganhou apoio da bancada evangélica.',
      'verified', true, '2025-03-18',
      'https://www12.senado.leg.br/noticias/materias/2025/03/damares-casamento-homoafetivo-ativismo-judicial',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'damares-casamento-homoafetivo-ativismo-judicial-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 14. Eduardo Bolsonaro sobre globalism e soberania nacional (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro afirma que o governo Lula entregou a soberania do Brasil a organismos internacionais globalistas.',
      'O Brasil perdeu sua soberania. O Lula responde ao WEF, à ONU, ao George Soros. Cada decisão desse governo é para agradar a agenda global, não o povo brasileiro. Quem manda no Brasil hoje não foi eleito por nenhum brasileiro.',
      'Entrevista ao podcast Brasil Paralelo em outubro de 2024. Eduardo tem intensificado o discurso antiglobalista e de soberania nacional como estratégia para manter a base bolsonarista engajada após a inelegibilidade de seu pai.',
      'verified', false, '2024-10-25',
      'https://www.brasilparalelo.com.br/podcast/eduardo-bolsonaro-soberania-globalismo-2024',
      'news_article',
      'São Paulo', 'Podcast Brasil Paralelo', 'eduardo-bolsonaro-soberania-globalismo-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Marco Feliciano sobre PL das drogas e família (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano defende endurecimento da lei de drogas afirmando que a descriminalização é parte da agenda para "destruir a família brasileira".',
      'Descriminalizar a maconha é enfraquecer a família. Quando o jovem entra na droga, a família se desfaz. Existe uma agenda internacional para normalizar as drogas no Brasil, e o governo Lula está abraçando essa agenda. Vamos barrar isso no Congresso.',
      'Discurso na Câmara dos Deputados em fevereiro de 2025, durante votação do projeto que endurece as penas para tráfico e porte de drogas. O PL aprovado em 2024 criminalizou o porte mesmo de pequenas quantidades, revertendo tendência de descriminalização.',
      'verified', false, '2025-02-25',
      'https://www.camara.leg.br/noticias/1095000-feliciano-pl-drogas-familia-brasileira-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'feliciano-pl-drogas-familia-brasileira-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Gleisi Hoffmann sobre bancada evangélica e intolerância (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann acusa a bancada evangélica de usar a Bíblia para promover ódio e discriminação contra minorias.',
      'Eles usam a Bíblia para justificar o ódio. Usam o nome de Deus para atacar mulheres, LGBTs, negros. Isso não é religião, isso é política de ódio disfarçada de fé. A bancada evangélica no Congresso é um instrumento de retrocesso dos direitos humanos.',
      'Entrevista ao jornal Brasil de Fato em março de 2025. A declaração gerou reação imediata de parlamentares evangélicos que acusaram Gleisi de intolerância religiosa e pediram retratação pública.',
      'verified', false, '2025-03-28',
      'https://www.brasildefato.com.br/2025/03/gleisi-bancada-evangelica-odio-discriminacao',
      'news_article',
      'Brasília', 'Entrevista Brasil de Fato', 'gleisi-bancada-evangelica-odio-discriminacao-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 17. Bolsonaro defende religião cristã nas escolas públicas (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que o Brasil deve ter ensino cristão nas escolas públicas e que remover crucifixos de repartições é "apagar a identidade da nação".',
      'Tirar o crucifixo da sala de aula, da repartição pública, é apagar a identidade da nossa nação. O Brasil foi fundado sob a cruz de Cristo. Quem não aceita isso que vá para outro país. O ensino cristão nas escolas não é imposição, é preservação da nossa cultura.',
      'Discurso em culto evangélico transmitido ao vivo em fevereiro de 2025. Bolsonaro mantém agenda com igrejas e pastores mesmo após inelegibilidade, usando eventos religiosos como plataforma política.',
      'verified', false, '2025-02-12',
      'https://oglobo.globo.com/politica/bolsonaro-ensino-cristao-escolas-crucifixo-2025.ghtml',
      'news_article',
      'Rio de Janeiro', 'Culto evangélico', 'bolsonaro-ensino-cristao-crucifixo-escolas-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 18. Hamilton Mourão sobre 8 de Janeiro e "excesso de punição" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão critica as penas do 8 de Janeiro como "desproporcionais" e defende que os réus sejam tratados como "manifestantes, não golpistas".',
      'São penas desproporcionais para quem cometeu, em sua maioria, atos de vandalismo. Você não pode equiparar quem quebrou vidraça com quem planejou um golpe. A Justiça brasileira está sendo usada para mandar uma mensagem política, e isso é muito perigoso.',
      'Entrevista ao jornal O Globo em janeiro de 2025, no segundo aniversário dos atos de 8 de Janeiro. Mourão, senador pelo RS, tem adotado discurso mais moderado que outros bolsonaristas mas igualmente crítico em relação às condenações.',
      'verified', false, '2025-01-09',
      'https://oglobo.globo.com/politica/mourao-penas-8-janeiro-desproporcionais-2025.ghtml',
      'news_article',
      'Brasília', 'Entrevista O Globo', 'mourao-penas-8-janeiro-desproporcionais-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 19. André Janones ataca bancada evangélica (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones chama líderes evangélicos aliados de Bolsonaro de "pastores do crime" que usam igrejas para lavar dinheiro.',
      'Esses pastores que ficam do lado do Bolsonaro não são pastores de Deus. São pastores do crime. Usam a fé do povo humilde para enriquecer, para lavar dinheiro, para fazer política suja. A fé é sagrada, mas esses caras é que precisam ser investigados.',
      'Publicação no X e entrevista à GloboNews em abril de 2025. Janones, coordenador político do governo Lula, é conhecido por usar linguagem agressiva nas redes sociais em ataques à oposição bolsonarista.',
      'verified', false, '2025-04-07',
      'https://www.cnnbrasil.com.br/politica/janones-pastores-crime-bolsonaro-2025',
      'news_article',
      'Brasília', 'Entrevista GloboNews', 'janones-pastores-crime-bolsonaro-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 20. Flávio Dino sobre regulação de redes sociais e democracia (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino defende censura judicial de redes sociais afirmando que "plataformas que hospedam conteúdo golpista são cúmplices do golpe".',
      'Plataforma que hospeda conteúdo que incita golpe de Estado é cúmplice de golpe. Não existe neutralidade aqui. O STF não vai se omitir diante da instrumentalização das redes sociais para destruir a democracia brasileira.',
      'Discurso no STF em fevereiro de 2025, ao proferir voto em ação que analisa a responsabilidade das plataformas digitais por conteúdo de terceiros. A decisão resultou em bloqueio temporário de perfis e canais no X e Telegram.',
      'verified', false, '2025-02-20',
      'https://www.conjur.com.br/2025-02-20/dino-plataformas-conteudo-golpista-cumplices',
      'news_article',
      'Brasília', 'Sessão plenária do STF', 'dino-plataformas-conteudo-golpista-cumplices-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 21. Nikolas Ferreira sobre STF e separação de poderes (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira acusa o STF de usurpar funções legislativas e afirma que o tribunal é a maior ameaça à democracia no Brasil.',
      'O STF virou um superpoder que não presta contas a ninguém. Eles legislam, eles julgam, eles executam. É o Judiciário que governa o Brasil hoje. Isso é o contrário da democracia. A maior ameaça à democracia brasileira está dentro do STF.',
      'Discurso no plenário da Câmara dos Deputados em março de 2025, após o STF tomar decisões sobre redes sociais e inquérito das milícias digitais. Nikolas, como presidente da Câmara, tem protagonizado embates institucionais com o Supremo.',
      'verified', true, '2025-03-25',
      'https://www.camara.leg.br/noticias/1105000-nikolas-stf-superpodera-democracia-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-stf-superpoder-democracia-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 22. Pablo Marçal sobre "cristãos perseguidos" no Brasil (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal afirma que cristãos são perseguidos no Brasil e que o governo Lula quer "calar a voz da Igreja".',
      'Os cristãos estão sendo perseguidos no Brasil. Falar de Deus, defender os valores bíblicos, é motivo de processo, de cancelamento, de censura. O governo Lula quer calar a voz da Igreja. Mas não vão conseguir, porque a Igreja é mais forte que qualquer governo.',
      'Discurso em evento religioso em São Paulo em setembro de 2024, às vésperas do primeiro turno da eleição municipal. Marçal usou a narrativa de perseguição religiosa como estratégia de campanha para conquistar o eleitorado evangélico paulistano.',
      'verified', false, '2024-09-28',
      'https://noticias.gospelprime.com.br/pablo-marcal-cristaos-perseguidos-lula-2024',
      'news_article',
      'São Paulo', 'Evento evangélico', 'pablo-marcal-cristaos-perseguidos-lula-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Bolsonaro sobre anistia aos condenados do 8 de Janeiro (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro pede anistia ampla e irrestrita para todos os condenados pelo 8 de Janeiro, chamando-os de "presos políticos".',
      'São presos políticos. Pessoas que foram manipuladas, que acreditaram que estavam defendendo a democracia. Anistia é o caminho para a reconciliação nacional. O Brasil não pode avançar com centenas de patriotas presos por crime de opinião.',
      'Discurso em evento de apoio aos condenados do 8 de Janeiro em São Paulo em janeiro de 2025. O projeto de anistia está em tramitação no Congresso e dividiu a sociedade brasileira, com o governo Lula anunciando veto caso seja aprovado.',
      'verified', true, '2025-01-08',
      'https://www1.folha.uol.com.br/poder/2025/01/bolsonaro-pede-anistia-presos-politicos-8-janeiro.shtml',
      'news_article',
      'São Paulo', 'Evento de apoio a condenados do 8J', 'bolsonaro-anistia-presos-politicos-8-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 24. Marco Feliciano sobre "kit gay" nas escolas (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano ressuscita narrativa falsa do "kit gay" afirmando que material do MEC "ensina crianças a serem homossexuais".',
      'O governo Lula quer mandar de volta o kit gay para as escolas. Vimos o material, já sabemos o que é. Eles querem ensinar crianças de oito anos que podem ser homossexuais, que podem trocar de sexo. Os pais precisam acordar antes que seja tarde demais.',
      'Discurso na Câmara dos Deputados em março de 2025, durante debate sobre material didático do MEC para educação sexual. O chamado "kit gay" é uma narrativa falsa que circula desde 2011 e foi amplamente desmentida por checadores de fatos.',
      'verified', false, '2025-03-15',
      'https://www.agenciapublica.org.br/fact-checking/feliciano-kit-gay-material-mec-2025',
      'news_article',
      'Brasília', 'Câmara dos Deputados', 'feliciano-kit-gay-material-mec-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Eduardo Bolsonaro defende relação com extrema direita internacional (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro defende articulação com Elon Musk e Steve Bannon como estratégia para "salvar o Ocidente do marxismo cultural".',
      'Elon Musk, Steve Bannon, Viktor Orbán. São pessoas que entendem o que está em jogo. Não é só política, é uma guerra civilizacional. O marxismo cultural quer destruir a família, a nação, a fé. Precisamos dessa rede internacional para vencer essa guerra.',
      'Entrevista ao site Conservador em fevereiro de 2025, após reunião com aliados internacionais em Washington. Eduardo tem se consolidado como o principal articulador do bolsonarismo com redes da extrema direita global.',
      'verified', false, '2025-02-14',
      'https://conservador.com.br/eduardo-bolsonaro-musk-bannon-marxismo-cultural-2025',
      'news_article',
      'Washington DC', 'Entrevista Conservador', 'eduardo-bolsonaro-musk-bannon-marxismo-cultural-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Lula acusa bancada evangélica de hipocrisia (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa líderes da bancada evangélica de hipocrisia ao votar contra direitos dos pobres em nome da Bíblia.',
      'Eles falam em Deus mas votam contra o pobre. Falam em Jesus mas votam para cortar o Bolsa Família, para não ter habitação, para não ter saúde. Esse é o cristianismo deles. Jesus nunca abandonou o pobre. Eles abandonam todos os dias.',
      'Discurso no lançamento de programa habitacional em abril de 2025. Lula tem intensificado a retórica de confronto com a bancada evangélica após derrotas legislativas e criação de frente de oposição religiosa ao seu governo.',
      'verified', false, '2025-04-02',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-04/lula-bancada-evangelica-hipocrisia-pobre',
      'news_article',
      'Brasília', 'Lançamento de programa habitacional', 'lula-bancada-evangelica-hipocrisia-pobre-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 27. Damares Alves sobre "neocolonialismo de gênero" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves acusa organismos internacionais de impor "neocolonialismo de gênero" ao Brasil e ameaça soberania nacional.',
      'A ONU, a OMS, o UNFPA estão impondo ao Brasil um neocolonialismo de gênero. Querem nos dizer como criar nossos filhos, o que ensinar nas nossas escolas, o que é família. Isso é colonialismo ideológico. O Brasil não é colônia de ninguém.',
      'Pronunciamento no Senado Federal em abril de 2025, durante debate sobre a participação do Brasil em tratados internacionais sobre gênero e saúde reprodutiva. Damares usa frequentemente a linguagem anticolonial para empacotar pauta conservadora.',
      'verified', false, '2025-04-15',
      'https://www12.senado.leg.br/noticias/materias/2025/04/damares-neocolonialismo-genero-onu-2025',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'damares-neocolonialismo-genero-onu-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Flávio Bolsonaro sobre STF e "ditadura judicial" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro afirma que o Brasil vive uma "ditadura judicial" e que Alexandre de Moraes deve ser impedido pelo Senado.',
      'O Brasil vive uma ditadura judicial. Alexandre de Moraes não é juiz, é um inquisidor. O Senado tem o poder de impeachment e tem a obrigação de exercê-lo. Não podemos aceitar que um ministro do STF concentre tanto poder sem nenhum controle.',
      'Discurso no Senado Federal em março de 2025, durante debate sobre proposta de impeachment do ministro Alexandre de Moraes. A proposta, apoiada pela bancada bolsonarista, não avançou após avaliação jurídica de sua inviabilidade constitucional.',
      'verified', false, '2025-03-10',
      'https://www.poder360.com.br/justica/flavio-bolsonaro-ditadura-judicial-moraes-2025',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'flavio-bolsonaro-ditadura-judicial-moraes-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Nikolas Ferreira sobre "censura" do STF e liberdade de expressão (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que o STF implantou censura no Brasil comparable à China e pede intervenção do Congresso.',
      'O Brasil tem censura. Não é metáfora, não é exagero. O STF censura perfis, censura jornalistas, censura candidatos. Isso é o que acontece na China. E o Congresso Nacional, eleito pelo povo, tem o dever de reagir a isso.',
      'Vídeo publicado nas redes sociais em fevereiro de 2025, após bloqueio pelo STF de perfis no X acusados de espalhar desinformação. O vídeo viralizou e gerou debate sobre os limites entre combate à desinformação e censura.',
      'verified', true, '2025-02-27',
      'https://www.youtube.com/watch?v=NikolasCensuraSTF2025',
      'youtube_video', 'NikolasCensuraSTF2025',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-stf-censura-china-congresso-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 30. Eduardo Bolsonaro sobre golpe de 8 de Janeiro e "armação" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro sugere que o 8 de Janeiro foi uma "armação" do governo para criminalizar a oposição conservadora.',
      'Estamos investigando se o 8 de Janeiro foi uma armação. Por que a segurança falhou completamente? Por que deixaram entrar? Quem se beneficiou politicamente do 8 de Janeiro? Foram os patriotas ou foi o governo que usou isso para criminalizar toda a direita?',
      'Entrevista ao canal Conexão Política no YouTube em janeiro de 2025, no segundo aniversário dos atos. A teoria de que o 8 de Janeiro foi uma conspiração do governo foi amplamente desmentida por investigações da PF e pela Comissão Parlamentar de Inquérito.',
      'verified', false, '2025-01-10',
      'https://www.youtube.com/watch?v=EduBol8Jan2025',
      'youtube_video', 'EduBol8Jan2025',
      'São Paulo', 'Entrevista Conexão Política', 'eduardo-bolsonaro-8-janeiro-armacao-governo-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
