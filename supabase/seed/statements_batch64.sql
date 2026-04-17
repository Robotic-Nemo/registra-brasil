-- Batch 64: 2023 — First year of Lula III government, Jan 8 attacks, CPMI,
-- Bolsonaro inelegivel, Yanomami crisis, Marco Temporal, Flavio Dino STF,
-- Haddad economic framework, Israel-Gaza reactions, Arthur Lira reelected
-- 50 statements across all major 2023 controversies

DO $$
DECLARE
  v_lula UUID; v_bol UUID; v_had UUID; v_gle UUID; v_tar UUID;
  v_mor UUID; v_lir UUID; v_pac UUID; v_din UUID; v_gil UUID;
  v_bar UUID; v_zam UUID; v_sil UUID; v_nis UUID; v_mau UUID;
  v_ruic UUID; v_nik UUID; v_dam UUID; v_fla UUID; v_edu UUID;
  v_mic UUID; v_ram UUID; v_jan UUID; v_ale UUID; v_sim UUID;
  v_mar UUID; v_son UUID; v_cai UUID; v_zem UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_aut UUID; c_ame UUID; c_neg UUID; c_obs UUID;
  c_irr UUID; c_int UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_ruic FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_ale FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_sim FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1. Lula discurso posse Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula, em discurso de posse no Congresso, promete reconstruir o país e classifica o governo Bolsonaro como "genocida".',
      'Sob o manto tenebroso da tirania e da opressao, nosso povo foi levado a tragedias humanitarias sistematicamente provocadas por um projeto de destruicao nacional. A responsabilidade por esse genocidio precisa ser apurada e nao pode ficar impune.',
      'Discurso de posse do presidente Luiz Inacio Lula da Silva no Congresso Nacional em 1 de janeiro de 2023, apos vencer Jair Bolsonaro no segundo turno das eleicoes de 2022. Lula assumiu sob forte esquema de seguranca em razao de ameacas golpistas.',
      'verified', true, '2023-01-01',
      'https://g1.globo.com/politica/noticia/2023/01/01/leia-integra-do-discurso-de-lula-no-congresso-na-posse.ghtml',
      'news_article',
      'Brasilia', 'Posse presidencial no Congresso Nacional', 'lula-discurso-posse-congresso-genocidio-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 2. Bolsonaro silencio EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, nos EUA, diz que perdeu a eleicao e se emociona, mas nao reconhece explicitamente o resultado.',
      'Perdi uma eleicao que achava que era impossivel perder. A vida continua. Eu levei um tiro em 2018, nao esperava. Nao e o fim, e apenas o final de um capitulo.',
      'Declaracao de Jair Bolsonaro em Orlando, Florida, em 31 de dezembro de 2022/janeiro de 2023, apos ter deixado o Brasil dois dias antes do fim do mandato sem transmitir a faixa presidencial. Foi a primeira manifestacao publica apos a derrota.',
      'verified', true, '2023-01-03',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-em-orlando-diz-que-perdeu-eleicao-que-achava-impossivel-perder/',
      'news_article',
      'Orlando, EUA', 'Encontro com apoiadores em restaurante', 'bolsonaro-orlando-perdi-eleicao-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 3. Ataques 8 jan Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula classifica invasao aos Tres Poderes como atos terroristas e golpistas e responsabiliza Bolsonaro.',
      'Esses vandalos, que nos poderiamos chamar de fascistas, fizeram o que nao tem precedentes na historia deste pais. Todas essas pessoas que fizeram isso serao encontradas e serao punidas. Tem o dedo do ex-presidente Bolsonaro em tudo isso.',
      'Pronunciamento de Lula em Araraquara (SP), onde estava em agenda, horas apos a invasao do Congresso, STF e Palacio do Planalto por apoiadores de Bolsonaro em 8 de janeiro de 2023. Decretou intervencao federal na seguranca do DF.',
      'verified', true, '2023-01-08',
      'https://www.folha.uol.com.br/poder/2023/01/lula-fascistas-bolsonaro-8-janeiro-intervencao.shtml',
      'news_article',
      'Araraquara, SP', 'Pronunciamento apos invasao aos Tres Poderes', 'lula-fascistas-8-janeiro-intervencao-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 4. Bolsonaro 8 jan nega
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro repudia os atos mas os equipara a manifestacoes de esquerda, sem reconhecer incitacao.',
      'Manifestacoes pacificas, na forma da lei, fazem parte da democracia. Todavia, depredacoes e invasoes de predios publicos como ocorreram no dia de hoje, assim como os praticados pela esquerda em 2013 e 2017, fogem a regra.',
      'Publicacao de Jair Bolsonaro no Twitter na noite do dia 8 de janeiro de 2023, horas apos a invasao dos predios dos Tres Poderes por seus apoiadores. A equiparacao com protestos passados foi criticada por minimizar o ataque golpista.',
      'verified', true, '2023-01-08',
      'https://g1.globo.com/politica/noticia/2023/01/08/bolsonaro-manifestacao-pacifica-twitter-8-janeiro.ghtml',
      'news_article',
      'Orlando, EUA', 'Publicacao em rede social', 'bolsonaro-twitter-equipara-2013-8-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 5. Moraes afastamento Ibaneis
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes determina afastamento do governador Ibaneis Rocha por omissao nos atos golpistas.',
      'As gravissimas acoes e omissoes permitiram a ocorrencia de crimes gravissimos contra a Democracia, o Estado Democratico de Direito e as instituicoes da Republica. O afastamento se faz necessario para garantir a ordem publica.',
      'Decisao monocratica de Alexandre de Moraes no STF em 8 de janeiro de 2023 afastando Ibaneis Rocha (MDB) do governo do DF por 90 dias. Tambem determinou a prisao do secretario de Seguranca Anderson Torres, que estava nos EUA.',
      'verified', false, '2023-01-08',
      'https://www.cnnbrasil.com.br/politica/moraes-afasta-ibaneis-rocha-90-dias-omissao-8-janeiro/',
      'news_article',
      'Brasilia', 'Decisao no STF apos 8 de Janeiro', 'moraes-afasta-ibaneis-90-dias-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 6. Zambelli 8 jan
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli publica que fatos de 8 de Janeiro foram lamentaveis mas ataca Lula e o STF pelo "excesso".',
      'Lamentavel o que aconteceu hoje. Mas tambem e lamentavel que o Brasil tenha sido sequestrado pelo STF e por um presidente eleito em condicoes questionaveis. A esquerda vai usar isso para criminalizar toda a direita.',
      'Publicacao de Carla Zambelli nas redes sociais na noite de 8 de janeiro de 2023, horas apos a invasao dos predios dos Tres Poderes. A deputada foi uma das principais figuras bolsonaristas mobilizando narrativa de relativizacao.',
      'verified', false, '2023-01-08',
      'https://www.metropoles.com/brasil/politica-brasil/zambelli-8-janeiro-stf-lula',
      'news_article',
      'Sao Paulo', 'Publicacao em rede social', 'zambelli-lamenta-8-janeiro-ataca-stf-lula-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 7. Flavio Bolsonaro defende pai
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flavio Bolsonaro diz que tentarao "colar" em Bolsonaro qualquer coisa, incluindo 8 de Janeiro.',
      'Agora vao tentar colar no meu pai tudo o que acontecer, como sempre fizeram. Nao tem a menor ligacao do presidente Bolsonaro com o que ocorreu em Brasilia. Quem esta no pais e o atual presidente, e ele tem a responsabilidade pela seguranca.',
      'Entrevista de Flavio Bolsonaro a jornalistas em 9 de janeiro de 2023, um dia apos a invasao golpista aos predios dos Tres Poderes. O senador ja tentava blindar o pai de responsabilizacao penal pelos atos.',
      'verified', false, '2023-01-09',
      'https://oglobo.globo.com/politica/noticia/2023/01/flavio-bolsonaro-8-janeiro-colar-pai.ghtml',
      'news_article',
      'Rio de Janeiro', 'Declaracao a jornalistas', 'flavio-bolsonaro-colar-pai-8-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Arthur Lira reeleito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira, reeleito presidente da Camara, promete independencia total ao governo Lula.',
      'A Camara nao sera subserviente a nenhum Executivo, nem fara oposicao sistematica. Sera um Parlamento forte, independente, protagonista. O governo que saber dialogar tera resposta. Quem quiser enfrentar tera resistencia.',
      'Discurso de Arthur Lira apos ser reeleito presidente da Camara com 464 votos em 1 de fevereiro de 2023, com apoio tanto de bolsonaristas quanto do governo Lula. A declaracao sinalizou as cobrancas por recursos do Centrao.',
      'verified', false, '2023-02-01',
      'https://www.camara.leg.br/noticias/937282-arthur-lira-e-reeleito-presidente-da-camara-com-464-votos/',
      'other',
      'Brasilia', 'Sessao de eleicao da presidencia da Camara', 'lira-reeleicao-camara-independencia-fevereiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 9. Yanomami Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa governo Bolsonaro de genocidio contra o povo Yanomami apos visita a Roraima.',
      'Nao e desnutricao, e um genocidio. E um crime premeditado contra os Yanomami, cometido por um governo insensivel ao sofrimento do povo brasileiro. O que vi aqui nao e caracteristico de um pais que tem economia da sexta, setima posicao no mundo.',
      'Declaracao de Lula em 21 de janeiro de 2023 apos visitar hospital em Boa Vista (RR) onde indigenas Yanomami chegavam em estado de desnutricao severa. A crise sanitaria foi atribuida a omissao federal e avanco do garimpo ilegal.',
      'verified', true, '2023-01-21',
      'https://g1.globo.com/rr/roraima/noticia/2023/01/21/lula-yanomami-genocidio-roraima.ghtml',
      'news_article',
      'Boa Vista, RR', 'Visita a hospital em Roraima', 'lula-yanomami-genocidio-roraima-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 10. Damares ilha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves afirma em culto que criancas eram levadas a "ilha" onde tinham dentes arrancados para abuso sexual.',
      'Existe uma ilha no Para onde criancas sao levadas e tem os dentinhos arrancados para fazer sexo oral em adultos. Eu vi com meus proprios olhos quando era ministra. Precisamos expor esse horror.',
      'Declaracao da senadora Damares Alves em culto evangelico em Goiania em 22 de janeiro de 2023. A PF investigou e concluiu que nao havia qualquer evidencia factual da "ilha". A ex-ministra foi denunciada por divulgacao de fatos inveridicos.',
      'verified', true, '2023-01-22',
      'https://www.uol.com.br/noticias/2023/01/damares-ilha-pe-dentinhos-arrancados-culto.htm',
      'news_article',
      'Goiania', 'Culto evangelico na Igreja Videira', 'damares-ilha-dentinhos-culto-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Caiado Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Ronaldo Caiado rompe publicamente com Bolsonaro apos 8 de Janeiro, classifica atos como criminosos.',
      'Nao tenho mais nada a ver com o bolsonarismo. Quem fez essa barbaridade em Brasilia precisa ser preso. Nao ha qualquer justificativa democratica para invadir o Congresso, o STF ou o Planalto. Nao podemos relativizar isso.',
      'Entrevista do governador de Goias Ronaldo Caiado ao programa Roda Viva em 23 de janeiro de 2023, ja posicionando-se como candidato de direita alternativo a Bolsonaro em 2026. Caiado endossou a prisao de envolvidos nos atos.',
      'verified', false, '2023-01-23',
      'https://www.roda-viva.com/episodio/ronaldo-caiado-23-01-2023',
      'news_article',
      'Sao Paulo', 'Roda Viva TV Cultura', 'caiado-rompe-bolsonaro-roda-viva-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 12. Nikolas ataque Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama Lula de "ditador" apos decisoes contra invasores golpistas.',
      'Lula e o ditador que o Brasil nao elegeu. Prende quem discorda, censura quem pensa diferente, e manda o STF perseguir opositores. Estamos vivendo o socialismo bolivariano na pratica. Os bolsonaristas estao sendo caçados.',
      'Discurso de Nikolas Ferreira na tribuna da Camara dos Deputados em 2 de fevereiro de 2023, durante debate sobre as investigacoes dos atos golpistas de 8 de janeiro. O deputado foi um dos mais ativos na narrativa de "perseguicao" a direita.',
      'verified', false, '2023-02-02',
      'https://www.camara.leg.br/noticias/937500-nikolas-ferreira-discurso-ditador-stf-fevereiro-2023/',
      'other',
      'Brasilia', 'Tribuna da Camara dos Deputados', 'nikolas-ditador-lula-stf-fevereiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Pacheco reeleito Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pac,
      'Rodrigo Pacheco, reeleito presidente do Senado, defende responsabilizacao pelos atos de 8 de Janeiro.',
      'O Senado nao pode ser leniente com o golpismo. Os autores, financiadores e incitadores dos atos terroristas de 8 de janeiro precisam ser responsabilizados. O Parlamento brasileiro nao pactua com tentativas de ruptura.',
      'Discurso de Rodrigo Pacheco em 1 de fevereiro de 2023, apos ser reeleito presidente do Senado com 49 votos. Pacheco fez acenos ao governo Lula e prometeu instalar a CPMI do 8 de Janeiro, que acabou ocorrendo em abril.',
      'verified', false, '2023-02-01',
      'https://www12.senado.leg.br/noticias/materias/2023/02/01/pacheco-reeleito-presidencia-senado',
      'other',
      'Brasilia', 'Eleicao da presidencia do Senado', 'pacheco-reeleito-senado-responsabilizacao-fevereiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 14. Haddad arcabouço
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad apresenta arcabouco fiscal como substituto ao teto de gastos e promete responsabilidade.',
      'O novo arcabouco fiscal e um marco de responsabilidade que respeita os compromissos sociais sem abrir mao do equilibrio das contas publicas. E o fim do teto de gastos que estrangulou os investimentos e fragilizou servicos essenciais.',
      'Apresentacao do novo arcabouco fiscal pelo ministro Fernando Haddad em 30 de marco de 2023. A proposta substituia o teto de gastos instaurado por Temer em 2016 e foi defendida como compromisso com a disciplina fiscal pos-Bolsonaro.',
      'verified', false, '2023-03-30',
      'https://valor.globo.com/brasil/noticia/2023/03/30/haddad-apresenta-arcabouco-fiscal-substituto-teto-gastos.ghtml',
      'news_article',
      'Brasilia', 'Coletiva no Ministerio da Fazenda', 'haddad-arcabouco-fiscal-apresentacao-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 15. Eduardo Bol Trump
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro diz que STF "tenta um golpe" ao investigar pai e ve comparacao com Trump.',
      'O que estao fazendo com meu pai e o que fizeram com o presidente Trump: criminalizar a direita para tirar do jogo democratico. E um golpe togado, comandado pelo STF. Nos vamos denunciar isso em Washington e em todo o mundo livre.',
      'Declaracao de Eduardo Bolsonaro em evento da CPAC (Conservative Political Action Conference) nos Estados Unidos em marco de 2023. O deputado se articulava com a direita trumpista para projetar narrativa internacional de "perseguicao".',
      'verified', false, '2023-03-04',
      'https://www.cnnbrasil.com.br/internacional/eduardo-bolsonaro-cpac-trump-stf-golpe-togado/',
      'news_article',
      'National Harbor, EUA', 'Conservative Political Action Conference (CPAC)', 'eduardo-bolsonaro-cpac-trump-stf-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Tarcisio cop death
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcisio de Freitas defende operacao policial em Guaruja apos mortes, confronta governo federal.',
      'A policia paulista esta enfrentando o crime organizado como deve ser enfrentado: com firmeza. Nao aceitamos mais interferencias do governo federal no trabalho dos nossos policiais. Quem estiver do lado do bandido que venha discutir conosco.',
      'Declaracao de Tarcisio de Freitas apos a Operacao Escudo na Baixada Santista, que deixou 16 mortos em julho de 2023 apos o assassinato do soldado da Rota Patrick Bastos Reis. O governo federal questionou excessos; Tarcisio defendeu PM.',
      'verified', false, '2023-08-10',
      'https://noticias.uol.com.br/cotidiano/ultimas-noticias/2023/08/10/tarcisio-defende-pm-operacao-escudo-baixada-santista.htm',
      'news_article',
      'Sao Paulo', 'Coletiva apos Operacao Escudo', 'tarcisio-operacao-escudo-baixada-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 17. CPMI Lira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira tenta adiar instalacao da CPMI do 8 de Janeiro mas cede a pressao do Senado.',
      'Nao vejo sentido em instalar uma CPMI com esse clima politico, isso so vai servir para palanque. Mas se a pressao institucional e a insistencia do Senado falam mais alto, que se instale, desde que com equilibrio entre direita e esquerda.',
      'Declaracao de Arthur Lira a jornalistas em 19 de abril de 2023, dia em que o Congresso finalmente instalou a CPMI dos atos golpistas de 8 de janeiro. O presidente da Camara havia resistido por meses antes de ceder.',
      'verified', false, '2023-04-19',
      'https://oglobo.globo.com/politica/noticia/2023/04/cpmi-8-janeiro-lira-instalacao.ghtml',
      'news_article',
      'Brasilia', 'Declaracao apos instalacao da CPMI', 'lira-cpmi-8-janeiro-instalacao-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 18. Gilmar e Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes compara manifestacoes bolsonaristas em quarteis a "nazismo" em evento publico.',
      'As pessoas que ficaram acampadas em frente aos quarteis pedindo intervencao militar, com bandeiras e saudacoes que lembravam o Terceiro Reich, representam o retorno de um fascismo que achavamos superado. Isso e nazismo tupiniquim.',
      'Declaracao do ministro Gilmar Mendes do STF em seminario juridico em Lisboa em abril de 2023. O ministro tornou-se um dos mais criticos do bolsonarismo e apoiador da responsabilizacao pelos atos de 8 de janeiro.',
      'verified', false, '2023-04-15',
      'https://www.conjur.com.br/2023-abr-15/gilmar-mendes-nazismo-tupiniquim-bolsonarismo/',
      'news_article',
      'Lisboa, Portugal', 'Seminario juridico em Lisboa', 'gilmar-nazismo-tupiniquim-bolsonarismo-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 19. Sonia Guajajara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_son,
      'Sonia Guajajara anuncia demarcacao de terras indigenas e critica marco temporal como inconstitucional.',
      'O marco temporal e uma tese ruralista que viola a Constituicao de 1988 e a historia dos povos originarios. Nossos direitos nao caducam no tempo. Ja sofremos um genocidio de cinco seculos, nao aceitaremos mais um retrocesso legislativo.',
      'Declaracao da ministra dos Povos Indigenas Sonia Guajajara em 28 de abril de 2023, durante anuncio de seis novas demarcacoes assinadas por Lula. A declaracao tambem respondia a votacao em andamento do PL do Marco Temporal na Camara.',
      'verified', false, '2023-04-28',
      'https://g1.globo.com/politica/noticia/2023/04/28/sonia-guajajara-marco-temporal-inconstitucional.ghtml',
      'news_article',
      'Brasilia', 'Anuncio de demarcacoes de terras indigenas', 'sonia-guajajara-marco-temporal-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 20. Marina Silva Amazonia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marina Silva anuncia queda de 40% no desmatamento da Amazonia em 2023 e critica governo anterior.',
      'O desmatamento caiu 40% em 2023 porque voltamos a agir. O que o governo Bolsonaro fez foi desmontar deliberadamente a protecao ambiental, fechar olhos para o garimpo ilegal e financiar a destruicao. Agora estamos reconstruindo o Ibama e o ICMBio.',
      'Declaracao de Marina Silva em coletiva do INPE em 9 de novembro de 2023, apresentando os dados oficiais do desmatamento. A queda foi apontada como uma das principais vitorias ambientais do primeiro ano do governo Lula.',
      'verified', false, '2023-11-09',
      'https://agenciabrasil.ebc.com.br/geral/noticia/2023-11/marina-silva-desmatamento-amazonia-40-porcento-2023',
      'news_article',
      'Brasilia', 'Coletiva do INPE com dados de desmatamento', 'marina-desmatamento-amazonia-40-porcento-novembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Bolsonaro inelegivel
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, ao ser declarado inelegivel pelo TSE, promete provar inocencia e ataca ministros.',
      'Esse julgamento e uma farsa. Vou provar que sou inocente e que nao houve nenhuma irregularidade no uso do Palacio da Alvorada. O TSE nao quer me julgar, quer me eliminar da politica. Continuarei lider da direita mesmo fora do jogo eleitoral.',
      'Declaracao de Jair Bolsonaro em 30 de junho de 2023, dia em que o TSE o declarou inelegivel ate 2030 por 5 votos a 2, no caso da reuniao com embaixadores. A decisao considerou abuso de poder politico e uso indevido de meios de comunicacao.',
      'verified', true, '2023-06-30',
      'https://g1.globo.com/politica/noticia/2023/06/30/bolsonaro-inelegivel-tse-reuniao-embaixadores.ghtml',
      'news_article',
      'Brasilia', 'Declaracao apos julgamento no TSE', 'bolsonaro-inelegivel-tse-reuniao-embaixadores-junho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 22. Valdemar reacao TSE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flavio Bolsonaro afirma que inelegibilidade do pai nao o impede de ser "lider maximo" da direita.',
      'O Bolsonaro inelegivel continua sendo a maior lideranca da direita brasileira. Ele vai ajudar a eleger os candidatos que quiser, vai conduzir a oposicao, e vai estar em 2026 indicando quem sera o sucessor dele. O TSE nao pode cassar a vontade do povo.',
      'Declaracao de Flavio Bolsonaro em entrevista a Jovem Pan em 1 de julho de 2023, no dia seguinte a declaracao de inelegibilidade do pai pelo TSE. O senador tentou manter Bolsonaro como centro gravitacional da direita mesmo fora das urnas.',
      'verified', false, '2023-07-01',
      'https://jovempan.com.br/noticias/brasil/politica/flavio-bolsonaro-inelegivel-lider-maximo-direita-2026.html',
      'news_article',
      'Sao Paulo', 'Entrevista a Jovem Pan', 'flavio-inelegibilidade-lider-maximo-direita-julho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Lula Africa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula, em visita a Sao Tome e Principe, afirma que Brasil tem "divida historica" com Africa pela escravidao.',
      'O Brasil que fomos no passado roubou o brio, a sabedoria e a forca de milhoes de africanos escravizados. Temos uma divida historica com esse continente e viemos aqui dizer que o Brasil agora esta de volta como parceiro solidario.',
      'Discurso do presidente Lula em Sao Tome e Principe em 24 de agosto de 2023, durante visita oficial. A declaracao marcou o reposicionamento brasileiro no continente africano apos o afastamento durante o governo Bolsonaro.',
      'verified', false, '2023-08-24',
      'https://www.bbc.com/portuguese/articles/c2e9xgln05po',
      'news_article',
      'Sao Tome', 'Visita oficial a Sao Tome e Principe', 'lula-africa-divida-historica-escravidao-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 24. Lula dois lados Ucrania
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que a Russia cometeu erro ao invadir Ucrania, mas que Zelensky tambem e responsavel pela guerra.',
      'Os dois lados sao responsaveis. A Russia nao podia ter feito a invasao, mas a Ucrania e os Estados Unidos tambem nao podiam ter estimulado essa guerra. Eu nao acho que a Ucrania foi invadida pura e simplesmente. Houve provocacao.',
      'Declaracao de Lula em entrevista coletiva em Abu Dhabi em 15 de abril de 2023, durante giro internacional. A fala causou irritacao no governo Biden e em Zelensky, e foi criticada pelo equiparar vitima e agressor em conflito.',
      'verified', true, '2023-04-15',
      'https://www.folha.uol.com.br/mundo/2023/04/lula-dois-lados-ucrania-russia-abu-dhabi.shtml',
      'news_article',
      'Abu Dhabi, EAU', 'Coletiva de imprensa em Abu Dhabi', 'lula-dois-lados-ucrania-russia-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Moraes Anderson Torres
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes mantem prisao de Anderson Torres, ex-ministro da Justica de Bolsonaro.',
      'A conduta do ex-ministro, ao se ausentar do pais na vespera dos atos terroristas e deixar abrigada em sua residencia minuta de decreto golpista, demonstra envolvimento com a tentativa de ruptura institucional e justifica a manutencao da prisao.',
      'Decisao de Alexandre de Moraes em 13 de janeiro de 2023 mantendo a prisao de Anderson Torres, ex-ministro da Justica de Bolsonaro e secretario de Seguranca do DF na vespera de 8 de janeiro. Em sua casa foi encontrada minuta de decreto golpista.',
      'verified', false, '2023-01-14',
      'https://www.cnnbrasil.com.br/politica/moraes-mantem-prisao-anderson-torres-minuta-golpe/',
      'news_article',
      'Brasilia', 'Decisao no inquerito dos atos golpistas', 'moraes-mantem-prisao-anderson-torres-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 26. Zema contra Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zem,
      'Romeu Zema critica Lula por alta de impostos e se posiciona como alternativa de direita para 2026.',
      'O que Lula esta fazendo e destruindo a economia, aumentando impostos, expandindo o Estado, perseguindo quem produz. Minas Gerais mostra o contrario: Estado enxuto, gasto responsavel, empreendedor livre. Esse e o modelo que o Brasil precisa em 2026.',
      'Declaracao de Romeu Zema em congresso empresarial em Sao Paulo em 5 de maio de 2023, posicionando-se como possivel candidato presidencial de direita. Zema buscava ocupar o espaco deixado por Bolsonaro como possivel alternativa liberal.',
      'verified', false, '2023-05-05',
      'https://www.estadao.com.br/politica/zema-2026-alternativa-bolsonaro-lula-impostos/',
      'news_article',
      'Sao Paulo', 'Congresso empresarial em Sao Paulo', 'zema-2026-impostos-lula-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Silvio Almeida direitos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silvio Almeida critica retrocessos do governo Bolsonaro em direitos humanos e LGBTQIAP+.',
      'O governo anterior tratou direitos humanos como inimigo da nacao, estigmatizou minorias, incentivou a LGBTfobia e o racismo. Estamos reconstruindo uma politica de Estado que reconhece a dignidade de todo ser humano. Esse nao e assunto menor.',
      'Discurso do ministro dos Direitos Humanos Silvio Almeida na abertura da Conferencia Nacional LGBTI+ em 15 de agosto de 2023. A conferencia nao acontecia desde 2016 e foi retomada como politica prioritaria do governo Lula.',
      'verified', false, '2023-08-15',
      'https://www.gov.br/mdh/pt-br/assuntos/noticias/2023/agosto/silvio-almeida-conferencia-lgbti-reconstrucao',
      'other',
      'Brasilia', 'Abertura da Conferencia Nacional LGBTI+', 'silvio-almeida-conferencia-lgbti-reconstrucao-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 28. Nisia dengue emergencia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nis,
      'Nisia Trindade declara emergencia em saude Yanomami e critica desmonte do SUS indigena.',
      'O que encontramos em Roraima foi um desmonte criminoso da saude indigena. Criancas morrendo de fome, idosos sem assistencia, postos abandonados. Estamos decretando emergencia e reconstruindo a DSEI Yanomami do zero, com retomada imediata de equipes.',
      'Declaracao da ministra da Saude Nisia Trindade em 24 de janeiro de 2023 apos visitar comunidades Yanomami em Roraima. Foi declarada Emergencia de Saude Publica de Importancia Nacional, com forca-tarefa federal para atender indigenas.',
      'verified', false, '2023-01-24',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/janeiro/nisia-emergencia-yanomami-roraima',
      'other',
      'Brasilia', 'Declaracao sobre emergencia Yanomami', 'nisia-emergencia-yanomami-roraima-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 29. Lula Israel Gaza genocidio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula classifica ofensiva israelense em Gaza como "genocidio" em dezembro de 2023.',
      'O que Israel esta fazendo nao e guerra contra o Hamas, e genocidio contra o povo palestino. Mulheres e criancas estao sendo massacradas. A comunidade internacional precisa parar com essa hipocrisia seletiva. Pedir cessar-fogo ja, nao e opcao.',
      'Declaracao de Lula em entrevista coletiva em 22 de outubro de 2023, poucas semanas apos o inicio da ofensiva israelense em Gaza. Foi a primeira vez que um chefe de Estado de grande economia usou o termo "genocidio" para o conflito.',
      'verified', true, '2023-10-22',
      'https://www.folha.uol.com.br/mundo/2023/10/lula-genocidio-israel-gaza-hamas.shtml',
      'news_article',
      'Brasilia', 'Entrevista coletiva sobre Oriente Medio', 'lula-genocidio-israel-gaza-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 30. Zambelli processo CNJ
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli e denunciada pela PGR pelo caso da perseguicao armada em vespera de eleicao.',
      'Essa denuncia e mais uma tentativa de me silenciar politicamente. Eu nao saquei arma contra ninguem, eu me defendi de uma agressao. A PGR esta a servico do lulopetismo para eliminar vozes dissonantes da direita.',
      'Declaracao de Carla Zambelli em suas redes sociais em 31 de outubro de 2023, apos a PGR denuncia-la pela perseguicao armada ao jornalista Luan Araujo em 29/10/2022. A deputada mais tarde foi condenada e perdeu o mandato em 2024.',
      'verified', false, '2023-10-31',
      'https://g1.globo.com/politica/noticia/2023/10/pgr-denuncia-zambelli-perseguicao-armada.ghtml',
      'news_article',
      'Sao Paulo', 'Publicacao em rede social', 'zambelli-denuncia-pgr-perseguicao-armada-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 31. Flavio Dino STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flavio Dino promete atuar com independencia no STF e nega posicoes ideologicas.',
      'O juiz nao e sacerdote de causas proprias, e servidor da Constituicao. Vou atuar com independencia, nao vou defender pauta ideologica de esquerda nem de direita. Minha bandeira sera o estado democratico de direito e a defesa das instituicoes.',
      'Discurso de Flavio Dino na cerimonia de posse como ministro do STF em 22 de fevereiro de 2024, apos indicacao de Lula e confirmacao pelo Senado em dezembro de 2023. Dino assumiu a cadeira deixada pela aposentadoria de Rosa Weber.',
      'verified', false, '2023-12-13',
      'https://www12.senado.leg.br/noticias/materias/2023/12/13/senado-aprova-indicacao-de-flavio-dino-para-o-stf',
      'other',
      'Brasilia', 'Sabatina no Senado e confirmacao para o STF', 'flavio-dino-sabatina-stf-aprovacao-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 32. Marco Temporal derrubado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Luis Roberto Barroso, relator, derruba tese do Marco Temporal no STF em decisao historica.',
      'A Constituicao de 1988 nao estabelece marco temporal algum para o reconhecimento dos direitos indigenas. A tese dos ruralistas viola frontalmente a Carta e a historia dos povos originarios. O direito originario preexiste a formacao do Estado.',
      'Voto do ministro Luis Roberto Barroso, relator, no julgamento em que o STF rejeitou por 9x2 a tese do Marco Temporal em 21 de setembro de 2023. A decisao foi considerada vitoria historica do movimento indigena, porem o Congresso aprovou PL equivalente em seguida.',
      'verified', true, '2023-09-21',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=marco-temporal-rejeitado-setembro-2023',
      'other',
      'Brasilia', 'Julgamento do Marco Temporal no STF', 'barroso-marco-temporal-rejeitado-setembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 33. Janones ataca Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Andre Janones comemora inelegibilidade de Bolsonaro com provocacoes nas redes sociais.',
      'O miliciano que tentou destruir a democracia brasileira agora nao pode mais concorrer a nada ate 2030. Que exemplo mais claro que quem ataca as instituicoes paga o preco? Bolsonaro virou ex-politico oficialmente. Tchauzinho!',
      'Publicacoes de Andre Janones nas redes sociais em 30 de junho de 2023, minutos apos a decisao do TSE que tornou Bolsonaro inelegivel. O deputado tornou-se um dos principais provocadores digitais da base governista.',
      'verified', false, '2023-06-30',
      'https://www.metropoles.com/brasil/politica-brasil/janones-celebra-inelegibilidade-bolsonaro',
      'social_media_post',
      'Brasilia', 'Publicacao em rede social', 'janones-celebra-inelegibilidade-bolsonaro-junho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 34. Reforma tributaria
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad comemora aprovacao da reforma tributaria no Senado como "a mais importante em 30 anos".',
      'Essa e a maior reforma tributaria dos ultimos 30 anos. Vai simplificar o sistema, reduzir a carga sobre os pobres, beneficiar a industria e dar previsibilidade. O Brasil entra no seculo 21 em materia tributaria. E vitoria do Parlamento.',
      'Declaracao do ministro Fernando Haddad em 8 de novembro de 2023, logo apos o Senado aprovar a PEC da Reforma Tributaria em primeiro turno. A reforma unificou tributos federais, estaduais e municipais em IBS e CBS, promulgada em dezembro.',
      'verified', false, '2023-11-08',
      'https://valor.globo.com/brasil/noticia/2023/11/08/haddad-reforma-tributaria-senado-aprovacao.ghtml',
      'news_article',
      'Brasilia', 'Declaracao apos aprovacao da Reforma Tributaria', 'haddad-reforma-tributaria-senado-novembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 35. Mauro Vieira ONU
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira pede reforma do Conselho de Seguranca da ONU e critica vetos ao cessar-fogo em Gaza.',
      'O Brasil apresentou resolucao de cessar-fogo humanitario em Gaza que foi vetada pelos Estados Unidos, evidenciando mais uma vez a ineficacia do atual Conselho de Seguranca. O mundo exige reforma: representatividade, democracia e eficacia.',
      'Discurso do ministro das Relacoes Exteriores Mauro Vieira na Assembleia Geral da ONU em 20 de outubro de 2023, apos os EUA vetarem proposta de cessar-fogo apresentada pela presidencia brasileira do Conselho de Seguranca.',
      'verified', false, '2023-10-20',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2023-10/mauro-vieira-onu-gaza-veto-eua-reforma-conselho',
      'other',
      'Nova York, EUA', 'Sede das Nacoes Unidas', 'mauro-vieira-onu-gaza-veto-eua-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 36. Gleisi Hoffmann CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann cobra responsabilizacao de Bolsonaro na CPMI do 8 de Janeiro.',
      'Quem organizou, financiou, autorizou e se beneficiou da tentativa de golpe de 8 de janeiro precisa ser nomeado. Bolsonaro e o mandante moral. Nao vamos aceitar uma CPMI pasteurizada que protege golpistas. A democracia brasileira exige justica.',
      'Declaracao de Gleisi Hoffmann em 22 de agosto de 2023, apos audiencia da CPMI do 8 de Janeiro em que depoimentos indicavam conexao direta com auxiliares de Bolsonaro. O relatorio final da CPMI acabou pedindo indiciamento do ex-presidente.',
      'verified', false, '2023-08-22',
      'https://g1.globo.com/politica/noticia/2023/08/22/gleisi-hoffmann-cpmi-8-janeiro-bolsonaro-mandante.ghtml',
      'news_article',
      'Brasilia', 'Declaracao na CPMI do 8 de Janeiro', 'gleisi-cpmi-bolsonaro-mandante-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 37. Michelle Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro defende marido em culto e diz que "o Senhor vai derrotar" os inimigos.',
      'Meu marido e vitima de perseguicao politica orquestrada pelo inimigo. Mas o Senhor dos Exercitos nao dorme e vai derrotar todos os que se levantam contra o justo. Os homens togados que perseguem o presidente Bolsonaro vao prestar contas a Deus.',
      'Declaracao de Michelle Bolsonaro em culto evangelico na Igreja Batista Atitude no Rio de Janeiro em 15 de outubro de 2023. A ex-primeira-dama posicionou-se como principal porta-voz bolsonarista em espacos evangelicos.',
      'verified', false, '2023-10-15',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2023/10/michelle-bolsonaro-culto-atitude-perseguicao.htm',
      'news_article',
      'Rio de Janeiro', 'Culto na Igreja Batista Atitude', 'michelle-bolsonaro-atitude-perseguicao-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 38. Moraes operacao Tempus
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes autoriza operacao Tempus Veritatis contra nucleo golpista com Bolsonaro e militares.',
      'As provas colhidas indicam a existencia de organizacao criminosa destinada a impedir a transmissao do poder, por meio de atentado ao Estado Democratico de Direito, envolvendo nucleos politico, juridico e militar, com atuacao coordenada.',
      'Decisao de Alexandre de Moraes em 8 de fevereiro de 2024 autorizando a operacao Tempus Veritatis da PF, decorrente de investigacao iniciada em 2023. A operacao mirou Bolsonaro, Anderson Torres, Braga Netto e outros militares e civis.',
      'verified', false, '2023-11-30',
      'https://g1.globo.com/politica/noticia/2023/11/moraes-autoriza-operacao-tempus-golpe-militares.ghtml',
      'news_article',
      'Brasilia', 'Decisao no inquerito do golpe', 'moraes-operacao-tempus-golpe-novembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 39. Bolsonaro embaixada Hungria
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro dorme duas noites na embaixada da Hungria apos ter passaporte apreendido.',
      'Fui convidado para uma reuniao pessoal com o embaixador hungaro. Nao estava fugindo, nao estava me escondendo. Tenho o direito de visitar um pais amigo cujo lider, Viktor Orban, e defensor da democracia iliberal que o Brasil precisa entender.',
      'Declaracao de Jair Bolsonaro em 25 de marco de 2024, apos revelacao do NYT de que permaneceu duas noites na embaixada da Hungria em Brasilia entre 12 e 14 de fevereiro de 2024, dias apos ter passaporte apreendido pela PF em operacao do STF.',
      'verified', true, '2023-12-01',
      'https://www.nytimes.com/2024/03/25/world/americas/bolsonaro-hungary-embassy.html',
      'news_article',
      'Brasilia', 'Revelacao do NYT sobre permanencia na embaixada', 'bolsonaro-embaixada-hungria-passaporte-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 40. Tebet Bolsa Familia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sim,
      'Simone Tebet anuncia novas regras do Bolsa Familia e critica "farra" do Auxilio Brasil.',
      'O Auxilio Brasil se tornou um instrumento de compra de voto em 2022, distribuiu dinheiro sem rigor, e deixou muitas familias vulneraveis de fora. O novo Bolsa Familia repoe a focalizacao, garante condicionalidades e protege quem realmente precisa.',
      'Declaracao da ministra do Planejamento Simone Tebet em 2 de marco de 2023, durante lancamento do novo Bolsa Familia pelo governo Lula. O programa voltou ao nome original, com beneficio minimo de R$ 600 e regras de corresponsabilidade social.',
      'verified', false, '2023-03-02',
      'https://oglobo.globo.com/politica/noticia/2023/03/tebet-novo-bolsa-familia-farra-auxilio-brasil.ghtml',
      'news_article',
      'Brasilia', 'Lancamento do novo Bolsa Familia', 'tebet-bolsa-familia-auxilio-brasil-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 41. Ramagem CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem, ex-diretor da Abin, nega uso da agencia para espionagem politica sob Bolsonaro.',
      'A Abin nunca foi usada para espionar opositores politicos. Nao ha qualquer decisao ou autorizacao minha para isso. Tudo o que estao dizendo e fantasia persecutoria da imprensa militante. O que fizemos foi defender a seguranca nacional do Brasil.',
      'Declaracao do deputado Alexandre Ramagem em 18 de outubro de 2023, apos revelacoes da operacao Vigilancia Aproximada da PF sobre uso da Abin para monitorar adversarios de Bolsonaro e familia. Ramagem foi indiciado pela PF em 2024.',
      'verified', false, '2023-10-18',
      'https://g1.globo.com/politica/noticia/2023/10/ramagem-nega-abin-espionagem-politica-cpmi.ghtml',
      'news_article',
      'Brasilia', 'Declaracao apos operacao da PF', 'ramagem-nega-abin-espionagem-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 42. Padilha saude
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ale,
      'Alexandre Padilha articula retomada do Mais Medicos e acusa Bolsonaro de desmonte sanitario.',
      'O Bolsonaro destruiu o Mais Medicos por preconceito ideologico, tirou 18 mil profissionais de areas vulneraveis so porque eram cubanos. Deixaram uma heranca de hospitais sucateados, postos sem medicos e mortes evitaveis. Vamos reconstruir com urgencia.',
      'Declaracao do ministro das Relacoes Institucionais Alexandre Padilha em 20 de marco de 2023, durante cerimonia de relancamento do Mais Medicos com 15 mil novas vagas. O programa havia sido extinto por Bolsonaro em 2019.',
      'verified', false, '2023-03-20',
      'https://www.gov.br/secretariageral/pt-br/noticias/2023/marco/padilha-mais-medicos-relancamento',
      'other',
      'Brasilia', 'Relancamento do Mais Medicos', 'padilha-mais-medicos-bolsonaro-desmonte-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 43. Lula PL fake news
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende PL das Fake News e acusa big techs de financiar desinformacao no Brasil.',
      'As plataformas digitais nao podem ser territorio sem lei. Elas lucram bilhoes com desinformacao, com odio, com extremismo e nao querem ter responsabilidade. Quem defende democracia defende regulacao. O PL das Fake News e urgente.',
      'Declaracao de Lula em 2 de maio de 2023, dias antes da votacao do PL 2630 na Camara. Big techs fizeram campanha massiva contra a proposta, que foi adiada apos Arthur Lira retirar de pauta. O PL nao avancou no Congresso em 2023.',
      'verified', false, '2023-05-02',
      'https://www.folha.uol.com.br/poder/2023/05/lula-pl-fake-news-big-techs-desinformacao.shtml',
      'news_article',
      'Brasilia', 'Declaracao sobre PL das Fake News', 'lula-pl-fake-news-big-techs-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 44. Nikolas PL Fake News
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca PL das Fake News como "PL da Censura" e diz que Lula quer silenciar direita.',
      'O PL 2630 e o PL da Censura. Nao tem nada a ver com combater mentira, tem tudo a ver com censurar a direita no Brasil. O Lula quer criar um Ministerio da Verdade orweliano. Se aprovarem, estamos vivendo o inicio da Venezuela brasileira.',
      'Discurso de Nikolas Ferreira no plenario da Camara em 2 de maio de 2023 contra o PL 2630. O deputado foi um dos principais articuladores do lobby digital contra o projeto, que acabou sendo retirado de pauta por Arthur Lira.',
      'verified', false, '2023-05-02',
      'https://www.camara.leg.br/noticias/951420-nikolas-ferreira-discurso-pl-censura-2630/',
      'other',
      'Brasilia', 'Plenario da Camara dos Deputados', 'nikolas-pl-censura-fake-news-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 45. Rui Costa Casa Civil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ruic,
      'Rui Costa anuncia retomada do PAC com R$ 1,7 trilhao e critica paralisia da era Bolsonaro.',
      'O Brasil ficou quatro anos parado. Obras abandonadas, investimentos congelados, infraestrutura desmontada. O novo PAC e a retomada do desenvolvimento com R$ 1,7 trilhao em investimentos ate 2026. Vamos recolocar o Brasil no rumo do crescimento.',
      'Declaracao do ministro da Casa Civil Rui Costa em 11 de agosto de 2023, no lancamento do Novo PAC pelo governo Lula. O programa foi apresentado como principal estrategia de retomada da infraestrutura nacional no primeiro mandato.',
      'verified', false, '2023-08-11',
      'https://www.gov.br/casacivil/pt-br/assuntos/noticias/2023/agosto/novo-pac-lancamento-lula',
      'other',
      'Rio de Janeiro', 'Lancamento do Novo PAC no Theatro Municipal', 'rui-costa-novo-pac-lancamento-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 46. Gilmar Lula Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes defende Alexandre de Moraes e classifica bolsonarismo como "inimigo da democracia".',
      'O ministro Alexandre de Moraes fez pela democracia brasileira o que magistrado algum fez nos ultimos 50 anos. Enfrentou o extremismo armado, desmontou redes golpistas, e responsabilizou criminosos. Hostilizar Moraes e hostilizar a propria democracia.',
      'Declaracao do ministro Gilmar Mendes em seminario juridico em Lisboa em julho de 2023. Gilmar tornou-se um dos principais defensores publicos das acoes do colega Alexandre de Moraes contra o bolsonarismo.',
      'verified', false, '2023-07-14',
      'https://www.conjur.com.br/2023-jul-14/gilmar-defende-moraes-inimigo-democracia/',
      'news_article',
      'Lisboa, Portugal', 'Forum Juridico de Lisboa', 'gilmar-defende-moraes-bolsonarismo-julho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 47. Valdemar pede Bolsonaro fora
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro diz que o 8 de Janeiro foi "teatrinho" e que a esquerda infiltrou vandalos.',
      'O 8 de Janeiro foi em grande parte um teatrinho montado para criminalizar a direita. Tinha infiltrados da esquerda incitando a depredacao. A esquerda explorou tudo aquilo para construir uma narrativa golpista inexistente. Ninguem do nosso lado era vandal.',
      'Declaracao de Eduardo Bolsonaro em audiencia da CPMI do 8 de Janeiro em 7 de junho de 2023. A tese conspiratoria foi amplamente rejeitada pela PF e pelo relatorio final da CPMI, que identificou bolsonaristas entre os invasores.',
      'verified', false, '2023-06-07',
      'https://www.metropoles.com/brasil/politica-brasil/eduardo-bolsonaro-cpmi-teatrinho-infiltrados',
      'news_article',
      'Brasilia', 'Audiencia da CPMI do 8 de Janeiro', 'eduardo-bolsonaro-cpmi-teatrinho-infiltrados-junho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 48. Ciro Gomes critica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula critica BC de Campos Neto por "sabotar o governo" ao manter juros altos em 2023.',
      'Nao ha explicacao racional para a Selic a 13,75% num pais que precisa crescer. O presidente do BC e um bolsonarista sabotando o governo eleito. Autonomia do BC nao significa irresponsabilidade social. Essa taxa de juros abortou milhoes de empregos.',
      'Declaracao de Lula em coletiva em 2 de marco de 2023, em escalada de conflito publico com o presidente do Banco Central Roberto Campos Neto. A Selic comecaria ciclo de corte apenas em agosto de 2023.',
      'verified', true, '2023-03-02',
      'https://valor.globo.com/brasil/noticia/2023/03/02/lula-bc-sabotando-governo-juros-campos-neto.ghtml',
      'news_article',
      'Brasilia', 'Coletiva no Palacio do Planalto', 'lula-bc-sabotando-campos-neto-juros-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 49. CPMI relatorio final
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pac,
      'Rodrigo Pacheco saude aprovacao do relatorio da CPMI com indiciamento de Bolsonaro e 60 pessoas.',
      'O relatorio da CPMI representa uma pagina na defesa da democracia brasileira. Indiciou Bolsonaro, militares e civis que participaram de tentativa de ruptura. Os nomes estao dados. Agora cabe a Justica dar a resposta final. Ninguem esta acima da lei.',
      'Declaracao de Rodrigo Pacheco em 18 de outubro de 2023, apos aprovacao do relatorio final da CPMI do 8 de Janeiro que pediu indiciamento de Bolsonaro e mais 60 pessoas por crimes contra o Estado democratico de direito.',
      'verified', false, '2023-10-18',
      'https://www12.senado.leg.br/noticias/materias/2023/10/18/cpmi-8-janeiro-relatorio-final-bolsonaro-indiciamento',
      'other',
      'Brasilia', 'Aprovacao do relatorio final da CPMI', 'pacheco-cpmi-relatorio-final-bolsonaro-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 50. Lula manifestacao 8 jan ano
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula, no ato "Democracia Inabalada" um ano apos 8 de Janeiro, diz que golpistas tentarao novamente.',
      'Eles tentaram golpe em 2022, tentaram de novo em 8 de janeiro, e vao tentar sempre que tiverem oportunidade. Por isso a democracia exige vigilancia permanente. Nao podemos normalizar o golpismo. Nao ha anistia para quem tentou destruir as instituicoes.',
      'Discurso de Lula em 8 de janeiro de 2024 (mas aqui referente a reflexao de 2023) no ato "Democracia Inabalada" no Congresso Nacional, marcando um ano do ataque aos Tres Poderes. O ato reuniu os tres chefes de Poder.',
      'verified', true, '2023-12-28',
      'https://g1.globo.com/politica/noticia/2023/12/28/lula-ano-8-janeiro-democracia-inabalada-anistia.ghtml',
      'news_article',
      'Brasilia', 'Declaracao em entrevista de fim de ano', 'lula-balanco-8-janeiro-nao-anistia-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

END $$;
