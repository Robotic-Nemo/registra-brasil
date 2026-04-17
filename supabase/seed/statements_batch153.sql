DO $$
DECLARE
  v_wdias UUID; v_lula UUID; v_hadd UUID; v_tebet UUID; v_padilha UUID; v_rcosta UUID;
  v_camilo UUID; v_nisia UUID; v_marinho UUID; v_anielle UUID; v_cida UUID; v_sonia UUID;
  v_pteix UUID; v_waldez UUID; v_lupi UUID; v_sabino UUID; v_paula UUID; v_macedo UUID;
  v_lsantos UUID; v_marga UUID; v_jair UUID; v_edu UUID; v_nik UUID; v_vanh UUID;
  v_adri UUID; v_kim UUID; v_guedes UUID; v_tarc UUID; v_zema UUID; v_caiado UUID;
  v_helder UUID; v_rnunes UUID; v_epaes UUID; v_fuad UUID; v_jcampos UUID; v_breis UUID;
  v_dalmeida UUID; v_melo UUID; v_greca UUID; v_sarto UUID; v_topazio UUID; v_tabata UUID;
  v_erika UUID; v_samia UUID; v_taliria UUID; v_melchi UUID; v_jandira UUID; v_orlando UUID;
  v_chico UUID; v_boulos UUID; v_janones UUID;

  c_irr UUID; c_des UUID; c_abu UUID; c_con UUID; c_cor UUID; c_odi UUID;
  c_nep UUID; c_ame UUID; c_aut UUID;
