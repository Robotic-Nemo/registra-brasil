-- Batch 29: Nepotism, abuse of power, self-dealing, and ethical violations
-- 30 statements across Brazilian politicians from all parties.

DO $$
DECLARE
  v_lula   UUID; v_dil  UUID; v_bol  UUID; v_tem  UUID; v_ren  UUID;
  v_sar    UUID; v_mal  UUID; v_val  UUID; v_jef  UUID; v_lir  UUID;
  v_pac    UUID; v_ter  UUID; v_fla  UUID; v_car  UUID; v_rom  UUID;
  v_cir    UUID; v_mor  UUID; v_mou  UUID; v_jan  UUID; v_had  UUID;
  v_gle    UUID; v_tar  UUID;
  c_nep UUID; c_cor UUID; c_abu UUID; c_des UUID; c_ant UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_dil  FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_tem  FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_sar  FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_mal  FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_val  FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO v_jef  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_lir  FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac  FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_ter  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_rom  FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO c_nep  FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_cor  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';

  -- 1. Lula nomeia filho Luís Cláudio para conselho da Petrobras (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula nomeia filho Luís Cláudio para o conselho de administração da Petrobras sem processo seletivo técnico transparente.',
      'Meu filho é competente. Posso nomear quem eu quiser para posições que tenho autoridade de nomear. Isso é prerrogativa do presidente.',
      'Declaração a jornalistas em Brasília em outubro de 2023, após críticas à indicação de Luís Cláudio Lula da Silva ao Conselho de Administração da Petrobras. A remuneração anual de conselheiros da Petrobras supera R$ 1 milhão. Críticos apontaram ausência de qualificação técnica na área de energia e petróleo. O caso reacendeu o debate sobre nepotismo nas estatais.',
      'verified', true, '2023-10-05',
      'https://g1.globo.com/politica/noticia/2023/10/lula-nomeia-filho-petrobras-conselho.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Palácio do Planalto',
      'lula-nomeia-filho-petrobras-nepotismo-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 2. Lula nomeia amigos sem qualificação para estatais (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende nomeações de aliados políticos sem perfil técnico para cargos em estatais como Correios, Eletrobras e Infraero.',
      'Toda indicação para empresa pública passa por critérios. Quem eu indico tem minha confiança e vai trabalhar pelo povo brasileiro. Confiança é um critério.',
      'Declaração durante coletiva de imprensa em março de 2023, após o governo nomear dezenas de diretores e conselheiros em estatais com histórico predominantemente político. Levantamento do Estadão identificou que mais de 80% das nomeações em empresas como Correios e Infraero eram de filiados ao PT ou partidos da base aliada, sem processo seletivo público.',
      'verified', false, '2023-03-22',
      'https://www.estadao.com.br/politica/lula-nomeia-aliados-estatais-sem-criterio-tecnico-2023/',
      'news_article',
      'Brasília', 'Palácio do Planalto — entrevista coletiva',
      'lula-nomeia-amigos-estatais-sem-qualificacao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 3. Flávio Bolsonaro defende esquema de rachadinha como "normal" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro defendeu o esquema pelo qual assessores devolviam até 89% de seus salários ao gabinete como prática normal e legal.',
      'Não tem nada de errado. O assessor trabalha para o gabinete e apoia as atividades do mandato. Qualquer contribuição que façam é voluntária e completamente legal.',
      'Entrevista à GloboNews em dezembro de 2018, após o portal The Intercept Brasil revelar que assessores do gabinete de Flávio na Assembleia Legislativa do Rio devolviam até 89% dos salários. Investigações do MP-RJ e da Receita Federal identificaram movimentações atípicas de R$ 2,2 milhões na conta de Fabrício Queiroz, assessor e motorista da família Bolsonaro.',
      'verified', true, '2018-12-05',
      'https://g1.globo.com/rj/rio-de-janeiro/noticia/2018/12/flavio-bolsonaro-defende-assessores-rachadinha-percentual-salario.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista GloboNews',
      'flavio-bolsonaro-rachadinha-esquema-normal-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 4. Flávio Bolsonaro: "Queiroz era funcionário exemplar" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro defendeu Fabrício Queiroz como funcionário exemplar, mesmo após a Receita Federal identificar movimentações financeiras atípicas em sua conta.',
      'Queiroz é um funcionário exemplar, dedicado, honesto. Ele não fez nada errado. Isso é perseguição política usando o nome da minha família para atacar meu pai.',
      'Declaração à imprensa em janeiro de 2019. Fabrício Queiroz, ex-assessor e motorista da família Bolsonaro, aparecia no relatório do Coaf com movimentações atípicas de R$ 1,2 milhão, incluindo depósitos em conta da esposa de Jair Bolsonaro. Queiroz foi preso em 2020 e o caso da rachadinha resultou em ação penal contra Flávio.',
      'verified', false, '2019-01-22',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2019/01/22/flavio-bolsonaro-queiroz-funcionario-exemplar-perseguicao.htm',
      'news_article',
      'Brasília', 'Congresso Nacional — declaração à imprensa',
      'flavio-bolsonaro-queiroz-funcionario-exemplar-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 5. Carlos Bolsonaro nega envolvimento em investigação de rachadinha (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro negou qualquer envolvimento no esquema de rachadinha investigado pelo Ministério Público do Rio de Janeiro.',
      'Não tenho absolutamente nada a ver com isso. Meu mandato é no Rio de Janeiro, é outro cargo. Estão usando meu nome para tentar atingir o presidente.',
      'Publicação no Twitter em março de 2020, após investigações do MP-RJ sobre a rachadinha no gabinete de Flávio Bolsonaro na Alerj passarem a mencionar possíveis conexões com a estrutura familiar. Carlos Bolsonaro vereador pelo Rio rejeitou qualquer vínculo com o caso, alegando se tratar de perseguição política.',
      'unverified', false, '2020-03-12',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2020/03/12/carlos-bolsonaro-nega-envolvimento-rachadinha-investigacao.htm',
      'news_article',
      'Rio de Janeiro', 'Twitter — declaração pública',
      'carlos-bolsonaro-nega-envolvimento-rachadinha-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 6. Ciro Gomes defende hegemonia da família Ferreira Gomes no Ceará como mérito (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes defendeu a longa hegemonia política de sua família no Ceará — com irmão governador, outro irmão prefeito e aliados em postos-chave — como resultado de mérito.',
      'O povo do Ceará escolhe livremente seus representantes. Se minha família tem prestígio político, é porque serviu bem ao Ceará. Isso se chama meritocracia, não nepotismo.',
      'Entrevista ao programa Roda Viva em março de 2022. O irmão Cid Gomes era senador, Ivo Gomes era prefeito de Sobral e aliados históricos da família ocupavam secretarias estaduais e empresas públicas. Críticos apontavam que a família Ferreira Gomes dominava a política cearense há mais de 30 anos de forma ininterrupta.',
      'verified', false, '2022-03-14',
      'https://veja.abril.com.br/politica/ciro-gomes-familia-ceara-meritocracia-nao-nepotismo-2022/',
      'news_article',
      'São Paulo', 'Roda Viva — TV Cultura',
      'ciro-familia-ferreira-gomes-ceara-meritocracia-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 7. Sarney nomeia familiares para cargos no Senado via atos secretos (2009)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sar,
      'Sarney nomeou parentes diretos, incluindo a filha Roseana, para cargos remunerados ligados ao Senado por meio de mais de 600 atos secretos.',
      'São decisões administrativas de minha competência como presidente do Senado. A Constituição me dá esse poder e eu o exerço dentro da lei.',
      'Declaração à imprensa em agosto de 2009, quando veio à tona que mais de 600 atos secretos do Senado criaram cargos e benefícios para parentes de senadores e servidores. Sarney nomeou familiares em cargos comissionados e permitiu que aliados utilizassem a estrutura institucional. O escândalo quase derrubou sua presidência da Casa.',
      'verified', true, '2009-08-04',
      'https://www.estadao.com.br/politica/sarney-nomeia-parentes-atos-secretos-senado-agosto-2009/',
      'news_article',
      'Brasília', 'Senado Federal — entrevista coletiva',
      'sarney-nomeia-familiares-atos-secretos-senado-2009'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 8. Renan Calheiros nomeia parentes para cargos no Senado (2009)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros foi identificado entre os senadores que se valeram dos atos secretos para nomear parentes em cargos comissionados do Senado Federal.',
      'Não fiz nada fora do que a prática do Senado permite. Se há irregularidades, que sejam investigadas. Mas não aceito ser julgado pela mídia.',
      'Declaração em setembro de 2009, durante a crise dos atos secretos que abalou o Senado. Investigações da CGU revelaram que Renan utilizou atos sigilosos para beneficiar aliados e parentes em cargos comissionados, práticas classificadas como potencialmente ilegais por violar a Súmula Vinculante nº 13 do STF sobre nepotismo.',
      'verified', false, '2009-09-10',
      'https://www.estadao.com.br/politica/renan-calheiros-atos-secretos-parentes-cargos-senado-2009/',
      'news_article',
      'Brasília', 'Senado Federal',
      'renan-nomeia-parentes-cargos-senado-atos-secretos-2009'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 9. Temer nomeia aliados para posições estratégicas apesar de investigações (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Temer manteve no governo ministros investigados pela Lava Jato, priorizando a sustentação política sobre a integridade institucional.',
      'Não vou demitir ministro porque a imprensa quer. Ministro só sai se for condenado por um tribunal. Investigação não é condenação.',
      'Declaração em junho de 2017, após O Globo revelar gravação em que Temer aparentemente endossava pagamentos a Eduardo Cunha. Vários ministros de sua equipe eram alvos de inquéritos no STF. Temer resistiu a pedidos de demissão e manteve a maioria dos investigados em cargos até o fim do mandato.',
      'verified', false, '2017-06-12',
      'https://www.valor.com.br/politica/4992183/temer-nao-vou-demitir-ministro-investigacao-nao-e-condenacao-2017',
      'news_article',
      'Brasília', 'Palácio do Planalto',
      'temer-nomeia-aliados-investigados-ministerios-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 10. Bolsonaro usa avião presidencial para viagem pessoal (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro utilizou aeronave da FAB para transportar familiares em viagem de cunho particular ao litoral de Santa Catarina.',
      'A aeronave presidencial está à disposição do presidente 24 horas por dia. Se eu precisar ir a qualquer lugar, é minha prerrogativa. Não vejo problema nenhum.',
      'Declaração à imprensa em novembro de 2019, após reportagem do UOL revelar que Bolsonaro utilizou aeronave da Força Aérea Brasileira para levar filhos e familiares em viagem particular ao litoral de Santa Catarina. A CGU abriu processo para apurar possível desvio de finalidade do bem público.',
      'verified', true, '2019-11-28',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2019/11/28/bolsonaro-uso-aeronave-fab-viagem-pessoal-familia-sc.htm',
      'news_article',
      'Brasília', 'Palácio da Alvorada — declaração à imprensa',
      'bolsonaro-aviao-presidencial-viagem-pessoal-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 11. Bolsonaro usa redes do governo federal para conteúdo de campanha (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro utilizou perfis oficiais do governo federal nas redes sociais para divulgar conteúdo eleitoral, mesclando patrimônio público com promoção pessoal de campanha.',
      'Não existe diferença entre o Bolsonaro presidente e o Bolsonaro candidato. O que faço no governo é minha própria campanha. O povo sabe distinguir.',
      'Declaração em live presidencial de agosto de 2022, meses antes do primeiro turno. O TSE identificou que perfis do Palácio do Planalto, Secom e ministérios publicaram conteúdo claramente eleitoral sem custeio de campanha, configurando uso indevido da máquina pública. O TCU multou a União por propaganda antecipada com recursos governamentais.',
      'verified', true, '2022-08-11',
      'https://www1.folha.uol.com.br/poder/2022/08/bolsonaro-usa-redes-oficiais-governo-campanha-eleitoral-tse.shtml',
      'news_article',
      'Brasília', 'Live presidencial — Palácio do Alvorada',
      'bolsonaro-redes-governo-federal-conteudo-campanha-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 12. Temer usa residência oficial para reuniões partidárias (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Temer realizou reuniões estratégicas do MDB e negociações eleitorais em instalações oficiais da Presidência, misturando agenda partidária com recursos públicos.',
      'A residência do presidente é também um espaço de trabalho político. Não tem como separar totalmente o mandato do partido que me elegeu.',
      'Reportagem do Estadão de setembro de 2017 revelou que Temer usou o Palácio do Jaburu e instalações oficiais para reuniões partidárias do MDB, incluindo planejamento de estratégias eleitorais. Assessores presidenciais remunerados pelo erário participaram das reuniões do partido.',
      'verified', false, '2017-09-07',
      'https://politica.estadao.com.br/noticias/geral/temer-usa-palacio-jaburu-reunioes-mdb-partido-recursos-publicos-2017',
      'news_article',
      'Brasília', 'Palácio do Jaburu',
      'temer-residencia-oficial-reunioes-partidarias-mdb-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 13. Sarney usa verbas públicas para reforma de imóvel particular (2010)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sar,
      'Sarney foi acusado de usar verbas de emendas parlamentares para reformar imóveis de propriedade particular de sua família no Maranhão.',
      'Minha casa é patrimônio histórico do Maranhão. Os recursos aplicados ali são investimentos em cultura e memória. Não há nada de irregular.',
      'Denúncia publicada pelo Estadão em março de 2010 revelando que recursos de emendas parlamentares de Sarney financiaram obras em imóveis pertencentes à família no Maranhão, incluindo fazenda São Francisco e propriedades em São Luís. O TCU instaurou tomada de contas especial para apurar desvio de finalidade.',
      'verified', false, '2010-03-15',
      'https://www.estadao.com.br/politica/sarney-usa-verba-publica-reforma-imovel-privado-maranhao-2010/',
      'news_article',
      'São Luís', 'Declaração à imprensa — Maranhão',
      'sarney-verbas-publicas-reforma-imovel-particular-2010'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 14. Romário vota a favor de aumento salarial logo após tomar posse (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário votou favoravelmente ao reajuste dos subsídios parlamentares logo após assumir o mandato de senador, contrariando seu discurso de combate aos privilégios políticos.',
      'Não votei para me beneficiar. Votei porque é uma correção necessária. O parlamentar também tem família para sustentar e responsabilidades que exigem recursos.',
      'Declaração após a votação no Senado em fevereiro de 2015. Romário havia assumido o mandato dias antes, eleito pelo PSB. Em seguida votou pelo reajuste dos subsídios parlamentares de R$ 24,5 mil para R$ 33,7 mil. O voto destoava abertamente de seu discurso de candidato contra os privilégios da classe política.',
      'verified', false, '2015-02-25',
      'https://oglobo.globo.com/brasil/romario-vota-reajuste-salario-parlamentar-dias-apos-posse-senado-2015/',
      'news_article',
      'Brasília', 'Senado Federal — plenário',
      'romario-vota-aumento-salarial-apos-posse-senado-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 15. Arthur Lira distribui emendas parlamentares secretas a aliados (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira defendeu as emendas do relator — o chamado orçamento secreto — como instrumento legítimo, ignorando a falta de transparência e a concentração de recursos em aliados.',
      'As emendas do relator são um instrumento constitucional. Cada parlamentar indica projetos para sua base. Isso não é segredo, é democracia funcionando.',
      'Declaração em entrevista à CNN Brasil em outubro de 2021. O orçamento secreto distribuiu R$ 16,7 bilhões sem identificação dos autores, sem critérios técnicos públicos e concentrando recursos em aliados do centrão. O STF suspendeu o mecanismo em 2022 por considerá-lo inconstitucional por falta de transparência.',
      'verified', true, '2021-10-19',
      'https://www.cnnbrasil.com.br/politica/lira-defende-orcamento-secreto-emendas-relator-democracia-2021/',
      'news_article',
      'Brasília', 'Entrevista CNN Brasil',
      'lira-emendas-secretas-aliados-orcamento-secreto-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 16. Rodrigo Pacheco defende gastos do Senado com itens de luxo (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pac,
      'Rodrigo Pacheco defendeu gastos do Senado com vinhos importados, utensílios de prata e reformas custosas como necessários à dignidade institucional.',
      'O Senado Federal é a mais alta casa legislativa do país. Recebe chefes de Estado e embaixadores. Os gastos condizem com a dignidade da instituição.',
      'Declaração em coletiva de imprensa em agosto de 2022, após o portal Metrópoles revelar compras do Senado incluindo vinhos importados de até R$ 900 a garrafa e utensílios de prata para eventos. Pacheco minimizou as críticas afirmando que as despesas eram necessárias à representação institucional.',
      'verified', false, '2022-08-30',
      'https://www.metropoles.com/brasil/politica-br/pacheco-defende-gastos-senado-vinhos-luxo-dignidade-institucional-2022',
      'news_article',
      'Brasília', 'Senado Federal — entrevista coletiva',
      'pacheco-gastos-senado-itens-luxo-dignidade-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 17. Dilma usa telefones oficiais para ligar para aliados do partido (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff utilizou linhas telefônicas oficiais da Presidência para realizar articulações político-partidárias durante período eleitoral.',
      'Falar com aliados é parte do trabalho de qualquer presidente. Não existe separação absoluta entre governar e política. Isso é a democracia funcionando.',
      'Declaração durante entrevista à Rádio CBN em setembro de 2014, meses antes do segundo turno. Reportagem do Correio Braziliense revelou que Dilma realizava ligações para lideranças do PT e candidatos aliados usando linhas da Presidência da República custeadas pelo erário, em claro uso da estrutura pública para fins eleitorais.',
      'verified', false, '2014-09-17',
      'https://www.correiobraziliense.com.br/politica/2014/09/dilma-usa-telefones-presidencia-articulacoes-partidarias.html',
      'news_article',
      'Brasília', 'Entrevista Rádio CBN',
      'dilma-telefones-oficiais-aliados-partido-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 18. Moro aceita ministério do homem que condenou — conflito de interesses (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro aceitou o cargo de ministro da Justiça no governo de Bolsonaro, mesmo tendo sido o juiz que condenou Lula e conduzido processos ligados à eleição de 2018.',
      'Aceitei o convite do presidente eleito para contribuir com o combate à corrupção no Ministério da Justiça. É uma oportunidade de aprofundar as reformas que o país precisa.',
      'Declaração em novembro de 2018, ao aceitar o convite de Bolsonaro para ser ministro da Justiça. O Intercept Brasil revelaria em 2019, pelo caso Vaza Jato, que Moro havia orientado o procurador Deltan Dallagnol durante a Lava Jato, levantando dúvidas sobre sua imparcialidade. O STF decidiu em 2021 que Moro agiu com parcialidade nas condenações de Lula.',
      'verified', true, '2018-11-01',
      'https://www1.folha.uol.com.br/poder/2018/11/sergio-moro-aceita-ministerio-justica-bolsonaro-conflito-interesses.shtml',
      'news_article',
      'Curitiba', 'Coletiva de imprensa',
      'moro-ministerio-bolsonaro-conflito-interesses-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 19. Tereza Cristina: marido beneficia-se da desregulação do agro que ela promoveu (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina promoveu desregulamentações no setor agropecuário como ministra que beneficiaram diretamente negócios do marido e de sócios.',
      'Sou ministra da Agricultura porque entendo do agronegócio. Tenho propriedades rurais, sim. Isso me qualifica, não me desqualifica para o cargo.',
      'Declaração em audiência na Câmara em junho de 2019. O marido de Tereza Cristina, Antônio José Saraiva Leão, é sócio em fazendas de soja e gado no Mato Grosso do Sul. Parlamentares da oposição arguiram conflito de interesses ao TCU, apontando que portarias assinadas por ela ampliavam a permissão de agrotóxicos e reduziam exigências ambientais que beneficiavam fazendas do perfil das da família.',
      'verified', false, '2019-06-18',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2019-06/tereza-cristina-marido-agronegocio-conflito-interesses-ministerio',
      'news_article',
      'Brasília', 'Câmara dos Deputados — audiência pública',
      'tereza-cristina-marido-desregulacao-agro-conflito-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 20. Haddad: contribuições do PT ligadas a decisões de política econômica (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad foi questionado sobre possível relação entre contribuições de setores econômicos ao PT e decisões de desoneração fiscal do Ministério da Fazenda.',
      'O PT recebe contribuições legais, dentro das regras eleitorais. Minhas decisões são técnicas e visam o bem do país. Não existe relação entre doação e política pública.',
      'Declaração em entrevista ao jornal O Globo em setembro de 2023. Reportagem mapeou que setores contemplados com desonerações tributárias pelo Ministério da Fazenda haviam aumentado contribuições ao PT e a partidos da base do governo no ciclo eleitoral anterior. Haddad negou qualquer relação, mas o caso alimentou debates sobre transparência nas decisões fiscais.',
      'unverified', false, '2023-09-14',
      'https://oglobo.globo.com/economia/haddad-pt-contribuicoes-desoneracao-fiscal-decisao-politica-2023/',
      'news_article',
      'Brasília', 'Entrevista O Globo',
      'haddad-pt-contribuicoes-decisoes-politica-economica-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 21. Gleisi usou recursos do partido para despesas pessoais (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann foi investigada pelo Ministério Público por suspeita de uso de recursos partidários para cobrir despesas pessoais sem prestação de contas adequada.',
      'Todas as despesas do meu mandato e da minha vida pessoal são custeadas com recursos lícitos. Jamais misturei recursos do partido com uso pessoal.',
      'Declaração à imprensa em outubro de 2013, após reportagem do Estadão revelar que despesas de Gleisi Hoffmann, então ministra da Casa Civil, foram parcialmente cobertas por recursos do PT sem a devida prestação de contas. O caso integrava inquérito mais amplo sobre o petrolão e as relações entre PT e Petrobras.',
      'unverified', false, '2013-10-22',
      'https://politica.estadao.com.br/noticias/geral/gleisi-hoffmann-recursos-pt-despesas-pessoais-investigacao-2013',
      'news_article',
      'Brasília', 'Declaração à imprensa',
      'gleisi-recursos-partido-despesas-pessoais-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 22. Tarcísio: contratos do estado de SP beneficiam aliados políticos (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas foi questionado sobre concentração de contratos públicos do governo de São Paulo em empresas ligadas a aliados e financiadores de campanha.',
      'Nossos contratos seguem todos os processos de licitação previstos em lei. O governo de São Paulo é transparente. Quem ganha é quem tem melhor proposta técnica.',
      'Declaração em coletiva de imprensa em março de 2024, após levantamento da Agência Pública mostrar que empresas de setores de infraestrutura, tecnologia e saúde que financiaram a campanha de Tarcísio em 2022 receberam proporcionalmente mais contratos estaduais em 2023. O governo negou qualquer irregularidade e afirmou que todos os contratos passaram por processo licitatório.',
      'unverified', false, '2024-03-19',
      'https://apublica.org/2024/03/contratos-sp-tarcisio-aliados-financiadores-campanha/',
      'news_article',
      'São Paulo', 'Palácio dos Bandeirantes — entrevista coletiva',
      'tarcisio-contratos-sp-aliados-politicos-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 23. Valdemar Costa Neto confessa esquema de caixa dois para campanha (2007)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_val,
      'Valdemar Costa Neto admitiu ter recebido recursos não declarados do esquema do mensalão para financiar campanhas do PL, configurando caixa dois eleitoral.',
      'Reconheço que cometi erros. Havia dinheiro que não passou pelos canais formais. Fiz isso por ingenuidade política e pagarei as consequências perante a Justiça.',
      'Declaração ao STF durante depoimento no processo do mensalão em 2007. Valdemar Costa Neto, então presidente do PL, admitiu ter recebido recursos do esquema para distribuir a candidatos do partido. Foi condenado pelo STF a 7 anos e 10 meses por lavagem de dinheiro e corrupção passiva, cumpriu pena em regime semiaberto e foi indultado. Posteriormente tornou-se presidente do PL e aliado de Bolsonaro.',
      'verified', true, '2007-08-14',
      'https://www.estadao.com.br/politica/valdemar-costa-neto-confessa-caixa-dois-mensalao-pl-2007/',
      'news_article',
      'Brasília', 'Supremo Tribunal Federal — depoimento',
      'valdemar-confessa-caixa-dois-campanha-mensalao-2007'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 24. Maluf volta à política após múltiplas condenações por corrupção (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mal,
      'Paulo Maluf retornou ao mandato de deputado federal em 2014 mesmo com condenações internacionais por lavagem de dinheiro e ordem de prisão da Interpol.',
      'O povo me elegeu. Isso é o que importa. Processo judicial é processo judicial. Sou deputado federal e vou exercer meu mandato com toda a dignidade.',
      'Declaração após tomar posse como deputado federal pelo PP em fevereiro de 2015, eleito para seu oitavo mandato. Maluf tinha condenação por lavagem de dinheiro reconhecida pelo STJ e constava na lista de difusão vermelha da Interpol por conta de condenação em Paris. Foi preso em 2017 por ordem do ministro Edson Fachin, do STF.',
      'verified', true, '2015-02-02',
      'https://www1.folha.uol.com.br/poder/2015/02/maluf-toma-posse-deputado-federal-condenacoes-interpol-2015.shtml',
      'news_article',
      'Brasília', 'Câmara dos Deputados — cerimônia de posse',
      'maluf-volta-politica-condenacoes-impunidade-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 25. Bolsonaro reivindica imunidade presidencial cobrindo todos os atos (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro sustentou que a imunidade constitucional do presidente cobriria todos os seus atos enquanto no cargo, incluindo declarações e decisões questionadas pela Justiça.',
      'O presidente da República tem imunidade. Está na Constituição. Não posso ser processado por nada que faça no exercício do meu mandato. Isso é a lei.',
      'Declaração durante live em outubro de 2022, às vésperas do segundo turno. Bolsonaro interpretou de forma ampliada o artigo 86 da Constituição, que concede imunidade apenas para infrações penais comuns durante o mandato e não para atos de improbidade administrativa ou crimes de responsabilidade. Juristas criticaram a interpretação como equivocada e autoexculpatória.',
      'verified', false, '2022-10-20',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2022/10/20/bolsonaro-afirma-imunidade-presidencial-cobre-todos-atos-live.htm',
      'news_article',
      'Brasília', 'Live presidencial',
      'bolsonaro-reivindica-imunidade-presidencial-todos-atos-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 26. Roberto Jefferson faz ameaças enquanto em prisão domiciliar (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jef,
      'Roberto Jefferson, cumprindo prisão domiciliar por ordem do STF, continuou publicando ameaças a ministros e instituições nas redes sociais, desrespeitando as condições da medida.',
      'Estou preso em casa mas não vou me calar. Vou continuar falando a verdade. Quem tem medo de Roberto Jefferson que me prenda de verdade. Não me intimidam.',
      'Postagem no Telegram em julho de 2022, quando Jefferson cumpria prisão domiciliar determinada pelo ministro Alexandre de Moraes por ameaças a ministros do STF. Jefferson continuou publicando conteúdo inflamatório. Em outubro de 2022 resistiu à recaptura com granadas e disparos de fuzil contra agentes da PF.',
      'verified', true, '2022-07-14',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2022/07/14/jefferson-prisao-domiciliar-ameacas-telegram-stf-ministros.htm',
      'news_article',
      'Rio de Janeiro', 'Telegram — publicação pública',
      'jefferson-ameacas-prisao-domiciliar-stf-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 27. Renan Calheiros: nunca condenado apesar de múltiplas investigações (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros minimizou o histórico de investigações que o atingem há décadas, atribuindo a ausência de condenação à sua inocência e não ao sistema de impunidade.',
      'Fui investigado várias vezes. Nunca fui condenado por nada. Se houvesse prova, eu estaria preso. A verdade é que sou inocente e meus inimigos políticos sabem disso.',
      'Entrevista ao jornal O Globo em fevereiro de 2020. Renan Calheiros acumula mais de 30 anos de investigações, incluindo o caso do lobista que pagava pensão alimentícia de sua filha (2007), o mensalão, a Lava Jato e casos de nepotismo. Beneficiou-se de foros privilegiados, prescrições e arquivamentos. Críticos apontam sua trajetória como exemplo do sistema de impunidade para políticos com mandato.',
      'verified', false, '2020-02-18',
      'https://oglobo.globo.com/brasil/renan-calheiros-nunca-fui-condenado-sou-inocente-investigacoes-2020/',
      'news_article',
      'Brasília', 'Entrevista O Globo',
      'renan-nunca-condenado-multiplas-investigacoes-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 28. Lula: "nunca fiz nada errado" desconsiderando processos e condenações (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Mesmo com histórico de condenações na Lava Jato posteriormente anuladas, Lula reiterou que jamais fez nada errado em sua vida pública, ignorando a complexidade do seu histórico judicial.',
      'Nunca fiz nada errado na minha vida. Tudo que fizeram contra mim foi perseguição política. Sou um homem limpo, e o povo brasileiro sabe disso.',
      'Declaração em discurso para militantes do PT em março de 2023, já de volta à presidência. Embora o STF tenha anulado as condenações da Lava Jato por parcialidade de Moro, não houve absolvição no mérito. Críticos apontam que a declaração é desinformativa ao desconsiderar a existência e o conteúdo dos processos.',
      'verified', false, '2023-03-10',
      'https://www1.folha.uol.com.br/poder/2023/03/lula-nunca-fiz-nada-errado-vida-publica-discurso-pt.shtml',
      'news_article',
      'São Paulo', 'Evento do PT — São Paulo',
      'lula-nunca-fiz-nada-errado-condenacoes-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 29. Mourão: "nunca participei de nenhuma decisão irregular no governo" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão afirmou que nunca participou de decisão irregular durante o governo Bolsonaro, apesar de ter integrado reuniões posteriormente investigadas pelo STF.',
      'Nunca participei de nenhuma decisão irregular no governo. Sempre cumpri meu papel como vice-presidente dentro das normas constitucionais. Não fiz nada que deva me envergonhar.',
      'Declaração em entrevista à Folha de S.Paulo em fevereiro de 2023. Mourão havia participado de reuniões do governo Bolsonaro investigadas pela PGR, incluindo encontros sobre o uso das Forças Armadas e o questionamento das urnas eletrônicas. Seu distanciamento estratégico de Bolsonaro após a eleição foi interpretado por analistas como tentativa de se dissociar das investigações em curso.',
      'unverified', false, '2023-02-28',
      'https://www1.folha.uol.com.br/poder/2023/02/mourao-nunca-participei-decisao-irregular-governo-bolsonaro.shtml',
      'news_article',
      'Brasília', 'Entrevista Folha de S.Paulo',
      'mourao-nunca-participei-decisao-irregular-governo-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Gleisi defende Lula mesmo após STF reconhecer parcialidade de Moro — desinformação sobre inocência total (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirmou que a decisão do STF sobre a parcialidade de Moro provou a inocência absoluta de Lula, indo além do que o julgamento de fato determinou.',
      'O STF provou que Lula é inocente. Ele nunca cometeu nenhum crime. Moro fabricou tudo. Lula é o maior estadista da história do Brasil e foi perseguido por inveja e ódio político.',
      'Declaração em coletiva de imprensa em março de 2021, após o STF reconhecer a parcialidade de Sergio Moro e anular as condenações de Lula na Lava Jato. O STF não declarou Lula inocente no mérito — apenas reconheceu que Moro não era juiz imparcial, determinando a devolução dos direitos políticos sem absolvição pelo fundo das acusações. Especialistas em direito apontaram que Gleisi distorcia o conteúdo da decisão.',
      'verified', false, '2021-03-08',
      'https://www.estadao.com.br/politica/gleisi-hoffmann-stf-provou-inocencia-lula-moro-parcialidade-2021/',
      'news_article',
      'Brasília', 'Coletiva de imprensa — PT',
      'gleisi-stf-provou-inocencia-lula-desinformacao-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
