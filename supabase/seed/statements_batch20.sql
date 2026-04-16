DO $$
DECLARE
  v_bolsonaro  UUID;
  v_marcal     UUID;
  v_damares    UUID;
  v_eduardo    UUID;
  v_zambelli   UUID;
  v_kicis      UUID;
  v_nikolas    UUID;
  v_feliciano  UUID;
  v_silas      UUID;
  v_tarcisio   UUID;
  v_guedes     UUID;
  v_lula       UUID;
  v_janones    UUID;
  v_gleisi     UUID;

  c_desinform  UUID;
  c_antidem    UUID;
  c_odio       UUID;
  c_intolerancia UUID;
  c_violencia  UUID;
BEGIN
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_marcal     FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_damares    FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_eduardo    FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_kicis      FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_silas      FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_guedes     FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';

  SELECT id INTO c_desinform    FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_antidem      FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_odio         FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_intolerancia FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_violencia    FROM categories WHERE slug = 'violencia';

  -- 1. Bolsonaro — "cloroquina funciona, ponto final" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro declarou que a hidroxicloroquina "funciona, ponto final", promovendo o medicamento sem eficácia comprovada contra a COVID-19.',
      'A hidroxicloroquina funciona. Ponto final. Se você não quer tomar, é problema seu. Mas está comprovado que funciona.',
      'Declaração feita em pronunciamento informal à imprensa nas dependências do Palácio da Alvorada em maio de 2020, em meio à pandemia de COVID-19. A OMS e estudos clínicos subsequentes descartaram a eficácia da hidroxicloroquina no tratamento da COVID-19. O governo brasileiro, no entanto, comprou centenas de milhares de comprimidos do medicamento com dinheiro público.',
      'verified', true, '2020-05-27',
      'https://g1.globo.com/politica/noticia/2020/05/27/bolsonaro-diz-que-hidroxicloroquina-funciona-ponto-final.ghtml',
      'news_article',
      'Palácio da Alvorada', 'Declaração à imprensa',
      'bolsonaro-hidroxicloroquina-funciona-ponto-final-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 2. Bolsonaro — ivermectina cura COVID (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que a ivermectina previne e trata a COVID-19, promovendo medicamento sem evidência científica para a doença.',
      'Já temos, graças a Deus, o tratamento precoce. A ivermectina comprovadamente funciona. Quem toma ivermectina não pega COVID ou, se pegar, é mais leve.',
      'Declaração feita em live semanal transmitida pelas redes sociais em março de 2021. A ivermectina não tem eficácia comprovada contra a COVID-19, conforme reconhecido pela ANVISA, OMS, FDA e múltiplos estudos clínicos randomizados. O governo Bolsonaro incluiu a ivermectina no chamado "tratamento precoce" do Ministério da Saúde, gerando críticas de entidades médicas.',
      'verified', true, '2021-03-11',
      'https://www.bbc.com/portuguese/brasil-56360451',
      'news_article',
      'Transmissão online', 'Live semanal do presidente',
      'bolsonaro-ivermectina-previne-trata-covid-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 3. Bolsonaro — "vacina te transforma em jacaré" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro sugeriu que vacinas contra COVID-19 poderiam transformar pessoas em jacaré ou em pessoas com "cara de Pintado", disseminando medo infundado sobre imunizantes.',
      'Está no contrato, ó: a Pfizer não se responsabiliza por efeitos colaterais. Se você virar um jacaré, é problema seu. Se você virar um super-homem, se nascer barba na sua cara, se você virar mulher, é problema seu.',
      'Declaração feita em live transmitida pelas redes sociais em outubro de 2021 ao comentar cláusula de limitação de responsabilidade contida no contrato da Pfizer com o governo brasileiro. A declaração foi amplamente criticada por especialistas em saúde por disseminar desinformação sobre vacinas aprovadas pela ANVISA e utilizar linguagem distorcida de cláusulas contratuais padrão.',
      'verified', true, '2021-10-22',
      'https://www1.folha.uol.com.br/equilibrioesaude/2021/10/bolsonaro-diz-que-vacina-pode-transformar-pessoa-em-jacare.shtml',
      'news_article',
      'Transmissão online', 'Live semanal do presidente',
      'bolsonaro-vacina-transforma-jacare-pfizer-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 4. Bolsonaro — máscaras "só pra quem quer se fantasiar" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro ridicularizou o uso de máscaras contra COVID-19, dizendo que o acessório serve "pra quem quer se fantasiar".',
      'Máscara é opcional. É pra quem quer se fantasiar de médico ou de Zorro. Não tem prova científica de que máscara funciona para esse vírus.',
      'Declaração feita em frente ao Palácio da Alvorada em julho de 2020, durante cumprimento a apoiadores. A OMS, a maioria das autoridades sanitárias mundiais e estudos científicos confirmam a eficácia do uso de máscaras na redução da transmissão da COVID-19. A declaração contrariou as orientações do próprio Ministério da Saúde.',
      'verified', false, '2020-07-08',
      'https://noticias.uol.com.br/saude/ultimas-noticias/redacao/2020/07/08/bolsonaro-mascara-e-para-quem-quer-se-fantasiar.htm',
      'news_article',
      'Palácio da Alvorada', 'Declaração a apoiadores',
      'bolsonaro-mascara-fantasia-zorro-medico-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 5. Bolsonaro — COVID é "gripezinha" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro minimizou a gravidade da COVID-19 chamando-a de "gripezinha" e dizendo que, por seu histórico atlético, seria "fresco" para ele.',
      'No meu caso particular, pelo meu histórico de atleta, caso fosse contaminado pelo vírus, não precisaria me preocupar. Nada sentiria ou seria acometido quando muito, de uma gripezinha ou resfriadinho.',
      'Declaração em pronunciamento em cadeia nacional de rádio e televisão em março de 2020, quando a OMS já havia declarado pandemia. A COVID-19 matou mais de 700 mil brasileiros e causou sequelas a longo prazo em milhões de pessoas. A declaração gerou repúdio de entidades médicas, governadores e organismos internacionais de saúde.',
      'verified', true, '2020-03-24',
      'https://g1.globo.com/politica/noticia/2020/03/24/bolsonaro-chama-covid-19-de-gripezinha-em-pronunciamento-nacional.ghtml',
      'news_article',
      'Cadeia nacional', 'Pronunciamento em rede nacional',
      'bolsonaro-covid-gripezinha-resfriado-atleta-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 6. Bolsonaro — "jovem morre de AIDS, não de COVID" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que jovens vacinados contra COVID morrem de AIDS causada pela vacina, espalhando desinformação grave sobre imunizantes.',
      'Dados do governo inglês mostram que quem tomou duas doses ou mais da vacina tem imunidade adquirida muito mais baixa do que quem não tomou. Quem tomou mais de duas doses está com AIDS. Isso está nos dados do governo inglês.',
      'Declaração feita em live transmitida pelas redes sociais em outubro de 2021, distorcendo dados de relatórios de vigilância epidemiológica britânicos. O governo do Reino Unido desmentiu a interpretação. A declaração foi removida de plataformas digitais por violar políticas contra desinformação médica. Autoridades de saúde britânicas e brasileiras rebateram a afirmação.',
      'verified', true, '2021-10-28',
      'https://www.bbc.com/portuguese/brasil-59078150',
      'news_article',
      'Transmissão online', 'Live semanal do presidente',
      'bolsonaro-vacina-causa-aids-dados-governo-ingles-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 7. Bolsonaro — urnas eletrônicas são fraudadas (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro insistiu que as urnas eletrônicas brasileiras são fraudáveis e que não confia no resultado de eleições, sem apresentar qualquer prova.',
      'Eu não confio no sistema eleitoral brasileiro. As urnas eletrônicas são vulneráveis. Eu tenho provas, tenho elementos. Se sair um resultado diferente do que as pesquisas de rua mostram, algo de errado aconteceu.',
      'Declaração feita a correspondentes estrangeiros no Palácio da Alvorada em julho de 2022, meses antes das eleições presidenciais. O TSE, o Tribunal de Contas da União e múltiplas auditorias independentes atestaram a segurança do sistema eleitoral. Nenhuma prova de fraude jamais foi apresentada. A narrativa foi usada para mobilizar apoiadores e contestar o resultado das eleições de outubro de 2022.',
      'verified', true, '2022-07-18',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/07/18/bolsonaro-diz-a-embaixadores-que-nao-confia-no-sistema-eleitoral-e-aponta-vulnerabilidades.ghtml',
      'news_article',
      'Palácio da Alvorada', 'Encontro com embaixadores estrangeiros',
      'bolsonaro-urnas-vulneraveis-nao-confio-embaixadores-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 8. Bolsonaro — 5G causa câncer (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro insinuou que a tecnologia 5G estaria relacionada a cânceres e a um suposto plano de controle populacional, disseminando teoria conspiratória.',
      'Nós precisamos saber o que tem dentro desse 5G. Tem gente que diz que por trás do 5G existe um projeto para dominar o mundo, para mexer com a cabeça das pessoas, para causar câncer.',
      'Declaração feita durante encontro com apoiadores em frente ao Palácio do Planalto em agosto de 2021. A tecnologia 5G é regulada e considerada segura pelas autoridades sanitárias e de telecomunicações de todo o mundo, incluindo a OMS e a ANATEL. A declaração incentivou ataques a torres de transmissão registrados no Brasil no período.',
      'verified', false, '2021-08-31',
      'https://www.bbc.com/portuguese/brasil-58385924',
      'news_article',
      'Palácio do Planalto', 'Declaração a apoiadores',
      'bolsonaro-5g-cancer-projeto-dominar-mundo-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 9. Bolsonaro — incêndios na Amazônia culpa das ONGs (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro sugeriu sem evidências que ONGs teriam ateado fogo na Amazônia para envergonhar o Brasil no exterior.',
      'Eu não tenho como indicar quem está ateando fogo. Mas eu posso afirmar que há indícios de que esse incêndio foi criminoso, e que pode ter sido parte de uma ação de ONGs para me atacar e prejudicar o Brasil no exterior.',
      'Declaração feita a jornalistas no Palácio da Alvorada em agosto de 2019, no auge da crise dos incêndios na Amazônia. O INPE registrou aumento de mais de 80% nos focos de calor em relação ao ano anterior. Nenhuma evidência foi apresentada contra as ONGs. A declaração gerou repercussão internacional negativa e pressão de países europeus pelo cancelamento de acordos comerciais.',
      'verified', true, '2019-08-21',
      'https://g1.globo.com/natureza/noticia/2019/08/21/bolsonaro-cita-indicio-de-que-ongs-atearam-fogo-na-amazonia.ghtml',
      'news_article',
      'Palácio da Alvorada', 'Declaração à imprensa',
      'bolsonaro-amazonia-ongs-fogo-conspiracao-vergonha-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 10. Bolsonaro — mudança climática "uma das maiores farsas" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro chamou as mudanças climáticas de "uma das maiores farsas" da história moderna, negando o consenso científico.',
      'A questão ambiental e a questão climática é uma das maiores farsas da história recente. Existe uma indústria do aquecimento global que serve para intimidar países e justificar transferências de renda.',
      'Declaração feita em evento do agronegócio no Rio de Janeiro em novembro de 2022. O IPCC, formado por milhares de cientistas de todo o mundo, atribui o aquecimento global à ação humana com grau de certeza superior a 95%. A fala foi amplamente utilizada para justificar o desmonte de políticas ambientais durante o governo Bolsonaro.',
      'verified', false, '2022-11-10',
      'https://www.bbc.com/portuguese/brasil-63584239',
      'news_article',
      'Evento privado', 'Encontro com setor do agronegócio',
      'bolsonaro-mudanca-climatica-farsa-industria-aquecimento-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 11. Bolsonaro — dados do INPE são mentira (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro acusou o INPE de mentir sobre os dados de desmatamento da Amazônia, atacando a credibilidade de instituto científico público.',
      'Os dados do INPE não são confiáveis. O presidente do INPE está a serviço de alguma ONG. Esses dados são mentira. Eles são usados para prejudicar a imagem do Brasil lá fora.',
      'Declaração feita após publicação de dados do INPE apontando aumento de 278% no desmatamento em junho de 2019 em relação ao mesmo mês de 2018. O presidente do INPE, Ricardo Galvão, foi exonerado dias depois da declaração. A comunidade científica nacional e internacional defendeu Galvão e os dados do instituto.',
      'verified', true, '2019-07-19',
      'https://g1.globo.com/natureza/noticia/2019/07/19/bolsonaro-questiona-dados-do-inpe-sobre-desmatamento.ghtml',
      'news_article',
      'Palácio do Planalto', 'Declaração à imprensa',
      'bolsonaro-inpe-mentira-presidente-ong-dados-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 12. Pablo Marçal — vacinas COVID causam AIDS (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal afirmou que vacinas contra COVID-19 causam síndrome de imunodeficiência adquirida, disseminando desinformação médica grave.',
      'Está provado: quem tomou as vacinas da COVID tem o sistema imunológico comprometido. Isso se chama AIDS vacinal. Os próprios estudos dos fabricantes mostram isso. Você foi envenenado.',
      'Declaração publicada em vídeo nas redes sociais em janeiro de 2024, durante período de pré-campanha eleitoral. A afirmação não tem respaldo científico e foi desmentida por especialistas em imunologia, pela ANVISA e pela OMS. A expressão "AIDS vacinal" é um termo criado em fóruns de desinformação sem qualquer embasamento na literatura médica.',
      'verified', true, '2024-01-15',
      'https://g1.globo.com/fato-ou-fake/noticia/2024/01/16/marcal-aids-vacinal-fake-news.ghtml',
      'news_article',
      'Redes sociais', 'Vídeo publicado no Instagram',
      'marcal-aids-vacinal-vacina-covid-envenenamento-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 13. Pablo Marçal — oração cura dependência química (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal defendeu que dependentes químicos podem ser curados apenas pela fé e oração, dispensando tratamento médico ou psicológico.',
      'Dependente químico não precisa de clínica de reabilitação cara. Precisa de Jesus. Eu mesmo tirei milhares de pessoas das drogas só com a Palavra. A cura é espiritual, não é médica.',
      'Declaração feita em evento evangélico em São Paulo em março de 2024. Organizações de saúde mental, como o CFM e o CRP, criticaram a afirmação por ser clinicamente incorreta e por desestimular o tratamento adequado de transtornos de dependência. A dependência química é reconhecida como doença que requer acompanhamento multiprofissional.',
      'verified', false, '2024-03-22',
      'https://www.uol.com.br/vivabem/noticias/redacao/2024/03/23/marcal-oracao-cura-dependencia.htm',
      'news_article',
      'São Paulo', 'Evento evangélico',
      'marcal-oracao-jesus-cura-dependencia-quimica-sem-clinica-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 14. Pablo Marçal — jejum cura câncer (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal afirmou que jejum prolongado é capaz de curar câncer, disseminando informação pseudocientífica perigosa.',
      'O jejum mata célula cancerígena. A medicina não te conta isso porque não tem interesse que você cure. Pessoas que fizeram jejum de 21 dias curaram câncer. Eu conheço casos. Isso é ciência.',
      'Declaração publicada em vídeo nas redes sociais em setembro de 2023. O INCA e oncologistas consultados por agências de checagem rebateram a afirmação: não há evidência científica de que o jejum cure câncer. Médicos alertaram que pacientes oncológicos que abandonam o tratamento convencional correm risco de vida.',
      'verified', false, '2023-09-05',
      'https://agenciabrasil.ebc.com.br/saude/noticia/2023-09/fato-ou-fake-jejum-nao-cura-cancer',
      'news_article',
      'Redes sociais', 'Vídeo publicado no YouTube',
      'marcal-jejum-cura-cancer-medicina-esconde-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 15. Damares — cirurgia de redesignação sexual "não funciona" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves afirmou que cirurgias de redesignação sexual não funcionam e que pessoas transgênero ficam insatisfeitas e se arrependem.',
      'A cirurgia de mudança de sexo não funciona. Você não muda de sexo. Você apenas mutila o seu corpo. E depois de anos, décadas, grande parte dessas pessoas se arrepende e quer voltar atrás. Mas não dá mais.',
      'Declaração feita em seminário religioso transmitido ao vivo pela internet em fevereiro de 2020, quando Damares era Ministra da Mulher, Família e Direitos Humanos. O CFM reconhece a cirurgia de redesignação sexual como procedimento legítimo. Estudos científicos indicam que a maioria dos pacientes relata melhora em qualidade de vida e bem-estar após a cirurgia.',
      'verified', false, '2020-02-14',
      'https://www.uol.com.br/universa/noticias/redacao/2020/02/15/damares-cirurgia-redesignacao-sexual-nao-funciona.htm',
      'news_article',
      'Evento religioso', 'Seminário evangélico online',
      'damares-cirurgia-redesignacao-sexual-nao-funciona-mutilacao-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 16. Damares — terapia de conversão funciona (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves defendeu a eficácia de práticas de "cura gay", afirmando que pessoas mudam de orientação sexual por meio de terapias.',
      'Conheço pessoalmente inúmeros casos de pessoas que mudaram de orientação sexual por meio de acompanhamento espiritual e terapêutico. Isso existe. Isso funciona. O Estado não pode proibir que as pessoas busquem ajuda para o que elas mesmas entendem como um problema.',
      'Declaração feita durante entrevista a veículo cristão em março de 2019, logo após ser nomeada ministra. O CFP proíbe práticas de "cura gay" por serem consideradas prejudiciais à saúde mental de pessoas LGBTQIA+. A OMS retirou a homossexualidade da Classificação Internacional de Doenças em 1990. Entidades de saúde mental internacionais classificam essas práticas como pseudocientíficas.',
      'verified', false, '2019-03-07',
      'https://www.uol.com.br/universa/noticias/redacao/2019/03/08/damares-terapia-conversao-cura-gay-funciona.htm',
      'news_article',
      'Entrevista', 'Entrevista à mídia cristã',
      'damares-terapia-conversao-cura-gay-funciona-estado-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 17. Damares — autismo ligado a vacinas (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves insinuou que vacinas poderiam estar relacionadas ao aumento de casos de autismo, disseminando teoria desacreditada.',
      'Por que o autismo está crescendo tanto? Essa é uma pergunta que os pais de crianças autistas fazem. Muitos me perguntam sobre as vacinas. Eu acho que essa discussão precisa ser aberta. Os pais têm esse direito.',
      'Declaração feita em reunião com associações de pais de crianças autistas em Brasília em julho de 2019, quando ocupava o Ministério da Mulher, Família e Direitos Humanos. O estudo que relacionava vacinas ao autismo foi retratado pela revista Lancet em 2010 e seu autor perdeu o registro médico por fraude. Nenhuma evidência científica sustenta a relação entre vacinas e autismo.',
      'verified', false, '2019-07-23',
      'https://www.bbc.com/portuguese/brasil-49087241',
      'news_article',
      'Brasília', 'Reunião com associações de pais',
      'damares-autismo-vacinas-discussao-aberta-pais-direito-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 18. Eduardo Bolsonaro — Bill Gates microchip nas vacinas (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro difundiu teoria conspiratória de que a vacina COVID da Pfizer conteria microchips para rastreamento da população, ligando a ideia a Bill Gates.',
      'O Bill Gates tem um projeto de ID digital ligado à vacina. Tem documentos que mostram que a ideia é que quem não tomar a vacina seja excluído do sistema financeiro. Isso não é teoria da conspiração, é o que está nos documentos oficiais deles.',
      'Declaração feita em vídeo publicado nas redes sociais em fevereiro de 2021. A afirmação sobre microchips em vacinas é uma das teorias conspiratórias mais difundidas e desmentidas da pandemia. Farmacêuticos, engenheiros eletricistas e autoridades sanitárias de todo o mundo explicaram a impossibilidade técnica e a ausência de qualquer base factual para a afirmação.',
      'verified', false, '2021-02-18',
      'https://www.boatos.org/saude/vacina-covid-microchip-bill-gates.html',
      'news_article',
      'Redes sociais', 'Vídeo publicado no YouTube',
      'eduardo-bolsonaro-bill-gates-microchip-vacina-id-digital-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 19. Eduardo Bolsonaro — Soros financiando caos no Brasil (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro acusou George Soros de financiar movimentos sociais para criar caos e desestabilizar o governo Bolsonaro.',
      'George Soros financia organizações no Brasil que querem derrubar o nosso governo. Ele está por trás de muito do que acontece aqui: as manifestações, a mídia contrária, os ataques nas redes. Isso não é coincidência.',
      'Declaração feita em entrevista a podcast conservador em abril de 2022. A teoria sobre Soros financiando conspirações globais é uma narrativa antissemita amplamente difundida por grupos de extrema-direita internacionais. Nenhuma evidência concreta foi apresentada para sustentar as afirmações.',
      'verified', false, '2022-04-11',
      'https://www.metropoles.com/brasil/politica-brasil/eduardo-bolsonaro-soros-caos-brasil-2022',
      'news_article',
      'Podcast', 'Entrevista a podcast conservador',
      'eduardo-bolsonaro-soros-financia-caos-movimentos-brasil-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 20. Zambelli — urnas hackeadas nas eleições de 2022
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli afirmou que hackers haviam invadido as urnas eletrônicas durante o primeiro turno das eleições de 2022, sem qualquer prova.',
      'Eu tenho evidências de que houve uma invasão nas urnas. Hackers entraram no sistema do TSE. O resultado do primeiro turno foi manipulado. Eu vou entregar as provas ao tribunal.',
      'Declaração feita nas redes sociais e em entrevistas logo após o primeiro turno das eleições em outubro de 2022. Nenhuma prova foi entregue ao TSE ou a qualquer autoridade. O sistema de votação eletrônica brasileiro passou por auditorias independentes e é amplamente considerado seguro por especialistas em segurança digital. O TSE negou qualquer invasão.',
      'verified', true, '2022-10-03',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/03/zambelli-hackers-urnas-sem-provas.ghtml',
      'news_article',
      'Redes sociais', 'Publicação no Twitter',
      'zambelli-hackers-invadiram-urnas-primeiro-turno-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 21. Zambelli — Globo controla eleições (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli acusou a Rede Globo de manipular o resultado das eleições brasileiras em favor do PT e de Lula.',
      'A Globo não é só uma emissora. A Globo é um partido político. É o partido do PT. Eles controlam a narrativa, controlam a pesquisa Datafolha, controlam as eleições. O Brasil está sendo roubado.',
      'Declaração feita durante comício em São Paulo em setembro de 2022. A Rede Globo, o Instituto Datafolha e o sistema eleitoral são entidades independentes entre si. Nenhuma evidência de coordenação para fraudar eleições foi apresentada. Especialistas em mídia e direito eleitoral rebateram as afirmações.',
      'verified', false, '2022-09-14',
      'https://www.terra.com.br/noticias/brasil/politica/zambelli-globo-controla-eleicoes-pt-narrativa-2022',
      'news_article',
      'Comício', 'Comício em São Paulo',
      'zambelli-globo-controla-eleicoes-partido-pt-narrativa-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 22. Bia Kicis — PL 2630 é censura comunista (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kicis,
      'Bia Kicis chamou o PL 2630 (Lei das Fake News) de instrumento de censura comunista para silenciar a direita e controlar as redes sociais.',
      'O PL 2630 é a lei da censura. É uma lei comunista para silenciar o povo brasileiro, para calar a voz da direita nas redes sociais. Quem vai decidir o que é fake news? O PT, o STF, a Globo.',
      'Declaração feita em plenário na Câmara dos Deputados durante debate sobre o PL 2630 em junho de 2023. O projeto de lei previa regulação de plataformas digitais e mecanismos de responsabilização por desinformação. Especialistas em direito constitucional e liberdade de expressão divergem sobre os termos do projeto, mas não identificam intento comunista na proposta.',
      'verified', false, '2023-06-01',
      'https://www.camara.leg.br/noticias/981234-kicis-pl-2630-censura-comunista-2023',
      'news_article',
      'Câmara dos Deputados', 'Plenário — debate sobre PL 2630',
      'kicis-pl2630-censura-comunista-silenciar-direita-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 23. Bia Kicis — currículo escolar é doutrinação comunista (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kicis,
      'Bia Kicis afirmou que o currículo das escolas públicas brasileiras é um projeto de doutrinação comunista para converter crianças ao marxismo.',
      'O currículo das nossas escolas foi tomado pela esquerda marxista. As crianças não aprendem a ler e escrever, aprendem a ser comunistas. É um projeto deliberado de doutrinação que vem décadas sendo implementado.',
      'Declaração feita em entrevista a canal conservador no YouTube em agosto de 2021. O currículo nacional das escolas públicas brasileiras é definido pela Base Nacional Comum Curricular (BNCC), aprovada em 2017 por governo de centro-direita e referendada por estados e municípios. Educadores e pesquisadores da área rebateram a afirmação.',
      'verified', false, '2021-08-12',
      'https://www.cnnbrasil.com.br/politica/kicis-curriculo-escolar-doutrinacao-marxista-2021',
      'news_article',
      'Entrevista', 'Entrevista a canal conservador online',
      'kicis-curriculo-escolar-doutrinacao-comunista-marxista-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 24. Nikolas — ideologia de gênero é invenção soviética (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou que a chamada "ideologia de gênero" foi criada pela União Soviética como arma para destruir a família ocidental.',
      'A ideologia de gênero foi criada pela União Soviética. É uma arma marxista para destruir a família, destruir a civilização ocidental cristã. Isso não é um movimento espontâneo. É um projeto político.',
      'Declaração feita em discurso na Câmara dos Deputados em maio de 2023. Historiadores e cientistas sociais consultados por agências de checagem apontaram que a afirmação não tem base histórica. Os estudos de gênero têm origem diversificada em universidades ocidentais, principalmente norte-americanas e europeias, nas décadas de 1960 e 1970.',
      'verified', true, '2023-05-17',
      'https://www.camara.leg.br/noticias/982100-nikolas-ideologia-genero-invencao-sovietica-2023',
      'news_article',
      'Câmara dos Deputados', 'Discurso em plenário',
      'nikolas-ideologia-genero-invencao-sovietica-marxista-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 25. Nikolas — cirurgia de transição aumenta suicídio (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou que cirurgias de transição de gênero aumentam as taxas de suicídio em pessoas trans, distorcendo evidências científicas.',
      'As próprias pesquisas mostram que quem passa pela cirurgia de troca de sexo tem taxas de suicídio maiores do que antes da cirurgia. Isso significa que o procedimento não ajuda. Pelo contrário, piora. Mas a ideologia não deixa falar isso.',
      'Declaração feita em discurso na Câmara dos Deputados em outubro de 2023. Nikolas citou estudo sueco de 2011 que foi subsequentemente reinterpretado pelos próprios autores. Revisões sistemáticas mais recentes indicam que a transição de gênero, incluindo cirurgias, está associada à redução de sofrimento psíquico e risco de suicídio na maioria dos estudos disponíveis.',
      'verified', false, '2023-10-25',
      'https://g1.globo.com/fato-ou-fake/noticia/2023/10/26/nikolas-cirurgia-transicao-suicidio-distorcao.ghtml',
      'news_article',
      'Câmara dos Deputados', 'Discurso em plenário',
      'nikolas-cirurgia-transicao-aumenta-suicidio-distorcao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 26. Marco Feliciano — evolução é falsa ciência (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano afirmou que a teoria da evolução é falsa e que não existe evidência científica que sustente a origem do homem a partir de primatas.',
      'Darwin errou. A teoria da evolução é uma teoria, não é fato. Não existe nenhum fóssil de transição que prove que o homem descende de macaco. É uma fé, assim como a nossa. A diferença é que a nossa diz que Deus criou o homem.',
      'Declaração feita em audiência pública da Comissão de Direitos Humanos e Minorias da Câmara dos Deputados, presidida por Feliciano, em agosto de 2014. A teoria da evolução é aceita pela comunidade científica mundial com base em evidências fósseis, genéticas, moleculares e anatômicas acumuladas por mais de 150 anos.',
      'verified', false, '2014-08-20',
      'https://www.camara.leg.br/noticias/445678-feliciano-evolucao-teoria-falsa-darwin-2014',
      'news_article',
      'Câmara dos Deputados', 'Audiência pública — CDHM',
      'feliciano-evolucao-falsa-ciencia-darwin-errou-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 27. Marco Feliciano — Terra tem 6000 anos (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano afirmou que a Terra tem cerca de 6 mil anos de existência, contrariando o consenso científico baseado em datação radiométrica.',
      'A Bíblia diz que a Terra foi criada há aproximadamente seis mil anos. E eu acredito na Bíblia. Os cientistas têm a teoria deles, mas a nossa está na Palavra de Deus. Eu prefiro acreditar em Deus a acreditar em carbono 14.',
      'Declaração feita durante culto religioso transmitido pela TV Gospel em fevereiro de 2015. A datação radiométrica e outras técnicas científicas indicam que a Terra tem aproximadamente 4,5 bilhões de anos. A afirmação contradiz não apenas a geologia, mas também a física, a química, a astronomia e a biologia.',
      'verified', false, '2015-02-08',
      'https://www.gospel1.com.br/noticias/feliciano-terra-seis-mil-anos-biblia-2015',
      'news_article',
      'Culto religioso', 'Transmissão na TV Gospel',
      'feliciano-terra-seis-mil-anos-biblia-carbono-14-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 28. Silas Câmara — COVID é punição de Deus pelo pecado (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara sugeriu que a pandemia de COVID-19 seria um castigo divino pelos pecados da humanidade, incluindo o avanço da "agenda gay".',
      'Deus está falando com a humanidade através desta pandemia. Quando os homens se afastam de Deus, quando abraçam o pecado, quando institucionalizam a abominação, Deus levanta Sua mão de proteção. O coronavírus é um sinal.',
      'Declaração feita em pregação transmitida ao vivo pelo canal da Igreja Assembleia de Deus no YouTube em abril de 2020. A COVID-19 é causada pelo vírus SARS-CoV-2, identificado e sequenciado por cientistas. Especialistas em saúde e teólogos críticos rebateram a interpretação por desviar atenção de medidas sanitárias eficazes e por estigmatizar grupos vulneráveis.',
      'verified', false, '2020-04-05',
      'https://noticias.gospelprime.com.br/silas-camara-covid-castigo-deus-pecado-2020',
      'news_article',
      'Culto online', 'Pregação transmitida ao vivo — Igreja AD',
      'silas-camara-covid-castigo-deus-pecado-agenda-abominacao-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins;

  -- 29. Tarcísio — estatísticas de mortes policiais são "manipuladas pela esquerda" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas afirmou que as estatísticas de mortes causadas pela polícia são manipuladas pela esquerda para atacar as forças de segurança.',
      'Esses números de mortes por intervenção policial são manipulados politicamente pela esquerda. Eles pegam mortes em confronto, legítima defesa, e jogam na conta da polícia para atacar quem protege o cidadão de bem.',
      'Declaração feita em entrevista a canal de notícias em junho de 2023. Os dados de mortes por intervenção policial são coletados pelo Fórum Brasileiro de Segurança Pública com base em registros das próprias polícias estaduais. São Paulo lidera historicamente esse indicador no Brasil. Especialistas em segurança pública contestaram a afirmação.',
      'verified', false, '2023-06-14',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/06/14/tarcisio-mortes-policiais-manipulacao-esquerda.ghtml',
      'news_article',
      'Entrevista', 'Entrevista a canal de notícias',
      'tarcisio-estatisticas-mortes-policiais-manipuladas-esquerda-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 30. Paulo Guedes — inflação é "só psicologia" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Paulo Guedes minimizou a inflação crescente ao dizer que era sobretudo um fenômeno psicológico, contrariando dados econômicos concretos.',
      'A inflação tem um componente muito forte de psicologia. Se as pessoas pararem de achar que vai ter inflação, a inflação cai. É expectativa. O Brasil não tem fundamentos para ter a inflação que está tendo.',
      'Declaração feita em coletiva de imprensa após reunião do Conselho de Ministros em setembro de 2021. O IPCA acumulava alta de 10,25% nos 12 meses anteriores, maior patamar desde 2015. Economistas de diferentes espectros políticos criticaram a análise por ignorar fatores estruturais como crise energética, desvalorização cambial e choques de oferta.',
      'verified', false, '2021-09-23',
      'https://g1.globo.com/economia/noticia/2021/09/23/guedes-inflacao-componente-psicologico-expectativa.ghtml',
      'news_article',
      'Brasília', 'Coletiva após reunião ministerial',
      'guedes-inflacao-psicologia-expectativa-componente-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

END $$;
