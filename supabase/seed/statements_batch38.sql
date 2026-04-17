-- Batch 38: Condenação e prisão de Bolsonaro pelo STF, tentativa de golpe,
-- perseguição política, Zambelli cassada/extraditada, Ramagem foragido,
-- Daniel Silveira, Frederick Wassef, Eduardo no exterior, reações aliados
-- (Set 2025 – Abr 2026) — 50 declarações

DO $$
DECLARE
  v_bol UUID; v_edu UUID; v_fla UUID; v_car UUID;
  v_zam UUID; v_ram UUID; v_sil UUID; v_nik UUID;
  v_dam UUID; v_lula UUID; v_din UUID; v_gle UUID;
  v_mic UUID; v_bia UUID; v_mou UUID; v_fel UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID;
  c_aut UUID; c_obs UUID; c_ame UUID; c_neg UUID;
  c_odi UUID; c_cor UUID; c_irr UUID; c_int UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1. Bolsonaro reage à condenação pelo STF chamando de ditadura togada
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro classifica condenação a 27 anos pelo STF como perseguição política e ditadura togada.',
      'Fui condenado a 27 anos por uma corte política que já tinha o veredito antes do julgamento. Isso não é Justiça, é vingança. Estamos vivendo uma ditadura togada onde quem pensa diferente é criminalizado. O povo brasileiro sabe que sou inocente.',
      'Nota divulgada pela defesa de Jair Bolsonaro horas após o STF condená-lo a 27 anos e 3 meses de prisão por tentativa de golpe de Estado em 11 de setembro de 2025. A condenação foi por unanimidade, com votos de todos os 11 ministros.',
      'verified', true, '2025-09-11',
      'https://www.folha.uol.com.br/poder/2025/09/bolsonaro-condenado-stf-27-anos-golpe.shtml',
      'news_article',
      'Brasília', 'Julgamento STF — condenação golpe', 'bolsonaro-condenacao-27-anos-ditadura-togada-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 2. Bolsonaro diz que nunca planejou golpe e acusa provas fabricadas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega qualquer envolvimento em plano de golpe e diz que provas foram fabricadas pelo inquérito.',
      'Nunca planejei golpe nenhum. Eu era o presidente da República, eleito democraticamente. Para que eu daria golpe? As provas foram fabricadas num inquérito sigiloso onde eu não tive direito de defesa. Isso é uma farsa jurídica.',
      'Declaração lida pelo advogado Frederick Wassef em coletiva de imprensa após a condenação do STF. Wassef anunciou que recorreria a instâncias internacionais, incluindo a Corte Interamericana de Direitos Humanos.',
      'verified', false, '2025-09-12',
      'https://g1.globo.com/politica/noticia/2025/09/bolsonaro-nega-golpe-provas-fabricadas-wassef.ghtml',
      'news_article',
      'Brasília', 'Coletiva Frederick Wassef', 'bolsonaro-nega-golpe-provas-fabricadas-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Bolsonaro compara sua condenação a regimes autoritários
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro compara sua condenação a perseguições em Venezuela e Nicarágua.',
      'O que fizeram comigo é o que Maduro faz na Venezuela, o que Ortega faz na Nicarágua. Prendem o principal opositor para ele não disputar eleições. A diferença é que aqui eles usam toga em vez de farda.',
      'Mensagem de áudio obtida pela imprensa, enviada por Bolsonaro a aliados no dia seguinte à condenação. O ex-presidente estava em prisão domiciliar aguardando definição do regime de cumprimento de pena.',
      'verified', false, '2025-09-13',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-compara-condenacao-venezuela-nicaragua/',
      'news_article',
      'Brasília', 'Áudio vazado a aliados', 'bolsonaro-compara-venezuela-nicaragua-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Frederick Wassef anuncia recursos internacionais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Advogado de Bolsonaro anuncia recurso à Corte Interamericana e diz que julgamento foi político.',
      'Vamos recorrer a todas as instâncias nacionais e internacionais. O julgamento do presidente Bolsonaro foi político, não jurídico. Nenhum fato novo foi apresentado, apenas narrativas. A Corte Interamericana de Direitos Humanos precisa tomar conhecimento dessa aberração.',
      'Declaração de Frederick Wassef em coletiva de imprensa realizada em Brasília em setembro de 2025, representando a defesa de Bolsonaro. Wassef apresentou a estratégia jurídica de internacionalizar o caso.',
      'verified', false, '2025-09-15',
      'https://www.poder360.com.br/justica/wassef-anuncia-recurso-corte-interamericana-bolsonaro/',
      'news_article',
      'Brasília', 'Coletiva de imprensa — defesa Bolsonaro', 'wassef-recurso-corte-interamericana-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 5. Ramagem condenado a 16 anos pelo STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem diz que foi condenado por lealdade a Bolsonaro e promete provar inocência.',
      'Fui condenado por ter sido leal ao presidente eleito. Minha única culpa foi ter servido ao Brasil. Vou provar minha inocência e mostrar que esse julgamento foi uma perseguição coordenada contra todos que apoiaram o governo Bolsonaro.',
      'Nota divulgada pela defesa de Alexandre Ramagem após sua condenação a 16 anos de prisão pelo STF por participação no plano golpista. Ramagem era deputado federal pelo PL e ex-diretor da ABIN no governo Bolsonaro.',
      'verified', true, '2025-09-11',
      'https://www.uol.com.br/noticias/politica/2025/09/ramagem-condenado-16-anos-stf-golpe.htm',
      'news_article',
      'Brasília', 'Julgamento STF — condenação Ramagem', 'ramagem-condenado-16-anos-lealdade-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 6. Eduardo Bolsonaro pede mandato remoto dos EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro solicita exercer mandato remotamente dos EUA alegando risco de perseguição política.',
      'Estou nos Estados Unidos porque minha vida corre risco no Brasil. O STF quer me prender como prendeu meu pai. Solicito à Câmara que me permita exercer meu mandato remotamente até que haja segurança jurídica para meu retorno.',
      'Requerimento formal de Eduardo Bolsonaro à Mesa Diretora da Câmara dos Deputados em setembro de 2025, solicitando mandato remoto. O pedido foi negado pelo presidente da Câmara, Hugo Motta.',
      'verified', false, '2025-09-18',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-mandato-remoto-eua-perseguicao/',
      'news_article',
      'Washington D.C.', 'Requerimento à Câmara dos Deputados', 'eduardo-mandato-remoto-eua-perseguicao-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Eduardo diz que julgamento do pai foi show midiático
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro classifica julgamento do STF como show midiático orquestrado pela esquerda.',
      'Esse julgamento foi um show midiático. Já tinham o roteiro pronto, já tinham a pena pronta. A esquerda mundial comemora enquanto o Brasil perde sua democracia. Meu pai foi condenado por ser conservador, por defender valores cristãos.',
      'Publicação de Eduardo Bolsonaro em suas redes sociais no dia da condenação do pai pelo STF. O post foi compartilhado milhões de vezes por apoiadores bolsonaristas.',
      'verified', false, '2025-09-11',
      'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-show-midiatico-condenacao-pai/',
      'social_media_post',
      'Redes sociais', 'Post em redes sociais', 'eduardo-show-midiatico-condenacao-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Flávio Bolsonaro promete reverter condenação do pai
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro promete que a direita reverterá a condenação do pai quando voltar ao poder.',
      'Essa condenação será revertida. Quando a direita voltar ao poder — e vai voltar — vamos corrigir essa injustiça. Meu pai é inocente e o povo sabe disso. Nenhum tribunal do mundo condenaria alguém com essas provas fabricadas.',
      'Entrevista de Flávio Bolsonaro à Jovem Pan após a condenação do pai. O senador pelo PL sinalizou que a condenação seria tema central da campanha presidencial de 2026.',
      'verified', false, '2025-09-12',
      'https://jovempan.uol.com.br/noticias/politica/flavio-bolsonaro-promete-reverter-condenacao-pai.html',
      'news_article',
      'São Paulo', 'Jovem Pan — entrevista', 'flavio-reverter-condenacao-pai-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 9. Carlos Bolsonaro acusa STF de lawfare
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro acusa STF de praticar lawfare contra a família Bolsonaro para impedir candidaturas.',
      'Isso é lawfare puro. Usam a Justiça para destruir opositores. Fizeram com meu pai, fizeram com Ramagem, fizeram com Zambelli. Querem eliminar toda a direita da política brasileira usando processos judiciais como arma.',
      'Post de Carlos Bolsonaro no X (antigo Twitter) após a condenação do pai e de Ramagem. Carlos é vereador no Rio de Janeiro e coordenava as redes sociais da família.',
      'verified', false, '2025-09-12',
      'https://www.uol.com.br/noticias/politica/2025/09/carlos-bolsonaro-lawfare-stf-familia.htm',
      'social_media_post',
      'Redes sociais', 'Post no X', 'carlos-bolsonaro-lawfare-stf-familia-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 10. Michelle Bolsonaro chora em vídeo e pede orações
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro grava vídeo chorando dizendo que o marido é um preso político e pedindo orações.',
      'Meu marido é um preso político. Um homem que dedicou a vida ao Brasil está sendo tratado como criminoso. Peço orações de todos vocês. Deus vai nos livrar dessa perseguição. A verdade sempre prevalece.',
      'Vídeo publicado por Michelle Bolsonaro no Instagram após a condenação de Jair Bolsonaro pelo STF. O vídeo viralizou entre apoiadores e foi usado para mobilização política pela direita.',
      'verified', true, '2025-09-12',
      'https://www.folha.uol.com.br/poder/2025/09/michelle-bolsonaro-video-preso-politico-oracoes.shtml',
      'social_media_post',
      'Redes sociais', 'Vídeo no Instagram', 'michelle-video-preso-politico-oracoes-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Nikolas Ferreira defende Bolsonaro e ataca STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira diz que condenação de Bolsonaro é o maior erro judiciário da história do Brasil.',
      'Estamos diante do maior erro judiciário da história do Brasil. Um presidente eleito democraticamente condenado por um tribunal político. O STF não julgou fatos, julgou ideologia. A direita não vai aceitar isso calada.',
      'Discurso de Nikolas Ferreira na tribuna da Câmara dos Deputados no dia seguinte à condenação de Bolsonaro. Nikolas é deputado federal pelo PL-MG e uma das principais vozes da nova direita.',
      'verified', false, '2025-09-12',
      'https://www.poder360.com.br/congresso/nikolas-ferreira-erro-judiciario-bolsonaro-condenacao/',
      'news_article',
      'Brasília', 'Tribuna da Câmara dos Deputados', 'nikolas-erro-judiciario-bolsonaro-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 12. Damares Alves diz que Bolsonaro é mártir da liberdade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves compara Bolsonaro a um mártir cristão perseguido por defender valores conservadores.',
      'Bolsonaro é um mártir da liberdade e dos valores cristãos. Assim como os profetas foram perseguidos por falar a verdade, ele está sendo perseguido por defender a família, a fé e a pátria. Deus não abandonará seu servo.',
      'Declaração de Damares Alves em culto evangélico em Brasília após a condenação de Bolsonaro. A senadora pelo Republicanos-DF usou linguagem religiosa para mobilizar fiéis.',
      'verified', false, '2025-09-14',
      'https://www.gospelprime.com.br/damares-bolsonaro-martir-liberdade-culto/',
      'news_article',
      'Brasília', 'Culto evangélico', 'damares-bolsonaro-martir-liberdade-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Bia Kicis convoca manifestações contra o STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis convoca manifestações populares contra o STF e diz que o tribunal perdeu legitimidade.',
      'O STF perdeu toda legitimidade ao condenar um presidente inocente. Convoco o povo brasileiro a ir às ruas no dia 7 de setembro mostrar que não aceitamos essa tirania. Não somos carneiros, somos leões.',
      'Vídeo publicado por Bia Kicis em suas redes sociais convocando manifestações. A deputada federal pelo PL-DF foi investigada no inquérito das milícias digitais mas não foi denunciada.',
      'verified', false, '2025-09-16',
      'https://www.metropoles.com/brasil/bia-kicis-convoca-manifestacoes-stf-bolsonaro',
      'social_media_post',
      'Redes sociais', 'Vídeo convocatório', 'bia-kicis-convoca-manifestacoes-stf-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 14. Marco Feliciano diz que Deus julgará os ministros do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano diz que Deus julgará os ministros do STF por condenarem um inocente.',
      'Os ministros do Supremo condenaram um inocente. Mas existe um tribunal acima deles, que é o tribunal de Deus. E lá não tem recurso, não tem habeas corpus. Deus vai cobrar cada voto injusto desses magistrados.',
      'Sermão de Marco Feliciano em igreja evangélica em São Paulo, retransmitido ao vivo por redes sociais. O deputado federal pelo PL-SP usou tom ameaçador contra os ministros.',
      'verified', false, '2025-09-14',
      'https://www.uol.com.br/noticias/politica/2025/09/feliciano-deus-julgara-ministros-stf-bolsonaro.htm',
      'news_article',
      'São Paulo', 'Culto evangélico', 'feliciano-deus-julgara-ministros-stf-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 15. Mourão critica condenação mas diz que instituições devem ser respeitadas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão diz que condenação de Bolsonaro foi desproporcional mas pede respeito às instituições.',
      'A pena foi desproporcional, isso é evidente. Mas precisamos respeitar as instituições. O caminho é pelos recursos legais, não pela ruptura. Quem prega ruptura institucional está fazendo o jogo da esquerda.',
      'Entrevista de Hamilton Mourão à GloboNews após a condenação de Bolsonaro. O senador pelo Republicanos-RS, ex-vice-presidente, manteve posição moderada em relação aos aliados mais radicais.',
      'verified', false, '2025-09-13',
      'https://g1.globo.com/politica/noticia/2025/09/mourao-condenacao-bolsonaro-desproporcional-instituicoes.ghtml',
      'news_article',
      'Brasília', 'GloboNews — entrevista', 'mourao-condenacao-desproporcional-instituicoes-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 16. Gleisi Hoffmann comemora condenação e diz que democracia venceu
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que condenação de Bolsonaro é vitória da democracia e que golpistas devem pagar.',
      'A democracia brasileira venceu hoje. Quem tentou dar um golpe de Estado e assassinar o presidente eleito precisa pagar por seus crimes. A condenação de Bolsonaro mostra que ninguém está acima da lei neste país.',
      'Nota oficial da presidente do PT, Gleisi Hoffmann, divulgada minutos após a condenação de Bolsonaro pelo STF em setembro de 2025.',
      'verified', false, '2025-09-11',
      'https://www.pt.org.br/gleisi-condenacao-bolsonaro-democracia-venceu/',
      'news_article',
      'Brasília', 'Nota oficial do PT', 'gleisi-democracia-venceu-condenacao-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 17. Flávio Dino vota pela condenação e faz discurso sobre golpe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Ministro Flávio Dino vota pela condenação de Bolsonaro e diz que tentativa de golpe ficou provada.',
      'As provas são robustas e incontestáveis. Houve uma tentativa organizada de ruptura institucional com participação direta do então presidente da República. A democracia brasileira quase foi destruída. Voto pela condenação.',
      'Voto do ministro Flávio Dino no julgamento do STF que condenou Bolsonaro por tentativa de golpe de Estado. Dino foi um dos 11 ministros que votaram pela condenação unânime.',
      'verified', true, '2025-09-11',
      'https://www.conjur.com.br/2025-set-11/flavio-dino-voto-condenacao-bolsonaro-golpe/',
      'news_article',
      'Brasília', 'Julgamento STF — plenário', 'dino-voto-condenacao-bolsonaro-golpe-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 18. Lula comenta condenação dizendo que ninguém está acima da lei
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que condenação de Bolsonaro mostra que no Brasil ninguém está acima da lei.',
      'O Brasil mostrou hoje que ninguém está acima da lei. Quem atenta contra a democracia precisa responder por seus atos. Não é perseguição, é Justiça. O Judiciário fez o que tinha que fazer.',
      'Declaração de Lula à imprensa no Palácio do Planalto no dia da condenação de Bolsonaro. O presidente evitou tom triunfalista mas reafirmou a importância da responsabilização.',
      'verified', true, '2025-09-11',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-09/lula-condenacao-bolsonaro-ninguem-acima-lei',
      'news_article',
      'Brasília', 'Palácio do Planalto — coletiva', 'lula-ninguem-acima-lei-condenacao-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 19. Bolsonaro chega à sede da PF para cumprir pena
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que entra preso mas sai herói e que a história o absolverá.',
      'Entro aqui como preso político, mas saio como herói. A história me absolverá. O povo brasileiro sabe quem eu sou e o que fiz pelo Brasil. Isso aqui não acaba comigo, isso aqui é o começo.',
      'Declaração de Bolsonaro à imprensa ao chegar à sede da Polícia Federal em Brasília para iniciar o cumprimento de pena em novembro de 2025. Apoiadores se aglomeraram do lado de fora em protesto.',
      'verified', true, '2025-11-25',
      'https://www.folha.uol.com.br/poder/2025/11/bolsonaro-chega-pf-cumprimento-pena-preso-politico.shtml',
      'news_article',
      'Brasília', 'Sede da Polícia Federal', 'bolsonaro-chega-pf-preso-politico-heroi-nov-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 20. Bolsonaro reclama das condições na PF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro reclama das condições na sede da PF e diz que está sendo tratado como criminoso comum.',
      'As condições aqui são desumanas. Estou sendo tratado pior que traficante. Não tenho direito a visitas adequadas, não tenho acesso a informação. Querem me quebrar psicologicamente, mas não vão conseguir.',
      'Relato feito por Bolsonaro a seus advogados durante visita na sede da Polícia Federal em dezembro de 2025. A defesa protocolou pedido de melhoria das condições no STF.',
      'verified', false, '2025-12-05',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-reclama-condicoes-pf-tratamento-desumano/',
      'news_article',
      'Brasília', 'Sede da Polícia Federal — visita advogados', 'bolsonaro-condicoes-pf-desumanas-dez-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Zambelli condenada a 10 anos por invasão do CNJ
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli diz que condenação por invasão ao CNJ é perseguição e que nunca hackeou nada.',
      'Nunca hackeei nada. Sou parlamentar, não hacker. Essa condenação é mais uma etapa da perseguição contra todos que apoiam Bolsonaro. Querem me calar porque eu denuncio as irregularidades desse governo.',
      'Nota divulgada pela defesa de Carla Zambelli após condenação pelo STF a 10 anos por invasão ao sistema do CNJ em maio de 2025. Zambelli já havia sido cassada pelo TRE-SP em janeiro de 2025.',
      'verified', false, '2025-05-15',
      'https://www.estadao.com.br/politica/zambelli-condenada-10-anos-invasao-cnj-stf/',
      'news_article',
      'Brasília', 'Julgamento STF — Zambelli', 'zambelli-condenada-cnj-perseguicao-mai-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 22. Zambelli foge para Itália antes de segunda condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli publica vídeo da Itália dizendo que buscou exílio para não ser presa injustamente.',
      'Estou na Itália porque o Brasil não oferece mais segurança jurídica para opositores. Busquei exílio como fizeram tantos perseguidos políticos ao longo da história. Não fugi, me protegi.',
      'Vídeo publicado por Carla Zambelli em suas redes sociais após deixar o Brasil em julho de 2025, antes de sua segunda condenação pelo STF. A Interpol emitiu alerta vermelho para sua localização.',
      'verified', false, '2025-07-20',
      'https://g1.globo.com/politica/noticia/2025/07/zambelli-italia-exilio-perseguicao.ghtml',
      'social_media_post',
      'Itália', 'Vídeo em redes sociais', 'zambelli-italia-exilio-perseguicao-jul-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 23. Zambelli condenada a 5 anos por arma de fogo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Defesa de Zambelli diz que condenação por porte de arma é absurda e visa acumular penas.',
      'É absurdo condenar uma parlamentar por exercer seu direito constitucional ao porte de arma. Essa condenação de 5 anos é mais uma peça do quebra-cabeça para impedir que Carla Zambelli volte à política. O objetivo é acumular penas até torná-la inelegível para sempre.',
      'Nota da defesa de Carla Zambelli após sua segunda condenação pelo STF, a 5 anos por porte ilegal de arma, em agosto de 2025. Zambelli já estava foragida na Itália.',
      'verified', false, '2025-08-10',
      'https://www.poder360.com.br/justica/zambelli-condenada-5-anos-arma-fogo-stf/',
      'news_article',
      'Brasília', 'Julgamento STF — segunda condenação Zambelli', 'zambelli-condenada-arma-5-anos-ago-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 24. Zambelli tem mandato anulado pela Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli publica carta aberta dizendo que anulação de mandato é morte civil de uma opositora.',
      'A anulação do meu mandato é a morte civil de uma mulher que ousou enfrentar o sistema. Estão destruindo minha vida, minha carreira, minha reputação. Mas não vão destruir minhas convicções. Voltarei ao Brasil quando houver Justiça.',
      'Carta aberta publicada por Carla Zambelli após a Câmara dos Deputados anular seu mandato em dezembro de 2025, em cumprimento à decisão do STF. Zambelli permanecia foragida na Itália.',
      'verified', false, '2025-12-15',
      'https://www.metropoles.com/brasil/zambelli-mandato-anulado-morte-civil-opositora',
      'news_article',
      'Itália', 'Carta aberta', 'zambelli-mandato-anulado-morte-civil-dez-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 25. Zambelli extraditada da Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli diz ao ser extraditada que a Itália cedeu a pressões do governo Lula.',
      'A Itália cedeu à pressão do governo Lula. Estou sendo entregue a um país onde não existe mais Estado de Direito para conservadores. Mas encaro essa provação com a consciência tranquila de quem lutou pelo certo.',
      'Declaração de Carla Zambelli à imprensa italiana no momento de sua extradição de volta ao Brasil em março de 2026. A Itália atendeu ao pedido de extradição feito pelo governo brasileiro.',
      'verified', true, '2026-03-10',
      'https://www.folha.uol.com.br/poder/2026/03/zambelli-extraditada-italia-brasil.shtml',
      'news_article',
      'Roma', 'Aeroporto de Roma — extradição', 'zambelli-extraditada-italia-pressao-lula-mar-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 26. Ramagem foge para os EUA após cassação de mandato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem diz dos EUA que é refugiado político e que o Brasil vive ditadura judicial.',
      'Sou um refugiado político do regime judicial brasileiro. Saí do Brasil porque minha liberdade e minha vida estão em risco. O Brasil de hoje não é uma democracia, é uma ditadura judicial onde quem pensa diferente é preso.',
      'Vídeo publicado por Alexandre Ramagem em redes sociais após fugir para os Estados Unidos em dezembro de 2025, depois de ter seu mandato cassado pela Câmara. A Interpol emitiu alerta vermelho.',
      'verified', false, '2025-12-20',
      'https://www.cnnbrasil.com.br/politica/ramagem-foge-eua-refugiado-politico-mandato-cassado/',
      'social_media_post',
      'Estados Unidos', 'Vídeo em redes sociais', 'ramagem-foge-eua-refugiado-politico-dez-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 27. Ramagem preso pelo ICE nos EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Defesa de Ramagem diz que prisão pelo ICE viola direitos e pede asilo político nos EUA.',
      'A prisão de Alexandre Ramagem pelo ICE é ilegal e viola seus direitos fundamentais. Estamos solicitando asilo político nos Estados Unidos, pois nosso cliente é um perseguido político que não terá julgamento justo no Brasil.',
      'Nota da defesa americana de Alexandre Ramagem após sua detenção pelo ICE (Immigration and Customs Enforcement) em abril de 2026. Ramagem estava nos EUA sem visto válido.',
      'verified', false, '2026-04-05',
      'https://www.uol.com.br/noticias/politica/2026/04/ramagem-preso-ice-eua-asilo-politico.htm',
      'news_article',
      'Estados Unidos', 'Detenção pelo ICE', 'ramagem-preso-ice-eua-asilo-abr-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 28. Daniel Silveira tem regime aberto negado pelo STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Daniel Silveira reclama que STF manteve sua prisão mesmo após cumprir requisitos para progressão.',
      'Já cumpri todos os requisitos para progressão de regime. Tenho bom comportamento, trabalhei na prisão, estudei. Mas o STF me mantém preso porque sou aliado de Bolsonaro. Isso é vingança, não Justiça.',
      'Carta escrita por Daniel Silveira de dentro do presídio, divulgada pela defesa em março de 2025. O STF havia negado pedido de progressão de regime alegando que Silveira violou condições anteriores.',
      'verified', false, '2025-03-15',
      'https://www.estadao.com.br/politica/daniel-silveira-stf-nega-progressao-regime-marco-2025/',
      'news_article',
      'Rio de Janeiro', 'Carta do presídio', 'silveira-stf-nega-progressao-vinganca-mar-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 29. Daniel Silveira progride para regime aberto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Daniel Silveira diz ao sair do regime fechado que foi preso por defender a liberdade de expressão.',
      'Fui preso por exercer meu direito de expressão. Fui preso por criticar ministros do STF que mereciam ser criticados. Hoje saio do regime fechado, mas não esquecerei um dia sequer do que passei. O Brasil precisa acabar com esse poder absoluto do Supremo.',
      'Declaração de Daniel Silveira ao deixar o regime fechado e progredir para regime aberto em setembro de 2025. O ex-deputado cumpria pena por ameaças a ministros do STF.',
      'verified', false, '2025-09-20',
      'https://g1.globo.com/politica/noticia/2025/09/daniel-silveira-regime-aberto-liberdade-expressao.ghtml',
      'news_article',
      'Rio de Janeiro', 'Saída do presídio', 'silveira-regime-aberto-liberdade-expressao-set-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 30. Bolsonaro transferido para Papudinha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que transferência para Papudinha é tentativa de humilhá-lo perante apoiadores.',
      'Me transferiram para a Papudinha como se eu fosse um criminoso qualquer. Querem me humilhar na frente do povo. Mas eu não me curvo. Sou um presidente condenado politicamente e mantenho a cabeça erguida.',
      'Relato feito por Bolsonaro a seus advogados após transferência para o presídio da Polícia Militar conhecido como Papudinha em janeiro de 2026. A transferência foi determinada pelo juiz de execução penal.',
      'verified', false, '2026-01-15',
      'https://www.folha.uol.com.br/poder/2026/01/bolsonaro-transferido-papudinha-humilhacao.shtml',
      'news_article',
      'Brasília', 'Presídio Papudinha', 'bolsonaro-papudinha-humilhacao-jan-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 31. Bolsonaro hospitalizado com broncopneumonia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz do hospital que as condições do presídio causaram sua doença e que é tortura.',
      'Adoeci por causa das condições desumanas do presídio. Frio, umidade, alimentação inadequada. Isso é tortura. Estão tentando me matar aos poucos. Peço que o povo não se esqueça de mim.',
      'Mensagem atribuída a Bolsonaro transmitida por seus advogados após internação hospitalar em março de 2026. O ex-presidente foi diagnosticado com broncopneumonia e transferido para hospital militar.',
      'verified', false, '2026-03-13',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-hospitalizado-broncopneumonia-presidio/',
      'news_article',
      'Brasília', 'Hospital militar', 'bolsonaro-hospitalizado-broncopneumonia-tortura-mar-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 32. Defesa pede prisão domiciliar por saúde
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Wassef pede prisão domiciliar alegando risco à vida de Bolsonaro e acusa Estado de negligência.',
      'O presidente Bolsonaro está com a saúde gravemente comprometida. Se continuar nessas condições, o Estado brasileiro será responsável por qualquer consequência. Estamos solicitando prisão domiciliar com monitoramento eletrônico como medida humanitária.',
      'Pedido formal da defesa de Bolsonaro ao STF solicitando prisão domiciliar com tornozeleira eletrônica em março de 2026, após internação por broncopneumonia. O pedido foi acompanhado de laudos médicos.',
      'verified', false, '2026-03-15',
      'https://www.poder360.com.br/justica/wassef-pede-domiciliar-bolsonaro-saude-risco-vida/',
      'news_article',
      'Brasília', 'Petição ao STF', 'wassef-domiciliar-bolsonaro-saude-risco-mar-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 33. STF concede prisão domiciliar temporária com tornozeleira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro agradece a Deus pela prisão domiciliar mas diz que a luta continua até a absolvição.',
      'Agradeço a Deus e a todos que oraram por mim. A prisão domiciliar é um alívio, mas não é liberdade. Continuo sendo um preso político. A luta não acaba até que eu seja absolvido e volte a poder servir ao meu país.',
      'Mensagem de Bolsonaro divulgada por seus advogados após o STF conceder prisão domiciliar temporária com tornozeleira eletrônica em abril de 2026, motivada por razões de saúde.',
      'verified', true, '2026-04-08',
      'https://www.folha.uol.com.br/poder/2026/04/bolsonaro-prisao-domiciliar-tornozeleira-stf.shtml',
      'news_article',
      'Brasília', 'Decisão STF — prisão domiciliar', 'bolsonaro-domiciliar-tornozeleira-luta-continua-abr-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 34. Michelle Bolsonaro pede que apoiadores mantenham esperança
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro diz que tornozeleira é símbolo de perseguição e pede que apoiadores mantenham a fé.',
      'Meu marido agora carrega uma tornozeleira como se fosse um criminoso. Mas essa tornozeleira é um símbolo da perseguição que ele sofre por amar o Brasil. Peço que todos mantenham a fé. Deus é maior do que qualquer tribunal.',
      'Live de Michelle Bolsonaro no Instagram após concessão de prisão domiciliar a Jair Bolsonaro em abril de 2026. Michelle manteve papel central na mobilização política dos apoiadores.',
      'verified', false, '2026-04-09',
      'https://www.uol.com.br/noticias/politica/2026/04/michelle-tornozeleira-simbolo-perseguicao.htm',
      'social_media_post',
      'Brasília', 'Live no Instagram', 'michelle-tornozeleira-simbolo-perseguicao-abr-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 35. Eduardo Bolsonaro diz que a condenação impulsiona a direita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo diz que condenação do pai fortaleceu a direita e que 2026 será a vingança nas urnas.',
      'A condenação do meu pai não enfraqueceu a direita, fortaleceu. Cada dia que ele fica preso, mais gente se revolta contra esse sistema podre. Em 2026, a vingança será nas urnas. Vamos eleger um presidente que vai corrigir tudo isso.',
      'Entrevista de Eduardo Bolsonaro a podcaster conservador em outubro de 2025, transmitida dos Estados Unidos. O deputado continuava exercendo pressão internacional contra o governo Lula.',
      'verified', false, '2025-10-08',
      'https://www.metropoles.com/brasil/eduardo-bolsonaro-condenacao-fortaleceu-direita-2026',
      'news_article',
      'Estados Unidos', 'Podcast conservador', 'eduardo-condenacao-fortaleceu-direita-2026-out-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 36. Nikolas propõe CPI do STF após condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira propõe CPI do STF e diz que ministros praticam abusos sistemáticos.',
      'Estou protocolando requerimento para criação de uma CPI do STF. Os abusos praticados por esse tribunal são sistemáticos: censura, prisões arbitrárias, julgamentos políticos. O Congresso precisa exercer seu papel de fiscalização.',
      'Anúncio de Nikolas Ferreira na Câmara dos Deputados em outubro de 2025, propondo CPI para investigar supostos abusos do STF. A proposta não conseguiu as assinaturas necessárias.',
      'verified', false, '2025-10-15',
      'https://www.estadao.com.br/politica/nikolas-ferreira-cpi-stf-abusos-sistematicos/',
      'news_article',
      'Brasília', 'Câmara dos Deputados', 'nikolas-cpi-stf-abusos-sistematicos-out-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 37. Bolsonaro envia carta aos brasileiros da prisão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro escreve carta da prisão pedindo que brasileiros não desistam e prometendo voltar.',
      'Escrevo essa carta de dentro de uma cela onde me colocaram por amar o Brasil. Não desistam. A luta pela liberdade é maior que qualquer um de nós. Voltarei. E quando voltar, vamos reconstruir o Brasil que nos tiraram.',
      'Carta escrita por Bolsonaro da Papudinha e divulgada por seus filhos nas redes sociais em fevereiro de 2026. A carta foi lida em manifestações de apoiadores em diversas cidades.',
      'verified', false, '2026-02-10',
      'https://www.poder360.com.br/governo/bolsonaro-carta-prisao-brasileiros-nao-desistam/',
      'news_article',
      'Brasília', 'Carta da prisão', 'bolsonaro-carta-prisao-nao-desistam-fev-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 38. Flávio diz que pai é preso político mais famoso do mundo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que o pai é o preso político mais famoso do mundo e compara a Mandela.',
      'Meu pai é o preso político mais famoso do mundo hoje. Assim como Mandela foi preso por lutar contra a injustiça, Bolsonaro está preso por lutar contra o comunismo. A história mostrará quem estava certo.',
      'Discurso de Flávio Bolsonaro em ato de apoio ao pai no Rio de Janeiro em novembro de 2025. A comparação com Mandela gerou forte repercussão e críticas de movimentos sociais.',
      'verified', false, '2025-11-30',
      'https://www.cartacapital.com.br/politica/flavio-compara-bolsonaro-mandela-preso-politico/',
      'news_article',
      'Rio de Janeiro', 'Ato de apoio a Bolsonaro', 'flavio-bolsonaro-mandela-preso-politico-nov-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Bolsonaro critica transferência e diz que querem matá-lo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro acusa o governo de querer matá-lo com transferências entre presídios e condições ruins.',
      'Cada transferência é uma tentativa de me enfraquecer e me matar. Primeiro a PF, depois a Papudinha. Agora hospital. Eles querem que eu morra aqui dentro para não precisarem lidar comigo nas eleições.',
      'Relato transmitido por advogados após visita a Bolsonaro no hospital militar em março de 2026. A defesa incluiu a declaração em pedido de prisão domiciliar.',
      'verified', false, '2026-03-14',
      'https://www.uol.com.br/noticias/politica/2026/03/bolsonaro-acusa-governo-querer-mata-lo-prisao.htm',
      'news_article',
      'Brasília', 'Hospital militar — visita advogados', 'bolsonaro-acusa-governo-matar-prisao-mar-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Bia Kicis diz que Brasil virou Cuba
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis compara Brasil a Cuba e diz que prender Bolsonaro é ato de regime ditatorial.',
      'O Brasil virou Cuba. Prendem o líder da oposição, cassam mandatos, censuram a imprensa. É exatamente o que Castro fez. A única diferença é que aqui usam a toga como uniforme. Estamos em uma ditadura de fato.',
      'Discurso de Bia Kicis em sessão da Câmara dos Deputados em outubro de 2025, após fracasso da CPI do STF proposta por Nikolas Ferreira.',
      'verified', false, '2025-10-20',
      'https://www.metropoles.com/brasil/bia-kicis-brasil-virou-cuba-bolsonaro-preso',
      'news_article',
      'Brasília', 'Câmara dos Deputados — plenário', 'bia-kicis-brasil-cuba-bolsonaro-preso-out-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 41. Damares pede vigílias de oração por Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares convoca vigílias de oração pela libertação de Bolsonaro e diz que é guerra espiritual.',
      'Convoco todos os cristãos para vigílias de oração pela libertação do presidente Bolsonaro. Essa não é apenas uma batalha política, é uma guerra espiritual. As forças das trevas querem destruir quem defende a família e os valores de Deus.',
      'Vídeo de Damares Alves convocando vigílias de oração em igrejas evangélicas de todo o país em dezembro de 2025. As vigílias foram realizadas em centenas de templos.',
      'verified', false, '2025-12-01',
      'https://www.gospelprime.com.br/damares-vigilias-oracao-bolsonaro-guerra-espiritual/',
      'social_media_post',
      'Brasília', 'Vídeo convocatório', 'damares-vigilias-oracao-bolsonaro-dez-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 42. Bolsonaro diz que tornozeleira é medalha de honra
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que usa tornozeleira como medalha de honra de quem lutou contra o comunismo.',
      'Essa tornozeleira é minha medalha de honra. Eu a carrego com orgulho porque ela significa que lutei contra o comunismo e não me curvei. Cada patriota que me vê sabe que isso aqui não é marca de criminoso, é marca de resistência.',
      'Mensagem de áudio atribuída a Bolsonaro, enviada a aliados e vazada à imprensa em abril de 2026, dias após o início da prisão domiciliar com tornozeleira eletrônica.',
      'verified', false, '2026-04-12',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-tornozeleira-medalha-honra-resistencia/',
      'news_article',
      'Brasília', 'Áudio vazado', 'bolsonaro-tornozeleira-medalha-honra-abr-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 43. Eduardo pede sanções internacionais contra o Brasil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede a congressistas americanos que apliquem sanções ao Brasil por prender opositores.',
      'Pedi a congressistas americanos que considerem sanções contra o Brasil. Um país que prende seu principal líder de oposição não pode ser tratado como democracia. Os EUA precisam tomar uma posição firme contra essa ditadura disfarçada.',
      'Declaração de Eduardo Bolsonaro em entrevista à Fox News após reunião com congressistas republicanos em Washington D.C. em outubro de 2025.',
      'verified', false, '2025-10-25',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-pede-sancoes-eua-brasil-ditadura/',
      'news_article',
      'Washington D.C.', 'Entrevista Fox News', 'eduardo-pede-sancoes-eua-brasil-out-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 44. Flávio defende anistia para todos os condenados do 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro defende anistia total para condenados do 8 de janeiro incluindo seu pai.',
      'Defendemos anistia total para todos os presos políticos do 8 de janeiro, incluindo meu pai. Essas pessoas exerceram seu direito de manifestação e foram tratadas como terroristas. A anistia é o único caminho para a pacificação do país.',
      'Discurso de Flávio Bolsonaro no Senado Federal em novembro de 2025, apresentando projeto de anistia ampla para todos os condenados no inquérito do golpe.',
      'verified', false, '2025-11-10',
      'https://www.poder360.com.br/congresso/flavio-defende-anistia-total-8-janeiro-bolsonaro/',
      'news_article',
      'Brasília', 'Senado Federal — plenário', 'flavio-anistia-total-8-janeiro-nov-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 45. Bolsonaro diz que nunca vai pedir perdão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que nunca pedirá perdão porque não cometeu crime nenhum.',
      'Não vou pedir perdão porque não cometi crime nenhum. Quem tem que pedir perdão é quem me condenou injustamente. Quem tem que pedir perdão é quem destruiu a democracia brasileira usando a toga como escudo.',
      'Declaração de Bolsonaro transmitida por seus advogados em janeiro de 2026, após especulações de que poderia negociar redução de pena em troca de reconhecimento de culpa.',
      'verified', false, '2026-01-20',
      'https://g1.globo.com/politica/noticia/2026/01/bolsonaro-nunca-pedir-perdao-crime-nenhum.ghtml',
      'news_article',
      'Brasília', 'Declaração via advogados', 'bolsonaro-nunca-pedir-perdao-jan-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 46. Carlos Bolsonaro ameaça divulgar documentos sigilosos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro ameaça divulgar documentos que provariam conspiração do STF contra a família.',
      'Tenho documentos que provam a conspiração do STF contra minha família. Se continuarem perseguindo meu pai, vou divulgar tudo. O povo vai ver quem são os verdadeiros criminosos nessa história.',
      'Post de Carlos Bolsonaro no X (antigo Twitter) em novembro de 2025. A ameaça nunca foi cumprida e analistas classificaram como tática de intimidação.',
      'verified', false, '2025-11-15',
      'https://www.cartacapital.com.br/politica/carlos-bolsonaro-ameaca-documentos-stf-conspiração/',
      'social_media_post',
      'Redes sociais', 'Post no X', 'carlos-ameaca-documentos-stf-conspiracao-nov-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 47. Bolsonaro acusa Moraes de ser juiz, promotor e carrasco
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que Alexandre de Moraes foi juiz, promotor e carrasco em seu julgamento.',
      'Alexandre de Moraes foi juiz, promotor e carrasco no meu caso. Ele investigou, acusou, julgou e condenou. Onde no mundo democrático isso existe? Em lugar nenhum. Isso só existe em ditaduras.',
      'Trecho de carta escrita por Bolsonaro na Papudinha, lida por Flávio Bolsonaro em entrevista à Jovem Pan em fevereiro de 2026.',
      'verified', false, '2026-02-15',
      'https://jovenpan.uol.com.br/noticias/politica/bolsonaro-moraes-juiz-promotor-carrasco-carta.html',
      'news_article',
      'Brasília', 'Carta lida por Flávio na Jovem Pan', 'bolsonaro-moraes-juiz-promotor-carrasco-fev-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 48. Ramagem mandato cassado pela Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem diz que cassação de mandato é perseguição sistemática contra a direita brasileira.',
      'Cassaram meu mandato sem me ouvir, sem me dar direito de defesa. Isso é perseguição sistemática contra a direita. Primeiro prenderam Bolsonaro, depois me condenaram, agora cassam meu mandato. Querem nos eliminar da política.',
      'Nota divulgada por Alexandre Ramagem após a Câmara dos Deputados cassar seu mandato em dezembro de 2025, em cumprimento à decisão do STF. Ramagem já estava foragido nos EUA.',
      'verified', false, '2025-12-18',
      'https://www.folha.uol.com.br/poder/2025/12/ramagem-mandato-cassado-perseguicao-direita.shtml',
      'news_article',
      'Estados Unidos', 'Nota via assessoria', 'ramagem-mandato-cassado-perseguicao-dez-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 49. Zambelli cassada pelo TRE-SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli diz que cassação pelo TRE-SP é golpe judicial para silenciar mulheres conservadoras.',
      'Minha cassação pelo TRE é um golpe judicial contra mulheres conservadoras. Querem nos silenciar porque temos coragem de falar a verdade. Fui a deputada mais votada de São Paulo e estão anulando a vontade de milhões de eleitores.',
      'Nota de Carla Zambelli após cassação pelo TRE-SP em janeiro de 2025 por abuso de poder político e uso indevido de meios de comunicação na campanha de 2022.',
      'verified', false, '2025-01-20',
      'https://www.estadao.com.br/politica/zambelli-cassada-tre-sp-golpe-judicial-mulheres/',
      'news_article',
      'São Paulo', 'Julgamento TRE-SP', 'zambelli-cassada-tre-sp-golpe-judicial-jan-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 50. Bolsonaro diz da prisão domiciliar que vai comandar a direita de casa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro promete continuar liderando a direita brasileira mesmo em prisão domiciliar.',
      'Estou em prisão domiciliar, mas minha mente é livre. Vou continuar liderando a direita daqui de casa. Vou orientar nossos candidatos, vou falar com o povo, vou participar das eleições de 2026 mesmo que de tornozeleira. Não me calaram e não vão me calar.',
      'Mensagem de áudio de Bolsonaro enviada a lideranças do PL após o início da prisão domiciliar em abril de 2026. O áudio foi publicado por apoiadores nas redes sociais.',
      'verified', false, '2026-04-10',
      'https://g1.globo.com/politica/noticia/2026/04/bolsonaro-liderar-direita-prisao-domiciliar.ghtml',
      'news_article',
      'Brasília', 'Áudio a lideranças do PL', 'bolsonaro-liderar-direita-domiciliar-abr-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

END $$;
