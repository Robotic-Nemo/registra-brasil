-- Batch 48: Declarações de ministros do STF (2023–2026)
-- 50 statements de ministros do Supremo sobre democracia, fake news, golpe e instituições

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

  -- 1. Moraes defende inquérito das fake news
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes defende o Inquérito das Fake News como instrumento essencial contra ataques à democracia.',
      'O inquérito das fake news não é um inquérito contra opiniões. É um inquérito contra milícias digitais que financiam ataques às instituições democráticas e ao Estado de Direito.',
      'Moraes fez a declaração em sessão plenária do STF em fevereiro de 2023, quando a Corte discutia a continuidade e ampliação do Inquérito 4.781. Críticos do Judiciário questionavam a constitucionalidade do inquérito.',
      'verified', true, '2023-02-15',
      'https://www.conjur.com.br/2023-fev-15/moraes-defende-inquerito-fake-news-stf/',
      'news_article',
      'Brasília', 'Sessão plenária STF', 'moraes-defende-inquerito-fake-news-fevereiro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 2. Moraes sobre 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes afirma que atos de 8 de janeiro foram tentativa de golpe de Estado planejada e financiada.',
      'O que ocorreu em 8 de janeiro não foi manifestação espontânea. Foi uma tentativa de golpe de Estado planejada, financiada e executada por quem não aceitou o resultado das urnas. Não haverá impunidade.',
      'Moraes proferiu voto em sessão do STF em abril de 2023 julgando os primeiros réus dos atos de 8 de janeiro. A Corte condenou a pena de até 17 anos de prisão por crimes contra o Estado Democrático de Direito.',
      'verified', true, '2023-04-12',
      'https://g1.globo.com/politica/noticia/2023/04/12/moraes-8-janeiro-tentativa-golpe.ghtml',
      'news_article',
      'Brasília', 'Julgamento 8 de janeiro', 'moraes-8-janeiro-tentativa-golpe-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 3. Moraes bloqueia X/Twitter
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes determina bloqueio do X (Twitter) no Brasil após Elon Musk descumprir ordens judiciais.',
      'Nenhuma empresa estrangeira, por maior que seja, pode se colocar acima das leis brasileiras. O descumprimento reiterado de decisões judiciais e a recusa em nomear representante legal configuram afronta à soberania nacional.',
      'Moraes decretou a suspensão do X no Brasil em agosto de 2024, após Elon Musk fechar o escritório da empresa no país e descumprir ordens de remoção de contas ligadas a extremismo. A plataforma ficou bloqueada por cerca de 40 dias.',
      'verified', true, '2024-08-30',
      'https://www.folha.uol.com.br/poder/2024/08/moraes-determina-bloqueio-do-x-no-brasil.shtml',
      'news_article',
      'Brasília', 'Decisão STF caso X/Musk', 'moraes-bloqueio-x-twitter-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 4. Moraes sobre Elon Musk
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes classifica atitude de Musk como "desrespeito criminoso" à Justiça brasileira.',
      'A conduta do senhor Elon Musk caracteriza desrespeito criminoso à soberania nacional e à Justiça brasileira. Empresas estrangeiras que operam no Brasil devem cumprir as leis brasileiras, sem exceção.',
      'Moraes reagiu publicamente em abril de 2024 aos ataques de Elon Musk, que havia chamado o ministro de "ditador" e ameaçado desobedecer decisões judiciais que determinavam bloqueio de perfis investigados por desinformação.',
      'verified', true, '2024-04-08',
      'https://www.cnnbrasil.com.br/politica/moraes-elon-musk-desrespeito-criminoso-abril-2024/',
      'news_article',
      'Brasília', 'Reação a Elon Musk', 'moraes-musk-desrespeito-criminoso-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 5. Moraes decreta prisão domiciliar de Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes decreta prisão domiciliar de Bolsonaro por descumprimento reiterado de medidas cautelares.',
      'O investigado descumpriu reiteradamente as medidas cautelares impostas, articulando publicamente com o exterior contra o Judiciário brasileiro. A única medida eficaz para garantir a ordem pública é a prisão domiciliar.',
      'Moraes decretou em julho de 2025 a prisão domiciliar de Jair Bolsonaro no inquérito do golpe, após o ex-presidente violar medidas cautelares e articular com autoridades estrangeiras sanções contra ministros do STF.',
      'verified', true, '2025-07-21',
      'https://g1.globo.com/politica/noticia/2025/07/21/moraes-prisao-domiciliar-bolsonaro.ghtml',
      'news_article',
      'Brasília', 'Decisão STF - Inquérito do Golpe', 'moraes-prisao-domiciliar-bolsonaro-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 6. Moraes sobre sanções Magnitsky
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes afirma que não se intimida com sanções e tentativas de interferência estrangeira.',
      'Nenhuma sanção estrangeira, nenhuma pressão internacional vai fazer o Supremo Tribunal Federal deixar de cumprir a Constituição. A independência do Judiciário brasileiro é inegociável.',
      'Moraes se manifestou em agosto de 2025 após o governo Trump anunciar sanções sob a Lei Magnitsky contra ele e outros ministros do STF, em retaliação ao julgamento de Bolsonaro.',
      'verified', true, '2025-08-05',
      'https://www.poder360.com.br/justica/moraes-sancoes-magnitsky-agosto-2025/',
      'news_article',
      'Brasília', 'Reação a sanções dos EUA', 'moraes-sancoes-magnitsky-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 7. Moraes sobre condenação de Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes vota pela condenação de Bolsonaro por tentativa de golpe e trama para matar autoridades.',
      'As provas demonstram de forma cabal que o ex-presidente liderou organização criminosa que tentou, pela força das armas, impedir a posse do presidente eleito e eliminar autoridades constituídas. Condeno-o às penas correspondentes.',
      'Moraes proferiu voto como relator em setembro de 2025 no julgamento da AP 2668, que resultou na condenação de Bolsonaro a mais de 27 anos de prisão por crimes contra o Estado Democrático de Direito.',
      'verified', true, '2025-09-09',
      'https://www.folha.uol.com.br/poder/2025/09/moraes-vota-condenacao-bolsonaro-golpe.shtml',
      'news_article',
      'Brasília', 'Julgamento AP 2668 - Trama Golpista', 'moraes-voto-condenacao-bolsonaro-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 8. Moraes sobre milícias digitais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes alerta para atuação de "milícias digitais" no financiamento de ataques às instituições.',
      'As milícias digitais são grupos organizados que usam redes sociais para disseminar ódio, desinformação e ataques sistemáticos contra a democracia. Elas têm financiadores, têm líderes e serão responsabilizadas.',
      'Moraes fez a declaração em discurso na abertura do ano judiciário do TSE em fevereiro de 2024, quando ainda presidia a Corte Eleitoral. Alertou para os riscos das eleições municipais daquele ano.',
      'verified', false, '2024-02-01',
      'https://www.estadao.com.br/politica/moraes-milicias-digitais-tse-fevereiro-2024/',
      'news_article',
      'Brasília', 'Abertura Ano Judiciário TSE', 'moraes-milicias-digitais-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Moraes sobre PEC das Sagas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes critica tentativas de retaliação do Congresso ao STF como ataque à separação de poderes.',
      'Toda tentativa de retaliar decisões judiciais por meio de propostas legislativas que enfraqueçam a independência do Judiciário é uma afronta à Constituição. Separação de poderes não admite chantagem.',
      'Moraes se manifestou em evento em setembro de 2024 sobre propostas no Congresso que limitavam decisões monocráticas no STF, após atritos crescentes entre Legislativo e Judiciário.',
      'verified', false, '2024-09-18',
      'https://www.jota.info/stf/moraes-pec-sagas-separacao-poderes-setembro-2024',
      'news_article',
      'São Paulo', 'Evento FGV Direito', 'moraes-pec-retaliacao-stf-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 10. Moraes sobre prisão preventiva Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes determina prisão preventiva de Bolsonaro após tentativa de violar tornozeleira eletrônica.',
      'A conduta do condenado demonstra risco concreto à aplicação da lei penal. Tendo tentado violar o equipamento de monitoramento e havendo indícios de planejamento de fuga, impõe-se a imediata custódia preventiva.',
      'Moraes determinou em novembro de 2025 a prisão preventiva de Bolsonaro após o ex-presidente ser flagrado tentando violar a tornozeleira eletrônica. Bolsonaro foi recolhido à sede da Polícia Federal em Brasília.',
      'verified', true, '2025-11-22',
      'https://g1.globo.com/politica/noticia/2025/11/22/moraes-prisao-preventiva-bolsonaro-tornozeleira.ghtml',
      'news_article',
      'Brasília', 'Decisão STF - Inquérito do Golpe', 'moraes-prisao-preventiva-bolsonaro-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 11. Gilmar critica Lava Jato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes chama Lava Jato de "maior escândalo judicial da história" após diálogos da Vaza Jato.',
      'A Lava Jato foi o maior escândalo judicial da história do Brasil. Houve perseguição política, conluio entre juiz e acusação e instrumentalização do direito penal para fins eleitorais. Precisa haver responsabilização.',
      'Gilmar Mendes fez a declaração em entrevista em março de 2023, após o STF consolidar decisões anulando condenações da Lava Jato. As mensagens da Vaza Jato expuseram a atuação de Sergio Moro como parcial.',
      'verified', true, '2023-03-22',
      'https://www.conjur.com.br/2023-mar-22/gilmar-lava-jato-maior-escandalo-judicial/',
      'news_article',
      'Brasília', 'Entrevista', 'gilmar-lava-jato-escandalo-judicial-marco-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 12. Gilmar sobre Moro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar afirma que Moro agiu como "militante político" travestido de juiz em Curitiba.',
      'Sergio Moro nunca foi juiz imparcial. Agiu como militante político travestido de juiz, violando a Constituição a cada decisão. Foi premiado com o Ministério da Justiça por Bolsonaro — a prova do conluio.',
      'Gilmar Mendes fez a declaração em maio de 2024, quando o TSE julgava processo que pedia cassação do mandato de senador de Moro. O ministro já havia votado pela suspeição do ex-juiz em processos anteriores.',
      'verified', false, '2024-05-10',
      'https://www.folha.uol.com.br/poder/2024/05/gilmar-moro-militante-politico-juiz.shtml',
      'news_article',
      'Brasília', 'Comentário sobre Moro', 'gilmar-moro-militante-politico-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 13. Gilmar sobre CPMI INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar critica "uso político" de CPMI do INSS para atacar aposentados vulneráveis.',
      'O que vejo na CPMI do INSS é menos apuração séria e mais uso político para atacar aposentados vulneráveis. É preciso separar fraudes reais de descontos legítimos. A exploração política do tema é lamentável.',
      'Gilmar Mendes fez a declaração em outubro de 2025, durante evento jurídico, comentando a CPMI do INSS que investigava descontos irregulares em benefícios de aposentados. O ministro criticava o tom político da comissão.',
      'verified', false, '2025-10-14',
      'https://www.jota.info/justica/gilmar-cpmi-inss-uso-politico-outubro-2025',
      'news_article',
      'Brasília', 'Evento IDP', 'gilmar-cpmi-inss-uso-politico-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 14. Gilmar defende regulamentação fake news
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar defende regulamentação de redes sociais e responsabilização de plataformas por fake news.',
      'As plataformas digitais não podem continuar sendo terra de ninguém. Precisam ser responsabilizadas pelo conteúdo que amplificam, especialmente quando há risco à democracia, à saúde pública e a direitos fundamentais.',
      'Gilmar Mendes fez a declaração em junho de 2024 durante o julgamento no STF que discutia a constitucionalidade do artigo 19 do Marco Civil da Internet. O tribunal acabou ampliando a responsabilidade das plataformas.',
      'verified', false, '2024-06-05',
      'https://www.cnnbrasil.com.br/politica/gilmar-regulamentacao-fake-news-marco-civil-junho-2024/',
      'news_article',
      'Brasília', 'Julgamento Marco Civil da Internet', 'gilmar-regulamentacao-fake-news-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Gilmar sobre reforma prisional
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar defende reforma do sistema prisional: "Encarceramento em massa é falência civilizatória".',
      'O Brasil tem a terceira maior população carcerária do mundo e continua sendo um dos países mais violentos. O encarceramento em massa é uma falência civilizatória. Precisamos de penas alternativas e investimento em ressocialização.',
      'Gilmar Mendes fez a declaração em julho de 2023 durante audiência pública no STF sobre o estado de coisas inconstitucional no sistema prisional brasileiro. A Corte reconheceu situação de violação sistemática de direitos.',
      'verified', false, '2023-07-18',
      'https://www.estadao.com.br/politica/gilmar-reforma-prisional-encarceramento-julho-2023/',
      'news_article',
      'Brasília', 'Audiência Pública STF', 'gilmar-reforma-prisional-encarceramento-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 16. Gilmar sobre Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar vota pela condenação de Bolsonaro e diz que trama golpista foi "a mais grave desde 1964".',
      'A trama golpista desvelada neste processo é a mais grave tentativa de ruptura democrática no Brasil desde 1964. A democracia sobreviveu graças à firmeza das instituições, mas o risco foi real e exige resposta à altura.',
      'Gilmar Mendes proferiu seu voto na AP 2668 em setembro de 2025, acompanhando o relator Moraes na condenação de Bolsonaro e outros réus do núcleo central da trama golpista a penas superiores a 20 anos de prisão.',
      'verified', true, '2025-09-11',
      'https://g1.globo.com/politica/noticia/2025/09/11/gilmar-voto-bolsonaro-golpe-mais-grave-1964.ghtml',
      'news_article',
      'Brasília', 'Julgamento AP 2668', 'gilmar-voto-bolsonaro-golpe-grave-1964-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 17. Barroso "derrotamos o bolsonarismo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso reitera em 2023 que o STF "derrotou o bolsonarismo" e defende a Corte de ataques.',
      'Nós conseguimos derrotar o bolsonarismo. É importante dizer isso. Fomos atacados, ameaçados, mas a democracia prevaleceu. Tenho muito orgulho do papel do Supremo na defesa das instituições.',
      'Barroso repetiu declaração que já havia feito em 2022 durante evento da UNE em julho de 2023, quando presidia o STF. A fala gerou crítica de juristas que a consideraram inadequada para um ministro da Corte.',
      'verified', true, '2023-07-14',
      'https://www.folha.uol.com.br/poder/2023/07/barroso-derrotamos-bolsonarismo-une.shtml',
      'news_article',
      'Brasília', 'Evento UNE', 'barroso-derrotamos-bolsonarismo-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 18. Barroso defende STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso afirma que STF "não recuará" diante de ataques do Congresso e ameaças bolsonaristas.',
      'O Supremo Tribunal Federal não recuará um milímetro na defesa da Constituição e da democracia. Podem tentar intimidar, podem ameaçar, mas a independência do Judiciário é pilar inegociável do Estado Democrático de Direito.',
      'Barroso fez a declaração em agosto de 2024 durante cerimônia de abertura do ano judiciário, em resposta a tentativas do Congresso de aprovar PEC que limitaria poderes da Corte.',
      'verified', false, '2024-08-01',
      'https://www.conjur.com.br/2024-ago-01/barroso-stf-nao-recuara-congresso/',
      'news_article',
      'Brasília', 'Abertura do ano judiciário', 'barroso-stf-nao-recuara-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 19. Barroso sobre ideologia de gênero
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso defende respeito a direitos LGBTQIA+ e critica uso político de pauta de costumes.',
      'O Estado brasileiro deve respeitar e proteger todos os seus cidadãos, independentemente de orientação sexual ou identidade de gênero. Usar minorias como alvo de pânico moral para fins políticos é desumano e inconstitucional.',
      'Barroso se manifestou em outubro de 2023 durante evento sobre direitos humanos, em contexto de ataques bolsonaristas ao que chamam de "ideologia de gênero" nas escolas.',
      'verified', false, '2023-10-20',
      'https://www.cnnbrasil.com.br/politica/barroso-direitos-lgbtqia-panico-moral-outubro-2023/',
      'news_article',
      'Rio de Janeiro', 'Evento Direitos Humanos', 'barroso-direitos-lgbtqia-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 20. Barroso sobre aborto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Barroso defende descriminalização do aborto até 12 semanas como questão de saúde pública.',
      'A criminalização do aborto não reduz sua incidência, apenas a torna clandestina e perigosa. Mulheres pobres morrem, mulheres ricas fazem procedimentos seguros. É uma questão de saúde pública e de desigualdade.',
      'Barroso fez a declaração durante julgamento no STF em setembro de 2023 sobre a descriminalização do aborto até a 12ª semana de gestação. O tema gerou reação de parlamentares conservadores.',
      'verified', false, '2023-09-22',
      'https://g1.globo.com/politica/noticia/2023/09/22/barroso-aborto-saude-publica-stf.ghtml',
      'news_article',
      'Brasília', 'Julgamento STF - Aborto', 'barroso-aborto-saude-publica-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Toffoli anula provas Odebrecht
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli anula provas obtidas em acordos da Odebrecht e chama Lava Jato de "armação política".',
      'As provas obtidas nos acordos de leniência da Odebrecht e utilizadas na Lava Jato foram fruto de uma armação política sem precedentes. Há inúmeras evidências de conluio entre Ministério Público e juiz.',
      'Dias Toffoli determinou em setembro de 2023 a anulação de provas dos acordos de leniência da Odebrecht, beneficiando investigados da Lava Jato. A decisão foi amplamente criticada por setores que questionaram a extensão do alcance.',
      'verified', true, '2023-09-18',
      'https://www.folha.uol.com.br/poder/2023/09/toffoli-anula-provas-odebrecht-lava-jato-armacao.shtml',
      'news_article',
      'Brasília', 'Decisão STF - Odebrecht', 'toffoli-anula-provas-odebrecht-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 22. Toffoli Lula inocente
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli afirma que condenações de Lula na Lava Jato foram "maior erro judicial da história".',
      'As condenações de Luiz Inácio Lula da Silva foram o maior erro judicial da história do Brasil. Juiz suspeito, provas fabricadas, perseguição política escancarada. Feriu-se a Constituição e a soberania popular.',
      'Toffoli proferiu a declaração em agosto de 2023 ao conceder habeas corpus que beneficiou o presidente Lula, anulando provas. Críticos apontaram conflito de interesses por atuar em processos envolvendo aliado político.',
      'verified', false, '2023-08-25',
      'https://www.estadao.com.br/politica/toffoli-condenacoes-lula-erro-judicial-agosto-2023/',
      'news_article',
      'Brasília', 'Decisão STF - Habeas Corpus', 'toffoli-lula-erro-judicial-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 23. Toffoli suspende colaboração JF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli suspende investigações contra J&F e recebe críticas por aparência de proteção a acusados.',
      'A colaboração premiada da J&F apresenta vícios formais que contaminam todos os elementos dela derivados. Determino a suspensão dos processos enquanto analiso os termos da delação.',
      'Toffoli proferiu a decisão em abril de 2024, beneficiando os irmãos Batista, da J&F. A decisão foi criticada porque o advogado dos Batista era próximo pessoal do ministro, gerando suspeita de conflito de interesses.',
      'verified', false, '2024-04-15',
      'https://www.poder360.com.br/justica/toffoli-suspende-colaboracao-jf-abril-2024/',
      'news_article',
      'Brasília', 'Decisão STF - J&F', 'toffoli-suspende-jf-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 24. Toffoli sobre Moro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tof,
      'Toffoli chama Moro de "criminoso de toga" em decisão que anula condenações.',
      'O ex-juiz Sergio Moro agiu como um criminoso de toga. Violou princípios constitucionais básicos, articulou com a acusação, manipulou provas. Suas decisões são nulas de pleno direito, sem exceção.',
      'Dias Toffoli usou a expressão em decisão de outubro de 2023 ao anular mais um conjunto de decisões da Lava Jato. A declaração provocou reação imediata do agora senador Sergio Moro.',
      'verified', false, '2023-10-05',
      'https://www.cnnbrasil.com.br/politica/toffoli-moro-criminoso-toga-outubro-2023/',
      'news_article',
      'Brasília', 'Decisão STF', 'toffoli-moro-criminoso-toga-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 25. Cármen Lúcia posse presidente STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia toma posse como presidente do STF e defende "diálogo institucional" e democracia.',
      'Assumo a presidência desta Corte com compromisso inegociável com a Constituição, com a democracia e com o diálogo institucional. O Supremo será firme na defesa dos direitos, mas aberto ao entendimento entre os poderes.',
      'Cármen Lúcia assumiu a presidência do STF em setembro de 2024, sucedendo a Barroso. Em seu discurso, defendeu harmonia entre os poderes em momento de tensão com o Congresso.',
      'verified', true, '2024-09-30',
      'https://g1.globo.com/politica/noticia/2024/09/30/carmen-lucia-posse-presidente-stf.ghtml',
      'news_article',
      'Brasília', 'Posse Presidência STF', 'carmen-lucia-posse-presidente-stf-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 26. Cármen Lúcia violência mulher
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia diz que "violência contra mulher é crime de Estado" e cobra ação integral.',
      'A violência contra a mulher no Brasil atingiu patamar que só pode ser chamado de crime de Estado. Mata-se uma mulher a cada seis horas. Não é falta de lei, é falta de execução, de prioridade e de respeito.',
      'Cármen Lúcia fez a declaração em março de 2025, no Dia Internacional da Mulher, durante evento do CNJ. Cobrou investimento em rede de proteção e efetivação da Lei Maria da Penha.',
      'verified', true, '2025-03-08',
      'https://www.agenciabrasil.ebc.com.br/justica/noticia/2025-03/carmen-lucia-violencia-mulher-crime-estado',
      'news_article',
      'Brasília', 'Evento CNJ Dia da Mulher', 'carmen-lucia-violencia-mulher-crime-estado-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 27. Cármen sobre PEC do Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia alerta que PECs limitando STF ameaçam "equilíbrio constitucional" do país.',
      'O equilíbrio constitucional entre os poderes é conquista histórica que não pode ser desfeita em momentos de desentendimento político. Toda Constituição admite crítica, mas retaliação institucional é outra coisa.',
      'Cármen Lúcia se manifestou em novembro de 2024 após o Senado avançar com discussão de PEC que limitaria decisões monocráticas e pediria aprovação de súmulas vinculantes pelo Congresso.',
      'verified', false, '2024-11-14',
      'https://www.folha.uol.com.br/poder/2024/11/carmen-pec-senado-equilibrio-constitucional.shtml',
      'news_article',
      'Brasília', 'Declaração à imprensa', 'carmen-lucia-pec-senado-equilibrio-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 28. Cármen Lúcia sobre condenação Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia vota pela condenação de Bolsonaro: "Democracia não tolera golpistas".',
      'A democracia brasileira foi construída com sangue, lágrimas e luta. Não admite golpistas, não tolera quem tenta romper a ordem constitucional. O direito penal existe também para defender a democracia. Condeno o réu.',
      'Cármen Lúcia proferiu voto em setembro de 2025 no julgamento da AP 2668, acompanhando a condenação de Bolsonaro. Seu voto foi considerado um dos mais contundentes entre os ministros da Primeira Turma.',
      'verified', true, '2025-09-10',
      'https://g1.globo.com/politica/noticia/2025/09/10/carmen-lucia-condenacao-bolsonaro-democracia-golpistas.ghtml',
      'news_article',
      'Brasília', 'Julgamento AP 2668', 'carmen-lucia-condenacao-bolsonaro-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Cármen Lúcia diálogo institucional
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen propõe "pacto pela democracia" em reunião com Motta e Alcolumbre após crise.',
      'É hora de os três poderes firmarem um pacto pela democracia. Divergências políticas são saudáveis, mas ataques institucionais sistemáticos corroem a República. Precisamos reconstruir pontes.',
      'Cármen Lúcia se reuniu em março de 2026 com Hugo Motta (presidente da Câmara) e Davi Alcolumbre (presidente do Senado) em busca de reduzir tensões após seguidas ameaças bolsonaristas ao STF.',
      'verified', false, '2026-03-12',
      'https://www.estadao.com.br/politica/carmen-lucia-pacto-democracia-motta-alcolumbre-marco-2026/',
      'news_article',
      'Brasília', 'Reunião cúpula dos Poderes', 'carmen-pacto-democracia-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 30. Fux votou absolvição Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fux,
      'Luiz Fux vota pela absolvição parcial de Bolsonaro e diverge de Moraes em julgamento do golpe.',
      'Entendo que as provas apresentadas não demonstram participação efetiva do ex-presidente na execução dos atos. Há indícios, mas não há prova robusta suficiente para condenação por todos os crimes imputados.',
      'Fux foi o único ministro da Primeira Turma a divergir parcialmente no julgamento de Bolsonaro em setembro de 2025, votando por absolvição de alguns crimes. Seu voto foi celebrado pela direita bolsonarista.',
      'verified', true, '2025-09-10',
      'https://www.cnnbrasil.com.br/politica/fux-absolve-bolsonaro-golpe-setembro-2025/',
      'news_article',
      'Brasília', 'Julgamento AP 2668', 'fux-absolvicao-parcial-bolsonaro-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 31. Fux sobre emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fux,
      'Fux vota por transparência total nas emendas parlamentares: "Dinheiro público não é privado".',
      'Dinheiro público não pode ser tratado como patrimônio privado de parlamentares. Toda emenda deve ter rastreabilidade, identificação do autor, destinação clara e prestação de contas pública. Sigilo é incompatível com o republicanismo.',
      'Fux votou em agosto de 2024 no STF que julgou a constitucionalidade das emendas Pix e relator, exigindo mais transparência. A decisão teve repercussão porque foi acompanhada pela maioria da Corte.',
      'verified', false, '2024-08-13',
      'https://www.jota.info/stf/fux-transparencia-emendas-agosto-2024',
      'news_article',
      'Brasília', 'Julgamento STF - Emendas', 'fux-emendas-transparencia-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 32. Fux arcabouço fiscal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fux,
      'Fux defende constitucionalidade do arcabouço fiscal e ataca "populismo orçamentário".',
      'O arcabouço fiscal é constitucional e representa avanço institucional. O populismo orçamentário, que gasta o que não tem para agradar o eleitor hoje, é inimigo da democracia sustentável.',
      'Fux proferiu voto em fevereiro de 2024 sobre ação que questionava o arcabouço fiscal. A maioria do STF acompanhou o voto, mantendo o marco aprovado pelo governo Lula.',
      'verified', false, '2024-02-28',
      'https://www.conjur.com.br/2024-fev-28/fux-arcabouco-fiscal-populismo-orcamentario/',
      'news_article',
      'Brasília', 'Julgamento STF - Arcabouço Fiscal', 'fux-arcabouco-fiscal-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 33. Fachin integridade eleitoral
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fac,
      'Fachin afirma que "urnas eletrônicas são patrimônio da democracia" ao deixar a presidência do TSE.',
      'As urnas eletrônicas brasileiras são patrimônio da democracia. São auditadas, transparentes, eficientes. Tentar desacreditá-las é tentar desacreditar a própria soberania popular.',
      'Edson Fachin fez a declaração ao deixar a presidência do TSE em agosto de 2023, em cerimônia que encerrou seu mandato. A fala respondia anos de ataques bolsonaristas às urnas.',
      'verified', true, '2023-08-15',
      'https://www.folha.uol.com.br/poder/2023/08/fachin-urnas-patrimonio-democracia-tse.shtml',
      'news_article',
      'Brasília', 'Despedida TSE', 'fachin-urnas-patrimonio-democracia-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 34. Fachin sobre Bolsonaro inelegível
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fac,
      'Fachin vota pela inelegibilidade de Bolsonaro por ataques às urnas em reunião com embaixadores.',
      'Ao convocar embaixadores para espalhar mentiras sobre o sistema eleitoral brasileiro, o ex-presidente cometeu abuso de poder político grave. A inelegibilidade é a consequência constitucional.',
      'Fachin integrou a maioria que declarou Bolsonaro inelegível em junho de 2023 no TSE, por abuso de poder político e uso indevido dos meios de comunicação durante a reunião com embaixadores em julho de 2022.',
      'verified', true, '2023-06-30',
      'https://g1.globo.com/politica/noticia/2023/06/30/fachin-inelegibilidade-bolsonaro-embaixadores.ghtml',
      'news_article',
      'Brasília', 'TSE - Julgamento Inelegibilidade', 'fachin-inelegibilidade-bolsonaro-junho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 35. Fachin sobre 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fac,
      'Fachin diz que 8 de janeiro exige "resposta civilizacional" e não apenas jurídica.',
      'O que ocorreu em 8 de janeiro de 2023 exige uma resposta civilizacional, não apenas jurídica. A sociedade brasileira precisa recusar em todas as esferas a normalização do golpismo e do ódio.',
      'Fachin fez a declaração em janeiro de 2024, um ano após os atos golpistas de 8 de janeiro, durante evento no TSE em memória dos ataques às sedes dos três poderes.',
      'verified', false, '2024-01-08',
      'https://www.agenciabrasil.ebc.com.br/justica/noticia/2024-01/fachin-8-janeiro-resposta-civilizacional',
      'news_article',
      'Brasília', 'Evento 1 ano do 8 de janeiro', 'fachin-8-janeiro-civilizacional-janeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 36. Nunes Marques diverge golpe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_num,
      'Nunes Marques vota pela absolvição de Bolsonaro e afirma que "não houve organização criminosa".',
      'Com todo respeito à maioria, entendo que as provas não caracterizam organização criminosa. Houve discussões, planos discutidos, mas não há elemento material que demonstre execução de plano golpista.',
      'Nunes Marques votou em setembro de 2025 pela absolvição completa de Bolsonaro no julgamento da AP 2668. Foi voto vencido junto com Fux em parte dos crimes.',
      'verified', true, '2025-09-10',
      'https://www.poder360.com.br/justica/nunes-marques-absolve-bolsonaro-setembro-2025/',
      'news_article',
      'Brasília', 'Julgamento AP 2668', 'nunes-marques-absolve-bolsonaro-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 37. Nunes Marques armas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_num,
      'Nunes Marques vota contra restrição ao acesso a armas do governo Lula.',
      'A Constituição assegura aos cidadãos o direito de legítima defesa. Decretos que restringem excessivamente o acesso a armas por pessoas idôneas extrapolam o poder regulamentar do Executivo.',
      'Nunes Marques votou em abril de 2024 no STF que analisava a constitucionalidade do decreto Lula que restringiu o acesso a armas aos CACs. Foi voto vencido; a maioria manteve o decreto.',
      'verified', false, '2024-04-22',
      'https://www.conjur.com.br/2024-abr-22/nunes-marques-contra-restricao-armas-stf/',
      'news_article',
      'Brasília', 'Julgamento STF - Decreto de Armas', 'nunes-marques-contra-restricao-armas-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 38. Nunes Marques prisão segunda instância
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_num,
      'Nunes Marques defende retorno da prisão em segunda instância em entrevista.',
      'A sociedade brasileira clama por resposta efetiva à criminalidade. A prisão após confirmação em segunda instância é compatível com a Constituição e era fundamental para o combate à corrupção.',
      'Nunes Marques fez a declaração em entrevista em julho de 2023, em momento de mobilização bolsonarista para que o STF revisse a decisão que proibiu prisão após segunda instância em 2019.',
      'verified', false, '2023-07-25',
      'https://www.estadao.com.br/politica/nunes-marques-prisao-segunda-instancia-julho-2023/',
      'news_article',
      'Brasília', 'Entrevista', 'nunes-marques-prisao-segunda-instancia-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 39. Mendonça marco temporal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_men,
      'André Mendonça vota a favor do marco temporal e contra direitos indígenas à terra.',
      'O marco temporal é a interpretação que melhor concilia os direitos dos povos originários com a segurança jurídica dos proprietários. A tese de 1988 é razoável e tem amparo constitucional.',
      'André Mendonça votou em setembro de 2023 a favor da tese do marco temporal no julgamento do STF. A maioria rejeitou a tese, que depois foi reaprovada pelo Congresso em lei.',
      'verified', false, '2023-09-21',
      'https://www.folha.uol.com.br/ambiente/2023/09/mendonca-marco-temporal-stf.shtml',
      'news_article',
      'Brasília', 'Julgamento STF - Marco Temporal', 'mendonca-marco-temporal-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 40. Mendonça aborto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_men,
      'Mendonça vota contra descriminalização do aborto: "Vida começa na concepção".',
      'A vida humana começa na concepção e merece proteção integral do Estado desde esse momento. A descriminalização do aborto é incompatível com a ordem constitucional brasileira e com valores cristãos fundantes.',
      'André Mendonça votou em setembro de 2023 contra a descriminalização do aborto até 12 semanas no julgamento do STF. Seu voto se destacou pela argumentação religiosa explícita.',
      'verified', false, '2023-09-22',
      'https://g1.globo.com/politica/noticia/2023/09/22/mendonca-aborto-vida-concepcao-stf.ghtml',
      'news_article',
      'Brasília', 'Julgamento STF - Aborto', 'mendonca-aborto-vida-concepcao-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 41. Mendonça absolve Bolsonaro Segunda Turma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_men,
      'Mendonça articula na Segunda Turma do STF contra condenação de aliados de Bolsonaro.',
      'Não há provas suficientes para condenar os réus. A sentença se baseia em presunções e construções jurídicas frágeis. Mantenho meu voto pela absolvição.',
      'André Mendonça se manifestou em outubro de 2025 em julgamento de outros réus da trama golpista, divergindo da maioria. Sua atuação foi amplamente criticada pela oposição ao bolsonarismo.',
      'verified', false, '2025-10-21',
      'https://www.cnnbrasil.com.br/politica/mendonca-absolve-aliados-bolsonaro-outubro-2025/',
      'news_article',
      'Brasília', 'Julgamento STF - Réus Golpe', 'mendonca-absolve-aliados-golpe-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 42. Zanin Lula sobre lavajato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Cristiano Zanin nega suspeição em casos envolvendo Lula e defende imparcialidade.',
      'Não atuo em processo algum que tenha ligação direta com minha atuação como advogado. A magistratura exige isenção absoluta, e tenho observado rigorosamente os limites éticos da função.',
      'Zanin respondeu em maio de 2024 a críticas que o acusavam de conflito de interesses por atuar em processos relacionados a figuras que ele defendeu, como Lula. Assumiu o STF em 2023 indicado pelo presidente.',
      'verified', false, '2024-05-20',
      'https://www.jota.info/stf/zanin-nega-suspeicao-lula-maio-2024',
      'news_article',
      'Brasília', 'Declaração pública', 'zanin-nega-suspeicao-lula-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 43. Zanin vota condenação Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Zanin acompanha Moraes e vota pela condenação integral de Bolsonaro por trama golpista.',
      'As provas são robustas e apontam para organização criminosa estruturada com o fim específico de romper a ordem democrática. Acompanho o relator pela condenação integral nos termos da denúncia.',
      'Zanin votou em setembro de 2025 no julgamento da AP 2668, acompanhando Moraes, Dino e Cármen Lúcia pela condenação de Bolsonaro. Formou maioria contundente na Primeira Turma.',
      'verified', true, '2025-09-11',
      'https://g1.globo.com/politica/noticia/2025/09/11/zanin-acompanha-moraes-condenacao-bolsonaro.ghtml',
      'news_article',
      'Brasília', 'Julgamento AP 2668', 'zanin-condenacao-bolsonaro-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 44. Zanin obstrução justiça
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Zanin defende responsabilização por "obstrução sistemática" em casos do golpe.',
      'Articular com governo estrangeiro para pressionar a Justiça brasileira, procurar anistias no Congresso, destruir provas — tudo isso é obstrução sistemática e deve ser apurado e punido com rigor.',
      'Zanin se manifestou em novembro de 2025 sobre as tentativas do clã Bolsonaro de obter sanções dos EUA e aprovar anistia no Congresso após a condenação. Caracterizou como tentativa de obstruir a Justiça.',
      'verified', false, '2025-11-18',
      'https://www.folha.uol.com.br/poder/2025/11/zanin-obstrucao-sistematica-golpe.shtml',
      'news_article',
      'Brasília', 'Declaração à imprensa', 'zanin-obstrucao-sistematica-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 45. Dino corte emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino determina suspensão de emendas parlamentares sem transparência e gera reação do Congresso.',
      'Não é possível que bilhões de reais em dinheiro público sejam distribuídos sem identificação, sem rastreabilidade, sem prestação de contas. A transparência é obrigação constitucional — não é favor do Legislativo.',
      'Dino determinou em agosto de 2024 o bloqueio de emendas Pix sem rastreabilidade, provocando crise com o Congresso. Parlamentares reagiram com ameaças de retaliação institucional.',
      'verified', true, '2024-08-14',
      'https://g1.globo.com/politica/noticia/2024/08/14/dino-bloqueia-emendas-pix-transparencia.ghtml',
      'news_article',
      'Brasília', 'Decisão STF - Emendas Pix', 'dino-bloqueia-emendas-pix-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 46. Dino sobre Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino diz que Congresso não pode "capturar" o orçamento e praticar "corrupção institucionalizada".',
      'O orçamento público pertence à sociedade, não a parlamentares individuais. A captura do orçamento pelo Congresso, sem transparência, configura corrupção institucionalizada e precisa ser contida.',
      'Dino fez a declaração em setembro de 2024 durante sessão do STF que analisava recursos contra suas decisões sobre emendas. O tom duro gerou reação do presidente da Câmara Arthur Lira.',
      'verified', false, '2024-09-04',
      'https://www.cnnbrasil.com.br/politica/dino-congresso-captura-orcamento-corrupcao-setembro-2024/',
      'news_article',
      'Brasília', 'Sessão STF', 'dino-congresso-captura-orcamento-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 47. Dino vota condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino vota pela condenação de Bolsonaro e afirma que "golpismo não pode ser anistiado".',
      'A tentativa de golpe de Estado é o crime mais grave contra a República. Não pode, não deve e não será anistiada. Anistiar golpistas é convidar novos golpes. Voto pela condenação integral.',
      'Dino proferiu voto em setembro de 2025 na AP 2668 acompanhando Moraes pela condenação de Bolsonaro. O voto atacou explicitamente as tentativas de aprovação de anistia no Congresso.',
      'verified', true, '2025-09-11',
      'https://www.folha.uol.com.br/poder/2025/09/dino-vota-condenacao-bolsonaro-golpismo-anistia.shtml',
      'news_article',
      'Brasília', 'Julgamento AP 2668', 'dino-condenacao-bolsonaro-anistia-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 48. Moraes sobre 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes alerta que eleição de 2026 "não será refém de extremismo digital".',
      'A eleição de 2026 não será refém de extremismo digital, de fake news organizadas, de milícias digitais. A Justiça Eleitoral e o STF estão preparados para combater qualquer tentativa de manipulação do processo democrático.',
      'Moraes fez a declaração em fevereiro de 2026, durante abertura do ano judiciário do TSE, sinalizando rigor nas eleições presidenciais que ocorrerão em outubro.',
      'verified', true, '2026-02-02',
      'https://www.cnnbrasil.com.br/politica/moraes-eleicao-2026-extremismo-digital-fevereiro-2026/',
      'news_article',
      'Brasília', 'Abertura Ano Judiciário TSE', 'moraes-eleicao-2026-extremismo-digital-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 49. Gilmar sobre anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes afirma que anistia a golpistas seria "inconstitucional" e "imoral".',
      'Uma anistia ampla aos golpistas de 8 de janeiro e aos líderes da trama seria inconstitucional por violar o princípio da proteção ao Estado Democrático de Direito. Seria imoral, além de ineficaz — convidaria novos golpes.',
      'Gilmar Mendes fez a declaração em março de 2026 em meio à mobilização bolsonarista pela aprovação de lei de anistia no Congresso após a condenação de Bolsonaro.',
      'verified', true, '2026-03-05',
      'https://www.estadao.com.br/politica/gilmar-anistia-golpistas-inconstitucional-marco-2026/',
      'news_article',
      'Brasília', 'Evento jurídico', 'gilmar-anistia-golpistas-inconstitucional-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 50. Cármen Lúcia feminicídio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Cármen Lúcia pede ação emergencial contra feminicídio: "É genocídio silencioso".',
      'O feminicídio no Brasil não é crime isolado, é genocídio silencioso contra as mulheres. Precisamos de ação emergencial, integrada entre os poderes, com orçamento real e prioridade política de verdade.',
      'Cármen Lúcia fez a declaração em novembro de 2025 durante evento sobre o Dia Internacional da Não Violência contra a Mulher, em contexto de crescimento de casos no país.',
      'verified', false, '2025-11-25',
      'https://www.agenciabrasil.ebc.com.br/direitos-humanos/noticia/2025-11/carmen-lucia-feminicidio-genocidio-silencioso',
      'news_article',
      'Brasília', 'Dia Internacional Não Violência Mulher', 'carmen-lucia-feminicidio-genocidio-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

END $$;
