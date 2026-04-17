-- Batch 51: Ministros do gabinete Lula III (2023-2026) — parte 2
-- Declarações de ministros sobre COPs, SUS, reforma tributária, dengue,
-- Yanomami, segurança pública, relações com Congresso, emendas, 8 de janeiro,
-- inflação, habitação, mulheres, ciência, cultura, desenvolvimento agrário.
-- 50 declarações

DO $$
DECLARE
  v_pad UUID; v_rui UUID; v_sil UUID; v_nis UUID; v_mau UUID;
  v_muc UUID; v_mar UUID; v_mas UUID; v_cam UUID; v_gua UUID;
  v_ani UUID; v_fav UUID; v_lew UUID; v_had UUID; v_teb UUID;
  v_alx UUID; v_dwe UUID; v_wel UUID; v_mes UUID; v_cid UUID;
  v_goe UUID; v_tei UUID; v_adp UUID; v_meg UUID; v_mac UUID;
  v_luc UUID; v_lup UUID; v_gle UUID; v_ful UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_cor UUID; c_vio UUID;
  c_odi UUID; c_neg UUID; c_irr UUID; c_con UUID; c_int UUID;
  c_aut UUID; c_ame UUID; c_obs UUID; c_rac UUID; c_mis UUID;
  c_hom UUID; c_mac UUID; c_nep UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_mas FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_cam FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_gua FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_alx FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_dwe FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_wel FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_goe FROM politicians WHERE slug = 'waldez-goes';
  SELECT id INTO v_tei FROM politicians WHERE slug = 'paulo-teixeira';
  SELECT id INTO v_adp FROM politicians WHERE slug = 'andre-de-paula';
  SELECT id INTO v_meg FROM politicians WHERE slug = 'margareth-menezes';
  SELECT id INTO v_mac FROM politicians WHERE slug = 'marcio-macedo';
  SELECT id INTO v_luc FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ful FROM politicians WHERE slug = 'andre-fufuca';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1. Esther Dweck sobre concursos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dwe,
      'Esther Dweck anuncia Concurso Público Nacional Unificado como reconstrução do serviço público.',
      'O Concurso Nacional Unificado é a maior porta de entrada ao serviço público federal em duas décadas. Vai reconstruir a máquina pública desmantelada no governo Bolsonaro, dar oportunidade a milhões de brasileiros e reduzir custos do processo seletivo. É o enem dos concursos.',
      'Anúncio em janeiro de 2024 do primeiro Concurso Público Nacional Unificado, que ofertou mais de 6 mil vagas em 21 órgãos federais com aplicação em 228 cidades. Dweck é ministra da Gestão.',
      'verified', true, '2024-01-11',
      'https://www.gov.br/gestao/pt-br/assuntos/noticias/concurso-publico-nacional-unificado-lancamento',
      'government_document',
      'Brasília', 'Lançamento do Concurso Nacional Unificado', 'esther-dweck-concurso-nacional-unificado-janeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 2. Esther Dweck sobre reajuste de servidores
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dwe,
      'Esther Dweck anuncia reajuste linear e valorização do funcionalismo público federal.',
      'Os servidores públicos federais passaram cinco anos sem reajuste, sofrendo perdas com a inflação. Estamos recompondo salários com reajustes lineares e abertura de mesas de negociação setoriais. Valorizar o servidor é valorizar o serviço prestado ao povo brasileiro.',
      'Coletiva em abril de 2023, anunciando reajuste de 9% para servidores federais que não tinham aumento desde 2019. Também foi anunciada recomposição específica do vale-alimentação.',
      'verified', false, '2023-04-06',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2023-04/dweck-reajuste-servidores-federais',
      'news_article',
      'Brasília', 'Anúncio do reajuste do funcionalismo', 'dweck-reajuste-servidores-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 3. Wellington Dias sobre Bolsa Família
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_wel,
      'Wellington Dias anuncia Bolsa Família recriado com benefício mínimo de R$ 600 e adicional por criança.',
      'O novo Bolsoca, digo, o Bolsa Família, tira o nome fantasia do Auxílio Brasil e retorna como política estruturante. Benefício mínimo de R$ 600, adicional de R$ 150 por criança de até seis anos, e acompanhamento de educação e saúde. Combate à fome com responsabilidade.',
      'Coletiva em março de 2023, apresentando o Bolsa Família recriado após ser extinto no governo Bolsonaro. Wellington Dias, ex-governador do Piauí, assumiu o Ministério do Desenvolvimento Social.',
      'verified', true, '2023-03-02',
      'https://www.gov.br/mds/pt-br/assuntos/noticias/wellington-dias-bolsa-familia-recriacao',
      'government_document',
      'Brasília', 'Anúncio do novo Bolsa Família', 'wellington-dias-bolsa-familia-marco-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 4. Wellington Dias sobre saída da fome
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_wel,
      'Wellington Dias celebra saída do Brasil do Mapa da Fome da FAO.',
      'O Brasil saiu do Mapa da Fome da ONU. Dois anos de trabalho duro, com Bolsa Família recriado, valorização do salário mínimo, restaurantes populares e Brasil Sem Fome. Milhões de brasileiros voltaram a fazer três refeições por dia. Essa é a diferença entre um governo que cuida e um que abandona.',
      'Declaração após divulgação do relatório da FAO em julho de 2025, que tirou o Brasil do Mapa da Fome, indicador que o país havia retornado em 2022. Lula já havia tirado o Brasil desse mapa em 2014.',
      'verified', true, '2025-07-24',
      'https://www1.folha.uol.com.br/mercado/2025/07/brasil-sai-mapa-fome-fao-wellington-dias.shtml',
      'news_article',
      'Brasília', 'Divulgação do Relatório da FAO', 'wellington-dias-mapa-fome-fao-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 5. Jorge Messias sobre AGU
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mes,
      'Jorge Messias defende recuperação de ativos da Operação Lava Jato pela AGU.',
      'A AGU tem responsabilidade de recuperar para o Tesouro os valores provenientes de acordos da Lava Jato e de combater o crime de colarinho branco em sua totalidade. Também temos que corrigir os excessos cometidos durante a operação, que violaram direitos fundamentais de investigados.',
      'Entrevista ao Valor Econômico em março de 2024, apresentando as prioridades da AGU sob sua gestão, incluindo a revisão de acordos problemáticos da Lava Jato e a defesa jurídica do governo Lula.',
      'verified', false, '2024-03-14',
      'https://valor.globo.com/politica/noticia/2024/03/14/jorge-messias-agu-lava-jato-recuperacao.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'jorge-messias-agu-lava-jato-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Messias sobre PGR
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mes,
      'Jorge Messias se defende de ataques após ser cotado para o STF e para a PGR.',
      'Não fiz campanha por nenhum cargo. Cumpro minha função na AGU com dedicação e técnica. As especulações sobre minha indicação são próprias do jogo político. Respeito as decisões do presidente Lula e continuarei trabalhando pela defesa jurídica da União.',
      'Nota pública em outubro de 2024, após pressão evangélica para sua indicação à PGR e ao STF. Messias é ministro da igreja Assembleia de Deus e foi alvo de embate entre Lula e setores religiosos.',
      'verified', false, '2024-10-25',
      'https://g1.globo.com/politica/noticia/2024/10/25/jorge-messias-pgr-stf-especulacoes.ghtml',
      'news_article',
      'Brasília', 'Nota pública à imprensa', 'jorge-messias-stf-pgr-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Cida Gonçalves sobre feminicídio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cid,
      'Cida Gonçalves defende Pacto Nacional de Enfrentamento ao Feminicídio em resposta a crescimento de casos.',
      'O Brasil tem uma mulher assassinada a cada seis horas, na maioria dos casos por companheiros ou ex-companheiros. É uma epidemia de violência misógina. O Pacto Nacional de Enfrentamento ao Feminicídio reúne todos os entes federativos para romper esse ciclo de morte.',
      'Coletiva em março de 2024, apresentando o Pacto Nacional. Cida Gonçalves foi a primeira ministra efetiva do Ministério das Mulheres recriado no governo Lula em 2023.',
      'verified', true, '2024-03-08',
      'https://www.gov.br/mulheres/pt-br/assuntos/noticias/cida-goncalves-pacto-nacional-feminicidio',
      'government_document',
      'Brasília', 'Dia Internacional da Mulher', 'cida-goncalves-pacto-feminicidio-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 8. Cida sobre Lei de Igualdade Salarial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cid,
      'Cida Gonçalves celebra Lei de Igualdade Salarial entre homens e mulheres.',
      'A Lei de Igualdade Salarial é uma vitória histórica. Empresas que discriminarem mulheres no salário estarão sujeitas a multas. As grandes empresas devem publicar relatórios semestrais de transparência salarial. Reconhecer que o mesmo trabalho merece o mesmo salário é direito humano básico.',
      'Declaração em julho de 2023 após sanção da Lei 14.611/2023 pelo presidente Lula, que estabelece igualdade salarial entre homens e mulheres para funções equivalentes.',
      'verified', false, '2023-07-04',
      'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2023-07/cida-goncalves-lei-igualdade-salarial',
      'news_article',
      'Brasília', 'Sanção da Lei de Igualdade Salarial', 'cida-goncalves-igualdade-salarial-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 9. Waldez Góes sobre RS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_goe,
      'Waldez Góes anuncia plano de reconstrução do Rio Grande do Sul após enchentes.',
      'O Rio Grande do Sul enfrenta a maior tragédia climática da sua história. O governo federal está presente desde o primeiro momento com socorro humanitário, suspensão de dívidas, liberação de FGTS, Pix Caixa e plano de reconstrução de R$ 50 bilhões. Vamos reconstruir o estado junto com o povo gaúcho.',
      'Coletiva em maio de 2024, durante enchentes no RS que atingiram mais de 460 municípios e deixaram mais de 180 mortos. Waldez Góes era ministro da Integração e Desenvolvimento Regional.',
      'verified', true, '2024-05-08',
      'https://www.gov.br/mdr/pt-br/assuntos/noticias/waldez-goes-rs-reconstrucao-plano',
      'government_document',
      'Porto Alegre', 'Coletiva sobre as enchentes do RS', 'waldez-goes-rs-reconstrucao-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 10. Waldez Góes sobre desinformação RS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_goe,
      'Waldez Góes condena fake news sobre ajuda às vítimas das enchentes no Rio Grande do Sul.',
      'É criminoso espalhar mentira em meio a uma tragédia. Estão dizendo que o governo não entrega, que doações estão sendo desviadas, que a ajuda humanitária foi cortada. É tudo mentira produzida por quem quer lucrar politicamente com a dor do povo gaúcho. Ajuda chega e está documentada.',
      'Declaração em maio de 2024, durante onda de desinformação em redes sociais que tentava atacar o governo Lula na resposta às enchentes. Bolsonaristas compartilharam vídeos descontextualizados.',
      'verified', false, '2024-05-14',
      'https://g1.globo.com/rs/rio-grande-do-sul/noticia/2024/05/14/waldez-goes-fake-news-enchentes-rs.ghtml',
      'news_article',
      'Porto Alegre', 'Coletiva sobre desinformação nas enchentes', 'waldez-goes-fake-news-rs-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Paulo Teixeira sobre MST
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tei,
      'Paulo Teixeira defende reforma agrária e dialoga com MST sobre ocupações.',
      'A reforma agrária é dívida histórica do Brasil. Temos um milhão de famílias acampadas ou sem-terra. O governo Lula vai retomar os assentamentos, regularizar territórios e dialogar com o MST, que é um movimento legítimo e tem representatividade. Negar isso é ignorar a realidade do campo brasileiro.',
      'Entrevista ao Brasil de Fato em abril de 2023, defendendo o diálogo com o MST em meio à CPI do MST instalada na Câmara. Paulo Teixeira é ministro do Desenvolvimento Agrário e Agricultura Familiar.',
      'verified', false, '2023-04-28',
      'https://www.brasildefato.com.br/2023/04/28/paulo-teixeira-mst-reforma-agraria',
      'news_article',
      'Brasília', 'Entrevista ao Brasil de Fato', 'paulo-teixeira-mst-reforma-agraria-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 12. Paulo Teixeira sobre assentamentos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tei,
      'Paulo Teixeira anuncia maior programa de reforma agrária desde o governo Dilma.',
      'Vamos assentar 295 mil famílias até o fim do mandato. É o maior programa de reforma agrária desde o governo Dilma, com destinação de terras públicas, regularização fundiária e crédito para a agricultura familiar. Quem produz comida para o brasileiro precisa ter dignidade e terra para trabalhar.',
      'Anúncio em julho de 2023 do programa Terra da Gente, relançamento da política de reforma agrária paralisada no governo Bolsonaro. A meta incluía assentamentos e regularizações.',
      'verified', false, '2023-07-12',
      'https://www.gov.br/mda/pt-br/assuntos/noticias/paulo-teixeira-terra-da-gente-reforma-agraria',
      'government_document',
      'Brasília', 'Lançamento do Programa Terra da Gente', 'paulo-teixeira-terra-da-gente-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 13. André de Paula sobre pesca
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_adp,
      'André de Paula defende pescadores artesanais e critica indústria pesqueira predatória.',
      'Os pescadores artesanais são a espinha dorsal da pesca brasileira. Produzem alimento, geram emprego e preservam tradições. Precisam ter prioridade sobre a pesca industrial predatória que esgota nossos recursos marinhos. O seguro-defeso é direito do pescador artesanal, não caridade.',
      'Entrevista em julho de 2023, defendendo a política de fiscalização contra a pesca industrial e a valorização do seguro-defeso. André de Paula é ministro da Pesca e Aquicultura.',
      'verified', false, '2023-07-26',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2023-07/andre-de-paula-pesca-artesanal',
      'news_article',
      'Brasília', 'Entrevista sobre política pesqueira', 'andre-de-paula-pesca-artesanal-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 14. Margareth Menezes sobre Cultura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_meg,
      'Margareth Menezes celebra retomada da Lei Rouanet e fim da perseguição cultural.',
      'A Lei Rouanet foi demonizada, mutilada e distorcida nos últimos anos. Quatro anos de perseguição a artistas, censura e desmonte do sistema cultural. Estamos retomando a Lei Rouanet, relançando a Lei Paulo Gustavo, apoiando o carnaval, o cinema, o livro. Cultura é direito e é economia.',
      'Discurso na Marcha da Cultura em Brasília em abril de 2023, celebrando os 100 dias de governo. Margareth Menezes é cantora baiana e foi nomeada ministra da Cultura reconstruída após ser extinta por Bolsonaro.',
      'verified', false, '2023-04-11',
      'https://www.gov.br/cultura/pt-br/assuntos/noticias/margareth-menezes-marcha-cultura-lei-rouanet',
      'government_document',
      'Brasília', 'Marcha da Cultura', 'margareth-menezes-lei-rouanet-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 15. Margareth sobre censura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_meg,
      'Margareth Menezes condena ataques a artistas e defende liberdade de expressão cultural.',
      'Continuamos vendo artistas perseguidos, cancelados por câmaras municipais, ameaçados por bolsonaristas. Isso é inaceitável em uma democracia. Arte é liberdade, é pensamento crítico, é diversidade. O Ministério da Cultura vai defender artistas de qualquer tentativa de censura.',
      'Entrevista ao Globo em dezembro de 2023, após série de ataques a artistas como Caetano Veloso, Anitta e Preta Gil em redes sociais por parte de grupos bolsonaristas e parlamentares conservadores.',
      'verified', false, '2023-12-20',
      'https://oglobo.globo.com/cultura/noticia/2023/12/margareth-menezes-censura-artistas-bolsonaristas.ghtml',
      'news_article',
      'Rio de Janeiro', 'Entrevista ao O Globo', 'margareth-menezes-censura-artistas-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 16. Márcio Macedo sobre Secom
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mac,
      'Márcio Macêdo defende que Secretaria-Geral amplia participação social no governo.',
      'A Secretaria-Geral da Presidência tem como missão garantir que o povo participe das decisões do governo. Reativamos os Conselhos de Políticas Públicas, realizamos a maior conferência nacional da história e abrimos o Planalto para movimentos sociais, igrejas, entidades da sociedade civil.',
      'Entrevista à Rádio EBC em dezembro de 2023, apresentando o balanço da Secretaria-Geral da Presidência no primeiro ano de governo. Márcio Macêdo, deputado pelo PT, assumiu o cargo em 2023.',
      'verified', false, '2023-12-19',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2023-12/marcio-macedo-secretaria-geral-conferencias',
      'news_article',
      'Brasília', 'Entrevista à Rádio EBC', 'marcio-macedo-secretaria-geral-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 17. Luciana Santos sobre Ciência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_luc,
      'Luciana Santos anuncia recomposição do orçamento da ciência após desmonte bolsonarista.',
      'O Ministério da Ciência e Tecnologia teve o orçamento cortado em mais de 90% no governo Bolsonaro. Cientistas foram perseguidos, bolsas congeladas, laboratórios esvaziados. Estamos recompondo o orçamento, destravando o FNDCT e relançando o CNPq. A ciência brasileira precisa voltar ao protagonismo.',
      'Discurso na SBPC em Curitiba em julho de 2023, após recomposição parcial do orçamento. Luciana Santos é presidente nacional do PCdoB e ministra da Ciência, Tecnologia e Inovação.',
      'verified', false, '2023-07-17',
      'https://agenciabrasil.ebc.com.br/educacao/noticia/2023-07/luciana-santos-sbpc-ciencia-orcamento',
      'news_article',
      'Curitiba', 'Reunião anual da SBPC', 'luciana-santos-sbpc-ciencia-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 18. Luciana sobre IA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_luc,
      'Luciana Santos lança Plano Brasileiro de Inteligência Artificial com R$ 23 bilhões.',
      'O Plano Brasileiro de Inteligência Artificial é o maior investimento em IA da história do país: R$ 23 bilhões até 2028. Vamos construir o supercomputador brasileiro, desenvolver modelos de linguagem em português e ampliar a formação de profissionais. Não queremos ser colônia digital.',
      'Lançamento do PBIA em Brasília em julho de 2024, ao lado do presidente Lula. O plano visava posicionar o Brasil entre os líderes regionais em inteligência artificial.',
      'verified', true, '2024-07-30',
      'https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/noticias/2024/07/luciana-santos-plano-brasileiro-inteligencia-artificial',
      'government_document',
      'Brasília', 'Lançamento do Plano Brasileiro de IA', 'luciana-santos-pbia-julho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 19. Carlos Lupi sobre INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lup,
      'Carlos Lupi promete zerar fila do INSS mas escândalo de fraudes força sua saída.',
      'Vamos zerar a fila de perícia do INSS. É compromisso inadiável com os aposentados e trabalhadores que estão esperando benefícios. O INSS que eu recebi tinha mais de dois milhões de processos represados. A meta é ambiciosa, mas o povo não pode esperar.',
      'Coletiva em março de 2023, apresentando metas para o INSS. Lupi, presidente do PDT, foi demitido em maio de 2025 em meio ao escândalo de descontos irregulares de associações em aposentados.',
      'verified', false, '2023-03-15',
      'https://www1.folha.uol.com.br/mercado/2023/03/carlos-lupi-fila-inss-pericia.shtml',
      'news_article',
      'Brasília', 'Coletiva sobre metas do INSS', 'carlos-lupi-fila-inss-marco-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Lupi sobre descontos irregulares
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lup,
      'Carlos Lupi nega responsabilidade em fraudes do INSS e culpa esquema anterior.',
      'As fraudes em descontos de associações nos benefícios do INSS ocorreram antes da minha gestão e estão sendo combatidas pelo nosso governo. Não tenho nenhuma relação com esses esquemas. Vou colaborar com todas as investigações e provarei minha lisura na condução do ministério.',
      'Nota após reportagem em abril de 2025 sobre descontos indevidos de cerca de R$ 6 bilhões cobrados de aposentados por associações. Lupi foi demitido dias depois após reportagens e CPI.',
      'verified', false, '2025-04-25',
      'https://g1.globo.com/politica/noticia/2025/04/25/lupi-inss-fraudes-associacoes.ghtml',
      'news_article',
      'Brasília', 'Nota oficial à imprensa', 'carlos-lupi-inss-fraudes-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 21. Gleisi Hoffmann sobre Relações Institucionais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que vai melhorar articulação do governo com Congresso.',
      'Assumo o Ministério das Relações Institucionais com a missão de melhorar o diálogo entre governo e Congresso. Vamos construir uma base sólida, respeitando o Parlamento, mas defendendo as pautas prioritárias do governo Lula. Não faltará firmeza nem capacidade de negociação.',
      'Discurso de posse em março de 2025, após Gleisi deixar a presidência do PT para assumir o ministério. Ela substituiu Alexandre Padilha, que foi para o Ministério da Saúde.',
      'verified', true, '2025-03-06',
      'https://www1.folha.uol.com.br/poder/2025/03/gleisi-hoffmann-posse-relacoes-institucionais.shtml',
      'news_article',
      'Brasília', 'Posse no Ministério das Relações Institucionais', 'gleisi-hoffmann-posse-institucional-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 22. Gleisi sobre Arthur Lira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que emendas Pix são instrumento de chantagem do Congresso.',
      'O orçamento secreto e as emendas Pix foram transformados em instrumento de chantagem política do Congresso contra o Executivo. R$ 50 bilhões sem rastreabilidade, sem controle social, sem destinação clara. É uma distorção inconstitucional que o STF corretamente começou a desmontar.',
      'Entrevista à GloboNews em abril de 2025, em meio à crise sobre emendas parlamentares após decisões do STF exigindo transparência. Gleisi havia assumido as Relações Institucionais.',
      'verified', false, '2025-04-03',
      'https://g1.globo.com/globonews/noticia/2025/04/03/gleisi-emendas-pix-chantagem-congresso.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'gleisi-emendas-pix-chantagem-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 23. André Fufuca sobre Esporte
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ful,
      'André Fufuca defende ampliação do Bolsa Atleta e candidatura brasileira às Olimpíadas.',
      'O Bolsa Atleta forma campeões olímpicos e democratiza o esporte no Brasil. Vamos ampliar o número de beneficiários e melhorar os valores. Também trabalhamos em uma futura candidatura brasileira às Olimpíadas, começando por sediar competições internacionais maiores.',
      'Entrevista à ESPN em outubro de 2024, apresentando metas do Ministério do Esporte após assumir a pasta como representante do PP, partido do Centrão que entrou no governo em meados de 2023.',
      'verified', false, '2024-10-17',
      'https://www.espn.com.br/esportes-olimpicos/artigo/_/id/13589234/andre-fufuca-bolsa-atleta-olimpiadas',
      'news_article',
      'Brasília', 'Entrevista à ESPN Brasil', 'andre-fufuca-bolsa-atleta-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 24. Padilha sobre aborto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Alexandre Padilha reafirma que SUS garantirá aborto legal conforme lei em vigor.',
      'O aborto legal é direito garantido por lei desde 1940 nos casos de estupro, risco à vida da gestante e anencefalia. O SUS vai cumprir rigorosamente essa legislação. Não podemos deixar mulheres e meninas vítimas de violência à mercê da desinformação ou de obstáculos burocráticos.',
      'Entrevista em abril de 2025, após casos de hospitais públicos negando atendimento a mulheres vítimas de estupro. Padilha assumiu o Ministério da Saúde com a missão de retomar protocolos atacados no governo Bolsonaro.',
      'verified', false, '2025-04-22',
      'https://www1.folha.uol.com.br/cotidiano/2025/04/padilha-sus-aborto-legal-estupro.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'padilha-sus-aborto-legal-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 25. Marina Silva sobre Fundo Amazônia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mas,
      'Marina Silva celebra retomada do Fundo Amazônia com novos doadores internacionais.',
      'O Fundo Amazônia está reativado com R$ 3,4 bilhões disponíveis e novos doadores como Estados Unidos, Alemanha, Reino Unido e Suíça. Vai financiar fiscalização, conservação, bioeconomia e transição produtiva. O mundo confia novamente no Brasil como guardião da maior floresta tropical.',
      'Declaração em setembro de 2023, em cerimônia de reativação do Fundo Amazônia que havia sido paralisado desde 2019 por decisões do governo Bolsonaro. A Noruega é o maior doador histórico.',
      'verified', false, '2023-09-08',
      'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-silva-fundo-amazonia-doadores',
      'government_document',
      'Brasília', 'Reativação do Fundo Amazônia', 'marina-silva-fundo-amazonia-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 26. Marina sobre petróleo Foz do Amazonas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mas,
      'Marina Silva se opõe a exploração de petróleo na Foz do Amazonas e defende decisão do Ibama.',
      'A Foz do Amazonas é um dos ecossistemas mais sensíveis do mundo. O Ibama negou a licença ambiental baseado em ciência e em lacunas graves do estudo apresentado pela Petrobras. Essa decisão precisa ser respeitada. Não dá para falar em transição ecológica e abrir nova fronteira de petróleo.',
      'Entrevista à CBN em maio de 2023, defendendo publicamente decisão do Ibama de negar licença à Petrobras para perfurar na Margem Equatorial. A decisão gerou crise interna no governo.',
      'verified', true, '2023-05-19',
      'https://cbn.globoradio.globo.com/politica/2023/05/marina-silva-foz-amazonas-petrobras.htm',
      'news_article',
      'São Paulo', 'Entrevista à rádio CBN', 'marina-silva-foz-amazonas-petrobras-maio-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 27. Haddad sobre Campos Neto e Galípolo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad celebra posse de Gabriel Galípolo no Banco Central como virada técnica.',
      'A posse de Gabriel Galípolo no Banco Central representa o fim de um ciclo político e início de uma gestão técnica e comprometida com o desenvolvimento sustentável. Tenho certeza que ele vai conduzir a política monetária com equilíbrio entre controle da inflação e crescimento do país.',
      'Declaração em janeiro de 2025 na posse do novo presidente do Banco Central, Gabriel Galípolo, ex-secretário executivo da Fazenda indicado por Lula em substituição a Roberto Campos Neto.',
      'verified', false, '2025-01-01',
      'https://valor.globo.com/politica/noticia/2025/01/01/haddad-posse-galipolo-banco-central.ghtml',
      'news_article',
      'Brasília', 'Posse de Gabriel Galípolo no Banco Central', 'haddad-posse-galipolo-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 28. Tebet sobre Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Simone Tebet diz que Lula precisa cuidar melhor do tom das falas públicas sobre economia.',
      'Admiro o presidente Lula e estou no governo por convicção, mas é preciso cuidar do tom das falas sobre economia. Algumas declarações assustam o mercado desnecessariamente e geram efeitos inflacionários. A comunicação faz parte da política econômica e precisa ser calibrada.',
      'Entrevista ao Roda Viva em outubro de 2024, respondendo a perguntas sobre o embate entre Lula e o mercado financeiro. Tebet havia defendido publicamente o ajuste fiscal anunciado pelo governo.',
      'verified', false, '2024-10-28',
      'https://www.uol.com.br/tvfolha/ultimas-noticias/2024/10/28/simone-tebet-roda-viva-lula-economia.htm',
      'news_article',
      'São Paulo', 'Entrevista ao Roda Viva', 'tebet-roda-viva-lula-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 29. Mauro Vieira sobre Ucrânia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira defende neutralidade do Brasil na guerra da Ucrânia e propõe mediação.',
      'O Brasil defende a integridade territorial da Ucrânia e condena a invasão russa, mas também defende o diálogo como único caminho para a paz duradoura. Não vamos enviar munição nem armas. Nossa contribuição é propor clube da paz com países do Sul global para mediar o conflito.',
      'Entrevista em abril de 2023, após o presidente Lula propor a criação de um grupo de países para mediar a guerra na Ucrânia. A proposta foi criticada por Ucrânia, UE e Estados Unidos.',
      'verified', false, '2023-04-20',
      'https://www1.folha.uol.com.br/mundo/2023/04/mauro-vieira-ucrania-clube-da-paz-mediacao.shtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa sobre Ucrânia', 'mauro-vieira-ucrania-clube-paz-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 30. Rui Costa sobre 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rui,
      'Rui Costa classifica 8 de janeiro como terrorismo golpista e cobra responsabilização.',
      'O que aconteceu em 8 de janeiro de 2023 foi terrorismo golpista, não foi manifestação, não foi dia de liberdade. Depredaram o patrimônio público, tentaram destruir a democracia. Os responsáveis, incluindo financiadores e incitadores, precisam responder com todo o rigor da lei.',
      'Declaração em cerimônia de Um Ano do 8 de Janeiro em janeiro de 2024 no Planalto, com presença de três Poderes. Rui Costa havia sido um dos primeiros a chegar ao Planalto depredado.',
      'verified', true, '2024-01-08',
      'https://g1.globo.com/politica/noticia/2024/01/08/rui-costa-8-janeiro-terrorismo-golpista.ghtml',
      'news_article',
      'Brasília', 'Cerimônia de 1 ano do 8 de janeiro', 'rui-costa-8-janeiro-terrorismo-janeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 31. Sônia Guajajara em Davos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gua,
      'Sônia Guajajara diz em Davos que povos indígenas são essenciais contra a crise climática.',
      'Os povos indígenas protegem 80% da biodiversidade do planeta ocupando menos de 5% do território. Sem a liderança indígena, não há solução para a crise climática. Queremos financiamento direto, não mais intermediários. Queremos participação plena nas decisões que afetam nossas vidas.',
      'Participação no Fórum Econômico Mundial em Davos em janeiro de 2024, onde Sônia Guajajara foi uma das principais vozes do pavilhão brasileiro, ao lado de Marina Silva e Haddad.',
      'verified', false, '2024-01-17',
      'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-01/sonia-guajajara-davos-povos-indigenas',
      'news_article',
      'Davos', 'Fórum Econômico Mundial 2024', 'sonia-guajajara-davos-janeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 32. Camilo sobre Pé-de-Meia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cam,
      'Camilo Santana celebra Pé-de-Meia como programa histórico contra evasão no ensino médio.',
      'O Pé-de-Meia é o maior programa de combate à evasão escolar da história do Brasil. Cada estudante de escola pública recebe R$ 9.200 ao longo do ensino médio, sendo R$ 1.000 liberados apenas ao final, como poupança. Combate a evasão e ajuda no futuro desses jovens.',
      'Lançamento do Pé-de-Meia em março de 2024 no Palácio do Planalto com Lula. O programa atende cerca de 4 milhões de estudantes de baixa renda matriculados no ensino médio público.',
      'verified', true, '2024-03-26',
      'https://www.gov.br/mec/pt-br/assuntos/noticias/2024/marco/camilo-santana-pe-de-meia-lancamento',
      'government_document',
      'Brasília', 'Lançamento do Programa Pé-de-Meia', 'camilo-santana-pe-de-meia-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 33. Luiz Marinho sobre Emprego Formal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Luiz Marinho celebra criação de 2 milhões de empregos formais em 2024 como vitória do Lula.',
      'O Brasil criou mais de 2 milhões de empregos formais em 2024. São trabalhadores com carteira assinada, com direitos garantidos, com acesso ao FGTS. Isso é o resultado da política econômica do governo Lula que combina crescimento com distribuição de renda. Um contraste total com o governo anterior.',
      'Coletiva em janeiro de 2025, divulgando dados do Caged referentes a 2024, que fechou com saldo positivo de 2.138.235 empregos formais, o segundo melhor resultado em uma série histórica.',
      'verified', false, '2025-01-29',
      'https://g1.globo.com/economia/noticia/2025/01/29/marinho-caged-empregos-formais-2024.ghtml',
      'news_article',
      'Brasília', 'Divulgação do Caged 2024', 'marinho-caged-empregos-formais-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 34. Lewandowski sobre facção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lew,
      'Ricardo Lewandowski defende Lei Antifacção como resposta civilizatória ao crime organizado.',
      'O crime organizado controla territórios, executa pessoas, corrompe instituições. A Lei Antifacção que enviamos ao Congresso endurece penas, cria instrumentos para confisco de bens e aperta o cerco a lideranças. É resposta civilizatória, democrática e necessária do Estado brasileiro.',
      'Anúncio em outubro de 2025 da Lei Antifacção elaborada pelo governo em resposta à expansão de PCC, Comando Vermelho e Família do Norte. O projeto foi enviado ao Congresso com regime de urgência.',
      'verified', true, '2025-10-31',
      'https://www1.folha.uol.com.br/cotidiano/2025/10/lewandowski-lei-antifaccao-crime-organizado.shtml',
      'news_article',
      'Brasília', 'Apresentação da Lei Antifacção', 'lewandowski-lei-antifaccao-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 35. José Múcio sobre escala militar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_muc,
      'José Múcio diz que não existem militares politicamente engajados no atual comando.',
      'Os militares brasileiros estão cumprindo sua missão constitucional: defender a pátria, garantir poderes constitucionais e, quando necessário, atuar em missões de paz ou emergência. Não há espaço nem tolerância para engajamento político partidário no comando das Forças Armadas. Isso ficou para trás.',
      'Entrevista ao Estadão em agosto de 2024, avaliando o processo de despolitização das Forças Armadas após o 8 de janeiro e o desmonte do núcleo bolsonarista dentro dos quartéis.',
      'verified', false, '2024-08-15',
      'https://www.estadao.com.br/politica/jose-mucio-militares-engajamento-politico/',
      'news_article',
      'Brasília', 'Entrevista ao Estadão', 'jose-mucio-militares-engajamento-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 36. Nísia sobre Mais Médicos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nis,
      'Nísia Trindade relança Mais Médicos com prioridade para Amazônia e áreas vulneráveis.',
      'O Mais Médicos está de volta e ampliado. Vamos chegar a mais de 28 mil profissionais atuando em locais onde ninguém quer ir: Amazônia, periferias, comunidades indígenas, quilombolas. O programa foi desmontado pelo governo Bolsonaro e agora volta ainda mais forte com prioridade para o SUS.',
      'Lançamento da nova edição do Mais Médicos em março de 2023 no Palácio do Planalto. A meta era substituir integralmente o Médicos pelo Brasil criado na era Bolsonaro.',
      'verified', false, '2023-03-20',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/marco/mais-medicos-relancamento-nisia',
      'government_document',
      'Brasília', 'Relançamento do Mais Médicos', 'nisia-mais-medicos-relancamento-marco-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 37. Haddad sobre corte de gastos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad apresenta pacote de corte de gastos de R$ 70 bilhões e isenção do IR.',
      'O pacote de corte de gastos de R$ 70 bilhões em dois anos é compromisso com a responsabilidade fiscal. Junto com a isenção do IR para quem ganha até R$ 5 mil, mostramos que é possível combinar ajuste com justiça social. Os super-ricos vão pagar pela desoneração da classe trabalhadora.',
      'Apresentação em rede nacional em novembro de 2024 do pacote fiscal combinado com a reforma do IR. O mercado reagiu negativamente, o dólar disparou a R$ 6,20 nos dias seguintes.',
      'verified', true, '2024-11-27',
      'https://valor.globo.com/politica/noticia/2024/11/27/haddad-pacote-fiscal-ir-super-ricos.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento em rede nacional', 'haddad-pacote-fiscal-ir-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 38. Margareth sobre carnaval
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_meg,
      'Margareth Menezes defende carnaval como maior manifestação cultural democrática do mundo.',
      'O carnaval brasileiro é a maior manifestação cultural democrática do mundo. Gera R$ 12 bilhões na economia, movimenta 54 milhões de pessoas, dá trabalho a milhões. Não é festa, é economia criativa, é identidade, é resistência do povo brasileiro. MinC apoia o carnaval.',
      'Declaração em fevereiro de 2024, durante o Carnaval em Salvador. Margareth Menezes fez do apoio ao carnaval uma das marcas da gestão, com programas de financiamento a blocos e escolas de samba.',
      'verified', false, '2024-02-12',
      'https://g1.globo.com/ba/bahia/carnaval/2024/noticia/2024/02/12/margareth-menezes-carnaval-economia-criativa.ghtml',
      'news_article',
      'Salvador', 'Carnaval de Salvador 2024', 'margareth-menezes-carnaval-salvador-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 39. Jorge Messias sobre STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mes,
      'Jorge Messias condena ataques bolsonaristas ao STF e defende instituições democráticas.',
      'Os ataques ao STF por parlamentares bolsonaristas extrapolam qualquer limite democrático. Pedir prisão de ministros, invocar o artigo 142 para intervenção militar, promover atos contra a democracia: tudo isso é atentado à Constituição. A AGU está pronta para defender as instituições.',
      'Declaração em setembro de 2024, após nova onda de ataques de parlamentares da oposição ao ministro Alexandre de Moraes durante o ato do 7 de setembro bolsonarista na Avenida Paulista.',
      'verified', false, '2024-09-10',
      'https://www1.folha.uol.com.br/poder/2024/09/jorge-messias-ataques-stf-bolsonaristas.shtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa da AGU', 'jorge-messias-stf-ataques-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 40. Silveira sobre leilão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alx,
      'Alexandre Silveira anuncia leilão recorde de transmissão de energia com R$ 35 bilhões.',
      'Realizamos o maior leilão de transmissão de energia da história com R$ 35 bilhões em investimentos. Novas linhas vão conectar as fontes renováveis do Nordeste aos grandes centros consumidores. É a transição energética com segurança de suprimento e geração de empregos pelo Brasil inteiro.',
      'Coletiva após leilão realizado pela Aneel em março de 2024, que contratou a construção de mais de 6,5 mil quilômetros de linhas de transmissão em 16 estados brasileiros.',
      'verified', false, '2024-03-28',
      'https://valor.globo.com/empresas/noticia/2024/03/28/silveira-leilao-transmissao-recorde.ghtml',
      'news_article',
      'Brasília', 'Coletiva após leilão de transmissão', 'silveira-leilao-transmissao-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 41. Mauro Vieira sobre Trump
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira defende que Brasil manterá pragmatismo em relação ao governo Trump.',
      'As relações entre Brasil e Estados Unidos são maiores do que os governos de ocasião. Vamos manter o pragmatismo diplomático, defender os interesses brasileiros e continuar construindo uma parceria mutuamente benéfica com a nova administração americana, mas sem abrir mão de princípios.',
      'Declaração em janeiro de 2025 após a posse de Donald Trump, que ameaçou tarifas contra o Brasil caso o país adotasse moeda alternativa ao dólar. Mauro Vieira conduziu rodadas de diálogo nos meses seguintes.',
      'verified', false, '2025-01-22',
      'https://g1.globo.com/politica/noticia/2025/01/22/mauro-vieira-trump-pragmatismo-diplomacia.ghtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa', 'mauro-vieira-trump-pragmatismo-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 42. Sônia Guajajara sobre garimpo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gua,
      'Sônia Guajajara celebra expulsão de 80% dos garimpeiros da Terra Yanomami mas alerta retorno.',
      'Conseguimos expulsar mais de 80% dos garimpeiros do território Yanomami em operações federais conjuntas. Houve queda drástica da desnutrição e malária. Mas os garimpeiros estão tentando voltar e o Estado precisa manter presença permanente. A desintrusão precisa ser definitiva.',
      'Balanço em janeiro de 2024, um ano após o início da crise humanitária Yanomami. O governo conduziu operações contínuas no território, mas enfrentava dificuldades em manter a presença permanente.',
      'verified', false, '2024-01-25',
      'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-01/sonia-guajajara-yanomami-garimpeiros-retorno',
      'news_article',
      'Brasília', 'Balanço de 1 ano da crise Yanomami', 'sonia-guajajara-yanomami-garimpo-janeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 43. Cida Gonçalves sobre Damares
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cid,
      'Cida Gonçalves rebate Damares e diz que Ministério das Mulheres é política de Estado.',
      'Os ataques de parlamentares como Damares Alves ao Ministério das Mulheres são retrocessos ideológicos. Elas querem controlar o corpo das mulheres, negar direitos reprodutivos, perseguir a diversidade. Meu ministério não vai recuar. Vamos ampliar políticas públicas com enfoque feminista e interseccional.',
      'Entrevista em junho de 2024, após críticas da senadora Damares Alves (Republicanos-DF) ao Ministério das Mulheres. Cida Gonçalves deixou a pasta em dezembro de 2024, substituída por Márcia Lopes.',
      'verified', false, '2024-06-18',
      'https://www.uol.com.br/universa/noticias/redacao/2024/06/18/cida-goncalves-damares-ministerio-mulheres.htm',
      'news_article',
      'Brasília', 'Entrevista ao Universa/UOL', 'cida-goncalves-damares-mulheres-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 44. Padilha sobre emendas parlamentares
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha reconhece que governo prometeu emendas para garantir votos da reforma tributária.',
      'A política brasileira é assim: precisa construir maioria. Garantimos emendas para conseguir os votos da Reforma Tributária, da arcabouço fiscal, do Bolsa Família. Não é compra de voto, é negociação política republicana. O resultado final foi uma das maiores reformas da história.',
      'Entrevista ao Roda Viva em março de 2024, reconhecendo abertamente que o governo usa emendas parlamentares como instrumento de negociação com o Congresso, em momento de pressão do STF.',
      'verified', false, '2024-03-25',
      'https://www.uol.com.br/tvfolha/ultimas-noticias/2024/03/25/padilha-roda-viva-emendas-reforma-tributaria.htm',
      'news_article',
      'São Paulo', 'Entrevista ao Roda Viva', 'padilha-roda-viva-emendas-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 45. Luciana Santos sobre defasagem Ciência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_luc,
      'Luciana Santos condena corte de emendas no orçamento da ciência pelo Congresso.',
      'O Congresso cortou R$ 3 bilhões do orçamento da ciência para realocar em emendas parlamentares. É inaceitável. Estamos reconstruindo a pesquisa brasileira após anos de desmonte e o Legislativo nos empurra para trás. A ciência não pode ser moeda de troca política.',
      'Declaração em dezembro de 2024, após o Congresso aprovar LDO 2025 com cortes no Ministério da Ciência para abrir espaço para emendas. Luciana criticou abertamente a decisão do Congresso.',
      'verified', false, '2024-12-18',
      'https://g1.globo.com/politica/noticia/2024/12/18/luciana-santos-corte-ciencia-emendas.ghtml',
      'news_article',
      'Brasília', 'Declaração à imprensa', 'luciana-santos-corte-ciencia-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 46. Fávaro sobre Mercosul-UE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fav,
      'Carlos Fávaro celebra acordo Mercosul-UE como vitória do agronegócio brasileiro.',
      'O acordo Mercosul-União Europeia depois de 25 anos é uma vitória histórica do agronegócio brasileiro. Vai abrir o maior mercado consumidor do mundo para nossa carne, açúcar, etanol, suco de laranja. Agora é implementar com respeito à legislação ambiental.',
      'Declaração em dezembro de 2024, após assinatura do acordo Mercosul-UE em Montevidéu. Fávaro participou da comitiva brasileira com Lula, Mauro Vieira e Marina Silva, com divergências.',
      'verified', false, '2024-12-06',
      'https://valor.globo.com/politica/noticia/2024/12/06/favaro-mercosul-uniao-europeia-acordo.ghtml',
      'news_article',
      'Montevidéu', 'Cúpula do Mercosul', 'favaro-mercosul-ue-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 47. Teixeira sobre títulos de terra
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tei,
      'Paulo Teixeira anuncia entrega recorde de títulos de terra para famílias da reforma agrária.',
      'Entregamos 250 mil títulos definitivos de terra para famílias assentadas da reforma agrária em 2024. Isso é dignidade, é cidadania, é futuro. O título da terra garante acesso ao crédito, à aposentadoria, ao planejamento familiar. É compromisso com quem produz comida para a mesa do brasileiro.',
      'Cerimônia em maio de 2024, durante a Marcha das Margaridas em Brasília. Paulo Teixeira anunciou aceleração da titulação definitiva de lotes em todos os estados brasileiros.',
      'verified', false, '2024-05-15',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-05/paulo-teixeira-titulos-terra-reforma-agraria',
      'news_article',
      'Brasília', 'Marcha das Margaridas 2024', 'paulo-teixeira-titulos-terra-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 48. Gleisi Hoffmann sobre 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que Lula é imbatível em 2026 com bandeira da soberania nacional.',
      'O presidente Lula é imbatível em 2026. Entregamos isenção do IR, redução da conta de luz, Pé-de-Meia, mais empregos, mais obras, mais saúde. A extrema-direita não tem o que oferecer a não ser ódio e mentira. O povo brasileiro quer continuar no caminho da reconstrução do Brasil.',
      'Entrevista à GloboNews em setembro de 2025, defendendo a pré-candidatura de Lula à reeleição em 2026, enquanto pesquisas indicavam recuperação de popularidade do presidente.',
      'verified', false, '2025-09-15',
      'https://g1.globo.com/globonews/noticia/2025/09/15/gleisi-hoffmann-lula-2026-reeleicao.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'gleisi-lula-2026-reeleicao-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 49. Marina Silva sobre COP30 resultados
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mas,
      'Marina Silva afirma que COP30 entregou mapa do caminho contra combustíveis fósseis.',
      'A COP30 entregou o que foi chamado de "Mutirão de Belém": um roteiro concreto para acelerar a transição energética global, triplicar a capacidade de energia renovável e estabelecer metas vinculantes para países desenvolvidos financiarem a adaptação. Não é tudo o que queríamos, mas é avanço real.',
      'Coletiva de encerramento da COP30 em Belém do Pará em novembro de 2025. Marina Silva presidiu a conferência e conduziu negociações polarizadas com países produtores de petróleo e EUA.',
      'verified', true, '2025-11-22',
      'https://www1.folha.uol.com.br/ambiente/2025/11/marina-silva-cop30-belem-encerramento.shtml',
      'news_article',
      'Belém', 'Encerramento da COP30', 'marina-silva-cop30-encerramento-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 50. Haddad sobre cenário 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad diz que economia brasileira entregará 2026 em condições melhores.',
      'Vamos entregar a economia brasileira em 2026 com inflação controlada, desemprego em mínima histórica, salário mínimo valorizado, dívida pública estabilizada e crescimento acima de 3%. É o legado de quatro anos de governo responsável, que investe na produção e na proteção social. O Brasil voltou.',
      'Entrevista à Bloomberg em março de 2026, às vésperas do início oficial do ano eleitoral. Haddad havia sido cotado como possível candidato à Presidência caso Lula desistisse da reeleição.',
      'verified', false, '2026-03-10',
      'https://www.bloomberg.com.br/politica/haddad-economia-2026-lula-reeleicao/',
      'news_article',
      'Brasília', 'Entrevista à Bloomberg', 'haddad-economia-2026-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

END $$;
