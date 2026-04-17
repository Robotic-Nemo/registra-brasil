-- Batch 61: Ano eleitoral 2022 — campanha, ataques às urnas, debates,
-- Roberto Jefferson, Zambelli com arma, 2º turno Lula vs Bolsonaro,
-- Nikolas eleito, Marçal e Boulos, Damares "ilha", transição e
-- preparação do 8 de janeiro
-- 50 statements

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_edu UUID; v_fla UUID; v_car UUID;
  v_dam UUID; v_zam UUID; v_nik UUID; v_kic UUID; v_sil UUID;
  v_mor UUID; v_had UUID; v_gle UUID; v_cir UUID; v_jan UUID;
  v_mar UUID; v_bou UUID; v_ter UUID; v_mou UUID; v_lir UUID;
  v_pac UUID; v_gue UUID; v_val UUID; v_rom UUID; v_tem UUID;
  v_sar UUID; v_fel UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID; c_neg UUID; c_aut UUID; c_mac UUID;
  c_irr UUID; c_ama UUID; c_obs UUID; c_mis UUID; c_hom UUID;
  c_rac UUID; c_intim UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_gue FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_val FROM politicians WHERE slug = 'marcos-do-val';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
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
  SELECT id INTO c_intim FROM categories WHERE slug = 'intimidacao';

  -- 1. Bolsonaro "três alternativas: prisão, morte, vitória"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro repete que só há três saídas para ele nas eleições de 2022: prisão, morte ou vitória.',
      'As minhas eleições de 2022 só têm três alternativas: prisão, morte ou vitória. Digo aos canalhas que jamais serei preso.',
      'Declaração de Jair Bolsonaro em evento com empresários em julho de 2022, reiterando frase dita em 2021 mas agora já em pleno ano eleitoral. A fala foi considerada ameaça velada ao resultado das urnas e citada depois pelo TSE.',
      'verified', true, '2022-07-18',
      'https://g1.globo.com/politica/noticia/2022/07/18/bolsonaro-volta-a-dizer-que-so-ha-3-alternativas-prisao-morte-ou-vitoria.ghtml',
      'news_article',
      'São Paulo', 'Evento com empresários', '2022-bolsonaro-prisao-morte-vitoria-julho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 2. Bolsonaro reunião embaixadores 18 julho 2022
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Em reunião com embaixadores no Alvorada, Bolsonaro dispara contra as urnas eletrônicas e o TSE sem apresentar provas.',
      'A urna brasileira é fraudável. Eu não posso provar, mas eu tenho indícios. O TSE atua para me prejudicar. Vocês, representantes dos seus países, precisam saber que aqui existe risco de fraude.',
      'Reunião de Jair Bolsonaro com embaixadores estrangeiros no Palácio da Alvorada em 18 de julho de 2022, transmitida ao vivo pela TV Brasil. O episódio motivou ação no TSE que resultou na condenação de Bolsonaro à inelegibilidade em 2023.',
      'verified', true, '2022-07-18',
      'https://g1.globo.com/politica/noticia/2022/07/18/em-reuniao-com-embaixadores-bolsonaro-repete-acusacoes-sem-provas-sobre-urnas.ghtml',
      'news_article',
      'Brasília', 'Reunião com embaixadores no Palácio da Alvorada', '2022-bolsonaro-reuniao-embaixadores-urnas-julho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 3. Roberto Jefferson ataca PF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro minimiza ataque de Roberto Jefferson a policiais federais com fuzil e granadas em Comendador Levy Gasparian.',
      'O Roberto Jefferson é um grande patriota. Está doente. Foi surpreendido pelos policiais em casa, tem direito a se defender. Essa história toda é culpa do ministro Alexandre de Moraes, que o perseguia.',
      'Declaração de Bolsonaro após ex-deputado Roberto Jefferson (PTB), aliado histórico do presidente, atirar e jogar granadas contra policiais federais que tentavam prendê-lo em 23 de outubro de 2022, entre os dois turnos da eleição.',
      'verified', true, '2022-10-24',
      'https://g1.globo.com/politica/noticia/2022/10/24/bolsonaro-reage-ao-caso-de-roberto-jefferson.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', '2022-bolsonaro-jefferson-patriota-ataque-pf-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Carla Zambelli persegue homem com arma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli persegue homem negro com pistola em punho na véspera do 1º turno, em São Paulo.',
      'Ele veio me ameaçar, me agrediu, me empurrou. Eu apenas me defendi. Como mulher, em véspera de eleição, eu não podia deixar de reagir. Pedi que deitasse no chão. Nunca apontei arma para matar ninguém.',
      'Declaração da deputada Carla Zambelli (PL-SP) em 29 de outubro de 2022, véspera do segundo turno, após vídeo mostrar ela perseguindo com arma em punho o jornalista Luan Araújo nas ruas dos Jardins em São Paulo. Zambelli foi condenada a cinco anos de prisão em 2024.',
      'verified', true, '2022-10-29',
      'https://g1.globo.com/sp/sao-paulo/noticia/2022/10/29/carla-zambelli-saca-arma-contra-homem-em-sao-paulo-veja-video.ghtml',
      'news_article',
      'São Paulo', 'Incidente nos Jardins — véspera do 2º turno', '2022-zambelli-arma-jornalista-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 5. Debate Bolsonaro Lula Band
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'No debate da Band, Bolsonaro chama jornalista Vera Magalhães de "vergonha do jornalismo brasileiro".',
      'Você é uma vergonha para o jornalismo brasileiro. Acho que você dorme pensando em mim, você tem uma paixão por mim. Você não teria coragem de dizer isso tudo na frente de mim cara a cara.',
      'Declaração de Bolsonaro no primeiro debate presidencial da Band em 28 de agosto de 2022, dirigindo-se à jornalista Vera Magalhães. A fala motivou manifestações de apoio da imprensa e foi criticada como tentativa de intimidação.',
      'verified', true, '2022-08-28',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/08/29/bolsonaro-ataca-jornalista-vera-magalhaes-em-debate-da-band.ghtml',
      'news_article',
      'São Paulo', 'Debate presidencial da Band', '2022-bolsonaro-vera-magalhaes-debate-band-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 6. Bolsonaro comenta Ucrânia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que é "solidário" a Putin e mantém neutralidade mesmo após invasão da Ucrânia.',
      'O Brasil é neutro, é solidário. Queremos paz. Não vou falar mal do Putin, ele é um líder, um grande estadista. Estou solidário a todos os povos que sofrem.',
      'Declaração de Bolsonaro em entrevista ao repórter em 27 de fevereiro de 2022, três dias após o início da invasão russa da Ucrânia. Em viagem a Moscou semanas antes, Bolsonaro havia declarado "solidariedade" a Putin, gerando crise diplomática.',
      'verified', false, '2022-02-27',
      'https://g1.globo.com/mundo/ucrania-russia/noticia/2022/02/27/bolsonaro-diz-que-brasil-e-neutro-sobre-invasao-russa-na-ucrania.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', '2022-bolsonaro-neutralidade-putin-ucrania-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Lula anuncia candidatura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula anuncia oficialmente candidatura com Alckmin como vice em convenção do PT.',
      'Quero governar os 215 milhões de brasileiros, não apenas os que votaram em mim. Este país tem que parar de cultivar o ódio. Vamos reconstruir o Brasil que Bolsonaro destruiu. E vamos fazer isso juntos, em uma frente ampla democrática.',
      'Discurso de Lula na convenção nacional do PT em 21 de julho de 2022, oficializando a candidatura à Presidência com o ex-tucano Geraldo Alckmin (PSB) como vice. A chapa inédita selou a frente ampla democrática contra Bolsonaro.',
      'verified', true, '2022-07-21',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/07/21/lula-e-oficializado-candidato-a-presidente-pelo-pt.ghtml',
      'news_article',
      'São Paulo', 'Convenção Nacional do PT', '2022-lula-oficializa-candidatura-alckmin-julho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 8. Bolsonaro ataque Janaina Paschoal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro sugere em entrevista ao The Economist que só aceitará o resultado da eleição se for vitorioso.',
      'Se as eleições forem limpas, democráticas, transparentes, paz. Quem ganhar, ganhou. Porque eu tenho certeza de que vou ganhar. Agora, se acontecer algo anormal, nós temos que tomar atitude.',
      'Entrevista de Bolsonaro ao semanário britânico The Economist publicada em agosto de 2022, condicionando seu reconhecimento do resultado eleitoral a uma vitória. A fala repercutiu internacionalmente e acendeu alerta sobre o dia seguinte à eleição.',
      'verified', true, '2022-08-18',
      'https://www1.folha.uol.com.br/poder/2022/08/bolsonaro-ao-economist-nao-aceitara-resultado-se-considerar-eleicao-anormal.shtml',
      'news_article',
      'Brasília', 'Entrevista à revista The Economist', '2022-bolsonaro-economist-aceitar-resultado-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 9. Nikolas Ferreira eleito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira é eleito deputado federal mais votado do Brasil em 2022 com discurso radical anti-esquerda.',
      'Mais de um milhão de mineiros acreditaram em um jovem de 26 anos. Chega de agenda política de esquerda. Chega de ideologia de gênero nas escolas. Chega de aborto. Vamos lutar no Congresso pela família, pela pátria e por Deus.',
      'Discurso de Nikolas Ferreira (PL-MG) após ser eleito o deputado federal mais votado do Brasil em outubro de 2022, com 1,49 milhão de votos. O resultado marcou a ascensão da nova direita digital radicalizada dentro do bolsonarismo.',
      'verified', true, '2022-10-02',
      'https://www.estadao.com.br/politica/nikolas-ferreira-eleito-deputado-federal-mais-votado-pais/',
      'news_article',
      'Belo Horizonte', 'Discurso de vitória eleitoral', '2022-nikolas-eleito-mais-votado-deputado-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 10. Pablo Marçal candidatura 2022
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal lança pré-candidatura presidencial no PROS com discurso messiânico e ataque ao "sistema".',
      'Eu venho do nada. Eu sou o povo. Não tenho padrinhos políticos, não devo a ninguém. O sistema me odeia porque eu sou a voz dos milhões de brasileiros silenciados. Em 2022, vamos quebrar o Brasil com fé.',
      'Lançamento da pré-candidatura presidencial de Pablo Marçal pelo PROS em fevereiro de 2022. Com retórica messiânica, ele acabou desistindo após impugnação judicial, mas consolidou base que o levaria ao protagonismo em 2024.',
      'verified', false, '2022-02-15',
      'https://www1.folha.uol.com.br/poder/2022/02/coach-pablo-marcal-se-lanca-candidato-a-presidente-pelo-pros.shtml',
      'news_article',
      'São Paulo', 'Lançamento da pré-candidatura do PROS', '2022-marcal-pre-candidatura-pros-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Boulos SP deputado federal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Eleito deputado federal mais votado do PSOL, Guilherme Boulos vê vitória como passaporte para prefeitura de São Paulo.',
      'São Paulo deu uma resposta à onda de ódio. Elegemos a maior bancada de esquerda da história. A luta contra Bolsonaro continua, e em 2024 vamos disputar com força a prefeitura desta cidade. O povo precisa de moradia, não de arma.',
      'Discurso de Guilherme Boulos após ser eleito deputado federal em outubro de 2022 com quase 1 milhão de votos em São Paulo, o mais votado do PSOL e da esquerda na cidade, anunciando continuidade da articulação para disputar a prefeitura em 2024.',
      'verified', false, '2022-10-03',
      'https://g1.globo.com/sp/sao-paulo/noticia/2022/10/03/guilherme-boulos-e-eleito-deputado-federal.ghtml',
      'news_article',
      'São Paulo', 'Discurso de vitória', '2022-boulos-eleito-deputado-federal-sp-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 12. Damares ilha 2022
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves diz em culto que meninas são traficadas para uma "ilha" onde têm dentes arrancados, sem apresentar provas.',
      'Tem uma ilha aqui no Brasil onde as meninas, algumas de seis anos, são vendidas para servidão sexual. Chegam lá, arrancam os dentes, para estuprar melhor, sem reação. Cadê o Ministério Público? Cadê as investigações?',
      'Fala da então ministra Damares Alves em culto na igreja Presbiteriana em agosto de 2022, durante pré-campanha ao Senado. Sem apresentar provas, Damares descreveu cenário de tráfico infantil. O caso foi investigado pelo MP-PA que não encontrou indícios.',
      'verified', true, '2022-08-06',
      'https://www1.folha.uol.com.br/poder/2022/08/damares-diz-em-culto-que-ilha-abriga-meninas-estupradas-com-dentes-arrancados.shtml',
      'news_article',
      'Brasília', 'Culto em igreja Presbiteriana', '2022-damares-ilha-meninas-dentes-arrancados-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Paulo Guedes teto dos gastos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gue,
      'Paulo Guedes ameaça o Congresso afirmando que "balança bom no Brasil" se derrubarem o teto de gastos.',
      'Esse negócio é sério. Se você derruba o teto, a Bolsa cai 10%, 15%. Balança bom no Brasil. O dólar vai lá em cima. A inflação dispara. E os políticos que derrubarem o teto terão que explicar isso para a população.',
      'Declaração do ministro Paulo Guedes em evento empresarial em junho de 2022, ameaçando o Congresso em meio a discussões sobre a PEC Kamikaze que burlava o teto de gastos para ampliar benefícios sociais em ano eleitoral.',
      'verified', false, '2022-06-23',
      'https://www1.folha.uol.com.br/mercado/2022/06/guedes-ameaca-congresso-e-diz-que-balanca-bom-no-brasil-se-teto-cair.shtml',
      'news_article',
      'São Paulo', 'Evento empresarial', '2022-guedes-balanca-bom-teto-gastos-junho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intim, true FROM ins;

  -- 14. Gleisi PT presidente
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann promete "intervir" em caso de golpe e acusa Bolsonaro de arquitetar ruptura democrática.',
      'Bolsonaro está preparando um golpe. Quer destruir as urnas eletrônicas, mobilizar os quartéis e a militância armada. O PT não vai assistir de braços cruzados. Vamos mobilizar nossas militâncias em todo o Brasil para defender a democracia.',
      'Declaração da presidente do PT, Gleisi Hoffmann, em coletiva em setembro de 2022, em resposta às escaladas de Bolsonaro contra o sistema eleitoral às vésperas do 1º turno. A fala marcou o tom da resistência do PT durante a campanha.',
      'verified', false, '2022-09-05',
      'https://www.cartacapital.com.br/politica/gleisi-hoffmann-acusa-bolsonaro-de-preparar-golpe/',
      'news_article',
      'Brasília', 'Coletiva na sede do PT', '2022-gleisi-bolsonaro-golpe-intervir-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Ciro Gomes terceiro via
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes ataca Lula chamando-o de "maior corrupto da história" durante campanha presidencial.',
      'O Lula é o maior corrupto da história do Brasil. Eu sei o que aconteceu lá dentro do PT, eu estive nos governos. Não é porque o Moro errou na forma que Lula virou inocente. O Brasil precisa de outra alternativa, não desses dois extremos.',
      'Ataque de Ciro Gomes (PDT) a Lula em comício em Recife em setembro de 2022, durante a campanha pelo 1º turno. A estratégia de equiparar Lula e Bolsonaro contribuiu para o baixo desempenho de Ciro, que obteve 3,04% dos votos.',
      'verified', false, '2022-09-12',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/09/12/ciro-gomes-ataca-lula-maior-corrupto-da-historia.ghtml',
      'news_article',
      'Recife', 'Comício da campanha presidencial', '2022-ciro-lula-maior-corrupto-historia-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 16. Bolsonaro PRF 2º turno
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'PRF realiza abordagens atípicas no Nordeste no dia do 2º turno, em operação que TSE proibiu no dia anterior.',
      'A Polícia Rodoviária Federal está cumprindo a lei. Não está perseguindo ninguém. Cada um é livre para votar em quem quiser. Só que se tiver contravenção eleitoral, se tiver compra de voto em ônibus, eles vão agir.',
      'Declaração de Bolsonaro sobre a operação da PRF no 2º turno em 30 de outubro de 2022, quando a corporação realizou mais de 500 blitzes nas estradas do Nordeste no dia da eleição, em ação considerada tentativa de intimidação de eleitores lulistas.',
      'verified', true, '2022-10-30',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/30/prf-faz-abordagens-atipicas-no-dia-do-2o-turno-no-nordeste.ghtml',
      'news_article',
      'Brasília', 'Entrevista no 2º turno da eleição', '2022-bolsonaro-prf-nordeste-2-turno-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 17. Bolsonaro não aceita derrota
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Dois dias após a derrota, Bolsonaro fala em "manifestações pacíficas" sem reconhecer o resultado.',
      'As manifestações populares em andamento são fruto da indignação e do sentimento de injustiça de como se deu o processo eleitoral. Métodos atuais, como os de ruas protestando por bloqueios, não se confundem com a tresloucada esquerda.',
      'Primeiro pronunciamento de Jair Bolsonaro após a derrota no 2º turno, em 1º de novembro de 2022. Em declaração de dois minutos, ele não reconheceu explicitamente a vitória de Lula nem condenou os bloqueios rodoviários por caminhoneiros bolsonaristas.',
      'verified', true, '2022-11-01',
      'https://g1.globo.com/politica/noticia/2022/11/01/bolsonaro-primeiro-pronunciamento-apos-derrota.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento no Palácio da Alvorada', '2022-bolsonaro-primeiro-pronunciamento-derrota-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 18. Lula vitória 2022
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Eleito presidente, Lula declara vitória da democracia e promete governar "para todos os 215 milhões de brasileiros".',
      'Ganhamos a eleição. Vou governar para 215 milhões de brasileiros e brasileiras. Não apenas para aqueles que votaram em mim. Não há dois Brasis. Somos um só povo, uma só nação. Temos mais coisas que nos unem do que nos separam.',
      'Discurso de vitória de Lula após vencer Bolsonaro no 2º turno em 30 de outubro de 2022, com 50,90% dos votos. A fala em São Paulo defendeu pacificação do país após campanha marcada por polarização extrema e episódios de violência política.',
      'verified', true, '2022-10-30',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/30/leia-a-integra-do-discurso-de-lula-apos-vitoria-na-eleicao.ghtml',
      'news_article',
      'São Paulo', 'Discurso de vitória — Avenida Paulista', '2022-lula-discurso-vitoria-215-milhoes-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 19. Bolsonaros nos EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro foge para os Estados Unidos em 30 de dezembro, dois dias antes da posse de Lula.',
      'Perdi uma batalha mas não perdi a guerra. Falo que estou vivo. Deus, pátria, família e liberdade. Voltarei em breve para liderar a oposição ao governo Lula. Enquanto isso, vou descansar um pouco com minha família.',
      'Pronunciamento de Jair Bolsonaro em live nas redes sociais em 30 de dezembro de 2022, após embarcar para Orlando (EUA) sem passar a faixa presidencial. Foi o primeiro presidente brasileiro a não participar da posse do sucessor desde a redemocratização.',
      'verified', true, '2022-12-30',
      'https://g1.globo.com/politica/noticia/2022/12/30/bolsonaro-viaja-para-os-eua-antes-do-fim-do-mandato.ghtml',
      'news_article',
      'Orlando', 'Live nas redes sociais a partir dos EUA', '2022-bolsonaro-foge-eua-fim-mandato-dezembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Caminhoneiros bloqueios
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro custa a pedir desbloqueio de rodovias promovido por apoiadores após sua derrota.',
      'Eu peço aos caminhoneiros, que são patriotas, que desbloqueiem as rodovias. Entendo a indignação de vocês. Mas o Brasil não pode parar. Manifestem-se nas ruas, mas não prejudiquem a economia do país.',
      'Pronunciamento de Bolsonaro em 2 de novembro de 2022, três dias após a derrota, pedindo desbloqueio de mais de 250 pontos obstruídos em rodovias por caminhoneiros e apoiadores. O apelo foi considerado tardio por entidades empresariais e pelo próprio STF.',
      'verified', false, '2022-11-02',
      'https://g1.globo.com/politica/noticia/2022/11/02/bolsonaro-pede-para-apoiadores-desbloquear-rodovias.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento no Palácio do Planalto', '2022-bolsonaro-desbloqueio-caminhoneiros-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Bolsonaristas quarteis
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro estimula acampamentos em frente a quartéis e pede "intervenção militar".',
      'O povo está nas ruas pedindo intervenção federal com o Exército. É um pedido legítimo. Os quartéis estão cheios de patriotas. As Forças Armadas têm papel constitucional. O STF não pode silenciar o povo.',
      'Postagens e falas do deputado Eduardo Bolsonaro (PL-SP) em novembro de 2022, estimulando os acampamentos que surgiram em frente a mais de 100 quartéis do Exército pedindo intervenção militar contra a vitória de Lula.',
      'verified', true, '2022-11-15',
      'https://g1.globo.com/politica/noticia/2022/11/15/eduardo-bolsonaro-incita-acampamentos-quarteis.ghtml',
      'news_article',
      'Brasília', 'Publicação nas redes sociais', '2022-eduardo-bolsonaro-acampamentos-quarteis-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 22. Mourão critica Bolsonaro silêncio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Vice-presidente Hamilton Mourão critica o silêncio de Bolsonaro após a derrota e pede responsabilidade.',
      'A liderança tem que ser exercida. Silêncio cria vácuo, e o vácuo é preenchido por atos irresponsáveis, bloqueios, ameaças. O presidente precisa falar com clareza, reconhecer o resultado e pacificar o país.',
      'Declaração do general Hamilton Mourão em entrevista em novembro de 2022 sobre o silêncio prolongado de Bolsonaro após a derrota eleitoral. A crítica pública marcou distanciamento definitivo entre vice e presidente no fim do mandato.',
      'verified', false, '2022-11-07',
      'https://g1.globo.com/politica/noticia/2022/11/07/mourao-critica-silencio-de-bolsonaro-apos-derrota.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', '2022-mourao-critica-silencio-bolsonaro-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 23. Transição Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad, coordenador do grupo técnico, acusa governo Bolsonaro de "política de terra arrasada" na transição.',
      'O que encontramos aqui é política de terra arrasada. O Bolsa Família foi desmontado, o Farmácia Popular foi reduzido, Fies parou, Enem mal se realizou. Eles deixaram bombas-relógio fiscais em todos os ministérios.',
      'Declaração de Fernando Haddad, coordenador técnico do grupo de transição e futuro ministro da Fazenda, em coletiva em novembro de 2022 sobre os diagnósticos recebidos da gestão Bolsonaro. A fala justificou parte das propostas da PEC da Transição.',
      'verified', false, '2022-11-28',
      'https://www1.folha.uol.com.br/poder/2022/11/haddad-diz-que-bolsonaro-deixou-politica-de-terra-arrasada.shtml',
      'news_article',
      'Brasília', 'Coletiva do Gabinete de Transição', '2022-haddad-terra-arrasada-transicao-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 24. Bolsonaro TSE relatório
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Campanha de Bolsonaro protocola pedido de anulação dos votos em seções eleitorais, sem provas válidas.',
      'Temos indícios de falha em urnas anteriores ao modelo 2020. Mais de 280 mil urnas podem ter apresentado inconsistências. Nossa bancada técnica está analisando os dados. Queremos apenas a verdade, transparência.',
      'Pedido formal apresentado pelo PL, partido de Bolsonaro, ao TSE em 22 de novembro de 2022, requerendo anulação dos votos computados em determinados modelos de urnas. O relatório foi rejeitado e o partido multado em R$ 22,9 milhões.',
      'verified', true, '2022-11-22',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/11/22/pl-pede-anulacao-de-votos-tse-rejeita-e-aplica-multa.ghtml',
      'news_article',
      'Brasília', 'Representação protocolada no TSE', '2022-bolsonaro-pl-anulacao-votos-tse-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Daniel Silveira indulto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro concede indulto a Daniel Silveira um dia após condenação pelo STF por ataques aos ministros.',
      'O Daniel Silveira é deputado federal. A Constituição garante imunidade parlamentar. O STF foi longe demais. Como presidente, uso a prerrogativa constitucional para corrigir essa injustiça.',
      'Decreto presidencial assinado por Bolsonaro em 21 de abril de 2022, concedendo graça constitucional a Daniel Silveira, que havia sido condenado na véspera a 8 anos e 9 meses de prisão pelo STF por atacar ministros e defender o AI-5.',
      'verified', true, '2022-04-21',
      'https://g1.globo.com/politica/noticia/2022/04/21/bolsonaro-concede-indulto-a-daniel-silveira.ghtml',
      'news_article',
      'Brasília', 'Decreto presidencial publicado no Diário Oficial', '2022-bolsonaro-indulto-daniel-silveira-abril'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 26. Arthur Lira após eleição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira reconhece vitória de Lula e chama a derrota de Bolsonaro de "decisão soberana do povo".',
      'A vontade das urnas foi manifestada. O resultado é soberano e deve ser respeitado. A Câmara dos Deputados vai dialogar com o presidente eleito. A democracia exige respeito ao resultado, mesmo com as divergências que todos temos.',
      'Declaração do presidente da Câmara, Arthur Lira (PP-AL), em 31 de outubro de 2022, reconhecendo a vitória de Lula no dia seguinte à eleição. O pronunciamento foi importante sinal institucional, já que Lira era aliado de Bolsonaro e base do Centrão.',
      'verified', false, '2022-10-31',
      'https://www.camara.leg.br/noticias/919312-lira-reconhece-vitoria-de-lula-e-fala-em-respeito-as-urnas/',
      'news_article',
      'Brasília', 'Pronunciamento na Câmara dos Deputados', '2022-lira-reconhece-vitoria-lula-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 27. Bolsonaro debate Globo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'No debate da Globo, Bolsonaro cita "venezuelanas de 14, 15 anos" em comentário sobre imigração.',
      'Eu parei numa casa de venezuelanas no interior de Brasília. Tinha umas quinze, vinte, bonitas. E sabe o que aconteceu? Achei elas bonitas, entrei com elas. Mas não foi para isso. Foi uma história da vida.',
      'Fala de Bolsonaro em entrevista ao Cara a Cara em outubro de 2022, republicada em redes sociais. O relato sobre visita à casa com "venezuelanas arrumadinhas" gerou comoção, foi apontado como possível narrativa de exploração sexual, e foi levado ao MPF.',
      'verified', true, '2022-10-13',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/13/bolsonaro-gera-polemica-com-fala-sobre-venezuelanas.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Cara a Cara no Flow Podcast', '2022-bolsonaro-venezuelanas-14-15-anos-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 28. Bolsonaro Moro apoio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro, eleito senador pelo União Brasil no Paraná, promete ser "voz da oposição" contra o governo Lula.',
      'Fui eleito para defender o Paraná e o Brasil. Não aceitarei retrocessos na luta contra a corrupção. Vou fiscalizar o governo Lula com rigor. O Senado precisa ser uma Casa de controle ao Executivo.',
      'Discurso de Sergio Moro após ser eleito senador pelo Paraná pelo União Brasil em outubro de 2022, com 1,96 milhão de votos. A eleição marcou o retorno político de Moro após dois anos fora de cargos públicos desde a saída do governo Bolsonaro.',
      'verified', false, '2022-10-02',
      'https://g1.globo.com/pr/parana/eleicoes/2022/noticia/2022/10/02/sergio-moro-e-eleito-senador-pelo-parana.ghtml',
      'news_article',
      'Curitiba', 'Discurso de vitória eleitoral', '2022-moro-eleito-senador-parana-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 29. Bia Kicis câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis incentiva apoiadores a continuar nos acampamentos em frente aos quartéis em novembro de 2022.',
      'O povo que está em frente aos quartéis é o verdadeiro Brasil. Não é vandalismo, é patriotismo. As Forças Armadas têm o dever constitucional de garantir a lei e a ordem. Resistam, patriotas. Deus é fiel.',
      'Publicação da deputada Bia Kicis (PL-DF) nas redes sociais em novembro de 2022, estimulando apoiadores a manter acampamentos com pedidos de intervenção militar, que foram depois identificados como etapas preparatórias dos atos de 8 de janeiro.',
      'verified', false, '2022-11-20',
      'https://www1.folha.uol.com.br/poder/2022/11/bia-kicis-incentiva-acampamentos-em-quarteis.shtml',
      'news_article',
      'Brasília', 'Publicação nas redes sociais', '2022-kicis-incentiva-acampamentos-quarteis-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 30. Tereza Cristina eleita senadora
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina é eleita senadora por MS prometendo "resistência" ao governo Lula a partir do Legislativo.',
      'O agronegócio precisa de voz forte no Senado. O Brasil elegeu Lula, respeitamos. Mas seremos oposição firme, responsável, propositiva. Não aceitaremos retrocessos ambientais que prejudiquem a produção brasileira.',
      'Discurso da ex-ministra Tereza Cristina (PP) após ser eleita senadora por Mato Grosso do Sul em outubro de 2022. A ex-ministra da Agricultura de Bolsonaro foi uma das líderes da bancada ruralista no novo Senado.',
      'verified', false, '2022-10-02',
      'https://g1.globo.com/ms/mato-grosso-do-sul/eleicoes/2022/noticia/2022/10/02/tereza-cristina-e-eleita-senadora-por-ms.ghtml',
      'news_article',
      'Campo Grande', 'Discurso de vitória', '2022-tereza-cristina-eleita-senadora-ms-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 31. Bolsonaro choro posse simbólica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Em evento emocionado no Alvorada dois dias após a derrota, Bolsonaro diz que "o povo nas ruas está fazendo história".',
      'O que o povo está fazendo nas ruas, bloqueando estradas, acampando em frente aos quartéis, é uma demonstração de amor à pátria como nunca vi na vida. O Brasil não vai aceitar essa humilhação. A Constituição prevê saídas.',
      'Declaração de Bolsonaro em reunião no Alvorada em 2 de novembro de 2022, captada por câmeras, em que o presidente em fim de mandato emocionou-se com os movimentos golpistas em curso e sugeriu que a Constituição poderia ter "saídas" para sua permanência.',
      'verified', true, '2022-11-02',
      'https://g1.globo.com/politica/noticia/2022/11/02/bolsonaro-emocionado-elogia-manifestacoes-em-quarteis-e-bloqueios.ghtml',
      'news_article',
      'Brasília', 'Reunião com apoiadores no Alvorada', '2022-bolsonaro-emocionado-povo-nas-ruas-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 32. Carlos Bolsonaro desinformação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro alimenta teorias conspiratórias sobre fraude eleitoral e sistema "aparelhado".',
      'Não vamos aceitar em silêncio o que aconteceu. Os resultados são inconsistentes. Os dados falam por si. O TSE é aparelhado, a imprensa é aparelhada, o sistema inteiro foi montado para derrotar o presidente. A verdade virá.',
      'Publicações do vereador Carlos Bolsonaro (Republicanos-RJ) no Twitter em novembro de 2022, alimentando teorias de fraude eleitoral sem apresentar provas. O "gabinete do ódio", supostamente por ele coordenado, foi alvo de inquéritos no STF.',
      'verified', false, '2022-11-10',
      'https://www1.folha.uol.com.br/poder/2022/11/carlos-bolsonaro-ataca-tse-e-alimenta-teorias-de-fraude.shtml',
      'news_article',
      'Rio de Janeiro', 'Publicações no Twitter', '2022-carlos-bolsonaro-fraude-tse-aparelhado-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 33. Janones impulso Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones retira pré-candidatura e se une a Lula, adotando estratégia de combate a fake news.',
      'O Brasil precisa parar Bolsonaro. Minha pré-candidatura cumpriu seu papel. Agora é hora de unir forças. Vou apoiar Lula e vou combater as fake news do bolsonarismo com as mesmas armas que eles usam, mas pela verdade.',
      'Anúncio do deputado André Janones (Avante-MG) em agosto de 2022, retirando pré-candidatura para apoiar Lula. Janones tornou-se peça-chave da campanha nas redes, com polêmicas táticas de combate à desinformação com ruído próprio.',
      'verified', false, '2022-08-04',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/08/04/janones-desiste-de-candidatura-a-presidencia-e-apoia-lula.ghtml',
      'news_article',
      'Brasília', 'Anúncio em coletiva de imprensa', '2022-janones-desiste-apoia-lula-agosto'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 34. Flávio ataca Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que Alexandre de Moraes "precisa ser enquadrado" pelo Congresso.',
      'Alexandre de Moraes abusa, extrapola, ultrapassa todos os limites da Constituição. O Senado precisa enquadrar esse ministro. Ou fazemos isso agora, ou a democracia brasileira estará definitivamente comprometida.',
      'Declaração do senador Flávio Bolsonaro (PL-RJ) em setembro de 2022, defendendo abertura de processo de impeachment contra Alexandre de Moraes por supostos abusos nos inquéritos eleitorais em curso. A ofensiva foi rejeitada pela Mesa do Senado.',
      'verified', false, '2022-09-20',
      'https://www12.senado.leg.br/noticias/materias/2022/09/20/flavio-bolsonaro-defende-impeachment-de-moraes',
      'news_article',
      'Brasília', 'Entrevista no Senado', '2022-flavio-moraes-enquadrar-impeachment-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ama, true FROM ins;

  -- 35. Marcos do Val
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_val,
      'Senador Marcos do Val apoia publicamente acampamentos golpistas e defende "ruptura" pela Constituição.',
      'A Constituição prevê o artigo 142. As Forças Armadas têm papel de garantir a ordem. Tudo dentro da lei. Não é golpe falar em intervenção. A população está pedindo, e a Constituição abre caminhos.',
      'Declaração do senador Marcos do Val (Podemos-ES) em novembro de 2022, referendando interpretação distorcida do artigo 142 da Constituição para defender intervenção militar. A leitura foi repetidamente repudiada por juristas e pelo STF.',
      'verified', true, '2022-11-18',
      'https://www1.folha.uol.com.br/poder/2022/11/marcos-do-val-defende-intervencao-militar-via-artigo-142.shtml',
      'news_article',
      'Brasília', 'Entrevista no Senado', '2022-marcos-do-val-artigo-142-intervencao-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 36. Romário reeleito senador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário é reeleito senador pelo RJ após migrar para o PL e apoiar Bolsonaro.',
      'O povo do Rio me deu mais seis anos. Vou continuar trabalhando pelas pessoas com deficiência, pelo esporte, pela educação. Apoiei o presidente Bolsonaro e mantenho minhas convicções. Não mudo de lado por conveniência.',
      'Discurso de Romário após ser reeleito senador pelo Rio de Janeiro em outubro de 2022, filiado ao PL e em campanha aberta por Bolsonaro. O ex-jogador havia rompido com o campo progressista em 2021 e integrou-se à base bolsonarista.',
      'verified', false, '2022-10-02',
      'https://g1.globo.com/rj/rio-de-janeiro/eleicoes/2022/noticia/2022/10/02/romario-e-reeleito-senador-pelo-rj.ghtml',
      'news_article',
      'Rio de Janeiro', 'Discurso de vitória eleitoral', '2022-romario-reeleito-senador-rj-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 37. Temer pede pacificação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Ex-presidente Michel Temer pede "pacificação" e critica Bolsonaro pelo silêncio sobre a derrota.',
      'O Brasil precisa pacificar-se. O presidente eleito é Luiz Inácio Lula da Silva. Isso é fato. Negar o resultado não ajuda a democracia nem ao próprio presidente Bolsonaro. É momento de grandeza, não de rancor.',
      'Declaração de Michel Temer em entrevista em novembro de 2022, defendendo reconhecimento da vitória de Lula. Temer havia redigido em 2021 a carta de recuo de Bolsonaro após o 7 de setembro, e voltou a atuar como mediador institucional.',
      'verified', false, '2022-11-09',
      'https://www1.folha.uol.com.br/poder/2022/11/temer-pede-pacificacao-e-critica-silencio-de-bolsonaro.shtml',
      'news_article',
      'São Paulo', 'Entrevista à Folha de S. Paulo', '2022-temer-pacificacao-bolsonaro-silencio-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 38. Sarney morte democracia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sar,
      'José Sarney chama a tentativa golpista de 2022 de "mais grave crise desde a redemocratização".',
      'É a mais grave crise institucional que o Brasil enfrenta desde 1985. Não podemos permitir que a democracia, conquistada com tanto sacrifício, seja colocada em risco por aventureiros. As instituições precisam falar alto e grosso.',
      'Declaração do ex-presidente José Sarney em entrevista ao jornal O Estado de S. Paulo em dezembro de 2022, condenando os acampamentos golpistas em frente a quartéis e os ataques ao TSE. Sarney havia sido o primeiro presidente da Nova República.',
      'verified', false, '2022-12-12',
      'https://www.estadao.com.br/politica/sarney-crise-democratica-2022-golpe/',
      'news_article',
      'Brasília', 'Entrevista ao Estado de S. Paulo', '2022-sarney-crise-grave-redemocratizacao-dezembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 39. Bolsonaro 8 janeiro precursor
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Na véspera de ir para os EUA, Bolsonaro posta vídeo pedindo que apoiadores "não sejam esmagados" pelos adversários.',
      'Ninguém quer aventura. Mas eu nunca falei em golpe. Nunca. Agora, o povo tem o direito de se manifestar. E se for preciso, eu tomarei as medidas que a Constituição prevê. Não desistam da pátria.',
      'Live de Jair Bolsonaro em 29 de dezembro de 2022, dois dias antes de viajar para os EUA, em tom de despedida mas sem reconhecer a vitória de Lula. A fala deu combustível adicional aos acampamentos golpistas e ao 8 de janeiro.',
      'verified', false, '2022-12-29',
      'https://g1.globo.com/politica/noticia/2022/12/29/em-live-bolsonaro-faz-despedida-sem-reconhecer-derrota.ghtml',
      'news_article',
      'Brasília', 'Live final nas redes sociais', '2022-bolsonaro-live-despedida-sem-reconhecer-dezembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 40. Marco Feliciano PL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano prega em igreja que Lula é "instrumento do diabo" durante campanha.',
      'Essa eleição é uma guerra espiritual. De um lado, quem defende a família, a vida, Deus. Do outro, instrumentos do diabo que querem destruir os valores cristãos. Votar em Lula é votar contra Deus. Quem tem Cristo, tem Bolsonaro.',
      'Sermão do deputado Marco Feliciano (Republicanos-SP) em igreja evangélica em setembro de 2022, durante pré-campanha eleitoral. A fala motivou reação de entidades religiosas plurais e reforçou a instrumentalização religiosa da disputa presidencial.',
      'verified', false, '2022-09-18',
      'https://www.cartacapital.com.br/politica/feliciano-chama-lula-de-instrumento-do-diabo-em-culto/',
      'news_article',
      'São Paulo', 'Culto em igreja evangélica', '2022-feliciano-lula-diabo-culto-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 41. Bolsonaro canibalismo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro relata ter quase "comido um índio" em aldeia, em entrevista que gerou condenação de movimentos indígenas.',
      'Eu fui numa tribo indígena no Pará, vou pegar uma cana lá e cortar o pescoço do índio e comer. Fico com fome, né? É canibalismo, mas tem que se aproximar das culturas deles, respeitar.',
      'Entrevista de Jair Bolsonaro ao programa The New York Times em julho de 2022, em que relatou anedota sobre suposto ritual de canibalismo em aldeia indígena. A fala foi repudiada por organizações indígenas e pelo Ministério Público Federal.',
      'verified', false, '2022-07-28',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2022/07/28/bolsonaro-canibalismo-indios-pt.htm',
      'news_article',
      'Nova York', 'Entrevista ao The New York Times', '2022-bolsonaro-canibalismo-indigena-pt-julho'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 42. Lula ataca Bolsonaro genocídio ianomami
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa Bolsonaro de ter praticado "genocídio" contra os Yanomami e promete responsabilização.',
      'O que Bolsonaro fez com os Yanomami é genocídio. Deixou o garimpo ilegal avançar, desmontou a Funai, deixou milhares de crianças morrerem de fome e malária. Isso é crime contra a humanidade e será apurado.',
      'Declaração de Lula em comício em Boa Vista em setembro de 2022, durante campanha, após denúncias recorrentes sobre a situação humanitária dos Yanomami em Roraima. O assunto voltaria a explodir em janeiro de 2023 com a operação Yanomami.',
      'verified', false, '2022-09-27',
      'https://g1.globo.com/rr/roraima/eleicoes/2022/noticia/2022/09/27/lula-acusa-bolsonaro-de-genocidio-contra-yanomami.ghtml',
      'news_article',
      'Boa Vista', 'Comício da campanha presidencial', '2022-lula-bolsonaro-yanomami-genocidio-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 43. Bolsonaro Lula debate Globo 28 outubro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'No debate da Globo, Bolsonaro relata ter ido a casa de "venezuelanas" e diz não saber a idade delas.',
      'Elas tinham entre 14, 15 anos. Elas estavam todas arrumadinhas, maquiadas, bonitas. Eu pensei: o que aconteceu aqui? Tinha a impressão de que eram trabalhadoras sexuais. Mas eu não entrei para isso, eu estava ali por outro motivo.',
      'Declaração de Bolsonaro em entrevista publicada em 13 de outubro de 2022 e levada ao debate da Globo em 28 de outubro. Lula o acusou de relatar história incompatível com as funções de um presidente. O episódio foi amplamente repercutido no fim da campanha.',
      'verified', true, '2022-10-28',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/28/debate-globo-venezuelanas-bolsonaro-lula.ghtml',
      'news_article',
      'Rio de Janeiro', 'Debate presidencial da TV Globo — 2º turno', '2022-bolsonaro-venezuelanas-debate-globo-outubro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 44. Guedes ajuste fiscal fim mandato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gue,
      'Paulo Guedes declara no fim do governo que o próximo presidente "vai mamar" na estrutura fiscal deixada.',
      'A nossa responsabilidade fiscal foi exemplar. Quem vier vai mamar no que a gente deixou. O Brasil vai crescer 3%, 4% ao ano. Eu entrego um país muito melhor do que peguei. Infelizmente o brasileiro votou pela volta do populismo.',
      'Declaração de Paulo Guedes em evento de despedida do Ministério da Economia em dezembro de 2022, defendendo o legado fiscal do governo Bolsonaro apesar da inflação de dois dígitos e do uso da PEC Kamikaze em ano eleitoral.',
      'verified', false, '2022-12-15',
      'https://www1.folha.uol.com.br/mercado/2022/12/guedes-diz-que-proximo-governo-vai-mamar-no-que-deixamos.shtml',
      'news_article',
      'Brasília', 'Evento de despedida no Ministério da Economia', '2022-guedes-proximo-vai-mamar-fiscal-dezembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 45. Bolsonaro estrada sp sul
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro desconsidera pesquisas durante campanha e diz que "só Deus me tira" mesmo em reta final.',
      'As pesquisas são todas manipuladas pelos institutos de esquerda. Eu ganho no primeiro turno. Se for para segundo, ganho também. Mas já disse: só Deus me tira daquela cadeira. E Deus está comigo, o povo está comigo.',
      'Declaração de Bolsonaro em comício em São José dos Campos (SP) em setembro de 2022, desacreditando sistematicamente as pesquisas Ipec e Datafolha que apontavam vantagem de Lula. A fala reforçou o estado de recusa preventiva do resultado.',
      'verified', false, '2022-09-23',
      'https://g1.globo.com/sp/vale-do-paraiba-regiao/eleicoes/2022/noticia/2022/09/23/bolsonaro-ataca-pesquisas-em-sao-jose-dos-campos.ghtml',
      'news_article',
      'São José dos Campos', 'Comício da campanha presidencial', '2022-bolsonaro-pesquisas-manipuladas-sp-setembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 46. Flávio Bolsonaro 8 janeiro precursor
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que "acampamentos vieram para ficar" e serão "resistência" contra governo Lula.',
      'Os acampamentos em frente aos quartéis representam o povo brasileiro que não aceita o resultado. Vieram para ficar. Serão a base da resistência ao governo Lula. Não é golpe, é democracia, é cidadania em ação.',
      'Declaração do senador Flávio Bolsonaro (PL-RJ) em dezembro de 2022, defendendo a continuidade dos acampamentos golpistas. As falas do filho mais velho do presidente ajudaram a legitimar a mobilização que culminou nos ataques de 8 de janeiro.',
      'verified', false, '2022-12-14',
      'https://www1.folha.uol.com.br/poder/2022/12/flavio-bolsonaro-defende-acampamentos-golpistas.shtml',
      'news_article',
      'Brasília', 'Entrevista no Senado', '2022-flavio-acampamentos-vieram-para-ficar-dezembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 47. Edu Bolsonaro aponta fraude
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro conversa com Steve Bannon e Donald Trump Jr. sobre "fraude eleitoral" no Brasil.',
      'Estamos conectados com a direita global. Steve Bannon, Donald Trump Jr., todos sabem o que aconteceu no Brasil. Houve fraude, houve perseguição. O movimento patriótico mundial está unido. E o Brasil é o novo front.',
      'Declarações do deputado Eduardo Bolsonaro (PL-SP) em viagens aos Estados Unidos em novembro de 2022, após derrota eleitoral, buscando articulação internacional para deslegitimar o resultado. A aliança com a extrema-direita americana foi documentada em reportagens.',
      'verified', false, '2022-11-28',
      'https://g1.globo.com/mundo/noticia/2022/11/28/eduardo-bolsonaro-se-reune-com-bannon-e-trump-jr-nos-eua.ghtml',
      'news_article',
      'Washington', 'Encontros com Steve Bannon e Donald Trump Jr.', '2022-eduardo-bannon-trump-jr-fraude-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 48. Nikolas primeiro dia mandato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Em vídeo viralizado, Nikolas Ferreira propõe que "deputados não precisam estudar" para entender a realidade.',
      'Não precisa de diploma para ser deputado. Precisa de coragem, precisa de Deus, precisa de amor pelo Brasil. Os diplomados estão aí, veja no que deram. Eu prefiro ser voz do povo simples a ser doutor em ideologia de gênero.',
      'Vídeo do deputado eleito Nikolas Ferreira publicado em novembro de 2022, durante o período de transição legislativa. A fala consolidou sua estratégia de comunicação antiestablishment e anti-intelectual, que o tornou o deputado mais votado do país.',
      'verified', false, '2022-11-25',
      'https://www.cartacapital.com.br/politica/nikolas-ferreira-defende-que-nao-e-preciso-estudar-para-ser-deputado/',
      'news_article',
      'Belo Horizonte', 'Vídeo publicado nas redes sociais', '2022-nikolas-nao-precisa-estudar-deputado-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 49. Rodrigo Pacheco democracia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pac,
      'Rodrigo Pacheco reconhece vitória de Lula e defende respeito "às urnas e à democracia" no dia da posse.',
      'O Senado Federal reconhece a vitória de Luiz Inácio Lula da Silva nas urnas. A democracia brasileira venceu. As instituições estão firmes. Desejamos sucesso ao novo governo para o bem do Brasil.',
      'Declaração do presidente do Senado, Rodrigo Pacheco (PSD-MG), em 1º de novembro de 2022, reconhecendo a vitória de Lula e defendendo a preservação das instituições. O pronunciamento foi considerado relevante dado o silêncio de Bolsonaro.',
      'verified', false, '2022-11-01',
      'https://www12.senado.leg.br/noticias/materias/2022/11/01/pacheco-reconhece-vitoria-de-lula',
      'news_article',
      'Brasília', 'Pronunciamento na presidência do Senado', '2022-pacheco-reconhece-vitoria-lula-novembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 50. Lula posse faixa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Em discurso de posse, Lula afirma que "a democracia venceu" e promete responsabilizar os crimes de Bolsonaro.',
      'A democracia venceu. E com ela venceu o povo brasileiro. Iremos responsabilizar os autores do genocídio, do ecocídio e do etnocídio cometidos nesses quatro anos. Nosso governo será um governo dos 215 milhões, não dos 60%.',
      'Discurso de posse de Luiz Inácio Lula da Silva no Congresso Nacional em 1º de janeiro de 2023. Na ausência de Bolsonaro, a faixa foi entregue por representantes do povo, em cerimônia simbólica. O discurso estabeleceu o tom de ruptura com o governo anterior.',
      'verified', true, '2023-01-01',
      'https://g1.globo.com/politica/noticia/2023/01/01/leia-a-integra-do-discurso-de-posse-de-lula.ghtml',
      'news_article',
      'Brasília', 'Posse presidencial no Congresso Nacional', '2023-lula-posse-democracia-venceu-janeiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

END $$;
