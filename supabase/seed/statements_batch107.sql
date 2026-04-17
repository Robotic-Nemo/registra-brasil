-- Batch 107: Política estadual e municipal 2024-2026 (governadores, prefeitos de capitais, pós-eleições)
DO $$
DECLARE
  v_cas UUID; v_tar UUID; v_cai UUID; v_wil UUID; v_iba UUID;
  v_elm UUID; v_jer UUID; v_hel UUID; v_ray UUID; v_zem UUID;
  v_rat UUID; v_joa UUID; v_edu UUID; v_ren UUID; v_pad UUID;
  v_fab UUID; v_mau UUID; v_eri UUID; v_fat UUID; v_car UUID;
  v_gla UUID; v_den UUID; v_cle UUID; v_wan UUID; v_jor UUID;
  v_raf UUID; v_nun UUID; v_pae UUID; v_fuad UUID; v_jca UUID;
  v_top UUID; v_sar UUID; v_seb UUID; v_gre UUID; v_bru UUID;
  v_dav UUID; v_bol UUID; v_nik UUID; v_mar UUID; v_boul UUID;
  v_lul UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID;
  c_abu UUID; c_aut UUID; c_mac UUID; c_obs UUID; c_ame UUID;
  c_neg UUID; c_irr UUID; c_con UUID; c_int UUID; c_nep UUID;
  c_hom UUID; c_rac UUID; c_mis UUID; c_rel UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_iba FROM politicians WHERE slug = 'ibaneis-rocha';
  SELECT id INTO v_elm FROM politicians WHERE slug = 'elmano-de-freitas';
  SELECT id INTO v_jer FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_ray FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_joa FROM politicians WHERE slug = 'joao-azevedo';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renato-casagrande';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'paulo-dantas';
  SELECT id INTO v_fab FROM politicians WHERE slug = 'fabio-mitidieri';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_fat FROM politicians WHERE slug = 'fatima-bezerra';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-brandao';
  SELECT id INTO v_gla FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_den FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_wan FROM politicians WHERE slug = 'wanderlei-barbosa';
  SELECT id INTO v_jor FROM politicians WHERE slug = 'jorginho-mello';
  SELECT id INTO v_raf FROM politicians WHERE slug = 'rafael-fonteles';
  SELECT id INTO v_nun FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_pae FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_fuad FROM politicians WHERE slug = 'fuad-noman';
  SELECT id INTO v_jca FROM politicians WHERE slug = 'joao-campos';
  SELECT id INTO v_top FROM politicians WHERE slug = 'topazio-silveira';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarto';
  SELECT id INTO v_seb FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_gre FROM politicians WHERE slug = 'rafael-greca';
  SELECT id INTO v_bru FROM politicians WHERE slug = 'bruno-reis';
  SELECT id INTO v_dav FROM politicians WHERE slug = 'david-almeida';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_boul FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_rel FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro defende operação policial com alta letalidade no Complexo do Alemão em 2024.', 'Nossa polícia não vai recuar. Bandido bom é bandido preso ou morto.', 'Declaração após operação com mortes no Rio de Janeiro.', 'verified', true, '2024-08-15', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/08/15/castro-operacao.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva Alemão', 'castro-operacao-alemao-b107-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende privatização da Sabesp com críticas a movimentos sociais.', 'Quem é contra a privatização é contra o progresso de São Paulo.', 'Discurso na Alesp sobre venda da Sabesp.', 'verified', true, '2024-03-22', 'https://www.folha.uol.com.br/cotidiano/2024/03/tarcisio-sabesp.shtml', 'news_article', 3, 'São Paulo', 'Alesp', 'tarcisio-sabesp-privatizacao-b107-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado ataca movimentos indígenas em Goiás e defende expansão do agronegócio.', 'Os índios querem terra demais. Goiás é do agronegócio.', 'Entrevista em rádio local.', 'verified', false, '2024-05-10', 'https://www.opopular.com.br/politica/caiado-indigenas.html', 'news_article', 4, 'Goiânia', 'Entrevista', 'caiado-indigenas-agro-b107-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima minimiza crise da seca na Amazônia em 2024.', 'A seca é natural, não tem nada de emergência climática.', 'Coletiva sobre estiagem no AM.', 'verified', true, '2024-09-18', 'https://g1.globo.com/am/amazonas/noticia/2024/09/18/wilson-lima-seca.ghtml', 'news_article', 4, 'Manaus', 'Coletiva seca', 'wilson-lima-seca-negacionismo-b107-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_iba, 'Ibaneis Rocha faz declaração minimizando atos antidemocráticos no DF.', 'Aquilo foi só uma manifestação que saiu do controle.', 'Ao comentar aniversário do 8 de janeiro.', 'verified', true, '2024-01-08', 'https://www.metropoles.com/distrito-federal/ibaneis-8-janeiro', 'news_article', 5, 'Brasília', 'Aniversário 8/1', 'ibaneis-8-janeiro-b107-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmano de Freitas critica oposição usando termo considerado hostil.', 'A direita do Ceará só sabe mentir e espalhar ódio.', 'Discurso em plenária do PT.', 'verified', false, '2024-06-12', 'https://www.opovo.com.br/noticias/politica/2024/06/12/elmano-oposicao.html', 'news_article', 2, 'Fortaleza', 'Plenária PT', 'elmano-oposicao-ceara-b107-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jerônimo Rodrigues é acusado de nomear aliados em cargos comissionados sem concurso.', 'Confiança política é critério legítimo para nomeação.', 'Defesa de nomeações no governo da Bahia.', 'verified', false, '2024-07-20', 'https://www.atarde.com.br/politica/jeronimo-nomeacoes', 'news_article', 3, 'Salvador', 'Coletiva', 'jeronimo-nomeacoes-bahia-b107-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho promete obras da COP30 em Belém apesar de denúncias de remoções forçadas.', 'Quem for removido será indenizado, mas a COP vai acontecer.', 'Entrevista sobre obras da COP30.', 'verified', true, '2025-03-15', 'https://www.oliberal.com/belem/helder-cop30-remocoes', 'news_article', 3, 'Belém', 'Obras COP30', 'helder-cop30-remocoes-b107-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ray, 'Raquel Lyra faz declaração considerada machista sobre parlamentares mulheres críticas ao governo.', 'Essas deputadas gostam é de aparecer na mídia.', 'Após críticas de parlamentares de oposição.', 'verified', false, '2024-10-05', 'https://g1.globo.com/pe/pernambuco/noticia/2024/10/05/raquel-lyra-deputadas.ghtml', 'news_article', 3, 'Recife', 'Coletiva', 'raquel-lyra-deputadas-b107-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema defende privatização total da Cemig e afirma que servidores são "problema".', 'Funcionalismo é gasto, não é investimento.', 'Entrevista à imprensa em BH.', 'verified', true, '2024-04-18', 'https://www.otempo.com.br/politica/zema-cemig-servidores', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'zema-cemig-servidores-b107-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior defende porte de armas ampliado para "cidadão de bem" no Paraná.', 'Paraná precisa de cidadão armado para defender família.', 'Ato pró-armas em Curitiba.', 'verified', false, '2024-02-14', 'https://www.gazetadopovo.com.br/politica/ratinho-armas-parana/', 'news_article', 4, 'Curitiba', 'Ato pró-armas', 'ratinho-armas-parana-b107-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'João Azevedo é questionado sobre contratos suspeitos de sua gestão na Paraíba.', 'Todas as contratações seguiram a lei, ponto final.', 'Coletiva após reportagem.', 'verified', false, '2024-08-30', 'https://www.cartacapital.com.br/politica/joao-azevedo-paraiba', 'news_article', 3, 'João Pessoa', 'Coletiva', 'joao-azevedo-contratos-b107-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Leite é criticado por demora em resposta a enchentes no RS em 2024.', 'Ninguém estava preparado para uma tragédia dessa magnitude.', 'Declaração em meio à crise climática no RS.', 'verified', true, '2024-05-10', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/eduardo-leite-enchentes.html', 'news_article', 4, 'Porto Alegre', 'Enchentes RS', 'eduardo-leite-enchentes-rs-b107-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renato Casagrande critica mobilizações sociais no Espírito Santo.', 'Esses movimentos só atrapalham o desenvolvimento.', 'Após protestos de servidores.', 'verified', false, '2024-11-03', 'https://g1.globo.com/es/espirito-santo/noticia/2024/11/03/casagrande-movimentos.ghtml', 'news_article', 2, 'Vitória', 'Coletiva', 'casagrande-movimentos-es-b107-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Paulo Dantas nomeia parentes para cargos estratégicos em Alagoas.', 'Família capacitada é melhor que desconhecido.', 'Defesa de nomeações familiares.', 'verified', false, '2024-06-25', 'https://www.tnh1.com.br/politica/paulo-dantas-nomeacoes', 'news_article', 3, 'Maceió', 'Entrevista', 'dantas-nomeacoes-al-b107-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fab, 'Fábio Mitidieri é acusado de uso político da máquina em Sergipe.', 'Governador tem que apoiar seus aliados, é normal.', 'Entrevista sobre eleições municipais.', 'verified', false, '2024-09-01', 'https://www.infonet.com.br/politica/mitidieri-eleicoes', 'news_article', 3, 'Aracaju', 'Entrevista', 'mitidieri-uso-maquina-b107-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes defende desmatamento controlado no Mato Grosso.', 'Não existe desmatamento, existe produção.', 'Entrevista durante Agrishow.', 'verified', true, '2024-05-02', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/05/02/mauro-mendes-desmatamento.ghtml', 'news_article', 4, 'Cuiabá', 'Agrishow', 'mauro-mendes-desmatamento-b107-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Eduardo Riedel faz declaração controversa sobre conflitos com indígenas em MS.', 'A polícia tem que garantir a propriedade privada, custe o que custar.', 'Após conflito em terra indígena.', 'verified', true, '2024-10-22', 'https://www.campograndenews.com.br/politica/riedel-indigenas', 'news_article', 4, 'Campo Grande', 'Coletiva', 'riedel-indigenas-ms-b107-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra é criticada por resposta tardia a crise de segurança no RN.', 'A segurança é um desafio de toda a sociedade.', 'Após onda de ataques no RN.', 'verified', false, '2024-03-18', 'https://www.tribunadonorte.com.br/politica/fatima-seguranca', 'news_article', 3, 'Natal', 'Coletiva', 'fatima-seguranca-rn-b107-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Brandão minimiza violência urbana em São Luís.', 'São Luís não é pior do que outras capitais.', 'Entrevista após chacina.', 'verified', false, '2024-07-08', 'https://g1.globo.com/ma/maranhao/noticia/2024/07/08/brandao-violencia.ghtml', 'news_article', 3, 'São Luís', 'Entrevista', 'brandao-violencia-ma-b107-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gla, 'Gladson Cameli é investigado por desvio de recursos no Acre.', 'Não tenho nada a esconder, mas a Justiça me persegue.', 'Após operação da PF.', 'verified', true, '2024-04-10', 'https://g1.globo.com/ac/acre/noticia/2024/04/10/gladson-pf.ghtml', 'news_article', 4, 'Rio Branco', 'Coletiva', 'gladson-pf-acre-b107-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Antonio Denarium nega emergência Yanomami em Roraima.', 'A crise Yanomami foi inflada pela mídia de esquerda.', 'Entrevista sobre denúncias sanitárias.', 'verified', true, '2024-01-22', 'https://www.folhabv.com.br/politica/denarium-yanomami', 'news_article', 5, 'Boa Vista', 'Entrevista', 'denarium-yanomami-nega-b107-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clécio Luís defende grande obra do Porto Central apesar de impactos socioambientais.', 'Desenvolvimento é mais importante do que discursos ambientais.', 'Defesa de obras portuárias.', 'verified', false, '2024-08-14', 'https://www.portal.ap.gov.br/clecio-porto', 'news_article', 3, 'Macapá', 'Entrevista', 'clecio-porto-ap-b107-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wan, 'Wanderlei Barbosa é denunciado por contratações sem licitação no Tocantins.', 'Emergência justifica qualquer contratação.', 'Após ação do MP-TO.', 'verified', false, '2024-09-12', 'https://www.jornaldotocantins.com.br/politica/wanderlei-contratos', 'news_article', 3, 'Palmas', 'Coletiva', 'wanderlei-contratos-to-b107-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jor, 'Jorginho Mello defende ações policiais duras em Santa Catarina.', 'Bandido não tem direito a direitos humanos.', 'Discurso em formatura da polícia.', 'verified', true, '2024-06-05', 'https://www.nsctotal.com.br/noticias/jorginho-policia-sc', 'news_article', 4, 'Florianópolis', 'Formatura PM', 'jorginho-policia-sc-b107-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_raf, 'Rafael Fonteles é acusado de usar estrutura do estado em campanha política no Piauí.', 'Estou cumprindo meu dever de governador, nada mais.', 'Após denúncia no TRE.', 'verified', false, '2024-10-15', 'https://www.meionorte.com/politica/rafael-fonteles-campanha', 'news_article', 3, 'Teresina', 'Entrevista', 'fonteles-campanha-pi-b107-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Ricardo Nunes minimiza crise de zeladoria em São Paulo.', 'São Paulo está mais limpa do que nunca, quem diz o contrário é de má-fé.', 'Entrevista durante campanha.', 'verified', true, '2024-09-20', 'https://www.folha.uol.com.br/cotidiano/2024/09/nunes-zeladoria.shtml', 'news_article', 2, 'São Paulo', 'Campanha', 'nunes-zeladoria-sp-b107-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Eduardo Paes faz comentário considerado misógino sobre adversária política.', 'Ela deveria cuidar mais da aparência e menos da política.', 'Durante debate municipal.', 'verified', true, '2024-10-10', 'https://g1.globo.com/rj/rio-de-janeiro/eleicoes/2024/noticia/2024/10/10/paes-comentario.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Debate', 'paes-comentario-misogino-b107-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fuad, 'Fuad Noman é acusado de usar cargos para favorecer aliados em Belo Horizonte.', 'São escolhas técnicas, não políticas.', 'Após críticas de vereadores.', 'verified', false, '2024-07-18', 'https://www.otempo.com.br/politica/fuad-nomeacoes', 'news_article', 2, 'Belo Horizonte', 'Entrevista', 'fuad-nomeacoes-bh-b107-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jca, 'João Campos defende projeto polêmico de ocupação de morros no Recife.', 'Quem não quer sair do morro, não quer o progresso.', 'Em ato de apresentação do projeto.', 'verified', false, '2024-04-25', 'https://www.diariodepernambuco.com.br/politica/joao-campos-morros', 'news_article', 3, 'Recife', 'Coletiva', 'joao-campos-morros-b107-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topázio Silveira defende policiamento ostensivo "sem limites" em Florianópolis.', 'Quero a polícia na rua, sem esse papo de direito humano.', 'Entrevista após violência urbana.', 'verified', true, '2025-02-14', 'https://www.nsctotal.com.br/noticias/topazio-policia', 'news_article', 4, 'Florianópolis', 'Entrevista', 'topazio-policia-b107-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'José Sarto faz comentário homofóbico sobre oposicionista em Fortaleza.', 'Esse cara é um afetado mesmo.', 'Durante debate eleitoral.', 'verified', true, '2024-10-18', 'https://www.opovo.com.br/eleicoes/sarto-comentario.html', 'news_article', 5, 'Fortaleza', 'Debate', 'sarto-homofobia-b107-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_seb, 'Sebastião Melo é criticado por gestão das enchentes em Porto Alegre.', 'As comportas funcionaram, foi o Guaíba que subiu demais.', 'Entrevista após tragédia.', 'verified', true, '2024-05-22', 'https://gauchazh.clicrbs.com.br/porto-alegre/noticia/2024/05/melo-comportas.html', 'news_article', 4, 'Porto Alegre', 'Enchentes', 'melo-comportas-poa-b107-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gre, 'Rafael Greca (ex-prefeito) comenta gestão de sucessores com críticas severas.', 'A nova gestão destruiu tudo que eu construí.', 'Entrevista após deixar cargo.', 'verified', false, '2025-01-20', 'https://www.gazetadopovo.com.br/curitiba/greca-sucessor/', 'news_article', 2, 'Curitiba', 'Entrevista', 'greca-sucessor-b107-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis minimiza problemas de saneamento em Salvador.', 'Salvador é exemplo nacional em saneamento.', 'Coletiva durante campanha.', 'verified', false, '2024-09-14', 'https://www.atarde.com.br/politica/bruno-reis-saneamento', 'news_article', 2, 'Salvador', 'Coletiva', 'bruno-reis-saneamento-b107-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'David Almeida usa linguagem agressiva contra adversários em Manaus.', 'Vou acabar com essa oposição, nem vai sobrar pra contar história.', 'Discurso em comício.', 'verified', true, '2024-09-28', 'https://www.amazonasatual.com.br/david-almeida-oposicao/', 'news_article', 4, 'Manaus', 'Comício', 'david-almeida-oposicao-b107-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro apoia prefeitos aliados em ato que questiona integridade das urnas em 2024.', 'As urnas ainda não são confiáveis, precisamos fiscalizar.', 'Comício em Barueri.', 'verified', true, '2024-10-04', 'https://www.poder360.com.br/eleicoes/bolsonaro-urnas-2024/', 'news_article', 5, 'Barueri', 'Comício', 'bolsonaro-urnas-2024-b107-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz comentário considerado transfóbico em evento em Belo Horizonte.', 'Mulher é mulher, homem é homem, não tem esse negócio de gênero.', 'Evento da bancada.', 'verified', true, '2024-11-15', 'https://www.otempo.com.br/politica/nikolas-genero', 'news_article', 5, 'Belo Horizonte', 'Evento', 'nikolas-genero-bh-b107-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Pablo Marçal faz ataques pessoais em debates eleitorais em São Paulo.', 'Esse cara é um doente mental, não pode comandar a cidade.', 'Durante debate eleitoral.', 'verified', true, '2024-09-15', 'https://www.folha.uol.com.br/eleicoes/2024/09/marcal-debate.shtml', 'news_article', 4, 'São Paulo', 'Debate', 'marcal-debate-sp-b107-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_boul, 'Guilherme Boulos critica adversários com linguagem considerada dura.', 'A extrema-direita é fascista e pronto.', 'Comício em São Paulo.', 'verified', false, '2024-09-30', 'https://www.cartacapital.com.br/politica/boulos-fascismo', 'news_article', 2, 'São Paulo', 'Comício', 'boulos-fascismo-sp-b107-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro critica STF por decisões sobre segurança pública no Rio.', 'O STF atrapalha nossa polícia de fazer o trabalho dela.', 'Entrevista sobre decisão do ADPF das Favelas.', 'verified', true, '2024-11-22', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/11/22/castro-stf-adpf.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva', 'castro-stf-adpf-b107-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende Bolsonaro e minimiza indiciamento por golpismo.', 'Bolsonaro é um democrata, foi tudo perseguição.', 'Entrevista após indiciamento.', 'verified', true, '2024-11-26', 'https://www.estadao.com.br/politica/tarcisio-bolsonaro-indiciamento/', 'news_article', 4, 'São Paulo', 'Entrevista', 'tarcisio-bolsonaro-indiciamento-b107-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende Bolsonaro como "preso político" após indiciamento pela PF.', 'Bolsonaro é um preso político do sistema.', 'Entrevista em Brasília.', 'verified', true, '2024-11-28', 'https://www.cnnbrasil.com.br/politica/caiado-bolsonaro-preso/', 'news_article', 4, 'Brasília', 'Entrevista', 'caiado-bolsonaro-preso-b107-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema ataca Lula e defende anistia a envolvidos no 8 de janeiro.', 'Precisamos de anistia para pacificar o país.', 'Ato em Belo Horizonte.', 'verified', true, '2024-08-25', 'https://www.otempo.com.br/politica/zema-anistia-8-janeiro', 'news_article', 5, 'Belo Horizonte', 'Ato', 'zema-anistia-8-janeiro-b107-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_iba, 'Ibaneis afirma em entrevista que "TSE exagerou" na cassação de Bolsonaro.', 'O TSE foi político demais, não técnico.', 'Entrevista à imprensa.', 'verified', false, '2024-03-12', 'https://www.correiobraziliense.com.br/politica/2024/03/ibaneis-tse.html', 'news_article', 3, 'Brasília', 'Entrevista', 'ibaneis-tse-bolsonaro-b107-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior é acusado de conflito de interesse ao nomear sócio para cargo público.', 'A nomeação seguiu critérios técnicos.', 'Resposta a denúncia.', 'verified', false, '2024-07-30', 'https://www.gazetadopovo.com.br/politica/ratinho-socio/', 'news_article', 3, 'Curitiba', 'Coletiva', 'ratinho-socio-pr-b107-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Leite é criticado por cortes na saúde durante crise climática no RS.', 'Precisamos ser responsáveis fiscalmente, não dá para gastar sem limite.', 'Declaração após crise.', 'verified', false, '2024-09-05', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/09/eduardo-leite-saude.html', 'news_article', 3, 'Porto Alegre', 'Coletiva', 'eduardo-leite-saude-b107-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes defende grileiros como "produtores lesados" em MT.', 'O produtor rural é o que sustenta o país, não pode ser criminalizado.', 'Discurso em evento do agro.', 'verified', false, '2024-10-08', 'https://www.folha.uol.com.br/mercado/2024/10/mauro-mendes-grileiros.shtml', 'news_article', 3, 'Cuiabá', 'Evento agro', 'mauro-mendes-grileiros-b107-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_raf, 'Rafael Fonteles é acusado de uso político de programa assistencial no Piauí.', 'Os programas são para quem precisa, e meus aliados trabalham onde precisa.', 'Entrevista em rádio.', 'verified', false, '2024-08-22', 'https://www.meionorte.com/politica/fonteles-assistencial', 'news_article', 3, 'Teresina', 'Entrevista', 'fonteles-assistencial-b107-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima é denunciado por superfaturamento em contrato de respiradores em 2024.', 'Foi emergência da covid, não havia tempo para licitar.', 'Entrevista após denúncia da CGU.', 'verified', true, '2024-04-12', 'https://g1.globo.com/am/amazonas/noticia/2024/04/12/wilson-lima-respiradores.ghtml', 'news_article', 4, 'Manaus', 'Coletiva', 'wilson-lima-respiradores-b107-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jerônimo Rodrigues defende aumento de investimento em segurança e critica MP.', 'O Ministério Público não pode atrapalhar o combate ao crime.', 'Declaração após inquérito.', 'verified', false, '2024-12-05', 'https://www.correio24horas.com.br/politica/jeronimo-mp', 'news_article', 3, 'Salvador', 'Entrevista', 'jeronimo-mp-bahia-b107-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho é denunciado por uso político de obras da COP30.', 'Obras são obras, não existe uso político.', 'Entrevista em Brasília.', 'verified', false, '2025-06-15', 'https://www.poder360.com.br/politica/helder-cop30-politico/', 'news_article', 3, 'Belém', 'Coletiva', 'helder-cop-politico-b107-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ray, 'Raquel Lyra é criticada por demora em resposta à seca em Pernambuco.', 'Estamos fazendo o que é possível.', 'Entrevista no sertão pernambucano.', 'verified', false, '2024-11-10', 'https://www.diariodepernambuco.com.br/politica/raquel-seca', 'news_article', 2, 'Recife', 'Entrevista', 'raquel-seca-pe-b107-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Ricardo Nunes minimiza crise de moradia após operações de despejo em SP.', 'Não existe déficit habitacional em São Paulo.', 'Entrevista após despejo.', 'verified', false, '2025-02-08', 'https://www.cartacapital.com.br/politica/nunes-moradia-sp', 'news_article', 3, 'São Paulo', 'Coletiva', 'nunes-moradia-sp-b107-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes minimiza Dengue em 2024 e culpa moradores pela infestação.', 'O cidadão tem que cuidar da água parada em casa.', 'Coletiva sobre Dengue.', 'verified', true, '2024-03-05', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/03/05/paes-dengue.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Coletiva', 'paes-dengue-rj-b107-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jca, 'João Campos é acusado de clientelismo eleitoral em Recife.', 'Estamos ajudando comunidades, não fazendo política.', 'Resposta a denúncia.', 'verified', false, '2024-08-08', 'https://www.folhape.com.br/politica/joao-campos-clientelismo', 'news_article', 2, 'Recife', 'Entrevista', 'joao-campos-clientelismo-b107-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topázio Silveira faz declaração machista sobre vereadora em Florianópolis.', 'Essa vereadora só sabe gritar, devia ficar em casa.', 'Câmara de Florianópolis.', 'verified', true, '2025-04-02', 'https://www.nsctotal.com.br/noticias/topazio-vereadora', 'news_article', 4, 'Florianópolis', 'Plenário', 'topazio-vereadora-b107-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarto acusa adversário Evandro Leitão sem provas durante campanha em Fortaleza.', 'Ele está envolvido em esquemas, mas a imprensa protege.', 'Durante debate.', 'verified', true, '2024-10-25', 'https://www.opovo.com.br/eleicoes/sarto-evandro-acusacao.html', 'news_article', 4, 'Fortaleza', 'Debate', 'sarto-evandro-acusacao-b107-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'David Almeida minimiza denúncias de violência policial em Manaus.', 'A polícia faz o que tem que fazer.', 'Coletiva após chacina.', 'verified', true, '2024-06-18', 'https://www.amazonasatual.com.br/david-almeida-chacina/', 'news_article', 4, 'Manaus', 'Coletiva', 'david-almeida-chacina-b107-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gla, 'Gladson Cameli é acusado de uso político de emendas no Acre.', 'Emendas são direito do governador.', 'Entrevista à imprensa.', 'verified', false, '2024-12-10', 'https://www.acrenews.com.br/gladson-emendas', 'news_article', 2, 'Rio Branco', 'Entrevista', 'gladson-emendas-b107-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Denarium defende garimpo ilegal como "economia local" em Roraima.', 'O garimpo é o que sustenta muita família em Roraima.', 'Entrevista local.', 'verified', true, '2024-05-20', 'https://g1.globo.com/rr/roraima/noticia/2024/05/20/denarium-garimpo.ghtml', 'news_article', 5, 'Boa Vista', 'Entrevista', 'denarium-garimpo-b107-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmano de Freitas é acusado de ignorar pauta de mulheres no Ceará.', 'Temos uma secretaria, não dá para fazer tudo.', 'Após protesto de feministas.', 'verified', false, '2024-03-08', 'https://www.opovo.com.br/noticias/politica/elmano-mulheres.html', 'news_article', 2, 'Fortaleza', 'Entrevista', 'elmano-mulheres-b107-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Riedel defende a redução de impostos sem explicar compensação fiscal em MS.', 'Empresário paga muito imposto, é preciso aliviar.', 'Evento empresarial.', 'verified', false, '2024-07-15', 'https://www.campograndenews.com.br/politica/riedel-impostos', 'news_article', 2, 'Campo Grande', 'Evento', 'riedel-impostos-b107-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra é criticada por não cumprir promessa de reforma no Hospital Walfredo Gurgel.', 'As obras estão em andamento, mesmo que devagar.', 'Entrevista após vistoria.', 'verified', false, '2024-05-14', 'https://www.tribunadonorte.com.br/politica/fatima-hospital', 'news_article', 2, 'Natal', 'Entrevista', 'fatima-hospital-b107-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Brandão nomeia aliados políticos para postos estratégicos do MA.', 'É meu direito como chefe do executivo.', 'Coletiva sobre reforma.', 'verified', false, '2024-01-15', 'https://www.ogrupo.com.br/politica/brandao-nomeacoes-ma', 'news_article', 2, 'São Luís', 'Coletiva', 'brandao-nomeacoes-ma-b107-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wan, 'Wanderlei Barbosa faz comentário considerado xenofóbico sobre migrantes no Tocantins.', 'Gente de fora vem aqui só para ocupar serviço nosso.', 'Entrevista em rádio local.', 'verified', false, '2024-04-05', 'https://www.jornaldotocantins.com.br/politica/wanderlei-migrantes', 'news_article', 4, 'Palmas', 'Entrevista', 'wanderlei-migrantes-b107-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clécio Luís é acusado de ignorar denúncias de violência de gênero no Amapá.', 'Violência contra mulher é um problema nacional.', 'Entrevista após crime.', 'verified', false, '2024-11-25', 'https://www.g1.globo.com/ap/amapa/noticia/2024/11/25/clecio-violencia.ghtml', 'news_article', 3, 'Macapá', 'Coletiva', 'clecio-violencia-mulher-b107-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Paulo Dantas defende empresas ligadas a aliados em contratos públicos.', 'Essas empresas são competentes, e eu escolho quem trabalha bem.', 'Entrevista após denúncia.', 'verified', false, '2024-10-30', 'https://www.tnh1.com.br/politica/dantas-contratos', 'news_article', 3, 'Maceió', 'Entrevista', 'dantas-contratos-al-b107-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fab, 'Fábio Mitidieri ataca adversários com linguagem dura em Sergipe.', 'A oposição aqui não serve nem para varrer o chão.', 'Comício em Aracaju.', 'verified', false, '2024-09-22', 'https://www.infonet.com.br/politica/mitidieri-oposicao', 'news_article', 3, 'Aracaju', 'Comício', 'mitidieri-oposicao-b107-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jor, 'Jorginho Mello defende privatizações sem transparência em Santa Catarina.', 'Privatização resolve tudo, não precisa discutir tanto.', 'Entrevista em Florianópolis.', 'verified', false, '2024-08-28', 'https://www.nsctotal.com.br/noticias/jorginho-privatizacoes', 'news_article', 3, 'Florianópolis', 'Entrevista', 'jorginho-privatizacoes-b107-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Casagrande evita condenar o 8 de janeiro quando perguntado em entrevista.', 'Cada um tem sua visão sobre aquele dia.', 'Entrevista em Vitória.', 'verified', false, '2024-01-10', 'https://g1.globo.com/es/espirito-santo/noticia/2024/01/10/casagrande-8-janeiro.ghtml', 'news_article', 3, 'Vitória', 'Entrevista', 'casagrande-8-janeiro-b107-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_seb, 'Sebastião Melo minimiza impacto de corte de verbas culturais em Porto Alegre.', 'Cultura é importante, mas saneamento vem antes.', 'Coletiva sobre orçamento.', 'verified', false, '2024-11-20', 'https://gauchazh.clicrbs.com.br/porto-alegre/noticia/2024/11/melo-cultura.html', 'news_article', 2, 'Porto Alegre', 'Coletiva', 'melo-cultura-poa-b107-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bru, 'Bruno Reis é criticado por gastos com publicidade em Salvador.', 'Divulgar a cidade é fundamental para o turismo.', 'Entrevista em Salvador.', 'verified', false, '2024-04-30', 'https://www.atarde.com.br/politica/bruno-reis-publicidade', 'news_article', 2, 'Salvador', 'Entrevista', 'bruno-reis-publicidade-b107-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fuad, 'Fuad Noman é criticado por demora na reforma de UPAs em Belo Horizonte.', 'Obras levam tempo, não posso fazer tudo em um ano.', 'Entrevista coletiva.', 'verified', false, '2024-09-18', 'https://www.otempo.com.br/politica/fuad-upas', 'news_article', 2, 'Belo Horizonte', 'Coletiva', 'fuad-upas-b107-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio apoia policiais envolvidos em operação com alta letalidade na Baixada Santista.', 'Nossos policiais são heróis, não bandidos.', 'Coletiva na Baixada.', 'verified', true, '2024-08-05', 'https://www.folha.uol.com.br/cotidiano/2024/08/tarcisio-baixada.shtml', 'news_article', 5, 'Santos', 'Coletiva', 'tarcisio-baixada-policiais-b107-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema ameaça processar jornalistas que criticam sua gestão em MG.', 'A gente vai responsabilizar quem mente.', 'Entrevista em Belo Horizonte.', 'verified', true, '2024-07-25', 'https://www.otempo.com.br/politica/zema-jornalistas', 'news_article', 4, 'Belo Horizonte', 'Entrevista', 'zema-jornalistas-mg-b107-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro rebate inquérito sobre milícias e relativiza gravidade.', 'Milícia sempre existiu no Rio, não é coisa de hoje.', 'Declaração após relatório da CPI.', 'verified', true, '2024-12-15', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/12/15/castro-milicias.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva', 'castro-milicias-b107-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende ações policiais duras em comunidades de Goiás.', 'Bandido bom é bandido morto, ponto.', 'Discurso em formatura PM-GO.', 'verified', true, '2024-10-02', 'https://www.opopular.com.br/politica/caiado-bandido-morto.html', 'news_article', 5, 'Goiânia', 'Formatura PM', 'caiado-bandido-morto-b107-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica governadores bolsonaristas e chama de "omissos" em crise climática.', 'Esses governadores são irresponsáveis com seu povo.', 'Entrevista no Planalto.', 'verified', false, '2024-06-02', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-06/lula-governadores.html', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-governadores-b107-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_iba, 'Ibaneis é acusado de nomear filha para cargo no GDF.', 'Minha filha é qualificada, não tem nepotismo.', 'Coletiva no Buriti.', 'verified', true, '2024-02-20', 'https://www.metropoles.com/distrito-federal/ibaneis-filha', 'news_article', 4, 'Brasília', 'Coletiva', 'ibaneis-filha-df-b107-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Ricardo Nunes evita condenar atos antidemocráticos ao ser perguntado em debate.', 'Cada um tem direito a manifestar sua opinião.', 'Debate Record.', 'verified', true, '2024-09-26', 'https://www.folha.uol.com.br/eleicoes/2024/09/nunes-8-janeiro-debate.shtml', 'news_article', 4, 'São Paulo', 'Debate Record', 'nunes-8-janeiro-debate-b107-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes é criticado por gastos em eventos em meio a crise da saúde no RJ.', 'Cidade viva precisa de grandes eventos.', 'Coletiva sobre Réveillon.', 'verified', false, '2024-12-20', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/12/20/paes-reveillon.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Coletiva', 'paes-reveillon-gastos-b107-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal alega fraude eleitoral sem provas após derrota em SP.', 'As urnas foram manipuladas, eu venci.', 'Postagem em redes após 1º turno.', 'verified', true, '2024-10-07', 'https://www.cnnbrasil.com.br/eleicoes/marcal-urnas-fraude/', 'news_article', 5, 'São Paulo', 'Redes sociais', 'marcal-urnas-fraude-b107-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca urnas eletrônicas em campanha municipal.', 'O Brasil precisa de voto impresso, as urnas são fraudáveis.', 'Comício em Belo Horizonte.', 'verified', true, '2024-09-25', 'https://www.otempo.com.br/politica/nikolas-urnas', 'news_article', 5, 'Belo Horizonte', 'Comício', 'nikolas-urnas-bh-b107-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro afirma em campanha municipal que Lula roubou a eleição.', 'Vocês sabem que ganhamos em 2022, todo mundo sabe.', 'Comício em Goiânia.', 'verified', true, '2024-10-12', 'https://www.poder360.com.br/eleicoes/bolsonaro-lula-roubo/', 'news_article', 5, 'Goiânia', 'Comício', 'bolsonaro-lula-roubo-b107-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio anuncia escolas cívico-militares em SP apesar de críticas de pais.', 'Escola tem que ter disciplina como no quartel.', 'Cerimônia de anúncio.', 'verified', true, '2024-06-10', 'https://www.folha.uol.com.br/educacao/2024/06/tarcisio-civico-militar.shtml', 'news_article', 3, 'São Paulo', 'Cerimônia', 'tarcisio-civico-militar-b107-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema defende redução de participação do PROUNI em MG e ataca universidades públicas.', 'Universidade pública é para rico mesmo.', 'Evento empresarial.', 'verified', false, '2024-05-18', 'https://www.otempo.com.br/politica/zema-universidade', 'news_article', 3, 'Belo Horizonte', 'Evento', 'zema-universidade-b107-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior minimiza desmatamento na Mata Atlântica paranaense.', 'A gente preserva mais do que qualquer um.', 'Entrevista em Curitiba.', 'verified', false, '2024-08-18', 'https://www.gazetadopovo.com.br/politica/ratinho-desmatamento/', 'news_article', 3, 'Curitiba', 'Entrevista', 'ratinho-desmatamento-pr-b107-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes ataca ONGs ambientais em MT e ameaça fechar escritórios.', 'ONGs atrapalham o desenvolvimento, a gente vai acabar com isso.', 'Evento do agronegócio.', 'verified', true, '2024-09-10', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/09/10/mauro-ongs.ghtml', 'news_article', 4, 'Cuiabá', 'Evento agro', 'mauro-mendes-ongs-mt-b107-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Riedel é acusado de conflito de interesse ao favorecer setor do qual é sócio.', 'Meus interesses empresariais ficaram para trás.', 'Coletiva em Campo Grande.', 'verified', false, '2024-12-02', 'https://www.campograndenews.com.br/politica/riedel-conflito', 'news_article', 3, 'Campo Grande', 'Coletiva', 'riedel-conflito-ms-b107-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho minimiza devastação amazônica durante campanha para 2026.', 'O desmatamento caiu muito, estamos resolvendo.', 'Entrevista à imprensa internacional.', 'verified', false, '2025-09-10', 'https://www.poder360.com.br/meio-ambiente/helder-desmatamento/', 'news_article', 3, 'Belém', 'Entrevista', 'helder-desmatamento-b107-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Leite é criticado por apelo à polícia para reprimir manifestações de agricultores no RS.', 'Manifestação é direito, mas bloqueio de estrada é crime.', 'Coletiva em Porto Alegre.', 'verified', false, '2024-10-18', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/10/leite-manifestantes.html', 'news_article', 3, 'Porto Alegre', 'Coletiva', 'leite-manifestantes-rs-b107-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_boul, 'Boulos reage a ataques no debate com linguagem considerada agressiva.', 'Esse cara é um palhaço, não merece nem resposta.', 'Debate eleitoral.', 'verified', false, '2024-10-03', 'https://www.folha.uol.com.br/eleicoes/2024/10/boulos-debate.shtml', 'news_article', 2, 'São Paulo', 'Debate', 'boulos-debate-sp-b107-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira apoia prefeito aliado e espalha desinformação sobre adversário em BH.', 'Fuad é o candidato dos comunistas.', 'Comício em BH.', 'verified', true, '2024-10-20', 'https://www.otempo.com.br/politica/nikolas-fuad-comunista', 'news_article', 4, 'Belo Horizonte', 'Comício', 'nikolas-fuad-comunista-b107-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro em ato em Recife pede prisão política de ministros do STF.', 'Esses ministros são inimigos da democracia, têm que ser presos.', 'Ato em Recife.', 'verified', true, '2024-08-10', 'https://www.folhape.com.br/politica/bolsonaro-stf-recife', 'news_article', 5, 'Recife', 'Ato', 'bolsonaro-stf-recife-b107-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro faz piada considerada transfóbica em evento em Niterói.', 'Homem é homem, mulher é mulher, pode chamar de preconceito.', 'Evento de inauguração.', 'verified', true, '2024-07-12', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/07/12/castro-trans.ghtml', 'news_article', 5, 'Niterói', 'Inauguração', 'castro-trans-niteroi-b107-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio nega existência de racismo institucional em São Paulo.', 'Aqui não tem racismo, quem diz isso é radical.', 'Evento em São Paulo.', 'verified', true, '2024-11-20', 'https://www.folha.uol.com.br/cotidiano/2024/11/tarcisio-racismo.shtml', 'news_article', 4, 'São Paulo', 'Evento', 'tarcisio-racismo-sp-b107-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado faz comentário considerado intolerante religioso sobre terreiros em Goiás.', 'Essas religiões de terreiro são problema de segurança.', 'Entrevista em Goiânia.', 'verified', true, '2024-06-28', 'https://g1.globo.com/go/goias/noticia/2024/06/28/caiado-terreiros.ghtml', 'news_article', 5, 'Goiânia', 'Entrevista', 'caiado-terreiros-b107-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rel, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema ataca Lula e afirma que União está "perseguindo" MG com autuações ambientais.', 'A gente é perseguido pelo governo federal.', 'Coletiva em BH.', 'verified', true, '2024-04-15', 'https://www.otempo.com.br/politica/zema-lula-perseguicao', 'news_article', 3, 'Belo Horizonte', 'Coletiva', 'zema-lula-perseguicao-b107-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Paes ameaça processar imprensa crítica à gestão do Rio.', 'Quem mentir sobre mim vai responder na Justiça.', 'Entrevista em Copacabana.', 'verified', false, '2024-05-28', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/05/28/paes-imprensa.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'paes-imprensa-rj-b107-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

END $$;
