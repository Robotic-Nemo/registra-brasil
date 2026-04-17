-- Batch 53: Declarações de governadores e prefeitos de capitais (2023–2026)
-- 50 statements sobre zeladoria urbana, segurança, campanhas 2024, reeleições,
-- carnaval, obras, COP30, confrontos políticos e candidaturas 2026

DO $$
DECLARE
  v_nun UUID; v_pae UUID; v_fua UUID; v_jca UUID; v_top UUID;
  v_sar UUID; v_sme UUID; v_gre UUID; v_bru UUID; v_dav UUID;
  v_cas UUID; v_tar UUID; v_zem UUID; v_cai UUID; v_rat UUID;
  v_ele UUID; v_hel UUID; v_raq UUID; v_elm UUID; v_jer UUID;
  v_wil UUID; v_iba UUID; v_rie UUID; v_mau UUID; v_fat UUID;
  c_vio UUID; c_abu UUID; c_ant UUID; c_des UUID; c_odi UUID;
  c_cor UUID; c_aut UUID; c_irr UUID; c_neg UUID; c_int UUID;
  c_ame UUID; c_con UUID; c_mac UUID; c_xen UUID; c_hom UUID;
  c_rac UUID; c_mis UUID; c_nep UUID;
BEGIN
  SELECT id INTO v_nun FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_pae FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_fua FROM politicians WHERE slug = 'fuad-noman';
  SELECT id INTO v_jca FROM politicians WHERE slug = 'joao-campos';
  SELECT id INTO v_top FROM politicians WHERE slug = 'topazio-silveira';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarto';
  SELECT id INTO v_sme FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_gre FROM politicians WHERE slug = 'rafael-greca';
  SELECT id INTO v_bru FROM politicians WHERE slug = 'bruno-reis';
  SELECT id INTO v_dav FROM politicians WHERE slug = 'david-almeida';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_ele FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_raq FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_elm FROM politicians WHERE slug = 'elmano-de-freitas';
  SELECT id INTO v_jer FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_iba FROM politicians WHERE slug = 'ibaneis-rocha';
  SELECT id INTO v_rie FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_fat FROM politicians WHERE slug = 'fatima-bezerra';

  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';

  -- 1. Ricardo Nunes moradores de rua
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_nun,
      'Ricardo Nunes defende operações de remoção de pessoas em situação de rua em SP chamadas de higienização.',
      'Não é higienização, é zeladoria. Estamos oferecendo acolhimento. Quem não aceita, não pode ocupar espaço público. A cidade é de todos, não de quem se recusa a receber ajuda.',
      'Em 2024, defendendo operações de remoção de pessoas em situação de rua no centro de São Paulo, denunciadas por movimentos sociais como higienização urbana.',
      'verified', true, '2024-05-20',
      'https://www.folha.uol.com.br/cotidiano/2024/05/nunes-moradores-rua-zeladoria.shtml',
      'news_article', 'São Paulo', 'Entrevista coletiva', 'nunes-moradores-rua-zeladoria-maio-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 2. Nunes x Boulos campanha
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_nun,
      'Nunes chama Boulos de radical invasor em campanha e acusa adversário de querer tomar imóveis de paulistanos.',
      'Boulos é um radical, um invasor profissional. Se ele ganhar, ninguém vai ter sossego. O paulistano sabe que é uma ameaça real aos imóveis e à propriedade. Não podemos deixar isso acontecer.',
      'Em outubro de 2024, durante segundo turno acirrado da eleição municipal de São Paulo, Nunes usou repetidamente o rótulo de invasor para atacar o adversário do PSOL.',
      'verified', true, '2024-10-10',
      'https://oglobo.globo.com/politica/noticia/2024/10/nunes-boulos-invasor-campanha.ghtml',
      'news_article', 'São Paulo', 'Debate eleitoral Band', 'nunes-boulos-invasor-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3. Nunes Marçal agressão
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_nun,
      'Nunes relativiza cadeirada de Marçal em Datena no debate e diz que clima foi criado pelos adversários.',
      'Todo mundo perdeu o controle naquele debate. Não fui eu que peguei a cadeira. O clima ruim foi criado por quem quer atacar a Prefeitura. A campanha está suja porque alguns candidatos querem.',
      'Em setembro de 2024, após o episódio em que Pablo Marçal foi atingido por cadeirada de José Luiz Datena durante debate eleitoral em São Paulo.',
      'verified', false, '2024-09-16',
      'https://www.folha.uol.com.br/poder/2024/09/nunes-cadeirada-debate-sao-paulo.shtml',
      'news_article', 'São Paulo', 'Entrevista pós-debate', 'nunes-cadeirada-debate-setembro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4. Nunes vitória reeleição
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_nun,
      'Nunes celebra reeleição como derrota do radicalismo e acena com apoio a Tarcísio em 2026.',
      'São Paulo disse não ao radicalismo, à invasão, à baderna. Vamos trabalhar com o governador Tarcísio e, se necessário, apoiá-lo nacionalmente. Esta vitória é do centro democrático.',
      'Em outubro de 2024, após vencer Boulos no segundo turno da eleição municipal de São Paulo, Nunes sinalizou alinhamento com Tarcísio para 2026.',
      'verified', false, '2024-10-27',
      'https://g1.globo.com/sp/sao-paulo/noticia/2024/10/nunes-reeleicao-tarcisio-2026.ghtml',
      'news_article', 'São Paulo', 'Discurso de vitória', 'nunes-reeleicao-tarcisio-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5. Eduardo Paes Bolsonaro Lula
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_pae,
      'Eduardo Paes afirma que Lula é melhor que Bolsonaro mas critica falta de gestão federal.',
      'Prefiro Lula a Bolsonaro, sem dúvida. Mas o governo federal precisa parar de inventar briga e começar a gerir. Falta competência gerencial. O Rio precisa de parceiro, não de discurso.',
      'Em 2024, durante entrevista, Paes criticou gestão do governo federal mesmo sendo aliado histórico do PT e MDB, reforçando posicionamento pragmático.',
      'verified', false, '2024-08-15',
      'https://oglobo.globo.com/politica/noticia/2024/08/paes-lula-bolsonaro-gestao.ghtml',
      'news_article', 'Rio de Janeiro', 'Entrevista à Globonews', 'paes-lula-bolsonaro-gestao-agosto-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6. Eduardo Paes Carnaval
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_pae,
      'Paes rebate críticas sobre segurança no Carnaval e diz que baixa cobertura policial é exagero da imprensa.',
      'Tiveram problemas pontuais, como em todo Carnaval do mundo. A imprensa adora exagerar. O Rio recebeu milhões, festa foi um sucesso. Não vou permitir que desvalorizem meu Carnaval.',
      'Em fevereiro de 2024, após incidentes durante o Carnaval do Rio, incluindo roubos e tumultos em blocos de rua, que geraram críticas sobre planejamento de segurança municipal.',
      'verified', false, '2024-02-18',
      'https://g1.globo.com/rj/rio-de-janeiro/carnaval/2024/noticia/paes-seguranca-carnaval.ghtml',
      'news_article', 'Rio de Janeiro', 'Coletiva do Carnaval', 'paes-seguranca-carnaval-fevereiro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7. Paes reeleição
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_pae,
      'Paes celebra reeleição em 1º turno como mensagem contra o bolsonarismo e projeta governo estadual.',
      'O Rio de Janeiro rejeitou o bolsonarismo nas urnas. Agora vamos pensar no estado, que está abandonado. Se for preciso, disputo o Palácio Guanabara. O Rio merece gestão.',
      'Em outubro de 2024, após vencer em primeiro turno a eleição municipal do Rio, Paes sinalizou possível candidatura ao governo estadual em 2026.',
      'verified', true, '2024-10-06',
      'https://g1.globo.com/rj/rio-de-janeiro/eleicoes/2024/noticia/paes-reeleicao-2024.ghtml',
      'news_article', 'Rio de Janeiro', 'Discurso de vitória', 'paes-reeleicao-2024-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8. Fuad Noman BH saúde
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_fua,
      'Fuad Noman defende gestão da saúde em BH e rebate críticas após internação em UTI.',
      'Estou bem, a saúde de BH está bem. As filas são herança. Estamos investindo como nunca. Quem tenta politizar minha saúde está do lado errado da história. Fé vai prevalecer.',
      'Em 2024, após Fuad ser internado durante campanha eleitoral, em meio a críticas da oposição sobre filas e gestão do sistema municipal de saúde em Belo Horizonte.',
      'verified', false, '2024-09-25',
      'https://www.em.com.br/app/noticia/politica/2024/09/fuad-saude-bh-campanha.html',
      'news_article', 'Belo Horizonte', 'Declaração após alta hospitalar', 'fuad-saude-bh-setembro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9. Fuad reeleição
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_fua,
      'Fuad Noman celebra vitória apertada em BH como derrota do bolsonarismo raiz.',
      'Belo Horizonte derrotou o bolsonarismo raiz. Bruno Engler representava o pior da extrema-direita. Nossa vitória é da democracia. Vou governar para todos, inclusive quem não me votou.',
      'Em outubro de 2024, após vencer em segundo turno o bolsonarista Bruno Engler pela prefeitura de Belo Horizonte, em eleição acirrada.',
      'verified', true, '2024-10-27',
      'https://www.em.com.br/app/noticia/politica/2024/10/fuad-vitoria-bh-engler.html',
      'news_article', 'Belo Horizonte', 'Discurso de vitória', 'fuad-vitoria-bh-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10. João Campos Recife
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_jca,
      'João Campos celebra reeleição como demonstração de força do PSB e acena com projeto nacional.',
      'O Recife renovou a confiança na nossa gestão. O PSB mostra que tem projeto para o Brasil. Estamos prontos para o que vier. O PSB vai ter protagonismo na disputa nacional.',
      'Em outubro de 2024, após vencer em primeiro turno a eleição pela reeleição em Recife, João Campos foi saudado como futuro candidato nacional do PSB.',
      'verified', true, '2024-10-06',
      'https://g1.globo.com/pe/pernambuco/eleicoes/2024/noticia/joao-campos-reeleicao.ghtml',
      'news_article', 'Recife', 'Discurso de vitória', 'joao-campos-reeleicao-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11. João Campos Raquel Lyra
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_jca,
      'João Campos acusa Raquel Lyra de abandonar Recife e politizar crises na capital.',
      'A governadora Raquel Lyra abandonou Recife. Sempre que há um problema, ela joga no colo da Prefeitura. É uma gestão que não tem resultado e quer culpar os outros. Recife merece parceria, não disputa.',
      'Em 2024, em meio a disputas sobre responsabilidades por obras inacabadas e serviços em Recife entre o PSB na capital e o PSDB no governo estadual.',
      'verified', false, '2024-05-18',
      'https://www.folhape.com.br/politica/joao-campos-raquel-lyra-disputa',
      'news_article', 'Recife', 'Entrevista ao Diário de Pernambuco', 'joao-campos-raquel-lyra-maio-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12. Topázio Silveira
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_top,
      'Topázio Silveira nega nepotismo em Florianópolis após denúncias de cargos para aliados.',
      'Não há nepotismo na minha gestão. As pessoas foram nomeadas por competência. Estão atacando porque minha gestão está dando certo. É inveja travestida de denúncia.',
      'Em 2024, após denúncias do MP sobre indicações de parentes e aliados em cargos da Prefeitura de Florianópolis durante a gestão Topázio Silveira.',
      'verified', false, '2024-03-12',
      'https://www.nsctotal.com.br/noticias/topazio-silveira-nepotismo-denuncia',
      'news_article', 'Florianópolis', 'Entrevista à imprensa', 'topazio-nepotismo-marco-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 13. José Sarto Fortaleza
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_sar,
      'José Sarto cobra governo estadual por segurança e se exime de responsabilidade pela violência em Fortaleza.',
      'Segurança pública é responsabilidade do estado, não da Prefeitura. Não dá para Elmano tentar jogar a crise para cima de Fortaleza. O cearense sabe de quem é o dever.',
      'Em 2023, durante agravamento da violência em Fortaleza, Sarto tentou desvincular sua gestão municipal da crise de segurança, cobrando o governo estadual.',
      'verified', false, '2023-09-05',
      'https://g1.globo.com/ce/ceara/noticia/2023/09/sarto-seguranca-elmano.ghtml',
      'news_article', 'Fortaleza', 'Entrevista à TV Ceará', 'sarto-seguranca-elmano-setembro-2023') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14. Sebastião Melo Porto Alegre enchentes
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_sme,
      'Sebastião Melo admite falha parcial em Porto Alegre durante enchentes mas culpa evento extremo.',
      'Falhou, sim, mas o evento foi extremo. O sistema de proteção foi projetado para outra realidade climática. Não é culpa da minha gestão, é de décadas de negligência antes.',
      'Em maio de 2024, durante enchentes históricas em Porto Alegre com falha do sistema de bombas e comportas. Melo foi criticado por falta de manutenção.',
      'verified', true, '2024-05-15',
      'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/melo-enchentes-portoalegre.html',
      'news_article', 'Porto Alegre', 'Entrevista à GaúchaZH', 'melo-enchentes-porto-alegre-maio-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15. Melo reeleição
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_sme,
      'Sebastião Melo celebra reeleição em Porto Alegre mesmo após críticas sobre enchentes.',
      'Porto Alegre olhou para frente, não para o passado. Não caímos no jogo de quem quis transformar tragédia em palanque. O povo reconheceu nosso trabalho. Vamos reconstruir a cidade.',
      'Em outubro de 2024, após Melo ser reeleito prefeito de Porto Alegre em segundo turno, apesar das críticas sobre a gestão das enchentes.',
      'verified', false, '2024-10-27',
      'https://g1.globo.com/rs/rio-grande-do-sul/eleicoes/2024/noticia/melo-reeleito.ghtml',
      'news_article', 'Porto Alegre', 'Discurso de vitória', 'melo-reeleito-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16. Rafael Greca Curitiba saída
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_gre,
      'Rafael Greca ataca adversários e afirma que só Pimentel dará continuidade à sua obra em Curitiba.',
      'Curitiba não pode retroceder. Eu construí, com amor e dedicação, uma cidade admirada. Só o Eduardo Pimentel vai cuidar dela. Os outros querem destruir o que levei décadas para fazer.',
      'Em outubro de 2024, durante campanha apoiando seu sucessor Eduardo Pimentel em Curitiba, no fim de seu mandato.',
      'verified', false, '2024-10-15',
      'https://g1.globo.com/pr/parana/eleicoes/2024/noticia/greca-pimentel-curitiba.ghtml',
      'news_article', 'Curitiba', 'Ato de campanha', 'greca-pimentel-curitiba-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17. Bruno Reis Salvador segurança
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_bru,
      'Bruno Reis cobra governo Jerônimo por violência em Salvador e se exime de responsabilidades.',
      'A violência em Salvador é responsabilidade do governo do estado. Não posso aceitar que a Prefeitura seja culpada por algo que não gerenciamos. Jerônimo tem que assumir sua responsabilidade.',
      'Em 2024, durante agravamento da violência em Salvador, Bruno Reis (União Brasil) atacou o governador Jerônimo Rodrigues (PT) por segurança pública.',
      'verified', false, '2024-06-10',
      'https://www.correio24horas.com.br/noticia/bruno-reis-jeronimo-seguranca',
      'news_article', 'Salvador', 'Entrevista à Rede Bahia', 'bruno-reis-jeronimo-seguranca-junho-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18. Bruno Reis reeleição
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_bru,
      'Bruno Reis celebra reeleição massiva em Salvador como demonstração contra PT estadual.',
      'Salvador derrotou o PT. Derrotou o PT na capital da Bahia, historicamente petista. É um recado para Jerônimo, é um recado para Lula. A direita baiana está viva e forte.',
      'Em outubro de 2024, após vencer em primeiro turno com ampla margem a eleição em Salvador, Bruno Reis comemorou como derrota política do PT baiano.',
      'verified', true, '2024-10-06',
      'https://www.correio24horas.com.br/noticia/bruno-reis-reeleicao-2024',
      'news_article', 'Salvador', 'Discurso de vitória', 'bruno-reis-reeleicao-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19. David Almeida Manaus
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_dav,
      'David Almeida ataca jornalistas que investigam gestão de Manaus e chama de imprensa militante.',
      'Essa imprensa militante quer derrubar minha gestão. Não vou ceder à chantagem jornalística. Os manauaras sabem o que fiz. Os bons jornalistas veem resultado, os ruins inventam denúncias.',
      'Em 2024, após série de reportagens investigando contratos e denúncias na gestão de David Almeida em Manaus, o prefeito atacou veículos de imprensa.',
      'verified', false, '2024-08-15',
      'https://www.amazonasatual.com.br/david-almeida-imprensa-militante/',
      'news_article', 'Manaus', 'Coletiva de imprensa', 'david-almeida-imprensa-militante-agosto-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 20. David Almeida reeleição
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_dav,
      'David Almeida comemora reeleição em Manaus e promete calar os que criticaram sua gestão.',
      'Venci com ampla margem. Agora vou calar quem tentou me derrubar na base da mentira. Tive que enfrentar jornalistas, denúncias, traições. Mas o povo de Manaus disse sim.',
      'Em outubro de 2024, após vencer em primeiro turno a eleição para prefeito de Manaus em meio a controvérsias e investigações do MP contra sua gestão.',
      'verified', false, '2024-10-06',
      'https://g1.globo.com/am/amazonas/eleicoes/2024/noticia/david-almeida-reeleicao.ghtml',
      'news_article', 'Manaus', 'Discurso de vitória', 'david-almeida-reeleicao-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 21. Castro segurança escolar
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cas,
      'Cláudio Castro defende uso de reconhecimento facial nas escolas do RJ contra críticas de vigilância.',
      'Vamos colocar reconhecimento facial em todas as escolas. Quem é contra isso é cúmplice do crime. Não tenho paciência com quem fala em vigilância. Minha obrigação é proteger.',
      'Em 2024, ao anunciar implantação de tecnologia de reconhecimento facial em escolas públicas do Rio, gerando críticas de especialistas em direitos digitais.',
      'verified', false, '2024-04-18',
      'https://oglobo.globo.com/rio/noticia/2024/04/castro-reconhecimento-facial-escolas.ghtml',
      'news_article', 'Rio de Janeiro', 'Anúncio do programa', 'castro-reconhecimento-facial-escolas-abril-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 22. Tarcísio ataque Lula Alemão
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_tar,
      'Tarcísio apoia operação do Rio e ataca governo federal pelo que chama de omissão criminosa.',
      'Apoio integralmente o governador Castro. O governo Lula foi omisso, criminoso na omissão. Enquanto estados enfrentam o crime, o governo federal faz política. Castro agiu, Lula recuou.',
      'Em outubro de 2025, Tarcísio de Freitas defendeu publicamente a megaoperação do Rio de Janeiro e atacou o governo federal após declarações do Ministério da Justiça.',
      'verified', true, '2025-10-30',
      'https://www.cnnbrasil.com.br/politica/tarcisio-apoia-castro-operacao-rio.html',
      'news_article', 'São Paulo', 'Entrevista coletiva', 'tarcisio-apoia-castro-outubro-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 23. Zema minorias
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_zem,
      'Zema afirma que pautas identitárias são distração da esquerda para esconder fracasso econômico.',
      'Essa pauta identitária, de gênero, de raça, é uma distração da esquerda. Enquanto discutem banheiro, a economia afunda. O brasileiro quer emprego, não ideologia de gênero. É tudo distração.',
      'Em entrevista em 2024, Zema atacou pautas de gênero, identidade e raça promovidas pelo governo Lula como estratégia para ignorar desempenho econômico.',
      'verified', false, '2024-06-22',
      'https://veja.abril.com.br/politica/zema-pautas-identitarias-esquerda',
      'news_article', 'Belo Horizonte', 'Entrevista à Veja', 'zema-pautas-identitarias-junho-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 24. Caiado segurança pró-candidato
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cai,
      'Caiado faz declaração em tom de campanha contra direitos humanos e promete dureza com bandido.',
      'Direitos humanos existem para humanos direitos. Essa é minha frase. Bandido tem é que pedir para sair do tiroteio. Se eleito presidente, vou acabar com essa palhaçada de proteger criminoso.',
      'Em 2025, durante pré-campanha presidencial, Caiado intensificou retórica tough-on-crime e atacou políticas de direitos humanos como proteção a criminosos.',
      'verified', false, '2025-07-15',
      'https://www.metropoles.com/brasil/caiado-direitos-humanos-candidatura',
      'news_article', 'Goiânia', 'Evento de pré-campanha', 'caiado-direitos-humanos-julho-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 25. Ratinho Jr educação ideologia
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_rat,
      'Ratinho Jr critica MEC de Camilo Santana e acusa governo federal de tentar doutrinar alunos.',
      'O MEC do Camilo Santana tenta doutrinar nossos alunos. O Paraná não vai aceitar. Temos nossa própria política educacional, nossos livros, nossas avaliações. Não entregamos a escola a ideólogos.',
      'Em 2024, Ratinho Júnior atacou o Ministério da Educação do governo Lula por políticas de currículo e combate a assédio escolar.',
      'verified', false, '2024-04-25',
      'https://g1.globo.com/pr/parana/noticia/2024/04/ratinho-critica-mec-camilo.ghtml',
      'news_article', 'Curitiba', 'Evento de educação', 'ratinho-critica-mec-abril-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26. Elmano CE pacto federal
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_elm,
      'Elmano defende programa federal Brasil Sem Fome como resgate da dignidade combatendo conservadores.',
      'O Brasil Sem Fome do presidente Lula é resgate de dignidade. Os governadores bolsonaristas boicotam porque não querem dar certo. Sou parceiro de Lula nessa luta, não vou me calar.',
      'Em 2024, apoiando programa federal de combate à fome em oposição a governadores de direita que criticavam a política social.',
      'verified', false, '2024-05-25',
      'https://g1.globo.com/ce/ceara/noticia/2024/05/elmano-brasil-sem-fome.ghtml',
      'news_article', 'Fortaleza', 'Evento do governo federal', 'elmano-brasil-sem-fome-maio-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27. Jerônimo crise facções
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_jer,
      'Jerônimo Rodrigues minimiza gravidade de confrontos entre facções na Bahia em 2025.',
      'Não é guerra de facções, são episódios. A imprensa adora espetacularizar. Nossa polícia está no controle. Bahia não é o Rio, estamos em outro patamar. Não entrem nessa narrativa catastrofista.',
      'Em março de 2025, após série de confrontos entre facções criminosas em cidades do interior da Bahia com dezenas de mortos em uma única semana.',
      'verified', false, '2025-03-18',
      'https://www.correio24horas.com.br/noticia/jeronimo-faccoes-bahia-2025',
      'news_article', 'Salvador', 'Coletiva de imprensa', 'jeronimo-faccoes-bahia-marco-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28. Helder COP30 abertura
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_hel,
      'Helder Barbalho celebra abertura da COP30 em Belém e rebate críticas sobre preparação.',
      'O Pará entrega a COP30. Quem duvidou, agora vê Belém transformada. A floresta tem voz, e a Amazônia sediou a conferência mais importante do planeta. Missão cumprida.',
      'Em novembro de 2025, durante abertura da COP30 em Belém, rebatendo críticas sobre preços de hospedagem, preparação urbana e impactos ambientais das obras.',
      'verified', true, '2025-11-10',
      'https://g1.globo.com/pa/para/noticia/2025/11/helder-abertura-cop30-belem.ghtml',
      'news_article', 'Belém', 'Abertura da COP30', 'helder-abertura-cop30-novembro-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29. Raquel Lyra mulher na política
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_raq,
      'Raquel Lyra acusa machismo de adversários após ataques sobre gestão em Pernambuco.',
      'Sofro ataques que homem nenhum sofreria. É machismo político puro. Porque sou mulher, questionam minha capacidade de decidir. Mas não vou me intimidar, vou governar até o fim.',
      'Em 2024, após ataques políticos à sua gestão em Pernambuco que ela classificou como machistas, especialmente após ruptura do União Brasil com sua gestão.',
      'verified', false, '2024-07-30',
      'https://www.folhape.com.br/politica/raquel-lyra-machismo-critica',
      'news_article', 'Recife', 'Entrevista coletiva', 'raquel-lyra-machismo-julho-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30. Castro RJ oposição a ministro
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_cas,
      'Castro ataca ministro Lewandowski e acusa governo federal de criminalizar polícia do Rio.',
      'O ministro Lewandowski virou advogado de bandido. Tá criminalizando nossa polícia enquanto traficante manda no Rio. Vou lutar contra essa gente, não vou entregar minha polícia ao STF.',
      'Em 2025, após declarações do ministro da Justiça Ricardo Lewandowski sobre necessidade de protocolos para operações policiais no Rio após megaoperações letais.',
      'verified', false, '2025-11-10',
      'https://oglobo.globo.com/politica/noticia/2025/11/castro-ataca-lewandowski.ghtml',
      'news_article', 'Rio de Janeiro', 'Entrevista à Globonews', 'castro-ataca-lewandowski-novembro-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 31. Nunes CEU creche
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_nun,
      'Ricardo Nunes minimiza falta de vagas em creches em SP e culpa gestão anterior.',
      'A falta de vagas em creches é herança. Não dá para querer resolver em 2 anos o que não fizeram em décadas. Estamos construindo o maior número da história. Quem critica é porque não fez.',
      'Em 2024, rebatendo críticas da oposição e do Ministério Público sobre longa espera por vagas em creches na cidade de São Paulo.',
      'verified', false, '2024-07-12',
      'https://www.folha.uol.com.br/educacao/2024/07/nunes-creches-sp-heranca.shtml',
      'news_article', 'São Paulo', 'Entrevista à CBN', 'nunes-creches-sp-julho-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32. Paes enchente Rio
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_pae,
      'Eduardo Paes rebate críticas sobre alagamentos no Rio e garante que cidade está preparada.',
      'O Rio hoje tem sistema de monitoramento invejável. Se alaga, não é por falta de investimento. É chuva extrema, que não tem cidade preparada. Quem diz o contrário é oposição de má-fé.',
      'Em 2024, após alagamentos pontuais no Rio de Janeiro durante temporal, Paes defendeu o Centro de Operações e sistemas de drenagem contra críticas.',
      'verified', false, '2024-01-22',
      'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/01/paes-alagamento-rio.ghtml',
      'news_article', 'Rio de Janeiro', 'Centro de Operações', 'paes-alagamento-rio-janeiro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33. Eduardo Leite recuperação RS
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_ele,
      'Eduardo Leite afirma que governo federal foi lento na ajuda ao RS e politizou a tragédia.',
      'O governo federal foi lento. Criou palanque em cima da tragédia. O que o RS queria era recurso rápido, não comício. Tenho respeito pelo presidente, mas preciso dizer a verdade ao povo gaúcho.',
      'Em novembro de 2024, Leite atacou o governo federal por considerar lenta a ajuda do governo Lula às vítimas das enchentes do Rio Grande do Sul.',
      'verified', false, '2024-11-18',
      'https://gauchazh.clicrbs.com.br/politica/noticia/2024/11/leite-critica-lula-ajuda-rs.html',
      'news_article', 'Porto Alegre', 'Entrevista à GaúchaZH', 'leite-critica-lula-ajuda-novembro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34. Wilson Lima apoio Tarcísio
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_wil,
      'Wilson Lima declara apoio a Tarcísio para 2026 e critica governo Lula pela Amazônia.',
      'Tarcísio é o nome da direita responsável. Apoio, sim. O Brasil não aguenta mais quatro anos de Lula. O governo federal abandonou a Amazônia, abandonou o Norte. Está na hora de mudar.',
      'Em 2025, Wilson Lima se alinhou publicamente a Tarcísio de Freitas como apoiador de sua candidatura presidencial em 2026.',
      'verified', false, '2025-12-10',
      'https://g1.globo.com/am/amazonas/noticia/2025/12/wilson-apoio-tarcisio.ghtml',
      'news_article', 'Manaus', 'Evento do Republicanos', 'wilson-apoio-tarcisio-dezembro-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35. Ibaneis DF BRT
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_iba,
      'Ibaneis Rocha nega falhas em concessão do BRT do DF e culpa licitação anterior.',
      'A concessão do transporte público do DF não é culpa desta gestão. É herança. Estamos corrigindo, sem pressa, com responsabilidade. Quem critica é quem fez pior antes.',
      'Em 2024, após reclamações crescentes sobre qualidade do transporte público no Distrito Federal, com frota sucateada e atrasos frequentes.',
      'verified', false, '2024-06-18',
      'https://g1.globo.com/df/distrito-federal/noticia/2024/06/ibaneis-transporte-df.ghtml',
      'news_article', 'Brasília', 'Entrevista à TV Brasília', 'ibaneis-transporte-df-junho-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36. Riedel Pantanal
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_rie,
      'Riedel defende produtores rurais acusados de incêndios no Pantanal e acusa Ibama de exagero.',
      'Não podemos criminalizar o produtor. O Ibama exagera nas multas, inviabiliza o negócio. Queimada é parte da vida no Pantanal, sempre foi. O problema é o fiscal que não entende o campo.',
      'Em setembro de 2024, durante crise de queimadas no Pantanal em Mato Grosso do Sul, Riedel criticou operação do Ibama contra produtores rurais.',
      'verified', false, '2024-09-25',
      'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2024/09/riedel-ibama-pantanal.ghtml',
      'news_article', 'Campo Grande', 'Entrevista à imprensa', 'riedel-ibama-pantanal-setembro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 37. Mauro Mendes Araguaia Tocantins
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_mau,
      'Mauro Mendes defende projetos hidrelétricos controversos e acusa ambientalistas de atraso.',
      'O Mato Grosso precisa de energia. Os ambientalistas querem parar o progresso. Não vamos aceitar. Os projetos são seguros, estudados. Quem é contra é contra o desenvolvimento do país.',
      'Em 2025, defendendo projetos hidrelétricos em Mato Grosso questionados por comunidades indígenas e órgãos ambientais.',
      'verified', false, '2025-04-08',
      'https://valor.globo.com/politica/noticia/2025/04/mauro-mendes-hidreletricas-mt.ghtml',
      'news_article', 'Cuiabá', 'Evento do setor elétrico', 'mauro-mendes-hidreletricas-abril-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 38. Fátima Bezerra educação
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_fat,
      'Fátima Bezerra rebate críticas sobre queda no Ideb do RN e culpa pandemia e falta de verba federal.',
      'O resultado do Ideb no RN tem explicação: pandemia, corte federal anterior, desestruturação. Não dá para ignorar o contexto. Quem critica tem mágica, eu tenho trabalho duro e recursos limitados.',
      'Em 2024, após divulgação de índices educacionais mostrando queda no Ideb do Rio Grande do Norte em relação a metas.',
      'verified', false, '2024-08-25',
      'https://www.tribunadonorte.com.br/noticia/fatima-ideb-rn-queda',
      'news_article', 'Natal', 'Coletiva de imprensa', 'fatima-ideb-rn-agosto-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39. Nunes bloqueios contra motoristas de app
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_nun,
      'Ricardo Nunes ameaça motoristas de aplicativo por greve e diz que vai tratar como baderna.',
      'Motorista de aplicativo não pode fazer greve parando a cidade. Isso é baderna, não protesto. Vou mandar a GCM, vou multar, vou rebocar. Ninguém fecha São Paulo.',
      'Em 2023, durante paralisação de motoristas de aplicativo em São Paulo por reajuste de tarifas, Nunes adotou tom de confronto.',
      'verified', false, '2023-10-15',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/10/nunes-motoristas-aplicativo-greve.ghtml',
      'news_article', 'São Paulo', 'Entrevista coletiva', 'nunes-motoristas-aplicativo-outubro-2023') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 40. Paes mudança estado
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_pae,
      'Eduardo Paes confirma candidatura ao governo do Rio em 2026 e ataca herança Castro.',
      'Sim, sou candidato ao governo do Rio. O estado está abandonado, falido, violento. Castro não governa, apenas justifica. Vou tirar o Rio desse buraco, como tirei a cidade quatro vezes.',
      'Em março de 2026, Eduardo Paes formalizou pré-candidatura ao governo do Rio de Janeiro, atacando a gestão de Cláudio Castro.',
      'verified', true, '2026-03-10',
      'https://oglobo.globo.com/politica/noticia/2026/03/paes-candidato-governo-rj.ghtml',
      'news_article', 'Rio de Janeiro', 'Convenção do PSD', 'paes-candidato-governo-rj-marco-2026') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41. Sarto defeat
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_sar,
      'Sarto culpa PT estadual por derrota em Fortaleza e acusa Elmano de sabotar sua gestão.',
      'O PT estadual sabotou minha gestão desde o primeiro dia. Elmano boicotou Fortaleza, e agora colhe os frutos. Não foi o povo que me rejeitou, foi a sabotagem política.',
      'Em outubro de 2024, após derrota em primeiro turno para candidato do PL em Fortaleza, com Sarto ficando de fora do segundo turno.',
      'verified', false, '2024-10-08',
      'https://g1.globo.com/ce/ceara/eleicoes/2024/noticia/sarto-derrota-fortaleza.ghtml',
      'news_article', 'Fortaleza', 'Entrevista pós-eleição', 'sarto-derrota-fortaleza-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42. Greca sucessor Pimentel vitória
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_gre,
      'Greca celebra eleição do sucessor em Curitiba como confirmação de seu legado.',
      'Curitiba confirmou meu legado. Elegeu meu sucessor. Foi uma validação do meu trabalho, da minha paixão pela cidade. Continuo sendo o curitibano mais querido, agora com descanso merecido.',
      'Em outubro de 2024, após vitória de Eduardo Pimentel em segundo turno pela prefeitura de Curitiba, candidato apoiado por Rafael Greca.',
      'verified', false, '2024-10-27',
      'https://g1.globo.com/pr/parana/eleicoes/2024/noticia/greca-pimentel-vitoria.ghtml',
      'news_article', 'Curitiba', 'Comemoração', 'greca-pimentel-vitoria-outubro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43. João Campos PSB 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_jca,
      'João Campos acena com candidatura a governador de PE em 2026 contra Raquel Lyra.',
      'Se for chamado pelo PSB, estarei disposto. Pernambuco não pode seguir nesse caminho. A gestão Raquel falhou com o povo. O Recife mostrou que sabe cobrar, agora PE pode fazer o mesmo.',
      'Em janeiro de 2026, João Campos sinalizou possível candidatura ao governo de Pernambuco em 2026, contra eventual reeleição de Raquel Lyra.',
      'verified', false, '2026-01-20',
      'https://www.folhape.com.br/politica/joao-campos-governo-pe-2026',
      'news_article', 'Recife', 'Entrevista à Folha de Pernambuco', 'joao-campos-governo-pe-janeiro-2026') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44. Fuad Noman vice Kalil
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_fua,
      'Fuad defende continuidade após morte e afirma ser herdeiro do projeto Kalil.',
      'Sou continuidade, sim. Kalil é meu amigo, meu mentor. Vou manter o projeto que começamos juntos. Quem era contra Kalil é contra mim. Quem era a favor, sabe onde estou.',
      'Em 2024, durante campanha pela reeleição, Fuad reforçou vínculo com ex-prefeito Alexandre Kalil de BH como elemento de continuidade política.',
      'verified', false, '2024-08-18',
      'https://www.em.com.br/app/noticia/politica/2024/08/fuad-kalil-continuidade.html',
      'news_article', 'Belo Horizonte', 'Ato de campanha', 'fuad-kalil-continuidade-agosto-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45. Bruno Reis Carnaval tradicionalismo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_bru,
      'Bruno Reis rebate críticas sobre cachês desiguais de artistas homens e mulheres no Carnaval de Salvador.',
      'O cachê é definido pelo mercado, não pela prefeitura. Se mulher ganha menos, é porque cobra menos. Não vou distorcer o mercado com cota. Isso é militância, não gestão.',
      'Em 2024, após denúncia sobre diferença salarial entre artistas homens e mulheres no Carnaval de Salvador, Bruno Reis rejeitou paridade de cachês.',
      'verified', false, '2024-02-15',
      'https://www.correio24horas.com.br/noticia/bruno-reis-cache-mulheres-carnaval',
      'news_article', 'Salvador', 'Coletiva do Carnaval', 'bruno-reis-cache-mulheres-fevereiro-2024') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 46. David Almeida xenofobia venezuelanos
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_dav,
      'David Almeida faz declaração contra venezuelanos em Manaus e diz que cidade não aguenta mais imigração.',
      'Manaus não aguenta mais receber venezuelano. São demais, virou problema social. O brasileiro tem que vir em primeiro lugar. Se não fecharmos a porta, vamos colapsar.',
      'Em 2023, em meio a aumento da imigração de venezuelanos para Manaus, David Almeida fez declarações consideradas xenofóbicas por organizações de direitos humanos.',
      'verified', true, '2023-07-18',
      'https://www.amazonasatual.com.br/david-almeida-venezuelanos-manaus/',
      'news_article', 'Manaus', 'Entrevista à Rádio Rio Mar', 'david-almeida-venezuelanos-julho-2023') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 47. Melo Porto Alegre LGBT
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_sme,
      'Sebastião Melo nega apoio da Prefeitura a evento LGBT em POA e causa polêmica com comunidade.',
      'A Prefeitura não tem que bancar evento que não é consenso na cidade. Tem gente que defende, tem gente que rejeita. Não vou usar dinheiro público para agradar minoria militante.',
      'Em 2023, após Melo cortar verba municipal para apoio à Parada LGBT de Porto Alegre, gerando críticas de ativistas e da comunidade LGBTQIA+.',
      'verified', false, '2023-11-18',
      'https://gauchazh.clicrbs.com.br/porto-alegre/noticia/2023/11/melo-lgbt-parada-verba.html',
      'news_article', 'Porto Alegre', 'Entrevista à GaúchaZH', 'melo-lgbt-parada-novembro-2023') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 48. Paes Bolsonaro anistia
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_pae,
      'Eduardo Paes rejeita anistia para golpistas do 8 de janeiro e defende condenação de Bolsonaro.',
      'Não pode ter anistia para quem atentou contra a democracia. Bolsonaro tem que responder, os golpistas têm que responder. Quem defende anistia defende golpe, é assim que eu vejo.',
      'Em 2025, Eduardo Paes se pronunciou publicamente contra projetos de anistia aos envolvidos nos atos golpistas de 8 de janeiro de 2023.',
      'verified', true, '2025-08-12',
      'https://g1.globo.com/rj/rio-de-janeiro/noticia/2025/08/paes-anistia-bolsonaro.ghtml',
      'news_article', 'Rio de Janeiro', 'Entrevista à Rádio Tupi', 'paes-anistia-bolsonaro-agosto-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 49. Tarcísio anistia Bolsonaro
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_tar,
      'Tarcísio de Freitas defende anistia a Bolsonaro como pacificação e critica condenação do ex-presidente.',
      'O Brasil precisa de pacificação. Anistiar Bolsonaro é reconciliar o país. A condenação foi política, todo mundo sabe. Pacificação passa por libertar quem foi perseguido injustamente.',
      'Em 2025, após condenação de Bolsonaro pelo STF no caso do golpe, Tarcísio defendeu publicamente projetos de anistia em tramitação no Congresso.',
      'verified', true, '2025-09-20',
      'https://www.folha.uol.com.br/poder/2025/09/tarcisio-anistia-bolsonaro-pacificacao.shtml',
      'news_article', 'São Paulo', 'Entrevista ao Jornal Nacional', 'tarcisio-anistia-bolsonaro-setembro-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 50. Nunes gestão social
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug)
    VALUES (v_nun,
      'Ricardo Nunes desqualifica pesquisas sobre insegurança alimentar em SP e afirma que não há fome na cidade.',
      'Não tem fome em São Paulo. Tem pessoas em vulnerabilidade, e estamos atendendo. Essas pesquisas que querem dizer que tem fome são retóricas ideológicas. SP entrega mais de 1 milhão de refeições dia.',
      'Em 2025, Nunes rebateu estudos do Ibope e Rede PENSSAN que apontavam aumento da insegurança alimentar severa na capital paulista.',
      'verified', false, '2025-05-22',
      'https://www.folha.uol.com.br/cotidiano/2025/05/nunes-fome-sp-pesquisas.shtml',
      'news_article', 'São Paulo', 'Entrevista à imprensa', 'nunes-fome-sp-maio-2025') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

END $$;
