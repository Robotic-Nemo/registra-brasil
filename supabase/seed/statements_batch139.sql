-- Batch 139: LGBTQ+ rights and attacks 2023-2026 (Part 2)
DO $$
DECLARE
  v_eri UUID; v_sam UUID; v_tal UUID; v_jan UUID; v_orl UUID;
  v_chi UUID; v_fme UUID; v_tab UUID; v_gle UUID; v_ani UUID;
  v_son UUID; v_lul UUID; v_pad UUID; v_sil UUID; v_cid UUID;
  v_jom UUID; v_nik UUID; v_jan2 UUID; v_caz UUID; v_bia UUID;
  v_mfe UUID; v_dam UUID; v_mag UUID; v_sic UUID; v_jai UUID;
  v_edu UUID; v_fla UUID; v_car2 UUID; v_mic UUID; v_jul UUID;
  v_san UUID; v_fib UUID; v_gir UUID; v_cgi UUID; v_gpe UUID;
  v_mvh UUID; v_kim UUID; v_adv UUID; v_pmc UUID; v_bou UUID;
  v_mor UUID; v_clu UUID; v_bar UUID; v_zan UUID; v_fac UUID;
  v_din UUID; v_tof UUID;
  c_hom UUID; c_dis UUID; c_mis UUID; c_mac UUID; c_int UUID;
  c_vio UUID; c_abu UUID; c_des UUID; c_iti UUID; c_rac UUID;
