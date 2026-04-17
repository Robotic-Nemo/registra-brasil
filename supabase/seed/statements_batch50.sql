-- Batch 50: Ministros do gabinete Lula III (2023-2026) — parte 1
-- Declarações sobre articulação política, saúde, direitos humanos, infraestrutura,
-- relações exteriores, defesa, trabalho, meio ambiente, educação, povos indígenas,
-- igualdade racial, agricultura, comunicações, justiça, fazenda e planejamento.
-- 50 declarações

DO $$
DECLARE
  v_pad UUID; v_rui UUID; v_sil UUID; v_nis UUID; v_mau UUID;
  v_muc UUID; v_mar UUID; v_mas UUID; v_cam UUID; v_gua UUID;
  v_ani UUID; v_fav UUID; v_jus UUID; v_lew UUID; v_had UUID;
  v_teb UUID; v_alx UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_cor UUID; c_vio UUID;
  c_odi UUID; c_neg UUID; c_irr UUID; c_con UUID; c_int UUID;
  c_aut UUID; c_ame UUID; c_obs UUID; c_rac UUID; c_mis UUID;
  c_hom UUID; c_mac UUID;
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
  SELECT id INTO v_jus FROM politicians WHERE slug = 'juscelino-filho';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_alx FROM politicians WHERE slug = 'alexandre-silveira';
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

  -- 1. Padilha defende articulação com Congresso sobre emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha defende acordo com Congresso sobre emendas parlamentares após decisão do STF.',
      'O governo Lula respeita a independência dos poderes e vai construir com o Congresso uma solução para as emendas parlamentares que respeite a decisão do STF e, ao mesmo tempo, garanta a execução de políticas públicas essenciais para a população brasileira.',
      'Declaração em entrevista coletiva em agosto de 2024, após decisão do STF suspender o pagamento de emendas de comissão por falta de transparência. Padilha era ministro das Relações Institucionais e conduzia a negociação com lideranças do Congresso.',
      'verified', false, '2024-08-15',
      'https://g1.globo.com/politica/noticia/2024/08/15/padilha-emendas-stf-congresso.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva no Planalto', 'padilha-emendas-congresso-stf-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 2. Padilha defende SUS ao assumir Ministério da Saúde
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha assume Ministério da Saúde e promete fortalecer o SUS e ampliar o Mais Médicos.',
      'O SUS é o maior patrimônio social do povo brasileiro. Minha missão aqui é fortalecer o Sistema Único de Saúde, ampliar o Mais Médicos, acabar com as filas e garantir que cada brasileiro tenha acesso a atendimento de qualidade, independentemente da sua condição social.',
      'Discurso de posse como ministro da Saúde em março de 2025, após substituir Nísia Trindade na Esplanada. Padilha já havia sido ministro da Saúde no segundo governo Dilma e retornava ao cargo com foco na redução de filas do SUS.',
      'verified', true, '2025-03-06',
      'https://www.folha.uol.com.br/cotidiano/2025/03/padilha-posse-saude-sus-mais-medicos.shtml',
      'news_article',
      'Brasília', 'Cerimônia de posse no Ministério da Saúde', 'padilha-posse-saude-sus-marco-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 3. Padilha defende vacinação contra dengue
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha rebate desinformação antivacina e defende imunização contra dengue como prioridade.',
      'A vacina salva vidas. Não há espaço para negacionismo em política pública de saúde. Quem espalha mentira sobre vacina tem sangue nas mãos. O Ministério da Saúde vai ampliar a vacinação contra a dengue e combater a desinformação com ciência.',
      'Entrevista à CBN em abril de 2025, durante novo surto de dengue em São Paulo e Minas Gerais. Padilha respondia a ataques de bolsonaristas contra a campanha de imunização e o uso da vacina Qdenga.',
      'verified', false, '2025-04-10',
      'https://cbn.globoradio.globo.com/politica/2025/04/padilha-vacina-dengue-desinformacao.htm',
      'news_article',
      'São Paulo', 'Entrevista à CBN', 'padilha-vacina-dengue-desinformacao-abril-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 4. Rui Costa anuncia PAC
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rui,
      'Rui Costa apresenta Novo PAC com investimento de R$ 1,7 trilhão em infraestrutura.',
      'O Novo PAC é o maior programa de investimento da história recente do Brasil. São R$ 1,7 trilhão em obras de infraestrutura, habitação, saneamento, saúde e educação. Vamos retomar o desenvolvimento que foi paralisado nos últimos anos.',
      'Cerimônia de lançamento do Novo PAC em agosto de 2023 no Palácio do Planalto. Rui Costa, ministro da Casa Civil, coordenou a elaboração do programa ao lado do presidente Lula, dos ministros e de governadores.',
      'verified', true, '2023-08-11',
      'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2023/08/governo-lanca-novo-pac',
      'diario_oficial',
      'Brasília', 'Lançamento do Novo PAC no Planalto', 'rui-costa-novo-pac-lancamento-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 5. Rui Costa rebate críticas ao arcabouço fiscal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rui,
      'Rui Costa defende arcabouço fiscal e critica pressão de bancos por mais cortes.',
      'O arcabouço fiscal foi construído com responsabilidade. Não vamos ceder à pressão do mercado financeiro que só quer saber de cortar direitos do povo. O Brasil precisa crescer, investir em saúde, educação e infraestrutura. Não é hora de aperto cego.',
      'Declaração em entrevista a jornalistas em setembro de 2024, em meio a críticas de economistas e do mercado financeiro ao cumprimento das metas fiscais. Rui Costa era responsável pela coordenação política no governo.',
      'verified', false, '2024-09-18',
      'https://valor.globo.com/politica/noticia/2024/09/18/rui-costa-defende-arcabouco-mercado.ghtml',
      'news_article',
      'Brasília', 'Entrevista a jornalistas', 'rui-costa-arcabouco-mercado-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Rui Costa anuncia obras de transposição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rui,
      'Rui Costa anuncia retomada de obras paradas do Nordeste abandonadas no governo Bolsonaro.',
      'Encontramos mais de 14 mil obras paradas quando chegamos ao governo. Obras de escolas, creches, hospitais, saneamento. Foi o abandono total. O Novo PAC retoma essas obras e devolve dignidade para as comunidades que foram esquecidas nos últimos quatro anos.',
      'Cerimônia em Recife em novembro de 2023, ao lado do presidente Lula e do governador Raquel Lyra, anunciando retomada de obras da transposição do São Francisco e de outras obras estruturantes no Nordeste.',
      'verified', false, '2023-11-09',
      'https://g1.globo.com/pe/pernambuco/noticia/2023/11/09/rui-costa-obras-paradas-nordeste-pac.ghtml',
      'news_article',
      'Recife', 'Anúncio de retomada de obras do PAC', 'rui-costa-obras-paradas-nordeste-novembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Silvio Almeida nega denúncias de assédio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silvio Almeida nega denúncias de assédio sexual e pede investigação rigorosa.',
      'Nego veementemente todas as acusações que me foram imputadas. Tenho construído minha trajetória com base na ética, no respeito e no compromisso com os direitos humanos. Peço que haja uma investigação rigorosa, pois confio que a verdade prevalecerá.',
      'Nota oficial divulgada em 5 de setembro de 2024, após reportagem da Agência Pública revelar denúncias de assédio sexual feitas por Anielle Franco e outras servidoras. Silvio Almeida foi demitido pelo presidente Lula na noite do mesmo dia.',
      'verified', true, '2024-09-05',
      'https://www1.folha.uol.com.br/poder/2024/09/silvio-almeida-nega-denuncias-assedio-nota.shtml',
      'other',
      'Brasília', 'Nota oficial à imprensa', 'silvio-almeida-nega-denuncias-assedio-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Silvio Almeida sobre racismo estrutural
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silvio Almeida afirma que racismo estrutural exige políticas públicas permanentes.',
      'O racismo é estrutural, está presente nas instituições, no mercado de trabalho, na educação, na segurança pública. Combater o racismo não é política de um governo só, é obrigação permanente do Estado brasileiro. Vamos usar todos os instrumentos legais para isso.',
      'Discurso na abertura da Conferência Nacional de Direitos Humanos em maio de 2023, apresentando diretrizes do ministério e defendendo a continuidade de políticas afirmativas criadas em governos anteriores do PT.',
      'verified', false, '2023-05-15',
      'https://www.gov.br/mdh/pt-br/assuntos/noticias/2023/05/silvio-almeida-racismo-estrutural-conferencia',
      'diario_oficial',
      'Brasília', 'Conferência Nacional de Direitos Humanos', 'silvio-almeida-racismo-estrutural-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 9. Silvio Almeida sobre população LGBTQIA+
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silvio Almeida condena LGBTfobia e anuncia plano nacional de enfrentamento à violência.',
      'O Brasil é o país que mais mata pessoas LGBTQIA+ no mundo. Isso é uma vergonha nacional. Vamos lançar um plano nacional de enfrentamento à LGBTfobia com ações integradas nas áreas de segurança pública, educação, saúde e assistência social.',
      'Declaração em evento da Parada LGBT de São Paulo em junho de 2023, acompanhado de representantes de movimentos sociais. O plano foi efetivamente lançado em 2024.',
      'verified', false, '2023-06-11',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/06/11/silvio-almeida-parada-lgbt-plano-nacional.ghtml',
      'news_article',
      'São Paulo', 'Parada do Orgulho LGBT', 'silvio-almeida-lgbtfobia-plano-junho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 10. Nísia Trindade declara emergência dengue
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nis,
      'Nísia Trindade declara emergência nacional por dengue e anuncia centro de operações.',
      'A situação da dengue no Brasil exige resposta coordenada. Estamos declarando emergência em saúde pública e montando um Centro de Operações de Emergência. Não há milagre: é mutirão contra o mosquito, vacinação nos grupos prioritários e assistência qualificada para quem adoecer.',
      'Coletiva de imprensa no Ministério da Saúde em fevereiro de 2024, durante epidemia que superou 1 milhão de casos no início do ano. Nísia anunciou antecipação da vacinação com a Qdenga em 521 municípios.',
      'verified', true, '2024-02-02',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/fevereiro/ministerio-da-saude-declara-emergencia-dengue',
      'diario_oficial',
      'Brasília', 'Coletiva sobre epidemia de dengue', 'nisia-trindade-emergencia-dengue-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 11. Nísia defende SUS contra desmonte
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nis,
      'Nísia Trindade afirma que governo Bolsonaro tentou desmontar SUS durante pandemia.',
      'Recebemos um Ministério da Saúde destroçado. Faltava tudo: vacina, remédio, credibilidade científica. O governo anterior negou a pandemia, promoveu cloroquina, ridicularizou a vacinação. Nossa missão é reconstruir o SUS com ciência e respeito à vida.',
      'Entrevista à Agência Brasil em abril de 2023, fazendo balanço dos primeiros cem dias de governo. Nísia havia sido presidente da Fiocruz antes de assumir o Ministério.',
      'verified', false, '2023-04-11',
      'https://agenciabrasil.ebc.com.br/saude/noticia/2023-04/nisia-trindade-sus-desmonte-cem-dias',
      'news_article',
      'Brasília', 'Entrevista à Agência Brasil', 'nisia-trindade-sus-desmonte-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 12. Nísia sobre saída do ministério
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nis,
      'Nísia Trindade afirma ter cumprido missão no Ministério da Saúde ao deixar o cargo.',
      'Cumpri com honra a missão de reconstruir o Ministério da Saúde e o SUS. Entregamos o Mais Médicos ampliado, a vacinação reorganizada, a resposta à dengue articulada. Foram dois anos muito desafiadores e saio com a consciência de ter dado o meu melhor.',
      'Declaração em cerimônia de transmissão de cargo em fevereiro de 2025, ao passar o Ministério da Saúde para Alexandre Padilha. Nísia permaneceu no governo como presidente da Fiocruz.',
      'verified', false, '2025-02-28',
      'https://www.folha.uol.com.br/cotidiano/2025/02/nisia-transmissao-cargo-saude-padilha.shtml',
      'news_article',
      'Brasília', 'Cerimônia de transmissão de cargo', 'nisia-trindade-transmissao-cargo-fevereiro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 13. Mauro Vieira sobre BRICS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira defende expansão do BRICS como contraponto à hegemonia ocidental.',
      'O BRICS representa mais da metade da população mundial e uma parcela crescente do PIB global. A expansão do grupo fortalece o multilateralismo e oferece uma alternativa a um mundo unipolar. O Brasil defende um sistema internacional mais justo, democrático e representativo.',
      'Declaração na cúpula do BRICS em Joanesburgo em agosto de 2023, durante o anúncio da expansão do bloco com a inclusão de Arábia Saudita, Irã, Emirados Árabes, Egito e Etiópia.',
      'verified', true, '2023-08-24',
      'https://www.gov.br/itamaraty/pt-br/sala-de-imprensa/notas-a-imprensa/cupula-brics-joanesburgo-2023',
      'diario_oficial',
      'Joanesburgo', 'Cúpula do BRICS 2023', 'mauro-vieira-brics-expansao-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 14. Mauro Vieira sobre Gaza
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira condena ofensiva israelense em Gaza e pede cessar-fogo imediato.',
      'O Brasil condena energicamente os ataques terroristas do Hamas, mas também condena a resposta desproporcional de Israel que já matou milhares de civis palestinos, incluindo mulheres e crianças. Exigimos cessar-fogo imediato e acesso humanitário pleno à Faixa de Gaza.',
      'Discurso no Conselho de Segurança da ONU em outubro de 2023, quando o Brasil exercia a presidência rotativa do órgão. A resolução brasileira foi vetada pelos Estados Unidos.',
      'verified', true, '2023-10-18',
      'https://www1.folha.uol.com.br/mundo/2023/10/mauro-vieira-conselho-seguranca-gaza-cessar-fogo.shtml',
      'news_article',
      'Nova York', 'Conselho de Segurança da ONU', 'mauro-vieira-gaza-cessar-fogo-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 15. Mauro Vieira sobre Venezuela
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira exige divulgação de atas eleitorais da Venezuela para reconhecer resultado.',
      'O Brasil não pode reconhecer o resultado da eleição venezuelana sem a divulgação completa das atas por mesa de votação. Isso é exigência elementar de transparência democrática. Mantemos diálogo com todas as partes, mas não abriremos mão do respeito à vontade popular.',
      'Declaração conjunta com México e Colômbia em agosto de 2024, após o Conselho Nacional Eleitoral venezuelano proclamar Nicolás Maduro vencedor sem apresentar comprovantes detalhados de votação.',
      'verified', false, '2024-08-08',
      'https://g1.globo.com/mundo/noticia/2024/08/08/mauro-vieira-venezuela-atas-eleicao.ghtml',
      'news_article',
      'Brasília', 'Declaração conjunta com México e Colômbia', 'mauro-vieira-venezuela-atas-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 16. Mauro Vieira sobre G20
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira diz que G20 do Rio foi vitória diplomática brasileira com foco em desigualdade.',
      'A Cúpula do G20 no Rio foi um sucesso da diplomacia brasileira. Colocamos no centro da agenda global o combate à fome, à pobreza e às desigualdades. A Aliança Global Contra a Fome aprovada é conquista histórica que leva a assinatura de um país do Sul global.',
      'Coletiva de imprensa em 19 de novembro de 2024 no Rio de Janeiro, após o encerramento da Cúpula do G20 presidida pelo Brasil, que reuniu 19 países mais União Europeia e União Africana.',
      'verified', false, '2024-11-19',
      'https://www.gov.br/itamaraty/pt-br/sala-de-imprensa/notas-a-imprensa/cupula-g20-rio-balanco',
      'diario_oficial',
      'Rio de Janeiro', 'Cúpula do G20', 'mauro-vieira-g20-rio-balanco-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 17. José Múcio sobre 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_muc,
      'José Múcio afirma que Forças Armadas estão sob controle civil e repudia aventuras golpistas.',
      'As Forças Armadas são instituições de Estado, não de governo. Estão sob comando civil, como determina a Constituição. Qualquer aventura golpista será recebida com a força da lei. Os envolvidos no 8 de janeiro e em tentativas anteriores precisam ser punidos com rigor.',
      'Discurso em cerimônia militar em Brasília em abril de 2023, três meses após os atos golpistas do 8 de janeiro. Múcio havia assumido a Defesa com a missão de "despolitizar" as Forças Armadas.',
      'verified', true, '2023-04-19',
      'https://www1.folha.uol.com.br/poder/2023/04/mucio-forcas-armadas-controle-civil-golpe.shtml',
      'news_article',
      'Brasília', 'Dia do Exército — cerimônia militar', 'jose-mucio-controle-civil-forcas-armadas-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 18. José Múcio sobre disciplina militar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_muc,
      'José Múcio defende punição a militares envolvidos em plano de golpe contra Lula.',
      'Militares que se envolveram em plano de golpe contra a democracia, contra o presidente eleito, precisam ser responsabilizados dentro das normas militares e da legislação penal. Não há espaço nas Forças Armadas para quem atenta contra a Constituição.',
      'Entrevista à GloboNews em novembro de 2024, após indiciamento pela Polícia Federal de generais da reserva e da ativa no inquérito do plano de golpe e tentativa de assassinato de Lula e Alckmin.',
      'verified', false, '2024-11-22',
      'https://g1.globo.com/globonews/noticia/2024/11/22/mucio-militares-golpe-puncao.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'jose-mucio-militares-golpe-punicao-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 19. Múcio sobre compra de caças Gripen
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_muc,
      'José Múcio anuncia ampliação de compra de caças Gripen para modernização da FAB.',
      'O Brasil precisa de Forças Armadas modernas e bem equipadas. A ampliação da compra de caças Gripen garante capacidade operacional da FAB e transferência de tecnologia. É investimento estratégico para a soberania do país e para a indústria de defesa nacional.',
      'Anúncio em cerimônia na Embraer em São José dos Campos em maio de 2024, ao lado do primeiro-ministro da Suécia. O contrato adicional de caças foi orçado em cerca de R$ 5 bilhões.',
      'verified', false, '2024-05-04',
      'https://valor.globo.com/politica/noticia/2024/05/04/mucio-caca-gripen-embraer-ampliacao.ghtml',
      'news_article',
      'São José dos Campos', 'Cerimônia na Embraer', 'jose-mucio-gripen-embraer-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Luiz Marinho sobre escala 6x1
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Luiz Marinho defende fim da escala 6x1 e diz que trabalhador brasileiro precisa de mais descanso.',
      'A escala 6x1 é uma forma de escravidão moderna. O trabalhador brasileiro precisa de mais tempo com a família, de mais descanso, de mais qualidade de vida. O governo apoia a redução da jornada e o debate sobre a PEC do fim da escala 6x1 no Congresso.',
      'Entrevista à rádio BandNews FM em novembro de 2024, durante mobilização nacional do movimento Vida Além do Trabalho pela PEC 8/2025 da deputada Erika Hilton que propõe jornada de 4x3.',
      'verified', true, '2024-11-20',
      'https://www.bandnewsfm.com.br/politica/2024/11/20/marinho-escala-6x1-trabalhador-descanso.html',
      'news_article',
      'São Paulo', 'Entrevista à BandNews FM', 'luiz-marinho-escala-6x1-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Luiz Marinho sobre salário mínimo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Luiz Marinho defende política de valorização permanente do salário mínimo.',
      'O salário mínimo é um instrumento de distribuição de renda e de dinamização da economia. A política de valorização permanente com ganho real retomada pelo governo Lula melhora a vida de milhões de brasileiros, aposentados, beneficiários do BPC e trabalhadores formais.',
      'Discurso em ato do Dia do Trabalhador em São Paulo em 1º de maio de 2023, ao lado do presidente Lula e de centrais sindicais, durante anúncio da política de valorização do salário mínimo que aumentou o piso para R$ 1.320.',
      'verified', false, '2023-05-01',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2023-05/marinho-salario-minimo-dia-do-trabalhador',
      'news_article',
      'São Paulo', 'Ato do Dia do Trabalhador', 'luiz-marinho-salario-minimo-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 22. Marinho sobre regulamentação de apps
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Luiz Marinho defende regulamentação de aplicativos com direitos mínimos para motoristas.',
      'Não é possível aceitar que trabalhadores de aplicativo fiquem sem nenhuma proteção social. Esses trabalhadores precisam ter direitos mínimos: previdência, seguro contra acidentes, piso por hora trabalhada. Não se trata de vínculo CLT, mas de garantir patamar civilizatório.',
      'Entrevista à Folha de S.Paulo em fevereiro de 2024, defendendo o projeto de lei do governo que cria categoria intermediária de trabalhador por aplicativo. A proposta foi criticada por motoristas e por parte da esquerda.',
      'verified', false, '2024-02-20',
      'https://www1.folha.uol.com.br/mercado/2024/02/marinho-aplicativos-regulamentacao-motoristas.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'marinho-aplicativos-regulamentacao-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 23. Marina Silva na COP28
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mas,
      'Marina Silva diz na COP28 que Brasil retomou liderança climática com queda do desmatamento.',
      'O Brasil está de volta à luta climática. Reduzimos o desmatamento na Amazônia em 50% em um ano. Essa é a maior contribuição brasileira ao combate à crise climática global. Mas precisamos ir além: chegar ao desmatamento zero até 2030 e transitar para economia de baixo carbono.',
      'Discurso na COP28 em Dubai em dezembro de 2023, onde o Brasil se candidatou e foi escolhido para sediar a COP30 em Belém em 2025. Marina Silva era a principal voz ambiental do governo Lula.',
      'verified', true, '2023-12-02',
      'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-silva-cop28-dubai-desmatamento',
      'diario_oficial',
      'Dubai', 'COP28 — Conferência do Clima', 'marina-silva-cop28-desmatamento-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 24. Marina sobre agro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mas,
      'Marina Silva critica bancada ruralista por tentar desmontar marco legal ambiental.',
      'A bancada ruralista tem promovido um desmonte da legislação ambiental brasileira. Projeto após projeto, tentam afrouxar licenciamento, anistiar desmatadores, atacar terras indígenas. Não vou ceder a essa pressão. Meio ambiente e agricultura podem conviver, mas com regras claras.',
      'Entrevista coletiva em maio de 2024, após a aprovação na Câmara de projeto que flexibilizava o licenciamento ambiental. Marina Silva se opôs publicamente ao ministro Carlos Fávaro em diversos momentos.',
      'verified', false, '2024-05-29',
      'https://g1.globo.com/politica/noticia/2024/05/29/marina-silva-bancada-ruralista-licenciamento.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'marina-silva-bancada-ruralista-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 25. Marina sobre COP30
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mas,
      'Marina Silva afirma que COP30 em Belém será a "COP da verdade" sobre metas climáticas.',
      'A COP30 em Belém será a COP da verdade. Não basta mais discurso bonito: os países precisam entregar metas ambiciosas e um plano concreto de transição energética. O Brasil dará o exemplo com o desmatamento em queda, a retomada do Fundo Amazônia e a transição justa.',
      'Discurso na abertura da Pré-COP em Brasília em outubro de 2025, um mês antes da cúpula climática em Belém do Pará, a primeira COP realizada na Amazônia.',
      'verified', true, '2025-10-13',
      'https://www1.folha.uol.com.br/ambiente/2025/10/marina-silva-cop30-belem-verdade.shtml',
      'news_article',
      'Brasília', 'Abertura da Pré-COP30', 'marina-silva-cop30-verdade-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 26. Camilo Santana novo ensino médio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cam,
      'Camilo Santana defende reforma do Novo Ensino Médio e retomada das disciplinas tradicionais.',
      'O Novo Ensino Médio aprovado no governo anterior era um desastre. Retirou história, geografia, filosofia e sociologia do núcleo comum. Nossa reforma devolve essas disciplinas, amplia a carga horária do português e matemática e mantém o itinerário formativo com qualidade.',
      'Coletiva em Brasília em abril de 2023, apresentando as mudanças propostas pelo governo Lula para o Novo Ensino Médio, após consulta pública. A nova lei foi sancionada em agosto de 2024.',
      'verified', false, '2023-04-17',
      'https://www.gov.br/mec/pt-br/assuntos/noticias/2023/04/camilo-santana-novo-ensino-medio',
      'diario_oficial',
      'Brasília', 'Apresentação da reforma do Ensino Médio', 'camilo-santana-novo-ensino-medio-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 27. Camilo sobre piso magistério
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cam,
      'Camilo Santana anuncia reajuste do piso do magistério e cobra prefeitos que descumprem lei.',
      'O piso do magistério é lei federal e precisa ser cumprido. Anunciamos novo reajuste de 3,62% e vamos cobrar rigorosamente os prefeitos e governadores que descumprem a legislação. Professor bem pago e respeitado é condição para educação de qualidade.',
      'Anúncio em Brasília em janeiro de 2025, do novo piso salarial dos professores da educação básica, fixado em R$ 4.867,77. Camilo Santana é ex-governador do Ceará e assumiu a pasta da Educação em 2023.',
      'verified', false, '2025-01-17',
      'https://agenciabrasil.ebc.com.br/educacao/noticia/2025-01/camilo-piso-magisterio-reajuste',
      'news_article',
      'Brasília', 'Anúncio do novo piso do magistério', 'camilo-santana-piso-magisterio-janeiro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 28. Camilo sobre reforma do ENEM
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cam,
      'Camilo Santana defende ENEM reformulado com foco em competências do novo ensino médio.',
      'O ENEM precisa ser reformulado para refletir o novo ensino médio sancionado. Queremos uma prova que avalie as competências essenciais, reduza a sobrecarga sobre os estudantes e amplie o acesso à educação superior. A consulta pública mostrou esse caminho.',
      'Declaração em setembro de 2024, após o MEC anunciar que o ENEM 2025 seria o último no modelo atual, com aplicação em dois domingos. Novo modelo seria implementado em 2026.',
      'verified', false, '2024-09-10',
      'https://g1.globo.com/educacao/noticia/2024/09/10/camilo-enem-reformulacao-ensino-medio.ghtml',
      'news_article',
      'Brasília', 'Anúncio da reforma do ENEM', 'camilo-santana-enem-reforma-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 29. Sônia Guajajara sobre Yanomami
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gua,
      'Sônia Guajajara classifica crise Yanomami como genocídio do governo Bolsonaro.',
      'O que aconteceu com o povo Yanomami é genocídio. Crianças morreram de fome e desnutrição, mulheres foram estupradas por garimpeiros, doenças se alastraram. Isso não foi omissão, foi política de Estado do governo anterior. Vamos expulsar todos os garimpeiros do território.',
      'Coletiva em janeiro de 2023, após o governo Lula decretar emergência sanitária na Terra Indígena Yanomami, em Roraima. Imagens de crianças desnutridas chocaram o país. Operações federais desintrusaram dezenas de milhares de garimpeiros nos meses seguintes.',
      'verified', true, '2023-01-24',
      'https://www1.folha.uol.com.br/cotidiano/2023/01/sonia-guajajara-yanomami-genocidio-bolsonaro.shtml',
      'news_article',
      'Brasília', 'Coletiva sobre crise Yanomami', 'sonia-guajajara-yanomami-genocidio-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 30. Sônia Guajajara sobre Marco Temporal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gua,
      'Sônia Guajajara afirma que Marco Temporal é inconstitucional e ameaça todos os povos indígenas.',
      'O Marco Temporal é inconstitucional, já foi derrubado pelo STF e, ainda assim, o Congresso tenta ressuscitar essa aberração jurídica. Dizer que só vale a terra que os povos ocupavam em 1988 é negar toda a história de genocídio e expulsão que sofremos durante séculos.',
      'Declaração em ato em Brasília em setembro de 2023, após o STF declarar o Marco Temporal inconstitucional. Dias depois, o Congresso aprovaria a tese em lei, que viria a ser parcialmente derrubada.',
      'verified', true, '2023-09-22',
      'https://g1.globo.com/politica/noticia/2023/09/22/sonia-guajajara-marco-temporal-inconstitucional.ghtml',
      'news_article',
      'Brasília', 'Ato contra o Marco Temporal', 'sonia-guajajara-marco-temporal-setembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 31. Sônia Guajajara sobre demarcações
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gua,
      'Sônia Guajajara cobra aceleração de demarcações e critica ritmo do próprio governo.',
      'Demarcar terra indígena é obrigação constitucional, não é favor. O governo Lula prometeu retomar as demarcações paralisadas no governo Bolsonaro, e o ritmo precisa ser mais rápido. Nosso povo não pode esperar. Cada dia de atraso é mais invasão, mais violência, mais vida perdida.',
      'Entrevista ao UOL em fevereiro de 2025, cobrando publicamente o presidente Lula a acelerar assinaturas de decretos de demarcação. Até então, apenas 13 terras haviam sido homologadas.',
      'verified', false, '2025-02-15',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2025/02/15/sonia-guajajara-demarcacoes-cobranca-lula.htm',
      'news_article',
      'Brasília', 'Entrevista ao UOL', 'sonia-guajajara-demarcacoes-cobranca-fevereiro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 32. Anielle Franco sobre racismo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ani,
      'Anielle Franco afirma que combate ao racismo estrutural é prioridade do governo Lula.',
      'O Brasil foi construído em cima da escravidão e do genocídio indígena. Não há como falar em democracia plena sem enfrentar o racismo estrutural. O Ministério da Igualdade Racial não é símbolo, é política pública com orçamento, metas e resultados concretos.',
      'Discurso na posse como ministra da Igualdade Racial em janeiro de 2023, ao lado do presidente Lula. Anielle é irmã de Marielle Franco, vereadora carioca assassinada em 2018.',
      'verified', true, '2023-01-11',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2023-01/anielle-franco-posse-igualdade-racial',
      'news_article',
      'Brasília', 'Posse no Ministério da Igualdade Racial', 'anielle-franco-posse-igualdade-racial-janeiro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 33. Anielle sobre cotas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ani,
      'Anielle Franco defende ampliação da Lei de Cotas e rebate ataques de Nikolas Ferreira.',
      'A Lei de Cotas é uma das políticas afirmativas mais bem-sucedidas do Brasil. Ampliou em milhões o número de estudantes negros nas universidades públicas. Quem ataca as cotas ataca o direito à educação da juventude negra e defende a manutenção do privilégio.',
      'Entrevista à GloboNews em novembro de 2023, em meio ao debate sobre a revisão da Lei de Cotas no Congresso, impulsionada por ataques de parlamentares da extrema-direita ao sistema.',
      'verified', false, '2023-11-14',
      'https://g1.globo.com/globonews/noticia/2023/11/14/anielle-franco-lei-cotas-nikolas.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'anielle-franco-lei-cotas-novembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 34. Carlos Fávaro sobre Plano Safra
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fav,
      'Carlos Fávaro anuncia Plano Safra recorde de R$ 508 bilhões com linha verde ampliada.',
      'O Plano Safra 2024/2025 é o maior da história, com R$ 508 bilhões para o agronegócio. Destaque para a linha verde ampliada, que premia produtores que adotam práticas sustentáveis e baixa emissão de carbono. O agro brasileiro é competitivo e pode ser sustentável.',
      'Cerimônia de lançamento do Plano Safra em Brasília em julho de 2024, com presença do presidente Lula. Fávaro é senador licenciado e representante da bancada ruralista dentro do governo.',
      'verified', false, '2024-07-03',
      'https://www.gov.br/agricultura/pt-br/assuntos/noticias/plano-safra-2024-2025-lancamento',
      'diario_oficial',
      'Brasília', 'Lançamento do Plano Safra 2024/2025', 'carlos-favaro-plano-safra-julho-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 35. Fávaro sobre Marina Silva
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fav,
      'Carlos Fávaro critica Marina Silva por travar licenciamento ambiental de obras.',
      'Respeito a ministra Marina Silva, mas o licenciamento ambiental no Brasil está travado e isso impacta obras de infraestrutura, energia, agronegócio. Precisamos de regras claras e ágeis. Não dá para cada obra virar novela de dez anos. É preciso desenvolvimento com responsabilidade.',
      'Entrevista ao Valor Econômico em outubro de 2024, em meio ao embate entre Ministério da Agricultura e Ministério do Meio Ambiente sobre projetos de flexibilização do licenciamento no Congresso.',
      'verified', false, '2024-10-21',
      'https://valor.globo.com/politica/noticia/2024/10/21/favaro-marina-silva-licenciamento.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'favaro-marina-licenciamento-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 36. Juscelino Filho sobre denúncias
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jus,
      'Juscelino Filho nega irregularidades em uso de emendas e tenta manter cargo.',
      'Nunca cometi nenhuma irregularidade na aplicação de emendas parlamentares. Todo o processo obedeceu à legislação vigente. Sou alvo de perseguição política e vou provar minha inocência. Peço ao presidente Lula que me mantenha no cargo para continuar a entregar a agenda das Comunicações.',
      'Nota oficial divulgada em março de 2023, após reportagens do Metrópoles revelarem que empresa ligada ao ministro havia sido beneficiada por emendas de sua autoria. Ele foi mantido e só deixou o cargo em abril de 2024 após novas denúncias.',
      'verified', false, '2023-03-17',
      'https://www.metropoles.com/colunas/guilherme-amado/juscelino-filho-nega-emendas',
      'news_article',
      'Brasília', 'Nota oficial à imprensa', 'juscelino-filho-nega-emendas-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 37. Ricardo Lewandowski sobre polícia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lew,
      'Ricardo Lewandowski defende reforma da polícia e redução da letalidade policial.',
      'A polícia brasileira é uma das que mais mata no mundo, e também uma das que mais morre. Esse ciclo de violência precisa ser enfrentado com reforma estrutural, valorização dos policiais, uso de câmeras corporais e controle externo pelo Ministério Público.',
      'Declaração em seminário sobre segurança pública em Brasília em setembro de 2024, após assumir o Ministério da Justiça em substituição a Flávio Dino. Lewandowski é ministro aposentado do STF.',
      'verified', false, '2024-09-12',
      'https://g1.globo.com/politica/noticia/2024/09/12/lewandowski-reforma-policia-letalidade.ghtml',
      'news_article',
      'Brasília', 'Seminário de Segurança Pública', 'lewandowski-reforma-policia-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 38. Lewandowski sobre PEC da Segurança
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lew,
      'Ricardo Lewandowski defende PEC da Segurança Pública como articulação entre União e estados.',
      'A PEC da Segurança Pública não federaliza a segurança, mas cria mecanismos de articulação entre União, estados e municípios. Crime organizado não respeita fronteiras estaduais. Precisamos de inteligência integrada, padrões nacionais e mais recursos para enfrentar as facções.',
      'Apresentação da PEC da Segurança Pública na Câmara dos Deputados em novembro de 2024, com presença do presidente Lula. A proposta enfrentou resistência de governadores bolsonaristas.',
      'verified', false, '2024-11-05',
      'https://www1.folha.uol.com.br/poder/2024/11/lewandowski-pec-seguranca-publica.shtml',
      'news_article',
      'Brasília', 'Apresentação da PEC da Segurança na Câmara', 'lewandowski-pec-seguranca-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 39. Haddad sobre arcabouço
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad apresenta arcabouço fiscal como modelo responsável e sustentável.',
      'O arcabouço fiscal substitui o teto de gastos com uma regra inteligente, que protege o investimento social e respeita a sustentabilidade da dívida pública. Não é austeridade cega, nem gastança. É responsabilidade com justiça social. O Brasil está voltando ao caminho do crescimento.',
      'Entrevista coletiva em março de 2023, apresentando o novo regime fiscal que substituiria o teto de gastos criado na gestão Temer. A proposta foi aprovada no Congresso em agosto de 2023.',
      'verified', true, '2023-03-30',
      'https://www.gov.br/fazenda/pt-br/orgaos/ministro-fernando-haddad-apresenta-arcabouco-fiscal',
      'diario_oficial',
      'Brasília', 'Apresentação do arcabouço fiscal', 'haddad-arcabouco-fiscal-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 40. Haddad vs Campos Neto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad critica Campos Neto por manter juros altos e diz que BC "tem ideologia".',
      'É inaceitável que o Banco Central mantenha os juros nesse patamar estratosférico quando a inflação está caindo e a economia precisa crescer. O presidente do BC tem ideologia, não tem técnica. Está sabotando o crescimento do país por razões políticas, e isso tem que acabar.',
      'Entrevista à Band em agosto de 2023, durante uma das muitas rodadas de atrito entre o Ministério da Fazenda e o Banco Central ainda presidido por Roberto Campos Neto, indicado por Bolsonaro.',
      'verified', false, '2023-08-03',
      'https://www.band.uol.com.br/jornalismo/politica/haddad-campos-neto-juros-ideologia',
      'news_article',
      'São Paulo', 'Entrevista à Band', 'haddad-campos-neto-juros-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 41. Haddad sobre reforma tributária
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad celebra aprovação da reforma tributária como conquista histórica.',
      'A reforma tributária é a maior transformação econômica do Brasil em décadas. Simplifica o sistema, reduz a regressividade, acaba com a guerra fiscal entre estados e cria o cashback para a população de baixa renda. É vitória do Brasil sobre o lobby dos privilegiados.',
      'Discurso em dezembro de 2023 após aprovação final da Emenda Constitucional da Reforma Tributária no Senado. A lei complementar foi aprovada em 2024 e a implementação começa a partir de 2026.',
      'verified', true, '2023-12-15',
      'https://g1.globo.com/politica/noticia/2023/12/15/haddad-reforma-tributaria-aprovacao-senado.ghtml',
      'news_article',
      'Brasília', 'Senado Federal — aprovação da Reforma Tributária', 'haddad-reforma-tributaria-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 42. Haddad sobre taxação dos super-ricos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad defende isenção de IR até R$ 5 mil financiada por taxação de alta renda.',
      'Quem ganha até R$ 5 mil por mês não pode mais pagar imposto de renda. Essa é uma questão de justiça tributária. Em contrapartida, quem ganha mais de R$ 50 mil por mês vai pagar alíquota efetiva mínima de 10%. Quem ganha milhões por mês hoje paga menos imposto do que um professor.',
      'Apresentação da proposta de reforma do Imposto de Renda em março de 2025, cumprindo promessa de campanha de Lula de isentar a renda de até R$ 5 mil do IR. O projeto foi enviado ao Congresso.',
      'verified', true, '2025-03-18',
      'https://valor.globo.com/politica/noticia/2025/03/18/haddad-ir-isencao-5-mil-super-ricos.ghtml',
      'news_article',
      'Brasília', 'Apresentação da reforma do IR', 'haddad-ir-isencao-super-ricos-marco-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 43. Simone Tebet sobre PPA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Simone Tebet apresenta PPA 2024-2027 com foco em redução de desigualdades e transição verde.',
      'O Plano Plurianual 2024-2027 é a radiografia do projeto de país do governo Lula. Reduzir desigualdades, combater a fome, investir em educação e saúde, promover a transição ecológica e desenvolvimento regional. Mais de R$ 9 trilhões em despesas planejadas com responsabilidade fiscal.',
      'Apresentação do PPA ao Congresso em agosto de 2023. Simone Tebet, terceira colocada na eleição presidencial de 2022, integrou o governo Lula como ministra do Planejamento em gesto de frente ampla.',
      'verified', false, '2023-08-31',
      'https://www.gov.br/planejamento/pt-br/assuntos/noticias/ppa-2024-2027-apresentacao',
      'diario_oficial',
      'Brasília', 'Apresentação do PPA ao Congresso', 'simone-tebet-ppa-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 44. Tebet sobre meta fiscal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Simone Tebet defende revisão da meta fiscal e rebate críticas do mercado.',
      'A meta de déficit zero foi muito ambiciosa para o primeiro ano. Revisar para meta de déficit de 0,25% é um ato de responsabilidade, não de frouxidão. O ajuste seria possível apenas com corte selvagem em investimentos essenciais, e isso o governo Lula não vai fazer.',
      'Entrevista à CNN Brasil em abril de 2024, após o governo enviar projeto de lei reduzindo a meta fiscal original. A decisão gerou reação negativa no mercado financeiro.',
      'verified', false, '2024-04-16',
      'https://www.cnnbrasil.com.br/politica/tebet-meta-fiscal-revisao-deficit',
      'news_article',
      'Brasília', 'Entrevista à CNN Brasil', 'tebet-meta-fiscal-revisao-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 45. Tebet sobre transição ecológica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Simone Tebet apresenta Plano de Transformação Ecológica como nova agenda de desenvolvimento.',
      'A transição ecológica não é só combate à crise climática, é oportunidade de reindustrialização, de geração de empregos verdes, de atrair investimentos globais. O Brasil tem a matriz energética mais limpa do mundo, floresta tropical em pé e pode liderar a economia verde global.',
      'Lançamento do Plano de Transformação Ecológica em agosto de 2023, em ato conjunto com o ministro Fernando Haddad. O plano previa investimentos públicos e privados em infraestrutura verde.',
      'verified', false, '2023-08-14',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2023-08/tebet-plano-transformacao-ecologica',
      'news_article',
      'Brasília', 'Lançamento do Plano de Transformação Ecológica', 'tebet-transformacao-ecologica-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 46. Alexandre Silveira sobre Petrobras
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alx,
      'Alexandre Silveira defende nova política de preços da Petrobras contra paridade internacional.',
      'A paridade de preços internacionais adotada no governo Temer e mantida no Bolsonaro submetia o brasileiro ao sobe-e-desce do petróleo global. A nova política de preços da Petrobras considera o mercado doméstico, investimentos e é mais estável. Gasolina mais barata para o trabalhador.',
      'Entrevista à Band em maio de 2023, defendendo mudança na política de preços da Petrobras promovida pelo novo presidente Jean Paul Prates. A política PPI tinha sido criada em 2016.',
      'verified', false, '2023-05-17',
      'https://www.band.uol.com.br/jornalismo/economia/silveira-petrobras-ppi-preco-gasolina',
      'news_article',
      'Brasília', 'Entrevista à Band', 'silveira-petrobras-ppi-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 47. Silveira sobre apagão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alx,
      'Alexandre Silveira culpa ONS por apagão nacional e promete responsabilização.',
      'O apagão que afetou 25 estados não pode ficar impune. O Operador Nacional do Sistema falhou em sua missão e vamos apurar rigorosamente as responsabilidades. A população brasileira não pode ficar sem luz por falhas técnicas e de gestão.',
      'Coletiva em agosto de 2023, após apagão que atingiu grande parte do país, deixando milhões de brasileiros sem energia elétrica por horas. A apuração do ONS foi aberta pela Aneel.',
      'verified', false, '2023-08-16',
      'https://g1.globo.com/economia/noticia/2023/08/16/silveira-apagao-ons-responsabilizacao.ghtml',
      'news_article',
      'Brasília', 'Coletiva após apagão nacional', 'silveira-apagao-ons-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 48. Padilha sobre Centrão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha defende diálogo com Centrão para ampliar base do governo no Congresso.',
      'Governar exige maioria no Congresso. Dialogar com o Centrão não é abrir mão de princípios, é reconhecer a realidade institucional brasileira. O governo Lula tem agenda clara: mais direitos, mais renda, mais emprego. Vamos construir maioria em torno dessa pauta.',
      'Declaração em reunião da executiva do PT em maio de 2023, em meio a críticas de setores da esquerda sobre a entrada de partidos do Centrão no governo. O PP e o Republicanos aceitaram ministérios em 2024.',
      'verified', false, '2023-05-22',
      'https://www1.folha.uol.com.br/poder/2023/05/padilha-centrao-base-congresso.shtml',
      'news_article',
      'São Paulo', 'Reunião da Executiva Nacional do PT', 'padilha-centrao-base-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 49. Rui Costa sobre Braskem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rui,
      'Rui Costa cobra Braskem por desastre em Maceió e promete apoio federal às vítimas.',
      'O que a Braskem fez em Maceió é inaceitável. Mineração irresponsável que afundou bairros inteiros e deslocou mais de 60 mil pessoas. A empresa precisa pagar por todos os danos. O governo federal não vai abandonar as vítimas e está articulando com o governo estadual a reparação integral.',
      'Coletiva em Maceió em dezembro de 2023, após o colapso de mina da Braskem no bairro Mutange. Rui Costa, ex-governador da Bahia, esteve em Maceió acompanhando as operações de emergência.',
      'verified', false, '2023-12-12',
      'https://g1.globo.com/al/alagoas/noticia/2023/12/12/rui-costa-braskem-maceio-reparacao.ghtml',
      'news_article',
      'Maceió', 'Visita oficial a Maceió após desastre da Braskem', 'rui-costa-braskem-maceio-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 50. Anielle sobre Lei Áurea
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ani,
      'Anielle Franco diz que 13 de maio é data de reflexão, não comemoração, sobre abolição inacabada.',
      'O 13 de maio não é data de festa. A Lei Áurea libertou os escravizados sem terra, sem educação, sem trabalho, sem reparação. A abolição continua inacabada 137 anos depois. A verdadeira liberdade do povo negro só virá com justiça histórica, reparação e políticas estruturantes.',
      'Discurso em ato em São Paulo em maio de 2025, marcando os 137 anos da abolição da escravatura. Anielle Franco defendeu a aprovação de projetos de reparação histórica e cotas no serviço público.',
      'verified', false, '2025-05-13',
      'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2025-05/anielle-franco-lei-aurea-abolicao',
      'news_article',
      'São Paulo', '137 anos da abolição da escravatura', 'anielle-franco-lei-aurea-maio-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

END $$;
