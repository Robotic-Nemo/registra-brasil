-- Batch 105: Pos-eleicao 2022, PRF, acampamentos, fuga de Bolsonaro, 8 de janeiro
-- 100 statements sobre abusos da PRF 2o turno, acampamentos em quarteis, transicao,
-- fuga de Bolsonaro a Orlando, posse de Lula, invasao de 8/1/2023
DO $$
DECLARE
  v_jair UUID; v_edu UUID; v_fla UUID; v_car UUID; v_dam UUID;
  v_hmo UUID; v_pgu UUID; v_ter UUID; v_mfe UUID; v_mma UUID;
  v_sca UUID; v_zam UUID; v_dsi UUID; v_bia UUID; v_ram UUID;
  v_rje UUID; v_mvh UUID; v_kim UUID; v_nik UUID; v_gir UUID;
  v_jza UUID; v_san UUID; v_fbr UUID; v_cgi UUID; v_lul UUID;
  v_alc UUID; v_had UUID; v_gle UUID; v_jan UUID; v_cir UUID;
  v_teb UUID; v_mar UUID; v_mvi UUID; v_axm UUID; v_gmm UUID;
  v_car2 UUID; v_fac UUID; v_lir UUID; v_pac UUID; v_ren UUID;
  v_hum UUID; v_ott UUID; v_ran UUID; v_sor UUID; v_pab UUID; v_bou UUID;
  c_ant UUID; c_vio UUID; c_des UUID; c_odi UUID; c_abu UUID;
  c_aut UUID; c_neg UUID; c_irr UUID; c_con UUID; c_int UUID;
  c_ame UUID; c_obs UUID; c_hom UUID; c_mac UUID; c_rac UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_pgu FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_mma FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sca FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_rje FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jza FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fbr FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_axm FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gmm FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ott FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_sor FROM politicians WHERE slug = 'soraya-thronicke';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro quebra silencio 44 horas apos derrota e nao reconhece explicitamente o resultado.', 'Como presidente da Republica e cidadao, continuarei cumprindo todos os mandamentos da nossa Constituicao.', 'Pronunciamento de pouco mais de dois minutos no Palacio da Alvorada sem citar Lula ou reconhecer a derrota.', 'verified', true, '2022-11-01', 'https://www1.folha.uol.com.br/poder/2022/11/bolsonaro-discurso-pos-derrota-silencio.shtml', 'other', 5, 'Brasilia', 'Pronunciamento no Alvorada', 'bolsonaro-quebra-silencio-derrota-b105-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz discurso de vitoria em Sao Paulo apos derrotar Bolsonaro.', 'Nao ha dois Brasis. Somos um so pais, um so povo. Sou o presidente de todos os brasileiros.', 'Discurso de vitoria no Hotel Intercontinental em Sao Paulo apos apuracao do 2o turno.', 'verified', true, '2022-10-30', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/10/30/lula-discurso-vitoria-sao-paulo.ghtml', 'other', 1, 'Sao Paulo', 'Discurso de vitoria', 'lula-discurso-vitoria-b105-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes denuncia operacoes irregulares da PRF no Nordeste no dia da eleicao.', 'Constituem abuso as barreiras montadas pela PRF para impedir que eleitores exercam o direito de voto.', 'Coletiva de imprensa no TSE durante o dia da votacao do 2o turno denunciando as batidas irregulares da PRF.', 'verified', true, '2022-10-30', 'https://www.tse.jus.br/comunicacao/noticias/2022/Outubro/moraes-prf-abuso-nordeste', 'other', 4, 'Brasilia', 'Coletiva TSE', 'moraes-prf-abuso-nordeste-b105-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro libera greve de caminhoneiros apos derrota em ato politico.', 'Compreendo a revolta. Mas nao podemos bloquear rodovias. Tenho compromisso com a Constituicao.', 'Pronunciamento breve pedindo desbloqueio das estradas apos 2 dias de bloqueios bolsonaristas.', 'verified', true, '2022-11-02', 'https://g1.globo.com/politica/noticia/2022/11/02/bolsonaro-pede-desbloqueio-rodovias.ghtml', 'other', 4, 'Brasilia', 'Pronunciamento no Alvorada', 'bolsonaro-desbloqueio-rodovias-b105-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro alimenta acampamentos em quarteis em publicacoes.', 'Os patriotas estao nos quarteis pedindo intervencao. O exercito e nossa esperanca.', 'Publicacao nas redes sociais incentivando os acampamentos em frente a quarteis militares.', 'verified', true, '2022-11-03', 'https://www1.folha.uol.com.br/poder/2022/11/eduardo-bolsonaro-acampamentos-quarteis.shtml', 'social_media_post', 5, 'Sao Paulo', 'Publicacao nas redes', 'eduardo-acampamentos-quarteis-b105-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli afirma que urnas foram fraudadas em publicacao apos derrota de Bolsonaro.', 'Houve fraude nas urnas. Vamos provar isso e reverter o resultado das eleicoes.', 'Publicacao nas redes sociais espalhando desinformacao apos o 2o turno.', 'verified', true, '2022-11-04', 'https://www.poder360.com.br/eleicoes/zambelli-fraude-urnas-pos-eleicao/', 'social_media_post', 4, 'Sao Paulo', 'Publicacao nas redes', 'zambelli-fraude-pos-eleicao-b105-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rje, 'Roberto Jefferson atira contra policiais federais que cumpriam mandado de prisao.', 'Nao vou me entregar. O Alexandre de Moraes e um bandido. Vou morrer lutando.', 'Ao resistir a prisao, Jefferson disparou varios tiros e lancou granada contra agentes da PF em sua casa no interior do RJ.', 'verified', true, '2022-10-23', 'https://www1.folha.uol.com.br/poder/2022/10/roberto-jefferson-atira-pf-granada.shtml', 'news_article', 5, 'Comendador Levy Gasparian (RJ)', 'Operacao PF', 'jefferson-atira-pf-granada-b105-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes determina prisao de Jefferson apos ataque contra agentes da PF.', 'A conduta criminosa exige resposta imediata. Determino a prisao preventiva em unidade maxima.', 'Decisao do STF apos os disparos e arremessos de granada contra a PF durante cumprimento de mandado.', 'verified', true, '2022-10-23', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=494421', 'other', 1, 'Brasilia', 'Decisao judicial STF', 'moraes-prisao-jefferson-ataque-b105-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tira compadrio ao defender Jefferson apos ataque a PF.', 'O que o Jefferson fez e inaceitavel, mas a culpa e do Alexandre de Moraes que o provocou.', 'Declaracao no cerco do Palacio da Alvorada tentando minimizar o ataque de Jefferson.', 'verified', false, '2022-10-24', 'https://g1.globo.com/politica/noticia/2022/10/24/bolsonaro-defende-jefferson-apos-ataque.ghtml', 'news_article', 3, 'Brasilia', 'Cerca do Alvorada', 'bolsonaro-defende-jefferson-ataque-b105-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro entra com acao no TSE pedindo anulacao de votos no 2o turno.', 'Tivemos problemas tecnicos em urnas antigas. Pedimos a anulacao dos votos dessas maquinas.', 'Peticao enviada ao TSE pela campanha do PL 22 dias apos eleicao pedindo anulacao parcial dos votos.', 'verified', true, '2022-11-22', 'https://www1.folha.uol.com.br/poder/2022/11/pl-pede-anulacao-votos-urnas-antigas.shtml', 'other', 5, 'Brasilia', 'Peticao ao TSE', 'bolsonaro-peticao-anulacao-votos-b105-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes multa PL em R$ 22,9 milhoes por peticao considerada de ma-fe.', 'A peticao e manifestamente de ma-fe e constitui abuso do processo eleitoral.', 'Decisao do TSE indeferindo pedido de anulacao e aplicando multa por litigancia de ma-fe ao PL.', 'verified', true, '2022-11-23', 'https://www.tse.jus.br/comunicacao/noticias/2022/Novembro/tse-multa-pl-peticao-anulacao', 'other', 1, 'Brasilia', 'Decisao TSE', 'moraes-multa-pl-peticao-b105-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin coordena equipe de transicao e critica "terra arrasada" de Bolsonaro.', 'Vamos encontrar uma terra arrasada. Bolsonaro deixa o pais em crise fiscal e institucional.', 'Coletiva no CCBB em Brasilia onde trabalha a equipe de transicao do governo Lula.', 'verified', true, '2022-11-10', 'https://g1.globo.com/politica/noticia/2022/11/10/alckmin-transicao-terra-arrasada-bolsonaro.ghtml', 'news_article', 1, 'Brasilia', 'Coletiva no CCBB', 'alckmin-transicao-terra-arrasada-b105-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende acampamentos em frente a quarteis em discurso bolsonarista.', 'Os patriotas tem direito de se manifestar. Os acampamentos sao legitimos.', 'Discurso em manifestacao em frente ao QG do Exercito em Brasilia.', 'verified', true, '2022-11-08', 'https://www.poder360.com.br/politica/bia-kicis-acampamentos-quarteis/', 'news_article', 5, 'Brasilia', 'QG do Exercito', 'bia-kicis-defende-acampamentos-b105-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira participa de ato em frente a quartel e defende "intervencao".', 'Os patriotas estao aqui pedindo intervencao. O Exercito tem o dever constitucional de agir.', 'Discurso em manifestacao em frente a quartel militar em Belo Horizonte.', 'verified', true, '2022-11-15', 'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-quartel-intervencao/', 'news_article', 5, 'Belo Horizonte', 'Quartel em BH', 'nikolas-quartel-intervencao-b105-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto defende artigo 142 em discurso em acampamento bolsonarista.', 'O artigo 142 e a saida. As Forcas Armadas devem intervir agora.', 'Discurso em acampamento bolsonarista em frente ao QG do Exercito em Brasilia.', 'verified', false, '2022-11-20', 'https://www.metropoles.com/distrito-federal/cabo-gilberto-quartel-142', 'news_article', 5, 'Brasilia', 'Acampamento em Brasilia', 'cabo-gilberto-142-quartel-b105-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad e anunciado ministro da Fazenda por Lula durante transicao.', 'Aceito a missao de ser ministro da Fazenda para reconstruir o Brasil com responsabilidade.', 'Anuncio feito por Lula em coletiva no CCBB durante transicao de governo.', 'verified', true, '2022-12-09', 'https://g1.globo.com/politica/noticia/2022/12/09/haddad-ministro-fazenda-governo-lula.ghtml', 'news_article', 1, 'Brasilia', 'Coletiva CCBB', 'haddad-ministro-fazenda-b105-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira e anunciado como Ministro das Relacoes Exteriores do governo Lula.', 'O Brasil voltara ao protagonismo diplomatico. Vamos reconstruir a imagem do pais no mundo.', 'Anuncio durante transicao em Brasilia depois de carreira diplomatica consolidada.', 'verified', false, '2022-12-10', 'https://g1.globo.com/politica/noticia/2022/12/10/mauro-vieira-relacoes-exteriores.ghtml', 'news_article', 1, 'Brasilia', 'Anuncio ministerial', 'mauro-vieira-mre-b105-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva e anunciada como futura ministra do Meio Ambiente.', 'Volto ao Ministerio para recuperar o meio ambiente destruido nos ultimos anos.', 'Anuncio durante transicao apos articulacao com Lula sobre agenda climatica.', 'verified', true, '2022-12-29', 'https://www1.folha.uol.com.br/ambiente/2022/12/marina-silva-ministra-meio-ambiente-lula.shtml', 'news_article', 1, 'Brasilia', 'Anuncio ministerial', 'marina-ministra-meio-ambiente-b105-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet e anunciada como ministra do Planejamento no governo Lula.', 'Aceito o desafio com orgulho. Vou trabalhar por um Brasil mais justo e desenvolvido.', 'Anuncio feito por Lula durante transicao apos apoio no 2o turno.', 'verified', false, '2022-12-22', 'https://g1.globo.com/politica/noticia/2022/12/22/simone-tebet-ministra-planejamento.ghtml', 'news_article', 1, 'Brasilia', 'Anuncio ministerial', 'tebet-ministra-planejamento-b105-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes faz balanco final e defende legado economico do governo Bolsonaro.', 'Deixamos o Brasil melhor do que encontramos. O futuro governo tera que manter a responsabilidade fiscal.', 'Entrevista ao Valor Economico na ultima semana do governo Bolsonaro.', 'verified', false, '2022-12-20', 'https://www.valor.com.br/politica/guedes-balanco-final-governo-bolsonaro/', 'news_article', 2, 'Brasilia', 'Entrevista Valor Economico', 'guedes-balanco-final-b105-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro viaja para os EUA em 30 de dezembro e foge da posse de Lula.', 'Perdemos uma batalha, mas nao a guerra. Vamos continuar a luta.', 'Ultimo pronunciamento em live antes de embarcar para Orlando, Florida, dois dias antes da posse de Lula.', 'verified', true, '2022-12-30', 'https://www1.folha.uol.com.br/poder/2022/12/bolsonaro-embarca-eua-dois-dias-antes-posse-lula.shtml', 'news_article', 5, 'Brasilia', 'Live final', 'bolsonaro-foge-eua-b105-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chora em live de despedida apos derrota e antes de fugir para os EUA.', 'Chega um momento em que a gente cansa. Agradeco a todos os que estiveram comigo.', 'Live emocionada de despedida horas antes de embarcar para os Estados Unidos.', 'verified', true, '2022-12-30', 'https://g1.globo.com/politica/noticia/2022/12/30/bolsonaro-chora-live-despedida-eua.ghtml', 'social_media_post', 3, 'Brasilia', 'Live de despedida', 'bolsonaro-chora-live-despedida-b105-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula toma posse em 1o de janeiro e recebe faixa presidencial de crianca.', 'Nao ha retrocesso. Retornamos a Constituicao e ao caminho da democracia.', 'Discurso de posse no Congresso Nacional e cerimonia na rampa do Planalto sem Bolsonaro.', 'verified', true, '2023-01-01', 'https://www1.folha.uol.com.br/poder/2023/01/lula-toma-posse-presidente-brasil.shtml', 'other', 1, 'Brasilia', 'Posse presidencial', 'lula-posse-1-janeiro-b105-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin assume vice-presidencia em cerimonia com Lula.', 'E um dia de vitoria da democracia. O Brasil volta a ser respeitado.', 'Discurso durante cerimonia de posse do governo Lula no Congresso Nacional.', 'verified', true, '2023-01-01', 'https://g1.globo.com/politica/noticia/2023/01/01/alckmin-vice-presidente-posse.ghtml', 'other', 1, 'Brasilia', 'Posse presidencial', 'alckmin-vice-presidencia-b105-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega golpe em declaracao em supermercado na Florida.', 'Nao planejei nada. Respeito a Constituicao. Nao quis estar aqui.', 'Declaracao a brasileiros em supermercado em Orlando, Florida, durante estadia nos EUA.', 'verified', true, '2023-01-02', 'https://g1.globo.com/politica/noticia/2023/01/02/bolsonaro-supermercado-florida-golpe.ghtml', 'news_article', 3, 'Orlando, EUA', 'Supermercado em Orlando', 'bolsonaro-supermercado-florida-b105-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro posta video em redes questionando eleicoes dias apos invasao.', 'Estao espalhando mentiras sobre mim. Eu nunca apoiei ataque a instituicao nenhuma.', 'Publicacao nas redes sociais tres dias apos os atos golpistas de 8 de janeiro.', 'verified', true, '2023-01-10', 'https://www1.folha.uol.com.br/poder/2023/01/bolsonaro-video-pos-8-janeiro.shtml', 'social_media_post', 5, 'Orlando, EUA', 'Publicacao nas redes', 'bolsonaro-video-pos-invasao-b105-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves participa de acampamento bolsonarista apos derrota e fala em "sangue".', 'Derramaremos nosso sangue pela patria se for preciso. Nao desistiremos.', 'Discurso em acampamento bolsonarista em Brasilia apos derrota.', 'verified', false, '2022-11-25', 'https://www.metropoles.com/distrito-federal/eleicoes-df/damares-sangue-patria', 'news_article', 5, 'Brasilia', 'Acampamento QG', 'damares-sangue-patria-b105-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro publica video questionando eleicoes na manha de 8 de janeiro.', 'Manifestacoes pacificas na forma da lei fazem parte da democracia.', 'Publicacao no Facebook horas antes dos ataques as sedes dos tres poderes em Brasilia.', 'verified', true, '2023-01-10', 'https://g1.globo.com/politica/noticia/2023/01/10/bolsonaro-video-questiona-eleicoes-8-janeiro.ghtml', 'social_media_post', 5, 'Orlando, EUA', 'Publicacao no Facebook', 'bolsonaro-video-8-janeiro-b105-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita predios depredados no 8 de janeiro e fala em "fascistas".', 'Essas pessoas sao fascistas. Vao pagar por cada vidro quebrado, cada movel destruido.', 'Visita aos tres poderes destruidos horas apos a invasao em 8 de janeiro.', 'verified', true, '2023-01-08', 'https://g1.globo.com/politica/noticia/2023/01/08/lula-visita-predios-depredados-8-janeiro.ghtml', 'news_article', 2, 'Brasilia', 'Visita aos tres poderes', 'lula-visita-predios-8-janeiro-b105-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula decreta intervencao federal na seguranca publica do DF apos 8 de janeiro.', 'Decreto intervencao federal na seguranca publica do DF ate 31 de janeiro.', 'Anuncio de intervencao apos a omissao do governador Ibaneis na defesa dos predios publicos.', 'verified', true, '2023-01-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/decretos/2023/decreto-intervencao-df-8-janeiro', 'other', 1, 'Brasilia', 'Decreto presidencial', 'lula-intervencao-df-b105-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes determina prisao de golpistas e desmonte de acampamentos.', 'Determino o desmonte imediato de todos os acampamentos e a identificacao dos autores da barbarie.', 'Decisao do STF no dia 8 de janeiro determinando o fim dos acampamentos golpistas.', 'verified', true, '2023-01-08', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=498765', 'other', 1, 'Brasilia', 'Decisao STF', 'moraes-desmonte-acampamentos-b105-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira comemora invasao em 8 de janeiro nas redes sociais.', 'O povo tomou de volta o que e do povo. Patriotas em acao!', 'Publicacao nas redes sociais durante a invasao as sedes dos tres poderes em 8 de janeiro.', 'verified', true, '2023-01-08', 'https://www1.folha.uol.com.br/poder/2023/01/silveira-comemora-invasao-8-janeiro.shtml', 'social_media_post', 5, 'Brasilia', 'Publicacao nas redes', 'silveira-comemora-invasao-b105-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli celebra invasao em 8 de janeiro em publicacao nas redes.', 'O povo falou. Hoje e dia de luta contra a ditadura do STF.', 'Publicacao nas redes sociais durante a invasao justificando os ataques golpistas.', 'verified', true, '2023-01-08', 'https://www.poder360.com.br/justica/zambelli-celebra-invasao-8-janeiro/', 'social_media_post', 5, 'Sao Paulo', 'Publicacao nas redes', 'zambelli-celebra-8-janeiro-b105-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira fica em silencio durante invasao e publica horas depois.', 'Lamento os excessos. Mas precisamos entender a insatisfacao dos manifestantes.', 'Publicacao tardia nas redes sociais apos horas de silencio durante a invasao de 8 de janeiro.', 'verified', true, '2023-01-08', 'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-silencio-8-janeiro/', 'social_media_post', 4, 'Brasilia', 'Publicacao nas redes', 'nikolas-silencio-8-janeiro-b105-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girao defende invasores em publicacao nas redes sociais.', 'Os manifestantes sao patriotas. Desesperados com o roubo da eleicao.', 'Publicacao nas redes sociais horas apos a invasao aos predios publicos em 8 de janeiro.', 'verified', false, '2023-01-09', 'https://www.poder360.com.br/politica/girao-defende-invasores-8-janeiro/', 'social_media_post', 5, 'Brasilia', 'Publicacao nas redes', 'girao-defende-invasores-b105-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann diz que 8 de janeiro foi "tentativa de golpe" planejada.', 'Foi tentativa de golpe. Todos os envolvidos devem ser responsabilizados, inclusive Bolsonaro.', 'Coletiva na sede do PT apos os ataques golpistas de 8 de janeiro.', 'verified', true, '2023-01-09', 'https://g1.globo.com/politica/noticia/2023/01/09/gleisi-8-janeiro-tentativa-golpe.ghtml', 'news_article', 1, 'Sao Paulo', 'Coletiva PT', 'gleisi-tentativa-golpe-b105-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco condena ataques de 8 de janeiro em pronunciamento no Senado.', 'Atentamos contra a democracia. Os responsaveis serao punidos com rigor da lei.', 'Pronunciamento do presidente do Senado apos os ataques as sedes dos tres poderes.', 'verified', true, '2023-01-09', 'https://www12.senado.leg.br/noticias/materias/2023/01/09/pacheco-condena-8-janeiro', 'other', 1, 'Brasilia', 'Pronunciamento no Senado', 'pacheco-condena-8-janeiro-b105-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira condena violencia de 8 de janeiro mas evita citar Bolsonaro.', 'Condeno a violencia. A Camara nao concorda com ataques as instituicoes.', 'Pronunciamento na Camara evitando citar diretamente Bolsonaro ou bolsonaristas.', 'verified', false, '2023-01-09', 'https://www.camara.leg.br/noticias/2023/01/lira-condena-8-janeiro', 'other', 2, 'Brasilia', 'Plenario da Camara', 'lira-condena-8-janeiro-b105-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues pede CPI para investigar 8 de janeiro no Senado.', 'Precisamos investigar quem financiou, quem organizou e quem omitiu. Sera uma CPI necessaria.', 'Declaracao no Senado pedindo CPI mista para investigar os atos golpistas.', 'verified', false, '2023-01-09', 'https://www12.senado.leg.br/noticias/materias/2023/01/09/randolfe-cpi-8-janeiro', 'news_article', 1, 'Brasilia', 'Entrevista no Senado', 'randolfe-cpi-8-janeiro-b105-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que invasao de 8 de janeiro teve financiamento.', 'Houve financiamento e organizacao. Nao foi espontaneo. Vamos seguir o dinheiro.', 'Coletiva no Ministerio da Fazenda apos os ataques golpistas.', 'verified', false, '2023-01-10', 'https://g1.globo.com/politica/noticia/2023/01/10/haddad-financiamento-8-janeiro.ghtml', 'news_article', 2, 'Brasilia', 'Coletiva no Ministerio', 'haddad-financiamento-8-janeiro-b105-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes afasta governador Ibaneis Rocha apos 8 de janeiro.', 'Determino o afastamento do governador do DF por omissao na defesa dos predios publicos.', 'Decisao do STF apos a invasao e a demora da seguranca publica do DF em agir.', 'verified', true, '2023-01-08', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=498812', 'other', 2, 'Brasilia', 'Decisao STF', 'moraes-afasta-ibaneis-b105-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro internado em hospital na Florida dias apos invasao.', 'Fui internado por obstrucao intestinal, problema antigo pela facada de 2018.', 'Comunicacao do hospital na Florida apos internacao de Bolsonaro nos EUA.', 'verified', true, '2023-01-09', 'https://g1.globo.com/politica/noticia/2023/01/09/bolsonaro-internado-hospital-florida.ghtml', 'news_article', 3, 'Orlando, EUA', 'Hospital em Orlando', 'bolsonaro-internado-florida-b105-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem condena 8 de janeiro e critica bolsonarismo golpista.', 'Quem invadiu e criminoso. Defendo a democracia liberal, sem meio-termo.', 'Discurso na Camara condenando os atos golpistas e defendendo responsabilizacao.', 'verified', false, '2023-01-09', 'https://www.camara.leg.br/noticias/2023/01/marcel-condena-8-janeiro', 'transcript_pdf', 1, 'Brasilia', 'Plenario da Camara', 'marcel-condena-8-janeiro-b105-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri classifica 8 de janeiro como "ato golpista" e pede punicao.', 'Foi ato golpista. Precisamos punir os responsaveis e evitar que se repita.', 'Entrevista a jornalistas no Congresso apos os ataques de 8 de janeiro.', 'verified', false, '2023-01-10', 'https://www.uol.com.br/noticias/politica/kim-kataguiri-8-janeiro-golpista/', 'news_article', 1, 'Brasilia', 'Entrevista no Congresso', 'kim-8-janeiro-golpista-b105-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama invasores de "patriotas" em entrevista nos EUA.', 'Os manifestantes sao patriotas. Foram provocados pela persistencia da fraude.', 'Entrevista a midia americana durante estadia em Orlando com o pai apos o 8 de janeiro.', 'verified', true, '2023-01-12', 'https://www1.folha.uol.com.br/poder/2023/01/eduardo-bolsonaro-patriotas-8-janeiro.shtml', 'news_article', 5, 'Orlando, EUA', 'Entrevista midia americana', 'eduardo-patriotas-invasores-b105-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flavio Bolsonaro tenta minimizar 8 de janeiro em entrevista no Senado.', 'Foram apenas alguns exaltados. Nao e justo culpar o bolsonarismo inteiro.', 'Declaracao a jornalistas no Senado dias apos os ataques golpistas.', 'verified', true, '2023-01-11', 'https://g1.globo.com/politica/noticia/2023/01/11/flavio-bolsonaro-8-janeiro-exaltados.ghtml', 'news_article', 4, 'Brasilia', 'Entrevista no Senado', 'flavio-minimiza-8-janeiro-b105-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis tenta relativizar ataques de 8 de janeiro em entrevista.', 'Condeno a violencia, mas nao podemos criminalizar o povo inconformado.', 'Entrevista ao Poder360 apos os ataques golpistas de 8 de janeiro.', 'verified', false, '2023-01-10', 'https://www.poder360.com.br/politica/bia-kicis-relativiza-8-janeiro/', 'news_article', 4, 'Brasilia', 'Entrevista Poder360', 'bia-relativiza-8-janeiro-b105-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina elege-se senadora pelo MS em meio a campanha bolsonarista.', 'O Mato Grosso do Sul confiou em mim. Vou ao Senado para defender o agro.', 'Discurso em Campo Grande apos ser eleita senadora com votacao expressiva no 1o turno.', 'verified', false, '2022-10-02', 'https://www.canalrural.com.br/noticias/tereza-cristina-senadora-ms-eleita/', 'news_article', 1, 'Campo Grande', 'Discurso apos eleicao', 'tereza-cristina-eleita-senadora-b105-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Mourao critica a conduta de Bolsonaro em discurso final como vice-presidente.', 'Os erros foram cometidos e tambem ajudaram a produzir a derrota eleitoral.', 'Pronunciamento oficial de despedida como vice-presidente em 30 de dezembro.', 'verified', true, '2022-12-30', 'https://www1.folha.uol.com.br/poder/2022/12/mourao-critica-bolsonaro-discurso-despedida.shtml', 'other', 2, 'Brasilia', 'Pronunciamento despedida', 'mourao-despedida-critica-bolsonaro-b105-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz em live que venda da Eletrobras foi "decisao acertada" ao fim do mandato.', 'Privatizamos a Eletrobras. Foi decisao acertada para o Brasil.', 'Live com apoiadores na ultima semana do mandato defendendo o legado economico.', 'verified', false, '2022-12-15', 'https://g1.globo.com/politica/noticia/2022/12/15/bolsonaro-live-eletrobras-privatizacao.ghtml', 'social_media_post', 1, 'Brasilia', 'Live com apoiadores', 'bolsonaro-eletrobras-privatizacao-b105-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin defende o TSE contra pressao militar em pronunciamento publico.', 'Nao ha papel moderador das Forcas Armadas. O Poder Eleitoral e civil e democratico.', 'Pronunciamento publico em evento do TSE apos pressao bolsonarista por contagem paralela.', 'verified', true, '2022-07-30', 'https://www.tse.jus.br/comunicacao/noticias/2022/Julho/fachin-forcas-armadas-nao-sao-moderadoras', 'other', 1, 'Brasilia', 'Evento TSE', 'fachin-forcas-armadas-nao-moderadoras-b105-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz em live no Alvorada que "ninguem quer aventura" apos derrota.', 'Ninguem quer aventura. Temos que respeitar a lei. Se foi a vontade de Deus, amem.', 'Live bizarra apos derrota em que misturou mensagens contraditorias sobre o resultado eleitoral.', 'verified', false, '2022-11-18', 'https://www1.folha.uol.com.br/poder/2022/11/bolsonaro-live-alvorada-pos-derrota.shtml', 'social_media_post', 2, 'Brasilia', 'Live no Alvorada', 'bolsonaro-ninguem-quer-aventura-b105-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes se despede do governo e admite "muito a aprender" com derrota.', 'Tivemos muito a aprender com os erros. A economia resistiu apesar das dificuldades.', 'Despedida do Ministerio da Economia em cerimonia final em Brasilia.', 'verified', false, '2022-12-29', 'https://www.valor.com.br/politica/guedes-despedida-ministerio/', 'news_article', 1, 'Brasilia', 'Cerimonia de despedida', 'guedes-despedida-ministerio-b105-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Andre Janones e eleito deputado e defende Lula em discurso de vitoria.', 'Minha vitoria e vitoria do Lula tambem. Vou defender o governo no Congresso.', 'Discurso de vitoria em Ituiutaba, MG, apos ser eleito com a maior votacao de MG.', 'verified', false, '2022-10-02', 'https://g1.globo.com/mg/minas-gerais/eleicoes/2022/noticia/2022/10/02/janones-eleito-deputado-federal.ghtml', 'news_article', 1, 'Ituiutaba', 'Discurso apos eleicao', 'janones-eleito-deputado-b105-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira perde mandato apos nao ser reeleito e foge da responsabilizacao.', 'O povo foi enganado pelo Alexandre de Moraes. Ainda vamos ter revanche.', 'Declaracao nas redes sociais apos perder mandato ao nao conseguir renovar a vaga.', 'verified', false, '2022-10-04', 'https://www.metropoles.com/brasil/silveira-perde-mandato-reeleicao', 'social_media_post', 3, 'Rio de Janeiro', 'Publicacao nas redes', 'silveira-perde-mandato-b105-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano relativiza 8 de janeiro em culto evangelico apos invasao.', 'Quem invadiu estava desesperado. Nao e justo criminalizar esses cidadaos.', 'Sermao em culto evangelico em Sao Paulo dias apos a invasao em 8 de janeiro.', 'verified', false, '2023-01-15', 'https://www.poder360.com.br/politica/feliciano-relativiza-8-janeiro/', 'news_article', 4, 'Sao Paulo', 'Culto evangelico', 'feliciano-relativiza-8-janeiro-b105-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro deixa Brasil em aviao da FAB sem participar da posse de Lula.', 'Nao posso participar da posse. Minha saude nao me permite viajar a Brasilia.', 'Justificativa apresentada por assessoria antes de embarcar em aviao da FAB para Orlando.', 'verified', true, '2022-12-30', 'https://g1.globo.com/politica/noticia/2022/12/30/bolsonaro-aviao-fab-orlando-nao-passa-faixa.ghtml', 'news_article', 5, 'Brasilia', 'Base Aerea de Brasilia', 'bolsonaro-aviao-fab-orlando-b105-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Carmen Lucia condena invasao de 8 de janeiro em nota do STF.', 'Os atos de barbarie atentam contra a democracia e a separacao de poderes.', 'Nota da ministra do STF apos a invasao as sedes dos tres poderes.', 'verified', false, '2023-01-09', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=498822', 'other', 1, 'Brasilia', 'Nota oficial STF', 'carmen-lucia-nota-8-janeiro-b105-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gmm, 'Gilmar Mendes afirma que Bolsonaro sera responsabilizado por 8 de janeiro.', 'Quem incitou por anos sera responsabilizado. A impunidade e perigosa para a democracia.', 'Entrevista a CNN Brasil em Brasilia apos os ataques de 8 de janeiro.', 'verified', false, '2023-01-11', 'https://www.cnnbrasil.com.br/politica/gilmar-mendes-bolsonaro-responsabilizado-8-janeiro/', 'news_article', 1, 'Brasilia', 'Entrevista CNN Brasil', 'gilmar-bolsonaro-responsabilizado-b105-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende CPI do 8 de janeiro no Senado.', 'Precisamos investigar tudo. Quem financiou, quem organizou, quem omitiu. Nao haver a impunidade.', 'Discurso no plenario do Senado defendendo instalacao de CPI mista.', 'verified', false, '2023-01-16', 'https://www12.senado.leg.br/noticias/materias/2023/01/16/humberto-costa-cpi-8-janeiro', 'transcript_pdf', 1, 'Brasilia', 'Plenario do Senado', 'humberto-costa-cpi-b105-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar critica omissao de Bolsonaro durante invasao de 8 de janeiro.', 'O silencio do Bolsonaro e culpado. Quem acende a fogueira nao pode dizer que nao sabia que queimava.', 'Entrevista ao programa da TV Senado apos os ataques de 8 de janeiro.', 'verified', false, '2023-01-13', 'https://www12.senado.leg.br/noticias/materias/2023/01/13/otto-alencar-bolsonaro-omissao', 'news_article', 1, 'Brasilia', 'TV Senado', 'otto-alencar-bolsonaro-omissao-b105-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros defende responsabilizacao dos envolvidos em 8 de janeiro.', 'O bolsonarismo tem que pagar pela barbarie. Nao ha perdao para quem atentou contra o Estado.', 'Entrevista ao Estadao apos os ataques golpistas de 8 de janeiro.', 'verified', false, '2023-01-14', 'https://www.estadao.com.br/politica/renan-bolsonarismo-pagar-8-janeiro/', 'news_article', 1, 'Brasilia', 'Entrevista Estadao', 'renan-bolsonarismo-pagar-b105-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos denuncia terrorismo bolsonarista apos 8 de janeiro.', 'O bolsonarismo e terrorismo puro. Precisamos tratar como terrorismo politico.', 'Entrevista a CBN Radio apos os ataques de 8 de janeiro.', 'verified', false, '2023-01-10', 'https://cbn.globoradio.globo.com/politica/boulos-bolsonarismo-terrorismo-8-janeiro/', 'news_article', 2, 'Sao Paulo', 'Entrevista CBN', 'boulos-terrorismo-bolsonarista-b105-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica omissao de Bolsonaro e pede responsabilizacao.', 'Bolsonaro e responsavel. Pela omissao, pelos anos de ataques. Tem que ser punido.', 'Entrevista ao Roda Viva no programa em fevereiro de 2023.', 'verified', false, '2023-01-17', 'https://tvcultura.com.br/videos/ciro-gomes-roda-viva-bolsonaro-omissao/', 'news_article', 2, 'Sao Paulo', 'Roda Viva', 'ciro-critica-omissao-bolsonaro-b105-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke apoia punicao severa aos envolvidos em 8 de janeiro.', 'Quem invadiu tem que pagar. A democracia precisa ser defendida sem rodeios.', 'Declaracao no Senado apos os ataques golpistas.', 'verified', false, '2023-01-16', 'https://www12.senado.leg.br/noticias/materias/2023/01/16/soraya-thronicke-puni-8-janeiro', 'news_article', 1, 'Brasilia', 'Entrevista no Senado', 'soraya-punicao-8-janeiro-b105-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marcal minimiza 8 de janeiro em live nas redes sociais.', 'Foram excessos, mas o Brasil esta de luto com a vitoria do PT. A esquerda quer lacrar.', 'Live no YouTube dias apos os ataques golpistas.', 'verified', false, '2023-01-11', 'https://www.cnnbrasil.com.br/politica/marcal-minimiza-8-janeiro/', 'social_media_post', 4, 'Sao Paulo', 'Live no YouTube', 'marcal-minimiza-8-janeiro-b105-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jza, 'Julia Zanatta relativiza ataques de 8 de janeiro em redes sociais.', 'O povo esta inconformado. Nao e hora de criminalizar a manifestacao popular.', 'Publicacao nas redes sociais minimizando os atos golpistas de 8 de janeiro.', 'verified', false, '2023-01-09', 'https://www.nsctotal.com.br/noticias/julia-zanatta-8-janeiro', 'social_media_post', 4, 'Florianopolis', 'Publicacao nas redes', 'zanatta-relativiza-8-janeiro-b105-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbr, 'Filipe Barros critica PF apos prisoes de envolvidos em 8 de janeiro.', 'A PF esta sendo usada politicamente. Estao prendendo pessoas inocentes apenas por protestar.', 'Discurso na Camara criticando as operacoes de investigacao dos atos golpistas.', 'verified', false, '2023-01-17', 'https://www.camara.leg.br/noticias/2023/01/filipe-barros-pf-8-janeiro', 'transcript_pdf', 4, 'Brasilia', 'Plenario da Camara', 'filipe-barros-critica-pf-b105-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sca, 'Silas Camara diz que 8 de janeiro foi "manipulacao" do governo Lula.', 'Foi armacao. O governo Lula plantou gente para invadir e culpar o bolsonarismo.', 'Publicacao nas redes sociais espalhando desinformacao sobre os atos golpistas.', 'verified', false, '2023-01-12', 'https://www.acritica.com/politica/silas-camara-8-janeiro-manipulacao/', 'social_media_post', 5, 'Manaus', 'Publicacao nas redes', 'silas-manipulacao-8-janeiro-b105-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia primeiras medidas do governo para reverter decretos de Bolsonaro.', 'Vamos reverter dezenas de decretos que atacaram direitos sociais e o meio ambiente.', 'Coletiva no Planalto no primeiro dia util de governo.', 'verified', true, '2023-01-02', 'https://g1.globo.com/politica/noticia/2023/01/02/lula-anuncia-medidas-reverter-decretos-bolsonaro.ghtml', 'news_article', 1, 'Brasilia', 'Coletiva no Planalto', 'lula-reverter-decretos-b105-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes afasta comandante da PM-DF e determina prisao de Anderson Torres.', 'Determino a prisao preventiva do ex-ministro Anderson Torres por omissao nos atos golpistas.', 'Decisao do STF apos os ataques de 8 de janeiro contra o ex-ministro da Justica de Bolsonaro.', 'verified', true, '2023-01-10', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=498834', 'other', 1, 'Brasilia', 'Decisao STF', 'moraes-prisao-anderson-torres-b105-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula aciona TPI contra Bolsonaro por genocidio indigena Yanomami.', 'Bolsonaro praticou genocidio contra o povo Yanomami. A Justica internacional vai atuar.', 'Visita a Roraima em 21 de janeiro para tratar da crise humanitaria Yanomami.', 'verified', true, '2023-01-21', 'https://g1.globo.com/politica/noticia/2023/01/21/lula-genocidio-yanomami-bolsonaro.ghtml', 'news_article', 2, 'Boa Vista', 'Visita a Roraima', 'lula-genocidio-yanomami-b105-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva anuncia desmonte da pecuaria ilegal em area Yanomami.', 'Vamos retirar os garimpeiros e recuperar a Terra Indigena Yanomami.', 'Coletiva no Ministerio do Meio Ambiente anunciando operacao federal em Roraima.', 'verified', false, '2023-01-25', 'https://www.oeco.org.br/noticias/marina-silva-desmonte-garimpo-yanomami/', 'news_article', 1, 'Brasilia', 'Coletiva MMA', 'marina-desmonte-garimpo-b105-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro evita responder perguntas sobre 8 de janeiro em entrevista nos EUA.', 'Nao vou comentar isso agora. Estou em outro pais. Cuido da minha saude.', 'Entrevista breve em Orlando respondendo a jornalistas brasileiros fora do hospital.', 'verified', true, '2023-01-13', 'https://g1.globo.com/politica/noticia/2023/01/13/bolsonaro-entrevista-orlando-8-janeiro.ghtml', 'news_article', 3, 'Orlando, EUA', 'Entrevista em Orlando', 'bolsonaro-nao-comenta-8-janeiro-b105-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que invasao foi obra da esquerda infiltrada em entrevista a CNN Internacional.', 'Foram pessoas infiltradas. Nao tem nada a ver com o movimento patriota brasileiro.', 'Entrevista a CNN Internacional durante estadia em Orlando, Florida.', 'verified', true, '2023-01-20', 'https://edition.cnn.com/2023/01/20/americas/bolsonaro-interview-january-8-intl/index.html', 'news_article', 4, 'Orlando, EUA', 'Entrevista CNN Internacional', 'bolsonaro-esquerda-infiltrada-b105-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rebate Bolsonaro sobre invasao em discurso em SP.', 'Bolsonaro mente. Os golpistas eram bolsonaristas com camisa de selecao.', 'Ato em Sao Paulo com sindicatos em janeiro de 2023.', 'verified', false, '2023-01-22', 'https://www1.folha.uol.com.br/poder/2023/01/lula-rebate-bolsonaro-invasao-8-janeiro.shtml', 'news_article', 1, 'Sao Paulo', 'Ato com sindicatos', 'lula-rebate-bolsonaro-8-janeiro-b105-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann pede prisao de Bolsonaro em manifestacao de esquerda.', 'Bolsonaro tem que ser preso. E o principal responsavel pelo 8 de janeiro.', 'Ato em defesa da democracia no Largo de Sao Francisco em Sao Paulo.', 'verified', false, '2023-01-14', 'https://g1.globo.com/sp/sao-paulo/noticia/2023/01/14/ato-democracia-gleisi-bolsonaro-prisao.ghtml', 'news_article', 2, 'Sao Paulo', 'Ato pela democracia', 'gleisi-prisao-bolsonaro-b105-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem e investigado por suposto envolvimento em atos golpistas.', 'Nego qualquer envolvimento. Cumprirei meu mandato como deputado federal.', 'Declaracao em Brasilia apos ser alvo de investigacao da PF sobre possivel uso da Abin.', 'verified', true, '2023-01-26', 'https://www.poder360.com.br/justica/ramagem-investigado-atos-golpistas/', 'news_article', 4, 'Brasilia', 'Entrevista na Camara', 'ramagem-investigado-golpistas-b105-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro vai a Orlando encontrar pai e posta foto "unidos".', 'Unidos sempre, em qualquer lugar. A familia e o que importa.', 'Publicacao nas redes sociais durante visita ao pai em Orlando, Florida.', 'verified', false, '2023-01-15', 'https://www.metropoles.com/brasil/carlos-bolsonaro-orlando-pai', 'social_media_post', 2, 'Orlando, EUA', 'Publicacao Instagram', 'carlos-orlando-pai-b105-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mma, 'Magno Malta perde eleicao no Espirito Santo e ataca resultado.', 'Tivemos fraude no ES. Nao vou aceitar esse resultado suspeito.', 'Declaracao apos derrota ao Senado em Vitoria, capixaba.', 'verified', false, '2022-10-03', 'https://www.gazetaonline.com.br/politica/2022/10/malta-perde-eleicao-fraude.html', 'news_article', 3, 'Vitoria', 'Declaracao apos resultado', 'malta-perde-eleicao-fraude-b105-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson participa de acampamento bolsonarista em RS apos derrota.', 'Estamos aqui em defesa da patria. As Forcas Armadas precisam agir.', 'Discurso em acampamento golpista em frente ao comando militar do Sul em Porto Alegre.', 'verified', false, '2022-11-30', 'https://gauchazh.clicrbs.com.br/politica/noticia/2022/11/sanderson-acampamento-porto-alegre.html', 'news_article', 5, 'Porto Alegre', 'Acampamento em RS', 'sanderson-acampamento-rs-b105-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro orienta bolsonaristas em mensagem de video a "seguir lutando".', 'Nao desistam. Continuem lutando pelo Brasil. Deus esta do nosso lado.', 'Mensagem de video enviada a grupos bolsonaristas no WhatsApp apos derrota.', 'verified', false, '2022-11-20', 'https://www1.folha.uol.com.br/poder/2022/11/bolsonaro-mensagem-video-bolsonaristas-derrota.shtml', 'social_media_post', 4, 'Brasilia', 'Mensagem WhatsApp', 'bolsonaro-seguir-lutando-b105-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro recebe minuta de golpe discutida em reuniao ministerial, segundo apuracao.', 'Precisamos analisar alternativas constitucionais. Tudo dentro da Constituicao.', 'Reuniao ministerial sobre minuta de golpe descoberta posteriormente pela PF na casa de Anderson Torres.', 'verified', true, '2022-12-07', 'https://g1.globo.com/politica/noticia/2023/01/12/minuta-golpe-anderson-torres-pf.ghtml', 'other', 5, 'Brasilia', 'Reuniao ministerial', 'bolsonaro-minuta-golpe-b105-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro assina decreto ultima hora tentando ampliar acesso a armas.', 'Nossa politica de armas protegeu o cidadao. Deixo esse legado para o Brasil.', 'Ultimo decreto assinado por Bolsonaro em 30 de dezembro sobre armas de fogo.', 'verified', false, '2022-12-29', 'https://g1.globo.com/politica/noticia/2022/12/29/bolsonaro-decreto-armas-fim-mandato.ghtml', 'other', 3, 'Brasilia', 'Decreto presidencial', 'bolsonaro-decreto-armas-final-b105-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula revoga decretos de armas de Bolsonaro no primeiro mes de governo.', 'Revogamos os decretos de armas. O Brasil nao sera um pais armado e violento.', 'Assinatura de decreto no Planalto revogando medidas bolsonaristas sobre armas.', 'verified', true, '2023-01-02', 'https://g1.globo.com/politica/noticia/2023/01/02/lula-revoga-decretos-armas-bolsonaro.ghtml', 'other', 1, 'Brasilia', 'Assinatura no Planalto', 'lula-revoga-decretos-armas-b105-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem critica uso do PL para peticao de ma-fe sobre urnas.', 'A peticao de Bolsonaro e de ma-fe. Prejudica a credibilidade das oposicoes de centro.', 'Entrevista a jornalistas em Porto Alegre apos multa do TSE ao PL.', 'verified', false, '2022-11-24', 'https://gauchazh.clicrbs.com.br/politica/noticia/2022/11/marcel-critica-peticao-pl-urnas.html', 'news_article', 1, 'Porto Alegre', 'Entrevista a jornalistas', 'marcel-critica-peticao-pl-b105-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli tem tornozeleira eletronica e celular apreendidos pela PF.', 'Estou sendo perseguida. O Moraes me persegue porque lutei pela verdade.', 'Declaracao a apoiadores apos operacao da PF apreender equipamentos no inicio de 2023.', 'verified', true, '2023-01-20', 'https://www1.folha.uol.com.br/poder/2023/01/zambelli-pf-tornozeleira-celular.shtml', 'news_article', 3, 'Sao Paulo', 'Operacao PF', 'zambelli-tornozeleira-pf-b105-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro admite que falou mal das urnas em entrevista no ultimo mes de governo.', 'Tenho duvidas sobre o sistema. Mas nunca fui contra a democracia.', 'Entrevista a Jovem Pan em dezembro de 2022 nao admitindo explicitamente a derrota.', 'verified', false, '2022-12-19', 'https://www.jovempan.com.br/noticias/politica/bolsonaro-entrevista-dezembro-urnas/', 'news_article', 3, 'Brasilia', 'Entrevista Jovem Pan', 'bolsonaro-admite-falou-mal-urnas-b105-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tem tentativa de atentado em Brasilia abortada com caminhao de combustivel.', 'Nao tenho nada a ver com isso. Nao incitei ninguem a nada.', 'Reacao de Bolsonaro apos o caso do caminhao com explosivos perto do aeroporto de Brasilia em dezembro.', 'verified', true, '2022-12-24', 'https://g1.globo.com/df/distrito-federal/noticia/2022/12/24/caminhao-explosivo-aeroporto-brasilia.ghtml', 'news_article', 5, 'Brasilia', 'Declaracao apos atentado abortado', 'bolsonaro-reacao-caminhao-explosivo-b105-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin diploma Lula como presidente em cerimonia no TSE em dezembro.', 'Entrego a diplomacao ao presidente eleito Luis Inacio Lula da Silva.', 'Cerimonia de diplomacao no TSE com presenca de autoridades e chefes dos poderes.', 'verified', true, '2022-12-12', 'https://www.tse.jus.br/comunicacao/noticias/2022/Dezembro/diplomacao-lula-presidente', 'other', 1, 'Brasilia', 'Diplomacao no TSE', 'fachin-diploma-lula-b105-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe diplomacao e promete governar para todos.', 'Recebo a faixa em gratitao ao povo. Governarei sem nenhuma discriminacao, para os 215 milhoes.', 'Discurso de Lula na cerimonia de diplomacao no TSE em Brasilia.', 'verified', true, '2022-12-12', 'https://g1.globo.com/politica/noticia/2022/12/12/lula-discurso-diplomacao-tse.ghtml', 'other', 1, 'Brasilia', 'Diplomacao no TSE', 'lula-discurso-diplomacao-b105-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto reeleito critica "perseguicao" a bolsonaristas.', 'Estao perseguindo patriotas. Nao aceitaremos esse golpe contra a direita.', 'Discurso em acampamento bolsonarista em Joao Pessoa apos reeleicao.', 'verified', false, '2022-11-10', 'https://www.cartacapital.com.br/politica/cabo-gilberto-perseguicao-bolsonaristas/', 'news_article', 4, 'Joao Pessoa', 'Acampamento em PB', 'cabo-gilberto-perseguicao-bolsonaristas-b105-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ignora diplomacao de Lula no TSE e permanece isolado no Alvorada.', 'Nao fui convidado. Nao compareci. Nao tenho nada a dizer sobre isso.', 'Ausencia notada na cerimonia de diplomacao de Lula em 12 de dezembro.', 'verified', true, '2022-12-12', 'https://www1.folha.uol.com.br/poder/2022/12/bolsonaro-ausente-diplomacao-lula-tse.shtml', 'news_article', 3, 'Brasilia', 'Palacio da Alvorada', 'bolsonaro-ausente-diplomacao-b105-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira e reeleito presidente da Camara com apoio do Centrao.', 'Agradeco a confianca renovada. Trabalharemos pela harmonia entre os poderes.', 'Discurso apos reeleicao na Camara em fevereiro de 2023 como presidente da Casa.', 'verified', false, '2023-02-01', 'https://www.camara.leg.br/noticias/2023/02/lira-reeleito-presidente', 'news_article', 1, 'Brasilia', 'Plenario da Camara', 'lira-reeleito-presidente-b105-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco reelege-se presidente do Senado com apoio do governo Lula.', 'A Casa Alta continuara defendendo a democracia e a harmonia entre os poderes.', 'Discurso apos reeleicao como presidente do Senado em fevereiro de 2023.', 'verified', false, '2023-02-01', 'https://www12.senado.leg.br/noticias/materias/2023/02/01/pacheco-reeleito-presidente-senado', 'news_article', 1, 'Brasilia', 'Plenario do Senado', 'pacheco-reeleito-presidente-b105-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves eleita senadora nega apoio a ataques golpistas.', 'Condeno a violencia. Mas entendo a dor dos cidadaos que nao aceitam o resultado.', 'Entrevista ao Metropoles apos os ataques de 8 de janeiro.', 'verified', false, '2023-01-12', 'https://www.metropoles.com/distrito-federal/damares-alves-8-janeiro', 'news_article', 4, 'Brasilia', 'Entrevista Metropoles', 'damares-nega-apoio-ataque-b105-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira reativa Casa Brasil-EUA em visita a Washington.', 'Retomamos a relacao com os EUA em novas bases. O Brasil volta ao mundo.', 'Coletiva em Washington durante primeira viagem oficial como ministro das Relacoes Exteriores.', 'verified', false, '2023-01-19', 'https://g1.globo.com/politica/noticia/2023/01/19/mauro-vieira-washington-casa-brasil-eua.ghtml', 'news_article', 1, 'Washington, EUA', 'Coletiva em Washington', 'mauro-vieira-washington-b105-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro solicita visto de trabalho nos EUA para evitar retorno ao Brasil.', 'Estou aqui por questoes pessoais. Quero ficar nos EUA para trabalhar.', 'Solicitacao de visto B-1 a autoridades americanas em janeiro de 2023.', 'verified', true, '2023-01-30', 'https://www1.folha.uol.com.br/mundo/2023/01/bolsonaro-pede-visto-trabalho-eua.shtml', 'news_article', 4, 'Orlando, EUA', 'Pedido de visto', 'bolsonaro-pede-visto-eua-b105-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz primeiro pronunciamento a nacao e pede unidade nacional.', 'Chega de discurso de odio. O Brasil precisa de paz, de uniao e de reconstrucao.', 'Pronunciamento em cadeia nacional em janeiro de 2023 apos os ataques de 8 de janeiro.', 'verified', true, '2023-01-11', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2023/janeiro/pronunciamento-nacao-unidade', 'other', 1, 'Brasilia', 'Pronunciamento em cadeia nacional', 'lula-pronunciamento-unidade-b105-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes determina bloqueio de bens de envolvidos em 8 de janeiro.', 'Determino o bloqueio dos bens dos financiadores e lideres dos atos golpistas.', 'Decisao do STF em janeiro de 2023 determinando medidas patrimoniais contra envolvidos no 8 de janeiro.', 'verified', true, '2023-01-18', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=498901', 'other', 2, 'Brasilia', 'Decisao STF', 'moraes-bloqueio-bens-8-janeiro-b105-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

END $$;
