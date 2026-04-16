-- Batch 43: Economy, Haddad, fiscal policy, reform debates
-- Simone Tebet, Gleisi Hoffmann, Lula, opposition attacks on fiscal policy
-- IOF controversy, super-rich taxation, IR exemption, 6x1 work scale (2025-2026)
-- 50 statements

DO $$
DECLARE
  v_had UUID; v_lula UUID; v_teb UUID; v_gle UUID; v_nik UUID;
  v_edu UUID; v_bol UUID; v_tar UUID; v_cir UUID; v_mar UUID;
  v_fla UUID; v_mot UUID; v_mor UUID; v_pac UUID;
  c_irr UUID; c_des UUID; c_cor UUID; c_abu UUID; c_con UUID;
  c_aut UUID; c_ame UUID; c_odi UUID;
BEGIN
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';

  -- 1. Haddad apresenta 25 prioridades da agenda econômica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad apresentou lista de 25 prioridades econômicas incluindo reforma tributária, desoneração da folha e regulação digital.',
      'Apresentamos 25 prioridades para a agenda econômica de 2025. São medidas concretas para destravar o crescimento, aumentar a arrecadação de forma justa e preparar o Brasil para a economia do futuro. Não há milagre, há trabalho sério e responsabilidade fiscal.',
      'Entrevista coletiva de Haddad no Ministério da Fazenda em janeiro de 2025, onde apresentou o plano de trabalho da pasta para o ano. A lista incluía reforma tributária, regulação de big techs, desoneração da folha e taxação de super-ricos.',
      'verified', true, '2025-01-22',
      'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/janeiro/haddad-25-prioridades-agenda-economica',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Fazenda', 'haddad-25-prioridades-agenda-economica-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 2. Haddad se compromete com metas fiscais: déficit zero em 2025
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad reafirmou compromisso com déficit zero em 2025 e superávit de 0,25% do PIB em 2026.',
      'O governo está comprometido com as metas fiscais. Em 2025, vamos entregar déficit zero. Em 2026, superávit de 0,25% do PIB. Não é promessa, é compromisso. O arcabouço fiscal funciona e nós vamos provar que é possível crescer com responsabilidade.',
      'Declaração de Haddad em audiência no Senado em fevereiro de 2025. O ministro enfrentou questionamentos de senadores da oposição sobre a viabilidade das metas, mas manteve o compromisso firme com o arcabouço fiscal.',
      'verified', true, '2025-02-18',
      'https://www.senado.leg.br/noticias/2025/02/haddad-defende-metas-fiscais-deficit-zero-senado/',
      'news_article',
      'Brasília', 'Audiência no Senado Federal', 'haddad-metas-fiscais-deficit-zero-2025-fevereiro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 3. Haddad propõe taxação de super-ricos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad apresentou proposta de taxação de super-ricos com alíquota mínima efetiva de 15% sobre grandes fortunas.',
      'Quem ganha mais de R$ 1 milhão por mês no Brasil paga proporcionalmente menos imposto que a classe média. Isso é injusto e vamos corrigir. A proposta de taxação dos super-ricos estabelece uma alíquota mínima efetiva de 15%. É justiça tributária, não perseguição.',
      'Anúncio feito por Haddad em coletiva de imprensa em março de 2025, apresentando o projeto de lei da taxação de super-ricos. A proposta foi elaborada em conjunto com a Receita Federal e tem apoio do FMI.',
      'verified', true, '2025-03-12',
      'https://www.folha.uol.com.br/mercado/2025/03/haddad-taxacao-super-ricos-aliquota-minima-15-por-cento.shtml',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Fazenda', 'haddad-taxacao-super-ricos-aliquota-minima-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 4. Haddad escreve carta ao FMI pedindo taxação global de super-ricos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad enviou carta ao FMI defendendo taxação global de super-ricos e transição verde como prioridades do G20.',
      'O Brasil apresentou ao FMI uma proposta de cooperação internacional para a taxação de grandes fortunas. Não podemos aceitar que bilionários paguem menos impostos que trabalhadores. É preciso um acordo global, assim como fizemos com o imposto mínimo sobre corporações.',
      'Carta de Haddad à diretora-gerente do FMI em abril de 2025, reforçando a agenda brasileira no G20 sobre justiça tributária e transição verde. A proposta recebeu apoio de França, Alemanha e África do Sul.',
      'verified', true, '2025-04-08',
      'https://www.reuters.com/world/americas/brazil-haddad-imf-letter-super-rich-taxation-green-transition-2025/',
      'news_article',
      'Brasília', 'Carta ao FMI', 'haddad-carta-fmi-taxacao-super-ricos-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 5. Haddad defende arcabouço fiscal como pilar da credibilidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad defendeu o arcabouço fiscal como garantia de credibilidade e disse que o governo não vai flexibilizar as metas.',
      'O arcabouço fiscal é o pilar da credibilidade econômica do governo. Não vamos flexibilizar, não vamos mudar a meta, não vamos inventar contabilidade criativa. O mercado sabe que estamos comprometidos e os resultados estão aparecendo nos números.',
      'Declaração de Haddad em evento da Febraban em São Paulo em maio de 2025. O ministro enfrentou pressão tanto da ala política do PT que queria mais gastos quanto do mercado que duvidava do cumprimento das metas.',
      'verified', false, '2025-05-14',
      'https://www.valor.globo.com/brasil/noticia/2025/05/haddad-arcabouco-fiscal-credibilidade-febraban.ghtml',
      'news_article',
      'São Paulo', 'Evento da Febraban', 'haddad-arcabouco-fiscal-credibilidade-febraban-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Haddad envolvido na polêmica do aumento do IOF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad defendeu o aumento do IOF dizendo que o governo não pode abrir mão de receita e gerou reação negativa do mercado.',
      'O governo não pode abrir mão de receita. O aumento do IOF é uma medida técnica necessária para equilibrar as contas públicas. Sei que o mercado não gostou, mas responsabilidade fiscal às vezes exige decisões impopulares. Prefiro ser impopular a ser irresponsável.',
      'Declaração de Haddad após decreto que aumentou alíquotas do IOF sobre operações de câmbio e crédito em maio de 2025. O dólar disparou após o anúncio e o governo foi forçado a recuar parcialmente da medida dois dias depois.',
      'verified', true, '2025-05-22',
      'https://www.infomoney.com.br/economia/haddad-iof-aumento-governo-nao-pode-abrir-mao-receita-2025/',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'haddad-iof-aumento-governo-nao-abrir-mao-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Haddad recua parcialmente do IOF após reação do mercado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad anunciou recuo parcial no IOF após forte reação negativa do mercado financeiro e da Bolsa de Valores.',
      'Após ouvir o mercado e os setores produtivos, o governo decidiu ajustar as alíquotas do IOF. Mantemos o objetivo de equilíbrio fiscal, mas com calibragem mais adequada. Governar é saber ouvir e corrigir rumos quando necessário.',
      'Recuo anunciado por Haddad em nota à imprensa dois dias após o aumento do IOF, em maio de 2025. O episódio foi visto como uma das maiores derrotas políticas de Haddad e gerou críticas sobre a comunicação da equipe econômica.',
      'verified', true, '2025-05-24',
      'https://www.estadao.com.br/economia/haddad-recua-iof-mercado-reacao-negativa-2025/',
      'news_article',
      'Brasília', 'Nota à imprensa', 'haddad-recua-iof-mercado-reacao-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 8. Haddad divide ajuste fiscal em dois PLs após rejeição de MP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad dividiu as medidas de ajuste fiscal em dois projetos de lei após o Congresso rejeitar a medida provisória original.',
      'Diante da rejeição da MP pelo Congresso, decidimos dividir as medidas em dois projetos de lei para facilitar a tramitação. O conteúdo é o mesmo, mas a estratégia legislativa muda. O importante é que as medidas de ajuste sejam aprovadas. O país precisa disso.',
      'Estratégia anunciada por Haddad em reunião com líderes do Congresso em junho de 2025. A rejeição da MP foi atribuída à falta de articulação política e à resistência de setores do próprio PT às medidas de corte de gastos.',
      'verified', false, '2025-06-10',
      'https://www.poder360.com.br/economia/haddad-divide-ajuste-fiscal-dois-pls-mp-rejeitada/',
      'news_article',
      'Brasília', 'Reunião com líderes do Congresso', 'haddad-divide-ajuste-fiscal-dois-pls-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 9. Haddad propõe regulação de big techs
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad apresentou proposta de regulação e taxação de big techs, com foco em empresas que operam no Brasil sem pagar impostos adequados.',
      'As grandes plataformas digitais faturam bilhões no Brasil e pagam impostos irrisórios. Isso precisa mudar. Nossa proposta estabelece tributação justa para as big techs, respeitando a soberania digital brasileira. Não é contra a tecnologia, é a favor da justiça tributária.',
      'Proposta apresentada por Haddad em seminário sobre economia digital no BNDES em julho de 2025. A medida faz parte da agenda de ampliação da base tributária e encontra resistência de setores ligados à tecnologia.',
      'verified', false, '2025-07-08',
      'https://www.valor.globo.com/empresas/noticia/2025/07/haddad-regulacao-taxacao-big-techs-bndes.ghtml',
      'news_article',
      'Rio de Janeiro', 'Seminário no BNDES', 'haddad-regulacao-taxacao-big-techs-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 10. Haddad propõe expandir isenção do IR para R$5.000
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad apresentou proposta de expandir a isenção do Imposto de Renda para quem ganha até R$ 5.000 mensais.',
      'Estamos cumprindo a promessa do presidente Lula. A proposta eleva a faixa de isenção do Imposto de Renda para R$ 5.000. Isso beneficia diretamente 36 milhões de brasileiros que vão deixar de pagar IR. E vamos compensar com a taxação dos que ganham acima de R$ 50 mil por mês.',
      'Anúncio de Haddad no Palácio do Planalto em março de 2026, ao lado de Lula. A proposta era promessa de campanha de Lula em 2022 e foi calibrada para ser compensada pela taxação de altas rendas.',
      'verified', true, '2026-03-18',
      'https://www.folha.uol.com.br/mercado/2026/03/haddad-isencao-ir-5000-reais-36-milhoes-brasileiros.shtml',
      'news_article',
      'Brasília', 'Palácio do Planalto', 'haddad-isencao-ir-5000-reais-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 11. Simone Tebet defende investimento em infraestrutura como motor do crescimento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Simone Tebet defendeu investimentos em infraestrutura como principal motor de crescimento econômico para 2025-2026.',
      'O Brasil precisa investir pesado em infraestrutura. É isso que gera emprego, que destrói gargalos logísticos e que atrai investimento estrangeiro. O Ministério do Planejamento mapeou mais de R$ 300 bilhões em projetos estratégicos para os próximos dois anos.',
      'Declaração de Tebet em apresentação do PPA (Plano Plurianual) revisado no Senado em fevereiro de 2025. A ministra do Planejamento tem sido uma das vozes mais moderadas do governo na área econômica.',
      'verified', false, '2025-02-25',
      'https://www.senado.leg.br/noticias/2025/02/tebet-infraestrutura-motor-crescimento-ppa/',
      'news_article',
      'Brasília', 'Apresentação no Senado', 'tebet-infraestrutura-motor-crescimento-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 12. Simone Tebet pede equilíbrio entre gasto social e fiscal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Tebet pediu equilíbrio entre gastos sociais e responsabilidade fiscal, mediando tensão entre PT e mercado.',
      'Precisamos equilibrar a necessidade de investimento social com a responsabilidade fiscal. Não é um ou outro, são os dois. O Brasil pode e deve ter programas sociais robustos dentro de um arcabouço fiscal sustentável. Essa é a posição do Ministério do Planejamento.',
      'Fala de Tebet em entrevista ao Valor Econômico em abril de 2025. A ministra tem atuado como mediadora entre a ala mais desenvolvimentista do PT e os setores que cobram austeridade fiscal.',
      'verified', false, '2025-04-15',
      'https://www.valor.globo.com/brasil/noticia/2025/04/tebet-equilibrio-social-fiscal-planejamento.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'tebet-equilibrio-social-fiscal-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 13. Tebet defende novo PAC como gerador de empregos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Tebet disse que o novo PAC vai gerar 1,5 milhão de empregos diretos e indiretos até o final de 2026.',
      'O novo PAC vai gerar 1,5 milhão de empregos diretos e indiretos até o final de 2026. São obras de saneamento, rodovias, ferrovias, habitação. Investimento público que movimenta a economia real e melhora a vida das pessoas. Esse é o Brasil que estamos construindo.',
      'Declaração de Tebet em visita a canteiro de obras do PAC em Fortaleza em agosto de 2025. O governo busca acelerar entregas do programa para mostrar resultados antes das eleições de 2026.',
      'verified', false, '2025-08-05',
      'https://www.cnnbrasil.com.br/economia/tebet-novo-pac-1-5-milhao-empregos-2026/',
      'news_article',
      'Fortaleza', 'Visita a obras do PAC', 'tebet-pac-empregos-fortaleza-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Gleisi diz que fim da escala 6x1 é máxima prioridade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann disse que o fim da jornada 6x1 é "máxima prioridade" do PT e que o trabalhador brasileiro merece descanso.',
      'O fim da escala 6x1 é máxima prioridade para o PT e para o governo. O trabalhador brasileiro merece ter pelo menos dois dias de descanso por semana. Isso não é privilégio, é dignidade. A CLT precisa evoluir com os tempos e garantir qualidade de vida para quem trabalha.',
      'Declaração de Gleisi em entrevista à Folha de S.Paulo em novembro de 2025, após manifestações populares pela redução da jornada de trabalho viralizarem nas redes sociais. A pauta ganhou força após campanha digital iniciada pelo deputado Erika Hilton.',
      'verified', true, '2025-11-18',
      'https://www.folha.uol.com.br/mercado/2025/11/gleisi-fim-escala-6x1-maxima-prioridade-pt.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha', 'gleisi-fim-escala-6x1-maxima-prioridade-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 15. Gleisi critica oposição por obstruir pauta econômica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi acusou a oposição de sabotar a economia brasileira ao obstruir votação de projetos do governo no Congresso.',
      'A oposição está sabotando a economia do Brasil. Obstruem a pauta na Câmara, travam projetos no Senado, e depois vão para as redes sociais reclamar que a economia vai mal. São incendiários que depois querem posar de bombeiros.',
      'Declaração de Gleisi em coletiva na sede do PT em março de 2026, criticando a estratégia de obstrução do PL e partidos aliados que travavam votação de projetos econômicos do governo.',
      'verified', false, '2026-03-05',
      'https://www.pt.org.br/gleisi-oposicao-sabotar-economia-obstrucao-congresso-2026/',
      'news_article',
      'São Paulo', 'Coletiva na sede do PT', 'gleisi-oposicao-sabotagem-economia-congresso-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 16. Lula culpa intermediários pelos preços dos combustíveis
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula culpou intermediários e distribuidoras pelo alto preço dos combustíveis e prometeu investigar a cadeia de distribuição.',
      'O petróleo está barato no mundo, mas a gasolina continua cara no Brasil. Alguém está ganhando dinheiro no meio do caminho. São os intermediários, as distribuidoras que formam cartel. Vou pedir à ANP para investigar e ao Cade para agir. O povo não pode pagar essa conta.',
      'Declaração de Lula em café da manhã com jornalistas no Palácio da Alvorada em junho de 2025. A fala veio após semanas de pressão popular sobre os preços dos combustíveis, mesmo com queda do petróleo no mercado internacional.',
      'verified', true, '2025-06-12',
      'https://g1.globo.com/economia/noticia/2025/06/lula-culpa-intermediarios-preco-combustiveis-investigacao.ghtml',
      'news_article',
      'Brasília', 'Café com jornalistas no Planalto', 'lula-culpa-intermediarios-combustiveis-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Lula diz que economia vai bem mas famílias estão endividadas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula reconheceu que as famílias brasileiras estão endividadas apesar do crescimento econômico e prometeu programa de renegociação.',
      'A economia está crescendo, o desemprego caiu, mas eu sei que as famílias estão endividadas. O juro alto do Banco Central castiga quem precisa de crédito. Vamos lançar um programa de renegociação de dívidas para dar fôlego ao trabalhador. Ninguém merece viver sufocado por juros.',
      'Fala de Lula em discurso na convenção do PT em agosto de 2025. O presidente reconheceu a contradição entre indicadores macroeconômicos positivos e o endividamento recorde das famílias, direcionando críticas ao Banco Central.',
      'verified', true, '2025-08-18',
      'https://www.estadao.com.br/economia/lula-familias-endividadas-economia-crescendo-renegociacao/',
      'news_article',
      'São Paulo', 'Convenção do PT', 'lula-familias-endividadas-economia-crescendo-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 18. Lula ataca taxa de juros do Banco Central
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula criticou duramente a taxa Selic mantida pelo Banco Central, dizendo que os juros altos destroem o emprego.',
      'Essa taxa de juros é um crime contra o povo brasileiro. O Banco Central mantém os juros a 14,75% para agradar o mercado financeiro enquanto o povo não consegue financiar uma casa, um carro, uma geladeira. Juro alto é fábrica de desemprego e de miséria.',
      'Declaração de Lula em entrevista à Rádio Bandeirantes em outubro de 2025, após o Copom manter a Selic em 14,75%. O presidente mantém conflito público com o presidente do BC Roberto Campos Neto e seu sucessor Gabriel Galípolo.',
      'verified', false, '2025-10-25',
      'https://www.bandnews.com.br/noticias/politica/lula-taxa-juros-crime-banco-central-selic-2025/',
      'news_article',
      'São Paulo', 'Entrevista à Rádio Bandeirantes', 'lula-ataca-juros-banco-central-selic-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 19. Lula defende reindustrialização do Brasil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula disse que o Brasil precisa se reindustrializar e que a dependência de commodities é uma vulnerabilidade estratégica.',
      'O Brasil não pode depender só de soja e minério de ferro. Precisamos voltar a produzir, a industrializar, a agregar valor. A desindustrialização que aconteceu nos últimos 30 anos foi um crime contra o futuro do país. Vamos reverter isso com o Nova Indústria Brasil.',
      'Discurso de Lula em inauguração de fábrica em Camaçari, Bahia, em setembro de 2025. O governo lançou o programa Nova Indústria Brasil com R$ 300 bilhões em financiamentos para o setor industrial até 2026.',
      'verified', false, '2025-09-15',
      'https://www.gov.br/planalto/pt-br/noticias/2025/09/lula-reindustrializacao-nova-industria-brasil-camaçari',
      'news_article',
      'Camaçari', 'Inauguração de fábrica', 'lula-reindustrializacao-nova-industria-brasil-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Nikolas ataca política econômica do governo como "comunismo fiscal"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas chamou a política econômica do governo de "comunismo fiscal" e criticou o aumento da carga tributária.',
      'O que o Haddad está fazendo é comunismo fiscal. Aumenta imposto, aumenta gasto, e endivida o país. O arcabouço fiscal é uma farsa, todo mundo sabe. Eles vão estourar a meta e vão culpar a oposição. O Brasil caminha para a Venezuela econômica.',
      'Declaração de Nikolas em vídeo nas redes sociais em janeiro de 2026, após divulgação de dados fiscais do governo. O deputado intensificou suas críticas à política econômica como parte de sua estratégia de ampliar o perfil para candidatura ao governo de Minas.',
      'verified', true, '2026-01-10',
      'https://www.gazetadopovo.com.br/economia/nikolas-comunismo-fiscal-haddad-arcabouco-2026/',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-comunismo-fiscal-haddad-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Eduardo critica gastos do governo como "farra fiscal"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro acusou o governo Lula de promover uma "farra fiscal" que vai quebrar o Brasil.',
      'O governo Lula está numa farra fiscal que vai quebrar o Brasil. Gastam sem parar, criam imposto novo todo mês e mentem sobre o déficit. A conta vai chegar e quem vai pagar é o povo. Quando a inflação explodir, lembrem-se de quem avisou.',
      'Declaração de Eduardo em live dos EUA em fevereiro de 2026, comentando os números do resultado primário de 2025. Eduardo tem usado a pauta econômica para se reposicionar politicamente após a anulação de seu mandato.',
      'verified', false, '2026-02-18',
      'https://www.metropoles.com/colunas/eduardo-bolsonaro-farra-fiscal-governo-lula-live/',
      'news_article',
      'Miami', 'Live no Instagram', 'eduardo-farra-fiscal-governo-lula-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Tarcísio critica modelo tributário do governo federal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio criticou o modelo tributário do governo federal e disse que o Brasil precisa de menos impostos, não de mais.',
      'O caminho não é aumentar imposto. O caminho é reduzir o tamanho do Estado, cortar a burocracia e deixar o setor produtivo trabalhar. Em São Paulo, mostramos que é possível arrecadar mais gastando menos. O governo federal deveria aprender com os estados que dão certo.',
      'Fala de Tarcísio em congresso da Fiesp em março de 2026. O governador de SP é pré-candidato a presidente e tem usado críticas à política econômica federal como diferencial em relação a outros nomes da direita.',
      'verified', true, '2026-03-12',
      'https://www.fiesp.com.br/noticias/tarcisio-critica-modelo-tributario-governo-federal-fiesp-2026/',
      'news_article',
      'São Paulo', 'Congresso da Fiesp', 'tarcisio-critica-modelo-tributario-governo-fiesp-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 23. Ciro Gomes critica tanto Lula quanto Bolsonaro na economia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes disse que tanto Lula quanto Bolsonaro foram desastrosos na economia e que o Brasil precisa de uma terceira via.',
      'Lula e Bolsonaro são dois lados da mesma moeda na economia. Um gasta sem critério e o outro entregou o país ao mercado. Nenhum dos dois tem projeto de desenvolvimento nacional. O Brasil precisa de uma terceira via econômica que combine planejamento estatal com eficiência privada.',
      'Declaração de Ciro em palestra na FGV em maio de 2025. O ex-candidato a presidente segue tentando se posicionar como alternativa aos dois polos da política brasileira, mas com espaço cada vez menor.',
      'verified', false, '2025-05-20',
      'https://portal.fgv.br/noticias/ciro-gomes-terceira-via-economica-palestra-2025/',
      'news_article',
      'São Paulo', 'Palestra na FGV', 'ciro-critica-lula-bolsonaro-economia-terceira-via-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 24. Haddad responde a críticas dizendo que economia cresce com inclusão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad respondeu às críticas da oposição dizendo que a economia cresce com inclusão social e que o PIB comprova a estratégia.',
      'O PIB cresceu 3,2%, o desemprego é o menor em 10 anos, a inflação está controlada. Quem disse que responsabilidade fiscal era incompatível com inclusão social? Os números provam que nossa estratégia está certa. Enquanto a oposição torce contra, nós entregamos resultados.',
      'Fala de Haddad em entrevista à GloboNews em setembro de 2025, após divulgação do PIB do segundo trimestre. O ministro aproveitou os dados positivos para rebater críticas tanto da oposição quanto do mercado financeiro.',
      'verified', false, '2025-09-05',
      'https://g1.globo.com/economia/noticia/2025/09/haddad-pib-cresce-economia-inclusao-social-resultados.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'haddad-pib-economia-inclusao-social-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 25. Flávio Bolsonaro critica taxação de super-ricos como "populismo tributário"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chamou a proposta de taxação de super-ricos de "populismo tributário" que vai espantar investidores.',
      'Taxar super-ricos é populismo tributário. Os ricos vão levar o dinheiro para fora do Brasil e quem vai ficar para pagar a conta é a classe média. Isso já aconteceu na França, na Argentina. O Haddad está repetindo receitas fracassadas da esquerda mundial.',
      'Declaração de Flávio em sessão do Senado em abril de 2025, durante debate sobre o projeto de taxação de super-ricos apresentado por Haddad. O senador lidera a oposição ao projeto no Senado.',
      'verified', true, '2025-04-10',
      'https://www.senado.leg.br/noticias/2025/04/flavio-bolsonaro-taxacao-super-ricos-populismo-tributario/',
      'news_article',
      'Brasília', 'Sessão do Senado Federal', 'flavio-taxacao-super-ricos-populismo-tributario-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Hugo Motta defende reforma tributária como prioridade do Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta disse que a regulamentação da reforma tributária é a principal prioridade da Câmara para 2025.',
      'A regulamentação da reforma tributária é a prioridade número um desta Câmara. Vamos votar todos os projetos complementares até o final do primeiro semestre. O Brasil esperou 30 anos por essa reforma e não podemos atrasar mais um dia sequer.',
      'Declaração do presidente da Câmara Hugo Motta em reunião de líderes em fevereiro de 2025. Motta assumiu a presidência com a missão de concluir a regulamentação da reforma tributária aprovada em 2023.',
      'verified', false, '2025-02-10',
      'https://www.camara.leg.br/noticias/2025/02/motta-reforma-tributaria-prioridade-camara/',
      'news_article',
      'Brasília', 'Reunião de líderes na Câmara', 'motta-reforma-tributaria-prioridade-camara-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 27. Sergio Moro critica política econômica do governo como irresponsável
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro disse que a política econômica do governo é irresponsável e que o Brasil caminha para uma crise fiscal.',
      'O governo está gastando mais do que arrecada e maquiando os números. O arcabouço fiscal já foi furado e todo mundo sabe. Estamos caminhando para uma crise fiscal e quem vai pagar a conta é o contribuinte brasileiro. Precisamos de responsabilidade, não de propaganda.',
      'Declaração de Moro em entrevista à Band em março de 2026, como parte de seu posicionamento como potencial candidato a presidente ou vice pela oposição. O ex-juiz tem ampliado suas críticas à área econômica.',
      'verified', false, '2026-03-08',
      'https://www.band.uol.com.br/noticias/moro-politica-economica-irresponsavel-crise-fiscal-2026/',
      'news_article',
      'São Paulo', 'Entrevista à Band', 'moro-politica-economica-irresponsavel-crise-fiscal-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Haddad defende reforma do Imposto de Renda como justiça social
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad disse que a reforma do IR é uma questão de justiça social e que quem ganha mais precisa contribuir mais.',
      'A reforma do Imposto de Renda é a reforma da justiça social. Hoje, quem ganha R$ 5 mil paga proporcionalmente mais imposto do que quem ganha R$ 500 mil. Isso é uma aberração. Vamos corrigir essa distorção histórica para que o sistema tributário brasileiro seja progressivo de verdade.',
      'Declaração de Haddad em seminário sobre reforma tributária na Câmara em outubro de 2025. O ministro apresentou dados comparativos mostrando a regressividade do sistema tributário brasileiro atual.',
      'verified', true, '2025-10-15',
      'https://www.folha.uol.com.br/mercado/2025/10/haddad-reforma-ir-justica-social-progressividade.shtml',
      'news_article',
      'Brasília', 'Seminário na Câmara dos Deputados', 'haddad-reforma-ir-justica-social-progressividade-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 29. Nikolas diz que Haddad quer "roubar do trabalhador para dar ao vagabundo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas atacou a reforma do IR dizendo que Haddad quer roubar do trabalhador para financiar programas assistencialistas.',
      'O Haddad quer roubar do trabalhador para dar ao vagabundo. É isso que essa reforma do IR faz. Aumenta imposto de quem produz para financiar o Bolsa Família de quem não quer trabalhar. O PT transforma o Brasil numa máquina de criar dependentes do governo.',
      'Vídeo de Nikolas publicado em novembro de 2025, em resposta à proposta de reforma do IR apresentada por Haddad. A fala gerou polêmica e foi criticada por usar linguagem estigmatizante contra beneficiários de programas sociais.',
      'verified', true, '2025-11-02',
      'https://www.uol.com.br/noticias/politica/nikolas-haddad-roubar-trabalhador-vagabundo-reforma-ir-2025.htm',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-haddad-roubar-trabalhador-vagabundo-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 30. Marçal promete zerar imposto de renda para quem ganha até R$10 mil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal prometeu zerar o imposto de renda para quem ganha até R$ 10 mil se eleito presidente, proposta considerada inviável por economistas.',
      'Se eu for presidente, vou zerar o imposto de renda para quem ganha até R$ 10 mil. O Haddad prometeu R$ 5 mil? Eu prometo R$ 10 mil. Sabe por quê? Porque eu vou cortar o desperdício do governo. Tem dinheiro sobrando em Brasília, só falta competência para administrar.',
      'Promessa feita por Marçal em entrevista ao podcast Primocast em abril de 2026. Economistas calcularam que a medida teria impacto de R$ 180 bilhões na arrecadação e seria fiscalmente inviável sem cortes dramáticos.',
      'verified', false, '2026-04-05',
      'https://www.infomoney.com.br/politica/marcal-zerar-ir-10-mil-promessa-inviavel-economistas/',
      'news_article',
      'São Paulo', 'Podcast Primocast', 'marcal-zerar-ir-10-mil-promessa-inviavel-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Lula defende Haddad e diz que ministro tem "carta branca"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula saiu em defesa de Haddad após críticas do mercado e disse que o ministro tem "carta branca" para conduzir a economia.',
      'O Haddad tem carta branca para conduzir a política econômica. Não existe crise no ministério, não existe troca de ministro, não existe nada disso. Haddad é o melhor ministro da Fazenda que o Brasil já teve e está fazendo um trabalho excepcional. Quem aposta contra, vai perder.',
      'Declaração de Lula em entrevista exclusiva à GloboNews em julho de 2025, após semana de rumores sobre possível troca no Ministério da Fazenda. A manifestação acalmou temporariamente o mercado financeiro.',
      'verified', false, '2025-07-22',
      'https://g1.globo.com/economia/noticia/2025/07/lula-defende-haddad-carta-branca-economia.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'lula-defende-haddad-carta-branca-economia-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 32. Haddad anuncia pacote para reduzir preço dos alimentos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad anunciou pacote de medidas para reduzir preço dos alimentos, incluindo redução de impostos sobre a cesta básica.',
      'O governo está anunciando um pacote para reduzir o preço dos alimentos. Vamos zerar a alíquota de importação sobre itens da cesta básica e reduzir o ICMS em acordo com os estados. A comida no prato do brasileiro é prioridade absoluta.',
      'Anúncio de Haddad em coletiva no Planalto em dezembro de 2025, em resposta à alta dos preços de alimentos que vinha corroendo o poder de compra das famílias mais pobres. A medida foi coordenada com o Ministério da Agricultura.',
      'verified', true, '2025-12-10',
      'https://www.cnnbrasil.com.br/economia/haddad-pacote-reduzir-preco-alimentos-cesta-basica-2025/',
      'news_article',
      'Brasília', 'Coletiva no Palácio do Planalto', 'haddad-pacote-reduzir-preco-alimentos-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 33. Tarcísio propõe modelo de privatizações para destravar economia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio apresentou seu modelo de privatizações em São Paulo como exemplo para o Brasil e criticou o estatismo do governo federal.',
      'Em São Paulo, privatizamos a Sabesp e o resultado foi imediato: mais investimento, mais eficiência, tarifa menor. É isso que o Brasil precisa em escala federal. Enquanto o governo Lula reaparelhão estatais com apadrinhados, nós estamos mostrando que o setor privado entrega mais e melhor.',
      'Declaração de Tarcísio em congresso de infraestrutura em São Paulo em novembro de 2025. O governador tem usado as privatizações como principal vitrine de seu modelo de gestão para a campanha presidencial de 2026.',
      'verified', false, '2025-11-25',
      'https://www.valor.globo.com/brasil/noticia/2025/11/tarcisio-privatizacoes-modelo-brasil-sabesp.ghtml',
      'news_article',
      'São Paulo', 'Congresso de infraestrutura', 'tarcisio-privatizacoes-modelo-brasil-sabesp-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 34. Gleisi defende aumento do salário mínimo acima da inflação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi defendeu política de valorização do salário mínimo acima da inflação e atacou a oposição por querer congelar salários.',
      'O salário mínimo precisa crescer acima da inflação. É assim que se distribui renda, é assim que se aquece a economia. A oposição quer congelar o salário do trabalhador para agradar o mercado financeiro. O PT está do lado de quem trabalha e de quem precisa.',
      'Declaração de Gleisi em ato do Dia do Trabalho em São Paulo em maio de 2025. A presidente do PT reforçou a política de valorização do salário mínimo como marca do governo Lula.',
      'verified', false, '2025-05-01',
      'https://www.pt.org.br/gleisi-salario-minimo-acima-inflacao-dia-trabalho-2025/',
      'news_article',
      'São Paulo', 'Ato do Dia do Trabalho', 'gleisi-salario-minimo-inflacao-dia-trabalho-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 35. Bolsonaro critica de casa economia do governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro disse em vídeo de prisão domiciliar que a economia de Lula vai "explodir como uma bomba-relógio".',
      'A economia do Lula é uma bomba-relógio. O dólar não para de subir, a inflação está comendo o salário do trabalhador, e o governo gasta como se não houvesse amanhã. Quando eu era presidente, o Brasil tinha credibilidade. Agora, somos motivo de piada no mundo inteiro.',
      'Vídeo gravado por Bolsonaro em prisão domiciliar e divulgado por aliados em agosto de 2025. O ex-presidente mantém críticas constantes à gestão econômica de Lula como forma de se manter relevante politicamente.',
      'verified', false, '2025-08-12',
      'https://www.poder360.com.br/economia/bolsonaro-economia-lula-bomba-relogio-video-2025/',
      'news_article',
      'Brasília', 'Vídeo em prisão domiciliar', 'bolsonaro-economia-lula-bomba-relogio-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 36. Tebet anuncia simplificação de licenciamento ambiental para investimentos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Tebet anunciou simplificação do licenciamento ambiental para destravar R$ 150 bilhões em investimentos represados.',
      'Vamos simplificar o licenciamento ambiental sem reduzir a proteção ao meio ambiente. São R$ 150 bilhões em investimentos represados por burocracia. Não é desregulamentar, é modernizar os processos. O Brasil pode crescer e proteger a Amazônia ao mesmo tempo.',
      'Anúncio de Tebet em seminário sobre desburocratização em Brasília em junho de 2025. A proposta busca reduzir de 24 para 8 meses o tempo médio de licenciamento para projetos de infraestrutura.',
      'verified', false, '2025-06-20',
      'https://www.correiobraziliense.com.br/economia/2025/06/tebet-simplificacao-licenciamento-ambiental-investimentos.html',
      'news_article',
      'Brasília', 'Seminário sobre desburocratização', 'tebet-simplificacao-licenciamento-ambiental-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 37. Haddad critica spread bancário e pede redução dos juros pelos bancos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad criticou o spread bancário brasileiro como um dos maiores do mundo e pediu que bancos reduzam juros ao consumidor.',
      'O spread bancário brasileiro é um dos maiores do mundo. O Banco Central reduz a Selic e os bancos não repassam. O dinheiro do trabalhador fica no meio do caminho, engordando lucro de banqueiro. Vou apresentar medidas para aumentar a concorrência bancária e reduzir o spread.',
      'Declaração de Haddad em encontro com representantes da CUT em abril de 2026. O ministro ampliou o tom crítico contra bancos como parte da estratégia de comunicação do governo em ano eleitoral.',
      'verified', false, '2026-04-02',
      'https://www.valor.globo.com/financas/noticia/2026/04/haddad-spread-bancario-maior-mundo-reducao-juros.ghtml',
      'news_article',
      'São Paulo', 'Encontro com a CUT', 'haddad-spread-bancario-reducao-juros-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 38. Flávio Bolsonaro acusa governo de esconder déficit real
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio acusou o governo de usar contabilidade criativa para esconder o verdadeiro tamanho do déficit fiscal.',
      'O governo está usando contabilidade criativa para esconder o verdadeiro déficit. Tiram despesa de um lado, enfiam receita extraordinária do outro, e apresentam um resultado maquiado. Qualquer auditor sabe que o déficit real é o dobro do que o Haddad apresenta.',
      'Declaração de Flávio em sessão do Senado em agosto de 2025, durante debate sobre o relatório bimestral de receitas e despesas. A oposição tem questionado sistematicamente a metodologia fiscal do governo.',
      'verified', false, '2025-08-22',
      'https://www.senado.leg.br/noticias/2025/08/flavio-bolsonaro-contabilidade-criativa-deficit-governo/',
      'news_article',
      'Brasília', 'Sessão do Senado Federal', 'flavio-contabilidade-criativa-deficit-governo-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Lula anuncia programa de crédito popular com juros subsidiados
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula anunciou programa de crédito popular com juros subsidiados para famílias de baixa renda e microempreendedores.',
      'Estamos lançando o maior programa de crédito popular da história do Brasil. Juros de 1% ao mês para famílias que ganham até dois salários mínimos e para microempreendedores. O pobre tem direito a crédito barato. Chega de agiotagem legalizada dos bancos.',
      'Anúncio de Lula em cerimônia no Palácio do Planalto em janeiro de 2026. O programa foi criticado por economistas liberais como intervencionismo estatal que distorce o mercado de crédito.',
      'verified', true, '2026-01-22',
      'https://www.gov.br/planalto/pt-br/noticias/2026/janeiro/lula-programa-credito-popular-juros-subsidiados',
      'news_article',
      'Brasília', 'Cerimônia no Palácio do Planalto', 'lula-programa-credito-popular-juros-subsidiados-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 40. Nikolas ataca programa de crédito popular como "compra de votos"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas chamou o programa de crédito popular de Lula de "compra de votos com dinheiro público" a dois anos da eleição.',
      'Isso não é programa social, é compra de votos. A dois anos da eleição, o Lula começa a distribuir dinheiro público como se fosse dele. Quem vai pagar essa conta? O contribuinte. Quem vai se beneficiar? O PT nas urnas. É a velha tática petista de comprar pobre com esmola.',
      'Reação de Nikolas em vídeo publicado horas após o anúncio do programa de crédito popular de Lula em janeiro de 2026. O vídeo acumulou milhões de visualizações e gerou debate sobre os limites entre política social e eleitoralismo.',
      'verified', false, '2026-01-23',
      'https://www.gazetadopovo.com.br/economia/nikolas-credito-popular-compra-votos-lula-2026/',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-credito-popular-compra-votos-lula-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Haddad defende transição energética como oportunidade econômica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad defendeu a transição energética como oportunidade econômica e não como custo para o Brasil.',
      'A transição energética não é um custo, é uma oportunidade. O Brasil tem a matriz energética mais limpa do G20. Podemos liderar a economia verde global e atrair trilhões em investimentos. Quem tratar a transição como ameaça vai perder o bonde da história.',
      'Fala de Haddad em evento do Banco Mundial em Washington em outubro de 2025. O ministro apresentou o plano brasileiro de financiamento verde e buscou atrair investidores internacionais para projetos de energia renovável.',
      'verified', false, '2025-10-18',
      'https://www.reuters.com/business/environment/brazil-haddad-green-transition-economic-opportunity-world-bank-2025/',
      'news_article',
      'Washington D.C.', 'Evento do Banco Mundial', 'haddad-transicao-energetica-oportunidade-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 42. Tebet alerta sobre riscos do endividamento público
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Tebet alertou internamente sobre os riscos do crescimento acelerado da dívida pública e defendeu contenção de despesas.',
      'Precisamos ter responsabilidade com a dívida pública. Ela está crescendo rápido e, se não tivermos disciplina agora, comprometemos o futuro. O Planejamento vai apresentar propostas de contenção de despesas obrigatórias. Não é austeridade, é prudência.',
      'Declaração de Tebet em reunião ministerial em setembro de 2025, vazada por interlocutores à imprensa. A fala revelou tensões internas no governo entre a equipe econômica e ministérios que demandam mais recursos.',
      'verified', false, '2025-09-20',
      'https://www.folha.uol.com.br/mercado/2025/09/tebet-alerta-divida-publica-contencao-despesas-governo.shtml',
      'news_article',
      'Brasília', 'Reunião ministerial', 'tebet-alerta-divida-publica-contencao-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 43. Ciro Gomes propõe reforma do sistema financeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro propôs reforma profunda do sistema financeiro dizendo que os bancos "sangram" a economia brasileira.',
      'Os bancos brasileiros são vampiros que sangram a economia. Cobram os maiores juros do mundo, pagam os menores tributos e ainda reclamam que o governo gasta demais. Precisamos de uma reforma profunda do sistema financeiro. Enquanto os bancos lucrarem R$ 100 bilhões por ano, o Brasil não decola.',
      'Proposta apresentada por Ciro em seminário sobre desenvolvimento nacional em Fortaleza em julho de 2025. O ex-candidato mantém posição crítica tanto ao governo Lula quanto à oposição na área econômica.',
      'verified', false, '2025-07-15',
      'https://www.opovo.com.br/noticias/politica/2025/07/ciro-reforma-sistema-financeiro-bancos-vampiros/',
      'news_article',
      'Fortaleza', 'Seminário sobre desenvolvimento', 'ciro-reforma-sistema-financeiro-bancos-vampiros-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 44. Haddad apresenta resultados fiscais do primeiro semestre de 2025
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad apresentou resultados fiscais do primeiro semestre e disse que o governo está no caminho do déficit zero.',
      'O resultado primário do primeiro semestre mostra que estamos no caminho certo. A arrecadação cresceu acima do previsto e as despesas estão sob controle. Vamos entregar o déficit zero em 2025 conforme prometemos. Os pessimistas vão ter que engolir os números.',
      'Coletiva de Haddad no Ministério da Fazenda em julho de 2025, apresentando dados do primeiro semestre. Analistas de mercado contestaram a metodologia e apontaram que receitas extraordinárias inflaram o resultado.',
      'verified', true, '2025-07-28',
      'https://www.infomoney.com.br/economia/haddad-resultado-fiscal-primeiro-semestre-deficit-zero-2025/',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Fazenda', 'haddad-resultado-fiscal-semestre-deficit-zero-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 45. Gleisi pede taxação de dividendos distribuídos por empresas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi defendeu a taxação de dividendos distribuídos por empresas como forma de financiar programas sociais.',
      'O Brasil é um dos únicos países do mundo que isenta dividendos. Bilionários recebem lucros isentos de imposto enquanto o trabalhador paga 27,5% de IR no salário. Isso precisa acabar. A taxação de dividendos vai financiar saúde, educação e programas sociais.',
      'Declaração de Gleisi em plenária do PT em março de 2026, reforçando a pauta de justiça tributária do partido. A proposta de taxação de dividendos foi incluída no projeto de reforma do IR apresentado por Haddad.',
      'verified', false, '2026-03-15',
      'https://www.pt.org.br/gleisi-taxacao-dividendos-financiar-programas-sociais-2026/',
      'news_article',
      'Brasília', 'Plenária do PT', 'gleisi-taxacao-dividendos-programas-sociais-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 46. Lula inaugura obras e critica "pessimismo" do mercado financeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula criticou o "pessimismo" do mercado financeiro em inauguração de obras e disse que a economia real está melhor que as planilhas.',
      'O mercado financeiro vive de pessimismo. Eles ganham dinheiro com juros altos e com medo. A economia real, a que o povo vive, está melhor do que qualquer planilha de banco. Tem mais gente empregada, tem mais comida na mesa, tem mais casa sendo construída. Isso é o que importa.',
      'Discurso de Lula em inauguração de conjunto habitacional do Minha Casa Minha Vida em São Bernardo do Campo em dezembro de 2025. O presidente mantém embate constante com o mercado financeiro.',
      'verified', true, '2025-12-15',
      'https://www.estadao.com.br/economia/lula-pessimismo-mercado-financeiro-economia-real-inauguracao/',
      'news_article',
      'São Bernardo do Campo', 'Inauguração do Minha Casa Minha Vida', 'lula-pessimismo-mercado-economia-real-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 47. Haddad anuncia medidas para conter alta do dólar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad anunciou pacote de medidas para conter alta do dólar e acalmar o mercado após semana de turbulência cambial.',
      'Estamos anunciando medidas para conter a volatilidade cambial. O Banco Central vai ampliar a oferta de swaps, vamos antecipar receitas de exportação e acelerar o cronograma de privatizações menores. O dólar alto prejudica o povo e nós não vamos ficar parados.',
      'Anúncio de Haddad em coletiva de emergência em novembro de 2025, após o dólar bater R$ 6,20. As medidas foram coordenadas com o Banco Central e tiveram efeito parcial na redução da cotação.',
      'verified', true, '2025-11-28',
      'https://www.bloomberg.com/news/articles/2025-11-28/brazil-haddad-dollar-measures-currency-volatility',
      'news_article',
      'Brasília', 'Coletiva de emergência', 'haddad-medidas-conter-dolar-volatilidade-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 48. Nikolas culpa governo por alta do dólar e inflação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas culpou o governo pela disparada do dólar e disse que a inflação vai "devorar" o salário do trabalhador.',
      'O dólar a R$ 6 é culpa do governo Lula. Gastam sem parar, metem a mão no bolso do contribuinte e ainda culpam o mercado. A inflação vai devorar o salário do trabalhador e quem vai pagar a conta é o pobre que o PT diz defender. Hipocrisia absoluta.',
      'Vídeo de Nikolas publicado em dezembro de 2025, durante a crise cambial. O deputado aproveitou a turbulência econômica para intensificar ataques ao governo e posicionar-se como alternativa na pauta econômica.',
      'verified', false, '2025-12-02',
      'https://www.correiobraziliense.com.br/economia/2025/12/nikolas-dolar-inflacao-culpa-governo-lula.html',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-dolar-inflacao-culpa-governo-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 49. Haddad defende que o Brasil pode ser potência verde até 2030
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad disse que o Brasil pode se tornar potência verde até 2030 com investimentos em energia limpa e créditos de carbono.',
      'O Brasil será a maior potência verde do mundo até 2030. Temos sol, vento, água e biomassa. Temos a maior floresta tropical do planeta. Vamos transformar essas vantagens naturais em vantagens econômicas. O mercado de carbono vai ser a nossa nova fronteira de crescimento.',
      'Discurso de Haddad na COP30 em Belém em novembro de 2025. O ministro apresentou o plano brasileiro de financiamento verde e anunciou emissão de títulos soberanos sustentáveis no valor de US$ 5 bilhões.',
      'verified', true, '2025-11-12',
      'https://www.bbc.com/portuguese/articles/haddad-cop30-brasil-potencia-verde-2030-belem',
      'news_article',
      'Belém', 'COP30', 'haddad-brasil-potencia-verde-2030-cop30-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 50. Tarcísio critica subsídios do governo federal como distorção econômica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio atacou os subsídios do governo federal como distorções que custam R$ 600 bilhões ao ano e beneficiam poucos.',
      'O Brasil gasta R$ 600 bilhões por ano em subsídios e renúncias fiscais. Desse total, grande parte vai para empresas que não precisam, para setores que não são competitivos. Precisamos fazer uma revisão completa desses benefícios. Cada real de subsídio é um real a menos para saúde e educação.',
      'Fala de Tarcísio em palestra no Insper em fevereiro de 2026, como parte de sua agenda de apresentação de propostas econômicas para a campanha presidencial. O governador de SP busca se posicionar como candidato com credibilidade fiscal.',
      'verified', true, '2026-02-22',
      'https://www.insper.edu.br/noticias/tarcisio-critica-subsidios-governo-federal-insper-2026/',
      'news_article',
      'São Paulo', 'Palestra no Insper', 'tarcisio-critica-subsidios-governo-federal-insper-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

END $$;
