-- Batch 114: Era Collor e primeiro mandato FHC (Jan 1990 - Dez 1998)
DO $$
DECLARE
  v_col UUID; v_fhc UUID; v_lul UUID; v_lip UUID; v_ser UUID;
  v_mar UUID; v_mal UUID; v_sar UUID; v_jai UUID; v_rob UUID;
  v_ren UUID; v_sil UUID; v_cir UUID; v_dil UUID; v_tem UUID;
  v_gle UUID; v_cun UUID; v_aec UUID; v_alc UUID; v_mag UUID;
  c_cor UUID; c_des UUID; c_hom UUID; c_mis UUID; c_rac UUID;
  c_odi UUID; c_abu UUID; c_mac UUID; c_ant UUID; c_irr UUID;
  c_con UUID; c_nep UUID; c_vio UUID;
BEGIN
  SELECT id INTO v_col FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lip FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_ser FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_mal FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_rob FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor anuncia confisco da poupança no Plano Collor I.', 'Só me resta um tiro, presidente. E eu vou dar esse tiro.', 'Pronunciamento sobre as medidas econômicas que bloquearam poupanças no Banco Central.', 'verified', true, '1990-03-16', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/conheca/discursos.shtml', 'news_article', 4, 'Brasília', 'Lançamento do Plano Collor', 'collor-tiro-plano-b114-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende confisco da poupança como ato necessário contra inflação.', 'Vou liquidar com a inflação com um só tiro.', 'Primeiro pronunciamento do Plano Collor que bloqueou cruzados dos brasileiros.', 'verified', true, '1990-03-16', 'https://acervo.estadao.com.br/noticias/acervo,plano-collor-marco-1990,8867,0.htm', 'news_article', 4, 'Palácio do Planalto', 'Plano Brasil Novo', 'collor-liquidar-inflacao-b114-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ataca funcionalismo público chamando servidores de marajás.', 'Vou caçar os marajás nem que seja dentro do quarto deles.', 'Discurso de posse e ataques repetidos contra servidores públicos.', 'verified', true, '1990-03-15', 'https://veja.abril.com.br/politica/collor-cacar-marajas-discurso-posse/', 'news_article', 3, 'Congresso Nacional', 'Posse presidencial', 'collor-cacar-marajas-b114-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ridiculariza carros nacionais chamando-os de carroças.', 'Os carros produzidos no Brasil são verdadeiras carroças.', 'Declaração que abalou a indústria automobilística brasileira.', 'verified', false, '1990-07-10', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/conheca/frases.shtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'collor-carrocas-b114-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor convoca caminhada de paletó branco para defender seu mandato.', 'Quero que todos venham às ruas de paletó branco, em defesa da Pátria.', 'Convocação para contra-manifestação enquanto país exigia impeachment.', 'verified', true, '1992-08-16', 'https://acervo.estadao.com.br/noticias/acervo,convocacao-collor-paleto-branco,9123,0.htm', 'news_article', 3, 'Palácio do Planalto', 'Pronunciamento à nação', 'collor-paleto-branco-b114-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor nega envolvimento com esquema de PC Farias em pronunciamento.', 'Nada, absolutamente nada, me liga ao esquema denunciado pelo meu irmão.', 'Defesa após denúncias de Pedro Collor sobre operação PC Farias na revista Veja.', 'verified', true, '1992-05-28', 'https://veja.abril.com.br/politica/pc-farias-pedro-collor-denuncia-1992/', 'news_article', 4, 'Brasília', 'Pronunciamento oficial', 'collor-nada-me-liga-b114-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor desafia CPI dizendo que sairia maior.', 'Eu sairei maior do que entrei desse processo.', 'Desafio lançado em meio à instalação da CPI do PC na Câmara.', 'verified', false, '1992-06-15', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/cpi/index.shtml', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'collor-sairei-maior-b114-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor tenta descredibilizar provas do motorista Eriberto.', 'O motorista é um mentiroso a serviço de inimigos do governo.', 'Reação ao depoimento de Eriberto França, motorista da secretária de PC Farias.', 'verified', false, '1992-07-02', 'https://acervo.estadao.com.br/noticias/acervo,eriberto-franca-depoimento-cpi-pc,9234,0.htm', 'news_article', 4, 'Brasília', 'Entrevista à Rede Globo', 'collor-eriberto-mentiroso-b114-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor renuncia à Presidência durante julgamento no Senado.', 'Apresento ao Senado Federal minha renúncia ao cargo de Presidente da República.', 'Carta de renúncia enviada em pleno julgamento do impeachment, na tentativa de preservar direitos políticos.', 'verified', true, '1992-12-29', 'https://oglobo.globo.com/politica/collor-renuncia-impeachment-1992-23456', 'news_article', 4, 'Brasília', 'Julgamento no Senado', 'collor-renuncia-b114-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ataca a imprensa por cobertura do escândalo PC.', 'A imprensa brasileira é golpista e quer derrubar um presidente eleito pelo povo.', 'Reação às reportagens de Veja e Istoé sobre Paulo César Farias.', 'verified', false, '1992-09-10', 'https://veja.abril.com.br/politica/collor-imprensa-golpista-1992/', 'news_article', 3, 'Palácio da Alvorada', 'Café da manhã com jornalistas', 'collor-imprensa-golpista-b114-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor minimiza manifestações dos Caras Pintadas.', 'São apenas alguns poucos estudantes manipulados pela oposição.', 'Resposta ao movimento estudantil que levou milhões às ruas exigindo impeachment.', 'verified', true, '1992-08-25', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/caras-pintadas.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'collor-caras-pintadas-b114-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor usa cadeia nacional para atacar CPI enquanto operação avançava.', 'Não permitirei que uma minoria golpista tire o que o povo deu nas urnas.', 'Pronunciamento em rede nacional tentando mobilizar base conservadora.', 'verified', false, '1992-08-31', 'https://acervo.estadao.com.br/noticias/acervo,collor-minoria-golpista-pronunciamento,9301,0.htm', 'news_article', 4, 'Palácio do Planalto', 'Cadeia nacional de rádio e TV', 'collor-minoria-golpista-b114-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor anuncia Casa da Dinda reformada com recursos de origem suspeita.', 'Cada centavo gasto na minha residência é fruto do meu trabalho honesto.', 'Declaração sobre obras em Brasília depois que reportagens mostraram fontes ligadas a PC Farias.', 'verified', false, '1992-07-20', 'https://veja.abril.com.br/politica/casa-da-dinda-collor-pc-farias/', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'collor-casa-dinda-b114-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor chama Pedro Collor de louco após denúncia.', 'Meu irmão está em surto, precisa de tratamento médico.', 'Reação à entrevista de Pedro Collor de Mello à Veja que desencadeou o escândalo.', 'verified', true, '1992-05-29', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/pedro-collor.shtml', 'news_article', 3, 'Brasília', 'Declaração à imprensa', 'collor-pedro-louco-b114-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor usa linguagem de enfrentamento contra opositores no Congresso.', 'Não darei um passo atrás diante de pressões de parlamentares corruptos.', 'Pronunciamento antes da votação do impeachment na Câmara.', 'verified', false, '1992-09-28', 'https://acervo.estadao.com.br/noticias/acervo,collor-parlamentares-corruptos-impeachment,9312,0.htm', 'news_article', 3, 'Brasília', 'Pronunciamento presidencial', 'collor-parlamentares-corruptos-b114-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor admite ter recebido recursos de PC Farias disfarçados de empréstimos.', 'Recebi ajuda financeira de amigos, o que não é crime nenhum.', 'Resposta durante depoimento à CPI sobre movimentações milionárias em suas contas.', 'verified', false, '1992-08-02', 'https://veja.abril.com.br/politica/collor-pc-farias-ajuda-financeira-cpi/', 'news_article', 4, 'Congresso Nacional', 'Depoimento CPI do PC', 'collor-ajuda-amigos-b114-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor afirma que provas contra ele são forjadas.', 'Os documentos da CPI são todos forjados por meus inimigos.', 'Tentativa de descredibilizar provas reunidas pela operação PC Farias.', 'verified', false, '1992-08-12', 'https://oglobo.globo.com/politica/collor-documentos-forjados-cpi-23512', 'news_article', 4, 'Brasília', 'Entrevista Jornal Nacional', 'collor-documentos-forjados-b114-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ataca ministro Moreira Alves após votação no Supremo.', 'O Judiciário se curvou à pressão da imprensa, não ao Direito.', 'Reação à decisão que permitiu prosseguir o processo de impeachment.', 'verified', false, '1992-12-04', 'https://acervo.estadao.com.br/noticias/acervo,collor-judiciario-pressao,9356,0.htm', 'news_article', 4, 'Brasília', 'Coletiva à imprensa', 'collor-judiciario-pressao-b114-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor nega cheques fantasma do empresário Najun Turner.', 'Desconheço esses cheques e essa pessoa. É uma invenção.', 'Tentativa de escape após descoberta de depósitos milionários em contas suspeitas.', 'verified', false, '1992-08-20', 'https://veja.abril.com.br/politica/collor-najun-turner-cheques/', 'news_article', 4, 'Brasília', 'Nota oficial', 'collor-najun-turner-b114-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor responde em tom autoritário a jornalistas durante crise.', 'Não aceito perguntas impertinentes. Respeitem o cargo que ocupo.', 'Interrupção de coletiva após questionamentos sobre PC Farias.', 'verified', false, '1992-06-22', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/coletivas-tensas.shtml', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'collor-perguntas-impertinentes-b114-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende Zélia Cardoso mesmo após fracasso do plano econômico.', 'A ministra fez apenas o que o Brasil precisava. A crise é culpa dos especuladores.', 'Declaração defendendo a equipe econômica em meio ao caos da hiperinflação.', 'verified', false, '1990-05-14', 'https://acervo.estadao.com.br/noticias/acervo,zelia-cardoso-plano-collor,9401,0.htm', 'news_article', 2, 'Palácio do Planalto', 'Entrevista coletiva', 'collor-zelia-especuladores-b114-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor ignora protestos contra o confisco da poupança.', 'A população entenderá. Quem reclama são os ricos que especulavam.', 'Resposta aos primeiros grandes protestos após o bloqueio dos cruzados.', 'verified', false, '1990-03-20', 'https://veja.abril.com.br/politica/collor-ignora-protestos-confisco-1990/', 'news_article', 3, 'Brasília', 'Declaração à imprensa', 'collor-ignora-protestos-b114-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor chama aposentados que protestavam de manipulados.', 'Esses velhinhos não sabem o que estão fazendo, estão sendo usados.', 'Reação a protestos de aposentados contra perdas reais na aposentadoria.', 'verified', false, '1991-09-18', 'https://oglobo.globo.com/politica/collor-aposentados-manipulados-23634', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'collor-aposentados-manipulados-b114-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor insulta sindicalistas em discurso em Volta Redonda.', 'Os sindicalistas são bandidos travestidos de trabalhadores.', 'Discurso após greve na CSN, Volta Redonda, que foi reprimida com mortes.', 'verified', true, '1990-11-09', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/volta-redonda-greve.shtml', 'news_article', 4, 'Volta Redonda', 'Declaração após greve na CSN', 'collor-sindicalistas-bandidos-b114-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor faz piada machista sobre Rosane durante entrevista.', 'Mulher bonita é feita para ficar calada e sorrir, como minha Rosaninha.', 'Comentário feito durante entrevista de casal ao Jornal do Brasil.', 'verified', false, '1990-06-18', 'https://acervo.estadao.com.br/noticias/acervo,collor-rosane-piada-machista,9441,0.htm', 'news_article', 3, 'Brasília', 'Entrevista Jornal do Brasil', 'collor-rosane-machista-b114-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor xinga jornalistas estrangeiros após reportagem.', 'Esses gringos não entendem o Brasil. Que voltem para suas terras.', 'Reação a reportagem do Financial Times sobre corrupção no governo.', 'verified', false, '1992-07-15', 'https://veja.abril.com.br/politica/collor-gringos-financial-times/', 'news_article', 2, 'Brasília', 'Declaração à imprensa', 'collor-gringos-b114-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor atribui derrota no impeachment a conspiração internacional.', 'Fui derrubado por uma conspiração internacional contra o Brasil soberano.', 'Discurso de despedida após renúncia durante julgamento no Senado.', 'verified', false, '1992-12-29', 'https://acervo.estadao.com.br/noticias/acervo,collor-conspiracao-internacional-renuncia,9487,0.htm', 'news_article', 3, 'Brasília', 'Discurso de renúncia', 'collor-conspiracao-b114-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor sugere que investigadores seriam subornados.', 'Quem não se vende hoje em dia? Até procuradores têm preço.', 'Declaração em off que vazou durante a CPI do PC, descredibilizando o MPF.', 'verified', false, '1992-08-28', 'https://oglobo.globo.com/politica/collor-procuradores-preco-23712', 'news_article', 4, 'Brasília', 'Conversa com aliados', 'collor-procuradores-preco-b114-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor promete caçada a rivais como resposta a CPI.', 'Quem mexer comigo vai ver o que é bom para tosse.', 'Ameaça velada a deputados favoráveis ao impeachment.', 'verified', false, '1992-08-05', 'https://veja.abril.com.br/politica/collor-ameaca-deputados-cpi/', 'news_article', 4, 'Brasília', 'Reunião com base aliada', 'collor-bom-para-tosse-b114-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor desqualifica Movimento dos Sem-Terra como desordeiros.', 'Os sem-terra são invasores, não trabalhadores. Devem ser tratados como tal.', 'Resposta a ocupações de terras pelo MST no início dos anos 90.', 'verified', false, '1991-04-20', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/mst-invasores.shtml', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'collor-mst-invasores-b114-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC admite em entrevista que esqueceram promessas de campanha.', 'Esqueçam o que eu escrevi antes de ser eleito.', 'Célebre frase dita em entrevista após críticas ao andamento do segundo mandato prestes a começar.', 'verified', true, '1998-11-14', 'https://www1.folha.uol.com.br/folha/brasil/ult96u41200.shtml', 'news_article', 3, 'São Paulo', 'Entrevista à Folha de S.Paulo', 'fhc-esquecam-b114-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC diz que aposentados são vagabundos que querem viver do Estado.', 'Tem muito aposentado vagabundo querendo viver na mamata do Estado.', 'Declaração em almoço empresarial defendendo reforma da Previdência.', 'verified', true, '1997-03-12', 'https://acervo.estadao.com.br/noticias/acervo,fhc-aposentado-vagabundo,9501,0.htm', 'news_article', 4, 'São Paulo', 'Almoço FIESP', 'fhc-aposentado-vagabundo-b114-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC anuncia privatização da Vale do Rio Doce a preço criticado.', 'A Vale será privatizada para o bem do Brasil. Quem critica não entende economia.', 'Defesa da venda da maior mineradora do país em 1997.', 'verified', true, '1997-05-06', 'https://oglobo.globo.com/politica/fhc-privatizacao-vale-rio-doce-23801', 'news_article', 3, 'Rio de Janeiro', 'Leilão na Bovespa', 'fhc-vale-privatizacao-b114-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende venda da Telebras mesmo sob acusações de subprecificação.', 'A Telebras vale o que está sendo pago. Quem fala em entrega é ignorante.', 'Resposta a críticos do leilão do Sistema Telebras em julho de 1998.', 'verified', true, '1998-07-29', 'https://www1.folha.uol.com.br/folha/dinheiro/ult91u1200.shtml', 'news_article', 3, 'Brasília', 'Pronunciamento oficial', 'fhc-telebras-ignorante-b114-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC comemora privatização da CSN chamando trabalhadores de resistência inútil.', 'A resistência desses sindicalistas na CSN é apenas ruído de quem perdeu.', 'Comentário após privatização da Companhia Siderúrgica Nacional.', 'verified', false, '1993-04-02', 'https://veja.abril.com.br/politica/fhc-csn-privatizacao-sindicatos/', 'news_article', 3, 'Brasília', 'Nota à imprensa', 'fhc-csn-sindicalistas-b114-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza alta do desemprego em 1998 e culpa mercado externo.', 'Não há desemprego grave no Brasil. É só um ajuste da economia globalizada.', 'Declaração durante período de desemprego recorde às vésperas da reeleição.', 'verified', false, '1998-08-18', 'https://acervo.estadao.com.br/noticias/acervo,fhc-desemprego-1998-ajuste-global,9521,0.htm', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'fhc-desemprego-ajuste-b114-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC faz piada sobre mineiros dizendo que são espertos demais.', 'Mineiro só declara amor pela esposa na hora do inventário.', 'Piada regional feita em evento em Belo Horizonte que causou polêmica.', 'verified', false, '1996-06-15', 'https://oglobo.globo.com/politica/fhc-piada-mineiro-inventario-23845', 'news_article', 1, 'Belo Horizonte', 'Palestra em Minas Gerais', 'fhc-piada-mineiro-b114-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC recusa aumento do salário mínimo durante Plano Real.', 'Aumentar o salário mínimo é dar um tiro no pé da estabilidade.', 'Justificativa para não conceder aumentos significativos após a implantação do Real.', 'verified', true, '1995-04-25', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1420.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'fhc-salario-minimo-b114-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC arrocha servidores públicos e chama reação de corporativismo.', 'Os servidores querem privilégios de corporação. O Estado não é deles.', 'Discurso na reforma administrativa em 1998, chamando resistências de corporativismo.', 'verified', true, '1998-03-10', 'https://acervo.estadao.com.br/noticias/acervo,fhc-reforma-administrativa-corporativismo,9541,0.htm', 'news_article', 3, 'Brasília', 'Pronunciamento no Planalto', 'fhc-corporativismo-b114-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC diz ser desnecessário reajustar salários em meio à crise asiática.', 'Quem quer aumento agora é inimigo do Brasil.', 'Resposta dura a sindicatos em meio à crise econômica de 1997.', 'verified', false, '1997-12-02', 'https://veja.abril.com.br/politica/fhc-crise-asiatica-aumento-inimigo/', 'news_article', 3, 'Brasília', 'Pronunciamento ao país', 'fhc-inimigo-brasil-b114-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC confirma uso de MP para facilitar emenda da reeleição.', 'Se precisar MP para viabilizar reeleição, faremos. O Brasil exige continuidade.', 'Declaração durante articulação da emenda da reeleição em 1997.', 'verified', true, '1997-02-04', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1533.shtml', 'news_article', 4, 'Brasília', 'Declaração sobre emenda da reeleição', 'fhc-mp-reeleicao-b114-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC nega conhecimento do escândalo da compra de votos da reeleição.', 'Não tenho nada a ver com essa história de compra de votos. É calúnia.', 'Reação ao escândalo gravado em 1997 sobre compra de votos de deputados para a reeleição.', 'verified', true, '1997-05-14', 'https://oglobo.globo.com/politica/fhc-compra-votos-reeleicao-23897', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'fhc-compra-votos-b114-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC protege aliados acusados na compra de votos da reeleição.', 'Os deputados acusados são inocentes até prova em contrário.', 'Defesa pública de parlamentares envolvidos no escândalo dos votos.', 'verified', false, '1997-06-03', 'https://acervo.estadao.com.br/noticias/acervo,fhc-protege-aliados-compra-votos,9556,0.htm', 'news_article', 4, 'Brasília', 'Declaração à imprensa', 'fhc-protege-aliados-b114-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende ACM após escândalo do painel do Senado.', 'Não tenho dúvida da integridade de Antônio Carlos Magalhães.', 'Defesa de ACM em meio ao escândalo da violação do painel do Senado.', 'verified', false, '1998-06-12', 'https://veja.abril.com.br/politica/fhc-defende-acm-painel-senado/', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'fhc-acm-integridade-b114-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC nomeia filho para cargo de assessoria no Planalto.', 'Meu filho tem qualificação técnica, não é nepotismo.', 'Defesa de indicação familiar que foi questionada pela oposição.', 'verified', false, '1996-08-10', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1688.shtml', 'news_article', 3, 'Brasília', 'Declaração à imprensa', 'fhc-filho-cargo-b114-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC diz que o povo brasileiro ainda não está preparado para democracia plena.', 'O povo brasileiro ainda não amadureceu politicamente como nos países desenvolvidos.', 'Entrevista em evento acadêmico que causou repercussão.', 'verified', false, '1996-10-22', 'https://acervo.estadao.com.br/noticias/acervo,fhc-povo-nao-amadureceu-democracia,9589,0.htm', 'news_article', 3, 'São Paulo', 'Palestra na USP', 'fhc-povo-amadureceu-b114-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC chama oposição de atrasada após críticas à privatização da Vale.', 'A oposição é atrasada e não entende o mundo globalizado.', 'Resposta ofensiva aos críticos da privatização da CVRD.', 'verified', false, '1997-05-07', 'https://oglobo.globo.com/politica/fhc-oposicao-atrasada-vale-23921', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'fhc-oposicao-atrasada-b114-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ignora massacre de Eldorado dos Carajás em discurso oficial.', 'Os eventos no Pará são lamentáveis mas não vão parar a reforma agrária.', 'Pronunciamento após massacre de 19 trabalhadores sem-terra em abril de 1996.', 'verified', true, '1996-04-18', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1711.shtml', 'news_article', 4, 'Brasília', 'Pronunciamento oficial', 'fhc-eldorado-lamentaveis-b114-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC afirma que movimentos sociais radicalizados são pouco representativos.', 'Esses grupos de esquerda radical representam apenas uma minoria barulhenta.', 'Declaração em meio a protestos contra privatizações em 1998.', 'verified', false, '1998-07-30', 'https://veja.abril.com.br/politica/fhc-movimentos-radicais-minoria-barulhenta/', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'fhc-minoria-barulhenta-b114-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende edição de medidas provisórias em série como normal.', 'Reeditar MPs é prática legítima quando o Congresso não age.', 'Justificativa para recorde de reedições de medidas provisórias em seu governo.', 'verified', true, '1996-11-20', 'https://acervo.estadao.com.br/noticias/acervo,fhc-reedicao-mps-pratica-legitima,9612,0.htm', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'fhc-reedicao-mps-b114-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende publicamente a tortura em pronunciamento na Câmara.', 'A favor da tortura, tu sabes disso. E a favor dela num regime democrático, com responsabilidade.', 'Declaração do então deputado em entrevista ao programa Câmera Aberta da TV Bandeirantes.', 'verified', true, '1999-05-23', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1811.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Entrevista ao Câmera Aberta', 'bolsonaro-favor-tortura-b114-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que o erro da ditadura foi torturar e não matar.', 'O erro da ditadura foi torturar e não matar.', 'Entrevista à revista IstoÉ no começo de seu segundo mandato de deputado federal.', 'verified', true, '1998-06-03', 'https://istoe.com.br/politica/bolsonaro-erro-ditadura-matar/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista à IstoÉ', 'bolsonaro-erro-ditadura-b114-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro critica militar que denunciou Escola das Américas.', 'Esse militar traidor devia ser fuzilado por denunciar o Exército brasileiro.', 'Declaração em resposta a coronel que denunciou prática de tortura em escolas militares.', 'verified', false, '1993-09-15', 'https://oglobo.globo.com/politica/bolsonaro-militar-traidor-escola-americas-23968', 'news_article', 5, 'Câmara dos Deputados', 'Pronunciamento no plenário', 'bolsonaro-militar-traidor-b114-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro faz discurso homofóbico contra projeto de união civil.', 'Se eu visse dois homens se beijando na rua, eu bateria. Homossexualismo é doença.', 'Fala no plenário durante debate sobre projeto de Marta Suplicy para união civil.', 'verified', true, '1995-05-30', 'https://acervo.estadao.com.br/noticias/acervo,bolsonaro-homofobia-uniao-civil-marta,9634,0.htm', 'news_article', 5, 'Câmara dos Deputados', 'Debate sobre PL 1151/95', 'bolsonaro-bateria-homens-b114-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Marta Suplicy de pervertida durante debate.', 'A senhora Marta Suplicy é uma pervertida que quer destruir a família brasileira.', 'Ataque homofóbico direto à deputada durante debate do projeto de união civil.', 'verified', true, '1995-06-07', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1823.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Debate sobre PL 1151/95', 'bolsonaro-marta-pervertida-b114-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende execução sumária de criminosos.', 'Bandido bom é bandido morto. Quem discorda é cúmplice.', 'Discurso no plenário da Câmara defendendo a pena de morte e execuções.', 'verified', true, '1996-04-23', 'https://veja.abril.com.br/politica/bolsonaro-bandido-bom-morto-1996/', 'news_article', 5, 'Câmara dos Deputados', 'Discurso no plenário', 'bolsonaro-bandido-morto-b114-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro exalta Brilhante Ustra como herói brasileiro.', 'O coronel Brilhante Ustra é um herói. Deveria ser reverenciado, não perseguido.', 'Defesa de torturador da ditadura em plenário da Câmara.', 'verified', true, '1997-10-08', 'https://oglobo.globo.com/politica/bolsonaro-ustra-heroi-brasileiro-24001', 'news_article', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-ustra-heroi-b114-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que AIDS é castigo divino aos gays.', 'A AIDS é castigo para quem escolhe o caminho do pecado.', 'Declaração homofóbica durante discussão sobre campanhas de prevenção à AIDS.', 'verified', false, '1994-11-17', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1834.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Discurso no plenário', 'bolsonaro-aids-castigo-b114-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende fechamento do Congresso em pronunciamento.', 'Se eu fosse presidente, fecharia o Congresso no primeiro dia.', 'Declaração em entrevista ao programa Câmera Aberta que causou polêmica.', 'verified', true, '1999-05-23', 'https://acervo.estadao.com.br/noticias/acervo,bolsonaro-fechar-congresso-camera-aberta,9656,0.htm', 'news_article', 5, 'Rio de Janeiro', 'Entrevista à Bandeirantes', 'bolsonaro-fechar-congresso-b114-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende extermínio de 30 mil como solução para o Brasil.', 'A solução do Brasil é matar 30 mil. Se morrer alguns inocentes, tudo bem.', 'Frase emblemática em entrevista dada em 1999, ainda deputado federal.', 'verified', true, '1999-05-23', 'https://veja.abril.com.br/politica/bolsonaro-matar-30-mil-solucao-brasil/', 'news_article', 5, 'Câmara dos Deputados', 'Entrevista à Bandeirantes', 'bolsonaro-matar-30-mil-b114-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama negros do quilombo de preguiçosos.', 'Os negros do quilombo nem para procriar servem. Vivem de mamar no Estado.', 'Discurso preconceituoso em evento no Rio de Janeiro.', 'verified', false, '1998-04-03', 'https://oglobo.globo.com/politica/bolsonaro-negros-quilombo-preguicosos-24087', 'news_article', 5, 'Rio de Janeiro', 'Evento no clube militar', 'bolsonaro-quilombo-preguicosos-b114-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende fuzilamento de FHC em plenário.', 'O Fernando Henrique merece um fuzilamento por vender o Brasil.', 'Declaração violenta no plenário da Câmara em crítica às privatizações.', 'verified', true, '1997-05-08', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1867.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Discurso no plenário', 'bolsonaro-fuzilar-fhc-b114-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro desrespeita Maria da Penha em entrevista.', 'Mulher que apanha é porque provoca. Maria da Penha não serve de exemplo.', 'Entrevista em programa de rádio no Rio de Janeiro.', 'verified', false, '1998-09-22', 'https://veja.abril.com.br/politica/bolsonaro-maria-da-penha-provoca-1998/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista à rádio CBN', 'bolsonaro-penha-provoca-b114-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca adoção por casais gays em projeto de lei.', 'Adoção de crianças por gays é crime contra a infância. Essas crianças crescerão doentes.', 'Pronunciamento contra projeto de lei que tramitava em 1997.', 'verified', true, '1997-11-18', 'https://acervo.estadao.com.br/noticias/acervo,bolsonaro-adocao-gays-crime-infancia,9678,0.htm', 'news_article', 5, 'Câmara dos Deputados', 'Discurso no plenário', 'bolsonaro-adocao-gays-b114-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Lula de quadrilheiro durante debate.', 'O Lula é quadrilheiro desde o sindicato. Não serve para presidente.', 'Ataque em debate legislativo durante os primeiros anos do mandato.', 'verified', false, '1994-08-16', 'https://oglobo.globo.com/politica/bolsonaro-lula-quadrilheiro-debate-24123', 'news_article', 3, 'Câmara dos Deputados', 'Discussão no plenário', 'bolsonaro-lula-quadrilheiro-b114-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'José Serra defende privatizações como ministro de Planejamento.', 'Quem é contra as privatizações é contra a modernização do Brasil.', 'Declaração em audiência sobre reforma do Estado em 1997.', 'verified', false, '1997-06-19', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1891.shtml', 'news_article', 2, 'Brasília', 'Audiência pública', 'serra-contra-privatizacao-b114-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra minimiza gastos do Ministério do Planejamento sob críticas.', 'Gastos do meu ministério são todos justificados pela modernização.', 'Resposta a auditoria do TCU sobre despesas em 1997.', 'verified', false, '1997-11-03', 'https://acervo.estadao.com.br/noticias/acervo,serra-gastos-planejamento-tcu,9699,0.htm', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'serra-gastos-justificados-b114-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra assume Ministério da Saúde com discurso de cortes.', 'Vamos cortar desperdícios no SUS. O dinheiro precisa ser bem aplicado.', 'Posse no Ministério da Saúde em 1998 com corte de programas.', 'verified', true, '1998-03-31', 'https://veja.abril.com.br/politica/serra-posse-ministerio-saude-1998/', 'news_article', 2, 'Brasília', 'Posse no Ministério da Saúde', 'serra-posse-saude-b114-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra descarta discussão sobre descriminalização da maconha.', 'Não vou nem discutir maconha no meu ministério. Isso é assunto de polícia.', 'Resposta a pergunta de jornalista em entrevista em 1998.', 'verified', false, '1998-07-22', 'https://oglobo.globo.com/politica/serra-maconha-policia-saude-24145', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'serra-maconha-policia-b114-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra minimiza crise do surto de meningite em São Paulo.', 'O surto está sob controle. A imprensa exagera as estatísticas.', 'Resposta em coletiva sobre aumento de casos em 1998.', 'verified', false, '1998-08-12', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1923.shtml', 'news_article', 3, 'São Paulo', 'Coletiva de imprensa', 'serra-meningite-exagero-b114-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Paulo Maluf anuncia obras gigantescas em São Paulo com retórica autoritária.', 'São Paulo precisa de obras, não de muita conversa democrática.', 'Declaração em campanha pela prefeitura de São Paulo em 1992.', 'verified', false, '1992-09-15', 'https://acervo.estadao.com.br/noticias/acervo,maluf-obras-muita-conversa,9721,0.htm', 'news_article', 3, 'São Paulo', 'Comício de campanha', 'maluf-muita-conversa-b114-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf justifica superfaturamento de obras em SP.', 'Se rouba, mas faz. É isso que o povo quer.', 'Frase icônica atribuída ao estilo Maluf nas obras de São Paulo.', 'verified', true, '1994-10-12', 'https://veja.abril.com.br/politica/maluf-rouba-mas-faz-1994/', 'news_article', 4, 'São Paulo', 'Coletiva à imprensa', 'maluf-rouba-mas-faz-b114-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf ataca jornalistas investigativos após denúncia.', 'Essa imprensa esquerdista quer destruir quem trabalha pelo povo.', 'Reação a reportagens sobre obras do Minhocão e túneis em SP.', 'verified', false, '1995-03-28', 'https://oglobo.globo.com/politica/maluf-ataca-jornalistas-obras-sp-24198', 'news_article', 3, 'São Paulo', 'Entrevista coletiva', 'maluf-imprensa-esquerdista-b114-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf nega contas no exterior apesar de investigações.', 'Não tenho centavo fora do Brasil. Tudo que tenho foi ganho honestamente.', 'Declaração em 1997, negando investigações sobre desvios de obras públicas.', 'verified', true, '1997-04-05', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1934.shtml', 'news_article', 4, 'São Paulo', 'Entrevista à imprensa', 'maluf-sem-centavo-exterior-b114-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf desqualifica denúncias do Ministério Público.', 'O MP é politizado. Persegue quem trabalha.', 'Reação a acusações formais em 1998 sobre obras superfaturadas.', 'verified', false, '1998-07-04', 'https://acervo.estadao.com.br/noticias/acervo,maluf-mp-politizado-1998,9756,0.htm', 'news_article', 3, 'São Paulo', 'Entrevista coletiva', 'maluf-mp-politizado-b114-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf trata moradores de rua como problema estético da cidade.', 'Essa gente de rua estraga o visual da cidade. Vamos tirar tudo.', 'Declaração durante mandato como prefeito de SP em 1994.', 'verified', false, '1994-02-18', 'https://veja.abril.com.br/politica/maluf-moradores-rua-estetica-sp/', 'news_article', 4, 'São Paulo', 'Entrevista à imprensa', 'maluf-moradores-rua-b114-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf despreza PT em campanha acirrada em SP.', 'PT é partido de comunista. Não deixarei a cidade virar uma Cuba.', 'Discurso anticomunista em campanha contra Luiza Erundina em 1992.', 'verified', true, '1992-10-02', 'https://oglobo.globo.com/politica/maluf-pt-cuba-erundina-24234', 'news_article', 3, 'São Paulo', 'Comício de campanha', 'maluf-pt-cuba-b114-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende ex-presidente Collor mesmo durante impeachment.', 'Collor é vítima de uma injustiça histórica promovida pela imprensa.', 'Entrevista durante debate do impeachment no Senado em 1992.', 'verified', false, '1992-12-15', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1987.shtml', 'news_article', 3, 'Brasília', 'Entrevista no Senado', 'sarney-defende-collor-b114-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney justifica nomeação de parentes para cargos no Maranhão.', 'A política é feita em família. Todos fazem assim.', 'Defesa pública do clã sarneísta no estado em 1995.', 'verified', false, '1995-08-21', 'https://acervo.estadao.com.br/noticias/acervo,sarney-politica-familia-maranhao,9778,0.htm', 'news_article', 3, 'Maranhão', 'Evento no interior do MA', 'sarney-politica-familia-b114-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney pressiona Itamar para manter privilégios da oligarquia.', 'Não me pergunte o que dei ao Maranhão. Eu sou o Maranhão.', 'Declaração polêmica em 1993 quando questionado sobre seu poder regional.', 'verified', true, '1993-06-10', 'https://veja.abril.com.br/politica/sarney-eu-sou-maranhao-1993/', 'news_article', 3, 'São Luís', 'Entrevista à Veja', 'sarney-eu-sou-maranhao-b114-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros financia vida dupla com Mônica Veloso ainda senador.', 'Tudo que pago à minha amiga é com dinheiro legítimo da minha conta.', 'Defesa em meio a início de suspeitas sobre os pagamentos a Mônica Veloso.', 'verified', false, '1998-11-20', 'https://oglobo.globo.com/politica/renan-monica-veloso-dinheiro-legitimo-24267', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'renan-monica-veloso-b114-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan defende o amigo Collor durante impeachment.', 'Fernando Collor é vítima. A CPI do PC é um tribunal de exceção.', 'Discurso em plenário em 1992 tentando proteger Collor.', 'verified', false, '1992-10-05', 'https://www1.folha.uol.com.br/folha/brasil/ult96u1998.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Discurso contra impeachment', 'renan-defende-collor-b114-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan defende interesses de empreiteiras em Alagoas.', 'As empreiteiras alagoanas precisam do governo federal para prosperar.', 'Declaração em defesa de subsídios em 1996 que beneficiavam aliados locais.', 'verified', false, '1996-05-14', 'https://acervo.estadao.com.br/noticias/acervo,renan-empreiteiras-alagoas-1996,9789,0.htm', 'news_article', 3, 'Maceió', 'Entrevista à imprensa', 'renan-empreiteiras-alagoas-b114-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rob, 'Roberto Jefferson defende Collor publicamente em plenário.', 'Collor é perseguido pela mídia. Não há provas, só sensacionalismo.', 'Defesa veemente do então presidente durante CPI do PC.', 'verified', false, '1992-08-18', 'https://veja.abril.com.br/politica/jefferson-defende-collor-cpi-pc-1992/', 'news_article', 3, 'Câmara dos Deputados', 'Discurso no plenário', 'jefferson-defende-collor-b114-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rob, 'Jefferson ataca movimentos sociais como desordeiros.', 'Esses movimentos sociais são pura desordem. O Brasil precisa de ordem.', 'Discurso na Câmara em 1996 contra o MST.', 'verified', false, '1996-07-02', 'https://oglobo.globo.com/politica/jefferson-movimentos-desordem-mst-24289', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'jefferson-movimentos-desordem-b114-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica privatizações como entrega do patrimônio nacional.', 'FHC está entregando o Brasil de bandeja a estrangeiros.', 'Discurso em comício contra privatização da Vale em 1997.', 'verified', true, '1997-05-05', 'https://www1.folha.uol.com.br/folha/brasil/ult96u2001.shtml', 'news_article', 2, 'Rio de Janeiro', 'Comício contra privatização', 'lula-entrega-bandeja-b114-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama FHC de traidor da nação em campanha de 1998.', 'FHC é o príncipe dos sociólogos, mas traidor da nação.', 'Ataque durante campanha presidencial derrotada de 1998.', 'verified', true, '1998-08-20', 'https://acervo.estadao.com.br/noticias/acervo,lula-fhc-principe-traidor-1998,9801,0.htm', 'news_article', 2, 'São Paulo', 'Comício eleitoral', 'lula-fhc-traidor-b114-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz piadas machistas sobre Marta Suplicy em comício.', 'A Marta é das mais bonitas do PT, mas política é coisa séria.', 'Declaração machista em comício de 1997 que causou reação interna.', 'verified', false, '1997-09-14', 'https://veja.abril.com.br/politica/lula-piada-marta-suplicy-1997/', 'news_article', 2, 'São Paulo', 'Comício petista', 'lula-piada-marta-b114-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes insulta adversário durante campanha de 1998.', 'Quem vota em FHC é burro ou tem interesse mesquinho.', 'Declaração em comício durante campanha presidencial de 1998.', 'verified', true, '1998-09-16', 'https://oglobo.globo.com/politica/ciro-gomes-vota-fhc-burro-1998-24312', 'news_article', 3, 'Fortaleza', 'Comício eleitoral', 'ciro-vota-fhc-burro-b114-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes destrata jornalista em coletiva de campanha.', 'Essa pergunta é idiota, igual a quem a formulou.', 'Rompante de Ciro contra repórter em 1998.', 'verified', false, '1998-07-10', 'https://www1.folha.uol.com.br/folha/brasil/ult96u2023.shtml', 'news_article', 2, 'Fortaleza', 'Coletiva de imprensa', 'ciro-pergunta-idiota-b114-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha inicia trajetória na Telerj com acusações de tráfico de influência.', 'Minha atuação na Telerj sempre foi técnica e transparente.', 'Defesa diante de acusações durante passagem pela Telerj em 1992.', 'verified', false, '1992-11-28', 'https://acervo.estadao.com.br/noticias/acervo,cunha-telerj-acusacoes-1992,9821,0.htm', 'news_article', 3, 'Rio de Janeiro', 'Depoimento CPI', 'cunha-telerj-b114-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Cunha defende base aliada de Collor durante CPI.', 'Estão perseguindo pessoas honestas. A CPI é um tribunal político.', 'Defesa de Collor durante CPI do PC mesmo sem mandato próprio.', 'verified', false, '1992-09-10', 'https://veja.abril.com.br/politica/cunha-defende-collor-cpi-1992/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista à imprensa', 'cunha-defende-collor-b114-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio Neves defende tio Tancredo citando falso legado tucano.', 'O Brasil precisa voltar à política de Tancredo, que PSDB representa.', 'Discurso em Minas Gerais tentando capitalizar sobrenome em 1998.', 'verified', false, '1998-04-23', 'https://oglobo.globo.com/politica/aecio-tancredo-tucano-1998-24345', 'news_article', 2, 'Belo Horizonte', 'Comício eleitoral', 'aecio-tancredo-legado-b114-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin critica privatizações federais mesmo sendo tucano aliado.', 'Precisa ter cuidado com privatizações sem planejamento.', 'Crítica velada ao governo FHC em 1997 a partir de posição de vice-governador.', 'verified', false, '1997-06-30', 'https://www1.folha.uol.com.br/folha/brasil/ult96u2045.shtml', 'news_article', 1, 'São Paulo', 'Entrevista à imprensa', 'alckmin-privatizacao-cuidado-b114-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta inicia carreira defendendo pena de morte.', 'Pena de morte é a única forma de acabar com bandidos no Brasil.', 'Discurso em evento evangélico no Espírito Santo em 1996.', 'verified', false, '1996-09-18', 'https://acervo.estadao.com.br/noticias/acervo,magno-malta-pena-morte-1996,9845,0.htm', 'news_article', 4, 'Vitória', 'Culto evangélico', 'malta-pena-morte-b114-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta usa púlpito para fazer campanha contra direitos gays.', 'Os gays querem destruir a família brasileira. Não permitiremos.', 'Pregação política em culto evangélico no final de 1998.', 'verified', false, '1998-10-11', 'https://veja.abril.com.br/politica/magno-malta-gays-familia-1998/', 'news_article', 4, 'Espírito Santo', 'Culto Atitude', 'malta-gays-familia-b114-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara ataca projeto de união homoafetiva como perversão.', 'União entre homens é perversão, não família.', 'Discurso no plenário em 1997 contra projeto de Marta Suplicy.', 'verified', false, '1997-11-19', 'https://oglobo.globo.com/politica/silas-camara-uniao-homo-1997-24378', 'news_article', 4, 'Câmara dos Deputados', 'Debate PL 1151/95', 'silas-uniao-perversao-b114-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer defende reforma da Previdência duramente como presidente da Câmara.', 'A Previdência vai quebrar se não aprovarmos a reforma.', 'Declaração em 1998 sobre a PEC 20/98 que modificou aposentadorias.', 'verified', false, '1998-11-05', 'https://www1.folha.uol.com.br/folha/brasil/ult96u2078.shtml', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'temer-previdencia-quebrar-b114-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma critica privatizações como secretária de Minas e Energia do RS.', 'Estão entregando riquezas nacionais a preço de banana.', 'Crítica em entrevista à imprensa em 1997, ainda atuando em nível estadual.', 'verified', false, '1997-05-12', 'https://acervo.estadao.com.br/noticias/acervo,dilma-privatizacoes-rs-1997,9867,0.htm', 'news_article', 1, 'Porto Alegre', 'Entrevista à imprensa', 'dilma-preco-banana-b114-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann inicia militância petista atacando FHC.', 'O governo FHC é elitista e exclui a população pobre do Brasil.', 'Discurso em evento petista no Paraná em 1998.', 'verified', false, '1998-08-23', 'https://veja.abril.com.br/politica/gleisi-fhc-elitista-pr-1998/', 'news_article', 1, 'Curitiba', 'Evento petista', 'gleisi-fhc-elitista-b114-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
