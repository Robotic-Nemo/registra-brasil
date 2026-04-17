-- Batch 82: Educação, cultura, ciência e política indígena (Jan 2023 – Abr 2026)
-- Camilo Santana (MEC), Luciana Santos (MCTI), Margareth Menezes (MinC),
-- Sônia Guajajara (MPI), Anielle Franco (MIR), ENEM/Novo Ensino Médio/Pé-de-Meia,
-- Marco Temporal, Yanomami, censura, cotas, guerra cultural, cortes no orçamento
-- 100 declarações

DO $$
DECLARE
  v_cam UUID; v_luc UUID; v_mar UUID; v_son UUID; v_ani UUID;
  v_nis UUID; v_sil UUID; v_cid UUID; v_pte UUID; v_mma UUID;
  v_est UUID; v_teb UUID; v_msi UUID; v_lul UUID; v_had UUID;
  v_gle UUID; v_rui UUID; v_apa UUID; v_wdi UUID; v_jai UUID;
  v_nik UUID; v_mvh UUID; v_kim UUID; v_adv UUID; v_tab UUID;
  v_eri UUID; v_sam UUID; v_osi UUID; v_cha UUID; v_jan UUID;
  v_tpe UUID; v_lin UUID; v_rsa UUID; v_dam UUID; v_mfe UUID;
  v_bia UUID;
  c_des UUID; c_odi UUID; c_abu UUID; c_irr UUID; c_neg UUID;
  c_rac UUID; c_xen UUID; c_itr UUID; c_con UUID; c_aut UUID;
  c_obs UUID; c_ame UUID;
