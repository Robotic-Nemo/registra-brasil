-- Batch 45: Política religiosa, bancada evangélica, Damares, Feliciano,
-- Nikolas Ferreira, Bia Kicis, Michelle Bolsonaro, guerras culturais,
-- CPMI INSS, pautas de costumes (2025–2026)
-- 50 statements

DO $$
DECLARE
  v_dam UUID; v_fel UUID; v_nik UUID; v_bia UUID; v_mic UUID;
  v_jan UUID; v_bol UUID; v_fla UUID; v_edu UUID; v_mar UUID;
  v_lula UUID; v_din UUID; v_bou UUID;
  c_hom UUID; c_mis UUID; c_int UUID; c_des UUID; c_odi UUID;
  c_aut UUID; c_mac UUID; c_abu UUID; c_irr UUID; c_cor UUID;
BEGIN
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';

  -- 1. Damares eleita presidente da CDH do Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares promete usar presidência da CDH para defender mulheres, crianças e idosos com base em valores cristãos.',
      'Assumo a presidência da Comissão de Direitos Humanos com o compromisso de defender mulheres, crianças e idosos. Minha fé cristã me guia nessa missão. Vamos trabalhar por políticas públicas que protejam a família e os mais vulneráveis. Não vou aceitar agenda ideológica nesta comissão.',
      'Discurso de posse de Damares Alves como presidente da CDH do Senado em fevereiro de 2025. A eleição gerou polêmica entre organizações de direitos humanos que criticaram a mistura de religião e política pública.',
      'verified', true, '2025-02-10',
      'https://www.folha.uol.com.br/poder/2025/02/damares-eleita-presidente-cdh-senado-valores-cristaos.shtml',
      'news_article',
      'Brasília', 'Comissão de Direitos Humanos do Senado', 'damares-presidente-cdh-senado-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 2. Damares define pauta feminina como prioridade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares anuncia pauta feminina como prioridade e diferencia feminismo cristão de feminismo ideológico.',
      'A pauta feminina é minha prioridade no biênio 2025-2026. Mas não confundam: defendo a mulher real, a mãe, a trabalhadora, a que sofre violência. Não defendo o feminismo ideológico que quer destruir a família. Meu feminismo é cristão e protege a mulher de verdade.',
      'Declaração de Damares em coletiva de imprensa em fevereiro de 2025, ao apresentar as prioridades da CDH para o biênio. A senadora diferenciou sua agenda feminina do feminismo secular.',
      'verified', true, '2025-02-15',
      'https://g1.globo.com/politica/noticia/2025/02/damares-pauta-feminina-prioridade-cdh-bisenio.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa no Senado', 'damares-pauta-feminina-prioridade-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 3. Damares revela igrejas investigadas na CPMI do INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares revela nomes de igrejas sob investigação na CPMI do INSS e causa polêmica ao publicar dados nas redes.',
      'As igrejas que desviaram dinheiro do INSS precisam ser investigadas e punidas. Publiquei os nomes porque a sociedade tem direito de saber. Esses dados já eram públicos. Quem desvia dinheiro de aposentados não pode se esconder atrás de religião.',
      'Declaração de Damares em vídeo publicado nas redes sociais em março de 2025, justificando a divulgação de nomes de igrejas investigadas na CPMI do INSS. A publicação gerou controvérsia mesmo entre aliados evangélicos.',
      'verified', true, '2025-03-20',
      'https://www.estadao.com.br/politica/damares-igrejas-investigadas-cpmi-inss-polemica/',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'damares-igrejas-investigadas-cpmi-inss-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 4. Damares defende publicação de nomes de instituições
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares insiste que dados de igrejas investigadas já eram públicos e que transparência é dever do parlamentar.',
      'Não revelei nada que já não fosse público. Os dados estavam disponíveis no processo da CPMI. Meu dever como parlamentar é dar transparência ao cidadão. Se alguma igreja se sentiu prejudicada, prove sua inocência. Quem não deve não teme.',
      'Declaração de Damares em entrevista à CNN Brasil em março de 2025, respondendo a críticas de líderes evangélicos que a acusaram de trair a bancada religiosa ao expor igrejas na CPMI do INSS.',
      'verified', false, '2025-03-25',
      'https://www.cnnbrasil.com.br/politica/damares-dados-igrejas-publicos-transparencia/',
      'news_article',
      'Brasília', 'Entrevista à CNN Brasil', 'damares-dados-igrejas-publicos-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 5. Damares sobre revisão do Estatuto do Idoso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares propõe revisão do Estatuto do Idoso para ampliar proteção e incluir novas formas de abuso digital.',
      'O Estatuto do Idoso precisa ser atualizado. Nossos idosos estão sendo vítimas de golpes digitais, abandono afetivo e violência patrimonial. Vou propor uma revisão ampla que inclua proteção contra fraudes digitais e fortaleça as penas para quem abusa de pessoas idosas.',
      'Declaração de Damares em audiência pública na CDH do Senado em abril de 2025, ao anunciar proposta de revisão do Estatuto do Idoso com foco em novas formas de abuso.',
      'verified', true, '2025-04-10',
      'https://www.folha.uol.com.br/poder/2025/04/damares-revisao-estatuto-idoso-abuso-digital.shtml',
      'news_article',
      'Brasília', 'Audiência pública na CDH', 'damares-revisao-estatuto-idoso-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Feliciano defende Bolsonaro como única opção para 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano defende Bolsonaro como única opção para 2026 e diz que direita não pode se dividir.',
      'Bolsonaro é a única opção da direita para 2026. Mesmo em prisão domiciliar, ele é o líder que o povo escolheu. A direita não pode se dividir. Tarcísio, Zema, Caiado, todos precisam se unir em torno de Bolsonaro ou de quem ele indicar. Divisão é entregar o Brasil ao PT.',
      'Declaração de Marco Feliciano em culto evangélico em janeiro de 2025, defendendo Bolsonaro como candidato único da direita para as eleições de 2026.',
      'verified', true, '2025-01-20',
      'https://g1.globo.com/politica/noticia/2025/01/feliciano-bolsonaro-unica-opcao-2026-direita.ghtml',
      'news_article',
      'São Paulo', 'Culto evangélico', 'feliciano-bolsonaro-unica-opcao-2026-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 7. Feliciano diz que amadureceu e evita polêmicas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano diz que amadureceu após 16 anos de mandato e que evita polêmicas desnecessárias.',
      'Depois de 16 anos de mandato, amadureci. Aprendi que nem toda batalha vale a pena. Hoje escolho minhas lutas com mais sabedoria. Continuo firme nos meus princípios cristãos, mas não preciso mais brigar com todo mundo. A maturidade me ensinou a dialogar.',
      'Entrevista de Marco Feliciano ao portal UOL em fevereiro de 2025, em que afirmou ter amadurecido politicamente e evitar polêmicas que marcaram sua carreira nos anos anteriores.',
      'verified', false, '2025-02-12',
      'https://www.uol.com.br/noticias/politica/2025/02/feliciano-amadureceu-evita-polemicas-16-anos.htm',
      'news_article',
      'São Paulo', 'Entrevista ao UOL', 'feliciano-amadureceu-evita-polemicas-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 8. Feliciano sobre ideologia de gênero nas escolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano ataca o que chama de ideologia de gênero nas escolas e diz que governo quer doutrinar crianças.',
      'O governo Lula está infiltrando ideologia de gênero nas escolas para doutrinar nossas crianças. Querem ensinar meninos de 5 anos que podem ser meninas. Isso é abuso infantil disfarçado de educação. A bancada evangélica vai barrar qualquer projeto que ataque a inocência das crianças.',
      'Discurso de Feliciano em plenário da Câmara em abril de 2025, ao se posicionar contra projeto de lei sobre educação sexual nas escolas.',
      'verified', true, '2025-04-05',
      'https://www.poder360.com.br/congresso/feliciano-ideologia-genero-escolas-doutrinacao/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'feliciano-ideologia-genero-escolas-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 9. Nikolas ataca lei anti-misoginia como aberração
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama lei anti-misoginia de aberração jurídica que criminaliza a opinião.',
      'Essa lei anti-misoginia é uma aberração jurídica. Querem criminalizar a opinião. Se eu disser que homem é homem e mulher é mulher, vou preso? Isso é censura disfarçada de proteção. O Brasil está caminhando para um regime onde pensar diferente é crime.',
      'Declaração de Nikolas Ferreira em vídeo publicado em março de 2026, criticando a lei que criminalizou a misoginia. O vídeo viralizou e gerou forte repúdio de organizações feministas.',
      'verified', true, '2026-03-10',
      'https://www.folha.uol.com.br/poder/2026/03/nikolas-ferreira-lei-anti-misoginia-aberracao.shtml',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-lei-anti-misoginia-aberracao-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 10. Nikolas sobre Pix — vídeo viral anti-governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas viraliza com vídeo sobre monitoramento do Pix, espalhando desinformação sobre fiscalização.',
      'O governo Lula quer monitorar cada centavo que você movimenta pelo Pix. É o Grande Irmão vigiando seu bolso. Querem saber quanto você ganha, quanto você gasta, para quem você manda dinheiro. Isso é controle totalitário. O Pix era do povo e agora virou ferramenta de espionagem.',
      'Vídeo de Nikolas Ferreira publicado em janeiro de 2025, que viralizou com milhões de visualizações, espalhando alegações falsas sobre suposto monitoramento governamental de transações Pix. O governo foi forçado a recuar de medida de fiscalização da Receita Federal.',
      'verified', true, '2025-01-10',
      'https://g1.globo.com/politica/noticia/2025/01/nikolas-ferreira-video-pix-monitoramento-viraliza.ghtml',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-pix-monitoramento-video-viral-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Nikolas diz que cristãos são perseguidos no Brasil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas afirma que cristãos são perseguidos no Brasil e que governo quer criminalizar a fé.',
      'Estamos vivendo uma perseguição religiosa no Brasil. Cristãos são atacados por expressar sua fé. Se você diz que casamento é entre homem e mulher, te processam. Se cita a Bíblia, te chamam de homofóbico. Querem criminalizar nossa fé e nossos valores.',
      'Discurso de Nikolas Ferreira em congresso evangélico em março de 2025, alegando perseguição contra cristãos no Brasil.',
      'verified', false, '2025-03-15',
      'https://www.cnnbrasil.com.br/politica/nikolas-cristaos-perseguidos-brasil-criminalizacao-fe/',
      'news_article',
      'Belo Horizonte', 'Congresso evangélico', 'nikolas-cristaos-perseguidos-criminalizacao-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 12. Nikolas contra casamento homoafetivo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas se posiciona contra projeto de lei que regulamenta casamento homoafetivo no Código Civil.',
      'Casamento é entre homem e mulher. Isso está na Bíblia e na Constituição. Vou votar contra qualquer projeto que tente mudar essa definição. O STF pode decidir o que quiser, mas a Câmara representa o povo e o povo é contra isso. Não vou trair meus eleitores.',
      'Discurso de Nikolas na Câmara em maio de 2025, ao se posicionar contra projeto de lei que regulamentaria o casamento homoafetivo no Código Civil brasileiro.',
      'verified', true, '2025-05-20',
      'https://www.estadao.com.br/politica/nikolas-contra-casamento-homoafetivo-codigo-civil/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-contra-casamento-homoafetivo-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 13. Bancada evangélica se posiciona na CPMI do INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano defende que igrejas investigadas na CPMI do INSS são vítimas de perseguição religiosa.',
      'A CPMI do INSS está sendo usada para perseguir igrejas. Claro que fraude deve ser punida, mas estão generalizando. Usam casos isolados para demonizar instituições religiosas que fazem trabalho social imenso. Isso é perseguição religiosa disfarçada de investigação.',
      'Declaração de Feliciano em sessão da CPMI do INSS em abril de 2025, ao defender igrejas evangélicas investigadas por suposto envolvimento em fraudes previdenciárias.',
      'verified', true, '2025-04-15',
      'https://www.uol.com.br/noticias/politica/2025/04/feliciano-igrejas-cpmi-inss-perseguicao-religiosa.htm',
      'news_article',
      'Brasília', 'CPMI do INSS', 'feliciano-igrejas-cpmi-inss-perseguicao-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 14. Damares critica bancada evangélica por proteger igrejas fraudulentas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares critica colegas evangélicos que protegem igrejas envolvidas em fraudes do INSS.',
      'Não podemos usar a religião como escudo para proteger quem rouba. Igreja que desvia dinheiro de aposentados não é igreja, é quadrilha. Meus colegas da bancada evangélica precisam entender que defender fraudadores mancha a imagem de todas as igrejas sérias.',
      'Declaração de Damares em entrevista à Folha de S.Paulo em abril de 2025, causando atrito com colegas da bancada evangélica ao criticar a defesa de igrejas investigadas na CPMI do INSS.',
      'verified', true, '2025-04-18',
      'https://www.folha.uol.com.br/poder/2025/04/damares-critica-evangelicos-protecao-igrejas-fraude-inss.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'damares-critica-evangelicos-igrejas-fraude-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 15. Bia Kicis confirma chapa pura PL com Michelle para Senado DF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis confirma chapa pura do PL com Michelle Bolsonaro para o Senado pelo DF.',
      'O PL vai com chapa pura no Distrito Federal. Michelle Bolsonaro é nossa candidata ao Senado e eu vou apoiá-la com toda a minha energia. Michelle representa a mulher cristã, conservadora, que o DF e o Brasil precisam. Juntas, vamos levar os valores da família para o Senado.',
      'Declaração de Bia Kicis em evento do PL-DF em fevereiro de 2026, confirmando que o partido irá com chapa própria tendo Michelle Bolsonaro como pré-candidata ao Senado.',
      'verified', true, '2026-02-20',
      'https://g1.globo.com/df/distrito-federal/noticia/2026/02/bia-kicis-chapa-pura-pl-michelle-senado-df.ghtml',
      'news_article',
      'Brasília', 'Evento do PL-DF', 'bia-kicis-chapa-pura-michelle-senado-df-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 16. Michelle Bolsonaro sobre candidatura ao Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro anuncia pré-candidatura ao Senado pelo DF e diz que vai defender valores cristãos.',
      'Aceito a missão de ser pré-candidata ao Senado pelo Distrito Federal. Vou ao Senado para defender a família, os valores cristãos e as mulheres que acreditam em Deus. O Brasil precisa de vozes que não tenham medo de falar a verdade. Eu não tenho medo.',
      'Discurso de Michelle Bolsonaro em evento do PL em março de 2026, ao oficializar sua pré-candidatura ao Senado pelo Distrito Federal.',
      'verified', true, '2026-03-05',
      'https://www.poder360.com.br/eleicoes/michelle-bolsonaro-pre-candidata-senado-df-valores-cristaos/',
      'news_article',
      'Brasília', 'Evento do PL', 'michelle-pre-candidata-senado-df-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 17. Michelle ataca pauta de gênero do governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro ataca políticas de gênero do governo Lula e diz que querem destruir a família brasileira.',
      'O governo Lula quer destruir a família brasileira com suas políticas de gênero. Querem ensinar nossas crianças que podem escolher seu sexo. Querem que meninos entrem em banheiros femininos. Isso é uma aberração que nenhuma mãe aceita. Vou ao Senado para barrar essa agenda.',
      'Discurso de Michelle em congresso de mulheres evangélicas em março de 2026, atacando políticas de gênero do governo federal como parte de sua campanha pré-eleitoral.',
      'verified', true, '2026-03-12',
      'https://www.folha.uol.com.br/poder/2026/03/michelle-ataca-politicas-genero-governo-lula.shtml',
      'news_article',
      'Brasília', 'Congresso de mulheres evangélicas', 'michelle-ataca-politicas-genero-lula-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 18. Damares sobre aborto: posição firme contra descriminalização
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares promete usar CDH para barrar qualquer tentativa de descriminalização do aborto.',
      'Enquanto eu for presidente da CDH, nenhum projeto de descriminalização do aborto vai avançar nesta comissão. A vida começa na concepção e é sagrada. O Brasil é um país cristão e não vamos permitir que a cultura da morte avance. Defendo a vida do nascituro e da mãe.',
      'Declaração de Damares em audiência pública na CDH em maio de 2025, ao se posicionar contra projeto que flexibilizaria a legislação sobre aborto.',
      'verified', true, '2025-05-10',
      'https://www.estadao.com.br/politica/damares-cdh-aborto-descriminalizacao-barrar/',
      'news_article',
      'Brasília', 'Audiência pública na CDH', 'damares-cdh-barrar-aborto-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 19. Feliciano contra adoção por casais homoafetivos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano se posiciona contra adoção por casais homoafetivos e diz que criança precisa de pai e mãe.',
      'Criança precisa de pai e mãe. Isso não é homofobia, é biologia. Dois homens ou duas mulheres não podem dar a uma criança o que uma família completa oferece. Vou votar contra qualquer projeto que facilite a adoção por casais do mesmo sexo. É pelo bem da criança.',
      'Discurso de Feliciano na Câmara em junho de 2025, ao se posicionar contra projeto que facilitaria adoção por casais homoafetivos.',
      'verified', true, '2025-06-15',
      'https://www.cnnbrasil.com.br/politica/feliciano-contra-adocao-casais-homoafetivos/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'feliciano-contra-adocao-homoafetiva-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 20. Nikolas ataca direitos LGBTQ+ como pauta de destruição familiar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas chama avanço de direitos LGBTQ+ de agenda para destruir a família tradicional brasileira.',
      'Cada novo direito que inventam para a comunidade LGBT é um ataque à família tradicional. Banheiro unissex, casamento gay, adoção gay, ideologia de gênero nas escolas. Tudo faz parte de uma agenda internacional para destruir os valores que construíram o Brasil.',
      'Vídeo de Nikolas publicado em julho de 2025, atacando o avanço de direitos LGBTQ+ no Brasil. O vídeo foi denunciado por organizações de direitos humanos como discurso de ódio.',
      'verified', true, '2025-07-05',
      'https://g1.globo.com/politica/noticia/2025/07/nikolas-ataca-direitos-lgbtq-destruicao-familiar.ghtml',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-ataca-direitos-lgbtq-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 21. Janones com insultos homofóbicos contra Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones faz insultos homofóbicos contra Nikolas Ferreira e é criticado por esquerda e direita.',
      'O Nikolas precisa sair do armário logo. Fica atacando gay porque tem inveja. Todo mundo sabe o motivo. Ele é o que mais grita contra porque é o que mais tem medo de se olhar no espelho. Largem de hipocrisia.',
      'Publicação de André Janones no X em agosto de 2025, fazendo insinuações homofóbicas contra Nikolas Ferreira. A declaração foi criticada tanto pela esquerda quanto pela direita por usar homofobia como arma política.',
      'verified', true, '2025-08-10',
      'https://www.uol.com.br/noticias/politica/2025/08/janones-insultos-homofobicos-nikolas-ferreira.htm',
      'news_article',
      'Brasília', 'Publicação no X', 'janones-insultos-homofobicos-nikolas-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 22. Janones dobra aposta nos ataques a Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones dobra aposta em ataques a Nikolas e diz que não vai pedir desculpas por falar a verdade.',
      'Não vou pedir desculpas por falar a verdade. Se a esquerda quer me cancelar por atacar quem ataca gays todos os dias, está no direito. Mas eu não vou ficar calado. Nikolas usa religião para esconder o que todo mundo sabe. A hipocrisia dele é maior que a fé.',
      'Vídeo de Janones publicado em agosto de 2025, dobrando a aposta nos ataques homofóbicos contra Nikolas, mesmo após críticas de aliados do PT e de organizações LGBTQ+.',
      'verified', false, '2025-08-12',
      'https://www.poder360.com.br/congresso/janones-dobra-aposta-ataques-nikolas-desculpas/',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'janones-dobra-aposta-nikolas-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 23. Marcal sobre agenda cristã e presidência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal diz que o Brasil precisa de um presidente que governe com a Bíblia na mão.',
      'O Brasil precisa de um presidente que governe com a Bíblia na mão. Não um político tradicional, mas um empresário cristão que entenda de gestão e de Deus. Eu sou esse homem. Vou acabar com a ideologia de gênero, fortalecer a família e colocar Deus de volta no centro da política.',
      'Discurso de Pablo Marçal em mega-evento evangélico em janeiro de 2026, lançando oficiosamente sua pré-candidatura à presidência com pauta religiosa conservadora.',
      'verified', true, '2026-01-18',
      'https://www.folha.uol.com.br/poder/2026/01/marcal-presidente-biblia-governar-evangelico.shtml',
      'news_article',
      'São Paulo', 'Mega-evento evangélico', 'marcal-presidente-biblia-governar-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 24. Marcal ataca diversidade como agenda globalista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal ataca políticas de diversidade como agenda globalista para enfraquecer o Brasil.',
      'Diversidade é agenda globalista. Querem enfraquecer o Brasil dividindo o povo em caixinhas: negro, branco, gay, hétero, homem, mulher. Somos todos brasileiros e cristãos. A verdadeira diversidade é cada um servir a Deus do seu jeito. Não precisamos de cotas, precisamos de mérito.',
      'Vídeo de Marçal publicado em fevereiro de 2026, atacando políticas de diversidade e inclusão como parte de agenda globalista. A declaração foi criticada por movimentos sociais.',
      'verified', false, '2026-02-08',
      'https://g1.globo.com/politica/noticia/2026/02/marcal-diversidade-agenda-globalista.ghtml',
      'news_article',
      'São Paulo', 'Vídeo nas redes sociais', 'marcal-diversidade-agenda-globalista-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 25. Damares sobre liberdade religiosa versus discriminação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares defende que liberdade religiosa não pode ser limitada por leis antidiscriminação.',
      'Liberdade religiosa é um direito fundamental. Nenhuma lei antidiscriminação pode obrigar um pastor a celebrar casamento que contrarie sua fé. A Constituição garante a liberdade de culto e de consciência. Não estamos discriminando ninguém, estamos exercendo nossa fé.',
      'Declaração de Damares em audiência pública no Senado em junho de 2025, ao debater projeto de lei que buscava equilibrar liberdade religiosa e proteção contra discriminação.',
      'verified', true, '2025-06-20',
      'https://www.estadao.com.br/politica/damares-liberdade-religiosa-leis-antidiscriminacao/',
      'news_article',
      'Brasília', 'Audiência pública no Senado', 'damares-liberdade-religiosa-antidiscriminacao-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 26. Feliciano compara Brasil a Sodoma e Gomorra
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano compara Brasil a Sodoma e Gomorra por aprovação de direitos LGBTQ+ e diz que país será castigado.',
      'O Brasil está caminhando para ser Sodoma e Gomorra. Cada lei que aprovam em favor do pecado nos aproxima do castigo divino. Deus não vai tolerar para sempre. As enchentes, as secas, as tragédias são sinais. O Brasil precisa se arrepender antes que seja tarde.',
      'Pregação de Feliciano em culto evangélico em setembro de 2025, usando desastres naturais como argumento contra direitos LGBTQ+. A declaração foi denunciada ao Ministério Público.',
      'verified', false, '2025-09-05',
      'https://www.cnnbrasil.com.br/politica/feliciano-sodoma-gomorra-brasil-direitos-lgbtq/',
      'news_article',
      'Campinas', 'Culto evangélico', 'feliciano-sodoma-gomorra-brasil-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 27. Nikolas sobre Pix — segunda onda de desinformação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas diz que recuo do governo sobre Pix prova que estava certo e que salvou o dinheiro do povo.',
      'O governo recuou porque o povo reagiu. E reagiu porque eu avisei. Meu vídeo sobre o Pix mostrou a verdade que eles queriam esconder. Tentaram me chamar de desinformador, mas quem recuou foi o governo. Eu salvei o dinheiro do trabalhador brasileiro.',
      'Vídeo de Nikolas em janeiro de 2025, comemorando o recuo do governo na norma da Receita Federal sobre Pix e reivindicando vitória pessoal. Agências de checagem apontaram que o vídeo original continha informações falsas.',
      'verified', true, '2025-01-16',
      'https://www.folha.uol.com.br/poder/2025/01/nikolas-recuo-governo-pix-comemora-vitoria.shtml',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-recuo-governo-pix-comemora-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Bia Kicis defende ensino religioso obrigatório nas escolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis defende ensino religioso obrigatório nas escolas públicas como forma de combater violência.',
      'Se colocarmos Deus nas escolas, tiramos a violência. O ensino religioso obrigatório vai formar cidadãos melhores, mais éticos, mais respeitosos. Quem aprendeu os Dez Mandamentos não mata, não rouba, não mente. A solução para a violência está na Bíblia, não em mais governo.',
      'Discurso de Bia Kicis na Câmara em março de 2025, ao apresentar projeto de lei para tornar o ensino religioso obrigatório em escolas públicas.',
      'verified', false, '2025-03-08',
      'https://www.uol.com.br/noticias/politica/2025/03/bia-kicis-ensino-religioso-obrigatorio-escolas.htm',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'bia-kicis-ensino-religioso-obrigatorio-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 29. Michelle sobre papel da mulher cristã na política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle define papel da mulher cristã na política como defensora da família e dos valores bíblicos.',
      'A mulher cristã tem um papel fundamental na política: defender a família. Não somos feministas que querem destruir o homem. Somos guerreiras de Deus que lutam pela vida, pelo casamento bíblico e pela educação dos filhos. A política precisa de mais mulheres como nós.',
      'Discurso de Michelle Bolsonaro em encontro de mulheres evangélicas em abril de 2026, definindo sua visão do papel feminino na política a partir de valores cristãos.',
      'verified', true, '2026-04-05',
      'https://g1.globo.com/politica/noticia/2026/04/michelle-mulher-crista-politica-defensora-familia.ghtml',
      'news_article',
      'Brasília', 'Encontro de mulheres evangélicas', 'michelle-mulher-crista-politica-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 30. Damares ataca educação sexual nas escolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares chama educação sexual nas escolas de erotização infantil e promete combater na CDH.',
      'O que chamam de educação sexual é erotização infantil. Ensinam crianças de 6 anos sobre prazer sexual. Isso é abuso, não educação. Na CDH, vamos convocar o Ministério da Educação para explicar esse material pornográfico distribuído nas escolas.',
      'Declaração de Damares em vídeo publicado em julho de 2025, atacando materiais de educação sexual distribuídos em escolas públicas. Especialistas em educação contestaram as afirmações como distorcidas.',
      'verified', true, '2025-07-15',
      'https://www.poder360.com.br/congresso/damares-educacao-sexual-erotizacao-infantil/',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'damares-educacao-sexual-erotizacao-infantil-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Feliciano sobre valores familiares como base da sociedade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano diz que sociedade desmorona quando abandona valores familiares cristãos.',
      'Toda sociedade que abandonou os valores familiares cristãos desmoronou. Roma caiu, a Grécia caiu, e o Brasil vai cair se continuar nesse caminho. A família formada por homem, mulher e filhos é a base da civilização. Destruam a família e destruirão o Brasil.',
      'Pregação de Feliciano em congresso da família cristã em agosto de 2025, usando exemplos históricos para defender valores familiares tradicionais.',
      'verified', false, '2025-08-20',
      'https://www.estadao.com.br/politica/feliciano-valores-familiares-sociedade-desmorona/',
      'news_article',
      'São Paulo', 'Congresso da família cristã', 'feliciano-valores-familiares-desmorona-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 32. Nikolas ataca trans nos esportes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas ataca participação de pessoas trans em competições esportivas femininas.',
      'Um homem que se diz mulher competindo contra mulheres de verdade é a maior injustiça do esporte. Estão destruindo o esporte feminino em nome de uma ideologia. As mulheres lutaram décadas por igualdade no esporte e agora homens estão roubando suas medalhas.',
      'Vídeo de Nikolas publicado em outubro de 2025, atacando a participação de atletas trans em competições femininas. O vídeo gerou debate sobre inclusão no esporte.',
      'verified', true, '2025-10-08',
      'https://www.cnnbrasil.com.br/politica/nikolas-trans-esportes-femininos-injustica/',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-trans-esportes-femininos-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 33. Damares sobre violência contra mulheres em comunidades religiosas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares reconhece violência contra mulheres em comunidades religiosas e diz que Igreja deve mudar.',
      'É difícil dizer isso, mas existe violência doméstica dentro das igrejas. Pastores que agridem esposas, maridos que usam a Bíblia para justificar violência. A Igreja precisa enfrentar isso. Submissão bíblica não é sinônimo de apanhar calada. Mulher de fé também tem direito de denunciar.',
      'Declaração de Damares em audiência pública sobre violência doméstica na CDH em agosto de 2025, reconhecendo o problema dentro de comunidades religiosas.',
      'verified', true, '2025-08-25',
      'https://www.folha.uol.com.br/poder/2025/08/damares-violencia-mulheres-comunidades-religiosas.shtml',
      'news_article',
      'Brasília', 'Audiência pública na CDH', 'damares-violencia-mulheres-religiosas-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 34. Bia Kicis contra drag queens em bibliotecas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis ataca eventos com drag queens em bibliotecas públicas e os chama de abuso infantil.',
      'Drag queens lendo para crianças em bibliotecas públicas é abuso infantil financiado com dinheiro público. Homens vestidos de mulher de forma grotesca não são exemplo para nossas crianças. Isso é doutrinação sexual. Vou apresentar projeto para proibir essas aberrações em espaços públicos.',
      'Declaração de Bia Kicis em maio de 2025, atacando eventos de leitura com drag queens em bibliotecas públicas do Distrito Federal.',
      'verified', true, '2025-05-15',
      'https://g1.globo.com/df/distrito-federal/noticia/2025/05/bia-kicis-drag-queens-bibliotecas-abuso.ghtml',
      'news_article',
      'Brasília', 'Publicação nas redes sociais', 'bia-kicis-drag-queens-bibliotecas-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 35. Feliciano defende terapia de conversão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano defende direito de pastores oferecerem aconselhamento a quem quer deixar a homossexualidade.',
      'Um pastor tem o direito de aconselhar quem procura ajuda para deixar a homossexualidade. Isso não é terapia de conversão, é liberdade religiosa. Se uma pessoa busca ajuda espiritual, a Igreja tem obrigação de acolher. Proibir isso é perseguição religiosa.',
      'Declaração de Feliciano em entrevista ao portal Gospel+ em julho de 2025, defendendo o direito de líderes religiosos oferecerem aconselhamento sobre orientação sexual.',
      'verified', false, '2025-07-20',
      'https://www.uol.com.br/noticias/politica/2025/07/feliciano-terapia-conversao-liberdade-religiosa.htm',
      'news_article',
      'São Paulo', 'Entrevista a portal evangélico', 'feliciano-terapia-conversao-liberdade-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 36. Nikolas propõe CPI de ONGs LGBTQ+
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas propõe CPI para investigar repasses governamentais a ONGs LGBTQ+ e diz que há desvio.',
      'Estou propondo uma CPI para investigar os bilhões repassados a ONGs LGBTQ+ pelo governo Lula. Esse dinheiro deveria ir para saúde e educação, mas vai para ideologia. Vamos descobrir para onde está indo o dinheiro do contribuinte. O povo tem o direito de saber.',
      'Requerimento de Nikolas na Câmara em novembro de 2025, propondo CPI para investigar repasses do governo federal a organizações de defesa de direitos LGBTQ+.',
      'verified', false, '2025-11-12',
      'https://www.poder360.com.br/congresso/nikolas-cpi-ongs-lgbtq-repasses-governo/',
      'news_article',
      'Brasília', 'Câmara dos Deputados', 'nikolas-cpi-ongs-lgbtq-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 37. Michelle sobre proteção à infância e contra erotização
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro diz que proteção à infância é prioridade e que governo Lula erotiza crianças.',
      'Minha primeira bandeira no Senado será a proteção à infância. O governo Lula está erotizando nossas crianças com material pornográfico nas escolas. Vou apresentar projeto de lei para proibir qualquer conteúdo sexual em escolas para menores de 14 anos. Chega de usar nossos filhos como cobaia ideológica.',
      'Discurso de Michelle em evento pré-eleitoral em abril de 2026, apresentando proteção infantil como bandeira central de sua candidatura ao Senado.',
      'verified', true, '2026-04-10',
      'https://www.folha.uol.com.br/poder/2026/04/michelle-protecao-infancia-erotizacao-governo-lula.shtml',
      'news_article',
      'Brasília', 'Evento pré-eleitoral', 'michelle-protecao-infancia-erotizacao-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 38. Damares propõe aumento de pena para crimes contra idosos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares propõe dobrar penas para crimes contra idosos e vincular ao Estatuto do Idoso.',
      'Quem abusa de idoso tem que pagar caro. Estou propondo dobrar as penas para todos os crimes contra pessoas acima de 60 anos. Nossos idosos construíram este país e merecem proteção máxima do Estado. Quem bater em idoso vai preso por muito mais tempo.',
      'Declaração de Damares ao apresentar projeto de lei no Senado em setembro de 2025, propondo aumento de penas para crimes cometidos contra idosos.',
      'verified', false, '2025-09-10',
      'https://www.estadao.com.br/politica/damares-dobrar-penas-crimes-idosos-estatuto/',
      'news_article',
      'Brasília', 'Senado Federal', 'damares-dobrar-penas-crimes-idosos-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 39. Bolsonaro elogia bancada evangélica como guardiã da moral
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro elogia bancada evangélica como última barreira contra destruição dos valores cristãos.',
      'A bancada evangélica é a última barreira contra a destruição dos valores cristãos no Brasil. Sem os deputados e senadores evangélicos, o PT já teria aprovado aborto, casamento gay e ideologia de gênero nas escolas. Deus levantou esses homens e mulheres para proteger a nação.',
      'Mensagem de Bolsonaro lida por aliado em congresso evangélico em junho de 2025, elogiando a atuação da bancada evangélica no Congresso Nacional.',
      'verified', false, '2025-06-10',
      'https://g1.globo.com/politica/noticia/2025/06/bolsonaro-elogia-bancada-evangelica-guardia-moral.ghtml',
      'news_article',
      'Brasília', 'Congresso evangélico', 'bolsonaro-bancada-evangelica-guardia-moral-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 40. Nikolas sobre liberdade de expressão religiosa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas defende que pregação bíblica contra homossexualidade não pode ser criminalizada.',
      'Quando um pastor prega que homossexualidade é pecado, está exercendo liberdade religiosa. Criminalizar pregação bíblica é crime contra a fé. Se o STF quer prender pastores por pregar a Bíblia, vai ter que prender milhões de cristãos. Estamos prontos para ser presos pela nossa fé.',
      'Discurso de Nikolas em culto evangélico em dezembro de 2025, defendendo o direito de líderes religiosos pregarem contra a homossexualidade sem enfrentar consequências legais.',
      'verified', true, '2025-12-05',
      'https://www.cnnbrasil.com.br/politica/nikolas-pregacao-biblica-homossexualidade-liberdade/',
      'news_article',
      'Belo Horizonte', 'Culto evangélico', 'nikolas-pregacao-biblica-liberdade-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 41. Flávio Dino critica uso da religião para discriminar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino diz que liberdade religiosa não é licença para discriminar e que Constituição protege todos.',
      'Liberdade religiosa é fundamental, mas não é licença para discriminar. A Constituição protege a fé e também protege a dignidade de todos os cidadãos. Ninguém pode usar a Bíblia para justificar violência ou exclusão. O Estado é laico e deve proteger todos igualmente.',
      'Voto do ministro Flávio Dino em novembro de 2025, ao julgar ação sobre limites entre liberdade religiosa e direitos antidiscriminação.',
      'verified', true, '2025-11-20',
      'https://www.folha.uol.com.br/poder/2025/11/dino-liberdade-religiosa-nao-licenca-discriminar.shtml',
      'news_article',
      'Brasília', 'Sessão do STF', 'dino-liberdade-religiosa-discriminar-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 42. Damares sobre proteção de crianças em igrejas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares propõe protocolo de proteção infantil obrigatório em todas as instituições religiosas.',
      'Toda igreja, templo e centro espiritual deve ter protocolo de proteção infantil. Infelizmente, casos de abuso contra crianças acontecem também em ambientes religiosos. Vamos criar uma lei que obrigue todas as instituições religiosas a implementar protocolos e a denunciar casos suspeitos.',
      'Declaração de Damares em outubro de 2025, ao apresentar projeto de lei para proteção infantil em instituições religiosas.',
      'verified', false, '2025-10-15',
      'https://g1.globo.com/politica/noticia/2025/10/damares-protocolo-protecao-infantil-igrejas.ghtml',
      'news_article',
      'Brasília', 'Senado Federal', 'damares-protocolo-protecao-infantil-igrejas-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 43. Marcal sobre mentalidade de prosperidade e política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal mistura teologia da prosperidade com discurso político e promete Brasil abençoado por Deus.',
      'O Brasil vai ser próspero porque Deus prometeu. Mas prosperidade não vem sem trabalho duro e fé. O governo Lula quer um povo dependente do Bolsa Família. Eu quero um povo empreendedor, próspero e temente a Deus. A pobreza é mentalidade, não destino.',
      'Discurso de Marçal em evento empresarial cristão em março de 2026, misturando teologia da prosperidade com propostas políticas. Líderes religiosos tradicionais criticaram a abordagem.',
      'verified', false, '2026-03-20',
      'https://www.uol.com.br/noticias/politica/2026/03/marcal-prosperidade-deus-politica-empreendedor.htm',
      'news_article',
      'São Paulo', 'Evento empresarial cristão', 'marcal-prosperidade-deus-politica-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Guilherme Boulos critica uso da religião como arma política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos critica bancada evangélica por usar religião como arma política contra direitos humanos.',
      'A bancada evangélica usa a religião como arma política para negar direitos a milhões de brasileiros. Jesus Cristo pregava amor ao próximo, não ódio. Os mesmos que citam a Bíblia para atacar LGBTQ+ ignoram os ensinamentos sobre justiça social e acolhimento aos pobres.',
      'Discurso de Guilherme Boulos em evento da esquerda cristã em setembro de 2025, criticando o uso político da religião pela bancada evangélica conservadora.',
      'verified', false, '2025-09-15',
      'https://www.poder360.com.br/congresso/boulos-religiao-arma-politica-direitos-humanos/',
      'news_article',
      'São Paulo', 'Evento da esquerda cristã', 'boulos-religiao-arma-politica-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 45. Bia Kicis defende criminalização da blasfêmia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis propõe criminalização da blasfêmia para proteger sentimentos religiosos dos cristãos.',
      'Precisamos criminalizar a blasfêmia no Brasil. Artistas querem chocar desrespeitando símbolos cristãos e chamam isso de arte. Uma exposição que zomba de Jesus não é arte, é crime contra milhões de fiéis. Vou apresentar projeto para proteger os sentimentos religiosos do povo brasileiro.',
      'Declaração de Bia Kicis em dezembro de 2025, ao propor projeto de criminalização da blasfêmia após polêmica com exposição de arte contemporânea em Brasília.',
      'verified', false, '2025-12-15',
      'https://www.estadao.com.br/politica/bia-kicis-criminalizacao-blasfemia-protecao-religiosa/',
      'news_article',
      'Brasília', 'Câmara dos Deputados', 'bia-kicis-criminalizacao-blasfemia-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 46. Feliciano sobre eleições 2026 e voto evangélico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano diz que voto evangélico vai definir eleição de 2026 e que igreja deve orientar fiéis.',
      'O voto evangélico vai definir as eleições de 2026. Somos 70 milhões de cristãos evangélicos. Se votarmos unidos, elegemos quem quisermos. As igrejas têm a obrigação de orientar os fiéis a votar em candidatos que defendam valores cristãos. Não é pecado fazer política do púlpito.',
      'Pregação de Feliciano em janeiro de 2026, convocando líderes evangélicos a orientar fiéis nas eleições de 2026.',
      'verified', true, '2026-01-25',
      'https://www.cnnbrasil.com.br/politica/feliciano-voto-evangelico-eleicao-2026-orienta-fieis/',
      'news_article',
      'São Paulo', 'Culto evangélico', 'feliciano-voto-evangelico-eleicao-2026-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 47. Damares sobre CPMI — bancada evangélica racha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares reconhece racha na bancada evangélica por causa da CPMI do INSS e pede união.',
      'A CPMI do INSS causou um racha na bancada evangélica que precisamos superar. Alguns colegas me acusam de traidora, mas traidor é quem protege ladrão. Peço união em torno do que nos une: a defesa da vida, da família e da liberdade religiosa. Não vamos deixar que fraudadores nos dividam.',
      'Declaração de Damares em reunião da bancada evangélica em maio de 2025, tentando conciliar após a polêmica da divulgação de igrejas investigadas.',
      'verified', true, '2025-05-05',
      'https://www.folha.uol.com.br/poder/2025/05/damares-racha-bancada-evangelica-cpmi-inss-uniao.shtml',
      'news_article',
      'Brasília', 'Reunião da bancada evangélica', 'damares-racha-bancada-evangelica-cpmi-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 48. Nikolas diz que esquerda usa minorias como escudo político
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas acusa esquerda de usar minorias como escudo político e de não se importar com pessoas reais.',
      'A esquerda usa minorias como escudo político. Não se importam com gays, trans ou negros de verdade. Usam essas pessoas para ganhar votos e depois as abandonam. A verdadeira ajuda vem do trabalho, da fé e da família, não de cotas e programas assistencialistas.',
      'Vídeo de Nikolas publicado em fevereiro de 2026, acusando a esquerda de instrumentalizar minorias para fins políticos.',
      'verified', false, '2026-02-15',
      'https://g1.globo.com/politica/noticia/2026/02/nikolas-esquerda-minorias-escudo-politico.ghtml',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-esquerda-minorias-escudo-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 49. Eduardo Bolsonaro sobre valores cristãos nos EUA e no Brasil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro compara respeito aos valores cristãos nos EUA com perseguição no Brasil.',
      'Nos Estados Unidos, valores cristãos são respeitados. Aqui posso dizer que sou cristão sem ser processado. No Brasil, se você cita a Bíblia te chamam de fascista. Trump colocou Deus de volta na Casa Branca. O próximo presidente do Brasil precisa colocar Deus de volta no Planalto.',
      'Vídeo de Eduardo Bolsonaro publicado dos Estados Unidos em abril de 2026, comparando o tratamento dado a cristãos nos dois países.',
      'verified', false, '2026-04-08',
      'https://www.uol.com.br/noticias/politica/2026/04/eduardo-valores-cristaos-eua-brasil-perseguicao.htm',
      'news_article',
      'Miami', 'Vídeo nas redes sociais', 'eduardo-valores-cristaos-eua-brasil-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 50. Lula responde a ataques da bancada evangélica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que respeita todas as religiões mas que Estado é laico e não pode governar pela Bíblia.',
      'Respeito todas as religiões. Sou cristão e tenho fé. Mas o Estado brasileiro é laico. Não podemos governar pela Bíblia, pelo Corão ou por nenhum livro sagrado. Governamos pela Constituição. Quem quer teocracia que vá para o Irã. O Brasil é uma democracia.',
      'Declaração de Lula em entrevista coletiva em outubro de 2025, respondendo a ataques da bancada evangélica que o acusavam de perseguição religiosa.',
      'verified', true, '2025-10-25',
      'https://www.poder360.com.br/governo/lula-estado-laico-nao-governar-biblia-bancada-evangelica/',
      'news_article',
      'Brasília', 'Entrevista coletiva no Planalto', 'lula-estado-laico-nao-governar-biblia-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

END $$;
