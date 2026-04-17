-- Batch 56: Economia, Petrobras, BNDES, Banco Central (2023-2026)
-- Arcabouço fiscal, reforma tributária, autonomia do BC, juros, dividendos Petrobras,
-- Margem Equatorial, política industrial, taxação super-ricos, bets, IR, big techs
-- 50 statements

DO $$
DECLARE
  v_had UUID; v_teb UUID; v_cam UUID; v_gal UUID; v_pra UUID;
  v_cha UUID; v_mer UUID; v_lul UUID; v_alc UUID; v_sil UUID;
  v_dwe UUID; v_mar UUID; v_gue UUID; v_fhc UUID; v_bol UUID;
  v_fav UUID; v_pon UUID;
  c_irr UUID; c_des UUID; c_con UUID; c_abu UUID; c_aut UUID;
  c_ame UUID; c_cor UUID; c_neg UUID;
BEGIN
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_cam FROM politicians WHERE slug = 'roberto-campos-neto';
  SELECT id INTO v_gal FROM politicians WHERE slug = 'gabriel-galipolo';
  SELECT id INTO v_pra FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'magda-chambriard';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_dwe FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_gue FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_pon FROM politicians WHERE slug = 'marcos-pontes';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';

  -- 1. Haddad apresenta arcabouço fiscal
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad apresenta novo arcabouço fiscal como substituto do teto de gastos e promete equilíbrio das contas.',
      'O novo arcabouço fiscal vai garantir a sustentabilidade das contas públicas sem impedir que o Estado invista em políticas sociais e em infraestrutura. Estamos encerrando o ciclo do teto de gastos, que estrangulou o país, e entrando num novo ciclo de responsabilidade fiscal com desenvolvimento.',
      'Fernando Haddad apresentou em março de 2023 o novo arcabouço fiscal, substituto do teto de gastos da era Temer/Bolsonaro. A proposta foi aprovada pelo Congresso em agosto de 2023 e estabeleceu banda de crescimento de despesas entre 0,6% e 2,5% acima da inflação.',
      'verified', true, '2023-03-30',
      'https://www1.folha.uol.com.br/mercado/2023/03/haddad-apresenta-arcabouco-fiscal-substituto-teto-gastos.shtml',
      'news_article',
      'Brasília', 'Apresentação à imprensa — Ministério da Fazenda', 'haddad-arcabouco-fiscal-apresentacao-marco-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2. Lula ataca Campos Neto por juros altos
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula chama taxa Selic de "vergonha" e acusa Roberto Campos Neto de sabotar o governo ao manter juros altos.',
      'Não tem explicação uma taxa de juros de 13,75%. Isso é uma vergonha. O presidente do Banco Central parece que tem compromisso com o mercado e não com o povo brasileiro. O Brasil não vai crescer com juros desse tamanho. É preciso que o Banco Central tenha sensibilidade social.',
      'Declaração de Lula em entrevista à Rede TV em fevereiro de 2023, uma das primeiras cobranças públicas contra Roberto Campos Neto, então presidente do BC com mandato até dezembro de 2024. O embate entre Lula e Campos Neto marcou todo o início do terceiro mandato.',
      'verified', true, '2023-02-02',
      'https://g1.globo.com/politica/noticia/2023/02/02/lula-critica-taxa-de-juros-e-campos-neto-vergonha.ghtml',
      'news_article',
      'São Paulo', 'Entrevista à Rede TV', 'lula-ataca-campos-neto-juros-vergonha-fevereiro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3. Campos Neto responde a Lula
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cam,
      'Roberto Campos Neto responde a Lula afirmando que "sr. fulano faz política, eu faço política monetária".',
      'O sr. fulano faz política, o sr. fulano faz a sua política monetária e eu faço a minha política monetária. O Banco Central é autônomo por lei e vai cumprir o seu mandato que é garantir a estabilidade da moeda. Não vamos ceder a pressões políticas.',
      'Fala de Roberto Campos Neto em evento do Santander em fevereiro de 2023, em resposta direta às críticas de Lula. A declaração virou símbolo do conflito entre governo e BC ao longo de 2023 e 2024, com Campos Neto defendendo ruidosamente a autonomia.',
      'verified', true, '2023-02-23',
      'https://www.poder360.com.br/economia/campos-neto-rebate-lula-fulano-politica-monetaria/',
      'news_article',
      'São Paulo', 'Evento Santander', 'campos-neto-fulano-politica-monetaria-fevereiro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 4. Haddad defende taxação dos super-ricos
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad defende taxação dos super-ricos no G20 e diz que bilionários pagam proporcionalmente menos imposto que a classe média.',
      'É inaceitável que um bilionário pague proporcionalmente menos imposto do que um professor, um enfermeiro ou um motorista de aplicativo. O Brasil vai liderar no G20 a agenda da taxação dos super-ricos. Nenhum país vai conseguir sustentar a democracia se a desigualdade continuar crescendo como está.',
      'Fernando Haddad em pronunciamento na reunião de ministros de Finanças do G20 em São Paulo em fevereiro de 2024, apresentando a proposta brasileira de imposto mínimo global sobre bilionários. A proposta rendeu acordo político, mas sem implementação obrigatória.',
      'verified', true, '2024-02-29',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2024-02/haddad-defende-taxacao-super-ricos-g20',
      'news_article',
      'São Paulo', 'Reunião do G20 Finanças', 'haddad-taxacao-super-ricos-g20-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5. Tebet defende meta fiscal
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_teb,
      'Simone Tebet defende manutenção da meta de déficit zero e critica alas do PT que pedem flexibilização.',
      'Não vou participar de nenhum movimento para afrouxar a meta fiscal. Palavra dada é palavra dada. O Brasil não pode voltar a ser o país do gasto descontrolado. Quem acha que a solução é aumentar a despesa pública nunca vai entender o que é responsabilidade com o dinheiro do contribuinte.',
      'Simone Tebet, ministra do Planejamento, em entrevista ao Valor Econômico em abril de 2024, ao ser questionada sobre pressões dentro do governo para mudança da meta fiscal. Tebet se tornou voz de resistência no núcleo econômico contra flexibilizações.',
      'verified', false, '2024-04-15',
      'https://valor.globo.com/politica/noticia/2024/04/15/tebet-defende-meta-fiscal-palavra-dada.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'tebet-meta-fiscal-palavra-dada-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6. Prates contra pressão por dividendos
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_pra,
      'Jean Paul Prates rejeita pressão por distribuição integral de dividendos extraordinários da Petrobras.',
      'A Petrobras não é uma caixa eletrônica do Tesouro. Nosso papel é fazer a empresa crescer, investir em transição energética, explorar novas fronteiras. Distribuir dividendo extraordinário agora seria matar a galinha dos ovos de ouro. Eu vou defender a Petrobras, mesmo que isso contrarie alguns interesses.',
      'Jean Paul Prates em entrevista à CNN Brasil em março de 2024, defendendo a decisão do conselho da Petrobras de reter dividendos extraordinários de 2023. A decisão derrubou as ações e acelerou o desgaste do executivo com o mercado e com a equipe econômica.',
      'verified', true, '2024-03-12',
      'https://www.cnnbrasil.com.br/economia/prates-defende-reter-dividendos-petrobras-caixa-eletronica/',
      'news_article',
      'Rio de Janeiro', 'Entrevista à CNN Brasil', 'prates-petrobras-caixa-eletronica-dividendos-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 7. Lula demite Prates
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula confirma demissão de Jean Paul Prates da Petrobras e diz que presidente de estatal não pode "bater de frente" com governo.',
      'Eu fiz a nomeação e eu posso desfazer. O presidente de uma estatal não é dono da empresa. Ele tem que ter sintonia com o governo que o nomeou. Quando não tem, a gente muda. É assim em qualquer lugar do mundo. A Petrobras agora vai ter uma nova direção, alinhada com o projeto do governo.',
      'Lula em entrevista a jornalistas no dia 14 de maio de 2024, confirmando a demissão de Jean Paul Prates da presidência da Petrobras. A saída de Prates gerou queda das ações e críticas sobre interferência política, tendo sido substituído por Magda Chambriard.',
      'verified', true, '2024-05-14',
      'https://www1.folha.uol.com.br/mercado/2024/05/lula-confirma-demissao-prates-petrobras-sintonia-governo.shtml',
      'news_article',
      'Brasília', 'Entrevista coletiva no Planalto', 'lula-demite-prates-sintonia-governo-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8. Magda Chambriard toma posse
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cha,
      'Magda Chambriard promete acelerar exploração da Margem Equatorial e diz que Petrobras "vai perfurar" na Foz do Amazonas.',
      'A Petrobras vai perfurar na Margem Equatorial. Essa é uma decisão estratégica para o país e não pode ser bloqueada por um órgão ambiental que demora anos para dar uma resposta. Temos tecnologia, temos responsabilidade ambiental, e vamos em frente. O Brasil não pode desperdiçar sua última grande fronteira petrolífera.',
      'Magda Chambriard, nova presidente da Petrobras, em seu primeiro pronunciamento público após posse em maio de 2024. A fala marcou posição dura em relação ao IBAMA, que havia negado licença para exploração na Foz do Amazonas, acirrando embate com Marina Silva.',
      'verified', true, '2024-05-30',
      'https://oglobo.globo.com/economia/noticia/2024/05/chambriard-petrobras-vai-perfurar-margem-equatorial.ghtml',
      'news_article',
      'Rio de Janeiro', 'Cerimônia de posse — sede Petrobras', 'chambriard-margem-equatorial-vai-perfurar-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 9. Marina contra Margem Equatorial
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mar,
      'Marina Silva rebate Petrobras e diz que IBAMA não vai "carimbar licença" para Margem Equatorial sob pressão política.',
      'O IBAMA é um órgão técnico. Não vai carimbar licença nenhuma sob pressão política. Se há dúvida científica sobre o impacto, a resposta é não, enquanto a dúvida persistir. A Foz do Amazonas é uma das regiões mais sensíveis do planeta. Não dá para tratar isso como se fosse licenciamento de um posto de gasolina.',
      'Marina Silva, ministra do Meio Ambiente, em entrevista à Globonews em junho de 2024, respondendo à presidente da Petrobras Magda Chambriard. O embate sobre a Margem Equatorial tornou-se um dos principais conflitos internos do governo Lula 3.',
      'verified', true, '2024-06-05',
      'https://g1.globo.com/politica/noticia/2024/06/05/marina-silva-ibama-margem-equatorial-nao-carimba.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'marina-ibama-nao-carimba-margem-equatorial-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10. Mercadante BNDES verde
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mer,
      'Aloizio Mercadante anuncia R$ 100 bilhões em crédito verde pelo BNDES para transição energética e reindustrialização.',
      'O BNDES vai destinar R$ 100 bilhões para a transição ecológica e para a reindustrialização do país. É o maior programa de crédito verde da história do Brasil. Quem disse que desenvolvimento econômico é incompatível com sustentabilidade está atrasado em meio século. O novo capitalismo é verde ou não será.',
      'Aloizio Mercadante, presidente do BNDES, em evento em São Paulo em novembro de 2023, anunciando a nova política de financiamento do banco. O discurso reforçou a guinada "desenvolvimentista" do banco sob sua gestão após crítica ao governo Bolsonaro.',
      'verified', false, '2023-11-21',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2023-11/mercadante-bndes-100-bilhoes-credito-verde',
      'news_article',
      'São Paulo', 'Evento Febraban', 'mercadante-bndes-credito-verde-novembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11. Reforma tributária
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad celebra aprovação da reforma tributária como "marca histórica" do governo Lula.',
      'Depois de 30 anos de tentativas fracassadas, o Brasil finalmente aprovou a reforma tributária. Isso é uma marca histórica deste governo. Vamos acabar com a cumulatividade, simplificar impostos e desonerar quem produz. Essa reforma sozinha tem potencial para adicionar mais de 10% ao PIB do Brasil ao longo de uma década.',
      'Fernando Haddad em pronunciamento em dezembro de 2023, logo após a promulgação da Emenda Constitucional 132, da reforma tributária do consumo. A reforma substitui PIS, Cofins, IPI, ICMS e ISS por CBS e IBS.',
      'verified', true, '2023-12-20',
      'https://www.poder360.com.br/economia/haddad-celebra-reforma-tributaria-marca-historica/',
      'news_article',
      'Brasília', 'Cerimônia de promulgação — Congresso Nacional', 'haddad-reforma-tributaria-marca-historica-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12. Campos Neto autonomia
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cam,
      'Roberto Campos Neto diz que vai "resistir" a qualquer tentativa de interferência política no Banco Central.',
      'A autonomia do Banco Central não é um favor que se faz ao presidente do BC. É uma conquista institucional do Brasil. Vou resistir até o último dia do meu mandato a qualquer tentativa de transformar a política monetária em política de governo. Quem quiser juros mais baixos, faça reformas fiscais.',
      'Roberto Campos Neto em palestra no evento Brazil Investment Forum em setembro de 2023, ao ser questionado sobre pressões do governo Lula. A declaração foi interpretada como afronta direta ao Planalto e intensificou o conflito institucional.',
      'verified', true, '2023-09-14',
      'https://valor.globo.com/financas/noticia/2023/09/14/campos-neto-vou-resistir-interferencia-politica-bc.ghtml',
      'news_article',
      'São Paulo', 'Brazil Investment Forum', 'campos-neto-resistir-interferencia-bc-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13. Galípolo posse
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_gal,
      'Gabriel Galípolo toma posse no BC prometendo independência técnica e foco na meta de inflação.',
      'Assumo o Banco Central com o compromisso absoluto de cumprir o mandato de controle da inflação. Não existe Banco Central de governo, existe Banco Central de Estado. Minha palavra está dada: política monetária aqui dentro não atende demanda partidária, atende a dados econômicos.',
      'Gabriel Galípolo em discurso de posse na presidência do Banco Central em janeiro de 2025. Indicado por Lula, Galípolo buscou desde o primeiro dia desfazer a narrativa de que o BC se tornaria submisso ao governo, mantendo ciclo de aperto monetário.',
      'verified', true, '2025-01-02',
      'https://www1.folha.uol.com.br/mercado/2025/01/galipolo-posse-bc-independencia-tecnica.shtml',
      'news_article',
      'Brasília', 'Posse — sede do Banco Central', 'galipolo-posse-bc-independencia-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14. Lula pressiona Galípolo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula diz que Galípolo vai ter que "olhar para o povo" ao decidir sobre juros.',
      'Eu não vou interferir, mas eu quero que o presidente do Banco Central que eu indiquei olhe para o povo. Juro alto não combate inflação, juro alto destrói emprego, destrói empresa pequena, destrói sonho. O Galípolo sabe disso. Ele tem condição intelectual de fazer uma política monetária humana.',
      'Lula em entrevista à Rádio Clube do Pará em fevereiro de 2025, um mês após a posse de Gabriel Galípolo no BC. A fala foi lida como recado público para o novo presidente do BC reduzir a Selic, apesar da inflação acima do teto da meta.',
      'verified', true, '2025-02-11',
      'https://g1.globo.com/politica/noticia/2025/02/11/lula-galipolo-bc-olhar-para-o-povo.ghtml',
      'news_article',
      'Belém', 'Entrevista à Rádio Clube do Pará', 'lula-galipolo-olhar-povo-juros-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 15. Guedes critica Lula 3
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_gue,
      'Paulo Guedes acusa governo Lula de "destruir" o arcabouço fiscal e prevê "catástrofe" nas contas públicas.',
      'Esse governo está destruindo tudo que construímos. O arcabouço fiscal é uma fantasia, já nasceu morto. Vai acabar como a NRF, como a nova matriz econômica da Dilma. A trajetória é de catástrofe. Em dois anos vamos estar discutindo calote ou imposto gigantesco. Foi o que eu deixei avisado.',
      'Paulo Guedes, ex-ministro da Economia do governo Bolsonaro, em entrevista ao programa Canal Livre da Band em outubro de 2023. O ex-ministro voltou às críticas públicas contra a política econômica de Haddad, após período de silêncio pós-eleição.',
      'verified', false, '2023-10-08',
      'https://www.band.uol.com.br/canal-livre/paulo-guedes-critica-arcabouco-fiscal-lula',
      'news_article',
      'São Paulo', 'Canal Livre — Band', 'guedes-arcabouco-catastrofe-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16. Bets
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad anuncia regulação das bets e diz que não é possível permitir "cassino digital sem regra".',
      'Não é possível que o Brasil tenha um cassino digital funcionando sem nenhuma regra, sem nenhum imposto, sem nenhuma proteção ao jogador. As bets viraram uma epidemia social. Vamos regulamentar, vamos tributar, vamos proteger quem está viciado e vamos acabar com o uso das bets para lavagem de dinheiro.',
      'Fernando Haddad em coletiva em abril de 2024 anunciando o pacote de regulamentação das apostas esportivas on-line. A regulação entrou em vigor em janeiro de 2025 após forte embate com o setor e denúncias de endividamento de famílias.',
      'verified', true, '2024-04-18',
      'https://www.cnnbrasil.com.br/economia/haddad-bets-cassino-digital-sem-regra-regulacao/',
      'news_article',
      'Brasília', 'Coletiva — Ministério da Fazenda', 'haddad-bets-cassino-digital-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17. Isenção IR 5k
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula anuncia isenção do Imposto de Renda para quem ganha até R$ 5 mil e cobrança extra de super-ricos.',
      'A partir de agora vamos isentar do Imposto de Renda todo brasileiro que ganha até cinco mil reais por mês. Isso significa quase dez milhões de pessoas a mais vivendo com um pouco mais de dignidade. E para pagar isso, quem ganha mais de cinquenta mil reais por mês vai pagar um pouquinho a mais. É justiça tributária.',
      'Lula em pronunciamento em cadeia nacional de rádio e TV em novembro de 2024, anunciando o projeto de ampliação da isenção do IR para R$ 5 mil mensais e uma taxação mínima para altas rendas. A medida provocou forte reação no mercado.',
      'verified', true, '2024-11-27',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-11/lula-anuncia-isencao-ir-5-mil-super-ricos',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia nacional', 'lula-isencao-ir-5-mil-super-ricos-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18. Desoneração folha
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad critica Congresso por manter desoneração da folha e chama decisão de "jabuti fiscal".',
      'Essa desoneração é um jabuti fiscal que o Congresso insiste em manter. Custa mais de vinte bilhões de reais por ano e beneficia um conjunto restrito de setores. Não tem estudo técnico que justifique. Temos que rediscutir esse tema com honestidade intelectual e não com canetada parlamentar.',
      'Fernando Haddad em audiência na Câmara em maio de 2024, ao ser questionado sobre o impasse da desoneração da folha de pagamentos de 17 setores, prorrogada pelo Congresso contra a vontade do Executivo. Haddad acabou cedendo após negociação com Pacheco.',
      'verified', false, '2024-05-08',
      'https://www.folha.uol.com.br/mercado/2024/05/haddad-desoneracao-folha-jabuti-fiscal-congresso.shtml',
      'news_article',
      'Brasília', 'Audiência na Câmara dos Deputados', 'haddad-desoneracao-jabuti-fiscal-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19. Big techs
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad defende taxação das big techs e diz que "não tem mais como" plataformas lucrarem no Brasil sem pagar imposto.',
      'Não tem mais como uma empresa que fatura dezenas de bilhões de reais no Brasil não pagar praticamente nada de imposto aqui. As big techs extraem valor da sociedade brasileira, dos dados dos brasileiros, e mandam o lucro para paraísos fiscais. Isso vai acabar. Vamos taxar as plataformas digitais.',
      'Fernando Haddad em entrevista ao jornal Valor Econômico em julho de 2024, defendendo a criação de imposto específico sobre plataformas digitais. A proposta foi apresentada ao Congresso em 2024 e virou foco de lobby intenso das big techs.',
      'verified', false, '2024-07-22',
      'https://valor.globo.com/politica/noticia/2024/07/22/haddad-taxacao-big-techs-brasil.ghtml',
      'news_article',
      'Brasília', 'Entrevista — Valor Econômico', 'haddad-taxacao-big-techs-julho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20. Tebet PPA
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_teb,
      'Tebet apresenta PPA 2024-2027 com foco em transição ecológica, igualdade e soberania digital.',
      'O Plano Plurianual 2024-2027 é o mapa do Brasil que queremos construir. Três eixos estruturantes: transição ecológica justa, redução de desigualdades e soberania tecnológica. Não é um PPA de gaveta. É um compromisso de resultado com a sociedade brasileira, com indicadores e metas públicas.',
      'Simone Tebet em apresentação do PPA 2024-2027 em agosto de 2023. O plano foi aprovado pelo Congresso com alterações e se tornou instrumento-base de planejamento do governo Lula 3, integrando Novo PAC, reindustrialização e política ambiental.',
      'verified', false, '2023-08-31',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2023-08/tebet-apresenta-ppa-2024-2027-transicao-ecologica',
      'news_article',
      'Brasília', 'Cerimônia de envio do PPA ao Congresso', 'tebet-ppa-2024-2027-transicao-ecologica-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21. Silveira defende Petrobras
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_sil,
      'Alexandre Silveira diz que Petrobras "não é da Faria Lima" e defende controle do preço dos combustíveis.',
      'A Petrobras é da sociedade brasileira, não é da Faria Lima. Não dá para aceitar que a cada tremor no mercado internacional o brasileiro pague mais caro na bomba. O governo tem todo o direito de pedir ao conselho da Petrobras que pratique preços compatíveis com a realidade do país. Fim da paridade internacional.',
      'Alexandre Silveira, ministro de Minas e Energia, em entrevista à CBN em abril de 2023, logo após a mudança da política de preços da Petrobras que aboliu o PPI (Paridade de Preço Internacional). A declaração gerou forte queda nas ações da estatal.',
      'verified', true, '2023-04-19',
      'https://oglobo.globo.com/economia/noticia/2023/04/silveira-petrobras-nao-e-da-faria-lima.ghtml',
      'news_article',
      'Brasília', 'Entrevista à CBN', 'silveira-petrobras-faria-lima-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 22. Dweck shutdown
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_dwe,
      'Esther Dweck alerta para risco de paralisia do serviço público por falta de reposição salarial.',
      'O Brasil não pode aceitar um serviço público desidratado. Tem carreira que está há mais de uma década sem reposição. Se não agirmos agora, vamos ter apagão de entregas para o cidadão. Não é um pedido corporativo, é uma questão de Estado. Quem paga o preço da falta de servidor é o brasileiro na ponta.',
      'Esther Dweck, ministra da Gestão e Inovação em Serviços Públicos, em coletiva em setembro de 2023, ao defender pacote de reajustes para servidores federais. A declaração veio em meio a greves de diversas categorias e negociações com a equipe econômica.',
      'verified', false, '2023-09-25',
      'https://www.correiobraziliense.com.br/politica/2023/09/dweck-servico-publico-desidratado-reajuste.html',
      'news_article',
      'Brasília', 'Coletiva — Ministério da Gestão', 'dweck-servico-publico-desidratado-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23. Lula super-ricos
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula diz que bilionário pagar menos imposto do que professor é "obscenidade".',
      'É uma obscenidade. Bilionário no Brasil paga imposto menor do que professor, do que garçom, do que caixa de supermercado. Isso precisa acabar. Se continuar assim, não tem democracia que aguenta. A desigualdade é hoje a principal ameaça à civilização. E o Brasil vai mostrar ao mundo como se enfrenta isso.',
      'Lula em discurso na abertura da Assembleia Geral da ONU em setembro de 2024, defendendo a proposta brasileira de taxação global dos super-ricos. A fala reforçou narrativa do governo para lançar a agenda no G20 sob presidência do Brasil.',
      'verified', true, '2024-09-24',
      'https://www1.folha.uol.com.br/mundo/2024/09/lula-onu-bilionario-obscenidade-professor.shtml',
      'news_article',
      'Nova York', 'Abertura da Assembleia Geral da ONU', 'lula-onu-bilionario-obscenidade-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24. Chambriard Petrobras investimento
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cha,
      'Magda Chambriard anuncia plano de investimentos de US$ 111 bilhões da Petrobras e defende "retomada do protagonismo".',
      'O plano estratégico 2025-2029 prevê investimentos de cento e onze bilhões de dólares. É a retomada do protagonismo da Petrobras no país e no mundo. Vamos explorar, vamos refinar, vamos investir em fertilizantes, em gás, em eólicas offshore. O Brasil vai voltar a ser potência energética de verdade.',
      'Magda Chambriard em apresentação do plano estratégico da Petrobras em novembro de 2024. A cifra superou as projeções do mercado e reafirmou a estratégia de expansão em exploração, contrariando expectativa de maior distribuição de dividendos.',
      'verified', false, '2024-11-21',
      'https://valor.globo.com/empresas/noticia/2024/11/21/chambriard-petrobras-111-bilhoes-protagonismo.ghtml',
      'news_article',
      'Rio de Janeiro', 'Petrobras Day — apresentação do plano estratégico', 'chambriard-petrobras-111-bilhoes-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25. Lula contra Selic
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula diz que alta da Selic é "irracional" e que o BC está "entregando" a economia para especuladores.',
      'Essa elevação da Selic é irracional. Não se combate inflação de oferta com juros. O Banco Central está entregando a economia brasileira nas mãos dos especuladores. Enquanto o trabalhador paga financiamento de quinze por cento no banco, o Tesouro paga bilhões aos rentistas. Isso não é política monetária, é privilégio.',
      'Lula em evento da CUT em março de 2025, criticando a nova alta da taxa Selic para 14,25% ao ano, já sob a gestão de Gabriel Galípolo. A fala aumentou a percepção de pressão política sobre o novo comando do BC.',
      'verified', true, '2025-03-20',
      'https://www.cartacapital.com.br/politica/lula-selic-irracional-especuladores-2025/',
      'news_article',
      'São Paulo', 'Evento da CUT', 'lula-selic-irracional-especuladores-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26. Haddad defende fiscal
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad anuncia pacote de corte de gastos e afirma que governo "não vai fugir" do ajuste fiscal.',
      'O governo não vai fugir do ajuste fiscal. Vamos cortar, vamos revisar benefícios, vamos combater fraude em gastos públicos. Ninguém tem direito adquirido a privilégio pago pelo contribuinte. É um esforço duro, mas necessário. Sem isso, o próprio programa social do governo não se sustenta.',
      'Fernando Haddad em pronunciamento em novembro de 2024 anunciando o pacote de corte de R$ 70 bilhões em despesas. O anúncio, porém, foi contaminado pela revelação simultânea da isenção do IR até R$ 5 mil, e gerou forte queda do real e da bolsa.',
      'verified', true, '2024-11-28',
      'https://g1.globo.com/economia/noticia/2024/11/28/haddad-pacote-corte-gastos-ajuste-fiscal.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia nacional', 'haddad-pacote-corte-gastos-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27. Galípolo aperto monetário
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_gal,
      'Gabriel Galípolo defende alta de juros e afirma que "BC não vai dar desconto" para inflação fora da meta.',
      'O Banco Central não vai dar desconto para uma inflação fora da meta. Se precisar subir mais, vamos subir. Se precisar manter por mais tempo, vamos manter. A credibilidade do regime de metas é um ativo conquistado com enorme custo social ao longo de décadas. Não vamos torrar esse ativo em nenhuma circunstância.',
      'Gabriel Galípolo em discurso na Febraban em março de 2025, defendendo a continuação do ciclo de aperto monetário apesar das pressões do governo Lula. A declaração ajudou a acalmar o mercado, mas também elevou a tensão com o Planalto.',
      'verified', true, '2025-03-10',
      'https://valor.globo.com/financas/noticia/2025/03/10/galipolo-bc-nao-vai-dar-desconto-inflacao.ghtml',
      'news_article',
      'São Paulo', 'Febraban Tech', 'galipolo-bc-nao-da-desconto-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28. Campos Neto 2024 final de mandato
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cam,
      'Roberto Campos Neto faz discurso de despedida do BC e alerta para "risco fiscal" como maior ameaça à economia.',
      'Saio do Banco Central com a consciência tranquila. Enfrentei pressões, ataques pessoais, mas a instituição está mais forte do que encontrei. O maior risco para a economia brasileira hoje não é externo, é fiscal. Enquanto não houver disciplina com o gasto público, nenhum Banco Central vai conseguir garantir inflação baixa.',
      'Roberto Campos Neto em discurso de despedida na sede do Banco Central em dezembro de 2024, ao fim de seu mandato. A fala foi interpretada como último recado ao governo Lula e ao seu sucessor indicado, Gabriel Galípolo.',
      'verified', false, '2024-12-20',
      'https://www.poder360.com.br/economia/campos-neto-discurso-despedida-risco-fiscal/',
      'news_article',
      'Brasília', 'Despedida — sede do Banco Central', 'campos-neto-despedida-risco-fiscal-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29. Alckmin indústria
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_alc,
      'Geraldo Alckmin lança Nova Indústria Brasil com R$ 300 bilhões em crédito e promete reindustrializar o país.',
      'Nenhum país desenvolvido chegou lá sem indústria forte. A Nova Indústria Brasil vai mobilizar mais de trezentos bilhões de reais nos próximos anos. É o maior esforço de reindustrialização desde o Plano de Metas de JK. O Brasil não pode aceitar virar apenas exportador de commodity e importador de tecnologia.',
      'Geraldo Alckmin, vice-presidente e ministro do Desenvolvimento, Indústria e Comércio, em cerimônia em janeiro de 2024 de lançamento do programa Nova Indústria Brasil, que previa seis missões industriais estratégicas e forte uso de compras governamentais.',
      'verified', false, '2024-01-22',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2024-01/alckmin-lanca-nova-industria-brasil-300-bilhoes',
      'news_article',
      'Brasília', 'Lançamento Nova Indústria Brasil — Planalto', 'alckmin-nova-industria-brasil-janeiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30. Tebet crise fiscal 2024
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_teb,
      'Tebet admite "erro de comunicação" no pacote fiscal e pede que governo "pare de misturar" corte com bondade.',
      'Houve um erro grave de comunicação. Você não anuncia corte de gasto na mesma hora em que anuncia isenção de imposto. O governo precisa parar de misturar ajuste fiscal com bondade. São coisas diferentes. Quando se mistura tudo, a mensagem que fica é de irresponsabilidade, e o mercado reage como reagiu.',
      'Simone Tebet em entrevista à TV Cultura em dezembro de 2024, uma semana após o pacote fiscal do governo ter derrubado o real para a máxima histórica acima de R$ 6,10. A ministra rompeu com o silêncio da equipe econômica para criticar a comunicação.',
      'verified', true, '2024-12-11',
      'https://www.estadao.com.br/politica/tebet-erro-comunicacao-pacote-fiscal-2024/',
      'news_article',
      'São Paulo', 'Entrevista Roda Viva — TV Cultura', 'tebet-erro-comunicacao-pacote-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31. Prates respondendo saída
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_pra,
      'Jean Paul Prates afirma ter sido demitido da Petrobras por "não ceder a pressão" por mais dividendos.',
      'Fui demitido por ter defendido a Petrobras. Fui demitido por não ter cedido à pressão para distribuir mais dividendos a despeito do plano de investimento da empresa. A história vai mostrar que a Petrobras precisava daquele recurso para ser protagonista da transição energética. Não me arrependo de nada.',
      'Jean Paul Prates em entrevista ao UOL em junho de 2024, um mês após sua demissão da presidência da Petrobras. O ex-presidente explicou os bastidores do conflito com o governo e com o então ministro Silveira.',
      'verified', false, '2024-06-18',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2024/06/18/prates-demissao-petrobras-pressao-dividendos.htm',
      'news_article',
      'Rio de Janeiro', 'Entrevista ao UOL', 'prates-demissao-pressao-dividendos-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 32. Mercadante política industrial
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mer,
      'Mercadante defende "política industrial ativa" e diz que mercado não reindustrializa o país sozinho.',
      'Quem diz que o mercado resolve sozinho a reindustrialização está em Marte. Nenhum país do mundo desenvolveu indústria sem Estado forte e banco de desenvolvimento. Essa tese de que política industrial é intervenção é conversa de quem quer que o Brasil continue exportando soja e minério de ferro para comprar tudo pronto de fora.',
      'Aloizio Mercadante em entrevista à Carta Capital em maio de 2024, defendendo o Novo PAC e o plano Nova Indústria Brasil. O presidente do BNDES tornou-se um dos principais articuladores ideológicos da agenda desenvolvimentista no governo Lula 3.',
      'verified', false, '2024-05-06',
      'https://www.cartacapital.com.br/economia/mercadante-politica-industrial-ativa-marte/',
      'news_article',
      'São Paulo', 'Entrevista à Carta Capital', 'mercadante-politica-industrial-ativa-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33. Silveira eleição Petrobras
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_sil,
      'Alexandre Silveira nega interferência em Petrobras e diz que conselho vai decidir "com autonomia".',
      'Não existe interferência do governo na Petrobras. O acionista majoritário é a União, é natural que haja diálogo. O conselho decide com autonomia, dentro das regras das sociedades anônimas. Esse discurso de intervenção é falácia plantada por quem queria a Petrobras privatizada e não conseguiu.',
      'Alexandre Silveira em entrevista à Globonews em maio de 2024, após a demissão de Jean Paul Prates da presidência da Petrobras. O ministro buscou minimizar o impacto sobre governança da estatal, em meio a forte reação negativa do mercado.',
      'verified', false, '2024-05-16',
      'https://g1.globo.com/economia/noticia/2024/05/16/silveira-nega-interferencia-petrobras-autonomia.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'silveira-nega-interferencia-petrobras-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34. FHC crítica
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_fhc,
      'Fernando Henrique Cardoso alerta que "Lula ataca o BC" e afirma que autonomia é conquista democrática.',
      'Preocupa-me quando vejo o presidente atacar publicamente o presidente do Banco Central. A autonomia do BC é uma conquista democrática, não é questão ideológica. Se o Lula não gosta do Campos Neto, paciência, vai terminar o mandato. Democracia é conviver com quem não se escolheu.',
      'Fernando Henrique Cardoso em entrevista à Folha de S.Paulo em junho de 2023, criticando os ataques de Lula ao então presidente do BC Roberto Campos Neto. O ex-presidente raramente se manifesta, mas quando o fez, foi contundente.',
      'verified', false, '2023-06-11',
      'https://www1.folha.uol.com.br/poder/2023/06/fhc-lula-ataca-bc-autonomia-conquista-democratica.shtml',
      'news_article',
      'São Paulo', 'Entrevista à Folha de S.Paulo', 'fhc-lula-ataca-bc-autonomia-junho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35. Pontes crítica economia
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_pon,
      'Marcos Pontes diz que governo Lula "quebrou" o país e critica política econômica de Haddad.',
      'Esse governo quebrou o país em dois anos. A dívida pública explodiu, o dólar nas alturas, os juros subindo, a inflação voltando. O Haddad é um bom professor de filosofia, mas de economia entende tanto quanto eu de balé. A gente deixou um país organizado e eles jogaram tudo fora em troca de bolsa para militante.',
      'Marcos Pontes, senador pelo PL-SP e ex-ministro de Bolsonaro, em entrevista ao canal Pânico da Jovem Pan em janeiro de 2025, atacando a condução da política econômica. O senador explorou a alta do dólar e o pacote fiscal mal recebido pelo mercado.',
      'verified', false, '2025-01-22',
      'https://jovempan.com.br/programas/panico/marcos-pontes-governo-lula-quebrou-pais-haddad.html',
      'news_article',
      'São Paulo', 'Pânico — Jovem Pan', 'pontes-lula-quebrou-pais-haddad-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36. Bolsonaro economia Lula
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_bol,
      'Bolsonaro ataca Haddad por alta do dólar e diz que PT "sempre acaba quebrando o Brasil".',
      'Olha o dólar aí, seis reais. É o PT voltando a ser o PT. Sempre acaba quebrando o Brasil. No meu governo, mesmo em pandemia, a gente segurou a economia. Agora é gastança, é bondade com dinheiro alheio, é amigão do rei no BNDES. O brasileiro vai pagar a conta com comida cara e juros cada vez mais altos.',
      'Jair Bolsonaro em transmissão ao vivo pelas redes sociais em dezembro de 2024, durante a crise cambial e a queda da popularidade do governo. O ex-presidente buscou capitalizar politicamente a turbulência financeira no fim do segundo ano de Lula 3.',
      'verified', false, '2024-12-19',
      'https://www.oantagonista.com.br/brasil/bolsonaro-ataca-haddad-dolar-pt-quebra-brasil-2024/',
      'news_article',
      'Brasília', 'Live nas redes sociais', 'bolsonaro-ataca-haddad-dolar-pt-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37. Haddad responde mercado
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad rebate mercado e diz que especulação contra o real é "aposta política" que vai perder dinheiro.',
      'Essa especulação contra o real é, em parte, aposta política. Tem gente apostando que o governo vai fracassar, não que a economia vá mal. Vão perder dinheiro. O fundamento da economia brasileira é sólido. Quem apostou contra o Brasil nos últimos dois anos, quebrou a cara. Agora vai quebrar de novo.',
      'Fernando Haddad em coletiva em Brasília em dezembro de 2024, durante a disparada do dólar acima de R$ 6,20. A declaração foi criticada por ser vista como endossando tese conspiracionista, mas refletia leitura real do Planalto sobre o ataque ao real.',
      'verified', true, '2024-12-18',
      'https://valor.globo.com/politica/noticia/2024/12/18/haddad-especulacao-real-aposta-politica.ghtml',
      'news_article',
      'Brasília', 'Coletiva — Ministério da Fazenda', 'haddad-especulacao-aposta-politica-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38. Chambriard pressão dividendos 2025
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cha,
      'Magda Chambriard promete dividendos "robustos" aos acionistas da Petrobras em 2025.',
      'A Petrobras vai pagar dividendos robustos em 2025. Entendemos nosso compromisso com acionista majoritário e minoritário. A transição energética não se faz sem gerar caixa, e esse caixa precisa também retornar ao investidor que confia na companhia. Não há contradição entre investir e distribuir resultado.',
      'Magda Chambriard em teleconferência de resultados em março de 2025, após a Petrobras divulgar balanço anual. A declaração foi vista como ajuste de tom em relação à gestão Prates, buscando acalmar acionistas e recuperar valor de mercado.',
      'verified', false, '2025-03-07',
      'https://oglobo.globo.com/economia/noticia/2025/03/chambriard-petrobras-dividendos-robustos-2025.ghtml',
      'news_article',
      'Rio de Janeiro', 'Teleconferência de resultados — Petrobras', 'chambriard-dividendos-robustos-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39. Lula bets 2025
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula afirma que bets estão "comendo o Bolsa Família" e que Brasil virou "refém do jogo".',
      'Tem família que recebe o Bolsa Família e, antes do fim do dia, já perdeu tudo na bets. A gente tá vendo o dinheiro do auxílio virar aposta e desespero. O Brasil virou refém do jogo digital. Isso precisa parar. Ou regulamenta de verdade ou proíbe. Não dá para conviver com isso destruindo lar pobre.',
      'Lula em entrevista a rádios da Amazônia em outubro de 2024, comentando estudo do Banco Central que apontou que bilhões de reais do Bolsa Família tinham sido gastos em apostas on-line. A declaração acelerou a regulamentação do setor.',
      'verified', true, '2024-10-02',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-10/lula-bets-comendo-bolsa-familia-jogo',
      'news_article',
      'Manaus', 'Entrevista a rádios — Amazônia', 'lula-bets-bolsa-familia-jogo-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40. Campos Neto autonomia defensiva
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cam,
      'Campos Neto alerta para "dominância fiscal" e diz que política monetária "sozinha não dá conta".',
      'Estamos chegando num cenário de quase dominância fiscal. A política monetária sozinha não dá conta de controlar a inflação quando o gasto público cresce sem freio. Se o governo não fizer a parte dele, o Banco Central pode subir juros até o fim do mundo que não vai adiantar. Essa é a verdade inconveniente.',
      'Roberto Campos Neto em fórum do Credit Suisse em outubro de 2023, usando o termo técnico "dominância fiscal" para criticar o governo Lula. A fala irritou o Planalto e acelerou a troca de farpas entre o BC e o Executivo.',
      'verified', true, '2023-10-19',
      'https://www1.folha.uol.com.br/mercado/2023/10/campos-neto-dominancia-fiscal-politica-monetaria.shtml',
      'news_article',
      'São Paulo', 'Fórum Credit Suisse', 'campos-neto-dominancia-fiscal-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41. Favaro agro
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_fav,
      'Carlos Fávaro defende plano safra recorde e diz que agro "carrega" a economia brasileira.',
      'O plano safra deste ano é o maior da história, quatrocentos bilhões de reais. É reconhecimento de que o agronegócio carrega a economia brasileira. Enquanto certos setores patinam, o agro entrega safra recorde, superávit na balança comercial e emprego no interior. Sem agro, esse país não se sustentaria.',
      'Carlos Fávaro, ministro da Agricultura, em cerimônia de lançamento do Plano Safra 2024/2025 em Brasília em junho de 2024. O recorde de crédito rural foi apresentado como prova de compromisso do governo Lula com o setor apesar da tensão política.',
      'verified', false, '2024-06-26',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2024-06/favaro-plano-safra-recorde-400-bilhoes',
      'news_article',
      'Brasília', 'Lançamento Plano Safra 2024/2025 — Planalto', 'favaro-plano-safra-400-bilhoes-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42. Tebet desigualdade
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_teb,
      'Tebet diz que "não se faz ajuste fiscal cortando dos pobres" e defende revisão de benefícios a alta renda.',
      'Não se faz ajuste fiscal cortando dos pobres. Quem acha que a solução é apertar quem já tem pouco, não entende nem de economia nem de justiça social. Tem benefício fiscal para quem ganha muito, tem isenção pra setor poderoso, tem jabuti parlamentar. É aí que a gente precisa cortar, não no Bolsa Família.',
      'Simone Tebet em entrevista ao Estadão em agosto de 2024, defendendo a revisão de benefícios tributários que custam mais de R$ 600 bilhões ao ano. A ministra se posicionou contra cortes em programas sociais, num debate interno ao governo.',
      'verified', false, '2024-08-20',
      'https://www.estadao.com.br/economia/tebet-ajuste-fiscal-nao-cortar-pobres-2024/',
      'news_article',
      'Brasília', 'Entrevista ao Estadão', 'tebet-ajuste-nao-cortar-pobres-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43. Lula Galípolo 2025
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula se diz "decepcionado" com Galípolo e afirma que BC continua priorizando mercado financeiro.',
      'Estou decepcionado com o Banco Central. Eu indiquei o Galípolo acreditando que ele ia ter uma visão social da política monetária. Mas o Banco Central continua fazendo política para o mercado financeiro, não para o povo. O Brasil não vai crescer enquanto tiver esse pensamento de rentista dominando a política econômica.',
      'Lula em entrevista ao UOL em maio de 2025, expressando insatisfação com Gabriel Galípolo após quatro meses de gestão no BC. A declaração acabou com a ilusão de que o novo presidente seria dócil e gerou novo estresse com o mercado.',
      'verified', true, '2025-05-07',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2025/05/07/lula-decepcionado-galipolo-bc-mercado-financeiro.htm',
      'news_article',
      'Brasília', 'Entrevista ao UOL', 'lula-decepcionado-galipolo-mercado-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44. Mercadante BNDES Amazônia
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mer,
      'Mercadante anuncia fundo bilionário do BNDES para bioeconomia na Amazônia.',
      'Vamos criar o maior fundo de bioeconomia da história deste país. Dez bilhões de reais para apoiar pequenos produtores, comunidades tradicionais e indústria da floresta em pé. Desmatar deixou de ser viável economicamente. O futuro da Amazônia é gerar valor com a floresta viva, e o BNDES está aqui para financiar esse futuro.',
      'Aloizio Mercadante em cerimônia em Belém em novembro de 2025, às vésperas da COP30, anunciando o Fundo de Bioeconomia do BNDES. O lançamento foi apresentado como marca do compromisso brasileiro com a transição ecológica.',
      'verified', false, '2025-11-08',
      'https://g1.globo.com/economia/agronegocios/noticia/2025/11/08/mercadante-bndes-bioeconomia-10-bilhoes-amazonia.ghtml',
      'news_article',
      'Belém', 'Cerimônia pré-COP30 — BNDES', 'mercadante-bndes-bioeconomia-10-bilhoes-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45. Haddad 2026 campanha
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad afirma que Brasil "sai melhor" do governo Lula 3 e defende continuidade do projeto.',
      'A economia brasileira sai melhor deste governo do que entrou. Mais emprego, menos pobreza, inflação sob controle, reforma tributária aprovada. Claro que falta muito. Mas dizer que esse governo quebrou o Brasil é mentira grosseira. O projeto não pode ser interrompido em 2026. Reverter isso seria jogar o Brasil para trás.',
      'Fernando Haddad em entrevista ao programa Bom Dia Ministro em fevereiro de 2026, já em cenário pré-eleitoral. O ministro defendeu a continuidade do projeto do governo, sinalizando apoio à reeleição de Lula ou candidatura alternativa do PT.',
      'verified', true, '2026-02-09',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2026-02/haddad-brasil-sai-melhor-lula-3-continuidade',
      'news_article',
      'Brasília', 'Bom Dia Ministro — EBC', 'haddad-brasil-sai-melhor-lula3-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46. Galípolo defende nova meta
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_gal,
      'Gabriel Galípolo afirma que o BC "não subordina" decisões a declarações políticas e reforça foco na meta.',
      'O Banco Central não subordina suas decisões a declarações políticas, sejam elas elogiosas ou duras. Decidimos com base em dados, em projeções de inflação e em avaliação de riscos. Quem estiver apostando em BC cativo do governo está fazendo leitura equivocada. Vamos cumprir o mandato até o último dia.',
      'Gabriel Galípolo em evento da Anbima em junho de 2025, em resposta indireta a Lula que havia se declarado "decepcionado" com o BC. A fala foi recebida com alívio pelo mercado e reforçou a credibilidade do novo presidente da instituição.',
      'verified', true, '2025-06-12',
      'https://valor.globo.com/financas/noticia/2025/06/12/galipolo-bc-nao-subordina-declaracoes-politicas.ghtml',
      'news_article',
      'São Paulo', 'Anbima Summit', 'galipolo-nao-subordina-declaracoes-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47. Chambriard refinaria
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_cha,
      'Chambriard anuncia retomada de obras de refinaria paralisada e diz que Petrobras vai "retomar o que foi abandonado".',
      'Vamos retomar o que foi abandonado nos últimos anos. A Refinaria Abreu e Lima, o Comperj, a Premium do Maranhão. O Brasil precisa voltar a refinar seu próprio petróleo, gerar emprego nas regiões, reduzir a dependência de importação. Chega de vender petróleo cru e importar derivado caro.',
      'Magda Chambriard em visita a Pernambuco em agosto de 2024, anunciando a retomada de obras em refinarias paralisadas desde os governos Temer e Bolsonaro. A decisão foi criticada pelo mercado, que considerava os projetos deficitários.',
      'verified', false, '2024-08-15',
      'https://oglobo.globo.com/economia/noticia/2024/08/chambriard-petrobras-retoma-refinarias-abandonadas.ghtml',
      'news_article',
      'Ipojuca', 'Visita — Refinaria Abreu e Lima', 'chambriard-refinarias-retomada-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48. Dweck serviço público 2025
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_dwe,
      'Esther Dweck anuncia maior concurso público federal da história com 8 mil vagas.',
      'Estamos anunciando o maior concurso público federal da história, mais de oito mil vagas em dezenas de carreiras. Depois de anos de desmonte do Estado, o serviço público está voltando a ter gente jovem, qualificada, concursada. Reconstruir o Estado brasileiro é condição para qualquer política pública funcionar.',
      'Esther Dweck em cerimônia em Brasília em março de 2024, anunciando o Concurso Público Nacional Unificado (CPNU), apelidado de "Enem dos concursos". A iniciativa atraiu mais de dois milhões de inscritos e se tornou marca do seu ministério.',
      'verified', false, '2024-03-03',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-03/dweck-concurso-nacional-unificado-8-mil-vagas',
      'news_article',
      'Brasília', 'Lançamento CPNU — Palácio do Planalto', 'dweck-concurso-nacional-unificado-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49. Silveira leilão
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_sil,
      'Alexandre Silveira sai em defesa de leilão da Margem Equatorial contra IBAMA e ONGs.',
      'O Brasil não pode abrir mão de explorar o próprio petróleo. A Margem Equatorial é a nossa maior fronteira. Países vizinhos, com a mesma bacia geológica, estão explorando. Vamos ficar com a brincadeira do licenciamento eterno até descobrirem petróleo do outro lado da fronteira? Isso é tiro no pé do país.',
      'Alexandre Silveira em sessão na Comissão de Minas e Energia da Câmara em setembro de 2024, defendendo a realização do leilão da Foz do Amazonas. A declaração atacou diretamente o IBAMA e aprofundou conflito com Marina Silva.',
      'verified', false, '2024-09-18',
      'https://www.cnnbrasil.com.br/politica/silveira-defende-leilao-margem-equatorial-tiro-no-pe/',
      'news_article',
      'Brasília', 'Comissão de Minas e Energia — Câmara', 'silveira-leilao-margem-equatorial-tiro-no-pe-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 50. Haddad 2026 ataque Tarcísio
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad critica plano econômico de oposição para 2026 e diz que "voltar ao teto de gastos" seria "condenar o Brasil".',
      'A plataforma econômica da oposição é voltar ao teto de gastos, privatizar tudo, acabar com Bolsa Família turbinado. Isso é condenar o Brasil a mais uma década perdida. Pela terceira vez a direita vai tentar vender a velha receita de austeridade como modernidade. O povo brasileiro já percebeu o truque.',
      'Fernando Haddad em discurso em evento do PT em São Paulo em março de 2026, no início oficial do ano eleitoral. O ministro atacou a agenda econômica associada a Tarcísio e ao centrão, defendendo a continuidade do modelo atual.',
      'verified', true, '2026-03-14',
      'https://www.cartacapital.com.br/politica/haddad-ataca-teto-gastos-oposicao-2026/',
      'news_article',
      'São Paulo', 'Ato PT — São Paulo', 'haddad-ataca-teto-gastos-oposicao-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
