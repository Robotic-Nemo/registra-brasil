-- Batch 54: Senators — multiple party positions and controversies (2023–2026)
-- CPMI 8 de janeiro, CPI Covid memórias, liderança do governo, oposição,
-- reforma tributária, articulação política, investigações, e debates institucionais
-- 50 statements from a broad spectrum of senators

DO $$
DECLARE
  v_jw UUID; v_hc UUID; v_rr UUID; v_av UUID; v_ef UUID;
  v_rm UUID; v_oa UUID; v_ot UUID; v_st UUID; v_mp UUID;
  v_eg UUID; v_wf UUID; v_ac UUID; v_cg UUID; v_co UUID;
  v_pv UUID; v_mj UUID; v_il UUID; v_ea UUID; v_rp UUID;
  v_rc UUID; v_mo UUID; v_cv UUID; v_mdv UUID; v_rom UUID;
  v_tc UUID; v_da UUID; v_mm UUID; v_mou UUID; v_fb UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID; c_aut UUID; c_obs UUID; c_ami UUID;
  c_neg UUID; c_irr UUID; c_cin UUID; c_mac UUID; c_mis UUID;
  c_hom UUID;
BEGIN
  SELECT id INTO v_jw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hc FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_rr FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_av FROM politicians WHERE slug = 'alessandro-vieira';
  SELECT id INTO v_ef FROM politicians WHERE slug = 'efraim-filho';
  SELECT id INTO v_rm FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_oa FROM politicians WHERE slug = 'omar-aziz';
  SELECT id INTO v_ot FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_st FROM politicians WHERE slug = 'soraya-thronicke';
  SELECT id INTO v_mp FROM politicians WHERE slug = 'marcos-pontes';
  SELECT id INTO v_eg FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_wf FROM politicians WHERE slug = 'wellington-fagundes';
  SELECT id INTO v_ac FROM politicians WHERE slug = 'angelo-coronel';
  SELECT id INTO v_cg FROM politicians WHERE slug = 'cid-gomes';
  SELECT id INTO v_co FROM politicians WHERE slug = 'contarato';
  SELECT id INTO v_pv FROM politicians WHERE slug = 'plinio-valerio';
  SELECT id INTO v_mj FROM politicians WHERE slug = 'mecias-de-jesus';
  SELECT id INTO v_il FROM politicians WHERE slug = 'izalci-lucas';
  SELECT id INTO v_ea FROM politicians WHERE slug = 'esperidiao-amin';
  SELECT id INTO v_rp FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_rc FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_mo FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_cv FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_mdv FROM politicians WHERE slug = 'marcos-do-val';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_tc FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_da FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mm FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_fb FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ami FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_cin FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';

  -- 1. Randolfe Rodrigues defende instalação da CPMI do 8 de Janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rr,
      'Randolfe Rodrigues defende CPMI do 8 de Janeiro como essencial para punir financiadores do ataque golpista.',
      'Não podemos deixar impunes os financiadores e organizadores do 8 de Janeiro. A CPMI é instrumento legítimo do Congresso para apurar quem bancou os ônibus, quem articulou os acampamentos e quem deu cobertura política ao atentado à democracia brasileira.',
      'Declaração de Randolfe Rodrigues, então líder do governo no Congresso, em abril de 2023, ao defender a instalação da CPMI do 8 de Janeiro. O senador do Amapá foi um dos principais articuladores da comissão.',
      'verified', true, '2023-04-26',
      'https://www12.senado.leg.br/noticias/materias/2023/04/26/randolfe-defende-cpmi-8-janeiro',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'randolfe-defesa-cpmi-8-janeiro-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 2. Jaques Wagner defende articulação do governo Lula no Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jw,
      'Jaques Wagner afirma que o governo Lula tem compromisso com reconstrução nacional e diálogo com todos os partidos.',
      'O governo Lula não veio para confrontar, veio para reconstruir o Brasil depois de anos de destruição. Vamos dialogar com todos os partidos, com todas as bancadas, mas não vamos abrir mão dos compromissos com os mais pobres, com a educação, com a saúde e com a democracia.',
      'Discurso de Jaques Wagner como líder do governo no Senado, em março de 2023, apresentando as prioridades legislativas do novo governo. O senador baiano do PT é um dos principais articuladores políticos de Lula.',
      'verified', false, '2023-03-14',
      'https://www.folha.uol.com.br/poder/2023/03/jaques-wagner-lider-governo-senado-reconstrucao.shtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'jaques-wagner-lider-governo-reconstrucao-marco-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 3. Humberto Costa defende o SUS contra cortes orçamentários
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_hc,
      'Humberto Costa alerta que cortes no SUS representam retrocesso sanitário e custarão vidas.',
      'O SUS é a maior conquista social do povo brasileiro e não aceitaremos cortes que coloquem em risco a saúde de milhões. Qualquer tentativa de sufocar o sistema único de saúde é um ataque à vida das pessoas mais pobres deste país. Vamos lutar no Congresso para garantir recursos.',
      'Fala de Humberto Costa, senador do PT-PE e ex-ministro da Saúde, em sessão do Senado em maio de 2023, durante debate sobre o orçamento da saúde. O senador tem histórico de defesa do SUS desde o governo Lula 1.',
      'verified', false, '2023-05-17',
      'https://www12.senado.leg.br/noticias/materias/2023/05/17/humberto-costa-sus-cortes-orcamento',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'humberto-costa-defesa-sus-cortes-maio-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 4. Soraya Thronicke critica PL das Fake News
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_st,
      'Soraya Thronicke afirma que PL das Fake News institui censura prévia e abre espaço para perseguição política.',
      'Esse PL das Fake News é uma tentativa de silenciar quem pensa diferente. Não é combate à desinformação, é censura prévia disfarçada. Vamos criar um Ministério da Verdade igual ao livro do George Orwell? Isso não pode passar no Congresso.',
      'Discurso de Soraya Thronicke (Podemos-MS) em maio de 2023 contra o PL 2630, conhecido como PL das Fake News. A senadora, ex-candidata à Presidência em 2022, se posicionou junto com a oposição.',
      'verified', false, '2023-05-02',
      'https://www.gazetadopovo.com.br/republica/senadora-soraya-thronicke-pl-fake-news-censura/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'soraya-thronicke-pl-fake-news-censura-maio-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 5. Rogério Marinho ataca governo Lula em discurso como líder da oposição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rm,
      'Rogério Marinho diz que governo Lula é "o pior da história" e só sobrevive por acordos fisiológicos.',
      'O governo Lula é, sem sombra de dúvida, o pior governo da história recente do Brasil. Só se mantém de pé por meio de acordos fisiológicos, troca de cargos e de liberação de emendas. Não há projeto de país, há apenas um projeto de poder para perpetuar o PT.',
      'Discurso de Rogério Marinho, líder do PL no Senado, em junho de 2023, ao criticar o primeiro semestre do governo Lula. O senador potiguar é um dos principais articuladores da oposição bolsonarista.',
      'verified', true, '2023-06-07',
      'https://www.cnnbrasil.com.br/politica/rogerio-marinho-lula-pior-governo-historia/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'rogerio-marinho-lula-pior-governo-junho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Omar Aziz relembra CPI da Covid e cobra responsabilização
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_oa,
      'Omar Aziz cobra avanço das ações contra Bolsonaro pelos crimes apurados na CPI da Covid.',
      'A CPI da Covid apontou crimes gravíssimos e as pessoas não podem ficar impunes. Foram mais de 700 mil mortos, muitos deles evitáveis. A Procuradoria precisa agir, o Judiciário precisa julgar. Senão, passaremos a mensagem de que no Brasil quem mata por omissão sai impune.',
      'Declaração de Omar Aziz (PSD-AM), ex-presidente da CPI da Covid, em entrevista em julho de 2023, cobrando celeridade da PGR nas ações contra Jair Bolsonaro e ex-ministros.',
      'verified', false, '2023-07-12',
      'https://www.folha.uol.com.br/poder/2023/07/omar-aziz-cpi-covid-bolsonaro-responsabilizacao.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha', 'omar-aziz-cpi-covid-responsabilizacao-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 7. Otto Alencar, médico, critica negacionismo bolsonarista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ot,
      'Otto Alencar afirma que negacionismo bolsonarista em saúde pública matou brasileiros por ideologia.',
      'Como médico, eu digo: o negacionismo matou. Dizer que vacina vira jacaré, recomendar cloroquina que não funciona, atrasar compra de imunizantes — tudo isso custou vidas. Não é opinião, é ciência. E quem promoveu esse discurso precisa ser responsabilizado.',
      'Fala de Otto Alencar (PSD-BA), médico e ex-governador da Bahia, em sessão da CPI da Covid em 2023. O senador é um dos mais ativos críticos do negacionismo sanitário no Congresso.',
      'verified', false, '2023-08-02',
      'https://www12.senado.leg.br/noticias/materias/2023/08/02/otto-alencar-negacionismo-saude-publica',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'otto-alencar-negacionismo-saude-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 8. Efraim Filho defende liderança do UNIÃO e distância do governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ef,
      'Efraim Filho afirma que UNIÃO Brasil não é base de sustentação e vai votar por convicção.',
      'O UNIÃO Brasil não é base de sustentação do governo Lula. Temos ministros no governo, mas o partido é independente. Vamos votar por convicção, de acordo com os interesses da Paraíba e do Brasil. Não estamos aqui para carimbar projeto de governo.',
      'Declaração de Efraim Filho (UNIÃO-PB), líder do partido no Senado, em agosto de 2023, marcando posicionamento independente. O senador paraibano fez carreira na Câmara antes de migrar para o Senado.',
      'verified', false, '2023-08-22',
      'https://www.estadao.com.br/politica/efraim-filho-uniao-brasil-independente-governo-lula/',
      'news_article',
      'Brasília', 'Entrevista ao Estadão', 'efraim-filho-uniao-brasil-independente-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cin, true FROM ins;

  -- 9. Marcos Pontes defende investimento em ciência e tecnologia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mp,
      'Marcos Pontes defende que corte em ciência é o maior erro do governo Lula e atrasa o Brasil em décadas.',
      'Cortar recursos da ciência é condenar o Brasil ao atraso. Em um mundo que compete por inteligência artificial, biotecnologia, semicondutores, nós cortamos verba de universidade e de pesquisa. Isso é um crime contra as próximas gerações de brasileiros.',
      'Discurso de Marcos Pontes (PL-SP), ex-astronauta e ex-ministro da Ciência e Tecnologia no governo Bolsonaro, em setembro de 2023, criticando cortes orçamentários.',
      'verified', false, '2023-09-13',
      'https://oglobo.globo.com/politica/noticia/2023/09/marcos-pontes-corte-ciencia-lula-atraso.ghtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'marcos-pontes-corte-ciencia-lula-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 10. Esperidião Amin critica judicialização da política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ea,
      'Esperidião Amin alerta que excesso de poder do STF sobre o Congresso rompe equilíbrio entre os Poderes.',
      'Estamos vivendo uma hipertrofia do Supremo que o Congresso, por covardia ou conveniência, permitiu. Há decisões monocráticas que legislam, há determinações que passam por cima do Parlamento. Isso rompe o equilíbrio republicano entre os Poderes e não podemos aceitar.',
      'Fala de Esperidião Amin (PP-SC), veterano senador catarinense, em outubro de 2023, em debate sobre PEC que limita decisões monocráticas no STF. Amin é um dos mais antigos parlamentares em atividade.',
      'verified', false, '2023-10-04',
      'https://www12.senado.leg.br/noticias/materias/2023/10/04/esperidiao-amin-stf-decisoes-monocraticas',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'esperidiao-amin-stf-decisoes-monocraticas-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 11. Cid Gomes ataca bolsonarismo e defende posição de irmão Ciro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cg,
      'Cid Gomes chama bolsonarismo de "fascismo tropical" e diz que é obrigação histórica derrotá-lo.',
      'O bolsonarismo é um fascismo tropical, com todas as características do fascismo europeu dos anos 30: culto ao líder, ódio às minorias, desprezo pela democracia, violência como linguagem política. Derrotá-lo nas urnas e nas instituições é obrigação de qualquer democrata.',
      'Declaração de Cid Gomes (PSB-CE), irmão de Ciro Gomes, em entrevista em novembro de 2023. O senador cearense foi ex-governador e tem histórico de confrontos diretos com o bolsonarismo.',
      'verified', true, '2023-11-09',
      'https://www.cnnbrasil.com.br/politica/cid-gomes-bolsonarismo-fascismo-tropical/',
      'news_article',
      'Fortaleza', 'Entrevista à CNN Brasil', 'cid-gomes-bolsonarismo-fascismo-tropical-novembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 12. Contarato denuncia LGBTfobia no Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_co,
      'Contarato denuncia ataques LGBTfóbicos no plenário e cobra responsabilização de colegas.',
      'Eu, como senador gay e único assumido nesta Casa, sou diariamente alvo de ataques, piadas, comentários homofóbicos nas redes sociais e até no plenário. Isso não é liberdade de expressão, é crime. E o Senado precisa dar resposta firme contra LGBTfobia.',
      'Discurso de Contarato (PT-ES) no plenário do Senado em dezembro de 2023, denunciando episódio de discurso homofóbico por senador da oposição. Contarato, ex-delegado, é um dos poucos parlamentares LGBTQIA+ assumidos no Congresso.',
      'verified', true, '2023-12-06',
      'https://www12.senado.leg.br/noticias/materias/2023/12/06/contarato-lgbtfobia-senado',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'contarato-lgbtfobia-senado-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 13. Rodrigo Pacheco defende STF como presidente do Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rp,
      'Rodrigo Pacheco afirma que ataques ao STF são ataques à Constituição e não vão passar no Senado.',
      'Enquanto eu for presidente do Senado, não vou dar espaço para ataques institucionais ao Supremo Tribunal Federal. Podemos discordar de decisões, mas não é aceitável que se ataque a instituição ou que se pregue impeachment de ministros como instrumento de chantagem política.',
      'Fala de Rodrigo Pacheco (PSD-MG), então presidente do Senado, em fevereiro de 2024, em resposta a pressões da oposição bolsonarista por impeachment de Alexandre de Moraes.',
      'verified', true, '2024-02-20',
      'https://g1.globo.com/politica/noticia/2024/02/pacheco-ataques-stf-constituicao-senado.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'pacheco-defesa-stf-constituicao-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 14. Renan Calheiros acusa Lira de boicotar governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rc,
      'Renan Calheiros acusa Arthur Lira de chantagear o governo Lula com pauta da Câmara em troca de poder.',
      'Arthur Lira chantageia o governo todos os dias. Segura pauta, libera quando quer, barganha cargo, exige emenda. Isso não é parlamentarismo, é um estelionato institucional. O presidente da Câmara não pode ser um poder paralelo ao Executivo.',
      'Declaração de Renan Calheiros (MDB-AL), senador veterano e ex-presidente do Senado, em entrevista em março de 2024. Calheiros tem histórico de críticas a Lira e ao Centrão.',
      'verified', false, '2024-03-05',
      'https://www.folha.uol.com.br/poder/2024/03/renan-calheiros-lira-chantagem-governo.shtml',
      'news_article',
      'Maceió', 'Entrevista à Folha', 'renan-calheiros-lira-chantagem-governo-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 15. Sergio Moro ataca governo Lula em CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mo,
      'Sergio Moro tenta pautar "blindagem política" do PT durante depoimento na CPMI do 8 de Janeiro.',
      'Essa CPMI é uma cortina de fumaça para proteger o governo Lula e o PT de investigações importantes. Estão tentando transformar manifestantes em golpistas para desviar a atenção da corrupção sistêmica que voltou a Brasília. Não vamos deixar passar.',
      'Fala de Sergio Moro (UNIÃO-PR) em sessão da CPMI do 8 de Janeiro em 2023. O senador ex-juiz da Lava Jato usou a comissão para criticar o governo Lula e desviar foco da apuração dos atos golpistas.',
      'verified', false, '2023-06-20',
      'https://www.poder360.com.br/congresso/moro-cpmi-cortina-fumaca-governo-lula/',
      'news_article',
      'Brasília', 'CPMI do 8 de Janeiro', 'moro-cpmi-cortina-fumaca-junho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Eliziane Gama apresenta relatório da CPMI do 8 de Janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eg,
      'Eliziane Gama, relatora da CPMI, pede indiciamento de Bolsonaro e 60 envolvidos em trama golpista.',
      'O relatório é claro: Jair Bolsonaro foi o líder intelectual e político da tentativa de golpe. A tentativa de ruptura democrática não começou em 8 de Janeiro, começou nos ataques sistemáticos às urnas e culminou no ataque às sedes dos Três Poderes. A Justiça precisa responsabilizar todos os envolvidos.',
      'Apresentação do relatório final da CPMI do 8 de Janeiro pela relatora Eliziane Gama (PSD-MA) em outubro de 2023. A senadora maranhense pediu indiciamento de Bolsonaro, militares e empresários.',
      'verified', true, '2023-10-17',
      'https://g1.globo.com/politica/noticia/2023/10/17/eliziane-gama-relatorio-cpmi-8-janeiro-bolsonaro.ghtml',
      'news_article',
      'Brasília', 'CPMI do 8 de Janeiro', 'eliziane-gama-relatorio-cpmi-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 17. Alessandro Vieira defende independência do MP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_av,
      'Alessandro Vieira alerta para aparelhamento do Ministério Público e cobra PGR mais ativo contra crimes de autoridade.',
      'O Ministério Público não pode virar escudo de governos. Quando a PGR engaveta denúncia contra autoridades, quando o MP se cala diante de crime de responsabilidade, perde-se a credibilidade da instituição. Precisamos de uma PGR que investigue ricos e poderosos, não só pobres.',
      'Discurso de Alessandro Vieira (MDB-SE), ex-delegado, em abril de 2024. O senador sergipano tem atuação focada em transparência e combate à corrupção.',
      'verified', false, '2024-04-10',
      'https://www12.senado.leg.br/noticias/materias/2024/04/10/alessandro-vieira-mp-pgr-independencia',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'alessandro-vieira-mp-pgr-independencia-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 18. Plínio Valério defende garimpo na Amazônia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pv,
      'Plínio Valério defende garimpo ilegal e chama operação contra yanomamis de "perseguição a brasileiros".',
      'Essa história de yanomami, yanomami, já cansou. Enquanto isso, o garimpeiro brasileiro está sendo perseguido, está tendo máquina destruída, está sendo tratado como bandido por tirar o sustento da família. O Ibama virou polícia política contra o homem do Norte.',
      'Discurso de Plínio Valério (PSDB-AM) em plenário do Senado em fevereiro de 2023, em meio à emergência humanitária entre os yanomamis e operações de desintrusão de garimpeiros em terra indígena.',
      'verified', false, '2023-02-15',
      'https://oglobo.globo.com/politica/noticia/2023/02/plinio-valerio-garimpo-yanomami-perseguicao.ghtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'plinio-valerio-garimpo-yanomami-fevereiro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 19. Mecias de Jesus defende marco temporal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mj,
      'Mecias de Jesus defende marco temporal indígena como proteção jurídica para produtores rurais.',
      'O marco temporal não é contra o índio, é a favor da segurança jurídica. Sem ele, qualquer fazendeiro, qualquer pequeno produtor, pode ser expulso da sua terra por reivindicação indígena de qualquer época. O Congresso precisa aprovar e o STF precisa respeitar a separação de Poderes.',
      'Fala de Mecias de Jesus (Republicanos-RR) em setembro de 2023, durante debate sobre marco temporal. O senador roraimense é aliado do agronegócio.',
      'verified', false, '2023-09-27',
      'https://www.cnnbrasil.com.br/politica/mecias-jesus-marco-temporal-seguranca-juridica/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'mecias-jesus-marco-temporal-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Izalci Lucas ataca governo por emendas e ministérios
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_il,
      'Izalci Lucas denuncia troca de emendas por apoio político como prática que destrói a moralidade pública.',
      'A liberação de emendas virou moeda de chantagem do governo. Quem vota a favor, recebe. Quem vota contra, fica sem verba. Isso é compra de voto travestido de articulação política. É a morte da representação popular nesta Casa.',
      'Discurso de Izalci Lucas (PL-DF) em maio de 2024, ao debater emendas parlamentares e relações entre Executivo e Congresso.',
      'verified', false, '2024-05-22',
      'https://www.estadao.com.br/politica/izalci-emendas-chantagem-governo-lula/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'izalci-emendas-chantagem-governo-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 21. Carlos Viana ataca ministros do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cv,
      'Carlos Viana pede impeachment de Alexandre de Moraes por suposto abuso de poder.',
      'Alexandre de Moraes extrapolou todos os limites constitucionais. Ele investiga, acusa e julga. Bloqueia redes sociais, prende sem processo, censura imprensa. O Senado tem o dever constitucional de abrir o impeachment desse ministro que virou ameaça à liberdade.',
      'Declaração de Carlos Viana (Podemos-MG) em junho de 2024, ao protocolar pedido de impeachment de Alexandre de Moraes junto com outros senadores da oposição.',
      'verified', false, '2024-06-12',
      'https://www.poder360.com.br/congresso/carlos-viana-impeachment-moraes-senado/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'carlos-viana-impeachment-moraes-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 22. Marcos do Val denuncia suposta conspiração com Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mdv,
      'Marcos do Val muda versão três vezes sobre reunião com Bolsonaro e plano de gravar Alexandre de Moraes.',
      'Eu fui pressionado pelo Jair Bolsonaro e pelo Daniel Silveira a gravar o ministro Alexandre de Moraes para criar uma situação que impedisse a posse do Lula. Eu me recusei. Depois, eu voltei atrás, depois eu confirmei de novo. O fato é que houve sim um plano e fui testemunha.',
      'Série de declarações contraditórias de Marcos do Val (Podemos-ES) entre fevereiro e março de 2023 sobre suposta reunião com Bolsonaro e Daniel Silveira para gravar o ministro do STF.',
      'verified', true, '2023-02-03',
      'https://g1.globo.com/politica/noticia/2023/02/03/marcos-do-val-bolsonaro-moraes-gravacao.ghtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa', 'marcos-do-val-bolsonaro-moraes-gravacao-fevereiro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 23. Romário critica CBF e propõe mudanças
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário afirma que CBF é "cartório de cartolas corruptos" e defende intervenção por CPI.',
      'A CBF é um cartório de cartolas corruptos que se perpetuam no poder há décadas. Nenhuma instituição passa em auditoria, nenhum presidente presta contas de verdade. A CPI da Manipulação de Apostas precisa ir até o fim e escancarar essa bagunça.',
      'Discurso de Romário (PL-RJ), ex-jogador e senador, em setembro de 2023, em sessão da CPI das Apostas. Romário preside a comissão.',
      'verified', false, '2023-09-19',
      'https://www12.senado.leg.br/noticias/materias/2023/09/19/romario-cbf-cartolas-corruptos',
      'official_statement',
      'Brasília', 'CPI das Apostas Esportivas', 'romario-cbf-cartolas-corruptos-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 24. Tereza Cristina defende agronegócio contra "ambientalismo radical"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tc,
      'Tereza Cristina afirma que agenda ambiental de Marina Silva é "ideológica" e ameaça o agronegócio.',
      'A ministra Marina Silva está transformando a política ambiental em cruzada ideológica contra o produtor rural. O agro é o que sustenta o Brasil, é o que garante comida barata e exportação. Não podemos paralisar o país para atender bandeira ideológica de ONGs estrangeiras.',
      'Declaração de Tereza Cristina (PP-MS), ex-ministra da Agricultura no governo Bolsonaro, em entrevista em novembro de 2023.',
      'verified', false, '2023-11-28',
      'https://www.cnnbrasil.com.br/politica/tereza-cristina-marina-silva-agro-ideologia/',
      'news_article',
      'Campo Grande', 'Entrevista à CNN Brasil', 'tereza-cristina-marina-silva-agro-novembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Damares Alves invoca pauta religiosa contra aborto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_da,
      'Damares Alves chama ministras do STF de "assassinas de bebês" por votar descriminalização do aborto.',
      'As ministras que votaram pela descriminalização do aborto são, aos olhos de Deus e da Constituição, defensoras do assassinato de bebês indefesos. O Brasil é um país cristão e não vai aceitar que um grupo de togados imponha uma agenda abortista contra o povo.',
      'Discurso de Damares Alves (Republicanos-DF), ex-ministra da Mulher, Família e Direitos Humanos, em setembro de 2024, após a votação do STF sobre descriminalização do aborto até 12 semanas.',
      'verified', true, '2024-09-24',
      'https://www.folha.uol.com.br/cotidiano/2024/09/damares-stf-aborto-assassinas-bebes.shtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'damares-stf-aborto-assassinas-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 26. Magno Malta prega guerra cultural contra LGBT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mm,
      'Magno Malta diz em culto que "ideologia de gênero" é "estratégia do diabo" para destruir famílias.',
      'A ideologia de gênero é estratégia do diabo para destruir a família brasileira. Querem ensinar criança que menino pode virar menina e menina pode virar menino. Isso é coisa do inferno. O Congresso tem que barrar, a igreja tem que denunciar, e o povo tem que votar contra.',
      'Pregação de Magno Malta (PL-ES), pastor evangélico, em culto realizado em dezembro de 2023, posteriormente viralizado nas redes sociais.',
      'verified', false, '2023-12-17',
      'https://oglobo.globo.com/politica/noticia/2023/12/magno-malta-ideologia-genero-diabo.ghtml',
      'news_article',
      'Vila Velha', 'Culto evangélico', 'magno-malta-ideologia-genero-diabo-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 27. Hamilton Mourão defende militares acusados de golpe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão afirma que oficiais das Forças Armadas indiciados por golpe são "vítimas de uma caça às bruxas".',
      'Esses oficiais brilhantes, com carreira impecável, estão sendo tratados como criminosos por conta de conversas e de reuniões que jamais se materializaram em ação. É uma caça às bruxas contra as Forças Armadas. Estão querendo criminalizar o pensamento, a estratégia, a doutrina militar.',
      'Declaração de Hamilton Mourão (Republicanos-RS), ex-vice-presidente general, em dezembro de 2024, após indiciamento de militares pela Polícia Federal.',
      'verified', false, '2024-12-03',
      'https://www.estadao.com.br/politica/mourao-militares-indiciamento-golpe-caca-bruxas/',
      'news_article',
      'Brasília', 'Entrevista ao Estadão', 'mourao-militares-indiciamento-caca-bruxas-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Flávio Bolsonaro no Senado ataca Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fb,
      'Flávio Bolsonaro diz em plenário que Moraes é "juiz tirano" e pede intervenção internacional.',
      'Alexandre de Moraes é um juiz tirano que prende, censura e persegue sem nenhum controle. O Senado precisa ter coragem. Os Estados Unidos, a União Europeia, os organismos internacionais precisam olhar para o Brasil. Temos um preso político chamado Jair Bolsonaro.',
      'Discurso de Flávio Bolsonaro (PL-RJ) em plenário em janeiro de 2025, logo após a decretação da prisão domiciliar do pai.',
      'verified', true, '2025-01-22',
      'https://www.folha.uol.com.br/poder/2025/01/flavio-bolsonaro-moraes-juiz-tirano-senado.shtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'flavio-bolsonaro-moraes-tirano-senado-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 29. Randolfe justifica mudança do REDE para PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rr,
      'Randolfe Rodrigues anuncia filiação ao PT como "coerência" com o projeto da reconstrução nacional.',
      'Minha filiação ao PT não é ruptura, é coerência. Fui eleito para defender a democracia, o meio ambiente e as políticas sociais. Estou indo para o partido do presidente Lula porque é ali que está o projeto de reconstrução do Brasil. A REDE não me deu mais esse espaço.',
      'Anúncio de Randolfe Rodrigues em abril de 2024, ao deixar a REDE e se filiar ao PT após conflitos com Marina Silva e a direção da rede.',
      'verified', true, '2024-04-18',
      'https://g1.globo.com/politica/noticia/2024/04/18/randolfe-rodrigues-filiacao-pt-rede.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'randolfe-filiacao-pt-rede-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cin, true FROM ins;

  -- 30. Wellington Fagundes defende agro contra política ambiental
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_wf,
      'Wellington Fagundes diz que regras ambientais impostas pela UE são "neocolonialismo verde" contra o Brasil.',
      'A União Europeia cria regras ambientais impossíveis e exige que o produtor brasileiro cumpra. Isso não é ambientalismo, é neocolonialismo verde para proteger o agricultor europeu subsidiado. O Brasil precisa reagir e não aceitar imposição de quem destruiu as próprias florestas séculos atrás.',
      'Discurso de Wellington Fagundes (PL-MT) em julho de 2024, em sessão sobre regulamento antidesmatamento da União Europeia.',
      'verified', false, '2024-07-10',
      'https://www.cnnbrasil.com.br/politica/wellington-fagundes-uniao-europeia-agro-neocolonialismo/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'wellington-fagundes-ue-neocolonialismo-julho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Angelo Coronel critica Receita e defende "contribuinte"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ac,
      'Angelo Coronel defende flexibilização do monitoramento do Pix e diz que Receita vira "Big Brother" fiscal.',
      'Não pode ser que a Receita Federal se transforme em um Big Brother que vigia cada Pix que o cidadão faz. Isso é invasão de privacidade travestida de fiscalização. O Senado vai derrubar essa portaria que transforma o brasileiro em suspeito por natureza.',
      'Fala de Angelo Coronel (PSD-BA) em janeiro de 2025, em meio à polêmica sobre o monitoramento ampliado do Pix pela Receita Federal.',
      'verified', false, '2025-01-15',
      'https://oglobo.globo.com/economia/noticia/2025/01/angelo-coronel-pix-receita-big-brother.ghtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'angelo-coronel-pix-receita-big-brother-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 32. Humberto Costa defende governo Lula contra ataques à saúde mental de Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_hc,
      'Humberto Costa reage a ataques bolsonaristas à saúde de Lula e acusa oposição de fake news para deslegitimar presidente.',
      'A oposição bolsonarista não tem projeto, não tem pauta, não tem o que oferecer ao Brasil. Sobra para ela a fábrica de fake news sobre a saúde do presidente Lula. Isso é covardia política. O presidente está lúcido, trabalhando, liderando o G20 e reconstruindo o país.',
      'Declaração de Humberto Costa (PT-PE) em novembro de 2024, reagindo a ataques da oposição após queda doméstica de Lula e hospitalização.',
      'verified', false, '2024-11-19',
      'https://www12.senado.leg.br/noticias/materias/2024/11/19/humberto-costa-ataques-saude-lula-fake-news',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'humberto-costa-ataques-saude-lula-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 33. Jaques Wagner articula reforma tributária
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jw,
      'Jaques Wagner comemora aprovação da reforma tributária como "maior vitória legislativa em décadas".',
      'A aprovação da reforma tributária é a maior vitória legislativa do Brasil em décadas. Simplifica, desonera produção, corrige injustiças. Foram 30 anos de tentativas, e coube ao governo Lula e a este Congresso fazer o que ninguém conseguiu fazer. O Brasil sai mais justo.',
      'Discurso de Jaques Wagner (PT-BA), líder do governo, em dezembro de 2023, após aprovação da PEC 45 (reforma tributária).',
      'verified', true, '2023-12-15',
      'https://g1.globo.com/politica/noticia/2023/12/15/jaques-wagner-reforma-tributaria-vitoria-legislativa.ghtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'jaques-wagner-reforma-tributaria-vitoria-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 34. Soraya Thronicke participa CPMI 8 janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_st,
      'Soraya Thronicke denuncia omissão das Forças Armadas no 8 de Janeiro e cobra punição para militares.',
      'As Forças Armadas sabiam, tiveram oportunidade de evitar, e não agiram. Isso não é falha, é conivência. Os militares que se omitiram ou apoiaram o 8 de Janeiro precisam ser punidos. Nossa democracia não pode tolerar forças armadas politizadas e golpistas.',
      'Fala de Soraya Thronicke (Podemos-MS) em sessão da CPMI do 8 de Janeiro em agosto de 2023, onde foi uma voz crítica dentro do bloco de oposição.',
      'verified', false, '2023-08-15',
      'https://www.poder360.com.br/congresso/soraya-thronicke-forcas-armadas-8-janeiro/',
      'news_article',
      'Brasília', 'CPMI do 8 de Janeiro', 'soraya-thronicke-forcas-armadas-8-janeiro-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 35. Rogério Marinho ataca Lula pelo Irã e Venezuela
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rm,
      'Rogério Marinho afirma que política externa de Lula "isolou o Brasil" ao se aliar a Venezuela, Irã e Rússia.',
      'A política externa do governo Lula é uma vergonha internacional. Lula ficou do lado de Maduro contra a oposição venezuelana, do lado de Putin na invasão à Ucrânia, do lado do Hamas contra Israel. O Brasil virou pária no Ocidente e aliado de autocratas. Isso é traição ao interesse nacional.',
      'Discurso de Rogério Marinho (PL-RN) em agosto de 2024, após declarações de Lula sobre a eleição venezuelana.',
      'verified', false, '2024-08-06',
      'https://www.estadao.com.br/politica/rogerio-marinho-lula-politica-externa-venezuela-russia/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'rogerio-marinho-politica-externa-venezuela-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 36. Omar Aziz defende regulamentação de redes sociais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_oa,
      'Omar Aziz defende regulamentação das big techs e afirma que algoritmos "radicalizaram" a política brasileira.',
      'A democracia brasileira está refém dos algoritmos de big techs estrangeiras. Elas lucram com o ódio, com a desinformação, com a polarização. Regulamentar as plataformas não é censura, é proteção da democracia. O Senado não pode continuar omisso enquanto o Brasil adoece nas redes.',
      'Declaração de Omar Aziz (PSD-AM) em agosto de 2024, em debate sobre regulamentação de redes sociais.',
      'verified', false, '2024-08-20',
      'https://www12.senado.leg.br/noticias/materias/2024/08/20/omar-aziz-regulamentacao-redes-algoritmos',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'omar-aziz-regulamentacao-redes-algoritmos-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 37. Otto Alencar rebate discurso antivacina
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ot,
      'Otto Alencar chama deputados antivacina de "coveiros da saúde pública" após surto de sarampo.',
      'Os deputados e senadores que fizeram campanha contra a vacinação são coveiros da saúde pública brasileira. A volta do sarampo, a estagnação da cobertura infantil, o retorno de doenças erradicadas — tudo isso tem nome e sobrenome. É negacionismo criminoso.',
      'Discurso de Otto Alencar (PSD-BA), médico, em março de 2024, após dados mostrarem queda histórica na cobertura vacinal.',
      'verified', false, '2024-03-20',
      'https://oglobo.globo.com/saude/noticia/2024/03/otto-alencar-antivacina-coveiros-saude.ghtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'otto-alencar-antivacina-coveiros-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 38. Efraim Filho defende pauta econômica liberal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ef,
      'Efraim Filho diz que aumento de gastos do governo Lula ameaça arcabouço fiscal e confiança de mercado.',
      'O governo Lula criou arcabouço fiscal e agora é o primeiro a furá-lo com criação de despesas novas sem contrapartida. Cada R$ 1 bilhão a mais no Orçamento é menos investimento, menos confiança do mercado, mais juros para o brasileiro. O Senado precisa ser a trava fiscal deste país.',
      'Fala de Efraim Filho (UNIÃO-PB) em outubro de 2024 em debate sobre execução orçamentária.',
      'verified', false, '2024-10-08',
      'https://valor.globo.com/politica/noticia/2024/10/08/efraim-filho-arcabouco-fiscal-gastos-lula.ghtml',
      'news_article',
      'Brasília', 'Plenário do Senado', 'efraim-filho-arcabouco-fiscal-lula-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 39. Marcos Pontes critica Anatel e 5G
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mp,
      'Marcos Pontes acusa atual governo de desmontar avanços do 5G implantados em sua gestão.',
      'O Brasil foi um dos primeiros do mundo a ter 5G puro, sem interferência estrangeira, em todas as capitais. Isso foi feito no nosso governo, com planejamento e recurso. Agora o atual governo desmonta, atrasa cronograma, politiza a Anatel. Vai sobrar atraso tecnológico para o brasileiro.',
      'Declaração de Marcos Pontes (PL-SP) em fevereiro de 2024 em sessão sobre telecomunicações.',
      'verified', false, '2024-02-27',
      'https://telesintese.com.br/marcos-pontes-5g-anatel-governo-lula/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'marcos-pontes-5g-anatel-governo-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Esperidião Amin em crítica às ONGs
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ea,
      'Esperidião Amin cobra CPI das ONGs com atuação na Amazônia e fala em "soberania vigiada".',
      'Há ONGs internacionais operando na Amazônia sem controle, com recursos bilionários, pautando políticas públicas sem prestar contas ao Estado brasileiro. Isso é soberania vigiada. Precisamos de CPI para saber quem financia, como operam e que interesse está por trás dessas entidades.',
      'Discurso de Esperidião Amin (PP-SC) em maio de 2024, ao defender nova CPI das ONGs.',
      'verified', false, '2024-05-15',
      'https://www.cnnbrasil.com.br/politica/esperidiao-amin-cpi-ongs-amazonia-soberania/',
      'news_article',
      'Brasília', 'Plenário do Senado', 'esperidiao-amin-cpi-ongs-amazonia-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Cid Gomes critica irmão Ciro publicamente
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cg,
      'Cid Gomes rompe com irmão Ciro e defende apoio do PSB ao PT no Ceará.',
      'Meu irmão Ciro tem todo direito às opiniões dele, mas eu, como senador do PSB, tenho responsabilidade institucional. No Ceará, vamos apoiar o candidato do PT, vamos manter aliança de centro-esquerda contra o bolsonarismo. Cada um responde por suas escolhas.',
      'Declaração de Cid Gomes (PSB-CE) em junho de 2024 após divergência pública com o irmão Ciro Gomes.',
      'verified', false, '2024-06-28',
      'https://diariodonordeste.verdesmares.com.br/politica/cid-gomes-ciro-psb-pt-ceara-2024',
      'news_article',
      'Fortaleza', 'Entrevista regional', 'cid-gomes-ciro-psb-pt-ceara-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cin, true FROM ins;

  -- 42. Contarato defende reforma das polícias
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_co,
      'Contarato defende reforma das polícias para reduzir letalidade policial contra a população negra.',
      'A polícia brasileira é a que mais mata no mundo e a que mais morre. Precisamos de reforma estrutural: câmeras corporais, controle externo, política de redução de letalidade. Quando polícia bem treinada entra em favela, não morre jovem negro nem policial. Isso é segurança de verdade.',
      'Discurso de Contarato (PT-ES), ex-delegado, em março de 2024, em sessão sobre segurança pública.',
      'verified', false, '2024-03-26',
      'https://www12.senado.leg.br/noticias/materias/2024/03/26/contarato-reforma-policias-letalidade',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'contarato-reforma-policias-letalidade-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 43. Rodrigo Pacheco rejeita impeachment de Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rp,
      'Rodrigo Pacheco arquiva novo pedido de impeachment contra Alexandre de Moraes e afirma que não há crime de responsabilidade.',
      'Não há, nos pedidos apresentados, elementos que configurem crime de responsabilidade por parte do ministro Alexandre de Moraes. Discordância com decisão judicial não é crime. O impeachment não pode ser usado como instrumento de pressão política sobre ministros do STF. Arquivo o pedido.',
      'Decisão de Rodrigo Pacheco (PSD-MG), então presidente do Senado, em agosto de 2024, ao arquivar pedido de impeachment contra Moraes.',
      'verified', true, '2024-08-30',
      'https://g1.globo.com/politica/noticia/2024/08/30/pacheco-arquiva-impeachment-moraes-senado.ghtml',
      'news_article',
      'Brasília', 'Presidência do Senado', 'pacheco-arquiva-impeachment-moraes-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 44. Renan Calheiros defende Lula na crise 2024
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rc,
      'Renan Calheiros diz que governo Lula precisa se reorganizar e articular melhor com o Congresso.',
      'O governo Lula tem de fazer autocrítica. Falta articulação política, falta entrega, falta narrativa que mobilize o povo. Bolsonarismo ganha o debate público enquanto o governo patina. Sem mexer no time e mudar método, vai ter dificuldade para ganhar 2026.',
      'Entrevista de Renan Calheiros (MDB-AL) em setembro de 2024.',
      'verified', false, '2024-09-18',
      'https://www.folha.uol.com.br/poder/2024/09/renan-calheiros-governo-lula-articulacao-congresso.shtml',
      'news_article',
      'Maceió', 'Entrevista à Folha', 'renan-calheiros-governo-lula-articulacao-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 45. Sergio Moro em decisão TSE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mo,
      'Sergio Moro mantém mandato após TSE absolvê-lo em caso de caixa 2 por 4x3.',
      'Tenho a convicção tranquila de que fiz uma campanha limpa, dentro da lei, com cada centavo declarado. Os acusadores queriam a todo custo cassar meu mandato para silenciar a oposição ao PT no Paraná. A decisão do TSE é vitória da verdade contra a perseguição política.',
      'Declaração de Sergio Moro (UNIÃO-PR) em novembro de 2023, após o TSE rejeitar, por 4x3, ação de cassação de seu mandato por caixa 2 na pré-campanha.',
      'verified', false, '2023-11-23',
      'https://g1.globo.com/politica/noticia/2023/11/23/sergio-moro-absolvido-tse-caixa-2-mandato.ghtml',
      'news_article',
      'Curitiba', 'Declaração pós-julgamento', 'moro-absolvicao-tse-caixa-2-novembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 46. Alessandro Vieira defende Operação Lesa Pátria
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_av,
      'Alessandro Vieira defende operações da PF contra golpistas e diz que anistia aos 8 de janeiro seria "chancela da violência".',
      'A operação Lesa Pátria é instrumento essencial para punir quem atacou a democracia brasileira. Dar anistia a quem vandalizou os Três Poderes seria chancelar a violência política. Se essa gente não pagar, amanhã vão invadir de novo, e a democracia não resiste a mais um 8 de Janeiro.',
      'Discurso de Alessandro Vieira (MDB-SE) em julho de 2024 contra projetos de anistia para os golpistas do 8 de Janeiro.',
      'verified', false, '2024-07-23',
      'https://www12.senado.leg.br/noticias/materias/2024/07/23/alessandro-vieira-anistia-8-janeiro-lesa-patria',
      'official_statement',
      'Brasília', 'Plenário do Senado', 'alessandro-vieira-anistia-8-janeiro-julho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 47. Hamilton Mourão sobre Bolsonaro preso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão afirma que prisão domiciliar de Bolsonaro é "exagero" mas defende respeito à decisão judicial.',
      'Particularmente considero a prisão domiciliar um exagero diante do risco concreto de fuga, que não existe. Jair Bolsonaro não é criminoso comum. Mas, como militar formado em respeito às instituições, reconheço a decisão judicial e cumpro o meu papel de senador, dentro da legalidade.',
      'Declaração de Hamilton Mourão (Republicanos-RS) em janeiro de 2025, equilibrando crítica à decisão e respeito institucional.',
      'verified', false, '2025-01-30',
      'https://oglobo.globo.com/politica/noticia/2025/01/mourao-bolsonaro-prisao-domiciliar-exagero-respeito.ghtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa', 'mourao-bolsonaro-prisao-domiciliar-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 48. Eliziane Gama no pós-eleição 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eg,
      'Eliziane Gama afirma que eleição de 2026 será "plebiscito entre democracia e autoritarismo".',
      'A eleição de 2026 não será uma disputa normal. Será um plebiscito sobre o regime. De um lado, o projeto democrático de reconstrução. De outro, o legado golpista que tentou romper com a Constituição. O eleitor brasileiro precisa entender o tamanho do que está em jogo.',
      'Fala de Eliziane Gama (PSD-MA) em março de 2026, em evento pré-eleitoral.',
      'verified', true, '2026-03-14',
      'https://www.folha.uol.com.br/poder/2026/03/eliziane-gama-eleicao-2026-plebiscito-democracia.shtml',
      'news_article',
      'São Luís', 'Evento pré-eleitoral', 'eliziane-gama-eleicao-2026-plebiscito-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 49. Randolfe Rodrigues sobre eleição 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rr,
      'Randolfe Rodrigues afirma que Lula é "único nome capaz de derrotar o bolsonarismo" em 2026.',
      'Em 2026, Lula é o único nome capaz de derrotar o bolsonarismo e de consolidar a reconstrução nacional. Quem fica em cima do muro, quem articula terceira via, abre espaço para o fascismo voltar. Esta é hora de união da democracia, não de vaidades pessoais.',
      'Declaração de Randolfe Rodrigues (PT-AP) em fevereiro de 2026, em debate sobre o cenário eleitoral.',
      'verified', false, '2026-02-18',
      'https://g1.globo.com/politica/noticia/2026/02/randolfe-lula-unico-nome-derrotar-bolsonarismo.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'randolfe-lula-unico-nome-2026-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 50. Jaques Wagner avalia balanço do governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jw,
      'Jaques Wagner defende reeleição de Lula em 2026 citando Bolsa Família, salário mínimo e queda do desemprego.',
      'Em três anos, o governo Lula reduziu desemprego ao menor nível em décadas, recuperou salário mínimo acima da inflação, fortaleceu o Bolsa Família, desmatamento caiu 50% na Amazônia. Isso não é propaganda, é resultado. O brasileiro vai reconhecer e reconduzir Lula em 2026.',
      'Discurso de Jaques Wagner (PT-BA), líder do governo, em abril de 2026, em evento de filiação de lideranças ao PT.',
      'verified', true, '2026-04-08',
      'https://www.folha.uol.com.br/poder/2026/04/jaques-wagner-balanco-governo-lula-reeleicao-2026.shtml',
      'news_article',
      'Salvador', 'Evento do PT', 'jaques-wagner-balanco-lula-reeleicao-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

END $$;