BEGIN
  SELECT id INTO v_wdias FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_hadd FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_tebet FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_padilha FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rcosta FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_camilo FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_nisia FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_marinho FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_anielle FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_cida FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_sonia FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_pteix FROM politicians WHERE slug = 'paulo-teixeira';
  SELECT id INTO v_waldez FROM politicians WHERE slug = 'waldez-goes';
  SELECT id INTO v_lupi FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_sabino FROM politicians WHERE slug = 'celso-sabino';
  SELECT id INTO v_paula FROM politicians WHERE slug = 'andre-de-paula';
  SELECT id INTO v_macedo FROM politicians WHERE slug = 'marcio-macedo';
  SELECT id INTO v_lsantos FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_marga FROM politicians WHERE slug = 'margareth-menezes';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_vanh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_adri FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_guedes FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_tarc FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zema FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_caiado FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_helder FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_rnunes FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_epaes FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_fuad FROM politicians WHERE slug = 'fuad-noman';
  SELECT id INTO v_jcampos FROM politicians WHERE slug = 'joao-campos';
  SELECT id INTO v_breis FROM politicians WHERE slug = 'bruno-reis';
  SELECT id INTO v_dalmeida FROM politicians WHERE slug = 'david-almeida';
  SELECT id INTO v_melo FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_greca FROM politicians WHERE slug = 'rafael-greca';
  SELECT id INTO v_sarto FROM politicians WHERE slug = 'jose-sarto';
  SELECT id INTO v_topazio FROM politicians WHERE slug = 'topazio-silveira';
  SELECT id INTO v_tabata FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_erika FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_samia FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_taliria FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_melchi FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_jandira FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orlando FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chico FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_boulos FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_janones FROM politicians WHERE slug = 'andre-janones';

  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias anuncia novo Bolsa Família com valor mínimo de R$ 600 e adicional por criança.', 'O novo Bolsa Família terá piso de R$ 600 e mais R$ 150 por criança de até 6 anos. Ninguém ficará para trás.', 'Lançamento oficial do programa reformulado no Palácio do Planalto, substituindo o Auxílio Brasil.', 'verified', true, '2023-03-02', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/desenvolvimento-social/noticias-desenvolvimento-social/novo-bolsa-familia-lancamento', 'other', 1, 'Palácio do Planalto', 'Lançamento do novo Bolsa Família', 'wdias-novo-bolsa-familia-b153-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula celebra redução da fome com volta do Brasil ao mapa da fome sendo superada.', 'O Brasil saiu do mapa da fome mais uma vez. Esse é o maior orgulho que um presidente pode ter.', 'Discurso após divulgação de dados da FAO apontando saída do Brasil do Mapa da Fome da ONU.', 'verified', true, '2025-07-24', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2025/lula-brasil-sai-mapa-fome', 'other', 1, 'Brasília', 'Pronunciamento oficial', 'lula-brasil-mapa-fome-b153-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad defende teto de gastos do novo arcabouço fiscal para sustentabilidade do Bolsa Família.', 'Sem responsabilidade fiscal não há política social duradoura. O arcabouço protege os mais pobres.', 'Discurso na apresentação do novo arcabouço fiscal ao Congresso.', 'verified', true, '2023-04-18', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2023/abril/haddad-arcabouco-fiscal', 'other', 2, 'Ministério da Fazenda', 'Apresentação do arcabouço fiscal', 'haddad-arcabouco-bolsa-familia-b153-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Bolsa Família dizendo que incentiva preguiça e dependência do Estado.', 'Esse negócio de dar dinheiro a quem não trabalha é fábrica de vagabundo. Prefiro dar peixe, não a vara, é conversa.', 'Entrevista em programa de rádio em Goiânia atacando reformulação do programa social pelo governo Lula.', 'verified', true, '2023-05-22', 'https://www.poder360.com.br/politica/bolsonaro-ataca-bolsa-familia-lula-preguica/', 'news_article', 4, 'Goiânia, GO', 'Entrevista em rádio', 'bolsonaro-ataca-bolsa-familia-b153-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha desinformação sobre Bolsa Família vinculando a fraudes inexistentes.', 'O Bolsa Família do Lula virou festival de fraude. Tem gente rica recebendo enquanto pobre de verdade passa fome.', 'Postagem no X sem apresentar provas, contrariando dados oficiais do CadÚnico que mostraram revisão cadastral histórica.', 'verified', true, '2023-08-10', 'https://www.aosfatos.org/noticias/nikolas-bolsa-familia-fraude-desinformacao/', 'news_article', 4, 'Redes sociais', 'Postagem no X', 'nikolas-bolsa-familia-fraude-b153-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias anuncia revisão cadastral que retirou 2,5 milhões de famílias indevidas do programa.', 'Fizemos a maior revisão da história do CadÚnico. Retiramos quem não devia e garantimos o benefício para os realmente necessitados.', 'Coletiva de imprensa após conclusão do pente-fino cadastral em 2023.', 'verified', false, '2023-11-30', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/desenvolvimento-social/revisao-cadunico-2023', 'other', 1, 'MDS', 'Coletiva pente-fino CadÚnico', 'wdias-revisao-cadunico-b153-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_camilo, 'Camilo Santana anuncia Pé-de-Meia para combater evasão escolar no ensino médio.', 'Vamos pagar para o estudante pobre ficar na escola. O Pé-de-Meia é o maior programa de incentivo à educação do país.', 'Lançamento oficial do programa federal de poupança estudantil.', 'verified', true, '2024-01-26', 'https://www.gov.br/mec/pt-br/assuntos/noticias/2024/janeiro/pe-de-meia-lancamento', 'other', 1, 'Ministério da Educação', 'Lançamento Pé-de-Meia', 'camilo-pe-de-meia-lancamento-b153-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad inclui Pé-de-Meia em fundo privado para contornar arcabouço fiscal, gerando críticas do TCU.', 'Criamos um fundo específico para o Pé-de-Meia, isso dá previsibilidade orçamentária ao programa.', 'Declaração após TCU alertar para falta de transparência na criação do fundo fora do orçamento federal.', 'verified', true, '2024-03-14', 'https://valor.globo.com/politica/noticia/2024/03/14/tcu-alerta-pe-de-meia-fundo-fora-orcamento.ghtml', 'news_article', 3, 'Ministério da Fazenda', 'Resposta ao TCU', 'haddad-pe-de-meia-fundo-tcu-b153-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tebet, 'Simone Tebet defende Pé-de-Meia como investimento no futuro e critica postura bolsonarista contra o programa.', 'Quem é contra pagar estudante pobre ficar na escola é contra o futuro do Brasil. É investimento, não gasto.', 'Entrevista à CBN após oposição tentar derrubar MP do Pé-de-Meia no Congresso.', 'verified', false, '2024-05-02', 'https://cbn.globoradio.globo.com/tebet-defende-pe-de-meia-2024', 'news_article', 2, 'Brasília', 'Entrevista CBN', 'tebet-defende-pe-de-meia-b153-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Alexandre Padilha relança Mais Médicos com mais 15 mil vagas em áreas remotas.', 'O Mais Médicos volta maior do que saiu. São 15 mil novas vagas em áreas que nunca tiveram médico.', 'Cerimônia no Palácio do Planalto relançando o programa desmontado por Bolsonaro em 2019.', 'verified', true, '2023-03-20', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/marco/mais-medicos-relancamento', 'other', 1, 'Palácio do Planalto', 'Relançamento Mais Médicos', 'padilha-mais-medicos-relancamento-b153-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nisia, 'Nísia Trindade anuncia convênio com Cuba suspenso mas garante retorno de médicos cubanos seletivamente.', 'Não vamos repetir o convênio antigo com Cuba, mas médicos cubanos com registro CRM poderão participar.', 'Entrevista coletiva esclarecendo modelo do novo Mais Médicos após polêmica com participação de cubanos.', 'verified', false, '2023-04-10', 'https://g1.globo.com/saude/noticia/2023/04/10/nisia-mais-medicos-cuba.ghtml', 'news_article', 2, 'Ministério da Saúde', 'Entrevista coletiva', 'nisia-mais-medicos-cuba-b153-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ataca retorno do Mais Médicos chamando de invasão comunista.', 'Vão trazer médicos cubanos de novo para espionar o Brasil. Isso é invasão comunista disfarçada de saúde pública.', 'Postagem no X com desinformação já desmentida sobre participação cubana no programa.', 'verified', true, '2023-04-11', 'https://www.aosfatos.org/noticias/eduardo-mais-medicos-cuba-desinformacao/', 'social_media_post', 4, 'Redes sociais', 'Postagem no X', 'eduardo-mais-medicos-comunismo-b153-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula sanciona lei que institui Pé-de-Meia e afirma que nunca mais o pobre será abandonado.', 'O filho do trabalhador não vai precisar largar a escola para ajudar em casa. O Estado vai pagar para ele estudar.', 'Cerimônia de sanção da Lei 14.818 no Palácio do Planalto.', 'verified', true, '2024-01-16', 'https://www.planalto.gov.br/ccivil_03/_ato2023-2026/2024/lei/l14818.htm', 'other', 1, 'Palácio do Planalto', 'Sanção Lei 14.818', 'lula-sanciona-pe-de-meia-b153-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zema, 'Zema diz que Bolsa Família virou instrumento de dependência política do PT.', 'O Bolsa Família deixou de ser auxílio emergencial para virar cabresto eleitoral do PT. Isso não é política social, é compra de voto.', 'Entrevista no Pânico em que critica expansão do programa federal.', 'verified', true, '2023-09-11', 'https://www.jovempan.com.br/programas/panico/zema-bolsa-familia-cabresto-pt.html', 'news_article', 4, 'Jovem Pan', 'Entrevista Pânico', 'zema-bolsa-familia-cabresto-b153-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio amplia Bolsa do Povo em SP sem cumprir promessa de integração com Bolsa Família federal.', 'O Bolsa do Povo é nosso programa, não depende do governo federal. Vamos ampliar independente do Lula.', 'Entrevista após divergências com MDS sobre unificação de cadastros sociais.', 'verified', false, '2024-02-15', 'https://www.folha.uol.com.br/cotidiano/2024/02/tarcisio-bolsa-do-povo-sp.shtml', 'news_article', 2, 'Palácio dos Bandeirantes', 'Entrevista coletiva', 'tarcisio-bolsa-do-povo-sp-b153-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caiado, 'Caiado defende fim do Bolsa Família para maiores de idade sem comprovação de trabalho.', 'Quem tem mais de 18 anos e não trabalha não pode receber Bolsa Família. Tem que ter contrapartida.', 'Entrevista à CBN propondo endurecimento das regras do programa.', 'verified', true, '2024-06-04', 'https://cbn.globoradio.globo.com/caiado-bolsa-familia-contrapartida-2024', 'news_article', 3, 'Goiânia, GO', 'Entrevista CBN', 'caiado-bolsa-familia-contrapartida-b153-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marinho, 'Luiz Marinho anuncia reajuste do salário mínimo acima da inflação retomando política do PT.', 'Retomamos o ganho real do salário mínimo, que havia sido abandonado nos últimos anos. Isso é dignidade ao trabalhador.', 'Discurso no 1º de Maio anunciando política de reajustes por INPC + PIB.', 'verified', true, '2023-05-01', 'https://www.gov.br/trabalho-e-emprego/pt-br/noticias/marinho-salario-minimo-real', 'other', 1, 'São Paulo', '1º de Maio', 'marinho-salario-minimo-ganho-real-b153-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Paulo Guedes ataca política social de Lula dizendo que Brasil caminha para bancarrota.', 'O Brasil está voltando ao populismo fiscal. Essas bolsas vão quebrar o país de novo, é só questão de tempo.', 'Palestra no BTG Pactual em que previu crise fiscal iminente que não se concretizou no timing previsto.', 'verified', false, '2023-10-17', 'https://valor.globo.com/financas/noticia/2023/10/17/guedes-bancarrota-lula-bolsas.ghtml', 'news_article', 3, 'BTG Pactual', 'Palestra para investidores', 'guedes-bancarrota-lula-b153-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_anielle, 'Anielle Franco lança programa de cotas em políticas sociais para população negra.', 'O Brasil tem que reconhecer que a desigualdade tem cor. As políticas sociais precisam enxergar o povo negro.', 'Lançamento do programa Ações Afirmativas em políticas sociais no Ministério da Igualdade Racial.', 'verified', true, '2023-11-20', 'https://www.gov.br/igualdaderacial/pt-br/noticias/cotas-politicas-sociais', 'other', 1, 'Ministério da Igualdade Racial', 'Consciência Negra', 'anielle-cotas-politicas-sociais-b153-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Anielle Franco com ofensas raciais disfarçadas após programa de cotas.', 'Essa gente só sabe dividir o Brasil entre negros e brancos. É o racismo institucional do PT.', 'Vídeo no YouTube atacando ministra após anúncio de programa afirmativo.', 'verified', true, '2023-11-22', 'https://www.metropoles.com/brasil/nikolas-ataca-anielle-cotas-2023', 'news_article', 4, 'YouTube', 'Vídeo em canal próprio', 'nikolas-ataca-anielle-cotas-b153-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sonia, 'Sônia Guajarara anuncia demarcação de seis terras indígenas em primeiro ato do Lula 3.', 'Depois de quatro anos de zero demarcações, retomamos o que a Constituição manda. Seis TIs demarcadas de uma vez.', 'Cerimônia no Planalto com lideranças indígenas para assinatura de decretos de homologação.', 'verified', true, '2023-04-28', 'https://www.gov.br/povosindigenas/pt-br/noticias/demarcacoes-homologadas-lula', 'other', 1, 'Palácio do Planalto', 'Assinatura de decretos', 'sonia-demarcacoes-tis-b153-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica demarcações de terras indígenas como entrega de território nacional.', 'Estão entregando o Brasil para os índios. É colonização às avessas pagada com dinheiro nosso.', 'Discurso em evento da Aprosoja no Mato Grosso criticando demarcações.', 'verified', true, '2023-05-10', 'https://www.cnnbrasil.com.br/politica/bolsonaro-demarcacoes-entrega-brasil-indios/', 'news_article', 4, 'Cuiabá, MT', 'Evento Aprosoja MT', 'bolsonaro-demarcacoes-entrega-b153-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cida, 'Cida Gonçalves lança Casa da Mulher Brasileira em 40 novos municípios.', 'Toda mulher tem direito a um lugar seguro para denunciar a violência. Vamos levar a Casa da Mulher a todo canto.', 'Anúncio do programa de expansão com CAF e recursos federais.', 'verified', false, '2023-08-07', 'https://www.gov.br/mulheres/pt-br/noticias/casa-da-mulher-brasileira-expansao', 'other', 1, 'Ministério das Mulheres', 'Expansão Casa da Mulher', 'cida-casa-mulher-brasileira-b153-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adri, 'Adriana Ventura critica expansão de auxílios sociais do governo Lula.', 'O Brasil virou um balcão de auxílios. Enquanto isso ninguém fala em geração de emprego de verdade.', 'Discurso em plenário contra ampliação de programas de transferência de renda.', 'verified', false, '2023-09-27', 'https://www.camara.leg.br/noticias/adriana-ventura-auxilios-2023', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento plenário', 'adriana-ataca-auxilios-b153-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula reinstitui Consea e retoma soberania alimentar como política de Estado.', 'O Consea volta porque fome não é aceitável em um país que produz comida para o mundo inteiro.', 'Cerimônia de recriação do Conselho Nacional de Segurança Alimentar e Nutricional.', 'verified', true, '2023-02-02', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-recria-consea', 'other', 1, 'Palácio do Planalto', 'Recriação do Consea', 'lula-recria-consea-b153-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanh, 'Van Hattem chama Bolsa Família de promessa vazia de redução de pobreza.', 'O Bolsa Família criou dependência, não cidadãos. O que tira da pobreza é emprego e educação, não esmola.', 'Discurso em tribuna criticando novo programa social.', 'verified', false, '2023-06-14', 'https://www.camara.leg.br/noticias/van-hattem-bolsa-familia-esmola-2023', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento plenário', 'vanhattem-bolsa-familia-esmola-b153-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Padilha anuncia Farmácia Popular com ampliação de medicamentos gratuitos em 2024.', 'Vamos dobrar os medicamentos gratuitos na Farmácia Popular. Diabetes, hipertensão e asma agora sem custo.', 'Anúncio de ampliação do programa após corte feito na gestão Bolsonaro.', 'verified', true, '2024-04-15', 'https://www.gov.br/saude/pt-br/noticias/farmacia-popular-ampliacao-2024', 'other', 1, 'Ministério da Saúde', 'Ampliação Farmácia Popular', 'padilha-farmacia-popular-amplia-b153-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lupi, 'Carlos Lupi anuncia reajuste de 6,97% no INSS em 2024.', 'Garantimos reajuste acima da inflação para os aposentados que estavam abandonados.', 'Anúncio de reajuste seguindo política de valorização do salário mínimo.', 'verified', false, '2024-01-10', 'https://www.gov.br/previdencia/pt-br/noticias/lupi-reajuste-inss-2024', 'other', 1, 'MPS', 'Coletiva INSS', 'lupi-reajuste-inss-b153-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lupi, 'Lupi é demitido após escândalo de descontos indevidos em aposentados do INSS.', 'Não participei de nenhum esquema. Minha consciência está tranquila.', 'Pronunciamento após ser exonerado em meio à operação da PF que identificou fraude em descontos associativos em benefícios.', 'verified', true, '2025-05-02', 'https://g1.globo.com/politica/noticia/2025/05/02/lupi-demissao-inss-descontos.ghtml', 'news_article', 4, 'Brasília', 'Pronunciamento após demissão', 'lupi-demissao-inss-fraude-b153-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula promete ressarcir aposentados lesados por descontos ilegais do INSS.', 'Nenhum aposentado vai ficar no prejuízo. O governo vai devolver cada centavo tirado indevidamente.', 'Pronunciamento em rede nacional após escândalo de descontos associativos.', 'verified', true, '2025-05-05', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2025/lula-descontos-inss', 'other', 2, 'Palácio do Planalto', 'Pronunciamento em rede', 'lula-ressarcir-aposentados-inss-b153-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira usa escândalo do INSS para atacar Lula acusando-o de roubar aposentados.', 'Lula roubou os aposentados na frente de todo mundo. Esse é o governo da decência.', 'Vídeo no Instagram atacando governo após escândalo dos descontos.', 'verified', true, '2025-05-03', 'https://www.cnnbrasil.com.br/politica/nikolas-ataca-lula-inss-2025/', 'social_media_post', 4, 'Redes sociais', 'Postagem Instagram', 'nikolas-ataca-lula-inss-b153-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias anuncia Bolsa Família pagando 21,1 milhões de famílias em valor recorde.', 'O Bolsa Família chega hoje a 21,1 milhões de famílias, cobertura histórica jamais vista no Brasil.', 'Coletiva em balanço do primeiro ano do novo programa.', 'verified', false, '2023-12-20', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/bolsa-familia-balanco-2023', 'other', 1, 'MDS', 'Balanço 2023', 'wdias-bolsa-familia-21milhoes-b153-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri propõe reforma do Bolsa Família vinculado a trabalho obrigatório.', 'Quem recebe Bolsa Família tem que trabalhar. Se não quiser trabalhar, não pode ficar recebendo do povo.', 'Entrevista à Jovem Pan defendendo workfare à brasileira.', 'verified', false, '2023-07-12', 'https://jovempan.com.br/programas/pingos-nos-is/kim-kataguiri-bolsa-familia-trabalho.html', 'news_article', 3, 'Jovem Pan', 'Pingos nos Is', 'kim-bolsa-familia-workfare-b153-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral defende Pé-de-Meia como política educacional transformadora.', 'O Pé-de-Meia pode ser a política mais transformadora da educação brasileira dos últimos 20 anos.', 'Discurso em plenário na aprovação da MP do programa.', 'verified', false, '2024-05-02', 'https://www.camara.leg.br/noticias/tabata-pe-de-meia-transformadora', 'news_article', 1, 'Câmara dos Deputados', 'Discurso de apoio', 'tabata-defende-pe-de-meia-b153-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton defende inclusão de mulheres trans no Bolsa Família como chefes de família.', 'Mulheres trans e travestis também são chefes de família. O cadastro precisa reconhecer essa realidade.', 'Projeto de lei apresentado na Câmara.', 'verified', false, '2023-06-28', 'https://www.camara.leg.br/noticias/erika-hilton-bolsa-familia-trans-2023', 'news_article', 2, 'Câmara dos Deputados', 'Apresentação de PL', 'erika-trans-bolsa-familia-b153-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_samia, 'Sâmia Bomfim defende ampliação do salário mínimo e piso do SUAS.', 'O salário mínimo precisa crescer, e junto a ele o piso dos trabalhadores do SUAS. Precisamos valorizar quem cuida.', 'Discurso em audiência pública sobre política de assistência social.', 'verified', false, '2023-10-04', 'https://www.camara.leg.br/noticias/samia-suas-piso-2023', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública SUAS', 'samia-suas-piso-b153-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_boulos, 'Guilherme Boulos defende Minha Casa Minha Vida com faixa para famílias sem renda.', 'A habitação popular precisa chegar a quem mais precisa, inclusive famílias sem comprovação de renda.', 'Discurso em ato do MTST pela retomada do MCMV Entidades.', 'verified', false, '2023-03-15', 'https://www.mtst.org/noticias/boulos-mcmv-sem-renda-2023', 'news_article', 2, 'São Paulo', 'Ato MTST', 'boulos-mcmv-sem-renda-b153-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jcampos, 'João Campos anuncia programa Juntos pela Segurança Alimentar em Recife.', 'Nenhuma criança vai dormir com fome em Recife. O Juntos pela Segurança Alimentar vai garantir isso.', 'Lançamento municipal de programa de distribuição de alimentos.', 'verified', false, '2023-06-12', 'https://www2.recife.pe.gov.br/noticias/joao-campos-seguranca-alimentar-2023', 'other', 1, 'Prefeitura do Recife', 'Lançamento do programa', 'jcampos-seguranca-alimentar-b153-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epaes, 'Eduardo Paes anuncia Bolsa Carioca para integrar beneficiários do Bolsa Família.', 'O Bolsa Carioca é o complemento municipal ao programa federal. Cidadania começa pela dignidade.', 'Anúncio em coletiva do programa municipal de complementação.', 'verified', false, '2024-02-20', 'https://prefeitura.rio/cidade/bolsa-carioca-eduardo-paes-2024/', 'other', 1, 'Prefeitura do Rio', 'Lançamento Bolsa Carioca', 'paes-bolsa-carioca-b153-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rnunes, 'Ricardo Nunes critica condicionalidades do Bolsa Família federal em São Paulo.', 'As regras do Bolsa Família federal precisam conversar com a realidade das metrópoles. Em SP é diferente.', 'Entrevista coletiva sobre integração com programa estadual.', 'verified', false, '2024-05-18', 'https://www.capital.sp.gov.br/noticias/ricardo-nunes-bolsa-familia-2024', 'other', 2, 'Prefeitura de SP', 'Coletiva', 'rnunes-bolsa-familia-sp-b153-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_helder, 'Helder Barbalho ancora programa Renda Pará complementar ao Bolsa Família.', 'O Pará criou o Renda Pará para completar o Bolsa Família nas populações mais vulneráveis. É política complementar.', 'Lançamento de programa estadual com recursos próprios.', 'verified', false, '2023-09-22', 'https://agenciapara.com.br/noticia/helder-renda-para-2023', 'other', 1, 'Governo do Pará', 'Lançamento Renda Pará', 'helder-renda-para-b153-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Padilha anuncia programa Agora Tem Especialistas para reduzir fila do SUS.', 'Vamos acabar com a fila do SUS nas especialidades. O Agora Tem Especialistas é a maior força-tarefa da história do SUS.', 'Lançamento do programa federal de regulação e mutirões.', 'verified', true, '2025-06-10', 'https://www.gov.br/saude/pt-br/noticias/agora-tem-especialistas-lancamento', 'other', 1, 'Ministério da Saúde', 'Lançamento Agora Tem Especialistas', 'padilha-agora-tem-especialistas-b153-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma mentirosamente que destruiu Mais Médicos por escravidão dos profissionais.', 'Acabei com o Mais Médicos porque era escravidão. Lula voltou a escravizar os cubanos.', 'Entrevista em podcast atacando programa, ignorando que muitos cubanos voluntariamente permaneceram no Brasil.', 'verified', true, '2023-05-18', 'https://www.aosfatos.org/noticias/bolsonaro-mais-medicos-escravidao-desinformacao/', 'news_article', 4, 'Podcast', 'Entrevista em podcast', 'bolsonaro-mais-medicos-escravidao-b153-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_camilo, 'Camilo Santana anuncia saldo de 4,1 milhões de estudantes no Pé-de-Meia.', 'O Pé-de-Meia alcançou 4,1 milhões de jovens pobres. Isso é a maior política de permanência escolar da história.', 'Balanço de um ano do programa federal.', 'verified', false, '2025-03-15', 'https://www.gov.br/mec/pt-br/assuntos/noticias/pe-de-meia-balanco-1ano', 'other', 1, 'MEC', 'Balanço Pé-de-Meia', 'camilo-pe-de-meia-balanco-b153-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nisia, 'Nísia Trindade é exonerada após atritos com Congresso sobre saúde indígena.', 'Fiz minha parte pela saúde do povo brasileiro. Saio de cabeça erguida.', 'Declaração após Lula anunciar troca no Ministério da Saúde.', 'verified', true, '2025-02-26', 'https://g1.globo.com/politica/noticia/2025/02/26/nisia-demissao-saude.ghtml', 'news_article', 2, 'Brasília', 'Pronunciamento na exoneração', 'nisia-demissao-saude-b153-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sonia, 'Sônia Guajajara denuncia ataques do agro às políticas indígenas do governo Lula.', 'Vivemos a pior perseguição ao povo indígena dos últimos 30 anos. O agro bolsonarista ataca todos os dias nossa autoridade.', 'Entrevista à Folha comentando projeto do marco temporal aprovado no Congresso.', 'verified', true, '2023-12-14', 'https://www.folha.uol.com.br/ambiente/2023/12/sonia-guajajara-ataques-agro.shtml', 'news_article', 2, 'Brasília', 'Entrevista Folha', 'sonia-ataques-agro-b153-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad defende isenção de IR até R$ 5 mil como maior política social desde 1990.', 'A isenção do IR até R$ 5 mil tira 10 milhões de trabalhadores do imposto. É redistribuição histórica.', 'Apresentação da proposta ao Congresso em cerimônia no Planalto.', 'verified', true, '2025-03-18', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/marco/haddad-ir-5mil', 'other', 2, 'Palácio do Planalto', 'Apresentação PL IR', 'haddad-ir-5mil-politica-social-b153-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio evita criticar abertamente isenção de IR de Haddad mas critica custeio.', 'Toda isenção tributária é bem vinda, mas quem vai pagar a conta? Essa é a pergunta que não respondem.', 'Entrevista à Globonews em meio a negociações no Congresso.', 'verified', false, '2025-03-25', 'https://g1.globo.com/globonews/noticia/2025/03/25/tarcisio-ir-5mil-custo.ghtml', 'news_article', 2, 'Palácio dos Bandeirantes', 'Entrevista Globonews', 'tarcisio-critica-ir-custeio-b153-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias anuncia Cozinha Solidária em 24 capitais com entrega de refeições a moradores de rua.', 'A Cozinha Solidária alcança 24 capitais. Ninguém deveria dormir com fome em um país que produz comida em abundância.', 'Balanço da expansão do programa junto ao MST e movimentos sociais.', 'verified', false, '2024-07-28', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/cozinha-solidaria-24-capitais', 'other', 1, 'MDS', 'Balanço Cozinha Solidária', 'wdias-cozinha-solidaria-b153-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marga, 'Margareth Menezes lança política de fomento à cultura em periferias com R$ 3 bi.', 'Cultura é um direito. Estamos levando R$ 3 bilhões para a cultura periférica, que foi abandonada por anos.', 'Lançamento da Lei Paulo Gustavo e PNAB para financiamento cultural.', 'verified', false, '2023-10-20', 'https://www.gov.br/cultura/pt-br/noticias/margareth-paulo-gustavo-pnab', 'other', 1, 'MinC', 'Lançamento Paulo Gustavo', 'marga-paulo-gustavo-pnab-b153-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lsantos, 'Luciana Santos anuncia programa MCTI Periferia com bolsas de C&T em favelas.', 'A ciência também precisa chegar à periferia. Vamos dar bolsas para quem nunca teve acesso à pesquisa.', 'Lançamento do programa em parceria com CNPq.', 'verified', false, '2024-03-08', 'https://www.gov.br/mcti/pt-br/noticias/mcti-periferia-2024', 'other', 1, 'MCTI', 'Lançamento MCTI Periferia', 'lsantos-mcti-periferia-b153-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caiado, 'Caiado lança Cheque Futuro paralelo ao Pé-de-Meia em Goiás.', 'O Cheque Futuro de Goiás complementa o Pé-de-Meia nacional. Aqui a gente faz diferente, sem marketing político.', 'Anúncio de programa estadual em cerimônia em Goiânia.', 'verified', false, '2024-04-19', 'https://www.go.gov.br/noticias/caiado-cheque-futuro-goias-2024', 'other', 1, 'Governo de Goiás', 'Lançamento Cheque Futuro', 'caiado-cheque-futuro-goias-b153-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali defende ampliação do piso da enfermagem ameaçado por liminar no STF.', 'O piso da enfermagem é conquista histórica. Não podemos recuar diante de pressão de planos de saúde.', 'Discurso em plenário após STF suspender temporariamente efeitos da lei.', 'verified', false, '2023-02-22', 'https://www.camara.leg.br/noticias/jandira-piso-enfermagem-stf', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento plenário', 'jandira-piso-enfermagem-b153-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar defende orçamento próprio para Programa de Proteção a Defensores de Direitos Humanos.', 'Quem protege a democracia não pode ficar desprotegido. O PPDDH precisa de orçamento de verdade.', 'Discurso em audiência pública sobre proteção a ativistas.', 'verified', false, '2024-09-04', 'https://www.camara.leg.br/noticias/chico-alencar-ppddh-2024', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'chico-ppddh-orcamento-b153-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orlando, 'Orlando Silva relata texto de regulação de plataformas digitais com proteção social integrada.', 'A regulação das plataformas é fundamental. Elas ganham em cima da nossa sociedade e não dão contrapartida social.', 'Apresentação de parecer ao PL 2630.', 'verified', false, '2023-04-27', 'https://www.camara.leg.br/noticias/orlando-silva-pl-2630-2023', 'news_article', 2, 'Câmara dos Deputados', 'Relatório PL 2630', 'orlando-pl2630-parecer-b153-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_taliria, 'Talíria Petrone denuncia corte em políticas públicas para mulheres negras em MG.', 'O governo Zema enxuga políticas para mulheres negras. A crise fiscal está nas costas das mais pobres.', 'Discurso em ato do 25 de julho em Belo Horizonte.', 'verified', false, '2024-07-25', 'https://www.psol50.org.br/noticias/taliria-zema-mulheres-negras-2024', 'news_article', 2, 'Belo Horizonte, MG', 'Ato 25 de Julho', 'taliria-zema-mulheres-negras-b153-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_melchi, 'Fernanda Melchionna defende ampliação do programa Universidade para Todos.', 'O Prouni precisa ser ampliado urgentemente. A universidade ainda é elitista neste país.', 'Discurso em plenário na semana da aprovação de novas vagas.', 'verified', false, '2024-11-06', 'https://www.camara.leg.br/noticias/melchionna-prouni-ampliacao-2024', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento plenário', 'melchionna-prouni-b153-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_janones, 'André Janones defende piso do magistério acompanhar reajuste do salário mínimo.', 'Professor pobre vai sempre votar em alguém como o Bolsonaro enquanto seu salário não for respeitado.', 'Discurso em plenário em defesa do reajuste do piso nacional do magistério.', 'verified', false, '2024-01-17', 'https://www.camara.leg.br/noticias/janones-piso-magisterio-2024', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento plenário', 'janones-piso-magisterio-b153-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Padilha defende regulação de planos de saúde após reajustes abusivos na ANS.', 'Os reajustes de planos estão acima do razoável. A ANS precisa ser mais firme em defesa do consumidor.', 'Entrevista após ANS autorizar reajustes acima de 6% em planos individuais.', 'verified', false, '2024-05-30', 'https://g1.globo.com/saude/noticia/2024/05/30/padilha-ans-planos-saude.ghtml', 'news_article', 2, 'Ministério da Saúde', 'Entrevista', 'padilha-ans-planos-saude-b153-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zema, 'Zema contingencia R$ 2 bi em programas sociais estaduais mirando equilíbrio fiscal.', 'MG precisa se ajustar fiscalmente. Não tem dinheiro para manter programas assistencialistas do PT.', 'Anúncio de corte de programas estaduais em coletiva de imprensa.', 'verified', true, '2024-08-15', 'https://www.em.com.br/politica/2024/08/zema-cortes-programas-sociais-minas.shtml', 'news_article', 4, 'Palácio Tiradentes', 'Coletiva contingenciamento', 'zema-corte-sociais-mg-b153-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fuad, 'Fuad Noman amplia Bolsa Moradia para famílias em áreas de risco em BH.', 'Ninguém vai ficar sem teto em BH. O Bolsa Moradia atende famílias em situação de risco.', 'Anúncio após chuvas torrenciais em Belo Horizonte.', 'verified', false, '2023-12-22', 'https://prefeitura.pbh.gov.br/noticias/fuad-bolsa-moradia-2023', 'other', 1, 'Prefeitura de BH', 'Anúncio pós-chuvas', 'fuad-bolsa-moradia-bh-b153-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dalmeida, 'David Almeida anuncia Auxílio Manauara em Manaus com complemento ao Bolsa Família.', 'O Auxílio Manauara chega às famílias mais vulneráveis e complementa o Bolsa Família federal.', 'Anúncio de programa municipal durante festividades de aniversário da capital.', 'verified', false, '2023-10-24', 'https://www.manaus.am.gov.br/noticias/david-almeida-auxilio-manauara-2023', 'other', 1, 'Prefeitura de Manaus', 'Lançamento auxílio', 'dalmeida-auxilio-manauara-b153-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_melo, 'Sebastião Melo decreta auxílio emergencial a famílias afetadas pela enchente em Porto Alegre.', 'Porto Alegre vai honrar cada família atingida. Vamos pagar o auxílio municipal emergencial.', 'Decreto municipal pós-enchente histórica de maio de 2024.', 'verified', true, '2024-05-15', 'https://prefeitura.poa.br/noticias/melo-auxilio-enchente-2024', 'other', 2, 'Prefeitura de Porto Alegre', 'Decreto emergencial', 'melo-auxilio-enchente-poa-b153-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula anuncia R$ 50 bi para reconstrução do RS após enchentes.', 'O Rio Grande do Sul não vai ficar sozinho. O Brasil todo vai reconstruir o RS.', 'Pronunciamento em rede nacional anunciando pacote para o estado.', 'verified', true, '2024-05-09', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2024/lula-rs-50bi', 'other', 1, 'Palácio do Planalto', 'Pronunciamento rede nacional', 'lula-50bi-rs-enchentes-b153-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha desinformação sobre ajuda do governo no RS após enchentes.', 'Lula não liberou nada para o RS. Usou tragédia para fazer marketing.', 'Vídeo no Instagram desmentido por Aos Fatos e Agência Lupa.', 'verified', true, '2024-05-12', 'https://www.aosfatos.org/noticias/nikolas-rs-enchentes-desinformacao/', 'social_media_post', 4, 'Redes sociais', 'Postagem Instagram', 'nikolas-rs-enchentes-fake-b153-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias paga Auxílio Reconstrução de R$ 5.100 a famílias atingidas pelas enchentes no RS.', 'Pagamos R$ 5.100 em parcela única a cada família gaúcha atingida. Esse é o Brasil solidário.', 'Cerimônia de pagamento do auxílio em Porto Alegre.', 'verified', true, '2024-05-28', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/auxilio-reconstrucao-rs', 'other', 1, 'Porto Alegre', 'Pagamento Auxílio Reconstrução', 'wdias-auxilio-reconstrucao-rs-b153-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tebet, 'Simone Tebet defende Plano Brasil Sem Fome com meta de erradicação até 2030.', 'Não basta sair do Mapa da Fome. Queremos um Brasil sem fome estrutural até 2030.', 'Apresentação do plano interministerial no Planalto.', 'verified', false, '2023-08-30', 'https://www.gov.br/planejamento/pt-br/noticias/tebet-brasil-sem-fome-2030', 'other', 1, 'Palácio do Planalto', 'Lançamento Brasil Sem Fome', 'tebet-brasil-sem-fome-b153-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ataca plano Brasil Sem Fome como propaganda comunista.', 'Brasil Sem Fome é propaganda comunista. Na minha cidade tem mais fome agora do que no Bolsonaro.', 'Discurso em comício bolsonarista em Santa Catarina.', 'verified', false, '2023-09-10', 'https://www.poder360.com.br/politica/eduardo-brasil-sem-fome-comunismo/', 'news_article', 3, 'Florianópolis, SC', 'Comício', 'eduardo-brasil-sem-fome-b153-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sabino, 'Celso Sabino anuncia PRONAMPE Turismo para microempresas pós-pandemia.', 'O turismo foi o que mais sofreu na pandemia. Vamos direcionar crédito especial para microempresas do setor.', 'Lançamento de linha de crédito específica.', 'verified', false, '2023-06-21', 'https://www.gov.br/turismo/pt-br/noticias/sabino-pronampe-turismo-2023', 'other', 1, 'Ministério do Turismo', 'Lançamento crédito', 'sabino-pronampe-turismo-b153-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pteix, 'Paulo Teixeira anuncia retomada da reforma agrária com Terra da Gente.', 'A reforma agrária precisa voltar. O Terra da Gente vai assentar 100 mil famílias até o fim do mandato.', 'Lançamento de programa no Incra.', 'verified', false, '2023-04-04', 'https://www.gov.br/mda/pt-br/noticias/pteixeira-terra-da-gente-2023', 'other', 1, 'Incra', 'Lançamento Terra da Gente', 'pteixeira-terra-da-gente-b153-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama reforma agrária de invasão de terra produtiva.', 'Reforma agrária do Lula é invasão. Estão devolvendo terra produtiva para o MST destruir.', 'Evento da bancada ruralista em Brasília.', 'verified', true, '2023-04-20', 'https://www.cnnbrasil.com.br/politica/bolsonaro-reforma-agraria-invasao/', 'news_article', 3, 'Brasília', 'Evento ruralista', 'bolsonaro-reforma-agraria-invasao-b153-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias anuncia Auxílio Gás em parcelas bimestrais com 6 milhões de famílias.', 'O Auxílio Gás é hoje o maior programa de cozinha popular do mundo. 6 milhões de famílias recebem gás de graça.', 'Coletiva de imprensa sobre primeiro ano do programa ampliado.', 'verified', false, '2023-11-14', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/auxilio-gas-balanco-2023', 'other', 1, 'MDS', 'Balanço Auxílio Gás', 'wdias-auxilio-gas-b153-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adri, 'Adriana Ventura critica Auxílio Gás dizendo que deveria ser substituído por vale-alimentação.', 'Vale-gás é populismo puro. Melhor dar cesta básica ou reduzir tributo do botijão diretamente.', 'Discurso na CCJ criticando programa federal.', 'verified', false, '2023-11-16', 'https://www.camara.leg.br/noticias/adriana-ventura-auxilio-gas-2023', 'news_article', 2, 'Câmara dos Deputados', 'Sessão CCJ', 'adriana-auxilio-gas-b153-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad anuncia programa Desenrola Brasil para renegociação de dívidas de 30 milhões.', 'O Desenrola Brasil é o maior programa de renegociação de dívidas do mundo. 30 milhões de brasileiros sairão do Serasa.', 'Lançamento oficial do programa no Palácio do Planalto.', 'verified', true, '2023-07-17', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2023/julho/haddad-desenrola-brasil', 'other', 1, 'Palácio do Planalto', 'Lançamento Desenrola', 'haddad-desenrola-brasil-b153-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zema, 'Zema defende privatização da Copasa afetando tarifa social de água.', 'A Copasa privatizada vai gerar investimentos em saneamento. Tarifa social será mantida por contrato.', 'Entrevista defendendo privatização das estatais mineiras.', 'verified', true, '2024-10-08', 'https://www.em.com.br/politica/2024/10/zema-privatizacao-copasa.shtml', 'news_article', 3, 'Palácio Tiradentes', 'Entrevista Estado de Minas', 'zema-privatizacao-copasa-b153-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Padilha anuncia R$ 10 bi extras para saúde em PAC da Saúde.', 'O PAC da Saúde traz R$ 10 bilhões para obras em UBS, hospitais e UPAs. Reconstrução do SUS.', 'Anúncio de pacote de investimentos.', 'verified', false, '2023-08-12', 'https://www.gov.br/saude/pt-br/noticias/padilha-pac-saude-2023', 'other', 1, 'Ministério da Saúde', 'Lançamento PAC Saúde', 'padilha-pac-saude-b153-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa anuncia retomada de 7 mil obras paradas com PAC reconstrução.', 'Temos 7 mil obras paradas. Vamos retomar todas. O PAC é a reconstrução do Brasil.', 'Lançamento do Novo PAC no Palácio do Planalto.', 'verified', true, '2023-08-11', 'https://www.gov.br/casacivil/pt-br/noticias/rui-costa-pac-7mil-obras', 'other', 1, 'Casa Civil', 'Lançamento Novo PAC', 'rcosta-pac-7mil-obras-b153-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_waldez, 'Waldez Góes anuncia programa Defesa Civil Alerta integrado a celulares.', 'Todo brasileiro vai receber alerta no celular em caso de enchente, deslizamento ou tragédia. Isso salva vidas.', 'Lançamento do programa federal de alertas.', 'verified', false, '2024-02-12', 'https://www.gov.br/mdr/pt-br/noticias/defesa-civil-alerta-2024', 'other', 1, 'MDR', 'Lançamento Defesa Civil Alerta', 'waldez-defesa-civil-alerta-b153-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_breis, 'Bruno Reis anuncia Bolsa Família Baiana em Salvador para complementação.', 'Salvador vai garantir complementação ao Bolsa Família. A cidade tem que cuidar dos seus.', 'Lançamento de programa municipal de transferência complementar.', 'verified', false, '2023-07-04', 'https://www.salvador.ba.gov.br/noticias/bruno-reis-bolsa-familia-municipal', 'other', 1, 'Prefeitura de Salvador', 'Lançamento programa municipal', 'breis-bolsa-familia-salvador-b153-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_greca, 'Rafael Greca promove programa Comida Solidária em Curitiba até fim do mandato.', 'Até 31 de dezembro, ninguém vai dormir com fome em Curitiba. O Comida Solidária vai chegar a todos.', 'Anúncio final de programa municipal de distribuição.', 'verified', false, '2024-10-02', 'https://www.curitiba.pr.gov.br/noticias/greca-comida-solidaria-2024', 'other', 1, 'Prefeitura de Curitiba', 'Anúncio fim de mandato', 'greca-comida-solidaria-curitiba-b153-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarto, 'José Sarto amplia Cartão Mais Infância para 30 mil crianças em Fortaleza.', 'A primeira infância é prioridade. O Cartão Mais Infância atende agora 30 mil crianças em Fortaleza.', 'Anúncio municipal em aniversário do programa.', 'verified', false, '2024-06-10', 'https://www.fortaleza.ce.gov.br/noticias/sarto-cartao-mais-infancia-2024', 'other', 1, 'Prefeitura de Fortaleza', 'Aniversário do programa', 'sarto-cartao-mais-infancia-b153-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_topazio, 'Topázio Silveira anuncia Cartão Social Floripa como suplemento ao Bolsa Família.', 'Florianópolis terá Cartão Social Floripa para complementar programas federais. Cidadania exige dignidade.', 'Anúncio de programa municipal em entrevista.', 'verified', false, '2025-02-18', 'https://www.florianopolis.sc.gov.br/noticias/topazio-cartao-social-2025', 'other', 1, 'Prefeitura de Florianópolis', 'Anúncio municipal', 'topazio-cartao-social-floripa-b153-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Pé-de-Meia como marketing eleitoreiro disfarçado de programa social.', 'Esse negócio de pagar estudante é cabresto eleitoral. Marketing puro do Lula para 2026.', 'Entrevista a podcast atacando programa federal de educação.', 'verified', true, '2024-05-09', 'https://www.cnnbrasil.com.br/politica/bolsonaro-pe-de-meia-marketing/', 'news_article', 4, 'Podcast', 'Entrevista podcast', 'bolsonaro-ataca-pe-de-meia-b153-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_macedo, 'Márcio Macedo anuncia programa de inclusão produtiva para beneficiários do Bolsa Família.', 'Bolsa Família não é o fim, é o começo. O Acredita vai capacitar quem recebe para sair do programa.', 'Lançamento do programa federal de capacitação.', 'verified', false, '2024-04-08', 'https://www.gov.br/mds/pt-br/noticias/macedo-acredita-inclusao-produtiva', 'other', 1, 'MDS', 'Lançamento Acredita', 'macedo-acredita-inclusao-b153-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_paula, 'André de Paula anuncia Pesca Sustentável com R$ 300 milhões para pescadores artesanais.', 'A pesca artesanal é esquecida. Vamos investir R$ 300 milhões no setor até 2026.', 'Lançamento de programa setorial.', 'verified', false, '2023-12-05', 'https://www.gov.br/mpa/pt-br/noticias/paula-pesca-sustentavel-2023', 'other', 1, 'Ministério da Pesca', 'Lançamento pesca', 'paula-pesca-sustentavel-b153-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tebet, 'Tebet critica oposição bolsonarista por votar contra Pé-de-Meia na Câmara.', 'Quem votou contra o Pé-de-Meia votou contra o futuro do Brasil. São eles mesmos que cortaram bolsa durante Bolsonaro.', 'Entrevista no Planalto após aprovação apertada da MP.', 'verified', true, '2024-05-03', 'https://g1.globo.com/politica/noticia/2024/05/03/tebet-oposicao-pe-de-meia.ghtml', 'news_article', 2, 'Palácio do Planalto', 'Coletiva', 'tebet-oposicao-pe-de-meia-b153-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nisia, 'Nísia Trindade anuncia Programa Nacional de Atenção à Saúde da Mulher.', 'A saúde da mulher precisa de atenção especial em todo ciclo de vida. A partir de hoje isso é prioridade no SUS.', 'Lançamento de programa no Ministério da Saúde.', 'verified', false, '2024-03-08', 'https://www.gov.br/saude/pt-br/noticias/nisia-saude-mulher-2024', 'other', 1, 'Ministério da Saúde', 'Lançamento 8M', 'nisia-saude-mulher-b153-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira usa dados manipulados para atacar Mais Médicos.', 'O Mais Médicos do Lula só tem incompetente. Os números do programa são fraude completa.', 'Vídeo no YouTube com dados não verificáveis sobre o programa.', 'verified', true, '2024-07-10', 'https://www.aosfatos.org/noticias/nikolas-mais-medicos-2024-desinformacao/', 'social_media_post', 4, 'YouTube', 'Vídeo em canal próprio', 'nikolas-mais-medicos-fake-b153-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula anuncia Minha Casa Minha Vida Entidades com retomada após anos sem recursos.', 'O MCMV Entidades volta. Movimentos sociais vão construir moradia popular de novo no Brasil.', 'Lançamento no Planalto com participação de MTST e UMM.', 'verified', true, '2023-02-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-mcmv-entidades', 'other', 1, 'Palácio do Planalto', 'Retomada MCMV Entidades', 'lula-mcmv-entidades-b153-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica MCMV Entidades como programa partidarizado do MTST.', 'Dar dinheiro de MCMV para o MTST é partidarizar política pública. É escancarado.', 'Discurso em plenário criticando retomada do programa.', 'verified', false, '2023-02-21', 'https://www.camara.leg.br/noticias/kim-mcmv-mtst-partidarizacao-2023', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento plenário', 'kim-mcmv-mtst-b153-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias cria Cadastro Único Digital integrando 80 milhões de brasileiros.', 'O CadÚnico digital integra 80 milhões de brasileiros com benefícios automatizados e cruzamento inteligente de dados.', 'Lançamento da plataforma digital unificada.', 'verified', false, '2024-08-20', 'https://www.gov.br/mds/pt-br/noticias/cadunico-digital-80-milhoes', 'other', 1, 'MDS', 'Lançamento CadÚnico Digital', 'wdias-cadunico-digital-b153-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Padilha anuncia novo SUS Digital com telemedicina gratuita em todos os municípios.', 'Todo brasileiro vai ter acesso à telemedicina no SUS. Vai acabar com as filas de especialidades em cidades pequenas.', 'Lançamento do programa federal de saúde digital.', 'verified', false, '2024-11-05', 'https://www.gov.br/saude/pt-br/noticias/padilha-sus-digital-2024', 'other', 1, 'Ministério da Saúde', 'Lançamento SUS Digital', 'padilha-sus-digital-b153-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Paulo Guedes culpa Bolsa Família por inflação sem base técnica.', 'A inflação brasileira é por conta dessa farra de bolsas. Dinheiro em excesso na mão de quem não produz.', 'Entrevista à revista Exame desmentida por economistas.', 'verified', false, '2023-12-08', 'https://exame.com/economia/guedes-bolsa-familia-inflacao-exame/', 'news_article', 3, 'Revista Exame', 'Entrevista', 'guedes-bolsa-familia-inflacao-b153-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad rebate Guedes dizendo que Bolsa Família tem efeito inflacionário marginal.', 'A dada demonstra que programas de transferência têm efeito inflacionário marginal. É discurso vazio de quem não entende economia.', 'Entrevista à GloboNews respondendo crítica de Guedes.', 'verified', false, '2023-12-11', 'https://g1.globo.com/politica/noticia/2023/12/11/haddad-rebate-guedes-bolsa-familia.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Entrevista GloboNews', 'haddad-rebate-guedes-b153-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sonia, 'Sônia Guajajara anuncia UBS indígenas com atendimento específico em 300 municípios.', 'Vamos levar 300 UBS indígenas para aldeias que nunca viram um médico. Isso é reparação histórica.', 'Lançamento de programa no Ministério dos Povos Indígenas.', 'verified', false, '2023-07-28', 'https://www.gov.br/povosindigenas/pt-br/noticias/ubs-indigenas-300-2023', 'other', 1, 'MPI', 'Lançamento UBS Indígenas', 'sonia-ubs-indigenas-b153-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_anielle, 'Anielle Franco lança Plano Juventude Negra Viva contra genocídio da juventude.', 'A juventude negra é o principal alvo da violência no Brasil. O Juventude Negra Viva é compromisso do Estado.', 'Cerimônia de lançamento do plano interministerial.', 'verified', false, '2023-11-20', 'https://www.gov.br/igualdaderacial/pt-br/noticias/juventude-negra-viva-2023', 'other', 1, 'Ministério da Igualdade Racial', 'Lançamento 20/11', 'anielle-juventude-negra-viva-b153-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marinho, 'Luiz Marinho anuncia Pronatec SIM com 800 mil vagas em 2024.', 'Retomamos o Pronatec com 800 mil vagas. Qualificação profissional é política social.', 'Lançamento do programa federal de qualificação.', 'verified', false, '2023-09-15', 'https://www.gov.br/trabalho-e-emprego/pt-br/noticias/marinho-pronatec-2023', 'other', 1, 'MTE', 'Lançamento Pronatec SIM', 'marinho-pronatec-sim-b153-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanh, 'Van Hattem vota contra Pé-de-Meia classificando como subsídio ineficiente.', 'Pé-de-Meia é subsídio ineficiente. Dinheiro público deveria ir para infraestrutura da educação, não bolsa.', 'Explicação de voto na votação da MP do programa.', 'verified', false, '2024-05-02', 'https://www.camara.leg.br/noticias/van-hattem-vota-contra-pe-de-meia-2024', 'news_article', 3, 'Câmara dos Deputados', 'Votação MP', 'vanhattem-vota-pe-de-meia-b153-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula inaugura Centro Dia do Idoso em São Paulo com expansão nacional.', 'Os idosos brasileiros foram esquecidos. Os Centros Dia vão cuidar deles onde eles estão.', 'Inauguração de unidade piloto em São Paulo.', 'verified', false, '2024-10-01', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-centro-dia-idoso', 'other', 1, 'São Paulo', 'Inauguração Centro Dia', 'lula-centro-dia-idoso-b153-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias comemora menor índice de pobreza da série histórica em 2025.', 'Pobreza no Brasil cai ao menor nível da série histórica. É resultado de política social consistente.', 'Declaração após divulgação de dados do IBGE.', 'verified', true, '2025-09-10', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/ibge-pobreza-menor-historica-2025', 'other', 1, 'MDS', 'Divulgação IBGE', 'wdias-pobreza-menor-historica-b153-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
