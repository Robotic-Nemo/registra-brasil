-- Batch 32: Environmental destruction, anti-indigenous policies, land conflicts,
-- agribusiness vs. environment, deforestation denialism.
-- 30 statements across Brazilian politicians.

DO $$
DECLARE
  v_bol UUID; v_tar UUID; v_ter UUID; v_mou UUID; v_dam UUID;
  v_nik UUID; v_zam UUID; v_bia UUID; v_gue UUID; v_lula UUID;
  v_gle UUID; v_jan UUID; v_cir UUID; v_ren UUID; v_mor UUID;
  v_fel UUID; v_sil UUID; v_lir UUID; v_mar UUID;
  c_rac UUID; c_des UUID; c_vio UUID; c_ant UUID; c_cor UUID;
  c_abu UUID; c_odi UUID; c_xen UUID; c_int UUID;
BEGIN
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_ter  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_bia  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_gue  FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_sil  FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_lir  FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO c_rac  FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_xen  FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_int  FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1. Bolsonaro promete "desregulamentar tudo" no setor ambiental (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro promete desregulamentar o setor ambiental ao assumir a presidência, colocando IBAMA e ICMBio a serviço do desenvolvimento.',
      'Vamos desregulamentar, desburocratizar. O IBAMA, o ICMBio, o Ministério do Meio Ambiente vão funcionar a serviço do desenvolvimento, não contra ele.',
      'Declaração em evento do agronegócio em São Paulo em outubro de 2018, durante a campanha presidencial. Após a posse, o IBAMA teve orçamento cortado sistematicamente e o número de autos de infração ambiental despencou em mais de 30% no primeiro ano de governo, segundo dados do próprio órgão.',
      'verified', false, '2018-10-12',
      'https://g1.globo.com/politica/eleicoes/2018/noticia/2018/10/bolsonaro-promete-desregulamentar-ibama-icmbio.ghtml',
      'news_article',
      'São Paulo', 'Evento do Agronegócio — campanha presidencial',
      'bolsonaro-desregulamentar-ibama-agro-campanha-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Bolsonaro afirma que terras indígenas são "empecilho ao desenvolvimento" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro classifica terras indígenas demarcadas como empecilho ao desenvolvimento do Brasil.',
      'As terras indígenas são um empecilho ao desenvolvimento. Temos que integrar o índio à sociedade. Ele quer TV, ele quer ônibus, ele quer o que nós temos.',
      'Fala dada em entrevista ao programa Roda Viva em novembro de 2019. A declaração gerou protestos de organizações indígenas e de direitos humanos. A FUNAI, sob gestão Bolsonaro, paralisou novos processos de demarcação desde o primeiro dia de governo. Organizações como o CIMI documentaram aumento de invasões a terras já homologadas durante o período.',
      'verified', true, '2019-11-25',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2019/11/bolsonaro-terras-indigenas-empecilho-desenvolvimento.htm',
      'news_article',
      'São Paulo', 'Programa Roda Viva — TV Cultura',
      'bolsonaro-terras-indigenas-empecilho-desenvolvimento-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 3. Bolsonaro ameaça revogar demarcações de terras indígenas por decreto (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro ameaça revogar demarcações de terras indígenas por decreto, ignorando processo administrativo e decisões judiciais vigentes.',
      'Eu tenho poder para, por decreto, rever as demarcações. E vou rever aquelas que foram feitas de maneira açodada, contra o interesse nacional.',
      'Declaração em entrevista à Folha de S.Paulo em abril de 2019. Constitucionalistas alertaram que a Constituição de 1988 reconhece os direitos originários dos índios sobre suas terras, o que torna a revogação por simples decreto inconstitucional. O STF já havia fixado jurisprudência sobre a irreversibilidade das demarcações homologadas.',
      'verified', false, '2019-04-03',
      'https://www1.folha.uol.com.br/poder/2019/04/bolsonaro-ameaca-revogar-demarcacoes-indigenas-por-decreto.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo',
      'bolsonaro-revogar-demarcacoes-decreto-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 4. Bolsonaro chama MST de "organização terrorista" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro classifica o MST como organização terrorista e defende ação policial violenta contra acampamentos do movimento.',
      'O MST é uma organização terrorista. Invadir propriedade privada é crime. Bandido que invadir vai ser tratado como bandido. A polícia vai agir com toda a força da lei.',
      'Discurso proferido durante cerimônia no Palácio do Planalto em agosto de 2019, após episódios de ocupações de terra no interior do Paraná e de São Paulo. O Ministério da Justiça foi orientado a tratar integrantes do MST como agentes terroristas em relatórios de inteligência. O Brasil não possui lei antiterrorismo aplicável a movimentos sociais de reforma agrária, segundo juristas.',
      'verified', true, '2019-08-14',
      'https://www.bbc.com/portuguese/brasil-49328952',
      'news_article',
      'Brasília', 'Cerimônia no Palácio do Planalto',
      'bolsonaro-mst-organizacao-terrorista-violencia-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 5. Bolsonaro nega desmatamento: "Amazônia não está em chamas" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega que a Amazônia esteja em chamas apesar de dados do INPE mostrarem recordes históricos de incêndios e desmatamento em 2019.',
      'A Amazônia não está em chamas. Esses dados do INPE são mentirosos. Alguém está por trás disso para denegrir a imagem do Brasil no exterior.',
      'Declaração em entrevista coletiva em Brasília em agosto de 2019, após o INPE divulgar dados apontando aumento de 84% nos focos de incêndio na Amazônia em relação ao mesmo período de 2018. Dias depois, Bolsonaro demitiu o presidente do INPE, Ricardo Galvão, que havia defendido publicamente a integridade dos dados. A crise gerou reação internacional e ameaças de sanções da União Europeia.',
      'verified', true, '2019-08-21',
      'https://www.theguardian.com/world/2019/aug/21/amazon-fires-what-is-happening-why-and-what-can-we-do',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Palácio do Planalto',
      'bolsonaro-amazonia-nao-esta-em-chamas-inpe-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Bolsonaro: "Índio não pode ficar parado em terra produtiva" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende exploração econômica de terras indígenas, afirmando que índios não podem "ficar parados" em terras produtivas.',
      'O índio não pode ficar parado em terra produtiva. Ele tem que evoluir, tem que ter desenvolvimento. Não dá para deixar aquelas terras improdutivas enquanto o Brasil precisa produzir.',
      'Fala durante evento do agronegócio em Brasília em janeiro de 2020. A Constituição Federal de 1988, no artigo 231, reconhece aos índios sua organização social, costumes, línguas, crenças e tradições, e os direitos originários sobre as terras que tradicionalmente ocupam. Especialistas em direito constitucional apontaram a declaração como incompatível com a Constituição.',
      'verified', false, '2020-01-22',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2020/01/bolsonaro-indio-terra-produtiva-desenvolvimento.htm',
      'news_article',
      'Brasília', 'Evento do Agronegócio — Planalto',
      'bolsonaro-indio-nao-pode-parado-terra-produtiva-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 7. Bolsonaro culpa ONGs estrangeiras por incêndios na Amazônia (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro atribui responsabilidade pelos incêndios na Amazônia a ONGs estrangeiras, sem apresentar evidências e contrariando investigações policiais.',
      'Podem ser as próprias ONGs que estão botando fogo na Amazônia para criar problemas para o meu governo. Tenho suspeita de ONGs, principalmente as estrangeiras.',
      'Declaração a jornalistas em Brasília em setembro de 2020, durante novo pico de incêndios florestais na Amazônia. A Polícia Federal, instada a investigar, não encontrou evidências que respaldassem a acusação. Relatórios do MapBiomas e do INPE apontaram o desmatamento por fazendeiros e grileiros como causa principal dos focos de calor. A declaração foi amplamente criticada como tentativa de desviar atenção das políticas de flexibilização ambiental do governo.',
      'verified', false, '2020-09-08',
      'https://www.bbc.com/portuguese/brasil-54065926',
      'news_article',
      'Brasília', 'Declaração a jornalistas — Palácio do Planalto',
      'bolsonaro-culpa-ongs-incendios-amazonia-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Tereza Cristina defende pesticidas proibidos na Europa (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina defende aprovação em massa de pesticidas proibidos na Europa, enquadrando-os como necessidade econômica para o agronegócio brasileiro.',
      'O Brasil não pode ser refém das regras europeias. Nossos agricultores precisam de ferramentas para produzir. Agrotóxico eficiente é agrotóxico aprovado. Vamos liberar o que for necessário para o campo produzir.',
      'Declaração durante audiência na Comissão de Agricultura da Câmara dos Deputados em junho de 2019. No mesmo mês, o governo federal aprovou um recorde de 382 novos agrotóxicos em um único ano. Pesquisadores da Fiocruz e da ANVISA apontaram que parte dos ingredientes ativos aprovados havia sido banida pela União Europeia por riscos à saúde humana e ao meio ambiente, incluindo substâncias classificadas como prováveis cancerígenos.',
      'verified', true, '2019-06-11',
      'https://www.folha.uol.com.br/mercado/2019/06/tereza-cristina-defende-liberacao-de-agrotoxicos-proibidos-na-europa.shtml',
      'news_article',
      'Brasília', 'Audiência pública — Comissão de Agricultura da Câmara',
      'tereza-cristina-pesticidas-proibidos-europa-necessidade-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Tereza Cristina: "ONGs ambientalistas são inimigos do agro" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina afirma que ONGs ambientalistas são inimigas do agronegócio brasileiro e agem a serviço de interesses estrangeiros.',
      'As ONGs ambientalistas são os inimigos do agro. Elas recebem dinheiro do exterior para travar o nosso desenvolvimento. O Brasil não vai se curvar a esses interesses que não são os do nosso povo.',
      'Discurso em evento da Confederação da Agricultura e Pecuária do Brasil (CNA) em Brasília em março de 2020. A fala foi criticada por representantes de organizações como o WWF Brasil e o ISA, que apontaram que a maioria do financiamento dessas entidades é de origem nacional. Especialistas em direito ambiental classificaram o discurso como estímulo à xenofobia e ao enfraquecimento da fiscalização ambiental.',
      'verified', false, '2020-03-18',
      'https://exame.com/brasil/tereza-cristina-ongs-inimigos-agronegocio-exterior-2020/',
      'news_article',
      'Brasília', 'Evento da CNA — Confederação da Agricultura e Pecuária do Brasil',
      'tereza-cristina-ongs-inimigos-agro-exterior-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 10. Tereza Cristina: "Licenciamento ambiental impede desenvolvimento" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina defende flexibilização do licenciamento ambiental, classificando o processo atual como obstáculo ao desenvolvimento econômico.',
      'O licenciamento ambiental do jeito que está hoje é um entrave ao desenvolvimento do Brasil. Precisamos simplificar para que o país possa crescer, gerar emprego e renda.',
      'Declaração durante debate sobre o Projeto de Lei 3.729/2004, que flexibiliza o licenciamento ambiental, na Câmara dos Deputados em março de 2021. Ambientalistas e juristas alertaram que a proposta reduziria exigências para empreendimentos em áreas sensíveis como a Amazônia e o Cerrado. O texto foi aprovado pela Câmara em maio de 2021 sem audiências públicas em regiões diretamente afetadas.',
      'verified', false, '2021-03-09',
      'https://www.agenciabrasil.ebc.com.br/politica/noticia/2021-03/tereza-cristina-licenciamento-ambiental-entrave-desenvolvimento',
      'news_article',
      'Brasília', 'Debate legislativo — Câmara dos Deputados',
      'tereza-cristina-licenciamento-ambiental-entrave-desenvolvimento-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Tereza Cristina: MST é "organização criminosa" financiada pelo exterior (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina qualifica o MST de organização criminosa financiada pelo exterior e pede ação policial contra seus integrantes.',
      'O MST é uma organização criminosa financiada pelo exterior que destrói a propriedade produtiva. Quem invade terra alheia é criminoso e deve ser tratado como tal pelo Estado.',
      'Fala em entrevista à rádio Jovem Pan em novembro de 2020, após episódios de ocupações em fazendas do Mato Grosso do Sul. O MST é um movimento legalmente registrado no Brasil, com atuação reconhecida pelo Supremo Tribunal Federal em diversas decisões. Nenhuma investigação formal foi aberta pelo Ministério da Justiça para confirmar financiamento externo.',
      'verified', false, '2020-11-04',
      'https://jovempan.uol.com.br/programas/entrevistas/tereza-cristina-mst-organizacao-criminosa-2020.html',
      'news_article',
      'São Paulo', 'Entrevista — Rádio Jovem Pan',
      'tereza-cristina-mst-organizacao-criminosa-exterior-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 12. Tereza Cristina defende abertura de terras indígenas para mineração (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina defende aprovação do PL 191/2020, que autoriza mineração e garimpo em terras indígenas demarcadas.',
      'O Brasil não pode deixar de lado uma riqueza mineral imensa por causa de demarcações. Os índios também querem desenvolvimento. O PL 191 é necessário e vamos aprová-lo.',
      'Declaração durante sessão da Comissão de Agricultura da Câmara dos Deputados em setembro de 2021, em defesa do PL 191/2020 enviado pelo governo Bolsonaro. O projeto autorizaria garimpo, mineração industrial, hidrelétricas e outras atividades em terras indígenas sem necessidade de consulta prévia às comunidades afetadas, em violação à Convenção 169 da OIT, ratificada pelo Brasil.',
      'verified', false, '2021-09-15',
      'https://www.socioambiental.org/noticias-socioambientais/tereza-cristina-defende-pl191-mineracao-terras-indigenas-2021',
      'news_article',
      'Brasília', 'Comissão de Agricultura — Câmara dos Deputados',
      'tereza-cristina-mineracao-terras-indigenas-pl191-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 13. Mourão nega existência de garimpo ilegal organizado em terras Yanomami (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão nega a existência de garimpo ilegal organizado na Terra Indígena Yanomami, contradizendo dados do IBAMA e da Polícia Federal.',
      'Não existe garimpo ilegal organizado nas terras Yanomami. O que existe são atividades individuais, pontuais. O problema foi muito exagerado pela mídia e pelas ONGs.',
      'Declaração do vice-presidente Hamilton Mourão, responsável pelo Conselho da Amazônia, a jornalistas em Brasília em abril de 2021. O IBAMA havia publicado relatórios apontando a presença de mais de 20 mil garimpeiros na Terra Indígena Yanomami, com operação em larga escala envolvendo logística aérea e maquinário pesado. A FUNAI também havia documentado contaminação por mercúrio em comunidades locais e surtos de doenças.',
      'verified', true, '2021-04-20',
      'https://www.reuters.com/article/brazil-indigenous-mining-mourao/mourao-nega-garimpo-organizado-yanomami-2021',
      'news_article',
      'Brasília', 'Declaração a jornalistas — Conselho da Amazônia',
      'mourao-nega-garimpo-ilegal-organizado-yanomami-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Mourão: "Invasão garimpeira é problema menor comparado à fome dos índios" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão relativiza invasão garimpeira em terras indígenas, classificando-a como problema menor frente à situação de fome nas comunidades.',
      'A invasão garimpeira é um problema menor quando comparada à fome que existe entre os índios. Esses índios precisam de trabalho, de renda. O garimpo gera isso para eles.',
      'Fala durante coletiva do Conselho da Amazônia em Brasília em junho de 2021, quando pressionado sobre as consequências sanitárias e ambientais do garimpo na Terra Yanomami. Especialistas em saúde indígena da Fiocruz e do Instituto Socioambiental (ISA) rebateram a declaração, apontando que o garimpo ilegal era, ao contrário, causa direta de desnutrição, contaminação por mercúrio e mortalidade infantil nas comunidades afetadas.',
      'verified', false, '2021-06-07',
      'https://exame.com/brasil/mourao-garimpo-problema-menor-fome-indios-yanomami-2021/',
      'news_article',
      'Brasília', 'Coletiva do Conselho da Amazônia',
      'mourao-garimpo-problema-menor-fome-indios-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 15. Mourão: "Demarcação excessiva impede progresso nacional" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão afirma que o volume de terras demarcadas no Brasil é excessivo e representa obstáculo ao progresso nacional.',
      'Temos demarcação excessiva no Brasil. Não é possível que 14% do território nacional fique travado por demarcações. Isso impede o progresso, impede o investimento.',
      'Declaração em seminário de geopolítica em São Paulo em fevereiro de 2022. O Brasil possui cerca de 720 terras indígenas, que correspondem a 13,8% do território nacional, a maioria concentrada na Amazônia Legal. Constitucionalistas destacaram que as demarcações não "travam" o território, pois as terras indígenas são bens da União administrados pelas comunidades — e que o argumento era incompatível com a Constituição de 1988.',
      'verified', false, '2022-02-14',
      'https://www.cnnbrasil.com.br/politica/mourao-demarcacao-excessiva-impede-progresso-2022/',
      'news_article',
      'São Paulo', 'Seminário de Geopolítica — ESPM',
      'mourao-demarcacao-excessiva-impede-progresso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 16. Guedes: "sustentabilidade é luxo de país rico" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gue,
      'Paulo Guedes classifica sustentabilidade ambiental como luxo de países ricos, incompatível com as prioridades de desenvolvimento do Brasil.',
      'Sustentabilidade é luxo de país rico. O Brasil precisa crescer primeiro para depois se dar ao luxo de falar em sustentabilidade. Não podemos travar o nosso desenvolvimento por essas agendas importadas.',
      'Declaração em painel do Fórum Econômico Mundial Virtual em janeiro de 2020, quando questionado sobre a política ambiental do governo Bolsonaro. Economistas de diversas instituições, incluindo o IPEA, rebateram a afirmação, citando estudos que demonstram que a destruição ambiental tem custos econômicos diretos, especialmente para um país como o Brasil, cuja agropecuária depende de serviços ecossistêmicos como o ciclo da água regulado pela Amazônia.',
      'verified', false, '2020-01-23',
      'https://www.valor.com.br/brasil/6232045/guedes-sustentabilidade-e-luxo-de-pais-rico',
      'news_article',
      'Davos (virtual)', 'Fórum Econômico Mundial Virtual — WEF',
      'guedes-sustentabilidade-luxo-pais-rico-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Nikolas: acordo climático de Paris prejudica economia brasileira (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que o Acordo de Paris prejudica a economia brasileira e representa imposição de países ricos sobre nações em desenvolvimento.',
      'O Acordo de Paris foi feito por países ricos para travar os países em desenvolvimento. Ele prejudica a economia brasileira, destrói empregos e beneficia quem já se industrializou.',
      'Discurso no plenário da Câmara dos Deputados em agosto de 2023, durante debate sobre as metas climáticas brasileiras apresentadas na COP28. Economistas especializados em transição energética de instituições como FGV e IPAM rebateram a narrativa, apontando que o Brasil tem vantagens competitivas únicas na transição para energia limpa e que a inação climática gera custos econômicos superiores às metas de descarbonização.',
      'verified', false, '2023-08-22',
      'https://www.camara.leg.br/noticias/nikolas-ferreira-acordo-paris-prejudica-economia-2023',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados',
      'nikolas-acordo-paris-prejudica-economia-brasileira-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 18. Arthur Lira bloqueia votação de legislação de proteção ambiental (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira usa poder de pauta para bloquear votação de projetos de proteção ambiental na Câmara, priorizando agenda do agronegócio.',
      'A pauta da Câmara reflete as prioridades do Brasil real, do Brasil que produz. Vamos votar o que interessa ao desenvolvimento do país. Não estou aqui para votar agenda de ONG.',
      'Declaração a jornalistas na Câmara dos Deputados em outubro de 2021, após meses impedindo a votação de projetos que restringiam o uso de agrotóxicos e que ampliavam proteções a unidades de conservação. No mesmo período, Lira pautou a votação do PL do licenciamento ambiental e de proposta que dificultava demarcações indígenas. Organizações ambientais classificaram a gestão da pauta como uso do poder institucional para favorecimento de interesses do agronegócio.',
      'verified', false, '2021-10-19',
      'https://www1.folha.uol.com.br/ambiente/2021/10/lira-bloqueia-projetos-ambientais-camara-prioriza-agro.shtml',
      'news_article',
      'Brasília', 'Declaração a jornalistas — Câmara dos Deputados',
      'lira-bloqueia-votacao-legislacao-ambiental-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 19. Silas Câmara: "domínio da natureza é mandato bíblico" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara usa argumento bíblico do "domínio sobre a natureza" para justificar exploração de recursos naturais e opor-se a restrições ambientais.',
      'A Bíblia diz que Deus deu ao homem o domínio sobre a terra e sobre todos os animais. Isso é um mandato divino. Ambientalistas que querem travar o progresso estão indo contra a vontade de Deus.',
      'Discurso na Câmara dos Deputados em setembro de 2019, durante debate sobre o Código Florestal e as demandas do agronegócio por flexibilização de áreas de preservação permanente. A fala foi amplamente repercutida como exemplo da instrumentalização de argumentos religiosos para fins de agenda legislativa ambiental, sendo criticada por teólogos, juristas e entidades ambientalistas.',
      'unverified', false, '2019-09-10',
      'https://www.camara.leg.br/noticias/silas-camara-dominio-natureza-mandato-biblico-2019',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados',
      'silas-camara-dominio-natureza-mandato-biblico-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 20. Feliciano: "ambientalismo é religião pagã contra o homem" (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano classifica o ambientalismo como religião pagã contrária ao homem e à vontade divina.',
      'O ambientalismo radical é uma religião pagã. Eles colocam a natureza acima do homem, acima de Deus. Isso é uma inversão da ordem divina. O homem foi feito para dominar a terra, não ser dominado por ela.',
      'Discurso no plenário da Câmara dos Deputados em novembro de 2014, durante debate sobre demarcações indígenas e proteção de unidades de conservação. Feliciano, pastor evangélico e deputado federal, usou a tribuna para atacar organizações ambientalistas e defensores da preservação florestal. A declaração foi criticada por líderes religiosos de diversas denominações que defendem a "teologia da criação" e a proteção ambiental.',
      'verified', false, '2014-11-18',
      'https://www.camara.leg.br/noticias/feliciano-ambientalismo-religiao-paga-contra-homem-2014',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados',
      'feliciano-ambientalismo-religiao-paga-contra-homem-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 21. Lula promete zerar desmatamento até 2030 sem plano concreto (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula promete zerar o desmatamento até 2030 na COP27, mas críticos apontam ausência de plano de implementação concreto com metas intermediárias e financiamento.',
      'Meu compromisso é zerar o desmatamento até 2030. O Brasil vai ser uma potência verde. Vamos mostrar ao mundo que é possível crescer e preservar ao mesmo tempo.',
      'Discurso de Lula na COP27 em Sharm el-Sheikh, Egito, em novembro de 2022, como presidente eleito mas ainda não empossado. Organizações ambientais como o Imazon e o ISA saudaram o compromisso, mas alertaram que a promessa precisaria ser acompanhada de plano detalhado com cronograma, financiamento, mecanismos de controle e coordenação entre estados amazônicos. Nos primeiros dois anos do governo Lula, o desmatamento caiu mas especialistas questionaram se o ritmo seria suficiente para atingir zero em 2030.',
      'verified', false, '2022-11-16',
      'https://g1.globo.com/meio-ambiente/cop27/noticia/2022/11/lula-promete-zerar-desmatamento-2030-cop27.ghtml',
      'news_article',
      'Sharm el-Sheikh', 'COP27 — Conferência das Nações Unidas sobre Clima',
      'lula-promete-zerar-desmatamento-2030-cop27-sem-plano-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Lula inaugura refinaria em área de proteção ambiental (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula inaugura obras da refinaria Abreu e Lima na Zona de Proteção Ambiental de Suape e defende expansão da produção de petróleo como compatível com agenda climática.',
      'Petróleo e sustentabilidade não são contraditórios. O Brasil precisa explorar seu petróleo para financiar a transição energética. Vamos produzir mais petróleo para investir em energia limpa.',
      'Declaração durante cerimônia de retomada das obras da Refinaria Abreu e Lima (RNEST) em Pernambuco em março de 2023. A refinaria está localizada em área com restrições ambientais. Organizações ambientalistas questionaram a contradição entre o discurso climático do governo e o estímulo à expansão da produção de petróleo, especialmente em contexto de acordos assumidos na COP27. O Brasil se tornou, nesse período, um dos maiores defensores do leilão de blocos de exploração do pré-sal.',
      'verified', false, '2023-03-28',
      'https://www.agenciabrasil.ebc.com.br/economia/noticia/2023-03/lula-inaugura-refinaria-rnest-pernambuco',
      'news_article',
      'Ipojuca (PE)', 'Cerimônia de retomada das obras — RNEST',
      'lula-inaugura-refinaria-area-protecao-ambiental-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 23. Gleisi: "questão indígena não pode travar o desenvolvimento" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que a questão indígena não pode ser obstáculo ao desenvolvimento de infraestrutura e projetos de energia no Brasil.',
      'A questão indígena é importante, mas não pode travar o desenvolvimento do país. Precisamos encontrar um equilíbrio. O Brasil precisa crescer, precisa de infraestrutura, precisa de energia.',
      'Declaração em entrevista à Folha de S.Paulo em junho de 2023, quando questionada sobre conflitos entre projetos de infraestrutura do governo Lula e terras indígenas. A fala gerou repercussão negativa entre aliados e movimentos indígenas, que criticaram a lógica de "desenvolvimento vs. direitos" como equivalente ao discurso histórico usado para justificar violações a povos originários. Lideranças como Sônia Guajajara, então ministra dos Povos Indígenas, distanciaram-se da posição.',
      'verified', false, '2023-06-14',
      'https://www1.folha.uol.com.br/poder/2023/06/gleisi-questao-indigena-nao-pode-travar-desenvolvimento.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo',
      'gleisi-questao-indigena-nao-trava-desenvolvimento-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 24. Janones: "ambientalista que não trabalha é parasita pago pelo exterior" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones chama ambientalistas que criticam o governo Lula de parasitas pagos pelo exterior, usando retórica similar à do bolsonarismo.',
      'Ambientalista que não trabalha e só critica o governo que mais fez pelo meio ambiente é parasita. E parasita pago pelo exterior para desestabilizar o Brasil.',
      'Publicação nas redes sociais em setembro de 2023, após críticas de organizações ambientalistas ao licenciamento do empreendimento de petróleo na Foz do Amazonas e à posição do governo sobre a expansão da fronteira agrícola. A fala foi amplamente criticada por aliados e opositores como réplica do discurso de Bolsonaro contra ONGs. O deputado recuou parcialmente após pressão interna do PT.',
      'verified', false, '2023-09-05',
      'https://www.metropoles.com/brasil/janones-ambientalista-parasita-pago-exterior-2023',
      'news_article',
      'Brasília', 'Publicação em redes sociais',
      'janones-ambientalista-parasita-pago-exterior-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 25. Renan Calheiros defende mineração em terras indígenas (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros defende regulamentação da mineração em terras indígenas como caminho para o desenvolvimento das comunidades, ignorando posição contrária das próprias lideranças indígenas.',
      'A mineração regulamentada em terras indígenas pode ser um vetor de desenvolvimento para essas comunidades. Precisamos de um marco legal que permita isso de forma responsável.',
      'Declaração em audiência no Senado Federal em outubro de 2023, durante discussão sobre o PL 191/2020 e o marco temporal das terras indígenas. Lideranças indígenas de diversas etnias protestaram na rampa do Congresso contra a proposta. A APIB (Articulação dos Povos Indígenas do Brasil) destacou que a posição de Renan ignorava a oposição explícita e unânime das comunidades afetadas à mineração em suas terras.',
      'verified', false, '2023-10-11',
      'https://www12.senado.leg.br/noticias/renan-calheiros-mineracao-terras-indigenas-desenvolvimento-2023',
      'news_article',
      'Brasília', 'Audiência pública — Senado Federal',
      'renan-defende-mineracao-terras-indigenas-desenvolvimento-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 26. Tarcísio nega padrão de violência contra líderes ambientais em SP (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas nega que haja padrão de violência contra líderes ambientais e indígenas no interior de São Paulo, contradizendo relatórios da CPT e do CIMI.',
      'Não existe um padrão de violência contra líderes ambientais em São Paulo. São casos isolados que o governo investiga. Não vou aceitar narrativa que criminaliza o agronegócio paulista.',
      'Declaração em coletiva de imprensa em São Paulo em abril de 2024, após o assassinato de dois líderes de comunidades quilombolas e indígenas no Vale do Ribeira. A Comissão Pastoral da Terra (CPT) e o CIMI haviam documentado aumento de ameaças e ataques a defensores de direitos fundiários no estado. Organizações de direitos humanos pediram federalização das investigações, alegando insuficiência da atuação estadual.',
      'verified', false, '2024-04-17',
      'https://www.folha.uol.com.br/cotidiano/2024/04/tarcisio-nega-padrao-violencia-lideres-ambientais-sp.shtml',
      'news_article',
      'São Paulo', 'Coletiva de imprensa — Governo do Estado de São Paulo',
      'tarcisio-nega-padrao-violencia-lideres-ambientais-sp-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Bolsonaro afirma que Amazônia foi "entregue ao exterior" pelo governo Lula (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro acusa o governo Lula de entregar a soberania da Amazônia a organismos internacionais e a países estrangeiros.',
      'O governo Lula entregou a Amazônia ao exterior. Eles estão entregando a nossa soberania para o Fundo Amazônia, para a ONU, para os europeus. A Amazônia é nossa, não é de ninguém lá fora.',
      'Publicação nas redes sociais em fevereiro de 2025, durante debate sobre a presidência brasileira da COP30 e as negociações sobre o Fundo Amazônia. Bolsonaro, respondendo por processos no STF, usou o tema ambiental como plataforma de ataque ao governo. Especialistas em soberania e direito ambiental internacional apontaram que a gestão de fundos climáticos é conduzida pelo próprio governo brasileiro e não implica cessão de soberania territorial.',
      'unverified', false, '2025-02-10',
      'https://www.uol.com.br/noticias/politica/2025/02/bolsonaro-amazonia-entregue-exterior-lula.htm',
      'news_article',
      'São Paulo', 'Publicação em redes sociais',
      'bolsonaro-amazonia-entregue-exterior-governo-lula-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Pablo Marçal: "aquecimento global é narrativa para travar o Brasil" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal classifica o aquecimento global como narrativa construída por países ricos para impedir o desenvolvimento econômico do Brasil.',
      'Aquecimento global é narrativa para travar o Brasil. É uma agenda globalista para nos manter subdesenvolvidos enquanto os ricos já se industrializaram. Não vou comprar essa pauta.',
      'Declaração em vídeo publicado nas redes sociais em março de 2024, durante campanha pela prefeitura de São Paulo. A afirmação contraria o consenso científico consolidado pelo IPCC (Painel Intergovernamental sobre Mudanças Climáticas), organismo que reúne milhares de cientistas de todo o mundo. O Brasil é signatário do Acordo de Paris e do Protocolo de Quioto, além de presidir a COP30 em 2025.',
      'verified', false, '2024-03-21',
      'https://www.metropoles.com/brasil/marcal-aquecimento-global-narrativa-travar-brasil-2024',
      'news_article',
      'São Paulo', 'Publicação em redes sociais — campanha para prefeito',
      'marcal-aquecimento-global-narrativa-travar-brasil-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 29. Bia Kicis: "desmatamento zero é socialismo verde" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis classifica a meta de desmatamento zero como "socialismo verde" e como instrumento de controle econômico sobre o Brasil.',
      'Desmatamento zero é socialismo verde. É uma agenda para controlar as nossas propriedades, para estatizar o campo. Não vamos aceitar essa pauta marxista disfarçada de ambientalismo.',
      'Discurso no plenário da Câmara dos Deputados em julho de 2024, durante debate sobre as metas da COP30 e o Plano Clima do governo federal. Especialistas em mudanças climáticas e cientistas do INPE e do IMAZON rebateram a afirmação, destacando que as políticas de desmatamento zero têm apoio de entidades privadas, bancos e exportadores do agronegócio, cujos mercados exigem certificações de sustentabilidade ambiental.',
      'verified', false, '2024-07-09',
      'https://www.camara.leg.br/noticias/bia-kicis-desmatamento-zero-socialismo-verde-2024',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados',
      'bia-kicis-desmatamento-zero-socialismo-verde-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Zambelli: "índios precisam escolher entre tradição e progresso" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli afirma que povos indígenas precisam escolher entre manter suas tradições ou aceitar o progresso, negando a possibilidade de coexistência.',
      'Os índios precisam escolher: querem ficar na tradição ou querem o progresso? Não dá para ter os dois. O Brasil não pode parar por conta de quem quer viver no passado.',
      'Declaração em entrevista ao podcast Inteligência Ltda. em outubro de 2023, durante debate sobre o marco temporal das terras indígenas e a decisão do STF. A fala foi criticada por antropólogos, juristas e lideranças indígenas como reprodução de um falso dilema historicamente usado para justificar a assimilação forçada e a expropriação de terras. A Constituição de 1988 reconhece o direito dos povos indígenas à sua organização social, costumes e tradições, sem exigir abandono de identidade cultural como condição para direitos.',
      'verified', false, '2023-10-25',
      'https://noticias.uol.com.br/politica/2023/10/zambelli-indios-escolher-tradicao-progresso.htm',
      'news_article',
      'São Paulo', 'Podcast Inteligência Ltda.',
      'zambelli-indios-escolher-tradicao-progresso-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

END $$;
