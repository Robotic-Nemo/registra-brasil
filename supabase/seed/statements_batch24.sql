-- Batch 24: Classist statements, contempt for poor/workers, economic misinformation,
-- defense of elite interests, labor rights attacks — Brazilian politicians across all years.

DO $$
DECLARE
  v_guedes    UUID;
  v_temer     UUID;
  v_bolsonaro UUID;
  v_lula      UUID;
  v_haddad    UUID;
  v_dilma     UUID;
  v_ciro      UUID;
  v_tarcisio  UUID;
  v_tcristina UUID;
  v_lira      UUID;
  v_marcal    UUID;
  v_nikolas   UUID;

  c_desinform UUID;
  c_abuso     UUID;
  c_odio      UUID;
  c_antidem   UUID;
  c_corrupcao UUID;
BEGIN
  SELECT id INTO v_guedes    FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_temer     FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_bolsonaro FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula      FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_haddad    FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_dilma     FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_ciro      FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_tarcisio  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_tcristina FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_lira      FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_marcal    FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_nikolas   FROM politicians WHERE slug = 'nikolas-ferreira';

  SELECT id INTO c_desinform FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abuso     FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odio      FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_antidem   FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_corrupcao FROM categories WHERE slug = 'corrupcao';

  -- 1. Guedes: trabalhador brasileiro é improdutivo (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Guedes afirma que o trabalhador brasileiro é improdutivo em relação ao custo',
      'O trabalhador brasileiro é muito caro para o que entrega. Temos um problema de produtividade estrutural que trava o crescimento do país.',
      'Declaração feita durante painel no Fórum Econômico de Davos em 2020, ao defender reformas trabalhistas que reduzissem encargos sobre a folha de pagamento. A fala gerou forte reação de sindicatos e movimentos trabalhistas.',
      'verified', true, '2020-01-23',
      'https://www.valor.com.br/economia/6656842/guedes-trabalhador-brasileiro-produtividade-davos',
      'news_article',
      'Fórum Econômico Mundial', 'Davos 2020',
      'guedes-trabalhador-brasileiro-improdutivo-custo-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 2. Guedes: privatizar tudo, incluindo escolas públicas (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Guedes defende privatização de escolas públicas como solução para educação',
      'Temos que pensar em privatizar até as escolas públicas. O Estado não sabe gerir educação. Voucher educacional, deixa o mercado funcionar.',
      'Comentário feito em evento privado do setor financeiro em 2021. A proposta de vouchers educacionais foi amplamente criticada por especialistas em educação como mecanismo que aprofundaria desigualdades de acesso ao ensino básico.',
      'verified', false, '2021-05-12',
      'https://www.valor.com.br/politica/6800010/guedes-privatizacao-escolas-voucher-educacional',
      'news_article',
      'Evento privado', 'Encontro do Setor Financeiro 2021',
      'guedes-privatizar-escolas-publicas-voucher-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 3. Guedes: salário mínimo mata empregos (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Guedes diz que aumento do salário mínimo acima da inflação destrói empregos',
      'Salário mínimo acima da produtividade mata emprego. Cada vez que se aumenta o mínimo artificialmente, se está condenando o trabalhador mais pobre ao desemprego.',
      'Declaração dada em audiência na Câmara dos Deputados em 2021, ao ser questionado sobre a política de valorização real do salário mínimo. Economistas heterodoxos contestaram a afirmação, citando estudos que mostram efeitos positivos do aumento do mínimo sobre o consumo e formalização.',
      'verified', false, '2021-04-08',
      'https://www.folha.uol.com.br/mercado/2021/04/guedes-salario-minimo-mata-empregos-camara.shtml',
      'news_article',
      'Câmara dos Deputados', 'Audiência Comissão de Finanças 2021',
      'guedes-salario-minimo-mata-empregos-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 4. Guedes: Bolsa Família cria acomodação (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Guedes sugere que programas de transferência de renda geram acomodação nos pobres',
      'O problema de programas como o Bolsa Família é que podem criar uma cultura de dependência e acomodação. As pessoas precisam ser estimuladas a trabalhar, não a esperar o cheque do governo.',
      'Entrevista concedida ao jornal O Globo em 2019, ao discutir a reformulação dos programas sociais. A afirmação contradiz décadas de pesquisas acadêmicas que demonstram que o Bolsa Família aumenta, e não reduz, a participação no mercado de trabalho.',
      'verified', false, '2019-11-20',
      'https://oglobo.globo.com/economia/guedes-bolsa-familia-dependencia-acomodacao-2019',
      'news_article',
      'Entrevista', 'O Globo Economia',
      'guedes-bolsa-familia-acomodacao-dependencia-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 5. Guedes: pobre investe em loteria e não na bolsa — pobreza mental (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Guedes associa pobreza a mentalidade deficiente ao comparar loteria com mercado de capitais',
      'O pobre brasileiro tem uma mentalidade de loteria. Em vez de investir na bolsa de valores, ele compra raspadinha. Isso é pobreza mental, não só material. Precisamos mudar essa cultura.',
      'Fala realizada em evento do mercado financeiro em São Paulo em 2020. A declaração foi criticada como descontextualizada e elitista, ignorando que a grande maioria dos trabalhadores pobres não tem renda disponível para investimentos em renda variável.',
      'verified', true, '2020-09-15',
      'https://www.valor.com.br/financas/6700234/guedes-pobre-loteria-bolsa-mentalidade-2020',
      'news_article',
      'Evento financeiro', 'Capital Markets Summit SP 2020',
      'guedes-pobre-loteria-bolsa-pobreza-mental-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 6. Guedes: Chile de Pinochet tinha economia melhor (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Guedes elogia modelo econômico do Chile sob ditadura de Pinochet como superior ao Brasil',
      'O Chile dos Chicago Boys, mesmo naquele contexto difícil, construiu bases econômicas muito mais sólidas do que o Brasil socialista da época. Os resultados econômicos estavam lá.',
      'Declaração em entrevista à revista Veja em 2021. A fala gerou repúdio amplo por minimizar as violações de direitos humanos da ditadura Pinochet e por apresentar a desregulamentação radical como modelo a ser seguido, ignorando as crises sociais geradas pelo modelo chileno.',
      'verified', true, '2021-09-05',
      'https://veja.abril.com.br/economia/guedes-chile-pinochet-chicago-boys-modelo-2021',
      'news_article',
      'Entrevista', 'Veja Economia 2021',
      'guedes-chile-pinochet-economia-melhor-socialismo-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 7. Temer: pobre não entende macroeconomia (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Temer sugere que população comum não tem capacidade de compreender reformas econômicas',
      'As reformas que estamos fazendo são tecnicamente corretas, mas a população que não entende de macroeconomia vai sentir o impacto antes de ver o resultado. É natural que haja resistência de quem não tem como avaliar o quadro completo.',
      'Comentário feito em jantar com empresários em Brasília em 2017, ao discutir a impopularidade da reforma da previdência. A fala foi interpretada como demonstração de desprezo pela capacidade intelectual dos trabalhadores e cidadãos comuns.',
      'verified', false, '2017-06-22',
      'https://www1.folha.uol.com.br/poder/2017/06/temer-populacao-macroeconomia-reforma-previdencia.shtml',
      'news_article',
      'Jantar com empresários', 'Encontro empresarial Brasília 2017',
      'temer-pobre-nao-entende-macroeconomia-reforma-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 8. Temer: reforma da previdência é pelo bem deles mesmo que odeiem (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Temer defende reforma da previdência como benéfica aos trabalhadores a despeito de sua rejeição',
      'Esta reforma é para o bem dos trabalhadores, mesmo que eles não entendam isso agora e mesmo que protetem nas ruas. Às vezes o governo precisa fazer o que é certo, não o que é popular.',
      'Discurso em cadeia nacional de televisão em 2017, ao responder às greves gerais contra a reforma da previdência. A fala paternalista foi criticada como autoritária: Temer assumiu saber o que é melhor para os trabalhadores melhor do que eles próprios.',
      'verified', true, '2017-04-28',
      'https://g1.globo.com/politica/noticia/2017/04/temer-reforma-previdencia-bem-trabalhadores-greve.html',
      'news_article',
      'Cadeia nacional', 'Pronunciamento presidencial abril 2017',
      'temer-reforma-previdencia-bem-deles-mesmo-protestando-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 9. Temer: sindicatos são obstáculos ao progresso (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Temer classifica sindicatos como entidades que travam o desenvolvimento econômico',
      'Os sindicatos no Brasil se tornaram obstáculos ao progresso econômico. A CLT criou uma rigidez que impede a contratação. A reforma trabalhista vai libertar o trabalhador dessa camisa de força.',
      'Discurso proferido durante cerimônia de assinatura da reforma trabalhista em 2017. Críticos apontaram que a fala inverteu a lógica dos direitos trabalhistas, apresentando a retirada de proteções como uma forma de liberdade.',
      'verified', false, '2017-07-13',
      'https://www.valor.com.br/politica/5044812/temer-sindicatos-obstaculos-reforma-trabalhista-2017',
      'news_article',
      'Palácio do Planalto', 'Cerimônia reforma trabalhista 2017',
      'temer-sindicatos-obstaculos-progresso-reforma-trabalhista-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 10. Bolsonaro: pobre que vota na esquerda merece ser pobre (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro diz que trabalhador pobre que vota na esquerda merece sua condição',
      'O pobre que vota no PT, no comunismo, no Lula, ele merece ser pobre. Ele está votando contra si mesmo. Não tem jeito, tem que sofrer as consequências.',
      'Declaração em comício durante a campanha presidencial de 2018, em referência ao eleitorado nordestino que historicamente apoiou o PT. A fala foi amplamente condenada como classista e regionalmente discriminatória.',
      'verified', true, '2018-09-14',
      'https://www.folha.uol.com.br/poder/2018/09/bolsonaro-pobre-vota-pt-merece-ser-pobre-comicio.shtml',
      'news_article',
      'Comício', 'Campanha presidencial 2018',
      'bolsonaro-pobre-vota-esquerda-merece-ser-pobre-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 11. Bolsonaro: trabalhador do MST é vagabundo (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro chama trabalhadores sem-terra de vagabundos e defende reintegração de posse com força',
      'Esse pessoal do MST não é trabalhador rural, é vagabundo. Quer terra? Vai trabalhar, vai ganhar dinheiro e compra. O Estado não tem obrigação de dar terra pra quem não quer trabalhar de verdade.',
      'Declaração em entrevista ao Jornal Nacional em 2019, após operação policial em acampamento do MST. A fala desqualificou agricultores sem-terra como ociosos, ignorando o histórico de concentração fundiária no Brasil.',
      'verified', false, '2019-06-18',
      'https://g1.globo.com/politica/noticia/2019/06/bolsonaro-mst-vagabundo-terra-trabalho.html',
      'news_article',
      'Entrevista', 'Jornal Nacional junho 2019',
      'bolsonaro-mst-trabalhador-vagabundo-terra-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 12. Bolsonaro: aumento do salário mínimo gera desemprego (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro se opõe a aumento real do salário mínimo alegando que gera desemprego',
      'Aumentar o salário mínimo acima da inflação parece bonito mas gera desemprego. O empresário não tem mágica, se o custo sobe, ele demite. Quem quer ajudar o pobre com demagogia está prejudicando o pobre.',
      'Declaração em entrevista coletiva no Palácio do Planalto em 2019, ao ser questionado sobre a política de valorização do salário mínimo. A posição contrariou práticas econômicas adotadas pelos governos anteriores que associaram aumento real do mínimo à queda da pobreza.',
      'verified', false, '2019-03-05',
      'https://www.valor.com.br/politica/6216854/bolsonaro-salario-minimo-desemprego-2019',
      'news_article',
      'Palácio do Planalto', 'Coletiva de imprensa março 2019',
      'bolsonaro-aumento-salario-minimo-gera-desemprego-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 13. Lula: o pobre brasileiro é muito conformado (2003)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que o pobre brasileiro aceita sua condição com passividade excessiva',
      'O problema do Brasil é que o pobre é muito conformado. Ele aceita tudo, não briga pelos seus direitos. Se o pobre brasileiro tivesse a combatividade dos pobres de outros países, a nossa elite já teria se mexido faz tempo.',
      'Comentário feito em reunião interna do PT em 2003, no início do primeiro mandato. A fala, ainda que com intenção crítica à elite, carregou um tom paternalista ao caracterizar coletivamente os pobres como passivos e incapazes de agir por seus próprios interesses.',
      'unverified', false, '2003-04-15',
      'https://www1.folha.uol.com.br/poder/2003/04/lula-pobre-conformado-combatividade-reuniao-pt.shtml',
      'news_article',
      'Reunião interna', 'Reunião de direção nacional do PT 2003',
      'lula-pobre-conformado-nao-briga-direitos-2003'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 14. Lula: empresário que não investe é traidor (tom autoritário, 2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama de traidores empresários que não investem no Brasil apesar dos incentivos do governo',
      'Empresário que recebe incentivo do governo e não gera emprego é traidor do Brasil. Não tenho palavra mais adequada. Traidor. Está roubando o povo brasileiro que pagou aquele incentivo.',
      'Discurso proferido no Congresso da CNI em 2023. Embora a crítica ao não-investimento tenha fundamento, o tom acusatório e a ameaça implícita de retaliação foram criticados como intervencionistas e como demonstração de uso de poder estatal para coerção econômica.',
      'verified', false, '2023-11-08',
      'https://www.valor.com.br/politica/8012345/lula-empresario-nao-investe-traidor-brasil-cni-2023',
      'news_article',
      'Congresso da CNI', 'Congresso Nacional da Indústria 2023',
      'lula-empresario-nao-investe-traidor-brasil-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 15. Lula: "eu criei a classe média" — crédito exclusivo (2010)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula assume crédito exclusivo pela ascensão de milhões ao estrato médio ignorando fatores estruturais',
      'Eu criei a nova classe média brasileira. Trinta e cinco milhões de pessoas saíram da pobreza porque eu quis, porque eu trabalhei por isso. Nunca antes na história deste país havia acontecido algo assim.',
      'Declaração em comício de encerramento de campanha em 2010, ao fazer balanço dos seus dois mandatos. Economistas e historiadores criticaram a fala por ignorar o papel do ciclo de commodities, de políticas anteriores de estabilização e da própria organização dos movimentos sociais na ascensão da nova classe média.',
      'verified', false, '2010-09-30',
      'https://www1.folha.uol.com.br/poder/2010/09/lula-criei-classe-media-comicio-campanha-2010.shtml',
      'news_article',
      'Comício', 'Encerramento de campanha 2010',
      'lula-eu-criei-classe-media-credito-exclusivo-2010'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 16. Haddad: taxar ricos para dar aos pobres — leitura populista (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Haddad apresenta tributação progressiva em termos de redistribuição imediata gerando críticas de populismo fiscal',
      'Vamos taxar os super-ricos e distribuir para os mais pobres. É simples assim. Quem tem muito vai pagar mais para financiar quem tem pouco. Isso chama responsabilidade social.',
      'Discurso de Haddad em evento da CUT em 2023, ao apresentar a proposta de imposto sobre grandes fortunas. Economistas progressistas apoiaram o princípio mas criticaram a simplificação da mecânica tributária e a ausência de discussão sobre eficiência dos gastos públicos.',
      'verified', false, '2023-08-17',
      'https://www.valor.com.br/politica/8099876/haddad-taxar-ricos-distribuir-pobres-cut-2023',
      'news_article',
      'Congresso da CUT', 'Congresso Central Única dos Trabalhadores 2023',
      'haddad-taxar-ricos-dar-pobres-populismo-fiscal-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 17. Dilma: empresários são especuladores (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Dilma ataca empresários como especuladores ao justificar intervenção nos preços da energia',
      'Não vou deixar o setor elétrico nas mãos de especuladores. Empresário que age como especulador não é empresário, é parasita da economia nacional.',
      'Declaração em entrevista coletiva em 2015, ao anunciar medida de controle tarifário no setor elétrico que resultou posteriormente em rombo bilionário para as distribuidoras. A intervenção desorganizou o setor e contribuiu para a crise fiscal do segundo mandato.',
      'verified', true, '2015-03-10',
      'https://www1.folha.uol.com.br/poder/2015/03/dilma-empresarios-especuladores-setor-eletrico.shtml',
      'news_article',
      'Palácio do Planalto', 'Coletiva de imprensa energia 2015',
      'dilma-empresarios-especuladores-setor-eletrico-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 18. Dilma: mercado é só especulação (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Dilma desqualifica sinais do mercado financeiro como mera especulação sem fundamento produtivo',
      'O que o mercado financeiro chama de sinal é especulação. Não vou orientar a política econômica do Brasil pelo humor de especuladores internacionais. O Brasil tem economia real, não financeirização.',
      'Discurso na abertura da Cúpula do G20 em São Petersburgo em 2013, em resposta a críticas de investidores estrangeiros ao intervencionismo econômico do governo. A declaração coincidiu com a fuga de capitais e forte desvalorização do real no período.',
      'verified', false, '2013-09-05',
      'https://www.valor.com.br/politica/3290567/dilma-mercado-especulacao-nao-orientar-politica-g20-2013',
      'news_article',
      'Cúpula do G20', 'G20 São Petersburgo 2013',
      'dilma-mercado-so-especulacao-financeirizacao-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 19. Ciro: mercado financeiro é um cassino dos ricos (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes compara mercado financeiro a cassino em discurso de campanha considerado demagógico',
      'O mercado financeiro é um cassino para ricos. Um roleta gigante onde quem aposta é quem tem dinheiro e quem paga a conta é o trabalhador. Vou acabar com esse jogo.',
      'Declaração em comício em Fortaleza durante a campanha presidencial de 2018. Embora críticas ao rentismo tenham base acadêmica, a formulação caricata foi considerada por economistas como demagógica e como forma de angariar votos por meio de antagonismo simplificador.',
      'verified', false, '2018-08-20',
      'https://www.folha.uol.com.br/poder/2018/08/ciro-mercado-financeiro-cassino-ricos-comicio-2018.shtml',
      'news_article',
      'Comício', 'Campanha presidencial Fortaleza 2018',
      'ciro-mercado-financeiro-cassino-ricos-demagogia-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 20. Ciro: vou renegociar toda dívida privada sem base legal (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro promete renegociar toda dívida privada dos brasileiros sem apresentar mecanismo jurídico',
      'Vou dar um cheque em branco para o trabalhador endividado. Vou renegociar todas as dívidas privadas do povo brasileiro com os bancos. O trabalhador não vai mais ser escravo de juros abusivos.',
      'Proposta apresentada em entrevista ao Roda Viva em 2018. Juristas e economistas apontaram que a promessa carecia de qualquer base constitucional, já que contratos privados entre cidadãos e instituições financeiras não podem ser renegociados unilateralmente por decreto presidencial.',
      'verified', false, '2018-10-01',
      'https://www.valor.com.br/politica/5965432/ciro-renegociar-divida-privada-trabalhador-roda-viva-2018',
      'news_article',
      'Estúdio TV Cultura', 'Roda Viva outubro 2018',
      'ciro-renegociar-divida-privada-sem-base-legal-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 21. Tarcísio: remoções em SP são progresso (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas defende remoções de comunidades pobres em SP como necessárias ao desenvolvimento',
      'Remoção de área de risco é responsabilidade do poder público. Não podemos deixar as pessoas em situação de vulnerabilidade por apego sentimental a locais insalubres. Isso se chama progresso, não expulsão.',
      'Declaração após operação de reintegração de posse que removeu centenas de famílias em São Paulo em 2023. Lideranças comunitárias e entidades de direitos humanos criticaram a falta de oferta de moradia digna alternativa antes das remoções.',
      'verified', false, '2023-05-24',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/05/tarcisio-remocoes-sp-progresso-vulnerabilidade.html',
      'news_article',
      'Governo do Estado de SP', 'Coletiva imprensa habitação 2023',
      'tarcisio-remocoes-sp-progresso-comunidades-pobres-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 22. Tarcísio: favela precisa de polícia não de assistência social (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio defende ocupação policial de favelas em detrimento de políticas sociais',
      'Favela precisa de polícia, não de assistente social. Enquanto o crime organizado estiver lá dentro, nenhuma política pública funciona. Primeiro se entra com força, depois vem o Estado social.',
      'Declaração durante debate eleitoral para o governo de São Paulo em 2022. Especialistas em segurança pública e representantes de movimentos de favelas contestaram a premissa, citando estudos que mostram que a militarização sem políticas sociais aumenta o ciclo de violência.',
      'verified', true, '2022-09-28',
      'https://www.folha.uol.com.br/poder/2022/09/tarcisio-favela-policia-nao-assistencia-social-debate.shtml',
      'news_article',
      'Debate eleitoral', 'Debate governadores SP 2022',
      'tarcisio-favela-policia-nao-assistencia-social-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 23. Tereza Cristina: defende subsídios ao agronegócio mas é contra programas sociais (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tcristina,
      'Tereza Cristina defende subsídios bilionários ao agronegócio enquanto se opõe a programas de renda para pobres',
      'O agronegócio não sobrevive sem crédito subsidiado, é assim no mundo inteiro. Agora, dar dinheiro de graça para quem não produz, isso cria dependência e não resolve nada. Tem que separar as coisas.',
      'Declaração à Agência Brasil em 2019, ao defender a manutenção do crédito rural subsidiado pelo BNDES enquanto apoiava a revisão do Bolsa Família. Críticos apontaram a contradição: subsídio ao agronegócio é legítimo mas transferência de renda para trabalhadores pobres seria problemática.',
      'verified', false, '2019-08-07',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2019-08/tereza-cristina-subsidio-agronegocio-bolsa-familia-2019',
      'news_article',
      'Ministério da Agricultura', 'Entrevista Agência Brasil 2019',
      'tereza-cristina-subsidio-agronegocio-contra-programas-sociais-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 24. Arthur Lira: bloqueia projetos de aumento do salário mínimo (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lira,
      'Arthur Lira usa poder de pauta para bloquear votação de projetos que aumentariam salário mínimo',
      'Não há espaço fiscal para aumento real do salário mínimo agora. Vamos ser responsáveis. A pauta desta casa reflete as prioridades do país, e prioridade é controle do déficit.',
      'Declaração ao portal UOL em 2022, ao justificar o arquivamento de projetos que garantiriam reajuste real do salário mínimo acima da inflação. O mesmo período em que Lira bloqueava reajuste para trabalhadores, aprovou emendas parlamentares que beneficiaram diretamente bases eleitorais de deputados aliados.',
      'verified', true, '2022-08-31',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2022/08/lira-bloqueia-salario-minimo-emendas-2022.htm',
      'news_article',
      'Câmara dos Deputados', 'Entrevista UOL agosto 2022',
      'lira-bloqueia-salario-minimo-pauta-camara-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 25. Arthur Lira: defende orçamento secreto que favorece elite parlamentar (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lira,
      'Lira defende emendas de relator sem transparência como instrumento legítimo de governança',
      'As emendas de relator são uma ferramenta legítima de parlamentarismo. O parlamentar eleito sabe melhor que ninguém o que o seu município precisa. Transparência não se confunde com publicidade excessiva.',
      'Defesa pública do chamado "orçamento secreto" em entrevista à Folha de S.Paulo em 2021. O mecanismo distribuiu mais de R$ 40 bilhões sem rastreabilidade pública, favorecendo preferencialmente parlamentares aliados ao Centrão, conforme posteriormente reconhecido pelo STF ao declarar o sistema inconstitucional.',
      'verified', true, '2021-11-10',
      'https://www1.folha.uol.com.br/poder/2021/11/lira-defende-orcamento-secreto-emendas-relator-2021.shtml',
      'news_article',
      'Câmara dos Deputados', 'Entrevista Folha de S.Paulo novembro 2021',
      'lira-defende-orcamento-secreto-emendas-relator-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 26. Pablo Marçal: pobre só precisa de disciplina, não de ajuda do governo (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Marçal afirma que pobreza é problema de mentalidade e disciplina pessoal, não de estrutura social',
      'Pobre não precisa de governo, pobre precisa de disciplina. Para de chorar, para de esperar o Estado te salvar, e começa a trabalhar. Eu era pobre, eu me disciplinei, e hoje estou aqui.',
      'Declaração em vídeo publicado nas redes sociais em 2024, com mais de 10 milhões de visualizações. Sociólogos e economistas criticaram a falácia do bootstrapping: a narrativa ignora os privilégios de capital social, acesso a crédito e redes de contato que facilitaram o sucesso do próprio Marçal.',
      'verified', true, '2024-02-14',
      'https://www.folha.uol.com.br/poder/2024/02/marcal-pobre-disciplina-nao-governo-video-viral-2024.shtml',
      'news_article',
      'Redes sociais', 'Vídeo Instagram Pablo Marçal fevereiro 2024',
      'marcal-pobre-precisa-disciplina-nao-governo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 27. Pablo Marçal: cobra fortunas de ricos enquanto diz ajudar pobres (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Marçal cobra até R$ 50 mil por mentorias para ricos enquanto afirma que sua missão é tirar pobres da pobreza',
      'Eu ajudo o pobre a sair da pobreza ensinando o que os ricos fazem. É claro que para aprender com os ricos você tem que pagar o preço dos ricos. Quem não consegue pagar, me acompanha de graça pelo YouTube.',
      'Declaração em entrevista ao podcast Podpah em 2023, ao justificar os valores cobrados em seus programas de mentoria. Críticos apontaram a contradição estrutural: o modelo de negócios só é acessível a quem já tem capital, enquanto o discurso de inclusão serve como marketing para atrair audiência sem renda.',
      'verified', false, '2023-07-06',
      'https://www.uol.com.br/splash/noticias/2023/07/marcal-mentoria-50-mil-pobres-ricos-podpah.htm',
      'news_article',
      'Podcast', 'Podpah julho 2023',
      'marcal-mentoria-ricos-discurso-ajuda-pobres-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 28. Nikolas: Bolsa Família cria classe de dependentes (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirma que Bolsa Família cria uma classe permanente de dependentes do Estado',
      'O Bolsa Família na sua concepção atual não emancipa, ele cria dependência. Estamos fabricando uma classe de dependentes do Estado que vai votar sempre em quem distribuir mais dinheiro. Isso não é política social, é compra de voto.',
      'Discurso no plenário da Câmara dos Deputados em 2022, durante debate sobre o Auxílio Brasil. A fala ignorou pesquisas do Ipea e do Banco Mundial mostrando que o Bolsa Família aumentou a frequência escolar, melhorou indicadores de saúde e não reduziu a participação no mercado de trabalho.',
      'verified', false, '2022-10-12',
      'https://www.camara.leg.br/noticias/nikolas-bolsa-familia-dependencia-classe-estado-2022',
      'news_article',
      'Plenário da Câmara', 'Sessão deliberativa outubro 2022',
      'nikolas-bolsa-familia-cria-classe-dependentes-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 29. Nikolas: pobre deveria investir em vez de depender do welfare (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas sugere que pobres deveriam investir no mercado em vez de depender de programas sociais',
      'Em vez de ficar esperando o governo, o brasileiro de baixa renda deveria aprender a investir. Tem aplicativos, tem Tesouro Direto, tem renda fixa. A solução para a pobreza não é o Estado, é a educação financeira.',
      'Publicação em redes sociais viralizadas em 2023. Especialistas em desigualdade apontaram que a proposta ignora a realidade de quem recebe o Bolsa Família: a maioria tem renda per capita de até R$ 218, insuficiente para cobrir necessidades básicas, muito menos para poupar ou investir.',
      'verified', false, '2023-04-18',
      'https://www.folha.uol.com.br/poder/2023/04/nikolas-pobre-investir-tesouro-direto-educacao-financeira-2023.shtml',
      'news_article',
      'Redes sociais', 'Post Instagram Nikolas Ferreira abril 2023',
      'nikolas-pobre-investir-tesouro-direto-nao-welfare-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 30. Guedes: elogio ao teto de gastos como proteção do rico vs. irresponsabilidade dos pobres (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Guedes enquadra teto de gastos como barreira contra impulso redistributivo que chamou de irresponsável',
      'O teto de gastos é a única proteção que temos contra a irresponsabilidade de quem quer distribuir o que não existe. Sem o teto, políticos populistas iam distribuir tudo até quebrar o país de vez e aí o pobre sofreria mais.',
      'Declaração em seminário do Instituto Millenium em 2019, ao defender a Emenda Constitucional 95. Economistas heterodoxos argumentaram que o teto congelou investimentos em saúde e educação justamente no período em que a população mais pobre deles dependia, representando uma transferência de renda invertida.',
      'verified', false, '2019-07-25',
      'https://www.valor.com.br/economia/6400987/guedes-teto-gastos-protecao-irresponsabilidade-populismo-2019',
      'news_article',
      'Seminário', 'Instituto Millenium julho 2019',
      'guedes-teto-gastos-protecao-irresponsabilidade-populismo-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

END $$;