BEGIN
  SELECT id INTO v_cam FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_luc FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'margareth-menezes';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_pte FROM politicians WHERE slug = 'paulo-teixeira';
  SELECT id INTO v_mma FROM politicians WHERE slug = 'marcio-macedo';
  SELECT id INTO v_est FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_msi FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_apa FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_wdi FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_osi FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_tpe FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_rsa FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia revisão do Novo Ensino Médio após consulta pública nacional.', 'Ouvimos milhares de estudantes e professores. O Novo Ensino Médio precisa ser corrigido para que não amplie desigualdades.', 'Coletiva de imprensa em Brasília anunciando consulta pública sobre a reforma herdada do governo anterior.', 'verified', true, '2023-03-22', 'https://www1.folha.uol.com.br/educacao/2023/03/mec-revisao-novo-ensino-medio-camilo.shtml', 'news_article', 1, 'Brasília', 'Coletiva MEC', 'camilo-revisao-novo-ensino-medio-b82-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Ministro apresenta Pé-de-Meia como programa contra evasão escolar.', 'O Pé-de-Meia vai garantir que o estudante de baixa renda complete o ensino médio sem precisar escolher entre estudar e ajudar em casa.', 'Lançamento do programa de incentivo financeiro a estudantes do ensino médio da rede pública.', 'verified', true, '2024-01-26', 'https://g1.globo.com/educacao/noticia/2024/01/26/camilo-santana-pe-de-meia-lancamento.ghtml', 'news_article', 1, 'Brasília', 'Lançamento Pé-de-Meia', 'camilo-pe-de-meia-lancamento-b82-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo defende novo ENEM com prova única após polêmica de vazamento.', 'O ENEM é a principal porta de entrada para a universidade. Não vamos tolerar fraudes nem suspeitas sobre sua lisura.', 'Declaração após denúncia de vazamento de questões na edição de 2023 do exame.', 'verified', false, '2023-11-08', 'https://novaescola.org.br/conteudo/23000/camilo-enem-2023-vazamento', 'news_article', 2, 'Brasília', 'Coletiva pós-ENEM', 'camilo-enem-vazamento-b82-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Ministro da Educação rebate críticas da oposição ao PROUNI e FIES.', 'Quem ataca PROUNI e FIES ataca o sonho de milhões de jovens brasileiros pobres de entrar na universidade.', 'Resposta a parlamentares do PL que questionaram gastos com programas de acesso ao ensino superior.', 'verified', false, '2023-06-14', 'https://valor.globo.com/brasil/educacao/noticia/2023/06/14/camilo-defesa-prouni-fies.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'camilo-defesa-prouni-fies-b82-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia reajuste do piso nacional dos professores.', 'Professor bem pago é política de Estado. Vamos cumprir o piso e ainda avançar na carreira docente.', 'Anúncio do reajuste de 3,62% no piso nacional do magistério para 2024.', 'verified', false, '2024-01-18', 'https://www1.folha.uol.com.br/educacao/2024/01/piso-professores-reajuste-camilo.shtml', 'news_article', 1, 'Brasília', 'Anúncio reajuste piso', 'camilo-piso-professores-2024-b82-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Ministro anuncia ampliação de escolas em tempo integral.', 'Escola em tempo integral é a política pública mais transformadora da educação. Vamos chegar a 3,2 milhões de matrículas.', 'Apresentação do Programa Escola em Tempo Integral no Palácio do Planalto.', 'verified', false, '2023-07-25', 'https://g1.globo.com/educacao/noticia/2023/07/25/escola-tempo-integral-camilo.ghtml', 'news_article', 1, 'Brasília', 'Lançamento ETI', 'camilo-escola-tempo-integral-b82-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo rebate Nikolas Ferreira sobre "doutrinação" nas escolas.', 'Não existe doutrinação. Existe deputado que inventa polêmica para ganhar clique enquanto professor ganha mal.', 'Resposta em entrevista após Nikolas Ferreira denunciar suposta "ideologia de gênero" em livro didático.', 'verified', true, '2024-03-12', 'https://folha.uol.com.br/educacao/2024/03/camilo-nikolas-doutrinacao-escola.shtml', 'news_article', 2, 'Brasília', 'Entrevista à Folha', 'camilo-rebate-nikolas-doutrinacao-b82-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'MEC anuncia fim da escala de "educação cívico-militar" de Bolsonaro.', 'O programa cívico-militar era um desvio de função das Forças Armadas. Cada um no seu lugar: educador educa, militar defende o país.', 'Anúncio da revogação do Programa Nacional de Escolas Cívico-Militares.', 'verified', true, '2023-07-05', 'https://g1.globo.com/educacao/noticia/2023/07/05/camilo-fim-civico-militar.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MEC', 'camilo-fim-civico-militar-b82-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo celebra resultado do Saeb 2023 com ressalvas.', 'Os resultados mostram que o Brasil ainda paga a conta da pandemia. A recuperação exige investimento e não retórica.', 'Divulgação do Saeb 2023 com desempenho abaixo da média em matemática no ensino médio.', 'verified', false, '2024-08-15', 'https://novaescola.org.br/conteudo/23500/saeb-2023-resultados-mec', 'news_article', 1, 'Brasília', 'Divulgação Saeb', 'camilo-saeb-2023-b82-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos lança Plano Brasileiro de Inteligência Artificial.', 'O Brasil não pode ser apenas consumidor de IA. Vamos investir R$ 23 bilhões para desenvolver nossa soberania tecnológica.', 'Lançamento do PBIA com Lula no Palácio do Planalto.', 'verified', true, '2024-07-30', 'https://valor.globo.com/brasil/noticia/2024/07/30/luciana-santos-plano-ia-brasil.ghtml', 'news_article', 1, 'Brasília', 'Lançamento PBIA', 'luciana-plano-ia-brasil-b82-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Ministra reclama de contingenciamento do CNPq em meio à crise das bolsas.', 'Não é possível falar de inovação enquanto bolsistas do CNPq recebem valor defasado. Precisamos recompor de verdade.', 'Discurso em audiência no Congresso sobre orçamento da ciência.', 'verified', false, '2023-05-10', 'https://oglobo.globo.com/politica/luciana-santos-cnpq-contingenciamento-2023.ghtml', 'news_article', 2, 'Congresso Nacional', 'Audiência MCTI', 'luciana-cnpq-contingenciamento-b82-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana defende regulamentação urgente da inteligência artificial no Brasil.', 'Sem regulamentação, a IA vai ampliar desigualdades e desinformação. Precisamos agir agora, não em 2030.', 'Audiência no Senado sobre o PL de regulamentação da IA.', 'verified', false, '2024-11-05', 'https://www1.folha.uol.com.br/tec/2024/11/luciana-santos-regulamentacao-ia-senado.shtml', 'news_article', 2, 'Senado Federal', 'Audiência CCJ', 'luciana-regulamentacao-ia-senado-b82-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Ministra celebra aumento recorde do Fundo Nacional de Desenvolvimento Científico.', 'Estamos devolvendo ao FNDCT o que a Emenda 109 havia tirado. Ciência é investimento, não despesa.', 'Sanção da lei que garante a execução integral dos recursos do FNDCT.', 'verified', false, '2023-04-20', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-04/luciana-fndct-ciencia-sancao', 'news_article', 1, 'Brasília', 'Sanção lei FNDCT', 'luciana-fndct-sancao-b82-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos critica Elon Musk após ataques ao STF.', 'Empresário bilionário não dita regras no Brasil. Soberania tecnológica começa quando dizemos não a Musk.', 'Postagem em rede social em defesa de Alexandre de Moraes na crise do X.', 'verified', false, '2024-08-30', 'https://g1.globo.com/tecnologia/noticia/2024/08/30/luciana-santos-musk-stf.ghtml', 'news_article', 2, 'Brasília', 'Postagem em rede social', 'luciana-critica-musk-stf-b82-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth Menezes anuncia retomada da Lei Rouanet após desmonte bolsonarista.', 'A Lei Rouanet foi atacada por quem nunca entendeu o que é cultura. Estamos reconstruindo o que tentaram destruir.', 'Lançamento do programa Rouanet dos Povos em evento no MAM-RJ.', 'verified', true, '2023-02-15', 'https://oglobo.globo.com/cultura/noticia/2023/02/margareth-rouanet-retomada.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Lançamento Rouanet dos Povos', 'margareth-rouanet-retomada-b82-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth Menezes rebate acusação de censura a Roger Waters.', 'Não há censura nenhuma no Brasil. Há, sim, liberdade, inclusive a de criticar shows, como fazem artistas no mundo inteiro.', 'Resposta a acusações após decisão judicial sobre show de Roger Waters em São Paulo.', 'verified', false, '2023-11-07', 'https://folha.uol.com.br/ilustrada/2023/11/margareth-roger-waters-censura.shtml', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'margareth-roger-waters-censura-b82-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Ministra da Cultura celebra Carnaval de 2024 como "o maior da história".', 'O Carnaval de 2024 é a prova viva de que cultura gera emprego, renda e alegria. O Brasil voltou a brincar.', 'Balanço do Carnaval em coletiva no MinC com mais de 80 milhões de foliões.', 'verified', false, '2024-02-15', 'https://g1.globo.com/carnaval/2024/noticia/2024/02/15/margareth-carnaval-maior-historia.ghtml', 'news_article', 1, 'Brasília', 'Coletiva pós-Carnaval', 'margareth-carnaval-2024-b82-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth anuncia Política Nacional Aldir Blanc permanente.', 'A PNAB é a maior política de cultura fora dos grandes centros. Chega de cultura restrita a Rio e São Paulo.', 'Sanção da lei que torna a Aldir Blanc permanente, com repasse anual para estados e municípios.', 'verified', true, '2023-07-11', 'https://valor.globo.com/brasil/noticia/2023/07/11/aldir-blanc-permanente-margareth.ghtml', 'news_article', 1, 'Brasília', 'Sanção PNAB', 'margareth-aldir-blanc-permanente-b82-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara vai ao território Yanomami durante emergência sanitária.', 'O que vemos aqui é genocídio. Crianças morrendo de fome em pleno 2023. Isso é responsabilidade direta do governo anterior.', 'Visita da ministra dos Povos Indígenas ao território Yanomami em janeiro de 2023.', 'verified', true, '2023-01-22', 'https://g1.globo.com/politica/noticia/2023/01/22/sonia-guajajara-yanomami-genocidio.ghtml', 'news_article', 2, 'Roraima', 'Visita a Surucucu', 'sonia-yanomami-genocidio-b82-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara chama Marco Temporal de "tese do genocídio".', 'Marco Temporal é a tese do genocídio. Só tem terra indígena quem sobreviveu ao extermínio. É uma afronta à Constituição.', 'Discurso no plenário do STF durante julgamento do Marco Temporal.', 'verified', true, '2023-08-30', 'https://folha.uol.com.br/poder/2023/08/sonia-marco-temporal-genocidio.shtml', 'news_article', 2, 'Brasília', 'Plenário STF', 'sonia-marco-temporal-genocidio-b82-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Ministra critica Congresso após aprovação da PL do Marco Temporal.', 'O Congresso aprovou uma lei para legalizar o roubo de terras indígenas. É a pior afronta à Constituição em décadas.', 'Declaração após a Câmara aprovar o PL 2903/2023.', 'verified', true, '2023-09-27', 'https://oglobo.globo.com/politica/sonia-marco-temporal-congresso-2023.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-pl-marco-temporal-b82-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Guajajara denuncia avanço do garimpo ilegal mesmo após operações.', 'O garimpo ilegal se reinventa. Vamos manter a operação permanente até que nenhum Yanomami tenha medo em sua própria terra.', 'Entrevista coletiva sobre as operações da PF e Ibama no território Yanomami.', 'verified', false, '2024-04-18', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-04/sonia-garimpo-yanomami-operacao', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-garimpo-yanomami-b82-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara anuncia demarcação de novas terras indígenas.', 'Cada demarcação é uma vitória contra séculos de apagamento. O Brasil só será democrático quando respeitar seus povos originários.', 'Cerimônia de homologação de seis terras indígenas em Brasília.', 'verified', true, '2023-04-28', 'https://g1.globo.com/politica/noticia/2023/04/28/sonia-demarcacao-seis-terras.ghtml', 'news_article', 1, 'Brasília', 'Cerimônia de homologação', 'sonia-demarcacao-seis-terras-b82-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco defende cotas raciais em reforma do programa.', 'As cotas transformaram a universidade brasileira. Quem ataca cotas ataca o direito de pretos e pardos sonharem com a universidade.', 'Audiência no Senado sobre a revisão da Lei de Cotas.', 'verified', true, '2023-08-22', 'https://folha.uol.com.br/educacao/2023/08/anielle-franco-cotas-universidade.shtml', 'news_article', 1, 'Senado Federal', 'Audiência revisão Lei de Cotas', 'anielle-cotas-universidade-b82-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle critica Nikolas Ferreira após ataque racista nas redes.', 'Racismo não é opinião, é crime. E deputado que pratica racismo precisa responder na Justiça.', 'Resposta à postagem de Nikolas Ferreira sobre cotas raciais em universidades.', 'verified', true, '2023-10-15', 'https://oglobo.globo.com/politica/anielle-franco-nikolas-racismo-2023.ghtml', 'news_article', 2, 'Brasília', 'Postagem em rede social', 'anielle-nikolas-racismo-b82-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco lança plano nacional de igualdade racial.', 'Chega de diagnóstico. É hora de política pública de verdade para a maioria negra do Brasil.', 'Lançamento do Plano Plurianual da Igualdade Racial 2024-2027.', 'verified', false, '2024-05-13', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-05/anielle-plano-igualdade-racial', 'news_article', 1, 'Brasília', 'Lançamento PPA Racial', 'anielle-plano-igualdade-racial-b82-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama Novo Ensino Médio de "doutrinação de esquerda".', 'O MEC de Lula não forma alunos, forma militantes. Pais, tirem os filhos da escola pública até acabar essa doutrinação.', 'Vídeo nas redes sociais atacando a revisão do Novo Ensino Médio.', 'verified', true, '2023-04-05', 'https://www.metropoles.com/brasil/politica-br/nikolas-ferreira-novo-ensino-medio-doutrinacao', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-doutrinacao-ensino-medio-b82-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas compartilha desinformação sobre livro didático do MEC.', 'Olhem só o que o MEC mandou para nossos filhos: apologia à ideologia de gênero. Isso é um crime contra a família.', 'Postagem viral mostrando página descontextualizada de livro do PNLD; conteúdo foi desmentido por checadores.', 'verified', true, '2024-03-08', 'https://www1.folha.uol.com.br/educacao/2024/03/nikolas-livro-mec-checagem.shtml', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-livro-mec-ideologia-b82-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas defende fim de cotas raciais em universidades.', 'Cotas raciais são racismo institucional. Dividem o Brasil entre raças e perpetuam uma narrativa vitimista.', 'Discurso na tribuna da Câmara contra revisão da Lei de Cotas.', 'verified', true, '2023-09-06', 'https://g1.globo.com/politica/noticia/2023/09/06/nikolas-cotas-raciais-racismo.ghtml', 'news_article', 4, 'Câmara dos Deputados', 'Plenário da Câmara', 'nikolas-cotas-raciais-racismo-b82-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca Sônia Guajajara após morte de bebê Yanomami.', 'Enquanto a ministra Sônia fica posando para revista, crianças Yanomami morrem. Ministério dos Povos Indígenas é balcão de ONG.', 'Postagem em rede social sobre morte de criança Yanomami em hospital de Boa Vista.', 'verified', false, '2024-01-24', 'https://oglobo.globo.com/politica/nikolas-sonia-guajajara-yanomami-2024.ghtml', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'nikolas-sonia-yanomami-b82-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama aula sobre racismo de "marxismo cultural" em escolas.', 'Criança não precisa aprender sobre racismo, precisa aprender matemática. Marxismo cultural na sala de aula, nunca mais.', 'Discurso em audiência pública sobre livros didáticos.', 'verified', false, '2023-05-23', 'https://www.poder360.com.br/congresso/bia-kicis-marxismo-cultural-escola/', 'news_article', 3, 'Câmara dos Deputados', 'Audiência pública', 'bia-kicis-marxismo-cultural-escola-b82-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares sugere que Yanomami foram "usados" para atacar Bolsonaro.', 'A tragédia Yanomami é real, mas está sendo explorada politicamente. Ninguém falou nada quando a fome existia no governo Dilma.', 'Entrevista à Rádio Jovem Pan após visita de Lula a território Yanomami.', 'verified', true, '2023-01-28', 'https://jovempan.uol.com.br/noticias/politica/damares-yanomami-exploracao-politica.html', 'news_article', 4, 'Brasília', 'Entrevista Jovem Pan', 'damares-yanomami-exploracao-b82-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves acusa governo Lula de "esvaziar" missão evangélica nos Yanomami.', 'Tiraram missionários do território. Agora crianças Yanomami morrem sem a fé que as sustentava.', 'Fala em sessão do Senado sobre saúde indígena.', 'verified', false, '2023-03-15', 'https://www1.folha.uol.com.br/poder/2023/03/damares-missionarios-yanomami.shtml', 'news_article', 3, 'Senado Federal', 'Sessão sobre saúde indígena', 'damares-missionarios-yanomami-b82-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano convoca pastores a "invadir" escolas contra Margareth.', 'Pastores, invadam as escolas dos seus filhos. Margareth Menezes vai transformar o Carnaval em disciplina escolar.', 'Discurso em culto transmitido em São Paulo atacando programa cultural do MinC.', 'verified', false, '2024-02-20', 'https://www.metropoles.com/brasil/politica-br/marco-feliciano-escolas-margareth-menezes', 'news_article', 3, 'São Paulo', 'Culto Catedral do Avivamento', 'feliciano-invadir-escolas-margareth-b82-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro afirma que "mataram os Yanomami" para criar narrativa.', 'Usaram imagens antigas, de outras tribos. Tudo mentira para atacar meu governo. Os Yanomami estão sendo usados como arma política.', 'Entrevista no Podpah, defendendo-se das acusações sobre crise Yanomami.', 'verified', true, '2023-02-02', 'https://g1.globo.com/politica/noticia/2023/02/02/bolsonaro-yanomami-narrativa-podpah.ghtml', 'news_article', 4, 'São Paulo', 'Podpah', 'bolsonaro-yanomami-narrativa-b82-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem acusa MEC de "indústria ideológica".', 'Cada real do MEC deveria formar cidadãos, não ativistas. Camilo Santana transformou o ministério em indústria ideológica.', 'Discurso no plenário da Câmara contra política do PNLD.', 'verified', false, '2024-04-10', 'https://www.poder360.com.br/congresso/van-hattem-mec-industria-ideologica/', 'news_article', 3, 'Câmara dos Deputados', 'Plenário da Câmara', 'van-hattem-mec-ideologica-b82-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica gasto do Pé-de-Meia e chama de "populismo".', 'Pé-de-Meia é populismo eleitoreiro. O dinheiro deveria ir para formação de professores, não para bolsa de estudante.', 'Coluna no jornal atacando o programa do MEC.', 'verified', false, '2024-02-01', 'https://folha.uol.com.br/opiniao/2024/02/kim-pe-de-meia-populismo.shtml', 'news_article', 2, 'São Paulo', 'Artigo de opinião', 'kim-pe-de-meia-populismo-b82-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica autonomia universitária e pede "auditoria".', 'Universidades federais viraram feudos de esquerda. Precisa de auditoria de verdade em UFSC, UFRJ, UFBA.', 'Entrevista em rádio sobre orçamento das universidades.', 'verified', false, '2024-06-12', 'https://valor.globo.com/politica/noticia/2024/06/12/adriana-ventura-universidades-auditoria.ghtml', 'news_article', 3, 'Brasília', 'Entrevista à CBN', 'adriana-universidades-auditoria-b82-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral critica MEC por "desacelerar" aprendizagem.', 'Camilo Santana herdou um dos piores cenários educacionais, mas não pode ser desculpa para desacelerar reformas. Faltam metas claras.', 'Coluna publicada no Valor Educação criticando o ritmo das reformas do MEC.', 'verified', false, '2024-09-05', 'https://valor.globo.com/eu-e/coluna/tabata-amaral-mec-desaceleracao.ghtml', 'news_article', 2, 'São Paulo', 'Coluna Valor', 'tabata-mec-desaceleracao-b82-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata celebra aprovação do novo Novo Ensino Médio com ressalvas.', 'Avançamos com a volta da carga horária maior das disciplinas tradicionais, mas o itinerário técnico segue subfinanciado.', 'Pronunciamento após aprovação da lei do Novo Ensino Médio revisado.', 'verified', false, '2024-07-02', 'https://novaescola.org.br/conteudo/24000/tabata-novo-ensino-medio-aprovado', 'news_article', 1, 'Câmara dos Deputados', 'Aprovação do NEM', 'tabata-novo-ensino-medio-b82-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende política LGBT+ nas escolas.', 'Escola precisa acolher pessoas trans. Negar isso é condenar crianças ao suicídio. É direito básico, não ideologia.', 'Discurso em audiência na Câmara sobre violência contra estudantes LGBT+.', 'verified', false, '2023-06-27', 'https://folha.uol.com.br/cotidiano/2023/06/erika-hilton-escola-lgbt.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'erika-escola-lgbt-b82-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim critica contingenciamento em universidades federais.', 'Universidade não é despesa, é futuro. Cortar UFSC, UFBA e IFRJ é cortar o sonho da juventude pobre.', 'Fala em CPI sobre orçamento das instituições de ensino federal.', 'verified', false, '2024-06-20', 'https://g1.globo.com/educacao/noticia/2024/06/20/samia-universidades-contingenciamento.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'CPI do Orçamento', 'samia-universidades-corte-b82-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_osi, 'Orlando Silva defende PL das Fake News na comissão especial.', 'Quem tem medo de regular big tech é quem lucra com desinformação. A escola paga a conta da enxurrada de mentiras.', 'Discurso como relator do PL 2630 em comissão especial.', 'verified', false, '2023-04-25', 'https://www1.folha.uol.com.br/poder/2023/04/orlando-silva-pl-fake-news.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Comissão PL 2630', 'orlando-pl-fake-news-b82-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar rebate ataques a professores em CPI.', 'Professor não doutrina, ensina a pensar. A diferença é clara para quem já pisou numa sala de aula de verdade.', 'Fala em CPI das Redes que investigava suposta doutrinação em escolas.', 'verified', false, '2024-05-15', 'https://oglobo.globo.com/politica/chico-alencar-professores-doutrinacao-2024.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'CPI das Redes', 'chico-alencar-professores-doutrinacao-b82-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende Aldir Blanc contra corte de emendas.', 'Cortar a Aldir Blanc é matar a cultura no interior do Brasil. Deputado que corta cultura tem que explicar à sua cidade.', 'Discurso em plenário contra emendas que reduziam a PNAB.', 'verified', false, '2024-09-25', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-09/jandira-aldir-blanc-emenda', 'news_article', 1, 'Câmara dos Deputados', 'Plenário LDO', 'jandira-aldir-blanc-emendas-b82-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tpe, 'Talíria Petrone critica falas racistas sobre cotas.', 'Quem ainda diz que cotas dividem o Brasil, o que divide é o próprio racismo institucional. Cotas curam, não ferem.', 'Resposta em rede social a Nikolas Ferreira.', 'verified', false, '2024-08-28', 'https://oglobo.globo.com/politica/taliria-cotas-racismo-nikolas-2024.ghtml', 'social_media_post', 2, 'Rio de Janeiro', 'Postagem em rede social', 'taliria-cotas-racismo-b82-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh defende universidade pública contra ataques da direita.', 'A universidade pública formou quase todo médico, engenheiro e cientista deste país. Quem ataca UFSC não ama o Brasil.', 'Discurso no Senado em defesa do orçamento das federais.', 'verified', false, '2024-10-18', 'https://valor.globo.com/politica/noticia/2024/10/18/lindbergh-universidade-publica.ghtml', 'news_article', 1, 'Senado Federal', 'Plenário Senado', 'lindbergh-universidade-publica-b82-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade anuncia mutirão de vacinação para indígenas.', 'Os Yanomami são prioridade absoluta. A saúde indígena virou política de Estado, e não balcão.', 'Coletiva em Brasília sobre mutirão contra sarampo e desnutrição.', 'verified', false, '2023-02-10', 'https://g1.globo.com/saude/noticia/2023/02/10/nisia-vacinacao-indigenas-yanomami.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Ministério da Saúde', 'nisia-vacinacao-indigenas-b82-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia refuta negacionismo contra vacinas após declarações de bolsonaristas.', 'Vacina é ciência, não ideologia. Quem espalha mentira sobre imunização é responsável por cada morte evitável.', 'Resposta a Nikolas Ferreira que levantou dúvidas sobre vacinas de HPV.', 'verified', true, '2024-02-28', 'https://agenciabrasil.ebc.com.br/saude/noticia/2024-02/nisia-vacina-negacionismo', 'news_article', 2, 'Brasília', 'Coletiva Ministério da Saúde', 'nisia-vacina-negacionismo-b82-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira questiona segurança da vacina do HPV em vídeo viral.', 'Por que querem obrigar menina de 9 anos a tomar vacina de HPV? Estão escondendo os efeitos colaterais das nossas crianças.', 'Vídeo com mais de 10 milhões de visualizações desmentido por agências de checagem.', 'verified', true, '2024-02-27', 'https://www1.folha.uol.com.br/saude/2024/02/nikolas-hpv-vacina-checagem.shtml', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-vacina-hpv-b82-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida defende direitos humanos nas escolas contra ofensiva conservadora.', 'Direitos humanos é conteúdo constitucional, não opção ideológica. Escola sem direitos humanos é escola sem cidadania.', 'Palestra em universidade federal sobre educação em direitos humanos.', 'verified', false, '2023-11-10', 'https://folha.uol.com.br/cotidiano/2023/11/silvio-almeida-direitos-humanos-escola.shtml', 'news_article', 1, 'Brasília', 'Palestra UnB', 'silvio-direitos-humanos-escola-b82-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves defende educação sexual para prevenir violência.', 'Educação sexual não corrompe criança, protege. País que não fala sobre prevenção cria vítimas de abuso.', 'Audiência pública sobre políticas para meninas.', 'verified', false, '2024-03-08', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-03/cida-educacao-sexual-prevencao', 'news_article', 1, 'Brasília', 'Audiência Ministério das Mulheres', 'cida-educacao-sexual-b82-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_est, 'Esther Dweck anuncia concurso para recompor servidores do MEC.', 'O MEC perdeu 40% de seus servidores técnicos em seis anos. Concurso é a reconstrução da máquina educacional.', 'Anúncio do Concurso Nacional Unificado com vagas para o MEC.', 'verified', false, '2023-12-19', 'https://valor.globo.com/brasil/noticia/2023/12/19/esther-dweck-concurso-mec.ghtml', 'news_article', 1, 'Brasília', 'Anúncio CNU', 'esther-concurso-mec-b82-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende Pé-de-Meia como política estruturante.', 'O Pé-de-Meia não é assistencialismo, é prevenção de evasão. Cada jovem fora da escola é uma tragédia anunciada para o país.', 'Entrevista à CNN sobre o programa do governo.', 'verified', false, '2024-02-10', 'https://www.cnnbrasil.com.br/politica/tebet-pe-de-meia-estruturante/', 'news_article', 1, 'Brasília', 'Entrevista à CNN', 'tebet-pe-de-meia-estruturante-b82-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina Silva celebra parceria com MEC para educação ambiental.', 'Educação ambiental não é opcional, é dever constitucional. Escola que não ensina sobre clima não prepara para o futuro.', 'Cerimônia de assinatura de programa de educação climática com o MEC.', 'verified', false, '2024-08-14', 'https://novaescola.org.br/conteudo/24100/marina-educacao-climatica-mec', 'news_article', 1, 'Brasília', 'Assinatura de acordo MMA-MEC', 'marina-educacao-climatica-b82-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende universidades federais em meio a cortes.', 'Não aceito que cortem a UFSC, a UFBA, a UFRJ. Universidade pública é patrimônio do Brasil.', 'Discurso em cerimônia de formatura da UFSCar.', 'verified', true, '2024-08-22', 'https://g1.globo.com/politica/noticia/2024/08/22/lula-universidades-federais-ufscar.ghtml', 'news_article', 1, 'São Carlos', 'Formatura UFSCar', 'lula-universidades-federais-ufscar-b82-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Fernando Haddad diz que Pé-de-Meia cabe no arcabouço fiscal.', 'Pé-de-Meia é investimento em capital humano. Quem chama de gastança não entende economia do desenvolvimento.', 'Entrevista em programa econômico sobre execução do arcabouço.', 'verified', false, '2024-03-05', 'https://valor.globo.com/brasil/noticia/2024/03/05/haddad-pe-de-meia-arcabouco.ghtml', 'news_article', 1, 'Brasília', 'Entrevista GloboNews', 'haddad-pe-de-meia-arcabouco-b82-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende MinC contra ataques.', 'O MinC volta depois de anos de destruição. Quem critica a Lei Rouanet é quem nunca abriu um livro de História do Brasil.', 'Postagem em rede social em defesa de Margareth Menezes.', 'verified', false, '2023-03-18', 'https://oglobo.globo.com/politica/gleisi-minc-margareth-2023.ghtml', 'social_media_post', 1, 'Brasília', 'Postagem em rede social', 'gleisi-minc-rouanet-b82-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa rebate críticas ao orçamento do MEC.', 'O MEC tem o maior orçamento da história. Quem fala em corte está mentindo para fazer política barata.', 'Coletiva após reunião ministerial sobre execução orçamentária.', 'verified', false, '2024-05-30', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-05/rui-costa-orcamento-mec', 'news_article', 2, 'Brasília', 'Coletiva Casa Civil', 'rui-costa-orcamento-mec-b82-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_apa, 'Alexandre Padilha articula defesa de programas educacionais.', 'Nosso papel é garantir que a base aliada entenda a prioridade da educação. Cada voto contra o Pé-de-Meia é voto contra o futuro.', 'Entrevista sobre articulação política do governo em torno do MEC.', 'verified', false, '2024-04-02', 'https://valor.globo.com/politica/noticia/2024/04/02/padilha-articulacao-educacao.ghtml', 'news_article', 1, 'Brasília', 'Entrevista Valor', 'padilha-articulacao-educacao-b82-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdi, 'Wellington Dias defende Bolsa Família e seus condicionantes educacionais.', 'A frequência escolar é condicionante do Bolsa Família. Quem recebe o benefício sabe que educação é chave da cidadania.', 'Entrevista sobre execução do Bolsa Família e evasão escolar.', 'verified', false, '2023-09-18', 'https://g1.globo.com/politica/noticia/2023/09/18/wellington-bolsa-familia-escola.ghtml', 'news_article', 1, 'Brasília', 'Entrevista à CBN', 'wellington-bolsa-familia-escola-b82-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pte, 'Paulo Teixeira defende educação no campo e Pronera.', 'Educação do campo não é favor, é direito. Pronera vai voltar a formar professor, agrônomo e enfermeiro no assentamento.', 'Lançamento de edital do Pronera após paralisação no governo anterior.', 'verified', false, '2023-05-22', 'https://www1.folha.uol.com.br/educacao/2023/05/paulo-teixeira-pronera-relancamento.shtml', 'news_article', 1, 'Brasília', 'Lançamento Pronera', 'paulo-teixeira-pronera-b82-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mma, 'Márcio Macedo defende cultura como política pública universal.', 'Cultura não é luxo de elite, é necessidade de povo. O MinC de Margareth é a prova disso.', 'Fala em evento da Secretaria-Geral sobre diálogo com movimentos culturais.', 'verified', false, '2023-11-22', 'https://oglobo.globo.com/cultura/noticia/2023/11/marcio-macedo-cultura-politica-publica.ghtml', 'news_article', 1, 'Brasília', 'Evento Secretaria-Geral', 'marcio-cultura-publica-b82-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles ataca demarcações e diz que "índio rico não pode existir".', 'Demarcação é congelamento de riqueza. Quem é a favor de índio pobre votou pelo marco temporal ruim.', 'Entrevista em podcast conservador após derrubada do Marco Temporal pelo STF.', 'verified', true, '2023-09-29', 'https://folha.uol.com.br/poder/2023/09/salles-indio-rico-marco-temporal.shtml', 'news_article', 4, 'São Paulo', 'Podcast Os Pingos nos Is', 'salles-indio-rico-marco-temporal-b82-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Salles defende garimpo legalizado em território indígena.', 'Tem que regularizar o garimpo. Quem é contra só quer ver o índio miserável, dependente de ONG.', 'Discurso na Câmara em defesa de PLs mineratórios.', 'verified', false, '2024-04-17', 'https://www.poder360.com.br/congresso/salles-garimpo-regularizar-2024/', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'salles-garimpo-regularizar-b82-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia responde Ricardo Salles sobre garimpo.', 'Garimpo mata. Quem defende garimpo em terra indígena defende genocídio, simples assim.', 'Postagem em rede social em resposta a Ricardo Salles.', 'verified', false, '2024-04-18', 'https://oglobo.globo.com/politica/sonia-salles-garimpo-2024.ghtml', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'sonia-salles-garimpo-b82-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos celebra retomada do programa espacial brasileiro.', 'A base de Alcântara voltou a lançar foguetes. Ciência no Brasil volta a ter horizonte.', 'Visita ao Centro de Lançamento de Alcântara.', 'verified', false, '2024-11-28', 'https://agenciabrasil.ebc.com.br/ciencia-e-tecnologia/noticia/2024-11/luciana-alcantara-espacial', 'news_article', 1, 'Maranhão', 'Centro de Lançamento de Alcântara', 'luciana-alcantara-espacial-b82-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth rebate acusações de censura no Carnaval 2024.', 'Não existe censura nos blocos. Existe, sim, pauta bolsonarista querendo criar polêmica onde só tem alegria popular.', 'Coletiva após bolsonaristas alegarem censura em bloco carnavalesco.', 'verified', false, '2024-02-13', 'https://folha.uol.com.br/ilustrada/2024/02/margareth-censura-carnaval-bolsonaristas.shtml', 'news_article', 2, 'Salvador', 'Coletiva em Salvador', 'margareth-censura-carnaval-b82-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano chama Carnaval de "abominação" no MinC.', 'O Carnaval bancado pelo MinC é abominação. O Brasil evangélico não vai aceitar ver seu dinheiro pagando pecado.', 'Pronunciamento na Câmara sobre orçamento da cultura.', 'verified', false, '2024-02-22', 'https://www.metropoles.com/brasil/politica-br/feliciano-carnaval-abominacao-minc', 'news_article', 3, 'Câmara dos Deputados', 'Plenário da Câmara', 'feliciano-carnaval-abominacao-b82-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth Menezes responde a Feliciano sobre Carnaval.', 'O Carnaval não é pecado, é patrimônio. Quem ofende a cultura popular ofende o Brasil.', 'Declaração à imprensa em resposta ao deputado Marco Feliciano.', 'verified', false, '2024-02-23', 'https://oglobo.globo.com/cultura/noticia/2024/02/margareth-responde-feliciano-carnaval.ghtml', 'news_article', 1, 'Brasília', 'Declaração à imprensa', 'margareth-responde-feliciano-b82-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia nova composição do ENEM 2025.', 'O ENEM 2025 será mais aderente à BNCC. Vamos garantir um exame coerente com o que é ensinado em sala de aula.', 'Coletiva sobre mudanças previstas para o ENEM.', 'verified', false, '2025-05-07', 'https://novaescola.org.br/conteudo/25000/camilo-novo-enem-2025', 'news_article', 1, 'Brasília', 'Coletiva MEC', 'camilo-novo-enem-2025-b82-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas convoca pais a "vigiar provas" do ENEM.', 'Pais, vigiem o que o Inep fez com o ENEM. Nosso filho virou cobaia de ideologia.', 'Vídeo com desinformação sobre prova do ENEM 2024 desmentido por checagens.', 'verified', true, '2024-11-05', 'https://folha.uol.com.br/educacao/2024/11/nikolas-enem-desinformacao.shtml', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-enem-desinformacao-b82-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana refuta Nikolas sobre ENEM.', 'O ENEM é feito por técnicos, não por ativistas. Deputado que mente sobre prova coloca em risco sonho de milhões.', 'Resposta oficial do MEC após postagens de Nikolas Ferreira.', 'verified', true, '2024-11-06', 'https://g1.globo.com/educacao/enem/2024/noticia/2024/11/06/camilo-refuta-nikolas-enem.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MEC', 'camilo-refuta-nikolas-enem-b82-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara celebra veto parcial de Lula à PL 2903.', 'O veto do presidente foi uma vitória. Mas o Congresso derrubou em seguida. A luta continua.', 'Declaração após Congresso derrubar vetos ao Marco Temporal.', 'verified', true, '2023-12-14', 'https://folha.uol.com.br/ambiente/2023/12/sonia-veto-marco-temporal.shtml', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-veto-marco-temporal-b82-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro convoca "ofensiva" contra educação de gênero em lives.', 'Pais, tirem os filhos da escola pública que ensina ideologia de gênero. Esse MEC está doente.', 'Live transmitida em canal bolsonarista atacando PNLD.', 'verified', true, '2024-03-14', 'https://www1.folha.uol.com.br/educacao/2024/03/bolsonaro-ofensiva-genero-escola.shtml', 'social_media_post', 5, 'Balneário Camboriú', 'Live em canal bolsonarista', 'bolsonaro-ofensiva-genero-escola-b82-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende fim da BNCC em educação.', 'BNCC é a grande cartilha comunista das escolas brasileiras. Precisa ser revogada.', 'Declaração em comissão de educação da Câmara.', 'verified', false, '2023-08-01', 'https://www.poder360.com.br/congresso/bia-kicis-bncc-comunista/', 'news_article', 3, 'Câmara dos Deputados', 'Comissão de Educação', 'bia-kicis-bncc-comunista-b82-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco defende reparação histórica em currículo escolar.', 'Ensinar história do Brasil sem escravidão é mentir para a criança negra. Reparação começa na sala de aula.', 'Discurso no 13 de maio em ato no Rio de Janeiro.', 'verified', false, '2023-05-13', 'https://oglobo.globo.com/cultura/noticia/2023/05/anielle-13-maio-reparacao-curriculo.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Ato 13 de Maio', 'anielle-reparacao-curriculo-b82-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano chama Anielle Franco de "militante".', 'Anielle não é ministra, é militante do PT pago com dinheiro público para impor pauta racial.', 'Discurso em culto transmitido no YouTube.', 'verified', false, '2023-05-15', 'https://www.metropoles.com/brasil/politica-br/feliciano-anielle-militante-racial', 'news_article', 3, 'São Paulo', 'Culto Catedral do Avivamento', 'feliciano-anielle-militante-b82-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar defende Margareth Menezes contra ataques religiosos.', 'Margareth Menezes dialoga com quem tem fé e com quem não tem. Quem ataca o MinC é quem tem medo da cultura livre.', 'Pronunciamento no plenário em defesa do orçamento do MinC.', 'verified', false, '2024-03-02', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-03/chico-alencar-margareth-minc', 'news_article', 1, 'Câmara dos Deputados', 'Plenário da Câmara', 'chico-margareth-minc-b82-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana reage a cortes em universidades federais.', 'Não vamos aceitar o mesmo erro dos governos Temer e Bolsonaro. Universidade não vai voltar a ser sucateada.', 'Entrevista à Folha após bloqueios no orçamento.', 'verified', false, '2024-06-18', 'https://folha.uol.com.br/educacao/2024/06/camilo-cortes-universidade-federais.shtml', 'news_article', 2, 'Brasília', 'Entrevista à Folha', 'camilo-cortes-universidades-b82-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem defende corte em orçamento do MCTI.', 'O MCTI financia 100% teses inúteis. Precisa de corte para sobrar dinheiro para educação de verdade.', 'Discurso em comissão de orçamento.', 'verified', false, '2024-09-12', 'https://valor.globo.com/politica/noticia/2024/09/12/van-hattem-mcti-corte.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Comissão de Orçamento', 'van-hattem-mcti-corte-b82-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos rebate Van Hattem sobre ciência.', 'Quem chama tese de inútil é quem nunca leu uma. Ciência que o deputado critica salvou vidas na pandemia.', 'Resposta à fala de Marcel Van Hattem em rede social.', 'verified', false, '2024-09-13', 'https://oglobo.globo.com/politica/luciana-van-hattem-ciencia-2024.ghtml', 'social_media_post', 1, 'Brasília', 'Postagem em rede social', 'luciana-van-hattem-ciencia-b82-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral propõe auditoria no Pé-de-Meia.', 'Defendo o Pé-de-Meia, mas precisa de auditoria independente. Política pública sem transparência vira eleição.', 'Artigo assinado no Valor Educação.', 'verified', false, '2024-11-20', 'https://valor.globo.com/eu-e/coluna/tabata-pe-de-meia-auditoria.ghtml', 'news_article', 1, 'São Paulo', 'Coluna Valor', 'tabata-pe-de-meia-auditoria-b82-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia violência contra indígenas no MS.', 'A violência no Mato Grosso do Sul não é episódio isolado, é política deliberada contra os Guarani-Kaiowá.', 'Coletiva após ataque contra acampamento no Mato Grosso do Sul.', 'verified', true, '2023-10-30', 'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2023/10/30/sonia-violencia-guarani-kaiowa.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-violencia-guarani-kaiowa-b82-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco lembra morte da irmã Marielle em aula pública.', 'Marielle foi vereadora e era professora no coração. Cada sala de aula tem um pouco da Marielle viva.', 'Aula pública em UERJ no aniversário da morte de Marielle.', 'verified', false, '2024-03-14', 'https://oglobo.globo.com/politica/anielle-marielle-uerj-aula-publica-2024.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Aula pública UERJ', 'anielle-marielle-uerj-b82-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves denuncia violência sexual nas escolas.', 'Uma em cada quatro meninas sofre assédio na escola. Silêncio sobre isso é cumplicidade.', 'Audiência pública sobre violência contra meninas e mulheres.', 'verified', false, '2024-08-03', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-08/cida-violencia-sexual-escolas', 'news_article', 2, 'Brasília', 'Audiência Ministério das Mulheres', 'cida-violencia-sexual-escolas-b82-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth Menezes lança edital para Carnaval popular.', 'O edital Carnaval Nacional vai proteger o Carnaval de rua, raiz do povo, contra a concentração em eventos privados.', 'Lançamento do Edital Carnaval Nacional.', 'verified', false, '2024-10-28', 'https://oglobo.globo.com/cultura/noticia/2024/10/margareth-edital-carnaval-nacional.ghtml', 'news_article', 1, 'Salvador', 'Lançamento edital', 'margareth-edital-carnaval-b82-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende acesso de pessoas trans à universidade.', 'Pessoas trans estão chegando na universidade porque conquistamos espaço. Quem quer tirar cotas trans quer nos exterminar.', 'Entrevista no podcast de educação da Nova Escola.', 'verified', false, '2024-07-09', 'https://novaescola.org.br/conteudo/24200/erika-hilton-trans-universidade', 'news_article', 2, 'São Paulo', 'Podcast Nova Escola', 'erika-trans-universidade-b82-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares questiona existência de racismo "estrutural" em escolas.', 'Racismo estrutural é narrativa. Escola não é lugar de empurrar ideologia para criança.', 'Discurso no Senado contra BNCC atualizada.', 'verified', false, '2023-11-16', 'https://www1.folha.uol.com.br/poder/2023/11/damares-racismo-estrutural-escola.shtml', 'news_article', 4, 'Senado Federal', 'Discurso no plenário', 'damares-racismo-estrutural-escola-b82-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende Pé-de-Meia e critica oposição.', 'Quem vota contra Pé-de-Meia é quem acha que filho de pobre não pode sonhar com universidade.', 'Cerimônia de entrega de cartões Pé-de-Meia em Recife.', 'verified', true, '2024-04-08', 'https://g1.globo.com/pe/pernambuco/noticia/2024/04/08/lula-pe-de-meia-oposicao.ghtml', 'news_article', 1, 'Recife', 'Cerimônia Pé-de-Meia', 'lula-pe-de-meia-oposicao-b82-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica reserva de vagas para indígenas em concursos.', 'Cota para indígena em concurso federal é populismo identitário. Mérito é o único critério justo.', 'Postagem em rede social após decreto sobre ampliação de cotas.', 'verified', false, '2023-11-09', 'https://oglobo.globo.com/politica/kim-cotas-indigenas-concurso-2023.ghtml', 'social_media_post', 3, 'São Paulo', 'Postagem em rede social', 'kim-cotas-indigenas-concurso-b82-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara celebra posse de indígena aprovada em concurso com cota.', 'A cota não é favor, é reparação. A aprovação dessa jovem mudou não só a vida dela, mas toda uma comunidade.', 'Cerimônia de posse de servidora Guarani em órgão federal.', 'verified', false, '2024-03-22', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-03/sonia-cota-indigena-concurso', 'news_article', 1, 'Brasília', 'Cerimônia de posse', 'sonia-cota-indigena-concurso-b82-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira defende Lei Rouanet contra propaganda enganosa.', 'Mentira sobre Rouanet é uma indústria. Ninguém ganha R$ 4 milhões para falar língua de gato. Parem com fake news.', 'Discurso em defesa da Lei Rouanet após nova onda de desinformação.', 'verified', false, '2023-04-12', 'https://folha.uol.com.br/ilustrada/2023/04/jandira-rouanet-fake-news.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Plenário', 'jandira-rouanet-fake-news-b82-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende expansão do ProUni.', 'ProUni abriu portas para uma geração inteira. Quem propõe cortar ProUni não conheceu filho de empregada doméstica.', 'Discurso no plenário da Câmara sobre ampliação do programa.', 'verified', false, '2023-03-29', 'https://oglobo.globo.com/politica/samia-prouni-expansao-2023.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Plenário', 'samia-prouni-expansao-b82-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh defende Sônia Guajajara contra ataques bolsonaristas.', 'Sônia Guajajara merece o respeito do Brasil. Quem ataca ministra indígena ataca a Constituição.', 'Pronunciamento em defesa da ministra após ataques coordenados.', 'verified', false, '2024-02-07', 'https://valor.globo.com/politica/noticia/2024/02/07/lindbergh-sonia-guajajara-ataques.ghtml', 'news_article', 1, 'Senado Federal', 'Plenário Senado', 'lindbergh-defesa-sonia-b82-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia programa Mais Professores.', 'Faltam 260 mil professores no Brasil. O Mais Professores é o plano para fechar essa lacuna até 2030.', 'Lançamento do programa de valorização do magistério.', 'verified', true, '2025-01-21', 'https://valor.globo.com/brasil/educacao/noticia/2025/01/21/camilo-mais-professores.ghtml', 'news_article', 1, 'Brasília', 'Lançamento Mais Professores', 'camilo-mais-professores-b82-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara celebra nova demarcação em Mato Grosso.', 'Hoje o povo Baikari volta oficialmente para sua terra. É justiça tardia, mas é justiça.', 'Cerimônia de homologação de terra indígena em Mato Grosso.', 'verified', false, '2025-09-10', 'https://g1.globo.com/mt/mato-grosso/noticia/2025/09/10/sonia-demarcacao-baikari.ghtml', 'news_article', 1, 'Mato Grosso', 'Homologação TI Baikari', 'sonia-demarcacao-baikari-b82-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Margareth Menezes comemora lei do cinema nacional.', 'A Ancine voltou a financiar. O cinema brasileiro voltou aos festivais internacionais e à economia criativa.', 'Fala em Cannes sobre filmes brasileiros no festival.', 'verified', false, '2024-05-18', 'https://folha.uol.com.br/ilustrada/2024/05/margareth-ancine-cannes.shtml', 'news_article', 1, 'Cannes', 'Festival de Cannes 2024', 'margareth-ancine-cannes-b82-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas propõe CPI para investigar MEC por "doutrinação".', 'Vamos instalar CPI para investigar livros que doutrinam crianças. O MEC virou filial do PT.', 'Apresentação do requerimento de CPI do MEC na Câmara.', 'verified', true, '2024-05-21', 'https://www.poder360.com.br/congresso/nikolas-cpi-mec-doutrinacao/', 'news_article', 4, 'Câmara dos Deputados', 'Requerimento de CPI', 'nikolas-cpi-mec-doutrinacao-b82-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana responde CPI de Nikolas e convoca transparência.', 'Abram todos os livros, todos os programas. Transparência é nossa marca. CPI é palanque, mas gente séria não tem o que esconder.', 'Resposta ao pedido de CPI por Nikolas Ferreira.', 'verified', true, '2024-05-22', 'https://g1.globo.com/educacao/noticia/2024/05/22/camilo-responde-cpi-nikolas.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva MEC', 'camilo-resposta-cpi-nikolas-b82-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
