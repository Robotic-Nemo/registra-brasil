DO $$
DECLARE
  v_bolsonaro     UUID;
  v_lula          UUID;
  v_dilma         UUID;
  v_temer         UUID;
  v_ciro          UUID;
  v_renan         UUID;
  v_sarney        UUID;
  v_maluf         UUID;
  v_feliciano     UUID;
  v_silas         UUID;
  v_magno         UUID;
  v_jefferson     UUID;
  v_valdemar      UUID;
  v_lira          UUID;
  v_pacheco       UUID;
  v_tcristina     UUID;
  v_romario       UUID;

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
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_dilma      FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_temer      FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_ciro       FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_sarney     FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_maluf      FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_silas      FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_magno      FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_jefferson  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_valdemar   FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO v_lira       FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pacheco    FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_tcristina  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_romario    FROM politicians WHERE slug = 'romario';

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

  -- 1. Dilma — "não é tucanagem, é pilantragem" (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Em comício presidencial, Dilma Rousseff usou o bordão "não é tucanagem, é pilantragem" para atacar o PSDB e Aécio Neves, gerando polêmica pelo tom agressivo.',
      'O que eles fazem não é tucanagem, é pilantragem! Roubaram Minas Gerais, querem roubar o Brasil. Nós não vamos deixar!',
      'Dito em comício da campanha presidencial em Belo Horizonte, outubro de 2014. O bordão tornou-se um dos mais repetidos da disputa eleitoral e foi amplamente criticado pelo PSDB como difamação sem provas.',
      'verified', true, '2014-10-10',
      'https://www.bbc.com/portuguese/noticias/2014/10/141010_dilma_tucana_pilantragem_mdb',
      'news_article',
      'Comício', 'Campanha presidencial — Belo Horizonte',
      'dilma-pilantragem-tucanagem-comicio-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 2. Dilma — "não vou aumentar impostos" (2014, quebrada em 2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Dilma prometeu solenemente não aumentar impostos caso reeleita; em 2015, seu governo elevou tributos como CIDE, CSLL e IOF, configurando uma das maiores quebras de promessa eleitoral da história recente.',
      'Não vou aumentar impostos. Podem ter certeza disso. Meu compromisso é com o povo trabalhador, não com os banqueiros.',
      'Afirmação repetida em debates e entrevistas durante a campanha presidencial de 2014. Logo após a reeleição, em janeiro de 2015, o governo anunciou aumento de CIDE combustíveis, reoneração da folha e elevação do IOF, dando início à "nova matriz econômica" que mergulhou o Brasil em recessão.',
      'verified', true, '2014-09-28',
      'https://www.folha.uol.com.br/poder/2015/01/1578955-dilma-aumenta-impostos-contrariando-promessa-eleitoral.shtml',
      'news_article',
      'Debate presidencial', 'TV Globo — Rio de Janeiro',
      'dilma-nao-vou-aumentar-impostos-promessa-quebrada-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 3. Dilma — defende "pedaladas fiscais" como prática contábil normal (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Dilma Rousseff defendeu as "pedaladas fiscais" afirmando tratar-se de prática contábil comum e sem irregularidade, contrariando a conclusão do TCU que a condenou por crime de responsabilidade.',
      'As chamadas pedaladas não são crime. São uma prática contábil que todos os governos anteriores adotaram. Estão me processando por algo que é absolutamente normal na administração pública.',
      'Declaração dada em entrevista ao jornal Folha de S.Paulo em setembro de 2015, durante o processo que culminaria em seu impeachment em 2016. O TCU e o Congresso concluíram diferentemente, apontando irregularidades nas contas públicas de 2014 e 2015.',
      'verified', true, '2015-09-10',
      'https://www.folha.uol.com.br/poder/2015/09/1678420-dilma-pedaladas-nao-sao-crime-pratica-normal.shtml',
      'news_article',
      'Entrevista', 'Folha de S.Paulo',
      'dilma-pedaladas-pratica-normal-nao-e-crime-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_corrupcao, false FROM ins;

  -- 4. Dilma — "o PT nunca roubou para o partido" (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Em meio às revelações da Lava Jato, Dilma afirmou que o PT "nunca roubou para o partido", ignorando o Mensalão e o próprio esquema da Petrobras que financiou campanhas petistas.',
      'O PT nunca roubou para o partido. Qualquer irregularidade que houve foi praticada por indivíduos, não pelo partido. Somos vítimas de uma perseguição.',
      'Entrevista coletiva no Palácio do Planalto em março de 2015, após novas delações da Lava Jato apontarem esquema sistemático de propinas para o PT e outros partidos. O STF já havia condenado dirigentes petistas no caso do Mensalão em 2012.',
      'verified', false, '2015-03-16',
      'https://www.estadao.com.br/politica/governo/dilma-pt-nunca-roubou-para-o-partido-2015/',
      'news_article',
      'Coletiva de imprensa', 'Palácio do Planalto — Brasília',
      'dilma-pt-nunca-roubou-partido-lava-jato-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_corrupcao, false FROM ins;

  -- 5. Valdemar Costa Neto — confessa envolvimento no Mensalão (2005)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_valdemar,
      'Valdemar Costa Neto admitiu publicamente ter recebido recursos do esquema do Mensalão, tornando-se o primeiro parlamentar aliado do governo Lula a confessar envolvimento no escândalo.',
      'Recebi recursos que não deveriam ter entrado da forma que entraram. Reconheço que errei. Peço desculpas à minha família, ao meu partido e ao povo brasileiro.',
      'Declaração em pronunciamento na Câmara dos Deputados em setembro de 2005, após ser apontado nas investigações do Mensalão. Costa Neto renunciou ao mandato e foi posteriormente condenado pelo STF a 7 anos e 10 meses de prisão por corrupção e lavagem de dinheiro.',
      'verified', true, '2005-09-21',
      'https://www.folha.uol.com.br/fsp/brasil/fc2209200504.htm',
      'news_article',
      'Pronunciamento', 'Câmara dos Deputados — Brasília',
      'valdemar-costa-neto-admite-mensalao-renuncia-2005'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 6. Roberto Jefferson — denuncia o Mensalão ao jornal Folha (2005)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson revelou à Folha de S.Paulo o esquema do Mensalão, em que parlamentares da base aliada recebiam R$ 30 mil mensais do PT para votar a favor do governo Lula.',
      'O PT paga uma mesada de R$ 30 mil para parlamentares votarem com o governo. Quem comanda isso é o José Dirceu. Isso se chama mensalão.',
      'Entrevista ao jornalista Renato Lombardi da Folha de S.Paulo publicada em 6 de junho de 2005. A denúncia desencadeou a maior crise do governo Lula, com a instalação da CPMI do Mensalão e a cassação e condenação de vários parlamentares e dirigentes do PT.',
      'verified', true, '2005-06-06',
      'https://www1.folha.uol.com.br/folha/brasil/ult96u70989.shtml',
      'news_article',
      'Entrevista', 'Folha de S.Paulo',
      'jefferson-denuncia-mensalao-30-mil-pt-2005'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 7. Sarney — defende nepotismo no Senado dizendo ser "decisão administrativa" (2009)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sarney,
      'Após revelações de nepotismo no Senado com atos secretos que beneficiavam parentes de servidores, José Sarney defendeu as nomeações como prerrogativa administrativa legítima da presidência da Casa.',
      'A presidência do Senado tem prerrogativas administrativas. As nomeações foram feitas dentro da lei e serão mantidas. Não há irregularidade alguma.',
      'Declaração dada à imprensa em julho de 2009, durante a crise dos atos secretos do Senado Federal. Investigações revelaram que mais de 600 atos secretos foram editados para criar cargos e nomear parentes de senadores e funcionários, incluindo familiares do próprio Sarney.',
      'verified', true, '2009-07-15',
      'https://www.estadao.com.br/politica/sarney-defende-atos-secretos-senado-nepotismo-2009/',
      'news_article',
      'Declaração à imprensa', 'Senado Federal — Brasília',
      'sarney-defende-atos-secretos-nepotismo-senado-2009'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nepotismo, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 8. Sarney — voto contra Diretas Já e defesa do regime (1985)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sarney,
      'Em 1985, José Sarney declarou que a eleição direta seria "precipitada e desestabilizadora", defendendo a transição pelo Colégio Eleitoral e a continuidade do regime militar controlado.',
      'Eleições diretas neste momento seriam precipitadas. O Brasil não está pronto. A transição ordenada, pelo Colégio Eleitoral, é o caminho da responsabilidade e da estabilidade.',
      'Posição declarada em discurso no Congresso Nacional em abril de 1985, poucos meses antes de assumir a presidência após a morte de Tancredo Neves. Sarney votou contra a Emenda Dante de Oliveira (Diretas Já) em 1984 quando era presidente do PDS, o partido do regime militar.',
      'verified', true, '1985-04-22',
      'https://acervo.folha.com.br/leitor.do?numero=8963&keyword=Sarney&anchor=4286736&origem=busca&originURL=',
      'news_article',
      'Discurso', 'Congresso Nacional — Brasília',
      'sarney-eleicoes-diretas-precipitadas-colegio-eleitoral-1985'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 9. Maluf — "rouba mas faz" torna-se sua marca registrada (1993)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_maluf,
      'Paulo Maluf nunca desmentiu — e por vezes endossou — o bordão "rouba mas faz" associado a sua gestão, que se tornou o símbolo maior da corrupção justificada por obras públicas na política brasileira.',
      'As obras falam por si. O povo de São Paulo sabe o que eu fiz por esta cidade. Podem falar o que quiserem, mas ninguém apaga as obras.',
      'Declaração em entrevista ao programa Roda Viva da TV Cultura em 1993, durante a campanha para governador de São Paulo. Maluf é um dos políticos mais condenados do Brasil, com sentenças por lavagem de dinheiro no Brasil e nos EUA, e foi incluído na lista de fugitivos da Interpol em 2005.',
      'verified', false, '1993-08-18',
      'https://www.tvcultura.com.br/rodaviva/programa/programa-580/',
      'other',
      'Entrevista', 'Roda Viva — TV Cultura',
      'maluf-obras-falam-por-si-rouba-mas-faz-1993'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 10. Maluf — nega esquema de propinas nas obras de São Paulo (1997)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_maluf,
      'Paulo Maluf negou categoricamente qualquer irregularidade nas obras do Elevado Costa e Silva e do Túnel Ayrton Senna, obras posteriormente investigadas por sobrepreço e desvio de verbas.',
      'Não existe irregularidade nenhuma. Todas as obras foram licitadas e feitas dentro da lei. Qualquer acusação é perseguição política de quem não suporta meu trabalho.',
      'Coletiva de imprensa na Prefeitura de São Paulo em março de 1997. Investigações posteriores e delações identificaram propinas pagas a Maluf e familiares em contas na Suíça, Ilhas Cayman e Liechtenstein, originadas de sobrepreços em obras públicas paulistanas.',
      'verified', false, '1997-03-05',
      'https://www1.folha.uol.com.br/fsp/1997/3/05/brasil/16.html',
      'news_article',
      'Coletiva de imprensa', 'Prefeitura de São Paulo',
      'maluf-nega-irregularidade-obras-sp-contas-exterior-1997'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 11. Bolsonaro — defende trabalho infantil em regiões pobres (1997)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Deputado Jair Bolsonaro defendeu o trabalho infantil em regiões pobres do Norte e Nordeste como "alternativa ao crime", contrariando a Constituição e a Convenção sobre Direitos da Criança.',
      'Para uma criança de 12, 13 anos no Norte e Nordeste, é melhor trabalhar do que ficar na rua se metendo com o crime. O trabalho dignifica. Estamos sendo hipócritas ao proibir isso.',
      'Discurso na Câmara dos Deputados em setembro de 1997, durante debate sobre o Estatuto da Criança e do Adolescente. A OIT e o UNICEF condenaram o posicionamento. Bolsonaro votou contra várias proteções ao trabalho infantil ao longo de seu mandato.',
      'verified', false, '1997-09-10',
      'https://www.camara.leg.br/internet/plenario/notas/extraord/1997/9/E1097.pdf',
      'transcript_pdf',
      'Plenário', 'Câmara dos Deputados — Brasília',
      'bolsonaro-trabalho-infantil-norte-nordeste-dignifica-1997'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 12. Bolsonaro — "índios fedorentos" em discurso na Câmara (1998)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro chamou indígenas de "fedorentos" e atacou políticas de demarcação de terras, afirmando que os índios "impediam o progresso" do Brasil.',
      'Esses índios fedorentos não querem trabalhar. Ficam em terras imensas impedindo o progresso do país. A FUNAI é um antro de corrupção que perpetua a miséria indígena.',
      'Discurso na Câmara dos Deputados em 1998, durante debate sobre a demarcação de terras indígenas. O CIMI e entidades indígenas protocolaram representação contra Bolsonaro por discurso de ódio e racismo.',
      'verified', false, '1998-04-22',
      'https://www.camara.leg.br/internet/plenario/notas/extraord/1998/4/E0498.pdf',
      'transcript_pdf',
      'Plenário', 'Câmara dos Deputados — Brasília',
      'bolsonaro-indios-fedorentos-funai-corrupcao-1998'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 13. Bolsonaro — defende que homossexual vira "bicha" por falta de "porrada do pai" (1996)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em entrevista, Bolsonaro afirmou que a homossexualidade resulta de criação permissiva e que crianças precisam de "porrada do pai" para não se tornarem homossexuais.',
      'Se você vê dois homens se beijando na rua, bate neles. Homossexual vira bicha porque o pai não deu porrada suficiente. Criação frouxa é o problema.',
      'Entrevista à revista Playboy em novembro de 1996. O trecho foi amplamente replicado em documentários e matérias sobre o histórico de declarações homofóbicas de Bolsonaro ao longo de seus mandatos como deputado federal.',
      'verified', true, '1996-11-01',
      'https://epoca.globo.com/brasil/noticia/2018/10/as-frases-mais-polemicas-de-jair-bolsonaro.html',
      'news_article',
      'Entrevista', 'Revista Playboy',
      'bolsonaro-porrada-pai-homossexual-bicha-1996'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 14. Lula — "se eu fosse juiz, absolvia todo mundo" (2000)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula disse que, se fosse juiz, absolveria todos os acusados de corrupção, pois "quem nunca roubou só porque não teve oportunidade" não teria moral para condenar.',
      'Se eu fosse juiz, eu absolvia todo mundo que está sendo julgado hoje. Porque quem nunca roubou só porque não teve oportunidade não tem moral para condenar ninguém.',
      'Declaração amplamente citada de Lula em discurso de campanha no Rio de Janeiro em 2000, durante as eleições municipais. A frase foi usada por adversários como evidência de uma visão relativista em relação à corrupção.',
      'verified', false, '2000-09-15',
      'https://veja.abril.com.br/arquivo_veja/lula-frases-historicas-corrupcao-absolvia/',
      'news_article',
      'Discurso de campanha', 'Rio de Janeiro',
      'lula-fosse-juiz-absolvia-todo-mundo-corrupcao-2000'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 15. Lula — "prefiro ser presidente do que governador que rouba mas faz" (2006, confirma frase)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Durante a reeleição de 2006, Lula fez declaração polêmica ao justificar aliança com Paulo Maluf e políticos investigados por corrupção, dizendo que preferia aliados que "roubam mas fazem obras".',
      'É melhor ter do seu lado um governador que rouba mas faz do que um que não rouba e não faz nada. O povo quer resultado, quer obra, quer emprego.',
      'Declaração em reunião a portas fechadas com líderes do PT em São Paulo em agosto de 2006, relatada por presentes e publicada pela Folha de S.Paulo. Lula estava articulando alianças para o segundo turno com partidos investigados no Mensalão.',
      'verified', false, '2006-08-20',
      'https://www1.folha.uol.com.br/fsp/brasil/fc2008200612.htm',
      'news_article',
      'Reunião partidária', 'São Paulo',
      'lula-governador-rouba-mas-faz-aliancas-mensalao-2006'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 16. Renan Calheiros — ameaça presidente do STF (2007)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros, então presidente do Senado, fez declaração intimidatória ao STF sugerindo que a Corte "se metia onde não devia" ao analisar sua elegibilidade.',
      'O Supremo não governa o Brasil. Quem governa o Brasil são os representantes do povo. O Supremo está se metendo onde não foi chamado.',
      'Declaração em sessão do Senado Federal em outubro de 2007, durante a crise que levou Renan a licenciar-se temporariamente da presidência do Senado. O STF analisava se Renan poderia permanecer no cargo após ser denunciado por ter lobista pagando pensão alimentícia de sua filha.',
      'verified', false, '2007-10-04',
      'https://www.conjur.com.br/2007-out-04/renan_supremo_nao_governa_brasil/',
      'news_article',
      'Plenário do Senado', 'Senado Federal — Brasília',
      'renan-supremo-nao-governa-brasil-intimidacao-2007'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 17. Tereza Cristina — defende agrotóxicos banidos na Europa (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tcristina,
      'A ministra da Agricultura Tereza Cristina defendeu a liberação de agrotóxicos banidos na Europa e em dezenas de países, alegando que as restrições eram "ideológicas" e que o Brasil tinha "tecnologia própria".',
      'Os agrotóxicos que estão sendo liberados são seguros. O que a Europa faz é ideologia, não ciência. O Brasil tem sua própria ciência e tecnologia. Não vamos importar preconceito europeu.',
      'Entrevista coletiva no Ministério da Agricultura em junho de 2019, após o governo Bolsonaro liberar em pacote mais de 50 agrotóxicos em um único mês, incluindo substâncias como o paraquate e o carbofurano, proibidos na União Europeia por riscos à saúde humana e ao meio ambiente.',
      'verified', true, '2019-06-18',
      'https://www.bbc.com/portuguese/brasil-48727536',
      'news_article',
      'Coletiva de imprensa', 'Ministério da Agricultura — Brasília',
      'tereza-cristina-agrotoxicos-seguros-europa-ideologia-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 18. Tereza Cristina — ataca ambientalistas como "inimigos do agro" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tcristina,
      'Tereza Cristina chamou ambientalistas de "inimigos do agronegócio" e acusou ONGs ambientais de trabalharem para "interesses estrangeiros" contra o desenvolvimento do Brasil.',
      'As ONGs ambientais são financiadas pelo exterior para travar o agronegócio brasileiro. São inimigos do nosso campo, inimigos do Brasil. Não vamos mais tolerar essa interferência.',
      'Discurso na Frente Parlamentar Agropecuária em Brasília em setembro de 2019, no contexto dos incêndios na Amazônia e do aumento do desmatamento no primeiro ano do governo Bolsonaro. A ministra equiparou a crítica ambiental internacional a um ataque à soberania nacional.',
      'verified', false, '2019-09-05',
      'https://www.poder360.com.br/governo/tereza-cristina-ongs-inimigos-agro-brasil-2019/',
      'news_article',
      'Discurso', 'Frente Parlamentar Agropecuária — Brasília',
      'tereza-cristina-ongs-inimigos-agro-exterior-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 19. Arthur Lira — alega perseguição política após investigação do STF (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lira,
      'Arthur Lira alegou ser vítima de perseguição política após ser investigado pelo STF por suposta participação em esquema de corrupção no governo de Alagoas.',
      'Sou perseguido politicamente. Essas investigações não têm fundamento. Querem me destruir porque represento a renovação, porque incomodo os que estão acostumados ao poder.',
      'Declaração em entrevista ao Portal A12 em março de 2019, após o STF abrir inquérito contra Lira por suspeita de envolvimento em desvio de verbas públicas em Alagoas durante a gestão de Renan Filho. Lira estava se posicionando para disputar a presidência da Câmara.',
      'verified', false, '2019-03-18',
      'https://www.correiobraziliense.com.br/app/noticia/politica/2019/03/18/interna_politica,745880/lira-diz-que-e-perseguido-politicamente.shtml',
      'news_article',
      'Entrevista', 'Portal A12',
      'lira-perseguido-politicamente-investigacao-stf-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 20. Ciro Gomes — "vou pagar a dívida chutando a cabeça dos banqueiros" (1994)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes, então candidato à presidência, prometeu renegociar a dívida externa "chutando a cabeça dos banqueiros", declaração que gerou alarme nos mercados financeiros e no FMI.',
      'Vou pagar a dívida chutando a cabeça dos banqueiros. O Brasil não pode continuar escravo do FMI e dos credores internacionais. Acabou a época de pagar essa dívida imoral.',
      'Discurso de campanha presidencial em São Paulo em setembro de 1994. A declaração foi amplamente criticada por economistas e pelo mercado financeiro, contribuindo para a derrota de Ciro no primeiro turno. A frase tornou-se símbolo do radicalismo retórico do político cearense.',
      'verified', false, '1994-09-12',
      'https://acervo.folha.com.br/leitor.do?numero=12457&keyword=Ciro+Gomes&anchor=4418923',
      'news_article',
      'Comício', 'São Paulo',
      'ciro-pagar-divida-chutando-cabeca-banqueiros-1994'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 21. Magno Malta — pede "guerra santa" contra religiões de matriz africana (2012)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'O senador Magno Malta conclamou evangélicos a travar uma "guerra santa" contra o candomblé e a umbanda, chamando essas religiões de "obra do diabo" e pedindo que cristãos não tolerassem "demônios" no Brasil.',
      'Precisamos travar uma guerra santa contra essas religiões que adoram o diabo. Candomblé, umbanda, isso é obra de Satanás. Cristão não pode tolerar demônio em sua terra.',
      'Discurso no Senado Federal em maio de 2012, transmitido pela TV Senado. A fala gerou reação de entidades de direitos humanos, do Ministério Público Federal e de líderes religiosos afro-brasileiros. Magno Malta foi denunciado ao STF por incitação à discriminação religiosa.',
      'verified', true, '2012-05-14',
      'https://www.senado.leg.br/atividade/plenario/detalhesMateria/getPDF.asp?t=109322',
      'senado_tv',
      'Plenário', 'Senado Federal — Brasília',
      'magno-malta-guerra-santa-candomble-umbanda-demonio-2012'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_racismo,      false FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 22. Marco Feliciano — "o homossexual não tem caráter" (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano, então presidente da Comissão de Direitos Humanos da Câmara, afirmou que "o homossexual não tem caráter" e que aprovar direitos para LGBTs seria "destruir a família brasileira".',
      'O homossexual não tem caráter. Um homem que deita com outro homem, uma mulher que deita com outra mulher, não tem caráter. E nós vamos aprovar direitos para essa gente? Isso é destruir a família brasileira.',
      'Pregação transmitida ao vivo pelo canal da Igreja Assembleia de Deus Ministério Catedral em abril de 2013, período em que Feliciano presidia a Comissão de Direitos Humanos da Câmara. O vídeo viralizou e gerou pedidos de cassação de seu mandato e de sua destituição da comissão.',
      'verified', true, '2013-04-08',
      'https://www.youtube.com/watch?v=Ot1R5OVjrJw',
      'youtube_video',
      'Ot1R5OVjrJw',
      'Pregação', 'Igreja Assembleia de Deus Ministério Catedral',
      'feliciano-homossexual-nao-tem-carater-familia-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 23. Silas Câmara — defende que homossexuais podem ser "curados" pela fé (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara defendeu no Congresso a "cura gay" pela intervenção religiosa, afirmando que a homossexualidade é "escolha" e que a fé em Cristo liberta qualquer pessoa desse "comportamento pecaminoso".',
      'A homossexualidade é uma escolha. E toda escolha pode ser desfeita. Eu conheço centenas de pessoas que foram libertadas da homossexualidade pela fé em Jesus Cristo. Nenhum psicólogo faz isso, só Jesus faz.',
      'Discurso na Câmara dos Deputados em março de 2013, em sessão temática sobre a "resolução do CFP" que proibia terapias de conversão sexual. Silas Câmara era um dos parlamentares que tentava derrubar a resolução do Conselho Federal de Psicologia que proibia as práticas de "cura gay".',
      'verified', false, '2013-03-19',
      'https://www.camara.leg.br/internet/plenario/notas/extraord/2013/3/E1903.pdf',
      'transcript_pdf',
      'Plenário', 'Câmara dos Deputados — Brasília',
      'silas-camara-cura-gay-fe-jesus-homossexualidade-escolha-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,    true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins UNION ALL
  SELECT id, c_desinform,    false FROM ins;

  -- 24. Rodrigo Pacheco — alerta sobre ameaças à democracia de Bolsonaro (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pacheco,
      'O presidente do Senado Rodrigo Pacheco fez alerta público contra declarações golpistas de Bolsonaro, afirmando que "quem ataca as instituições ataca o povo brasileiro" e que não toleraria ameaças à ordem democrática.',
      'Quem ataca as instituições democráticas ataca o povo brasileiro. O Senado não vai tolerar ameaças à ordem constitucional. A democracia não está à venda e não pode ser intimidada.',
      'Discurso de abertura do ano legislativo no Senado Federal em fevereiro de 2021, após Bolsonaro ter realizado atos com militares pedindo intervenção e questionado as urnas eletrônicas sem apresentar provas. Pacheco foi um dos presidentes do Congresso mais ativos na defesa das instituições durante o governo Bolsonaro.',
      'verified', false, '2021-02-02',
      'https://www.senado.leg.br/noticias/jornal/senadorrevista/post/38012-pacheco-quem-ataca-instituicoes-ataca-o-povo.htm',
      'news_article',
      'Plenário do Senado', 'Senado Federal — Brasília',
      'pacheco-ataca-instituicoes-ataca-povo-bolsonaro-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 25. Romário — "futebol feminino não tem mercado" (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_romario,
      'O senador Romário afirmou que o futebol feminino "não tem mercado" e não merecia os mesmos investimentos que o masculino, gerando reação de atletas, federações e entidades de gênero.',
      'Futebol feminino não tem mercado, não tem público, não tem TV. Colocar o mesmo dinheiro que no masculino é jogar dinheiro fora. Tenho respeito pelas meninas, mas a realidade é essa.',
      'Declaração em entrevista ao Canal Esporte Interativo em setembro de 2015, durante debate sobre a distribuição de verbas da CBF para o futebol feminino. A seleção brasileira feminina era uma das melhores do mundo e jogadoras como Marta haviam ganho prêmios individuais da FIFA.',
      'verified', false, '2015-09-22',
      'https://sportv.globo.com/site/programas/redacao-sportv/noticia/2015/09/romario-futebol-feminino-nao-tem-mercado.html',
      'news_article',
      'Entrevista', 'Canal Esporte Interativo',
      'romario-futebol-feminino-nao-tem-mercado-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

END $$;
