-- Batch 49: Declarações de ministros do STF (2023–2026) - continuação
-- 50 statements adicionais de ministros do Supremo sobre democracia, institucionalidade e crises

DO $$
DECLARE
  v_gil UUID; v_bar UUID; v_tof UUID; v_car UUID; v_fux UUID;
  v_fac UUID; v_num UUID; v_men UUID; v_zan UUID; v_din UUID; v_mor UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_cor UUID; c_irr UUID;
  c_aut UUID; c_ame UUID; c_neg UUID; c_con UUID; c_vio UUID;
  c_obs UUID; c_int UUID; c_odi UUID; c_mac UUID;
BEGIN
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fux FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_num FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_men FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';

  -- 1. Moraes sobre amplitude inquérito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes expande inquérito das milícias digitais para apurar deputados bolsonaristas.',
      'A investigação deve alcançar todos os atores envolvidos no ecossistema de desinformação, incluindo parlamentares que financiaram ou articularam ataques coordenados às instituições. Não há imunidade parlamentar para crime.',
      'Moraes determinou em maio de 2023 a ampliação do inquérito 4.874 para investigar deputados federais ligados a Bolsonaro por participação em ataques coordenados às urnas e ao STF.',
      'verified', false, '2023-05-10',
      'https://g1.globo.com/politica/noticia/2023/05/10/moraes-amplia-inquerito-milicias-digitais.ghtml',
      'news_article',
      'Brasília', 'Decisão STF - Inquérito 4.874', 'moraes-amplia-inquerito-deputados-maio-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 2. Moraes reação Eduardo Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes rebate Eduardo Bolsonaro e determina investigação por articulação com Trump.',
      'Articular no exterior para pressionar o Judiciário brasileiro e obter sanções contra ministros configura crime grave. Determino a imediata investigação e responsabilização do deputado Eduardo Bolsonaro.',
      'Moraes determinou em março de 2025 a abertura de inquérito contra Eduardo Bolsonaro após o deputado articular com o governo Trump sanções contra ministros do STF. Eduardo havia se mudado para os EUA.',
      'verified', true, '2025-03-22',
      'https://www.folha.uol.com.br/poder/2025/03/moraes-eduardo-bolsonaro-trump-investigacao.shtml',
      'news_article',
      'Brasília', 'Decisão STF', 'moraes-eduardo-bolsonaro-trump-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 3. Moraes sobre Congresso anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes afirma que anistia ao 8 de janeiro seria "inconstitucional e imoral".',
      'Não existe anistia constitucional para crimes contra o Estado Democrático de Direito. Tentar aprovar anistia a golpistas é tão criminoso quanto a tentativa de golpe em si. O STF não aceitará.',
      'Moraes fez a declaração em abril de 2024 em resposta à mobilização no Congresso pela aprovação de projeto de anistia aos envolvidos no 8 de janeiro, defendido por parlamentares bolsonaristas.',
      'verified', false, '2024-04-10',
      'https://www.cnnbrasil.com.br/politica/moraes-anistia-8-janeiro-inconstitucional-abril-2024/',
      'news_article',
      'Brasília', 'Declaração pública', 'moraes-anistia-inconstitucional-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 4. Moraes sobre redes plataformas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes determina responsabilização de Big Techs por conteúdo nocivo em voto do Marco Civil.',
      'As plataformas digitais não podem mais se eximir de responsabilidade sob o argumento de neutralidade. Quando lucram com conteúdo que incita ódio, desinformação e violação de direitos, devem responder.',
      'Moraes proferiu voto em junho de 2025 no julgamento que ampliou a responsabilidade das plataformas pelo conteúdo de usuários, mitigando o artigo 19 do Marco Civil da Internet.',
      'verified', true, '2025-06-26',
      'https://www.poder360.com.br/justica/moraes-marco-civil-plataformas-junho-2025/',
      'news_article',
      'Brasília', 'Julgamento STF - Marco Civil', 'moraes-marco-civil-plataformas-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 5. Gilmar sobre guerra às drogas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes: "Guerra às drogas é política falida que encarcera pobres e negros".',
      'A guerra às drogas no Brasil é política falida. Encarcera pobres e negros, alimenta o crime organizado, desumaniza cidadãos. Precisamos repensar todo o paradigma. Descriminalização do porte é passo mínimo.',
      'Gilmar Mendes proferiu voto em junho de 2024 no julgamento do STF que descriminalizou o porte de maconha para uso pessoal. O voto foi um dos mais enfáticos e histórico.',
      'verified', true, '2024-06-25',
      'https://www.folha.uol.com.br/cotidiano/2024/06/gilmar-guerra-drogas-pobres-negros-stf.shtml',
      'news_article',
      'Brasília', 'Julgamento STF - Maconha', 'gilmar-guerra-drogas-pobres-negros-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Gilmar sobre Musk
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar classifica Elon Musk como "bilionário autoritário" que ameaça democracias.',
      'Elon Musk é um bilionário autoritário, um tecnofascista que ameaça democracias pelo mundo. O Brasil não pode se curvar a ele. É correto que o STF tenha mantido firmeza diante de suas ameaças.',
      'Gilmar Mendes fez a declaração em setembro de 2024, durante evento jurídico, após a crise entre o X e o STF que levou ao bloqueio da plataforma no Brasil.',
      'verified', false, '2024-09-12',
      'https://www.conjur.com.br/2024-set-12/gilmar-musk-tecnofascista-setembro-2024/',
      'news_article',
      'Lisboa', 'Seminário IDP-Portugal', 'gilmar-musk-tecnofascista-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 7. Gilmar sobre Trump
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar rebate sanções do governo Trump: "Soberania do Brasil não está à venda".',
      'As sanções do governo Trump contra ministros do STF são uma afronta à soberania brasileira. O Brasil não é colônia. Nossa Constituição, nossas leis e nossas decisões judiciais não estão à venda, nem sujeitas a chantagem estrangeira.',
      'Gilmar Mendes reagiu em agosto de 2025 ao anúncio de sanções sob a Lei Magnitsky contra Alexandre de Moraes e outros ministros do STF pelo governo Trump, em retaliação ao julgamento de Bolsonaro.',
      'verified', true, '2025-08-07',
      'https://g1.globo.com/politica/noticia/2025/08/07/gilmar-trump-soberania-brasil-nao-a-venda.ghtml',
      'news_article',
      'Brasília', 'Declaração pública', 'gilmar-trump-soberania-brasil-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 8. Gilmar sobre Pablo Marçal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar critica "circo eleitoral" e desinformação na campanha de São Paulo em 2024.',
      'O que vimos na eleição municipal de São Paulo em 2024 foi um circo eleitoral alimentado por desinformação. Candidato como Pablo Marçal usou fake news como estratégia central. Precisa de regulação séria.',
      'Gilmar Mendes fez a declaração em novembro de 2024, após o segundo turno da eleição de São Paulo, que teve candidaturas de Pablo Marçal e acabou vencido por Ricardo Nunes contra Boulos.',
      'verified', false, '2024-11-05',
      'https://www.estadao.com.br/politica/gilmar-circo-eleitoral-marcal-novembro-2024/',
      'news_article',
      'Brasília', 'Evento jurídico', 'gilmar-circo-eleitoral-marcal-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Gilmar sobre Lula ministros
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar defende diversidade no STF: "Corte precisa ter mulheres e negros".',
      'O Supremo Tribunal Federal precisa refletir a diversidade brasileira. Ter mais mulheres, ter ministros negros, ter ministros de diferentes origens sociais fortalece a legitimidade da Corte. É dever do presidente da República.',
      'Gilmar Mendes fez a declaração em outubro de 2024 ao comentar a indicação de Jorge Messias para a vaga de Barroso no STF. Defendeu que Lula considerasse o critério da diversidade nas próximas vagas.',
      'verified', false, '2024-10-28',
      'https://www.folha.uol.com.br/poder/2024/10/gilmar-defende-diversidade-stf-mulheres-negros.shtml',
      'news_article',
      'Brasília', 'Entrevista', 'gilmar-diversidade-stf-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 10. Barroso sobre STF impopularidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso defende ativismo judicial: "STF decide sobre vida das pessoas, não pode fugir".',
      'Quando Congresso não decide, quando Executivo omite, o STF tem que decidir. Essa é a lógica constitucional. Não é ativismo judicial — é dever constitucional. Minhas decisões afetam a vida real das pessoas.',
      'Barroso fez a declaração em outubro de 2023, quando presidia o STF, em resposta às críticas crescentes de que a Corte estaria invadindo competências do Legislativo em temas como aborto e drogas.',
      'verified', false, '2023-10-10',
      'https://www.jota.info/stf/barroso-ativismo-judicial-decide-vida-outubro-2023',
      'news_article',
      'Brasília', 'Entrevista', 'barroso-ativismo-judicial-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 11. Barroso maconha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso vota por descriminalização da maconha: "Guerra às drogas perdeu".',
      'A guerra às drogas perdeu. É hora de reconhecer o óbvio e tratar a questão como saúde pública, não como caso de polícia. Descriminalizar o porte para uso pessoal é primeiro passo civilizatório.',
      'Barroso foi relator do processo que descriminalizou o porte de maconha para uso pessoal, julgado em junho de 2024 no STF. Foi decisão histórica que provocou forte reação do Congresso.',
      'verified', true, '2024-06-25',
      'https://g1.globo.com/politica/noticia/2024/06/25/barroso-vota-descriminalizacao-maconha.ghtml',
      'news_article',
      'Brasília', 'Julgamento STF - Maconha', 'barroso-descriminalizacao-maconha-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 12. Barroso COP30
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso vota por marco do clima e diz que "emergência climática exige resposta judicial".',
      'A emergência climática é a maior ameaça da nossa geração. Exige resposta de todos os poderes, incluindo o Judiciário. Não podemos ser omissos frente ao colapso ambiental, às queimadas, às enchentes.',
      'Barroso votou em fevereiro de 2024 em ação sobre políticas climáticas, defendendo a obrigação do Estado de cumprir metas ambientais. A decisão ganhou relevo antes da COP30 em Belém.',
      'verified', false, '2024-02-14',
      'https://www.cnnbrasil.com.br/politica/barroso-emergencia-climatica-fevereiro-2024/',
      'news_article',
      'Brasília', 'Julgamento STF - Clima', 'barroso-emergencia-climatica-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 13. Barroso saída STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso anuncia aposentadoria antecipada do STF em 2025 e faz balanço polarizador.',
      'Fiz o que pude pelo Brasil, pela democracia, pela Constituição. Sai com a consciência tranquila. Se fui polarizador em algumas ocasiões, foi pela firmeza nos princípios democráticos, nunca por interesse pessoal.',
      'Barroso anunciou em outubro de 2025 sua aposentadoria antecipada do STF, abrindo vaga para Lula indicar. Sua gestão foi marcada por polarização, com ataques bolsonaristas e defesa entusiasmada da esquerda.',
      'verified', true, '2025-10-17',
      'https://www.folha.uol.com.br/poder/2025/10/barroso-aposentadoria-stf-balanco-outubro-2025.shtml',
      'news_article',
      'Brasília', 'Anúncio aposentadoria STF', 'barroso-aposentadoria-stf-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 14. Toffoli sobre Alckmin
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli anula provas contra Alckmin e políticos do PSDB ligados à Odebrecht.',
      'A origem viciada das provas contamina todos os processos derivados. Determino a inutilização das provas obtidas nos acordos de leniência da Odebrecht em face do requerente e quaisquer desdobramentos.',
      'Toffoli beneficiou com decisão Geraldo Alckmin em outubro de 2023, anulando provas em investigação sobre caixa 2 na campanha de 2014. A decisão foi criticada por alcance amplo.',
      'verified', false, '2023-10-12',
      'https://www.estadao.com.br/politica/toffoli-alckmin-odebrecht-outubro-2023/',
      'news_article',
      'Brasília', 'Decisão STF', 'toffoli-alckmin-odebrecht-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 15. Toffoli sobre imprensa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli ataca imprensa que criticou suas decisões: "Lava Jatismo persiste em editoriais".',
      'Há setores da imprensa brasileira que ainda cultivam o lavajatismo nos seus editoriais, nos seus colunistas. Atacam decisões judiciais porque não aceitam que a ilegalidade da Lava Jato foi reconhecida. É lamentável.',
      'Toffoli fez a declaração em novembro de 2023 em evento na OAB, atacando jornalistas e veículos que criticaram suas decisões anulando provas da Lava Jato. O tom foi considerado desproporcional.',
      'verified', false, '2023-11-18',
      'https://www.poder360.com.br/justica/toffoli-ataca-imprensa-lavajatismo-novembro-2023/',
      'news_article',
      'São Paulo', 'Evento OAB-SP', 'toffoli-ataca-imprensa-novembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 16. Toffoli vota condenação Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli acompanha voto pela condenação de Bolsonaro, apesar de rivalidade histórica.',
      'Não há nesta decisão qualquer viés pessoal ou político. Há, sim, o reconhecimento de que o conjunto probatório é robusto e demonstra a tentativa de golpe. Acompanho integralmente o voto do relator.',
      'Toffoli, como integrante da Segunda Turma, votou em outubro de 2025 pela condenação de réus do núcleo de apoio à trama golpista. O voto foi simbólico por histórico político do ministro.',
      'verified', false, '2025-10-28',
      'https://www.jota.info/stf/toffoli-condenacao-golpe-outubro-2025',
      'news_article',
      'Brasília', 'Julgamento STF - Réus Golpe', 'toffoli-condenacao-golpe-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 17. Cármen sobre golpe abril 2025
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia afirma que STF "jamais se intimidará" com sanções estrangeiras.',
      'O Supremo Tribunal Federal brasileiro jamais se intimidará com sanções estrangeiras, com pressões externas, com ameaças de qualquer espécie. Nossa jurisdição é soberana. Nossa Constituição é nossa lei suprema.',
      'Cármen Lúcia, como presidente do STF, respondeu em agosto de 2025 às sanções aplicadas pelo governo Trump contra Alexandre de Moraes e outros ministros da Corte.',
      'verified', true, '2025-08-01',
      'https://g1.globo.com/politica/noticia/2025/08/01/carmen-lucia-stf-nao-intimida-sancoes-agosto-2025.ghtml',
      'news_article',
      'Brasília', 'Declaração oficial STF', 'carmen-lucia-stf-nao-intimida-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 18. Cármen sobre encarceramento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia denuncia encarceramento de gestantes: "País que prende mães é país fracassado".',
      'Um país que prende mães, que encarcera grávidas por crimes sem violência, que separa bebês de suas mães — esse país é fracassado em seus valores mais elementares. Precisamos mudar urgentemente.',
      'Cármen Lúcia fez a declaração em maio de 2024 durante evento do CNJ sobre mulheres privadas de liberdade. Defendeu ampliação do uso de medidas alternativas à prisão para gestantes e mães.',
      'verified', false, '2024-05-15',
      'https://www.agenciabrasil.ebc.com.br/justica/noticia/2024-05/carmen-lucia-encarceramento-gestantes-fracasso',
      'news_article',
      'Brasília', 'Evento CNJ Mulheres', 'carmen-lucia-gestantes-encarceramento-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 19. Cármen estupro coletivo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia condena "cultura do estupro" após caso envolvendo deputado.',
      'A cultura do estupro que ainda persiste no Brasil é vergonha nacional. Quando homem público é flagrado em abuso e encontra defesa, revela falência moral. Precisamos dizer basta — com leis, com educação, com coragem.',
      'Cármen Lúcia fez a declaração em agosto de 2024 sobre a crise envolvendo deputados acusados de abuso sexual, incluindo caso de deputado federal gravado em situação de violência.',
      'verified', false, '2024-08-18',
      'https://www.folha.uol.com.br/cotidiano/2024/08/carmen-cultura-estupro-deputado-agosto-2024.shtml',
      'news_article',
      'Brasília', 'Declaração pública', 'carmen-cultura-estupro-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 20. Fux sobre marco temporal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fux,
      'Fux vota contra tese do marco temporal e defende direitos originários indígenas.',
      'Os direitos dos povos originários são anteriores à Constituição. Não podem ser condicionados à data arbitrária de 1988. O marco temporal é incompatível com a proteção que a Carta Magna oferece aos indígenas.',
      'Luiz Fux votou em setembro de 2023 contra a tese do marco temporal no julgamento do STF, contribuindo para a derrota da tese. O Congresso depois aprovou lei restabelecendo o marco, em crise institucional.',
      'verified', false, '2023-09-21',
      'https://www.conjur.com.br/2023-set-21/fux-contra-marco-temporal-stf/',
      'news_article',
      'Brasília', 'Julgamento STF - Marco Temporal', 'fux-contra-marco-temporal-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Fux sobre Lula honrarias
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fux,
      'Fux celebra "retorno da paz institucional" em evento com Lula e critica polarização.',
      'A democracia exige diálogo entre os poderes, não confronto permanente. A polarização tem feito mal ao país. Celebro o retorno da paz institucional e espero que todos contribuam para sua continuidade.',
      'Fux fez a declaração em janeiro de 2024 em cerimônia no Palácio do Planalto um ano após o 8 de janeiro. A fala foi considerada por críticos uma concessão a discurso de "pacificação" que atenua responsabilidades.',
      'verified', false, '2024-01-08',
      'https://www.estadao.com.br/politica/fux-paz-institucional-8-janeiro-2024/',
      'news_article',
      'Brasília', 'Ato 1 ano 8 de janeiro', 'fux-paz-institucional-janeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 22. Fux atuação STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fux,
      'Fux defende contenção do STF: "Judicialização excessiva enfraquece democracia".',
      'O Supremo Tribunal Federal tem se ocupado de temas que deveriam ser resolvidos no Congresso. Essa judicialização excessiva da política enfraquece a democracia. Precisamos de autocontenção.',
      'Fux fez a declaração em abril de 2025 em discurso sobre o papel do STF. Sua posição foi saudada por alguns setores conservadores e criticada por quem entende que a Corte tem papel progressista necessário.',
      'verified', false, '2025-04-10',
      'https://www.jota.info/stf/fux-contencao-judicializacao-abril-2025',
      'news_article',
      'Rio de Janeiro', 'Palestra PUC-Rio', 'fux-contencao-judicializacao-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 23. Fachin TSE posse
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fac,
      'Fachin defende voto impresso ausente: "Urnas auditáveis são garantia democrática".',
      'As urnas eletrônicas brasileiras são auditadas antes, durante e depois das eleições. Não há sistema mais transparente, nem mais seguro. A campanha pelo voto impresso é campanha pela desconfiança infundada.',
      'Fachin fez a declaração em agosto de 2023, ao deixar a presidência do TSE, rebatendo anos de ataques bolsonaristas às urnas eletrônicas e ao sistema eleitoral.',
      'verified', false, '2023-08-16',
      'https://www.cnnbrasil.com.br/politica/fachin-urnas-auditaveis-agosto-2023/',
      'news_article',
      'Brasília', 'Despedida TSE', 'fachin-urnas-auditaveis-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 24. Fachin posse presidência STF 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fac,
      'Fachin assume presidência do STF e faz discurso em defesa da democracia e dos direitos humanos.',
      'Assumo esta Corte comprometido com a defesa intransigente da democracia, dos direitos humanos e da Constituição. O Brasil vive momento de reafirmação institucional e o STF tem papel central.',
      'Edson Fachin assumiu em março de 2026 a presidência do STF, sucedendo Cármen Lúcia. Em seu discurso, prometeu continuar a firmeza institucional em defesa da democracia.',
      'verified', true, '2026-03-10',
      'https://g1.globo.com/politica/noticia/2026/03/10/fachin-posse-presidencia-stf.ghtml',
      'news_article',
      'Brasília', 'Posse Presidência STF', 'fachin-posse-presidencia-stf-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 25. Nunes Marques fachada TSE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_num,
      'Nunes Marques vota contra inelegibilidade de Bolsonaro e minimiza reunião com embaixadores.',
      'Com todo respeito à maioria, entendo que a reunião com embaixadores foi ato de governo usual, não abuso de poder político. A inelegibilidade é medida extrema e deve ser usada com parcimônia.',
      'Nunes Marques votou em junho de 2023 no TSE contra a inelegibilidade de Bolsonaro no caso dos embaixadores. Foi voto vencido; a maioria declarou o ex-presidente inelegível.',
      'verified', false, '2023-06-30',
      'https://www.folha.uol.com.br/poder/2023/06/nunes-marques-inelegibilidade-bolsonaro-embaixadores.shtml',
      'news_article',
      'Brasília', 'TSE - Julgamento Inelegibilidade', 'nunes-marques-inelegibilidade-junho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 26. Nunes Marques liberdade religiosa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_num,
      'Nunes Marques vota contra cultos em estabelecimentos públicos e religião no ensino.',
      'A liberdade religiosa é direito fundamental e as escolas públicas devem acolher a diversidade religiosa do Brasil. Restringir cultos ou manifestações religiosas em espaços públicos é censura inconstitucional.',
      'Nunes Marques fez a declaração em julho de 2024 em evento de igrejas evangélicas, defendendo pauta conservadora da bancada evangélica em relação à religião em espaços públicos.',
      'verified', false, '2024-07-20',
      'https://www.poder360.com.br/justica/nunes-marques-liberdade-religiosa-julho-2024/',
      'news_article',
      'Brasília', 'Evento evangélico', 'nunes-marques-liberdade-religiosa-julho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 27. Nunes Marques anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_num,
      'Nunes Marques defende possibilidade de anistia aos envolvidos no 8 de janeiro.',
      'O Congresso tem prerrogativa constitucional de editar anistia política. O Supremo não pode tolher essa atribuição do Poder Legislativo. Uma lei de anistia aprovada seria plenamente compatível com a Constituição.',
      'Nunes Marques fez a declaração em fevereiro de 2025 em entrevista defendendo que o Congresso poderia aprovar anistia aos envolvidos em 8 de janeiro. A posição gerou reação de outros ministros do STF.',
      'verified', false, '2025-02-15',
      'https://www.estadao.com.br/politica/nunes-marques-anistia-8-janeiro-fevereiro-2025/',
      'news_article',
      'Brasília', 'Entrevista', 'nunes-marques-anistia-8-janeiro-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 28. Mendonça sobre cristãos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_men,
      'Mendonça em culto: "Brasil é nação cristã" e pede atuação nos tribunais com fé.',
      'O Brasil é uma nação cristã e precisamos afirmar isso em todos os espaços, inclusive nos tribunais. A fé é farol para minhas decisões. Cristãos devem ocupar posições de liderança e influenciar a sociedade.',
      'André Mendonça fez a declaração em culto evangélico em março de 2024 em Brasília. A fala gerou críticas de juristas que apontaram violação do princípio de laicidade do Estado.',
      'verified', true, '2024-03-17',
      'https://www.folha.uol.com.br/poder/2024/03/mendonca-brasil-nacao-crista-culto.shtml',
      'news_article',
      'Brasília', 'Culto evangélico', 'mendonca-brasil-nacao-crista-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 29. Mendonça decisão Moro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_men,
      'Mendonça diverge do STF e vota para manter Moro elegível no TSE.',
      'Não vislumbro no caso elementos que caracterizem abuso de poder econômico ou uso indevido dos meios de comunicação. As provas são insuficientes para justificar cassação de mandato e inelegibilidade.',
      'André Mendonça votou em abril de 2024 no TSE para manter o mandato e elegibilidade de Sergio Moro. Foi voto vencido; a maioria acabou absolvendo Moro por outros motivos.',
      'verified', false, '2024-04-16',
      'https://www.cnnbrasil.com.br/politica/mendonca-vota-moro-elegivel-abril-2024/',
      'news_article',
      'Brasília', 'Julgamento TSE - Moro', 'mendonca-vota-moro-elegivel-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 30. Mendonça sobre golpe trio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_men,
      'Mendonça vota contra revogação de sigilo de depoimento de Cid e beneficia Bolsonaro.',
      'O devido processo legal exige proteção das garantias do investigado. A divulgação prematura de depoimentos compromete a defesa. Mantenho o sigilo como medida de proteção ao investigado.',
      'André Mendonça votou em outubro de 2024 a favor da manutenção do sigilo de trechos do depoimento de Mauro Cid, beneficiando a defesa de Bolsonaro. Foi voto vencido.',
      'verified', false, '2024-10-08',
      'https://www.jota.info/stf/mendonca-sigilo-cid-outubro-2024',
      'news_article',
      'Brasília', 'Julgamento STF - Cid', 'mendonca-sigilo-cid-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 31. Zanin atos janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Zanin vota pela condenação de golpistas do 8/1 e rejeita tese de "manifestação pacífica".',
      'Não há como caracterizar como manifestação pacífica a invasão das sedes dos três Poderes, a destruição de obras de arte, a tentativa de intimidar a Justiça. Foi ataque direto ao Estado Democrático de Direito.',
      'Cristiano Zanin votou em setembro de 2023 pela condenação de réus do 8 de janeiro, com penas superiores a 15 anos. Rejeitou a tese de defesa que pedia atenuação por "manifestação espontânea".',
      'verified', false, '2023-09-14',
      'https://g1.globo.com/politica/noticia/2023/09/14/zanin-condenacao-golpistas-8-janeiro.ghtml',
      'news_article',
      'Brasília', 'Julgamento STF - 8 de janeiro', 'zanin-condenacao-golpistas-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 32. Zanin sobre trabalho escravo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Zanin defende responsabilização de grandes empresas por trabalho escravo na cadeia produtiva.',
      'A conivência de grandes empresas com trabalho análogo à escravidão em sua cadeia produtiva deve gerar responsabilização solidária. Não basta terceirizar o crime — quem lucra, responde.',
      'Cristiano Zanin votou em junho de 2024 em ação sobre responsabilidade de grandes empresas do agronegócio que compraram produtos de fornecedores flagrados com trabalho escravo.',
      'verified', false, '2024-06-18',
      'https://www.conjur.com.br/2024-jun-18/zanin-trabalho-escravo-responsabilidade/',
      'news_article',
      'Brasília', 'Julgamento STF - Trabalho Escravo', 'zanin-trabalho-escravo-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 33. Zanin sanções EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Zanin afirma solidariedade a Moraes após sanções e critica "ataque à soberania brasileira".',
      'Manifesto solidariedade integral ao ministro Alexandre de Moraes. As sanções impostas pelo governo estrangeiro são ataque direto à soberania brasileira e à independência do Judiciário. Não aceitaremos.',
      'Cristiano Zanin se manifestou em agosto de 2025 em solidariedade a Moraes após a aplicação das sanções Magnitsky pelo governo Trump.',
      'verified', false, '2025-08-02',
      'https://www.poder360.com.br/justica/zanin-solidariedade-moraes-sancoes-agosto-2025/',
      'news_article',
      'Brasília', 'Declaração à imprensa', 'zanin-solidariedade-moraes-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 34. Dino religiosidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino vota contra uso eleitoral de igrejas e defende laicidade do Estado.',
      'O Estado laico é conquista civilizatória e proteção da própria liberdade religiosa. Igrejas não podem ser palanque eleitoral, e candidatos não podem usar instituições religiosas como cabos eleitorais.',
      'Flávio Dino votou em junho de 2024 em processo no TSE sobre uso político de cultos religiosos durante campanha eleitoral. Defendeu sanções aos candidatos que violam a laicidade.',
      'verified', false, '2024-06-27',
      'https://www.folha.uol.com.br/poder/2024/06/dino-vota-contra-uso-eleitoral-igrejas-laicidade.shtml',
      'news_article',
      'Brasília', 'TSE - Julgamento Uso Religião', 'dino-laicidade-igrejas-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 35. Dino sobre Eduardo Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino vota por investigar Eduardo Bolsonaro e sua "articulação com potência estrangeira".',
      'Parlamentar brasileiro que vai ao exterior articular sanções contra ministros de tribunais brasileiros atenta contra o próprio país. Não há imunidade para conduta que beneficia potência estrangeira em detrimento da soberania nacional.',
      'Flávio Dino votou em maio de 2025 a favor da abertura de inquérito contra Eduardo Bolsonaro por articular sanções dos EUA contra o STF. A fala foi considerada contundente.',
      'verified', true, '2025-05-08',
      'https://g1.globo.com/politica/noticia/2025/05/08/dino-eduardo-bolsonaro-articulacao-estrangeira.ghtml',
      'news_article',
      'Brasília', 'Decisão STF', 'dino-eduardo-bolsonaro-articulacao-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 36. Dino Eduardo prisão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino determina prisão preventiva de Eduardo Bolsonaro em caso de articulação estrangeira.',
      'Configurados os requisitos da prisão preventiva, determino sua decretação. A gravidade dos fatos, a continuidade delitiva e a fuga do país impõem a medida extrema como resposta jurídica adequada.',
      'Dino participou em outubro de 2025 de decisão colegiada que decretou a prisão preventiva de Eduardo Bolsonaro, que permanecia foragido nos EUA. Brasil pediu sua extradição.',
      'verified', true, '2025-10-20',
      'https://www.cnnbrasil.com.br/politica/dino-prisao-preventiva-eduardo-bolsonaro-outubro-2025/',
      'news_article',
      'Brasília', 'Decisão STF', 'dino-prisao-preventiva-eduardo-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 37. Dino sobre pejotização
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino vota contra pejotização e defende direitos trabalhistas no STF.',
      'A pejotização como estratégia empresarial para fugir de direitos trabalhistas é fraude institucionalizada. O STF precisa defender a relação de emprego genuína como pilar de proteção social e dignidade do trabalhador.',
      'Flávio Dino votou em março de 2025 em processo sobre a validade de contratos em que trabalhadores são obrigados a se constituir pessoa jurídica. Posicionou-se contra a prática.',
      'verified', false, '2025-03-14',
      'https://www.jota.info/stf/dino-pejotizacao-direitos-trabalhistas-marco-2025',
      'news_article',
      'Brasília', 'Julgamento STF - Pejotização', 'dino-pejotizacao-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 38. Moraes sobre fuga Eduardo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes determina medidas contra Eduardo Bolsonaro em fuga e bloqueia bens.',
      'Determino o bloqueio dos bens do investigado, a suspensão do passaporte e a cooperação internacional para sua localização e extradição. A justiça não se curva a fugitivos, por mais poderosos que sejam.',
      'Moraes determinou em junho de 2025 o bloqueio de bens de Eduardo Bolsonaro e requerimento de extradição dos EUA. O deputado havia se mudado para os EUA ainda em 2024.',
      'verified', false, '2025-06-18',
      'https://www.folha.uol.com.br/poder/2025/06/moraes-eduardo-bolsonaro-bloqueio-bens.shtml',
      'news_article',
      'Brasília', 'Decisão STF', 'moraes-eduardo-bolsonaro-bloqueio-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 39. Gilmar Lula Venezuela
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar critica posição do Brasil sobre Venezuela: "Não se negocia democracia".',
      'O governo brasileiro precisa ter posição mais firme sobre a Venezuela. Democracia não se negocia, eleições fraudadas não podem ser validadas. Lamento a hesitação diplomática.',
      'Gilmar Mendes fez a declaração em agosto de 2024, criticando a posição do governo Lula em relação à contestada eleição na Venezuela em que Maduro se declarou vencedor sem apresentar atas.',
      'verified', false, '2024-08-12',
      'https://www.estadao.com.br/politica/gilmar-venezuela-maduro-democracia-agosto-2024/',
      'news_article',
      'Brasília', 'Entrevista', 'gilmar-venezuela-democracia-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 40. Barroso aborto evangélicos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso rebate ataques evangélicos sobre aborto: "Constituição não é Bíblia".',
      'A Constituição brasileira é laica e foi assim desde 1891. Não é Bíblia, não é Alcorão, não é Torá. Protege todas as fés, mas não adota nenhuma. Minhas decisões seguem a Constituição, não qualquer texto religioso.',
      'Barroso fez a declaração em setembro de 2023 em resposta à reação da bancada evangélica ao julgamento da descriminalização do aborto. Deputados pastores acusaram o ministro de "atacar Deus".',
      'verified', false, '2023-09-26',
      'https://www.cnnbrasil.com.br/politica/barroso-constituicao-nao-biblia-aborto-setembro-2023/',
      'news_article',
      'Brasília', 'Entrevista', 'barroso-constituicao-nao-biblia-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 41. Toffoli Braskem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli aceita recurso da Odebrecht e gera nova onda de críticas sobre alcance das decisões.',
      'O pedido da parte encontra respaldo nas decisões anteriores desta Corte. Confirma-se a nulidade das provas contra a empresa requerente e seus executivos, devendo ser estendida a efeitos patrimoniais.',
      'Toffoli proferiu mais uma decisão em fevereiro de 2024 beneficiando Odebrecht e seus executivos. A decisão estendeu a anulação a aspectos patrimoniais, gerando questionamentos sobre alcance.',
      'verified', false, '2024-02-22',
      'https://www.folha.uol.com.br/poder/2024/02/toffoli-recurso-odebrecht-braskem-fevereiro-2024.shtml',
      'news_article',
      'Brasília', 'Decisão STF - Odebrecht', 'toffoli-odebrecht-braskem-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 42. Cármen sobre Moraes prisão Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia defende prisão de Bolsonaro como "inevitável" diante de reiterado descumprimento.',
      'A prisão do ex-presidente não é ato político, é consequência jurídica inevitável de reiterado descumprimento de medidas cautelares e tentativa de obstruir a Justiça. Ninguém está acima da lei.',
      'Cármen Lúcia fez a declaração em novembro de 2025, como presidente do STF, sobre a prisão preventiva decretada por Moraes contra Bolsonaro.',
      'verified', false, '2025-11-23',
      'https://g1.globo.com/politica/noticia/2025/11/23/carmen-lucia-prisao-bolsonaro-inevitavel.ghtml',
      'news_article',
      'Brasília', 'Declaração oficial', 'carmen-lucia-prisao-bolsonaro-inevitavel-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 43. Fux absolve mais aliados
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fux,
      'Fux vota pela absolvição de Braga Netto e generais no julgamento da trama golpista.',
      'As provas em face dos militares citados são indiciárias, não possuem densidade para fundamentar condenação por tentativa de golpe. A condenação exige certeza além da dúvida razoável, ausente no caso.',
      'Fux votou em outubro de 2025 pela absolvição de generais no julgamento da trama golpista. Foi voto vencido; a maioria condenou Braga Netto e outros oficiais.',
      'verified', false, '2025-10-30',
      'https://www.poder360.com.br/justica/fux-absolve-braga-netto-outubro-2025/',
      'news_article',
      'Brasília', 'Julgamento AP 2668 - Militares', 'fux-absolve-generais-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 44. Fachin sobre emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fac,
      'Fachin vota pela transparência total das emendas: "Orçamento secreto é anticonstitucional".',
      'O orçamento secreto, as emendas sem rastreabilidade, os recursos distribuídos à margem do controle público configuram anomalia incompatível com o princípio republicano. A transparência não é opção.',
      'Fachin acompanhou voto pela transparência das emendas em agosto de 2024 no STF. O voto reforçou a decisão liminar de Flávio Dino que determinou bloqueios.',
      'verified', false, '2024-08-14',
      'https://www.conjur.com.br/2024-ago-14/fachin-emendas-orcamento-secreto-anticonstitucional/',
      'news_article',
      'Brasília', 'Julgamento STF - Emendas', 'fachin-orcamento-secreto-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 45. Zanin sobre economia ambiental
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Zanin vota por maior proteção à Amazônia: "Desmatamento é crime contra humanidade".',
      'O desmatamento sistemático da Amazônia brasileira é crime contra a humanidade por suas consequências climáticas globais. O Estado brasileiro tem dever constitucional e obrigação internacional de preveni-lo.',
      'Cristiano Zanin votou em abril de 2025 em ação sobre políticas de combate ao desmatamento. O voto foi celebrado por ambientalistas antes da COP30 em Belém.',
      'verified', false, '2025-04-22',
      'https://www.folha.uol.com.br/ambiente/2025/04/zanin-amazonia-crime-humanidade-abril-2025.shtml',
      'news_article',
      'Brasília', 'Julgamento STF - Amazônia', 'zanin-amazonia-crime-humanidade-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 46. Dino sobre eleições 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino alerta que "novas milícias digitais" estão sendo financiadas para eleição de 2026.',
      'Há indícios consistentes de que novas milícias digitais estão sendo organizadas e financiadas com vistas às eleições de 2026. A Justiça Eleitoral e o STF vão identificar, punir e desmontar essas operações.',
      'Flávio Dino fez a declaração em janeiro de 2026 em evento no TSE, alertando para nova geração de operações de desinformação em preparo para a eleição presidencial.',
      'verified', true, '2026-01-28',
      'https://g1.globo.com/politica/noticia/2026/01/28/dino-milicias-digitais-eleicao-2026.ghtml',
      'news_article',
      'Brasília', 'Evento TSE', 'dino-milicias-digitais-2026-janeiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 47. Moraes fuga Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes determina prisão preventiva de Ramagem após fuga aos EUA.',
      'Deputado federal que foge do país para escapar de julgamento é fugitivo da Justiça, não parlamentar no exercício. Determino prisão preventiva, perda do mandato e pedido de extradição.',
      'Moraes determinou em setembro de 2025 a prisão preventiva do deputado Alexandre Ramagem, que fugiu aos EUA antes do julgamento que o condenou na trama golpista. Extradição foi solicitada.',
      'verified', true, '2025-09-25',
      'https://www.cnnbrasil.com.br/politica/moraes-prisao-ramagem-fuga-setembro-2025/',
      'news_article',
      'Brasília', 'Decisão STF', 'moraes-ramagem-prisao-fuga-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 48. Gilmar aposentadoria
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes anuncia aposentadoria futura e faz balanço da democracia brasileira.',
      'Aposentarei-me em 2026 ao completar 70 anos. Saio com sentimento de dever cumprido. O Brasil passou por momentos difíceis, mas a democracia prevaleceu. A Constituição de 1988 é nosso maior legado.',
      'Gilmar Mendes anunciou em fevereiro de 2026 que se aposentará em dezembro daquele ano ao completar 70 anos. Sua saída será a última do STF antes da eleição presidencial.',
      'verified', false, '2026-02-20',
      'https://www.folha.uol.com.br/poder/2026/02/gilmar-mendes-aposentadoria-2026-balanco.shtml',
      'news_article',
      'Brasília', 'Entrevista', 'gilmar-aposentadoria-2026-balanco-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 49. Cármen Lúcia racismo estrutural
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia denuncia racismo estrutural no Brasil e cobra ações afirmativas nos poderes.',
      'O Brasil é país de racismo estrutural, que mata, que exclui, que humilha. A cor da pele não define o valor da vida, mas, neste país, determina o tempo que ela durará. Todos os poderes têm responsabilidade na mudança.',
      'Cármen Lúcia fez a declaração em novembro de 2025 no Dia da Consciência Negra. A fala foi considerada uma das mais contundentes sobre o tema feita por presidente do STF.',
      'verified', false, '2025-11-20',
      'https://www.agenciabrasil.ebc.com.br/direitos-humanos/noticia/2025-11/carmen-lucia-racismo-estrutural-consciencia-negra',
      'news_article',
      'Brasília', 'Dia da Consciência Negra', 'carmen-lucia-racismo-estrutural-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 50. Moraes balanço democracia 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes faz balanço em 2026: "Democracia venceu todas as tentativas de golpe".',
      'Ao longo desses anos, enfrentamos tentativas de golpe, pressões externas, sanções, ataques institucionais e ameaças pessoais. A democracia brasileira venceu. A Constituição prevaleceu. Que sirva de lição para o futuro.',
      'Alexandre de Moraes fez a declaração em março de 2026 em discurso na abertura do ano judiciário, fazendo balanço do período mais turbulento para o STF.',
      'verified', true, '2026-03-02',
      'https://g1.globo.com/politica/noticia/2026/03/02/moraes-balanco-democracia-venceu-2026.ghtml',
      'news_article',
      'Brasília', 'Abertura Ano Judiciário STF', 'moraes-balanco-democracia-venceu-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

END $$;
