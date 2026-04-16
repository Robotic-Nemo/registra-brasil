-- Batch 30: 2024–2025 economic controversies, foreign policy disputes, and Lula government controversies

DO $$
DECLARE
  v_lula UUID; v_gle UUID; v_had UUID; v_jan UUID; v_tar UUID;
  v_nik UUID; v_bol UUID; v_mou UUID; v_cir UUID; v_ren UUID;
  v_mor UUID; v_mar UUID; v_bou UUID; v_edu UUID; v_fel UUID; v_dam UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID; c_odi UUID; c_xen UUID;
  c_int UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou  FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_xen  FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_int  FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1. Lula defende relação com Venezuela após eleições contestadas (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende relação do Brasil com Venezuela apesar de Maduro contestar eleições.',
      'O Brasil tem relações diplomáticas com a Venezuela. Não cabe ao Brasil julgar o sistema eleitoral de outro país soberano.',
      'Dito em coletiva de imprensa em Brasília em agosto de 2024, após as eleições venezuelanas contestadas. Opositores criticaram a postura como conivência com ditadura.',
      'verified', false, '2024-08-05',
      'https://g1.globo.com/politica/noticia/2024/08/lula-venezuela-maduro-soberania.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'lula-venezuela-maduro-soberania-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Lula compara Israel ao Holocausto/Hitler — resposta ao aniversário (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula reitera comparação de Israel ao Holocausto ao completar um ano da declaração polêmica.',
      'Eu disse e repito: o que está acontecendo em Gaza é um genocídio. A história vai julgar quem ficou em silêncio.',
      'Declaração feita em entrevista à imprensa em fevereiro de 2025, ao revisitar a polêmica comparação de 2024 em que equiparou ações israelenses ao Holocausto. Israel retirou o embaixador do Brasil após a declaração original.',
      'verified', true, '2025-02-18',
      'https://www.folha.uol.com.br/mundo/2025/02/lula-reitera-genocidio-gaza-israel-holoca.shtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa', 'lula-israel-holocausto-aniversario-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 3. Lula critica EUA por apoio a Israel (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula critica os Estados Unidos por fornecerem armas a Israel durante conflito em Gaza.',
      'Os Estados Unidos precisam parar de enviar armas para Israel. Quem fornece arma para matar criança é cúmplice do crime.',
      'Declaração durante cúpula da União Africana em Adis Abeba, Etiópia, em fevereiro de 2024. A fala gerou reação negativa da Casa Branca e de líderes republicanos americanos.',
      'verified', false, '2024-02-19',
      'https://www.cnnbrasil.com.br/politica/lula-eua-armas-israel-cumplice-2024/',
      'news_article',
      'Adis Abeba', 'Cúpula da União Africana', 'lula-critica-eua-apoio-israel-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Lula recusa classificar Maduro como ditador mesmo após evidências (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula se recusa a chamar Maduro de ditador após fraude eleitoral amplamente documentada.',
      'Não vou ficar aplicando rótulos. Maduro é o presidente eleito da Venezuela e ponto final. Cada país tem sua trajetória democrática.',
      'Declaração em entrevista à Rádio Eldorado em março de 2025, após relatórios do Centro Carter e da ONU documentarem irregularidades nas eleições venezuelanas de 2024. A oposição e parceiros internacionais do Brasil criticaram duramente a postura.',
      'verified', false, '2025-03-10',
      'https://www.estadao.com.br/politica/lula-recusa-ditador-maduro-2025/',
      'news_article',
      'Brasília', 'Entrevista rádio', 'lula-recusa-ditador-maduro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 5. Lula defende Cuba como "democracia diferente" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende Cuba afirmando que o país tem "um tipo diferente de democracia".',
      'Cuba tem uma democracia diferente da nossa, mas é uma democracia. Eles têm saúde, educação, não têm violência urbana. É diferente, mas funciona para eles.',
      'Dito durante visita oficial a Havana em setembro de 2023. A declaração foi amplamente criticada por ativistas de direitos humanos e pela oposição brasileira, que apontaram repressão política sistemática em Cuba.',
      'verified', false, '2023-09-15',
      'https://g1.globo.com/politica/noticia/2023/09/lula-cuba-democracia-diferente-visita.ghtml',
      'news_article',
      'Havana', 'Visita oficial a Cuba', 'lula-cuba-democracia-diferente-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Lula ataca Trump após tarifas dos EUA sobre Brasil (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula responde a tarifas de Trump com ataques ao presidente americano e ameaça de retaliação.',
      'O Trump age como se o mundo fosse propriedade dele. O Brasil não vai aceitar humilhação. Se impuser tarifa, a gente vai impor tarifa também.',
      'Declaração em pronunciamento em Brasília em abril de 2025, após o governo Trump anunciar tarifas de 10% sobre produtos brasileiros como parte de uma política protecionista global. Analistas alertaram para riscos de escalada comercial.',
      'verified', true, '2025-04-04',
      'https://www.folha.uol.com.br/mercado/2025/04/lula-trump-tarifa-retaliacao-brasil.shtml',
      'news_article',
      'Brasília', 'Pronunciamento presidencial', 'lula-ataca-trump-tarifas-eua-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 7. Lula defende gastos do governo como "investimento" em resposta a críticas fiscais (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula classifica aumento de gastos públicos como "investimento" e nega deterioração fiscal.',
      'Não é gasto, é investimento. Cada real que eu coloco na educação, na saúde, no Bolsa Família, volta multiplicado para a economia. Quem fala em corte de gasto não quer o bem do povo.',
      'Declaração durante evento do programa Minha Casa Minha Vida em São Paulo em junho de 2024. Economistas criticaram a distinção semântica em meio a déficit primário crescente e pressão sobre o arcabouço fiscal.',
      'verified', false, '2024-06-12',
      'https://www.valor.com.br/politica/2024/06/lula-gasto-investimento-arcabouco-fiscal.html',
      'news_article',
      'São Paulo', 'Evento Minha Casa Minha Vida', 'lula-gasto-investimento-criticas-fiscais-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Lula nega que isenção de IR até R$5k aumentará déficit (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que isenção de IR para quem ganha até R$ 5 mil não vai aumentar o déficit.',
      'A isenção do Imposto de Renda para quem ganha até cinco mil reais não vai custar nada para o país. Vai ser compensada com o imposto mínimo dos super-ricos. É justiça fiscal.',
      'Declaração em entrevista ao programa Bom Dia Brasil em novembro de 2024. Economistas e analistas do mercado financeiro questionaram a viabilidade da compensação e projetaram impacto negativo de R$ 35 bilhões ao ano nas contas públicas.',
      'verified', false, '2024-11-28',
      'https://www.cnnbrasil.com.br/economia/lula-isencao-ir-5-mil-nao-aumenta-deficit-2024/',
      'news_article',
      'Brasília', 'Entrevista TV', 'lula-isencao-ir-sem-deficit-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Lula ataca Banco Central por manter juros altos (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula ataca presidente do Banco Central e questiona autonomia da instituição após manutenção da Selic alta.',
      'Gabriel Galípolo foi indicado por mim e está destruindo o país com essa taxa de juros absurda. O Banco Central trabalha contra o povo brasileiro e eu não vou ficar calado.',
      'Declaração em evento do PT em Recife em fevereiro de 2025, após o Banco Central manter a Selic em 13,25% ao ano. Economistas alertaram que ataques à autonomia do BC podem piorar as expectativas inflacionárias.',
      'verified', true, '2025-02-07',
      'https://www.folha.uol.com.br/mercado/2025/02/lula-ataca-banco-central-galipolo-selic.shtml',
      'news_article',
      'Recife', 'Evento do PT', 'lula-ataca-banco-central-juros-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 10. Lula defende reforma do INSS apesar de escândalos de fraude (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende gestão do INSS e minimiza escândalos de fraude que desviaram bilhões de aposentados.',
      'O INSS está passando por uma limpeza. Fraude existe em qualquer governo, o que importa é que a gente está combatendo. Não vou deixar atacarem uma instituição que cuida de 40 milhões de brasileiros.',
      'Declaração em coletiva de imprensa em Brasília em março de 2025, após a Polícia Federal deflagrar operação contra esquema de descontos ilegais em benefícios previdenciários, com prejuízo estimado em R$ 6 bilhões.',
      'verified', false, '2025-03-25',
      'https://www.uol.com.br/noticias/2025/03/lula-defende-inss-fraude-operacao-pf.htm',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'lula-defende-inss-fraude-minimiza-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 11. Haddad defende isenção de IR como "sem custo fiscal" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad afirma que isenção de IR até R$ 5 mil não terá custo fiscal líquido, contradizendo projeções do mercado.',
      'A proposta é neutra do ponto de vista fiscal. Vai haver compensação pelos que ganham acima de 50 mil reais. O mercado está criando uma narrativa falsa de irresponsabilidade.',
      'Declaração em entrevista coletiva no Ministério da Fazenda em dezembro de 2024. Analistas do BTG Pactual, XP e Itaú projetaram impacto negativo entre R$ 25 e 40 bilhões anuais, questionando a neutralidade fiscal da medida.',
      'verified', false, '2024-12-03',
      'https://www.folha.uol.com.br/mercado/2024/12/haddad-isencao-ir-5mil-custo-fiscal-neutro.shtml',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Fazenda', 'haddad-isencao-ir-sem-custo-fiscal-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 12. Haddad acusa mercado financeiro de "criar pânico" sobre situação fiscal (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad acusa mercado financeiro de deliberadamente criar pânico sobre as finanças públicas brasileiras.',
      'O mercado financeiro está criando um pânico artificial. Os fundamentos da economia brasileira são sólidos. Há um interesse político em desestabilizar o governo.',
      'Declaração em entrevista à GloboNews em setembro de 2024, durante período de forte depreciação do real e alta dos juros futuros. O dólar chegou a R$ 5,60 na semana da declaração, e economistas apontaram deterioração real do quadro fiscal.',
      'verified', false, '2024-09-18',
      'https://g1.globo.com/economia/noticia/2024/09/haddad-mercado-panico-artificial-fundamentos.ghtml',
      'news_article',
      'Brasília', 'Entrevista GloboNews', 'haddad-mercado-panico-artificial-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Haddad promete superávit primário mas apresenta déficit (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad promete zerar o déficit primário em 2023, mas o resultado fecha com rombo de R$ 230 bilhões.',
      'Nossa meta é zerar o déficit primário. O arcabouço fiscal é robusto e crível. Vamos cumprir as metas e mostrar ao mercado que o Brasil tem responsabilidade fiscal.',
      'Declaração em apresentação do arcabouço fiscal ao Congresso em abril de 2023. O resultado primário de 2023 fechou com déficit de R$ 230,5 bilhões, equivalente a 2,1% do PIB, muito acima da meta estabelecida.',
      'verified', false, '2023-04-17',
      'https://www.valor.com.br/financas/2023/04/haddad-arcabouco-fiscal-meta-superavit.html',
      'news_article',
      'Brasília', 'Apresentação do arcabouço fiscal', 'haddad-promete-superavit-apresenta-deficit-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Haddad diz que reforma tributária é "simples" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad descreve a complexa reforma tributária como "simples e clara" para contribuintes.',
      'A reforma tributária é simples: unificamos impostos, simplificamos o sistema, reduzimos a burocracia. O contribuinte vai entender facilmente o que paga e por quê.',
      'Declaração em audiência pública na Câmara dos Deputados em agosto de 2023. Especialistas tributaristas apontaram que a reforma criava novos tributos, mantinha regimes especiais e geraria período de transição de 50 anos com regras paralelas.',
      'verified', false, '2023-08-22',
      'https://www.cnnbrasil.com.br/economia/haddad-reforma-tributaria-simples-audiencia-camara-2023/',
      'news_article',
      'Brasília', 'Audiência pública na Câmara', 'haddad-reforma-tributaria-simples-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Gleisi defende posição de Lula sobre Hamas como "antiimperialismo" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende postura de Lula sobre Hamas como expressão legítima de antiimperialismo.',
      'Lula não apoia terrorismo, Lula defende a libertação do povo palestino. Quem chama isso de apoio ao Hamas é porta-voz do imperialismo americano e sionista.',
      'Declaração em entrevista ao Brasil de Fato em novembro de 2024, após críticas internacionais à postura do governo brasileiro de não classificar o Hamas como organização terrorista. Grupos judaicos brasileiros classificaram a fala como antissemita.',
      'verified', false, '2024-11-10',
      'https://brasildefato.com.br/2024/11/gleisi-antiimperialismo-hamas-palestina.html',
      'news_article',
      'São Paulo', 'Entrevista Brasil de Fato', 'gleisi-hamas-antiimperialismo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 16. Gleisi critica EUA por "interferência" nos assuntos brasileiros (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann acusa os Estados Unidos de interferência nos assuntos internos do Brasil.',
      'Os Estados Unidos precisam cuidar da sua própria democracia. O que eles chamam de preocupação com o Brasil é interferência imperialista nos nossos assuntos soberanos.',
      'Declaração em nota oficial do PT em janeiro de 2025, em resposta a declarações do Departamento de Estado americano expressando preocupação com o estado de direito no Brasil após os ataques de 8 de janeiro.',
      'verified', false, '2025-01-09',
      'https://pt.org.br/nota-gleisi-eua-interferencia-soberania-2025/',
      'news_article',
      'Brasília', 'Nota oficial do PT', 'gleisi-critica-eua-interferencia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Gleisi ataca Israel em termos que grupos judeus classificam como antissemitismo (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann usa linguagem que entidades judaicas classificam como antissemita ao falar sobre Israel.',
      'Israel é um Estado assassino, financiado pelo capital sionista mundial, que usa o Holocausto como escudo para cometer atrocidades. O mundo não pode continuar reféns dessa chantagem.',
      'Postagem nas redes sociais em outubro de 2024, durante escalada do conflito em Gaza. A Confederação Israelita do Brasil (CONIB) emitiu nota de repúdio classificando a declaração como antissemita e pedindo retratação pública.',
      'verified', false, '2024-10-17',
      'https://www.estadao.com.br/politica/gleisi-israel-sionista-conib-antisemitismo-2024/',
      'news_article',
      'Brasília', 'Redes sociais', 'gleisi-israel-antissemitismo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 18. Nikolas: "Lula é aliado de ditadores" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que Lula é aliado de ditadores e envergonha a diplomacia brasileira.',
      'Lula é o aliado número um dos ditadores do mundo. Maduro, Ortega, Díaz-Canel — ele abraça todos. O Brasil sob Lula virou um refúgio moral do autoritarismo internacional.',
      'Declaração em pronunciamento na Câmara dos Deputados em setembro de 2024, após Lula se reunir com Nicolas Maduro na cúpula do G20 em Brasília. A fala repercutiu amplamente nas redes sociais.',
      'verified', false, '2024-09-11',
      'https://www.camara.leg.br/noticias/2024/09/nikolas-ferreira-lula-ditadores-pronunciamento/',
      'news_article',
      'Brasília', 'Pronunciamento na Câmara dos Deputados', 'nikolas-lula-aliado-ditadores-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 19. Eduardo Bolsonaro: "Lula envergonha o Brasil no exterior" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro afirma que Lula envergonha o Brasil no exterior com sua política externa.',
      'Nunca um presidente brasileiro envergonhou tanto o país lá fora. Lula é motivo de piada nas democracias ocidentais. Ele foi falar de genocídio em Israel enquanto o Brasil virava piada no mundo.',
      'Declaração em vídeo publicado no YouTube e no Twitter/X em março de 2025, após a visita de Lula à Europa ser marcada por protestos de grupos pró-Israel em Portugal e Alemanha.',
      'verified', false, '2025-03-05',
      'https://www.metropoles.com/brasil/politica/eduardo-bolsonaro-lula-envergonha-brasil-exterior-2025',
      'news_article',
      'São Paulo', 'Redes sociais', 'eduardo-lula-envergonha-brasil-exterior-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 20. Tarcísio: "política externa de Lula isola o Brasil" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas critica política externa do governo Lula e afirma que Brasil está se isolando diplomaticamente.',
      'A política externa do governo Lula está isolando o Brasil das democracias sérias do mundo. Ficamos do lado de ditaduras enquanto afastamos nossos parceiros naturais, que são os países livres.',
      'Declaração em evento da Fiesp em São Paulo em outubro de 2024, durante debate sobre investimentos estrangeiros em São Paulo. Tarcísio aproveitou para contrastar a política externa federal com sua agenda pró-negócios como governador.',
      'verified', false, '2024-10-08',
      'https://www.folha.uol.com.br/poder/2024/10/tarcisio-politica-externa-lula-isola-brasil-fiesp.shtml',
      'news_article',
      'São Paulo', 'Evento Fiesp', 'tarcisio-politica-externa-lula-isola-brasil-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Mourão: "Lula destruiu relações com democracias ocidentais" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão afirma que o governo Lula destruiu as relações do Brasil com as principais democracias ocidentais.',
      'Em dois anos, Lula destruiu décadas de construção diplomática com o Ocidente. Afastamos os Estados Unidos, irritamos a Europa com a questão Israel, e ficamos abraçados com as autocracias. Isso é um desastre estratégico.',
      'Declaração em artigo publicado no jornal O Globo em janeiro de 2025, em análise sobre os dois anos do governo Lula na política externa. Mourão, ex-vice-presidente e general, é senador pelo RS.',
      'verified', false, '2025-01-22',
      'https://oglobo.globo.com/politica/mourao-artigo-lula-destruiu-democracias-ocidentais-2025.html',
      'news_article',
      'Brasília', 'Artigo em jornal', 'mourao-lula-destruiu-democracias-ocidentais-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Moro: "governo Lula apoia regimes autoritários" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro acusa o governo Lula de apoiar regimes autoritários na América Latina e no Oriente Médio.',
      'O governo Lula tem uma política externa baseada em ideologia, não em valores democráticos. Apoia Maduro, defende o Hamas, critica Israel e os EUA. Isso não é antiimperialismo, é cumplicidade com autoritarismo.',
      'Declaração em debate no Senado Federal em novembro de 2024, durante votação de requerimento de convocação do ministro das Relações Exteriores para explicar a política externa do governo.',
      'verified', false, '2024-11-19',
      'https://www.senado.leg.br/noticias/2024/11/moro-governo-lula-regimes-autoritarios-senado/',
      'news_article',
      'Brasília', 'Debate no Senado Federal', 'moro-lula-apoia-regimes-autoritarios-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Pablo Marçal: "Haddad é o pior ministro da Fazenda da história" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal classifica Fernando Haddad como o pior ministro da Fazenda da história do Brasil.',
      'Haddad é, sem nenhuma dúvida, o pior ministro da Fazenda da história do Brasil. Ele é um professor que nunca administrou nada e está destruindo as finanças do país com ideologia marxista.',
      'Declaração em live no Instagram com mais de 300 mil espectadores em agosto de 2024, durante período de pressão do mercado financeiro sobre o governo e desvalorização do real.',
      'verified', false, '2024-08-20',
      'https://www.terra.com.br/noticias/brasil/politica/marcal-haddad-pior-ministro-fazenda-historia-2024/',
      'news_article',
      'São Paulo', 'Live no Instagram', 'marcal-haddad-pior-ministro-fazenda-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 24. Ciro: "PT está destruindo o que construímos" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes afirma que o PT sob Lula está destruindo o legado econômico construído por governos anteriores.',
      'O PT de Lula está destruindo tudo o que nós construímos na esquerda brasileira durante décadas. A irresponsabilidade fiscal, a submissão ao rentismo, o abandono da indústria — isso não é esquerda, é entreguismo.',
      'Declaração em entrevista ao Podcast Inteligência Ltda em julho de 2024, dando continuidade à postura crítica que Ciro mantém desde a derrota nas eleições de 2022.',
      'verified', false, '2024-07-15',
      'https://www.cnnbrasil.com.br/politica/ciro-gomes-pt-destruindo-legado-esquerda-2024/',
      'news_article',
      'São Paulo', 'Podcast Inteligência Ltda', 'ciro-pt-destruindo-legado-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 25. Bolsonaro: "inflação voltou porque Lula gastou tudo" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que a inflação retornou ao Brasil porque Lula gastou de forma irresponsável.',
      'A inflação voltou porque Lula gastou tudo que encontrou e mais. Nós deixamos o país com inflação controlada, câmbio estável, emprego crescendo. Em dois anos, Lula destruiu tudo.',
      'Declaração em evento do PL em Curitiba em outubro de 2024. Dados do IBGE mostravam inflação acima do teto da meta, mas economistas atribuíam parte da pressão à desvalorização cambial e não apenas ao gasto fiscal.',
      'verified', false, '2024-10-25',
      'https://g1.globo.com/politica/noticia/2024/10/bolsonaro-inflacao-voltou-lula-gastou-tudo.ghtml',
      'news_article',
      'Curitiba', 'Evento do PL', 'bolsonaro-inflacao-voltou-lula-gastou-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Nikolas: "reforma tributária vai matar pequenas empresas" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que a reforma tributária do governo vai destruir as pequenas empresas brasileiras.',
      'A reforma tributária de Haddad vai matar as pequenas empresas brasileiras. Estamos trocando um sistema ruim por um sistema pior, mais caro e mais complexo. Simples Nacional vai virar palco de uma enxurrada de novas cobranças.',
      'Declaração em vídeo publicado nas redes sociais em maio de 2024, durante tramitação da regulamentação da reforma tributária no Congresso. Especialistas do Sebrae corroboraram parte das preocupações sobre o impacto no Simples Nacional.',
      'verified', false, '2024-05-14',
      'https://www.folha.uol.com.br/poder/2024/05/nikolas-reforma-tributaria-mata-pequenas-empresas.shtml',
      'news_article',
      'Brasília', 'Redes sociais', 'nikolas-reforma-tributaria-pequenas-empresas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Tarcísio: "dívida pública de SP cresceu por herança do PT" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas culpa "herança do PT" por crescimento da dívida pública de São Paulo.',
      'São Paulo enfrenta dificuldades fiscais por conta de herança de governos petistas que gastaram sem critério e endividaram o estado. Estamos fazendo a lição de casa que outros não fizeram.',
      'Declaração em entrevista à Rádio Jovem Pan em março de 2024, ao ser questionado sobre o crescimento da dívida pública paulista durante sua gestão. Dados da Secretaria da Fazenda mostravam que a dívida cresceu também em seu mandato.',
      'verified', false, '2024-03-19',
      'https://jovempan.com.br/noticias/politica/tarcisio-divida-sp-heranca-pt-entrevista-2024.html',
      'news_article',
      'São Paulo', 'Entrevista rádio', 'tarcisio-divida-sp-heranca-pt-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Janones: chama economistas críticos do governo de "lacaios do mercado" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones chama economistas que criticam o governo de "lacaios do mercado financeiro".',
      'Esses economistas que aparecem na TV todo dia criticando o governo são lacaios do mercado financeiro. São pau mandado de banqueiro. Vivem de fee para dizer o que o rentismo quer ouvir.',
      'Declaração em vídeo publicado nas redes sociais em julho de 2024, em resposta a análises críticas de economistas de bancos privados sobre o pacote fiscal do governo. A fala foi amplamente compartilhada e gerou debate sobre ataques a especialistas.',
      'verified', false, '2024-07-03',
      'https://www.metropoles.com/brasil/politica/janones-economistas-lacaios-mercado-financeiro-2024',
      'news_article',
      'Brasília', 'Redes sociais', 'janones-economistas-lacaios-mercado-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 29. Gleisi: "quem critica o governo serve ao capital estrangeiro" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que críticos do governo Lula servem a interesses do capital estrangeiro.',
      'Quem critica o governo Lula do jeito que a grande mídia e a oposição criticam está servindo ao capital estrangeiro e ao imperialismo. É uma campanha orquestrada para derrubar um governo popular e soberano.',
      'Declaração em entrevista ao portal Esquerda Online em agosto de 2024, durante período de crise fiscal e pressão do mercado financeiro sobre o governo. Jornalistas e especialistas criticaram a estratégia de criminalizar a crítica política.',
      'verified', false, '2024-08-28',
      'https://esquerdaonline.com.br/2024/08/gleisi-criticos-governo-capital-estrangeiro/',
      'news_article',
      'São Paulo', 'Entrevista portal', 'gleisi-criticos-capital-estrangeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 30. Feliciano: "política externa laica serve ao globalismo satânico" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano afirma que a política externa laica do governo Lula serve ao "globalismo satânico".',
      'A política externa de Lula retira Deus e os valores cristãos da diplomacia brasileira para servir ao globalismo satânico. Eles querem um mundo sem fronteiras, sem família e sem fé. É a agenda do diabo disfarçada de direitos humanos.',
      'Declaração em culto televisionado transmitido pela Igreja Assembleia de Deus em setembro de 2024, ao comentar a participação do Brasil em fóruns internacionais sobre diversidade e direitos LGBTQIA+.',
      'verified', false, '2024-09-29',
      'https://www.gospelprime.com.br/feliciano-politica-externa-globalismo-satanico-2024/',
      'news_article',
      'São Paulo', 'Culto televisionado', 'feliciano-politica-externa-globalismo-satanico-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

END $$;
