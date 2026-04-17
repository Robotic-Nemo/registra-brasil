-- Batch 97: Dilma impeachment + Temer era + Lava Jato (2015-2018) - part 2
DO $$
DECLARE
  v_dilma UUID; v_lula UUID; v_temer UUID; v_cunha UUID; v_aecio UUID;
  v_alckmin UUID; v_jair UUID; v_edu UUID; v_fla UUID; v_gle UUID;
  v_moro UUID; v_ciro UUID; v_had UUID; v_serra UUID; v_marta UUID;
  v_maluf UUID; v_sarney UUID; v_renan UUID; v_silas UUID; v_jefferson UUID;
  v_collor UUID; v_guedes UUID; v_lira UUID; v_pacheco UUID; v_feliciano UUID;
  v_damares UUID; v_magno UUID; v_freixo UUID; v_chico UUID; v_jandira UUID;
  c_cor UUID; c_des UUID; c_hom UUID; c_mis UUID; c_rac UUID;
  c_odi UUID; c_abu UUID; c_mac UUID; c_ant UUID; c_irr UUID;
  c_con UUID; c_nep UUID; c_vio UUID; c_int UUID; c_obs UUID; c_ame UUID;
BEGIN
  SELECT id INTO v_dilma FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_temer FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_cunha FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_aecio FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_alckmin FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_moro FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_ciro FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_serra FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_marta FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_maluf FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sarney FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_renan FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_silas FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_jefferson FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_collor FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_guedes FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_lira FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pacheco FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_feliciano FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_damares FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_magno FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_freixo FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_chico FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jandira FROM politicians WHERE slug = 'jandira-feghali';

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
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1 Bolsonaro preto estrume
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro recicla declaração racista contra negros em campanha de 2018.', 'O afrodescendente não serve nem para procriar. Eu já vi quilombola de quase uma arroba.', 'Trecho reproduzido em entrevistas durante campanha, reiterando falas da Hebraica e gerando representação do MPF.', 'verified', true, '2018-08-25', 'https://www.cartacapital.com.br/politica/bolsonaro-reprisa-ataques-a-negros-em-campanha', 'news_article', 5, 'Entrevista campanha', 'Entrevista de campanha 2018', 'bolsonaro-reprisa-quilombolas-2018-b97-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 2 Bolsonaro gay filho
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reafirma em 2018 que prefere filho morto a gay.', 'Prefiro meu filho morrer num acidente do que aparecer com um bigodudo por aí. Para mim ele vai ter morrido mesmo.', 'Reprise em entrevista em 2018 de declaração original de 2011 à revista Playboy, amplamente cobrada na campanha.', 'verified', true, '2018-06-25', 'https://oglobo.globo.com/politica/bolsonaro-repete-frase-sobre-prefiro-filho-morto-22808000', 'news_article', 5, 'Entrevista', 'Campanha 2018', 'bolsonaro-filho-morto-gay-b97-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 3 Lula volta campanha
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula critica Temer em caravana e diz que governo ilegítimo desmonta direitos sociais.', 'O Temer é um governo ilegítimo que vem desmontando tudo o que foi construído em 13 anos. O povo vai responder em 2018.', 'Discurso em Caruaru na Caravana Lula pelo Brasil em agosto de 2017.', 'verified', false, '2017-08-18', 'https://g1.globo.com/pe/caruaru-regiao/noticia/lula-critica-temer-em-caruaru.ghtml', 'news_article', 1, 'Caruaru - PE', 'Caravana Lula pelo Brasil', 'lula-caruaru-temer-b97-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4 Dilma discurso Viena
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma em discurso na Universidade de Viena denuncia golpe parlamentar articulado por Temer e Cunha.', 'Meu impeachment foi um golpe parlamentar disfarçado de legalidade. Uma ruptura democrática.', 'Conferência na Universidade de Viena em 28 de outubro de 2016 após sua destituição.', 'verified', false, '2016-10-28', 'https://www.dw.com/pt-br/dilma-denuncia-golpe-em-palestra-em-viena/a-36196459', 'news_article', 1, 'Universidade de Viena', 'Conferência internacional', 'dilma-viena-golpe-b97-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 5 Temer tabela caminhoneiros
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_temer, 'Temer cede aos caminhoneiros e anuncia tabela de frete após paralisação.', 'Vamos atender as reivindicações. A tabela do frete é uma conquista da categoria.', 'Pronunciamento em 27 de maio de 2018 encerrando a greve que paralisou o Brasil.', 'verified', false, '2018-05-27', 'https://g1.globo.com/politica/noticia/temer-cede-caminhoneiros.ghtml', 'news_article', 2, 'Palácio do Planalto', 'Fim da greve dos caminhoneiros', 'temer-tabela-frete-b97-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6 Cunha contas Suíça
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha muda versão e admite contas trust na Suíça, mas nega que sejam suas.', 'As contas existem, mas não estão em meu nome. Sou beneficiário de um trust, isso não é crime.', 'Depoimento em 2015 ao Conselho de Ética após vazamento dos nomes na lista suíça.', 'verified', true, '2015-10-20', 'https://www1.folha.uol.com.br/poder/2015/10/1694516-cunha-admite-contas-na-suica.shtml', 'news_article', 4, 'Conselho de Ética', 'Depoimento sobre contas', 'cunha-admite-contas-suica-b97-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 7 Aecio irmã helicoptero
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio Neves é flagrado usando helicóptero de empresa investigada durante campanha.', 'O helicóptero foi cedido formalmente. Está tudo declarado à Justiça Eleitoral.', 'Reação em 2017 a reportagem da Folha sobre voos em helicóptero ligado a empresário investigado pela Lava Jato.', 'verified', false, '2017-07-04', 'https://www1.folha.uol.com.br/poder/2017/07/aecio-voos-helicoptero-empresa-investigada.shtml', 'news_article', 3, 'Senado Federal', 'Reação a reportagem', 'aecio-helicoptero-empresa-b97-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 8 Alckmin caixa 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin é alvo de delação da Odebrecht sobre recebimento de caixa 2 em campanha.', 'Nunca recebi um centavo de caixa dois. Repudio essas declarações absurdas.', 'Declaração em 19 de abril de 2017 após publicação dos anexos da delação que o envolviam.', 'verified', false, '2017-04-19', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/alckmin-rebate-delacao-odebrecht.ghtml', 'news_article', 3, 'São Paulo', 'Reação à delação', 'alckmin-nega-caixa-dois-b97-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 9 Edu soldado expansao
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro celebra vitória do pai com foto com armas e alerta à esquerda.', 'Mudem o país ou caia fora. A esquerda perdeu. Vamos governar com pulso firme.', 'Postagem no Instagram na noite do segundo turno em 28 de outubro de 2018.', 'verified', true, '2018-10-28', 'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-posta-foto-armas-apos-vitoria', 'news_article', 4, 'Instagram', 'Comemoração da vitória', 'eduardo-armas-comemoracao-b97-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 10 Flavio apoio Temer
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro vota contra denúncia de Temer no plenário da Alerj e justifica apoio em 2017.', 'Temer está sendo vítima de uma operação política. Não vamos permitir um novo golpe.', 'Declaração em plenário da Alerj em agosto de 2017 no contexto da primeira denúncia contra Temer.', 'verified', false, '2017-08-02', 'https://odia.ig.com.br/rio-de-janeiro/2017-08-02/flavio-defende-temer-alerj.html', 'news_article', 3, 'Alerj', 'Debate sobre denúncia', 'flavio-defende-temer-alerj-b97-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 11 Gleisi ataque Moro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi acusa Moro de agir como político e atuar para eleger Bolsonaro.', 'Moro usa a toga para fazer política. Está claro que ele queria destruir o Lula para eleger Bolsonaro.', 'Declaração em novembro de 2018, depois que Moro aceitou cargo no governo Bolsonaro.', 'verified', true, '2018-11-01', 'https://g1.globo.com/politica/noticia/gleisi-ataca-moro-apos-aceitar-cargo-bolsonaro.ghtml', 'news_article', 3, 'Diretório PT', 'Reação ao convite a Moro', 'gleisi-moro-politico-b97-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12 Moro defesa rigor
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro defende publicamente o rigor da Lava Jato em palestra em Washington.', 'A corrupção é um câncer e precisa ser extirpado com rigor. Sem a Lava Jato, o Brasil estaria perdido.', 'Palestra em outubro de 2017 em Harvard e Washington sobre combate à corrupção.', 'verified', false, '2017-10-13', 'https://www1.folha.uol.com.br/poder/2017/10/moro-defende-lava-jato-em-washington.shtml', 'news_article', 2, 'Washington', 'Palestra sobre corrupção', 'moro-palestra-washington-b97-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 13 Ciro Lula ainda candidato
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes critica teimosia do PT em manter Lula candidato mesmo preso.', 'O PT está brincando com o país. Não tem condição de Lula disputar eleição preso. É irresponsabilidade.', 'Entrevista coletiva após PT protocolar candidatura de Lula em agosto de 2018.', 'verified', false, '2018-08-16', 'https://g1.globo.com/politica/eleicoes/2018/noticia/ciro-critica-pt-lula-candidato.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'ciro-critica-pt-lula-candidato-b97-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14 Haddad debate
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia que se eleito indultará Lula e reverterá decisões do processo judicial.', 'Meu governo vai rever as perseguições políticas. Lula é inocente e todas as irregularidades serão corrigidas.', 'Entrevista à RedeTV em setembro de 2018 durante campanha eleitoral.', 'verified', false, '2018-09-25', 'https://www.redetv.uol.com.br/noticias/2018/09/haddad-indulto-lula-revisao-processos', 'news_article', 2, 'RedeTV', 'Entrevista campanha', 'haddad-indulto-lula-b97-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15 Serra delator
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra deixa Itamaraty alegando problemas de saúde em meio a denúncias da Lava Jato.', 'Minha saúde me obriga a deixar o cargo. Volto ao Senado para continuar servindo o Brasil.', 'Pronunciamento em 22 de fevereiro de 2017 ao pedir exoneração do Ministério das Relações Exteriores.', 'verified', false, '2017-02-22', 'https://g1.globo.com/politica/noticia/2017/02/serra-deixa-itamaraty-saude.html', 'news_article', 2, 'Itamaraty', 'Pedido de exoneração', 'serra-deixa-itamaraty-b97-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 16 Marta apoia Dória
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy declara apoio a Doria em 2016 após romper com PT.', 'João Doria representa a renovação. Apoio sua candidatura porque São Paulo precisa de gestão.', 'Declaração em entrevista em agosto de 2016 durante campanha municipal paulistana.', 'verified', false, '2016-08-23', 'https://g1.globo.com/sao-paulo/noticia/2016/08/marta-apoia-doria-sp.html', 'news_article', 1, 'São Paulo', 'Apoio a Doria', 'marta-apoio-doria-b97-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17 Maluf saúde
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf vai para prisão domiciliar alegando saúde após pressão por habeas corpus.', 'Minha saúde não permite cumprir pena em presídio. Sou idoso e doente. Vou a lutar pela minha liberdade.', 'Declaração em abril de 2018 após STF conceder domiciliar por questões médicas.', 'verified', false, '2018-04-18', 'https://g1.globo.com/politica/noticia/stf-maluf-domiciliar.ghtml', 'news_article', 2, 'Brasília', 'Decisão do STF', 'maluf-domiciliar-saude-b97-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 18 Sarney Temer defesa
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney defende Temer após áudio JBS e pede fim da instabilidade política.', 'O Brasil não pode mudar de presidente toda semana. Temer deve cumprir o mandato.', 'Declaração pública em maio de 2017 em apoio a Temer durante crise da JBS.', 'verified', false, '2017-05-20', 'https://g1.globo.com/politica/noticia/sarney-defende-temer-apos-jbs.ghtml', 'news_article', 2, 'Residência - Brasília', 'Apoio a Temer', 'sarney-defende-temer-jbs-b97-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 19 Renan reforma política
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros defende fundo eleitoral bilionário como saída para corrupção.', 'Precisamos acabar com o financiamento empresarial. Sem o fundo público, a corrupção permanecerá.', 'Declaração em articulação de outubro de 2017 sobre fundo eleitoral.', 'verified', false, '2017-10-04', 'https://www12.senado.leg.br/noticias/materias/2017/10/04/renan-fundo-eleitoral', 'news_article', 2, 'Senado Federal', 'Articulação do fundo eleitoral', 'renan-fundo-eleitoral-b97-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20 Silas Câmara reforma
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara vota a favor da reforma trabalhista de Temer citando Deus.', 'Peço a Deus que guie o nosso voto. Vou votar a favor porque o Brasil precisa de oportunidades.', 'Discurso na Câmara antes da votação da reforma trabalhista em abril de 2017.', 'verified', false, '2017-04-26', 'https://g1.globo.com/politica/noticia/camara-aprova-reforma-trabalhista.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Votação reforma trabalhista', 'silas-voto-reforma-trabalhista-b97-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21 Jefferson apoio Bolsonaro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson declara apoio a Bolsonaro em 2018 e diz que é única alternativa contra o PT.', 'O Bolsonaro é a única alternativa para acabar com o PT. Vou me empenhar pela sua eleição.', 'Entrevista em agosto de 2018 declarando apoio ao candidato do PSL.', 'verified', false, '2018-08-22', 'https://www.conjur.com.br/2018-ago-22/jefferson-apoio-bolsonaro', 'news_article', 2, 'Rio de Janeiro', 'Entrevista apoio Bolsonaro', 'jefferson-apoio-bolsonaro-b97-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22 Collor Cuba
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor faz discurso no Senado atacando a esquerda e se aproximando de Bolsonaro.', 'A esquerda brasileira é a causa da crise moral e econômica do país.', 'Pronunciamento em 15 de agosto de 2018 no Senado Federal.', 'verified', false, '2018-08-15', 'https://www12.senado.leg.br/noticias/materias/2018/08/15/collor-ataca-esquerda', 'news_article', 2, 'Senado Federal', 'Pronunciamento no plenário', 'collor-ataca-esquerda-2018-b97-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23 Guedes fundos offshore 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Guedes é investigado por suspeita de desvio em fundos de pensão de estatais.', 'Estou sendo investigado por contratos que firmei em empresas minhas. É perseguição por eu apoiar Bolsonaro.', 'Declaração em 5 de outubro de 2018 sobre inquérito aberto pela PGR contra gestoras de Guedes.', 'verified', true, '2018-10-05', 'https://g1.globo.com/politica/eleicoes/2018/noticia/paulo-guedes-alvo-inquerito-pgr.ghtml', 'news_article', 4, 'Brasília', 'Reação a inquérito', 'guedes-inquerito-fundos-b97-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 24 Lira bolsonaro 2018
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Arthur Lira migra do Progressistas para apoio a Bolsonaro em 2018.', 'O Brasil virou a página. O Progressistas vai apoiar o novo presidente no que for bom para o povo.', 'Declaração em 28 de outubro de 2018 após vitória de Bolsonaro no segundo turno.', 'verified', false, '2018-10-28', 'https://g1.globo.com/politica/noticia/lira-pp-apoio-bolsonaro.ghtml', 'news_article', 2, 'Brasília', 'Movimentação pós-eleição', 'lira-apoio-bolsonaro-2018-b97-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25 Pacheco 2018
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco vota contra segunda denúncia de Temer em outubro de 2017.', 'Vou votar contra a denúncia. As provas são frágeis e o país precisa de estabilidade.', 'Voto nominal na sessão de 25 de outubro de 2017.', 'verified', false, '2017-10-25', 'https://www.camara.leg.br/noticias/pacheco-voto-contra-denuncia-temer', 'news_article', 2, 'Câmara dos Deputados', 'Votação segunda denúncia', 'pacheco-voto-contra-denuncia-b97-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 26 Feliciano satanismo nacional
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_feliciano, 'Feliciano afirma que religiões de matriz africana são seita do diabo em pregação.', 'As religiões afro são uma seita do diabo. Quem pratica está servindo ao mal.', 'Pregação em culto em 2016 gerou ação do Ministério Público por intolerância religiosa.', 'verified', true, '2016-06-02', 'https://www.cartacapital.com.br/politica/feliciano-ataca-religioes-afro/', 'news_article', 4, 'Culto evangélico', 'Pregação viralizada', 'feliciano-religioes-afro-diabo-b97-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_rac, false FROM ins;

  -- 27 Damares abuso
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_damares, 'Damares Alves em 2016 diz que vai transformar as igrejas na linha de frente contra ideologia de gênero.', 'A igreja tem que liderar a guerra cultural. A ideologia de gênero é o maior inimigo das crianças brasileiras.', 'Pregação em evento evangélico em Brasília em 2016.', 'verified', false, '2016-09-10', 'https://www.cartacapital.com.br/politica/damares-guerra-cultural-igreja/', 'news_article', 3, 'Brasília', 'Evento evangélico', 'damares-guerra-cultural-b97-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 28 Magno Malta preto
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_magno, 'Magno Malta minimiza racismo no Brasil em debate no Senado.', 'No Brasil não existe racismo. Isso é invenção da esquerda para dividir o povo.', 'Declaração em debate sobre cotas no Senado em março de 2016.', 'verified', false, '2016-03-22', 'https://www12.senado.leg.br/noticias/materias/2016/03/22/magno-malta-nao-ha-racismo', 'news_article', 4, 'Senado Federal', 'Debate sobre cotas', 'magno-nao-existe-racismo-b97-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 29 Freixo acusações milícia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Freixo acusa família Bolsonaro de ligações com milícias do Rio em CPI.', 'A família Bolsonaro tem relações históricas com milícias no Rio. Isso precisa ser investigado.', 'Discurso na Alerj em 25 de outubro de 2018.', 'verified', true, '2018-10-25', 'https://www.cartacapital.com.br/politica/freixo-familia-bolsonaro-milicia/', 'news_article', 2, 'Alerj', 'CPI das milícias', 'freixo-bolsonaro-milicia-b97-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 30 Chico Alencar Marielle
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar cobra na Câmara explicações sobre assassinato de Marielle Franco.', 'Marielle foi executada por defender direitos humanos. O Estado brasileiro tem responsabilidade.', 'Pronunciamento em 15 de março de 2018 no plenário da Câmara.', 'verified', false, '2018-03-15', 'https://www.camara.leg.br/noticias/chico-alencar-marielle', 'news_article', 1, 'Câmara dos Deputados', 'Homenagem a Marielle', 'chico-marielle-direitos-b97-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 31 Jandira impeachment
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali denuncia votação do impeachment como circo moralista na Câmara.', 'O que vimos aqui foi um circo de moralistas fingidos. Cadê o crime de Dilma? Não tem. Só tem machismo e golpe.', 'Pronunciamento após a votação do impeachment em 18 de abril de 2016.', 'verified', false, '2016-04-18', 'https://g1.globo.com/politica/processo-de-impeachment-de-dilma/noticia/2016/04/jandira-denuncia-circo-na-camara.html', 'news_article', 1, 'Câmara dos Deputados', 'Pós-votação impeachment', 'jandira-circo-moralista-b97-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 32 Lula STF prisão 2ª
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula afirma em 2018 que Moro terá que responder pelo que fez com ele.', 'Moro vai responder pelo que fez comigo. Ainda quero olhar nos olhos dele e cobrar.', 'Entrevista concedida da prisão em 2018, dois meses antes da campanha.', 'verified', false, '2018-07-09', 'https://www1.folha.uol.com.br/poder/2018/07/lula-moro-respondera.shtml', 'news_article', 2, 'Superintendência da PF Curitiba', 'Entrevista da prisão', 'lula-moro-respondera-b97-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33 Bolsonaro Hoje filho gay
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que quilombola não serve nem para procriar, reafirmando fala de 2017.', 'Ele não serve nem pra procriar. Não quero esses improdutivos em terras boas.', 'Reiteração em entrevista em 2018 durante campanha, reforçando fala da Hebraica.', 'verified', true, '2018-08-10', 'https://g1.globo.com/politica/eleicoes/2018/noticia/bolsonaro-reitera-ofensa-quilombolas.ghtml', 'news_article', 5, 'Entrevista campanha', 'Campanha eleitoral', 'bolsonaro-reitera-quilombola-b97-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 34 Dilma pré-impeachment
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma discursa em 8 de março e critica machismo nas ruas.', 'O que querem tirar não é só meu mandato. Querem tirar o protagonismo das mulheres na política brasileira.', 'Pronunciamento no Dia Internacional da Mulher em 8 de março de 2016.', 'verified', false, '2016-03-08', 'https://g1.globo.com/politica/noticia/2016/03/dilma-protagonismo-mulheres.html', 'news_article', 1, 'Palácio do Planalto', 'Dia da Mulher', 'dilma-8-marco-2016-b97-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 35 Temer diretas já
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_temer, 'Temer rejeita Diretas Já em 2017 e diz que eleição antecipada traria instabilidade.', 'Eleições antecipadas criam mais instabilidade. O mandato está garantido pela Constituição.', 'Pronunciamento em 20 de maio de 2017 em resposta ao movimento Diretas Já após JBS.', 'verified', false, '2017-05-20', 'https://g1.globo.com/politica/noticia/temer-rejeita-diretas-ja.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Resposta ao Diretas Já', 'temer-rejeita-diretas-ja-b97-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 36 Cunha livro prisão
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha lança livro da cadeia atacando a Lava Jato e Moro.', 'Moro agiu politicamente. A Lava Jato virou instrumento de uma agenda política. Meu livro expõe isso.', 'Lançamento do livro Tchau, querida em julho de 2017 a partir de Curitiba.', 'verified', false, '2017-07-25', 'https://www1.folha.uol.com.br/poder/2017/07/1903456-cunha-lanca-livro-atacando-moro.shtml', 'news_article', 3, 'Curitiba', 'Lançamento do livro', 'cunha-livro-tchau-querida-b97-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 37 Aecio família
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio Neves protege irmã Andrea Neves em delação da JBS.', 'Minha família não tem nada a ver com isso. Sou eu quem responderei pelas acusações.', 'Declaração em maio de 2017 após prisão de Andrea, coautora do pedido de R$ 2 milhões.', 'verified', false, '2017-05-22', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/aecio-defende-irma-andrea.ghtml', 'news_article', 3, 'Senado Federal', 'Reação à prisão da irmã', 'aecio-defende-irma-andrea-b97-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 38 Alckmin Alvorada
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin lança pré-candidatura e prevê derrotar Bolsonaro em segundo turno de 2018.', 'Eu vou para o segundo turno contra o PT. O Bolsonaro é um candidato de conjuntura.', 'Coletiva de imprensa em abril de 2018 ao lançar pré-candidatura.', 'verified', false, '2018-04-22', 'https://g1.globo.com/politica/noticia/alckmin-lanca-pre-candidatura.ghtml', 'news_article', 1, 'PSDB', 'Lançamento pré-candidatura', 'alckmin-segundo-turno-b97-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39 Jair cassar urna
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca urna eletrônica em 2018 sem provas e sugere fraude.', 'Se não for com voto impresso, vamos ter fraude. A urna eletrônica não é confiável.', 'Entrevista em março de 2018 repetindo tese sem base técnica.', 'verified', true, '2018-03-01', 'https://g1.globo.com/politica/noticia/2018/03/bolsonaro-ataca-urna-eletronica.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-ataca-urna-2018-b97-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 40 Edu futuro eua
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro reativa gesto Steve Bannon em aliança internacional em 2018.', 'Vamos trazer Bannon para o Brasil. A direita global precisa unir forças.', 'Publicação em rede social após encontro com Bannon em agosto de 2018.', 'verified', false, '2018-08-13', 'https://www1.folha.uol.com.br/mundo/2018/08/eduardo-bolsonaro-encontra-bannon.shtml', 'news_article', 3, 'Nova York', 'Encontro com Bannon', 'eduardo-bannon-aliança-b97-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 41 Flavio Queiroz rachadinha
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro minimiza R$ 1,2 milhão movimentado por Queiroz.', 'Não é rachadinha. Queiroz cuidava dos meus negócios privados. Tudo legal.', 'Entrevista em dezembro de 2018 após relatório do Coaf revelar movimentações.', 'verified', true, '2018-12-09', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/flavio-queiroz-rachadinha-coaf.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Revelação do Coaf', 'flavio-queiroz-minimiza-b97-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 42 Gleisi sobre golpe
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann lidera PT em protestos contra impeachment de Dilma.', 'Este impeachment é um golpe. Vamos resistir nas ruas e no Congresso.', 'Discurso em comício em São Paulo em 18 de março de 2016 durante protestos pró-Dilma.', 'verified', false, '2016-03-18', 'https://g1.globo.com/politica/processo-de-impeachment-de-dilma/noticia/2016/03/gleisi-discursa-em-ato-pro-dilma.html', 'news_article', 1, 'São Paulo', 'Ato pró-Dilma', 'gleisi-resistir-golpe-b97-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 43 Moro Odebrecht
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro critica decisão do STF de enviar delação da Odebrecht para outras instâncias.', 'Dividir a Lava Jato vai enfraquecer o combate à corrupção. É decisão equivocada.', 'Entrevista em março de 2017 após STF distribuir partes da delação.', 'verified', false, '2017-03-14', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/moro-critica-decisao-stf-odebrecht.ghtml', 'news_article', 3, 'Curitiba', 'Entrevista sobre delação Odebrecht', 'moro-critica-stf-odebrecht-b97-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44 Ciro 2018 lula
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes pede ao PT que aceite perder no primeiro turno para enfrentar Bolsonaro juntos.', 'Se o PT não ceder, Bolsonaro ganha. O PT está entregando o Brasil ao fascismo.', 'Entrevista em 10 de outubro de 2018 entre primeiro e segundo turno.', 'verified', false, '2018-10-10', 'https://www1.folha.uol.com.br/poder/2018/10/ciro-critica-pt-segundo-turno.shtml', 'news_article', 2, 'Brasília', 'Entrevista entre turnos', 'ciro-pt-ceder-turnos-b97-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45 Haddad WhatsApp TSE
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad recorre ao TSE pedindo cassação de Bolsonaro por disparos em massa.', 'Os disparos em massa configuram abuso de poder econômico. Pedimos a cassação.', 'Coletiva em 19 de outubro de 2018 anunciando ação no TSE.', 'verified', false, '2018-10-19', 'https://g1.globo.com/politica/eleicoes/2018/noticia/haddad-acao-tse-whatsapp.ghtml', 'news_article', 2, 'Brasília', 'Ação no TSE', 'haddad-acao-tse-whatsapp-b97-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46 Serra delator em 2017
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra é alvo de busca da PF em operação desdobramento da Lava Jato em 2017.', 'Continuo colaborando com a justiça. Não há nada ilegal em minha conduta.', 'Declaração em 5 de julho de 2017 após operação da PF em sua casa.', 'verified', false, '2017-07-05', 'https://www1.folha.uol.com.br/poder/2017/07/1899873-pf-faz-busca-em-residencia-de-jose-serra.shtml', 'news_article', 3, 'São Paulo', 'Operação da PF', 'serra-busca-pf-2017-b97-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 47 Marta apoio Haddad
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy no 2º turno de 2018 declara apoio a Haddad contra Bolsonaro.', 'Não posso ficar calada diante do fascismo. Meu voto é Haddad.', 'Declaração em 10 de outubro de 2018 rompendo com o MDB.', 'verified', false, '2018-10-10', 'https://g1.globo.com/politica/eleicoes/2018/noticia/marta-suplicy-apoia-haddad.ghtml', 'news_article', 2, 'São Paulo', 'Declaração de apoio a Haddad', 'marta-apoio-haddad-b97-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 48 Maluf cadeia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf defende família e diz que filho Flávio não é testa de ferro.', 'Meu filho Flávio é homem honesto. Essas acusações contra ele são mentirosas.', 'Entrevista em janeiro de 2018 após denúncia contra a família por lavagem.', 'verified', false, '2018-01-25', 'https://g1.globo.com/sp/sao-paulo/noticia/maluf-defende-filho-flavio.ghtml', 'news_article', 2, 'São Paulo', 'Defesa da família', 'maluf-defende-flavio-b97-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 49 Sarney Lula
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney defende Lula após decretação da prisão e critica seletividade da Lava Jato.', 'A prisão do Lula é um erro histórico. O Brasil está polarizado por causa da Lava Jato.', 'Declaração em 5 de abril de 2018 após o TRF-4 manter a condenação de Lula.', 'verified', false, '2018-04-05', 'https://www1.folha.uol.com.br/poder/2018/04/sarney-defende-lula-prisao.shtml', 'news_article', 2, 'Brasília', 'Reação à prisão de Lula', 'sarney-defende-lula-b97-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50 Renan fio do bigode
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros recebe apelidos no Senado após sucessivas denúncias.', 'Não sou bandido. Tenho 40 anos de vida pública e respondo a processos políticos há décadas.', 'Pronunciamento no Senado em março de 2017 após ser denunciado pela PGR na Lava Jato.', 'verified', false, '2017-03-10', 'https://www12.senado.leg.br/noticias/materias/2017/03/10/renan-defende-se-no-plenario', 'news_article', 3, 'Senado Federal', 'Defesa no plenário', 'renan-nao-sou-bandido-b97-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 51 Silas Suframa
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara é acusado de beneficiar parentes com empregos na Câmara dos Deputados.', 'Contratei profissionais competentes. Relação familiar não impede contratação no serviço público.', 'Declaração em setembro de 2017 após reportagem sobre parentes em gabinetes.', 'verified', false, '2017-09-22', 'https://g1.globo.com/am/amazonas/noticia/silas-camara-nepotismo.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Resposta a reportagem', 'silas-camara-nepotismo-b97-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 52 Jefferson Lava Jato
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson elogia Moro e pede prisão ampla de petistas em 2017.', 'Moro tem que prender esses petistas todos. O Brasil precisa da Lava Jato para se limpar.', 'Entrevista em outubro de 2017 ao Brasil Urgente da Band.', 'verified', false, '2017-10-11', 'https://www.band.uol.com.br/noticias/politica/roberto-jefferson-elogia-moro/', 'news_article', 2, 'Band', 'Brasil Urgente', 'jefferson-elogia-moro-b97-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53 Collor PSB renova
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor denuncia no Senado suposta perseguição política contra si após 27 anos de impeachment.', 'Sou perseguido há décadas. Há uma operação permanente para destruir minha honra.', 'Pronunciamento no Senado em 22 de setembro de 2017.', 'verified', false, '2017-09-22', 'https://www12.senado.leg.br/noticias/materias/2017/09/22/collor-perseguicao-politica', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'collor-perseguicao-senado-b97-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 54 Guedes super Ministério
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Guedes anuncia criação do superministério da Economia se Bolsonaro vencer.', 'Vamos criar um superministério da Economia. Menos burocracia, mais eficiência.', 'Entrevista em julho de 2018 antecipando a estrutura do futuro governo.', 'verified', false, '2018-07-25', 'https://valor.globo.com/politica/noticia/2018/07/25/guedes-superministerio-economia.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista Valor', 'guedes-superministerio-b97-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55 Lira propina delação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Arthur Lira é apontado em delação da Odebrecht e nega recebimento de propina.', 'Nunca recebi propina de empresa alguma. As delações não passam de ilações de criminosos.', 'Declaração em abril de 2017 após lista de denunciados da Odebrecht.', 'verified', false, '2017-04-14', 'https://g1.globo.com/politica/operacao-lava-jato/noticia/lira-nega-propina-odebrecht.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Reação à delação', 'lira-nega-odebrecht-b97-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 56 Pacheco PSL
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco defende renovação política e tira distância de bolsonarismo em 2018.', 'O Brasil precisa de renovação, mas sem extremismos. O centro democrático precisa se firmar.', 'Entrevista em novembro de 2018 já em articulação para presidência do Senado.', 'verified', false, '2018-11-20', 'https://www.em.com.br/app/noticia/politica/2018/11/20/rodrigo-pacheco-renovacao-politica.shtml', 'news_article', 1, 'Belo Horizonte', 'Entrevista Estado de Minas', 'pacheco-renovacao-politica-b97-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57 Feliciano ataca Marielle
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_feliciano, 'Feliciano relativiza assassinato de Marielle Franco em postagem em rede social.', 'Infelizmente violência acontece. Não vamos transformar bandidos em heróis por conta de narrativas.', 'Postagem em 16 de março de 2018, um dia após o assassinato.', 'verified', true, '2018-03-16', 'https://www.cartacapital.com.br/politica/feliciano-ataca-marielle-postagem/', 'news_article', 4, 'Twitter', 'Postagem sobre Marielle', 'feliciano-relativiza-marielle-b97-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 58 Damares menina
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_damares, 'Damares Alves defende caso polêmico em que teria sido tutora de menina indígena.', 'Sou mãe de coração de uma indígena. Resgatei uma criança das mãos da morte.', 'Entrevista em julho de 2018, caso que depois geraria questionamentos judiciais.', 'verified', false, '2018-07-22', 'https://www1.folha.uol.com.br/cotidiano/2018/07/damares-alves-menina-indigena.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'damares-tutela-indigena-b97-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 59 Magno Marielle
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_magno, 'Magno Malta ataca Marielle Franco ao defender miliciano após o assassinato.', 'A esquerda está transformando a morte dela em show. Existem brasileiros morrendo todos os dias.', 'Pronunciamento no Senado em 20 de março de 2018 após o assassinato de Marielle.', 'verified', true, '2018-03-20', 'https://www12.senado.leg.br/noticias/materias/2018/03/20/magno-malta-marielle', 'news_article', 4, 'Senado Federal', 'Pronunciamento sobre Marielle', 'magno-ataca-marielle-b97-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 60 Freixo ameaças
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Freixo relata ameaças de morte e mudança forçada de domicílio no Rio de Janeiro.', 'Vivo com escolta 24 horas. Já recebi várias ameaças de milicianos por minhas denúncias.', 'Entrevista em abril de 2018 após o assassinato de Marielle Franco.', 'verified', false, '2018-04-20', 'https://www.bbc.com/portuguese/brasil-43840145', 'news_article', 1, 'Rio de Janeiro', 'Entrevista BBC', 'freixo-ameacas-milicia-b97-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 61 Jandira impeachment mulher
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali lidera frente de mulheres contra o afastamento de Dilma no Senado.', 'Mulheres do Brasil estão sendo humilhadas com esse processo. É misoginia institucionalizada.', 'Ato em 11 de maio de 2016 no Senado antes do afastamento de Dilma.', 'verified', false, '2016-05-11', 'https://www.cartacapital.com.br/politica/jandira-mulheres-senado/', 'news_article', 2, 'Senado Federal', 'Ato pró-Dilma', 'jandira-mulheres-senado-b97-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 62 Chico denuncia fundo
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar denuncia aumento bilionário do fundão eleitoral para 2018.', 'É um absurdo criar fundo bilionário enquanto o Brasil passa fome. O Congresso não tem vergonha.', 'Pronunciamento em outubro de 2017 contra a criação do Fundo Especial de Financiamento de Campanha.', 'verified', false, '2017-10-04', 'https://www.camara.leg.br/noticias/chico-alencar-fundao', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento sobre fundão', 'chico-alencar-denuncia-fundao-b97-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63 Bolsonaro pastor
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é batizado no rio Jordão em tentativa de captura do voto evangélico.', 'Renovo meu compromisso com Deus, com a família e com o Brasil. Vou governar com valores cristãos.', 'Cerimônia em maio de 2016 em Israel no rio Jordão, parte de movimento para conquistar evangélicos.', 'verified', false, '2016-05-12', 'https://www1.folha.uol.com.br/poder/2016/05/1770289-bolsonaro-e-batizado-no-rio-jordao-em-israel.shtml', 'news_article', 2, 'Rio Jordão - Israel', 'Batismo', 'bolsonaro-batismo-jordao-b97-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 64 Bolsonaro condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é condenado pelo STF a pagar indenização a Maria do Rosário por danos morais.', 'Vou recorrer. Essa condenação é um absurdo. A deputada me atacou primeiro.', 'Reação em setembro de 2017 à condenação pelo STF por ofensas a Maria do Rosário.', 'verified', false, '2017-09-12', 'https://g1.globo.com/politica/noticia/stf-bolsonaro-condenado-maria-rosario.ghtml', 'news_article', 3, 'STF', 'Condenação por danos morais', 'bolsonaro-condenado-rosario-2017-b97-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 65 Lula livro denuncia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula relança autobiografia com capítulo sobre perseguição política em 2018.', 'A história vai me absolver. Minha trajetória não será apagada por juízes parciais.', 'Lançamento do livro A Verdade Vencerá em abril de 2018 pouco antes da prisão.', 'verified', false, '2018-04-01', 'https://www1.folha.uol.com.br/ilustrada/2018/04/lula-lanca-a-verdade-vencera.shtml', 'news_article', 1, 'São Paulo', 'Lançamento do livro', 'lula-a-verdade-vencera-b97-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66 Dilma comove Paris
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma é homenageada na Sorbonne e denuncia retrocesso democrático no Brasil.', 'O que aconteceu comigo foi o início de uma onda autoritária que agora ameaça o continente.', 'Conferência na Sorbonne em 2017.', 'verified', false, '2017-03-24', 'https://brasil.elpais.com/brasil/2017/03/24/internacional/dilma-sorbonne-retrocesso.html', 'news_article', 1, 'Sorbonne - Paris', 'Conferência', 'dilma-sorbonne-retrocesso-b97-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 67 Temer PGR denuncia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_temer, 'Temer rebate primeira denúncia por corrupção passiva e acusa Janot de perseguição.', 'O procurador-geral fez uma peça de ficção. Vou provar minha inocência.', 'Pronunciamento em 26 de junho de 2017 após primeira denúncia da PGR.', 'verified', false, '2017-06-26', 'https://g1.globo.com/politica/noticia/temer-rebate-primeira-denuncia-pgr.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Resposta à primeira denúncia', 'temer-rebate-denuncia-janot-b97-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 68 Cunha Woodstock
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha cria PL para restringir Bolsa Família durante crise de impeachment.', 'O Bolsa Família virou cabresto eleitoral do PT. Precisamos pôr regras claras.', 'Discurso no plenário em novembro de 2015 defendendo endurecimento de regras do Bolsa Família.', 'verified', false, '2015-11-11', 'https://g1.globo.com/politica/noticia/2015/11/cunha-defende-mudancas-bolsa-familia.html', 'news_article', 2, 'Câmara dos Deputados', 'Discurso sobre Bolsa Família', 'cunha-bolsa-familia-b97-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69 Aecio rola
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio Neves se reelege deputado federal em 2018 e comemora volta à política.', 'Minas Gerais me acolheu. Voltarei ao Congresso para defender meu estado e o Brasil.', 'Declaração em 7 de outubro de 2018 após eleição para deputado federal.', 'verified', false, '2018-10-07', 'https://g1.globo.com/mg/minas-gerais/eleicoes/2018/noticia/aecio-eleito-deputado-federal.ghtml', 'news_article', 2, 'Belo Horizonte', 'Eleição 2018', 'aecio-eleito-deputado-b97-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70 Alckmin reforma
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin defende reforma da previdência de Temer como essencial.', 'Sem reforma da previdência, o Brasil quebra. É necessário aprovar ainda este ano.', 'Declaração em dezembro de 2017 defendendo votação da PEC.', 'verified', false, '2017-12-05', 'https://g1.globo.com/politica/noticia/alckmin-defende-reforma-previdencia.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista', 'alckmin-defende-previdencia-b97-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71 Edu cabo STF
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro é gravado em evento defendendo intervenção militar.', 'Se a esquerda radicalizar, as Forças Armadas terão papel. É essa a mensagem.', 'Palestra em evento estudantil em 2018 em São Paulo.', 'verified', false, '2018-05-27', 'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-intervencao-militar-evento/', 'news_article', 4, 'São Paulo', 'Palestra estudantil', 'eduardo-intervencao-militar-b97-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 72 Flavio Alerj
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro vota pela aprovação de reforma previdência municipal no Rio em 2017.', 'A previdência quebrou. Precisamos reformar para garantir pagamento a quem trabalha.', 'Votação na Alerj em 2017.', 'verified', false, '2017-11-08', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/flavio-vota-reforma-previdencia-rj.ghtml', 'news_article', 1, 'Alerj', 'Votação reforma RJ', 'flavio-reforma-rj-b97-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73 Gleisi 2018 prisão Lula
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi lidera vigília em frente à PF em Curitiba durante prisão de Lula.', 'Lula livre é nosso lema. Não vamos sair daqui enquanto ele estiver preso injustamente.', 'Vigília iniciada em 7 de abril de 2018, mantida por 580 dias.', 'verified', true, '2018-04-07', 'https://g1.globo.com/pr/parana/noticia/pt-vigilia-frente-pf-curitiba-lula.ghtml', 'news_article', 1, 'Curitiba', 'Vigília Lula Livre', 'gleisi-vigilia-lula-b97-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 74 Moro Globo
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro concede entrevista exclusiva à Globo dias após aceitar ministério de Bolsonaro.', 'Aceitei o desafio de combater a corrupção no Executivo. Continuo um juiz servindo ao país.', 'Entrevista ao Jornal Nacional em 5 de novembro de 2018.', 'verified', true, '2018-11-05', 'https://g1.globo.com/jornal-nacional/noticia/2018/11/05/entrevista-com-sergio-moro.ghtml', 'news_article', 4, 'Rede Globo', 'Jornal Nacional', 'moro-entrevista-jn-b97-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 75 Ciro Xinguara
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes se irrita com jornalista em entrevista e xinga a correspondente.', 'Você é uma imbecil. Me pergunte coisa séria, não essa bobagem de campanha.', 'Entrevista em Belém em setembro de 2018.', 'verified', false, '2018-09-24', 'https://g1.globo.com/politica/eleicoes/2018/noticia/ciro-xinga-jornalista-belem.ghtml', 'news_article', 2, 'Belém', 'Entrevista coletiva', 'ciro-xinga-jornalista-b97-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 76 Haddad debate band
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica ausência de Bolsonaro em debates no segundo turno.', 'Bolsonaro foge do debate porque tem medo. Não tem proposta, só ódio.', 'Declaração em 18 de outubro de 2018 ao confirmar novo debate sem Bolsonaro.', 'verified', false, '2018-10-18', 'https://g1.globo.com/politica/eleicoes/2018/noticia/haddad-critica-ausencia-bolsonaro-debate.ghtml', 'news_article', 1, 'São Paulo', 'Coletiva debate', 'haddad-bolsonaro-foge-debate-b97-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77 Serra TRF
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra é denunciado por lavagem de dinheiro no Lava Jato em 2017.', 'Sou vítima de calúnias. Nunca lavei um centavo. Essas acusações são vergonhosas.', 'Declaração em 20 de dezembro de 2017 após denúncia.', 'verified', false, '2017-12-20', 'https://www1.folha.uol.com.br/poder/2017/12/1945823-serra-denunciado-lavagem.shtml', 'news_article', 3, 'São Paulo', 'Denúncia por lavagem', 'serra-denunciado-lavagem-b97-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 78 Marta governo Doria
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy é nomeada secretária na gestão Doria em São Paulo.', 'Aceito o convite para servir a cidade que tanto amo. Vamos trabalhar por uma São Paulo melhor.', 'Posse na Secretaria de Relações Internacionais em janeiro de 2017.', 'verified', false, '2017-01-02', 'https://g1.globo.com/sao-paulo/noticia/2017/01/marta-suplicy-secretaria-doria.html', 'news_article', 1, 'Prefeitura de SP', 'Posse secretaria', 'marta-secretaria-doria-b97-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79 Maluf cassado senador
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Paulo Maluf é detido em casa após determinação do STF em dezembro de 2017.', 'Protestei, mas vou acatar a decisão. Continuarei lutando pela minha liberdade.', 'Declaração antes da prisão em 20 de dezembro de 2017.', 'verified', true, '2017-12-20', 'https://g1.globo.com/sp/sao-paulo/noticia/maluf-e-preso-por-ordem-do-stf.ghtml', 'news_article', 3, 'São Paulo', 'Prisão determinada pelo STF', 'maluf-preso-stf-2017-b97-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 80 Sarney Dilma
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney diz em 2016 que Dilma perdeu capacidade de governar e apoia saída de Temer.', 'Dilma não tem mais condições de governar. Temer é alternativa institucional legítima.', 'Entrevista concedida ao Estadão em março de 2016.', 'verified', false, '2016-03-20', 'https://politica.estadao.com.br/noticias/geral,sarney-diz-que-dilma-nao-governa-mais,1849512', 'news_article', 2, 'Brasília', 'Entrevista Estadão', 'sarney-dilma-nao-governa-b97-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81 Renan senador 2018
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros é reeleito senador de Alagoas em 2018 e ironiza adversários.', 'Minas acaba e rios secam, mas Renan em Alagoas é eterno. Obrigado, meu povo.', 'Declaração em 7 de outubro de 2018 após reeleição como senador.', 'verified', false, '2018-10-07', 'https://g1.globo.com/al/alagoas/eleicoes/2018/noticia/renan-reeleito-senador-alagoas.ghtml', 'news_article', 2, 'Maceió', 'Reeleição ao Senado', 'renan-reeleito-senador-2018-b97-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82 Silas câmara apoio Bolsonaro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara mobiliza bancada evangélica a favor de Bolsonaro no 2º turno.', 'Os evangélicos escolheram. Bolsonaro representa nossos valores e nossa fé.', 'Declaração em 20 de outubro de 2018 pelas redes sociais.', 'verified', false, '2018-10-20', 'https://www.poder360.com.br/eleicoes/evangelicos-declaram-apoio-a-bolsonaro', 'news_article', 2, 'Brasília', 'Apoio de bancada evangélica', 'silas-evangelicos-bolsonaro-b97-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83 Jefferson PMDB sarcasmo
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson fala em acabar com o PT em comício em 2018.', 'Vamos acabar com o PT, com tudo o que é socialismo no Brasil. Essa praga tem que ir embora.', 'Discurso em ato pró-Bolsonaro em outubro de 2018 no Rio.', 'verified', false, '2018-10-14', 'https://www.cartacapital.com.br/politica/jefferson-acabar-pt-2018/', 'news_article', 3, 'Rio de Janeiro', 'Ato pró-Bolsonaro', 'jefferson-acabar-pt-b97-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 84 Collor fórum 2018
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor é reeleito senador em 2018 com votação apertada em Alagoas.', 'Minha eleição prova que o povo alagoano acredita em mim. Vou continuar trabalhando pelo estado.', 'Declaração em 8 de outubro de 2018 após reeleição.', 'verified', false, '2018-10-08', 'https://g1.globo.com/al/alagoas/eleicoes/2018/noticia/collor-reeleito-senador-alagoas.ghtml', 'news_article', 1, 'Maceió', 'Reeleição 2018', 'collor-reeleito-2018-b97-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85 Guedes BTG
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Guedes defende fim de ministérios no governo Bolsonaro.', 'Vamos reduzir o número de ministérios. O Estado inchado é herança do PT.', 'Entrevista em outubro de 2018 durante transição.', 'verified', false, '2018-10-31', 'https://www.reuters.com/article/brasil-guedes-ministerios-idBRKCN1N5225', 'news_article', 2, 'São Paulo', 'Entrevista transição', 'guedes-reduzir-ministerios-b97-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86 Lira presidência câmara
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Arthur Lira articula Progressistas como peça do novo centrão bolsonarista.', 'O PP é parte da nova maioria. Vamos garantir governabilidade ao presidente eleito.', 'Declaração em novembro de 2018 logo após eleição de Bolsonaro.', 'verified', false, '2018-11-15', 'https://g1.globo.com/politica/noticia/lira-articula-pp-centrao-bolsonaro.ghtml', 'news_article', 2, 'Brasília', 'Articulação centrão', 'lira-pp-centrao-b97-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87 Pacheco 2018 MDB
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco é reeleito deputado em 2018 e negocia apoio ao governo Bolsonaro.', 'Estarei disponível para ajudar o governo eleito. É hora de colocar o país em primeiro lugar.', 'Declaração em 12 de novembro de 2018 após negociação em Brasília.', 'verified', false, '2018-11-12', 'https://www.em.com.br/app/noticia/politica/2018/11/12/pacheco-apoio-bolsonaro.shtml', 'news_article', 1, 'Belo Horizonte', 'Negociação transição', 'pacheco-apoio-bolsonaro-b97-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88 Feliciano ato contra lula
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_feliciano, 'Feliciano participa de ato pró-impeachment em 2016 e compara Dilma a diabo.', 'Dilma é a incorporação do mal. O Brasil está possuído. Só a oração nos salva.', 'Ato da Paulista em 13 de março de 2016.', 'verified', true, '2016-03-13', 'https://www.cartacapital.com.br/politica/feliciano-compara-dilma-ao-diabo/', 'news_article', 4, 'Avenida Paulista', 'Ato pró-impeachment', 'feliciano-dilma-diabo-b97-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_des, false FROM ins UNION ALL SELECT id, c_mis, false FROM ins;

  -- 89 Damares Bolsonaro 2018
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_damares, 'Damares prega pela eleição de Bolsonaro em culto às vésperas do 2º turno.', 'Deus me disse que Bolsonaro é o escolhido para libertar o Brasil da escuridão.', 'Pregação em igreja em Brasília em 25 de outubro de 2018.', 'verified', true, '2018-10-25', 'https://www.cartacapital.com.br/politica/damares-diz-que-deus-escolheu-bolsonaro/', 'news_article', 4, 'Brasília', 'Culto pré-eleição', 'damares-deus-bolsonaro-b97-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 90 Magno cpi abusos
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_magno, 'Magno Malta faz campanha em 2018 com Bolsonaro e prega segurança pública armada.', 'O povo precisa de armas para se defender. Vamos acabar com o desarmamento.', 'Comício com Bolsonaro em Vitória em 14 de setembro de 2018.', 'verified', false, '2018-09-14', 'https://www.gazetaonline.com.br/noticias/politica/magno-malta-bolsonaro-comicio-vitoria.html', 'news_article', 3, 'Vitória - ES', 'Comício', 'magno-armas-comicio-b97-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 91 Freixo deputado
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Freixo é reeleito em 2018 e alerta para cenário de perseguição na nova legislatura.', 'Vamos resistir. O que vem por aí é ataque à democracia e aos direitos humanos.', 'Declaração em 7 de outubro de 2018 após reeleição para a Alerj.', 'verified', false, '2018-10-07', 'https://g1.globo.com/rj/rio-de-janeiro/eleicoes/2018/noticia/freixo-reeleito-alerj.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Reeleição Alerj', 'freixo-reeleito-alerj-b97-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 92 Chico Alencar PSOL
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar não se reelege em 2018 e denuncia avanço do bolsonarismo.', 'Perdemos em número, mas não em convicções. A luta continua fora do Parlamento.', 'Declaração em 8 de outubro de 2018 após não se reeleger.', 'verified', false, '2018-10-08', 'https://g1.globo.com/rj/rio-de-janeiro/eleicoes/2018/noticia/chico-alencar-nao-reeleito.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Pós-eleição', 'chico-alencar-nao-reeleito-b97-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93 Jandira Venezuela
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali defende Venezuela em pronunciamento de 2017 contrariando política externa de Temer.', 'A Venezuela é alvo de cerco imperialista. O Brasil deveria apoiar a soberania e não se alinhar aos EUA.', 'Pronunciamento em agosto de 2017 na Câmara dos Deputados.', 'verified', false, '2017-08-04', 'https://www.camara.leg.br/noticias/jandira-venezuela-soberania', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-venezuela-soberania-b97-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94 Dilma aniversário
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma Rousseff, em pronunciamento, diz que Moro mandou Bolsonaro em lugar de justiça.', 'Moro mandou Bolsonaro em vez de mandar justiça. Isso mostra o que foi a Lava Jato.', 'Declaração em novembro de 2018 após Moro aceitar ministério de Bolsonaro.', 'verified', false, '2018-11-02', 'https://www.cartacapital.com.br/politica/dilma-critica-moro-bolsonaro/', 'news_article', 2, 'Porto Alegre', 'Entrevista', 'dilma-moro-bolsonaro-b97-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95 Temer fim de mandato
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_temer, 'Temer despede-se do governo em pronunciamento e diz ter cumprido missão.', 'Recebi um país destruído e entrego um país em recuperação. Cumpri minha missão com patriotismo.', 'Pronunciamento de fim de ano em dezembro de 2018.', 'verified', false, '2018-12-19', 'https://g1.globo.com/politica/noticia/temer-pronunciamento-fim-governo.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Pronunciamento de despedida', 'temer-despedida-governo-b97-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96 Cunha em Curitiba
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha é condenado a 15 anos pela Lava Jato e reage de dentro da prisão em 2017.', 'Essa condenação é leviana. Estou preso por fazer política. Vão pagar caro pelo que fizeram.', 'Reação em março de 2017 à sentença de 15 anos proferida por Moro.', 'verified', true, '2017-03-30', 'https://g1.globo.com/pr/parana/noticia/moro-condena-cunha-a-15-anos.ghtml', 'news_article', 4, 'Curitiba', 'Condenação pela Lava Jato', 'cunha-condenado-15-anos-b97-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 97 Lula candidato TSE
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula é barrado pelo TSE em 2018 com base na Ficha Limpa e reage com carta.', 'Estou proibido de ser candidato, mas não de ter esperança. Haddad é o meu nome agora.', 'Carta divulgada em 11 de setembro de 2018 após decisão do TSE.', 'verified', true, '2018-09-11', 'https://g1.globo.com/politica/eleicoes/2018/noticia/2018/09/11/lula-carta-apos-tse.ghtml', 'news_article', 2, 'Curitiba', 'Carta após impedimento', 'lula-carta-haddad-meu-nome-b97-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98 Bolsonaro STF condenacao Rosario 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reativa ataque a Maria do Rosário na campanha de 2018.', 'Aquilo no Congresso foi leve. Me poupem. Ela está com mágoa porque não foi estuprada.', 'Entrevista no calor da campanha em outubro de 2018.', 'verified', true, '2018-10-02', 'https://www.cartacapital.com.br/politica/bolsonaro-reativa-ataque-a-maria-do-rosario/', 'news_article', 5, 'Entrevista campanha', 'Campanha 2018', 'bolsonaro-reativa-rosario-2018-b97-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 99 Aecio filho
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio tenta blindagem pelo STF e pede para que não seja preso em 2017.', 'Tenho foro privilegiado. Qualquer decisão de juiz de primeiro grau contra mim é nula.', 'Declaração em 17 de maio de 2017 após vazamento dos áudios.', 'verified', false, '2017-05-17', 'https://www12.senado.leg.br/noticias/materias/2017/05/17/aecio-invoca-foro-privilegiado', 'news_article', 3, 'Senado Federal', 'Defesa judicial', 'aecio-foro-privilegiado-b97-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100 Temer decreto Rio GLO
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_temer, 'Temer assina decreto de intervenção federal na segurança pública do Rio em 2018.', 'Estamos dando os meios necessários para combater o crime organizado. A intervenção é pela paz.', 'Cerimônia em 16 de fevereiro de 2018 no Palácio do Planalto.', 'verified', true, '2018-02-16', 'https://g1.globo.com/politica/noticia/temer-assina-decreto-intervencao-rio.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Decreto de intervenção federal', 'temer-intervencao-rio-b97-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

END $$;