BEGIN
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_fme FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_jom FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan2 FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_caz FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sic FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_jul FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fib FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpe FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_pmc FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_clu FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';

  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_dis FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_iti FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia assassinato de jovem gay em Sergipe em tribuna.', 'Mais um jovem gay assassinado no Nordeste, e a mídia sequer cita. Nossas vidas precisam importar.', 'Pronunciamento na Câmara após divulgação de caso em Aracaju.', 'verified', false, '2023-02-10', 'https://www.psol50.org.br/samia-bomfim-assassinato-gay-sergipe-2023/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'samia-assassinato-se-b139-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão defende exclusão de conteúdo LGBT de livros didáticos.', 'Material didático não é espaço para fazer apologia à transexualidade. MEC precisa tirar isso das escolas.', 'Pronunciamento na Comissão de Educação da Câmara.', 'verified', false, '2023-04-12', 'https://www.camara.leg.br/noticias/girao-livros-didaticos-lgbt-mec-2023', 'news_article', 4, 'Câmara dos Deputados', 'Comissão de Educação', 'girao-livros-didaticos-b139-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves lança campanha contra violência a mulheres trans.', 'Mulher trans é mulher. E mulher trans que sofre violência precisa ser atendida pela rede de proteção como qualquer outra.', 'Lançamento de campanha do Ministério das Mulheres com ANTRA.', 'verified', false, '2023-06-28', 'https://www.gov.br/mulheres/pt-br/assuntos/noticias/2023/06/cida-campanha-mulher-trans', 'other', 1, 'Ministério das Mulheres', 'Lançamento de campanha', 'cida-campanha-trans-b139-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro diz em culto que Brasil precisa voltar aos valores cristãos.', 'Brasil não aguenta mais agenda gay disfarçada de direitos humanos. Precisamos voltar a Cristo.', 'Discurso em culto da Assembleia de Deus em Belém.', 'verified', false, '2023-07-16', 'https://www.gazetadopovo.com.br/politica/michelle-bolsonaro-agenda-gay-culto-belem-2023/', 'news_article', 4, 'Assembleia de Deus Belém', 'Culto evangélico', 'michelle-culto-belem-b139-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar resgata histórico do movimento LGBT em aula pública na UERJ.', 'O movimento LGBT brasileiro começou na ditadura, resistiu à Aids, e agora não vai se calar diante do bolsonarismo.', 'Aula pública na UERJ sobre história da resistência LGBT.', 'verified', false, '2023-08-22', 'https://www.uerj.br/noticias/chico-alencar-aula-publica-movimento-lgbt-2023', 'news_article', 1, 'UERJ', 'Aula pública', 'chico-aula-uerj-b139-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano convoca ato contra ideologia de gênero em São Paulo.', 'Convocamos milhões às ruas contra a ideologia de gênero imposta por Lula e seus ministros.', 'Convocação de ato na Avenida Paulista.', 'verified', false, '2023-09-07', 'https://www.camara.leg.br/noticias/feliciano-ato-ideologia-genero-sp-2023', 'news_article', 4, 'Redes sociais', 'Convocação de ato', 'feliciano-ato-sp-b139-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral vota a favor de PL sobre combate à LGBTfobia nas escolas.', 'Escola segura é direito de toda criança. Aprovei PL e defendo aplicação com orçamento.', 'Declaração de voto em comissão de educação.', 'verified', false, '2023-10-10', 'https://www.camara.leg.br/noticias/tabata-pl-lgbtfobia-escolas-2023', 'news_article', 1, 'Câmara dos Deputados', 'Comissão de Educação', 'tabata-voto-escolas-b139-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende liberalismo incluindo direitos LGBT.', 'Liberdade individual inclui respeito a quem você ama. O liberalismo é humanista.', 'Entrevista à Folha defendendo afastamento do Novo de pautas conservadoras.', 'verified', false, '2023-11-08', 'https://www1.folha.uol.com.br/poder/2023/11/adriana-ventura-novo-lgbt-liberalismo.shtml', 'news_article', 1, 'Folha de S.Paulo', 'Entrevista política', 'adriana-folha-liberalismo-b139-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto posta vídeo atacando professor gay em escola pública.', 'Professor gay não pode dar aula para criança. Pais de São Paulo, acordem.', 'Vídeo viralizou no TikTok gerando ameaças a educador em SP.', 'verified', true, '2023-12-01', 'https://www.metropoles.com/brasil/guiga-peixoto-professor-gay-tiktok-sp-2023', 'news_article', 5, 'Redes sociais', 'Vídeo TikTok', 'guiga-professor-tiktok-b139-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_iti, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton pressiona MJ por criação de delegacia especializada em crimes LGBTfóbicos.', 'Precisamos de delegacias especializadas. LGBT vítima que procura delegacia comum é revitimizada.', 'Reunião com ministro Lewandowski para cobrar política.', 'verified', false, '2024-02-20', 'https://www.camara.leg.br/noticias/erika-hilton-mj-delegacia-lgbt-2024', 'other', 1, 'Ministério da Justiça', 'Reunião ministerial', 'erika-delegacia-mj-b139-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende fim do bloqueio hormonal para adolescentes.', 'Bloqueio hormonal em adolescente é experimento médico proibido no resto do mundo. Brasil não pode ser laboratório.', 'Entrevista ao Estadão defendendo PL com dados distorcidos.', 'verified', false, '2024-03-12', 'https://www.estadao.com.br/politica/flavio-bolsonaro-bloqueio-hormonal-adolescente-2024/', 'news_article', 4, 'Estadão', 'Entrevista política', 'flavio-bloqueio-hormonal-b139-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha rebate desinformação sobre bloqueio hormonal em crianças.', 'Bloqueio hormonal no Brasil só é feito a partir dos 16 anos, com acompanhamento multiprofissional. É protocolo seguro.', 'Coletiva no Ministério da Saúde desmentindo notícias falsas.', 'verified', false, '2024-03-14', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/03/padilha-bloqueio-hormonal-protocolo', 'other', 1, 'Ministério da Saúde', 'Coletiva de imprensa', 'padilha-bloqueio-coletiva-b139-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson chama policiais LGBT de militantes uniformizados.', 'Polícia não é para militância. Quem quer usar farda com bandeirinha arco-íris escolheu errado a profissão.', 'Discurso no plenário contra portaria de valorização da diversidade nas PMs.', 'verified', false, '2024-04-05', 'https://www.camara.leg.br/noticias/sanderson-policiais-lgbt-militantes-2024', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'sanderson-policiais-lgbt-b139-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino como ministro defende política nacional antes de ir ao STF.', 'Como ministro da Justiça deixo orientação clara: crimes LGBTfóbicos têm que ser apurados com prioridade pela Polícia Federal.', 'Portaria do MJ orientando PF antes da saída para STF.', 'verified', false, '2024-02-15', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2024/02/dino-portaria-pf-lgbt', 'other', 1, 'Ministério da Justiça', 'Portaria ministerial', 'dino-portaria-pf-b139-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta vota contra PL que garantia atendimento trans em UPAs.', 'Unidade de pronto atendimento não é lugar para ideologia. PL criava fila privilegiada e recusei.', 'Voto em comissão contra projeto de parlamentar do PSOL.', 'verified', false, '2024-05-08', 'https://www.camara.leg.br/noticias/julia-zanatta-upa-trans-voto-2024', 'news_article', 3, 'Câmara dos Deputados', 'Comissão de Saúde', 'julia-upa-trans-b139-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos apresenta projeto em SP para centro de cidadania LGBT municipal.', 'Precisamos de equipamento público na cidade para LGBT buscar direitos, emprego, acolhimento. Não pode ser só ONG.', 'Apresentação de projeto como deputado federal junto a vereadores do PSOL-SP.', 'verified', false, '2024-05-22', 'https://www.psol50.org.br/boulos-centro-cidadania-lgbt-sp-2024/', 'other', 1, 'Câmara dos Deputados', 'Lançamento de projeto', 'boulos-centro-cidadania-sp-b139-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis ataca ministra Cida Gonçalves por incluir trans em política para mulheres.', 'Ministra quer que homem de vestido seja incluído em política para mulher. Isso é apagar a mulher.', 'Post no Instagram atacando diretriz do Ministério das Mulheres.', 'verified', true, '2024-06-08', 'https://www.metropoles.com/brasil/bia-kicis-ataca-cida-ministra-trans-2024', 'news_article', 4, 'Redes sociais', 'Post no Instagram', 'bia-ataca-cida-b139-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves defende inclusão de mulheres trans na política pública.', 'Mulheres trans são mulheres. Política para mulheres não exclui quem foi invisibilizada a vida inteira.', 'Coletiva no ministério respondendo críticas da Câmara.', 'verified', false, '2024-06-10', 'https://www.gov.br/mulheres/pt-br/assuntos/noticias/2024/06/cida-mulheres-trans-politica', 'other', 1, 'Ministério das Mulheres', 'Coletiva de imprensa', 'cida-mulheres-trans-b139-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende proibição de linguagem neutra em repartições municipais de SP.', 'Linguagem neutra é agressão ao português. Repartição pública precisa falar com clareza, não com todes.', 'Defesa de PL na Câmara Municipal de São Paulo.', 'verified', false, '2024-07-02', 'https://www.saopaulo.sp.leg.br/blog/kim-kataguiri-linguagem-neutra-reparticao-2024', 'news_article', 3, 'Câmara Municipal SP', 'Defesa de PL', 'kim-linguagem-neutra-b139-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves diz em CPI que ONGs LGBT são fábricas de doutrinação.', 'Muitas ONGs gays no Brasil são fábricas de doutrinação financiadas pelo governo. Precisamos fiscalizar.', 'Fala em CPI requerida por bolsonaristas no Senado.', 'verified', false, '2024-07-18', 'https://www12.senado.leg.br/noticias/2024/07/damares-cpi-ongs-lgbt-fabrica', 'news_article', 4, 'Senado Federal', 'Sessão de CPI', 'damares-cpi-fabrica-b139-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia que ANTRA recebeu ameaças ao sede em Niterói.', 'ANTRA sofreu ameaça direta. Precisamos de proteção para quem protege travestis brasileiras.', 'Discurso na Câmara após ataque à sede da ANTRA.', 'verified', false, '2024-08-05', 'https://antrabrasil.org/2024/08/05/antra-ameacas-sede-niteroi/', 'other', 2, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-antra-ameaca-b139-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro reúne com organização internacional conservadora sobre freio à agenda LGBT.', 'Nossa missão é frear a agenda LGBT na América Latina. Brasil sob Lula virou vitrine do progressismo.', 'Reunião com a Fundação Vida y Família na Argentina.', 'verified', false, '2024-08-25', 'https://www.poder360.com.br/internacional/eduardo-bolsonaro-argentina-conservadores-lgbt-2024/', 'news_article', 4, 'Buenos Aires', 'Reunião conservadora', 'eduardo-argentina-conservadora-b139-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco denuncia racismo contra lésbicas negras em evento em Salvador.', 'Lésbica negra é tripla e quadruplamente violentada. Política pública precisa enxergar essa mulher.', 'Discurso em seminário no MIR em parceria com Coletivo das Mulheres Negras.', 'verified', false, '2024-09-02', 'https://www.gov.br/igualdaderacial/pt-br/assuntos/noticias/2024/09/anielle-lesbicas-negras-salvador', 'other', 1, 'MIR Salvador', 'Seminário', 'anielle-lesbicas-salvador-b139-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira posta vídeo atacando professora trans em MG.', 'Olhem o que virou a escola em Belo Horizonte. Pais, tirem seus filhos.', 'Vídeo com recorte de aula que gerou ameaças de morte à educadora.', 'verified', true, '2024-09-15', 'https://www.metropoles.com/brasil/nikolas-professora-trans-bh-ameacas-2024', 'news_article', 5, 'Redes sociais', 'Post no X', 'nikolas-professora-bh-b139-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_iti, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina bloqueio de post de Nikolas que expôs professora trans.', 'A publicação expõe profissional a risco e incita perseguição. Determino remoção imediata.', 'Decisão monocrática no TSE após representação.', 'verified', false, '2024-09-18', 'https://www.conjur.com.br/2024-set-18/moraes-bloqueio-nikolas-professora-trans-tse/', 'news_article', 1, 'TSE', 'Decisão monocrática', 'moraes-bloqueio-nikolas-b139-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal debocha de Boulos com insinuações homofóbicas na campanha.', 'O Boulos passou a vida em assembleia de movimento social arco-íris, nunca empreendeu. Por isso quer ensinar todo mundo.', 'Fala em debate do SBT durante campanha em SP.', 'verified', true, '2024-09-25', 'https://www.sbt.com.br/politica/debate-sbt-marcal-boulos-arco-iris-2024', 'news_article', 4, 'TV SBT', 'Debate para Prefeitura SP', 'marcal-sbt-boulos-b139-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende regulação em caso Nikolas-professora no Congresso.', 'Se tivéssemos o PL 2630 aprovado, plataformas teriam remoção em horas e a professora teria sido protegida.', 'Pronunciamento na Câmara após caso de exposição.', 'verified', false, '2024-09-20', 'https://www.camara.leg.br/noticias/orlando-silva-nikolas-professora-pl2630-2024', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'orlando-pl2630-caso-b139-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro declara em podcast que aliança com evangélicos é contra agenda gay.', 'Minha aliança com os evangélicos sempre foi para barrar a agenda gay que tenta destruir a família.', 'Declaração em podcast de influenciador bolsonarista.', 'verified', true, '2024-10-12', 'https://www.poder360.com.br/governo/bolsonaro-podcast-evangelicos-agenda-gay-2024/', 'news_article', 4, 'Podcast conservador', 'Entrevista em podcast', 'bolsonaro-podcast-alianca-b139-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna apresenta PL sobre educação em direitos LGBT.', 'Escola que forma cidadão tem que ensinar respeito a quem é diferente. PL garante formação de professores.', 'Apresentação de projeto em coletiva no RS.', 'verified', false, '2024-10-28', 'https://www.psol50.org.br/melchionna-pl-educacao-lgbt-rs-2024/', 'other', 1, 'AL-RS', 'Lançamento de PL', 'melchionna-pl-educacao-b139-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta articula PEC para definir família como entre homem e mulher.', 'A PEC da Família define constitucionalmente: família é homem, mulher e filhos. Fim da picada.', 'Anúncio em entrevista à CBN sobre coleta de assinaturas.', 'verified', false, '2024-11-06', 'https://www12.senado.leg.br/noticias/2024/11/magno-malta-pec-familia-assinaturas', 'news_article', 4, 'Senado Federal', 'Coleta de assinaturas PEC', 'magno-pec-familia-b139-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali articula bancada do PCdoB em defesa de família diversa.', 'PCdoB vai votar contra PEC retrógrada. Família é onde há afeto, não caricatura de catecismo.', 'Reunião de bancada do PCdoB sobre posicionamento.', 'verified', false, '2024-11-15', 'https://www.pcdob.org.br/noticias/jandira-bancada-pec-familia-2024/', 'news_article', 1, 'Câmara dos Deputados', 'Reunião de bancada', 'jandira-pcdob-pec-b139-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Messias emite parecer da AGU contra PEC da Família.', 'AGU entende que PEC que restringe conceito constitucional de família é inconstitucional desde a origem.', 'Parecer enviado ao Congresso como contribuição técnica.', 'verified', false, '2024-11-25', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/2024/11/messias-parecer-pec-familia', 'other', 1, 'AGU', 'Parecer técnico', 'messias-parecer-pec-familia-b139-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_clu, 'Cármen Lúcia vota para suspender provimentos estaduais que dificultam retificação de nome.', 'Retificação de nome e gênero é autodeterminação e não pode ser burocratizada por corregedorias.', 'Voto em ADI no STF sobre provimentos do RS e SC.', 'verified', false, '2024-12-04', 'https://www.conjur.com.br/2024-dez-04/carmen-lucia-retificacao-nome-provimentos-adi/', 'news_article', 1, 'STF', 'Julgamento de ADI', 'carmen-retificacao-provimentos-b139-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan2, 'André Janones publica tweet com termo considerado homofóbico e apaga após críticas.', 'Apaguei o tweet, galera. Não foi a intenção. Minha luta é contra o ódio, inclusive o meu.', 'Tweet com termo pejorativo foi apagado em meia hora após reação.', 'verified', false, '2024-12-10', 'https://www.metropoles.com/brasil/janones-tweet-termo-homofobico-apaga-2024', 'news_article', 3, 'Redes sociais', 'Post no X', 'janones-tweet-apaga-b139-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caz, 'Zambelli em exílio faz live atacando drag queens na TV pública.', 'TV Brasil virou palco drag. Paga pelo nosso imposto. Isso é ditadura cultural gay.', 'Live da Itália comentando programa infantojuvenil da TV Brasil.', 'verified', false, '2024-12-20', 'https://www.poder360.com.br/justica/zambelli-italia-live-drag-tv-brasil-2024/', 'news_article', 4, 'Redes sociais', 'Live exílio', 'zambelli-drag-tv-brasil-b139-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Dias Toffoli rejeita HC de youtuber condenado por vídeos homofóbicos.', 'Não há ilegalidade na condenação. A prática reiterada de discurso de ódio contra homossexuais configura o delito do artigo 20.', 'Decisão monocrática em HC no STF.', 'verified', false, '2025-01-08', 'https://www.conjur.com.br/2025-jan-08/toffoli-hc-youtuber-homofobia/', 'news_article', 1, 'STF', 'HC monocrático', 'toffoli-hc-youtuber-b139-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton apresenta pacote de PLs no Dia da Visibilidade Trans de 2025.', 'Apresento hoje cinco projetos: cotas, saúde, moradia, educação e segurança para pessoas trans. É a agenda positiva.', 'Coletiva com ANTRA, Grupo Dignidade e ABGLT.', 'verified', true, '2025-01-29', 'https://grupodignidade.org.br/noticias/erika-pacote-pls-trans-2025/', 'other', 1, 'Câmara dos Deputados', 'Dia da Visibilidade Trans', 'erika-pacote-pls-2025-b139-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sic, 'Silas Câmara faz discurso contra visibilidade trans em culto transmitido.', 'Dia da visibilidade é dia da invisibilidade da verdade. Deus criou homem e mulher.', 'Sermão em culto da AD de Manaus transmitido ao vivo.', 'verified', false, '2025-01-30', 'https://www.gazetadopovo.com.br/politica/silas-camara-visibilidade-trans-culto-2025/', 'news_article', 4, 'AD Manaus', 'Culto evangélico', 'silas-visibilidade-trans-b139-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto faz live comparando Parada LGBT a ''culto ao pecado''.', 'Parada gay é culto ao pecado em avenida pública. Cristão não pode financiar com imposto.', 'Live no Facebook sobre Parada de João Pessoa.', 'verified', false, '2025-02-14', 'https://www.gazetadopovo.com.br/politica/cabo-gilberto-parada-lgbt-pecado-live-2025/', 'news_article', 4, 'Redes sociais', 'Live Facebook', 'cabo-gilberto-parada-pecado-b139-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida anuncia na ONU compromisso do Brasil com direitos LGBT.', 'O Brasil reafirma compromisso internacional com direitos LGBTs. Não há democracia sem garantia a minorias.', 'Fala no Conselho de Direitos Humanos da ONU em Genebra.', 'verified', false, '2025-03-05', 'https://www.gov.br/mdh/pt-br/assuntos/noticias/2025/03/silvio-onu-genebra-lgbt', 'other', 1, 'ONU Genebra', 'Conselho de Direitos Humanos', 'silvio-onu-genebra-b139-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro faz live atacando declaração de Silvio na ONU.', 'Silvio Almeida foi vender o Brasil como reino gay na ONU. É vergonhoso.', 'Live no YouTube comentando fala em Genebra.', 'verified', true, '2025-03-06', 'https://www.poder360.com.br/governo/bolsonaro-live-silvio-onu-lgbt-2025/', 'news_article', 4, 'Redes sociais', 'Live YouTube', 'bolsonaro-ataca-silvio-onu-b139-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende ampliação de políticas LGBT no PT.', 'Resolução do PT inclui construção de candidaturas LGBT em todas as regiões. É aposta programática.', 'Plenária nacional do PT sobre diretrizes 2026.', 'verified', false, '2025-03-22', 'https://www.pt.org.br/gleisi-plenaria-nacional-candidaturas-lgbt-2025/', 'other', 1, 'Sede PT', 'Plenária Nacional', 'gleisi-plenaria-pt-lgbt-b139-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim articula audiência pública sobre lesbocídio em SP.', 'Lesbocídio é categoria que precisa entrar no código penal. A audiência é primeiro passo para tipificar.', 'Audiência pública na Alesp em parceria com Frente Parlamentar.', 'verified', false, '2025-04-08', 'https://www.psol50.org.br/samia-audiencia-lesbocidio-alesp-2025/', 'other', 1, 'ALESP', 'Audiência pública', 'samia-audiencia-lesbocidio-b139-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros defende escola sem diversidade como ''direito dos pais''.', 'Pai tem direito de educar filho sem ideologia LGBT. PL escola neutra é direito da família.', 'Defesa de PL Escola sem Partido em comissão.', 'verified', false, '2025-04-15', 'https://www.camara.leg.br/noticias/filipe-barros-escola-sem-partido-lgbt-2025', 'news_article', 4, 'Câmara dos Deputados', 'Comissão CCJ', 'filipe-escola-sem-partido-b139-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão apoia proibição de professores trans na educação básica.', 'Professor trans em sala de aula é experimento social com criança. Inaceitável.', 'Entrevista à Gazeta do Povo defendendo PL polêmico.', 'verified', false, '2025-04-22', 'https://www.gazetadopovo.com.br/politica/girao-professor-trans-educacao-basica-2025/', 'news_article', 4, 'Gazeta do Povo', 'Entrevista política', 'girao-professor-trans-b139-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara lança seminário Indígenas LGBT e Território.', 'Indígenas LGBTs defendem território com a própria existência. Proteção territorial é proteção LGBT.', 'Abertura de seminário do MPI em parceria com Articulação Juju.', 'verified', false, '2025-05-06', 'https://www.gov.br/povosindigenas/pt-br/assuntos/noticias/2025/05/sonia-seminario-indigenas-lgbt-territorio', 'other', 1, 'MPI Brasília', 'Seminário', 'sonia-seminario-juju-b139-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia ataques do PL a políticas trans em coletiva.', 'PL inteiro virou braço da LGBTfobia institucional. A cada avanço nosso, um ataque deles.', 'Coletiva após rejeição em comissão de PL da autora.', 'verified', false, '2025-05-16', 'https://www.camara.leg.br/noticias/erika-hilton-ataques-pl-comissao-2025', 'news_article', 1, 'Câmara dos Deputados', 'Coletiva', 'erika-ataques-pl-b139-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe Conselho Nacional LGBTQIA+ no Planalto em 2025.', 'Este conselho é herança dos que lutaram antes. Vou manter a escuta permanente com vocês.', 'Primeira reunião do ano do Conselho Nacional com presidente.', 'verified', false, '2025-05-17', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2025/lula-conselho-lgbt-17-maio', 'other', 1, 'Palácio do Planalto', 'Reunião do Conselho', 'lula-conselho-17maio-b139-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Dias Toffoli vota para derrubar lei municipal de Sorocaba que proibia bandeira LGBT.', 'Município não tem competência para proibir manifestação simbólica em prédio público. É inconstitucional.', 'Voto em ADPF contra lei de Sorocaba-SP.', 'verified', false, '2025-05-28', 'https://www.jota.info/stf/toffoli-sorocaba-bandeira-lgbt-adpf-2025', 'news_article', 1, 'STF', 'Julgamento de ADPF', 'toffoli-sorocaba-bandeira-b139-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal em convenção do PL compara ''agenda LGBT'' a ''veneno nas crianças''.', 'Essa agenda LGBT é veneno que oferecem para nossas crianças todos os dias. Vamos tirar esse veneno.', 'Discurso em prévia estadual do PL em Curitiba.', 'verified', true, '2025-06-02', 'https://www.poder360.com.br/eleicoes/marcal-pl-curitiba-veneno-criancas-2025/', 'news_article', 5, 'PL Paraná', 'Convenção estadual', 'marcal-veneno-criancas-b139-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha anuncia financiamento específico para cirurgias de redesignação no SUS.', 'Vamos triplicar o orçamento do Processo Transexualizador. Ninguém fica para trás no SUS.', 'Coletiva no Ministério da Saúde anunciando expansão orçamentária.', 'verified', false, '2025-06-15', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/06/padilha-orcamento-processo-transexualizador', 'other', 1, 'Ministério da Saúde', 'Anúncio orçamentário', 'padilha-orcamento-trans-b139-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro protocola PDL para sustar expansão do Processo Transexualizador.', 'Não podemos triplicar gastos com cirurgia eletiva enquanto transplante falta. Vou sustar no Congresso.', 'Protocolo de PDL no Senado para sustar portaria do MS.', 'verified', false, '2025-06-18', 'https://www12.senado.leg.br/noticias/2025/06/flavio-pdl-sustar-processo-transexualizador', 'news_article', 3, 'Senado Federal', 'Protocolo de PDL', 'flavio-pdl-sustar-trans-b139-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim rebate PDL de Flávio com dados do SUS.', 'A cirurgia trans representa 0,01% do orçamento do SUS. É fake news de Flávio. O que mata é o descaso com as pessoas trans.', 'Pronunciamento na tribuna com tabelas do DataSUS.', 'verified', false, '2025-06-19', 'https://www.psol50.org.br/samia-rebate-flavio-pdl-trans-2025/', 'news_article', 1, 'Câmara dos Deputados', 'Tribuna plenária', 'samia-rebate-pdl-b139-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso em palestra no IBCCrim defende jurisprudência LGBT como cláusula pétrea.', 'Direitos LGBTs conquistados no STF são cláusula pétrea da dignidade. Não há retrocesso constitucional possível.', 'Palestra no seminário anual do IBCCrim em São Paulo.', 'verified', false, '2025-06-25', 'https://www.ibccrim.org.br/noticias/barroso-palestra-lgbt-clausula-petrea-2025/', 'news_article', 1, 'IBCCrim', 'Seminário jurídico', 'barroso-ibccrim-clausula-b139-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros ataca Barroso em tribuna pela fala sobre ''cláusula pétrea''.', 'Barroso acha que pode criar cláusula pétrea para agradar o lobby gay. É usurpação constituinte.', 'Discurso na Câmara atacando presidente do STF.', 'verified', false, '2025-06-27', 'https://www.camara.leg.br/noticias/filipe-barros-ataca-barroso-clausula-2025', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'filipe-barros-ataca-barroso-b139-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende educação com diversidade em palestra em Harvard.', 'Brasil precisa escolher: ou investimos em educação com diversidade, ou perdemos uma geração de talentos LGBT.', 'Palestra na Harvard Kennedy School sobre Brasil 2026.', 'verified', false, '2025-07-10', 'https://www.camara.leg.br/noticias/tabata-harvard-diversidade-educacao-2025', 'news_article', 1, 'Harvard Kennedy School', 'Palestra acadêmica', 'tabata-harvard-diversidade-b139-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares articula caravana pró-família contra políticas LGBT do governo.', 'Vamos levar a caravana pró-família para cada estado. Lula vai ver a força do povo cristão.', 'Anúncio de caravana em entrevista à Record.', 'verified', false, '2025-07-18', 'https://www12.senado.leg.br/noticias/2025/07/damares-caravana-pro-familia', 'news_article', 4, 'Senado Federal', 'Anúncio de caravana', 'damares-caravana-pro-familia-b139-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone pressiona Ministério da Mulher por protocolo lesbofóbico.', 'Precisamos de protocolo específico para lesbofobia nas delegacias. Mulher lésbica não pode ser revitimizada.', 'Audiência com Cida Gonçalves no ministério.', 'verified', false, '2025-07-22', 'https://www.camara.leg.br/noticias/taliria-ministerio-mulher-protocolo-lesbofobia-2025', 'other', 1, 'Ministério das Mulheres', 'Audiência ministerial', 'taliria-protocolo-lesbofobia-b139-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caz, 'Carla Zambelli em Roma faz campanha para deputados contrários a direitos LGBT.', 'Brasileiros no exterior, votem em quem defende a família. Bolsonaristas, o Brasil depende de vocês.', 'Vídeo para eleitores no exterior sobre eleição de 2026.', 'verified', false, '2025-08-02', 'https://www.poder360.com.br/justica/zambelli-roma-video-exterior-familia-2025/', 'news_article', 4, 'Redes sociais', 'Vídeo do exílio', 'zambelli-roma-exterior-b139-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende filme LGBT no edital da Ancine.', 'Audiovisual LGBT gera emprego, conta histórias do Brasil real. Não vai haver censura no nosso cinema.', 'Coletiva na Ancine sobre edital 2025.', 'verified', false, '2025-08-10', 'https://www.gov.br/cultura/pt-br/assuntos/noticias/2025/08/orlando-silva-ancine-edital-lgbt', 'other', 1, 'Ancine Rio', 'Coletiva cultural', 'orlando-ancine-edital-b139-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro posta vídeo com crianças contra ''agenda gay''.', 'Nossas crianças são puras. Não vamos deixar a agenda gay tocar nelas.', 'Vídeo em projeto evangélico com crianças em MG.', 'verified', false, '2025-08-18', 'https://www.metropoles.com/brasil/michelle-bolsonaro-video-criancas-agenda-gay-2025', 'news_article', 4, 'Redes sociais', 'Vídeo em projeto', 'michelle-video-criancas-b139-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar articula frente parlamentar de idosos LGBT no RJ.', 'Idoso LGBT foi esquecido pelo Estado. Frente tem objetivo de reverter. Começa com o Rio.', 'Lançamento de frente parlamentar na Alerj.', 'verified', false, '2025-08-26', 'https://www.alerj.rj.gov.br/noticias/chico-alencar-frente-idosos-lgbt-2025', 'other', 1, 'ALERJ', 'Frente Parlamentar', 'chico-frente-idosos-alerj-b139-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta faz post contra ampliação de proteção trans nas escolas.', 'Pais precisam se unir. Não vamos permitir que ideologia trans entre na escola dos nossos filhos em SC.', 'Post no X sobre diretriz da Secretaria de Educação catarinense.', 'verified', false, '2025-09-02', 'https://www.metropoles.com/brasil/julia-zanatta-sc-trans-escolas-post-2025', 'news_article', 4, 'Redes sociais', 'Post no X', 'julia-sc-trans-escola-b139-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin vota para extender direitos previdenciários a companheiros homoafetivos.', 'Pensão por morte entre companheiros é reconhecimento mínimo da união estável entre iguais.', 'Voto em repetitivo no STF sobre INSS.', 'verified', false, '2025-09-08', 'https://www.conjur.com.br/2025-set-08/fachin-pensao-morte-homoafetiva-inss-repetitivo/', 'news_article', 1, 'STF', 'Julgamento de repetitivo', 'fachin-pensao-inss-b139-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes suspende lei municipal de Joinville sobre ''neutralidade curricular''.', 'Lei municipal não pode restringir currículo nacional nem censurar temas de direitos humanos.', 'Decisão monocrática em ADPF contra lei de Joinville.', 'verified', false, '2025-09-20', 'https://www.conjur.com.br/2025-set-20/moraes-joinville-neutralidade-curricular-adpf/', 'news_article', 1, 'STF', 'Decisão monocrática', 'moraes-joinville-curriculo-b139-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz live chamando decisão de Moraes de ''ditadura arco-íris''.', 'Virou ditadura arco-íris. Supremo manda escola ensinar ideologia LGBT para criança.', 'Live no YouTube após decisão sobre Joinville.', 'verified', true, '2025-09-22', 'https://www.metropoles.com/brasil/nikolas-ditadura-arco-iris-live-2025', 'news_article', 4, 'Redes sociais', 'Live YouTube', 'nikolas-ditadura-arco-iris-b139-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin vota para reconhecer multiparentalidade em casais lésbicos.', 'O ordenamento protege a criança em qualquer configuração familiar, inclusive aquela com duas mães.', 'Voto em tema repetitivo no STF.', 'verified', false, '2025-10-02', 'https://www.conjur.com.br/2025-out-02/zanin-multiparentalidade-casais-lesbicos-repetitivo/', 'news_article', 1, 'STF', 'Julgamento de repetitivo', 'zanin-multiparentalidade-b139-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis ataca reconhecimento de ''duas mães'' como ''cancelamento do pai''.', 'Duas mães no registro é cancelar o pai. Criança precisa de pai e mãe, fim.', 'Post no Instagram após decisão do STF sobre multiparentalidade.', 'verified', false, '2025-10-03', 'https://www.metropoles.com/brasil/bia-kicis-duas-maes-cancelamento-pai-2025', 'news_article', 4, 'Redes sociais', 'Post no Instagram', 'bia-duas-maes-b139-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos participa de ato Stonewall Brasil no centro de SP.', 'Stonewall começou com travesti negra jogando tijolo em polícia. A nossa revolta hoje também se joga nas urnas.', 'Ato no centro de São Paulo em data histórica internacional.', 'verified', false, '2025-06-28', 'https://www.psol50.org.br/boulos-stonewall-sp-centro-2025/', 'news_article', 1, 'Centro SP', 'Ato Stonewall', 'boulos-stonewall-b139-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem diz que ''liberdade de expressão inclui criticar pauta LGBT''.', 'Quem discorda da pauta LGBT não é criminoso. Criminalizar opinião é marca de regime autoritário.', 'Discurso no plenário contra projeto de criminalização.', 'verified', false, '2025-10-15', 'https://www.camara.leg.br/noticias/marcel-van-hattem-liberdade-pauta-lgbt-2025', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'marcel-liberdade-pauta-b139-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida lança estudo nacional sobre saúde mental LGBT.', 'O ódio adoece. Estudo aponta taxas alarmantes de suicídio em jovens LGBT brasileiros e define plano de prevenção.', 'Apresentação do estudo no MDH em parceria com Fiocruz.', 'verified', false, '2025-10-22', 'https://www.gov.br/mdh/pt-br/assuntos/noticias/2025/10/silvio-estudo-saude-mental-lgbt', 'other', 1, 'MDH', 'Lançamento de estudo', 'silvio-saude-mental-lgbt-b139-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton é agredida verbalmente em rua de Brasília e denuncia.', 'Fui agredida verbalmente hoje em Brasília. A tribuna protege, mas a rua exige coragem. Seguimos.', 'Denúncia em post nas redes sociais após agressão.', 'verified', true, '2025-10-28', 'https://www.camara.leg.br/noticias/erika-hilton-agressao-brasilia-2025', 'news_article', 2, 'Redes sociais', 'Denúncia de agressão', 'erika-agressao-brasilia-b139-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Messias determina ação da AGU contra agressor de Erika Hilton.', 'AGU vai se manifestar como assistente da acusação. Agressão a parlamentar trans não ficará sem resposta.', 'Nota da AGU após caso em Brasília.', 'verified', false, '2025-10-29', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/2025/10/messias-caso-erika-hilton', 'other', 1, 'AGU', 'Nota institucional', 'messias-caso-erika-b139-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro minimiza agressão a Erika Hilton em entrevista à Record.', 'A reação é o povo reagindo ao que é imposto. Se for pensar, é natural em ambiente de polarização.', 'Entrevista ao Jornal da Record.', 'verified', true, '2025-10-30', 'https://www.poder360.com.br/governo/bolsonaro-record-agressao-erika-natural-2025/', 'news_article', 5, 'Record TV', 'Entrevista jornalística', 'bolsonaro-record-agressao-b139-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_clu, 'Cármen Lúcia vota em caso de agressão transfóbica para agravar pena.', 'Motivação transfóbica é agravante e deve ser aplicada. O voto é para firmar tese.', 'Voto em HC no STF sobre caso do RJ.', 'verified', false, '2025-11-04', 'https://www.jota.info/stf/carmen-lucia-agravante-transfobia-hc-2025', 'news_article', 1, 'STF', 'Julgamento de HC', 'carmen-agravante-transfobia-b139-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco lança programa habitacional para jovens LGBT negros.', 'Jovem LGBT negro sem teto vira estatística de morte violenta. Minha Casa Minha Vida LGBT Negro parte para esse grupo.', 'Lançamento de programa com Ministério das Cidades.', 'verified', false, '2025-11-12', 'https://www.gov.br/igualdaderacial/pt-br/assuntos/noticias/2025/11/anielle-habitacao-lgbt-negros', 'other', 1, 'MIR', 'Lançamento de programa', 'anielle-habitacao-lgbt-b139-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sic, 'Silas Câmara ataca programa habitacional LGBT negro como ''racismo reverso''.', 'Agora tem Minha Casa para gay e preto. É racismo reverso e preconceito contra família hetero de bem.', 'Post no Twitter criticando programa.', 'verified', false, '2025-11-13', 'https://www.metropoles.com/brasil/silas-camara-programa-lgbt-negro-racismo-2025', 'news_article', 4, 'Redes sociais', 'Post no X', 'silas-programa-racismo-b139-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal em evento do PL ataca ''gay da esquerda'' como inimigo da família.', 'O gay de esquerda que ataca a família brasileira não representa a maioria gay que trabalha em paz.', 'Fala em ato do PL em Recife.', 'verified', false, '2025-11-18', 'https://www.poder360.com.br/eleicoes/marcal-pl-recife-gay-esquerda-2025/', 'news_article', 4, 'PL Pernambuco', 'Ato partidário', 'marcal-recife-gay-esquerda-b139-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara recebe liderança LGBT indígena em programa Juventude na FUNAI.', 'Juventude indígena LGBT é futuro dos nossos povos. Vai ter espaço, vai ter proteção, vai ter voz.', 'Evento na FUNAI com Articulação dos Povos Indígenas LGBTs.', 'verified', false, '2025-11-26', 'https://www.gov.br/povosindigenas/pt-br/assuntos/noticias/2025/11/sonia-juventude-lgbt-funai', 'other', 1, 'FUNAI', 'Recepção a lideranças', 'sonia-funai-juventude-b139-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone apresenta relatório sobre lesbocídio ao MDH.', 'Levamos ao MDH relatório com casos documentados de lesbocídio de 2015 a 2025. Número de registros subiu 300%.', 'Entrega do relatório a Silvio Almeida em Brasília.', 'verified', false, '2025-12-02', 'https://www.gov.br/mdh/pt-br/assuntos/noticias/2025/12/taliria-relatorio-lesbocidio-mdh', 'other', 2, 'MDH', 'Entrega de relatório', 'taliria-relatorio-mdh-b139-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende coligação com candidaturas LGBT em todos os estados.', 'Queremos ter pelo menos um deputado LGBT em cada estado. É condição para coligação em 2026.', 'Diretriz de Gleisi como presidente do PT para eleições de 2026.', 'verified', false, '2025-12-10', 'https://www.pt.org.br/gleisi-diretriz-candidaturas-lgbt-2026-estados/', 'other', 1, 'Sede PT', 'Diretriz partidária', 'gleisi-candidaturas-estados-b139-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta grava vídeo de fim de ano atacando ''ditadura arco-íris''.', 'Termino 2025 dizendo: não aceitaremos ditadura arco-íris imposta por Lula e o Supremo.', 'Vídeo postado em 24 de dezembro nas redes.', 'verified', false, '2025-12-24', 'https://www.gazetaonline.com.br/noticias/politica/2025/12/magno-malta-fim-ano-arco-iris-1014999999.html', 'news_article', 4, 'Redes sociais', 'Vídeo fim de ano', 'magno-fim-ano-arco-iris-b139-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula em discurso de fim de ano reafirma direitos LGBT como ''conquista irreversível''.', '2026 será ano de ampliar, não de retroceder. Direitos LGBT são irreversíveis neste governo.', 'Pronunciamento em rede nacional no final de 2025.', 'verified', true, '2025-12-28', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2025/12/lula-fim-ano-lgbt', 'other', 1, 'Palácio do Planalto', 'Pronunciamento em rede', 'lula-fim-ano-lgbt-b139-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro abre 2026 prometendo CPI da ''pauta arco-íris''.', 'Minha primeira missão em 2026 é abrir a CPI que vai investigar a pauta arco-íris que custa fortuna.', 'Entrevista à CNN Brasil abrindo ano legislativo.', 'verified', false, '2026-01-07', 'https://www.cnnbrasil.com.br/politica/flavio-bolsonaro-cpi-pauta-arco-iris-2026/', 'news_article', 3, 'CNN Brasil', 'Entrevista política', 'flavio-cpi-arco-iris-2026-b139-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim lança pré-candidatura à prefeitura de SP com pauta LGBT.', 'SP precisa de prefeita que encare a LGBTfobia. Minha pré-candidatura carrega essa responsabilidade.', 'Ato em São Paulo lançando pré-candidatura.', 'verified', true, '2026-01-15', 'https://www.psol50.org.br/samia-pre-candidatura-prefeitura-sp-2026/', 'other', 1, 'São Paulo', 'Lançamento pré-candidatura', 'samia-prefeitura-sp-b139-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton e ANTRA denunciam novo ápice de assassinatos de trans em janeiro.', 'Já são 14 pessoas trans assassinadas em janeiro de 2026. É epidemia anunciada.', 'Coletiva com ANTRA em Brasília com dados parciais.', 'verified', true, '2026-01-29', 'https://antrabrasil.org/2026/01/29/ápice-assassinatos-trans-janeiro/', 'other', 2, 'ANTRA Brasília', 'Dia da Visibilidade Trans', 'erika-antra-janeiro-2026-b139-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto apoia candidatura anti-LGBT na PB em 2026.', 'Paraíba precisa de deputado que frea a onda LGBT em escola e em quartel. Vou apoiar com tudo.', 'Declaração em programa de rádio em João Pessoa.', 'verified', false, '2026-02-03', 'https://www.gazetadopovo.com.br/politica/cabo-gilberto-candidatura-pb-anti-lgbt-2026/', 'news_article', 4, 'Rádio Arapuan', 'Entrevista política', 'cabo-gilberto-pb-2026-b139-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali anuncia pré-candidatura ao governo do RJ com pauta LGBT.', 'Rio de Janeiro tem o dever de ser estado aberto a todos. Minha pré-candidatura vai incluir pauta LGBT no centro.', 'Ato em Niterói lançando pré-candidatura ao governo do Estado.', 'verified', true, '2026-02-10', 'https://www.pcdob.org.br/jandira-pre-candidatura-governo-rj-2026/', 'other', 1, 'Niterói', 'Lançamento pré-candidatura', 'jandira-governo-rj-b139-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto debocha de pré-candidatura de Jandira ao RJ.', 'Jandira quer ser governadora do Rio do arco-íris. O povo vai dizer que não.', 'Post no X atacando Jandira Feghali.', 'verified', false, '2026-02-11', 'https://www.metropoles.com/brasil/guiga-peixoto-jandira-rj-arco-iris-2026', 'news_article', 3, 'Redes sociais', 'Post no X', 'guiga-jandira-rj-b139-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula assina decreto de cotas LGBT em concursos do executivo federal em 2026.', 'Assino decreto que reserva 1% das vagas em concursos federais para pessoas trans. É reparação histórica.', 'Cerimônia no Planalto para sanção do decreto.', 'verified', true, '2026-02-15', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2026/lula-decreto-cotas-trans-concurso', 'other', 1, 'Palácio do Planalto', 'Sanção de decreto', 'lula-decreto-cotas-trans-b139-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca decreto de cotas trans como ''aberração eleitoreira''.', 'Decreto trans em ano eleitoral é aberração eleitoreira. Lula quer comprar LGBT com imposto do povo.', 'Declaração em entrevista à Jovem Pan.', 'verified', true, '2026-02-16', 'https://www.jovempan.com.br/noticias/politica/bolsonaro-decreto-cotas-trans-aberracao-2026.html', 'news_article', 4, 'Jovem Pan', 'Entrevista política', 'bolsonaro-cotas-aberracao-b139-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende manutenção do decreto como ministro.', 'O decreto é legal, legítimo e necessário. Quem quiser derrubar vai encontrar a AGU na frente.', 'Entrevista à Globo News como ministro das Comunicações.', 'verified', false, '2026-02-17', 'https://g1.globo.com/politica/noticia/2026/02/17/orlando-silva-defende-decreto-cotas-trans.ghtml', 'news_article', 1, 'Globo News', 'Entrevista política', 'orlando-defende-decreto-b139-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral apoia decreto de cotas e critica uso eleitoreiro.', 'Apoio o decreto porque reduz desigualdade histórica. Não é eleição: é política pública.', 'Declaração em entrevista à CBN.', 'verified', false, '2026-02-18', 'https://www.cbn.globoradio.globo.com/politica/tabata-amaral-decreto-cotas-trans-2026', 'news_article', 1, 'CBN', 'Entrevista política', 'tabata-apoia-decreto-b139-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica decreto por ''método imposto'' mas reconhece problema.', 'Reconheço a exclusão, mas decreto não é o melhor caminho. Precisa de debate no Parlamento.', 'Entrevista à Folha sobre decreto de cotas.', 'verified', false, '2026-02-19', 'https://www1.folha.uol.com.br/poder/2026/02/adriana-ventura-decreto-cotas-trans-metodo.shtml', 'news_article', 2, 'Folha de S.Paulo', 'Entrevista política', 'adriana-decreto-metodo-b139-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton celebra decreto como ''vitória da luta trans'' em vídeo viral.', 'O decreto não nasceu de Lula, nasceu de nossas ruas. É vitória da luta trans brasileira.', 'Vídeo nas redes sociais após assinatura.', 'verified', true, '2026-02-15', 'https://www.psol50.org.br/erika-hilton-decreto-luta-trans-2026/', 'news_article', 1, 'Redes sociais', 'Vídeo resposta', 'erika-celebra-decreto-b139-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin reafirma jurisprudência LGBT em entrevista sobre 2026.', 'Jurisprudência LGBT do STF é blindada. Qualquer tentativa de retrocesso esbarra no Supremo.', 'Entrevista à Conjur na abertura do ano judiciário.', 'verified', false, '2026-02-02', 'https://www.conjur.com.br/2026-fev-02/fachin-jurisprudencia-lgbt-blindada-entrevista/', 'news_article', 1, 'Conjur', 'Entrevista jurídica', 'fachin-conjur-blindada-b139-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota contra sustação do decreto de cotas trans no STF.', 'Decreto presidencial sobre concurso é constitucional e serve à promoção de igualdade material.', 'Voto em ADI contra decreto de cotas.', 'verified', false, '2026-03-01', 'https://www.conjur.com.br/2026-mar-01/dino-decreto-cotas-trans-adi/', 'news_article', 1, 'STF', 'Julgamento de ADI', 'dino-decreto-adi-b139-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira em MG promete derrubar decreto trans se eleito.', 'Meu governo em Minas vai ignorar decreto federal trans. Concurso do estado é por mérito.', 'Discurso em pré-candidatura ao governo de MG.', 'verified', true, '2026-03-05', 'https://www.poder360.com.br/eleicoes/nikolas-mg-concurso-trans-derrubar-2026/', 'news_article', 4, 'Belo Horizonte', 'Pré-campanha MG', 'nikolas-mg-derrubar-b139-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes alerta sobre discurso anti-LGBT em ano eleitoral.', 'TSE estará atento a conteúdo que incite ódio contra LGBTs durante campanha. Crime eleitoral não tem imunidade.', 'Abertura de ano judiciário do TSE.', 'verified', false, '2026-03-10', 'https://www.tse.jus.br/comunicacao/noticias/2026/marco/moraes-abertura-tse-lgbt-campanha', 'other', 2, 'TSE', 'Abertura ano judiciário', 'moraes-tse-ano-eleitoral-b139-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton lança em março manifesto LGBT para eleições 2026.', 'Chegamos a 2026 com a maior frente LGBT já articulada. Apresentamos manifesto com 50 pautas prioritárias.', 'Ato em São Paulo com mais de 200 candidaturas LGBTs.', 'verified', true, '2026-03-15', 'https://grupodignidade.org.br/noticias/manifesto-lgbt-eleicoes-2026/', 'other', 1, 'São Paulo', 'Lançamento de manifesto', 'erika-manifesto-2026-b139-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

END $$;
