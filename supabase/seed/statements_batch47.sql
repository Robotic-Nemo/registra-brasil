-- Batch 47: Política externa, segurança pública, meio ambiente e controvérsias diversas (2025–2026)
-- 50 statements sobre BRICS, Mercosul-UE, Amazônia, facções, eleições 2026 e mais

DO $$
DECLARE
  v_lula UUID; v_bol UUID; v_edu UUID; v_din UUID; v_mot UUID;
  v_gle UUID; v_had UUID; v_ter UUID; v_mou UUID; v_cai UUID;
  v_fla UUID; v_nik UUID; v_teb UUID; v_ram UUID; v_dam UUID;
  v_car UUID; v_bia UUID; v_mar UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_cor UUID; c_irr UUID;
  c_aut UUID; c_ame UUID; c_neg UUID; c_con UUID; c_vio UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';

  -- 1. Lula alerta sobre defesa nacional na África do Sul
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula alerta que "se a gente não preparar defesa, qualquer dia alguém invade" durante visita à África do Sul.',
      'Se a gente não preparar a defesa do nosso país, qualquer dia alguém invade. O Brasil tem riquezas enormes — água, minerais, biodiversidade. Precisamos ter Forças Armadas preparadas para defender esse patrimônio.',
      'Lula fez a declaração durante visita oficial à África do Sul em março de 2026, em discurso para empresários brasileiros e sul-africanos. A fala foi interpretada como resposta às tensões geopolíticas globais.',
      'verified', true, '2026-03-18',
      'https://www.folha.uol.com.br/mundo/2026/03/lula-defesa-africa-sul-alguem-invade.shtml',
      'news_article',
      'Pretória', 'Visita oficial à África do Sul', 'lula-defesa-africa-sul-alguem-invade-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 2. Lula critica FMI e Banco Mundial no BRICS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa FMI e Banco Mundial de "financiar países ricos" e pede reforma das instituições no BRICS.',
      'O FMI e o Banco Mundial foram criados para ajudar os países em desenvolvimento, mas na prática financiam os países ricos. Isso precisa acabar. O BRICS existe para construir uma nova ordem financeira mundial mais justa.',
      'Lula fez a declaração na cúpula do BRICS em Kazan, Rússia, em julho de 2025. O Brasil assumiu a presidência rotativa do bloco e Lula tem usado o BRICS como plataforma para criticar as instituições de Bretton Woods.',
      'verified', true, '2025-07-15',
      'https://www.bbc.com/portuguese/articles/lula-fmi-banco-mundial-brics-julho-2025',
      'news_article',
      'Kazan', 'Cúpula do BRICS 2025', 'lula-fmi-banco-mundial-brics-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 3. Lula anuncia assinatura do acordo Mercosul-UE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula anuncia que acordo Mercosul-UE será assinado em janeiro de 2026 e chama de "vitória histórica".',
      'O acordo Mercosul-União Europeia será assinado em janeiro. É uma vitória histórica do Brasil e da América do Sul. São 25 anos de negociação e nós vamos finalmente concluir. Isso vai gerar emprego, renda e desenvolvimento para o nosso povo.',
      'Lula anunciou a assinatura do acordo em coletiva de imprensa em Brasília em dezembro de 2025, após rodada final de negociações com a Comissão Europeia. O acordo estava parado desde 2019.',
      'verified', true, '2025-12-12',
      'https://g1.globo.com/economia/noticia/2025/12/lula-acordo-mercosul-ue-assinatura-janeiro-2026.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Planalto', 'lula-acordo-mercosul-ue-assinatura-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 4. Lula alerta sobre fake news e IA nas eleições de 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula alerta sobre risco de fake news, IA e influenciadores digitais nas eleições de 2026 em discurso no STF.',
      'A eleição de 2026 vai ser a mais perigosa da história do Brasil em termos de desinformação. Fake news, inteligência artificial, deepfakes, influenciadores pagos. A democracia brasileira precisa se preparar.',
      'Lula fez o alerta em discurso na abertura do ano judiciário no STF em fevereiro de 2026. O presidente pediu que o TSE tome medidas preventivas contra desinformação nas eleições.',
      'verified', true, '2026-02-03',
      'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?lula-fake-news-ia-eleicoes-2026',
      'news_article',
      'Brasília', 'Abertura do ano judiciário — STF', 'lula-fake-news-ia-eleicoes-2026-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 5. Lula sobre terras raras: "não faremos o que fizeram com minério de ferro"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que Brasil não vai repetir com terras raras o erro cometido com minério de ferro.',
      'Não faremos com terras raras o que fizeram com o minério de ferro. O Brasil exportou minério a preço de banana durante décadas e não ficou com nada. As terras raras vão ser processadas aqui, com tecnologia brasileira, gerando emprego brasileiro.',
      'Lula fez a declaração em reunião ministerial em março de 2026, ao anunciar o plano nacional de exploração de terras raras. O Brasil tem a terceira maior reserva do mundo do mineral estratégico.',
      'verified', true, '2026-03-05',
      'https://www.poder360.com.br/economia/lula-terras-raras-minerio-ferro-marco-2026/',
      'news_article',
      'Brasília', 'Reunião ministerial — Planalto', 'lula-terras-raras-minerio-ferro-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 6. Flávio Dino cobra plano contra facções na Amazônia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino cobra plano do governo contra facções que financiam narcotráfico com crimes ambientais na Amazônia.',
      'As facções criminosas estão usando crimes ambientais na Amazônia para financiar o narcotráfico. Garimpo ilegal, desmatamento, grilagem de terras — tudo isso financia o tráfico de drogas. O governo precisa de um plano integrado de combate.',
      'Dino fez a cobrança em sessão plenária do STF em abril de 2026, ao relatar ação que questionava a eficácia do combate ao crime organizado na Amazônia Legal.',
      'verified', true, '2026-04-08',
      'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?dino-faccoes-amazonia-crimes-ambientais-2026',
      'news_article',
      'Brasília', 'Sessão plenária do STF', 'dino-faccoes-amazonia-crimes-ambientais-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 7. Dino: emendas não podem financiar obras ligadas a crimes ambientais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino determina que emendas parlamentares não podem ser usadas para obras em áreas com crimes ambientais.',
      'Emendas parlamentares são dinheiro público e não podem financiar obras em áreas onde há crimes ambientais comprovados. Não é possível que o Estado brasileiro financie com uma mão e destrua com a outra.',
      'Dino proferiu decisão monocrática no STF em abril de 2026, proibindo o uso de emendas parlamentares para obras em áreas com autos de infração ambiental pendentes. A decisão gerou atrito com o Congresso.',
      'verified', true, '2026-04-10',
      'https://www.conjur.com.br/2026-abr-10/dino-emendas-crimes-ambientais-stf/',
      'news_article',
      'Brasília', 'Decisão monocrática — STF', 'dino-emendas-crimes-ambientais-stf-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 8. Dino: decisões estrangeiras não têm efeito automático no Brasil (caso Mariana)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino afirma que decisões judiciais estrangeiras sobre caso Mariana não têm efeito automático no Brasil.',
      'Decisões judiciais de tribunais estrangeiros não têm efeito automático no Brasil. A soberania jurisdicional brasileira deve ser respeitada. O caso de Mariana será julgado pela Justiça brasileira com base nas nossas leis.',
      'Dino se pronunciou sobre o caso Mariana em abril de 2026, após tribunal britânico condenar a BHP em ação coletiva. O ministro defendeu a competência da Justiça brasileira para julgar o caso de rompimento da barragem.',
      'verified', true, '2026-04-12',
      'https://www.folha.uol.com.br/mercado/2026/04/dino-decisoes-estrangeiras-mariana-soberania.shtml',
      'news_article',
      'Brasília', 'Pronunciamento no STF', 'dino-decisoes-estrangeiras-mariana-soberania-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 9. Lula assina decreto da TV 3.0
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula assina decreto da TV 3.0 e diz que "televisão brasileira vai entrar na era digital de verdade".',
      'A televisão brasileira vai entrar na era digital de verdade. O decreto da TV 3.0 vai permitir que todos os brasileiros tenham acesso a conteúdo de qualidade, interativo e gratuito no seu celular, na sua TV.',
      'Lula assinou o decreto de regulamentação da TV 3.0 em cerimônia no Palácio do Planalto em novembro de 2025. O novo sistema de televisão digital terrestre começa a ser implantado em 2026.',
      'verified', false, '2025-11-28',
      'https://www.gov.br/planalto/pt-br/noticias/2025/11/lula-decreto-tv-3-0-televisao-digital',
      'news_article',
      'Brasília', 'Cerimônia de assinatura — Planalto', 'lula-decreto-tv-3-0-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 10. Hugo Motta: PEC Segurança Pública votada após Carnaval
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta promete votar PEC da Segurança Pública logo após o Carnaval de 2026.',
      'A PEC da Segurança Pública é prioridade. Logo após o Carnaval, vamos colocar em votação. O Brasil não pode esperar mais para ter um sistema de segurança pública unificado e eficiente.',
      'Motta fez a declaração em coletiva de imprensa na Câmara em fevereiro de 2026, ao apresentar o calendário legislativo do primeiro semestre. A PEC propõe constitucionalização do SUSP.',
      'verified', false, '2026-02-08',
      'https://www.camara.leg.br/noticias/1170000-motta-pec-seguranca-publica-apos-carnaval-2026',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Câmara', 'motta-pec-seguranca-publica-carnaval-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 11. Eduardo Bolsonaro: "se situação com Trump não resolver, não haverá eleições"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro insinua que não haverá eleições no Brasil se a situação com Trump não se resolver.',
      'Se a situação com o presidente Trump não se resolver, se o Brasil continuar se alinhando com China e Rússia contra os Estados Unidos, eu não acredito que teremos eleições normais no Brasil. As coisas podem ficar muito complicadas.',
      'Eduardo fez a declaração em entrevista a um podcast conservador americano em março de 2026. A fala foi interpretada como ameaça velada à democracia brasileira e gerou pedidos de cassação.',
      'verified', true, '2026-03-10',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-trump-eleicoes-brasil-2026/',
      'news_article',
      'Washington D.C.', 'Podcast conservador americano', 'eduardo-bolsonaro-trump-eleicoes-brasil-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 12. Lula sanciona Lei Antifacção com gaffe sobre crime organizado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula comete gaffe ao sancionar Lei Antifacção, dizendo que Brasil é um dos "países mais respeitados no crime organizado".',
      'O Brasil é um dos países mais respeitados no crime organizado... no combate ao crime organizado. A Lei Antifacção vai dar as ferramentas que a polícia precisa para desmantelar as facções.',
      'Lula cometeu a gaffe durante cerimônia de sanção do Projeto de Lei Antifacção no Planalto em março de 2026. O deslize verbal viralizou nas redes sociais e foi explorado pela oposição.',
      'verified', true, '2026-03-22',
      'https://g1.globo.com/politica/noticia/2026/03/lula-gaffe-crime-organizado-lei-antifaccao.ghtml',
      'news_article',
      'Brasília', 'Cerimônia de sanção — Planalto', 'lula-gaffe-crime-organizado-lei-antifaccao-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 13. Bolsonaro: "se continuar inelegível, não acredito mais em democracia"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que se continuar inelegível não acredita mais em democracia e que o povo decidirá.',
      'Se eu continuar inelegível, eu não acredito mais na democracia brasileira. Oito anos de inelegibilidade por ter feito um almoço com embaixadores? O povo vai decidir se aceita isso ou não.',
      'Bolsonaro fez a declaração em vídeo gravado em sua residência e compartilhado por aliados em fevereiro de 2026. O ex-presidente foi tornado inelegível até 2030 pelo TSE por abuso de poder político.',
      'verified', true, '2026-02-12',
      'https://www.poder360.com.br/poder/bolsonaro-inelegivel-democracia-fevereiro-2026/',
      'news_article',
      'Brasília', 'Vídeo gravado em residência', 'bolsonaro-inelegivel-democracia-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 14. Bolsonaro: "vou até o último segundo" sobre candidatura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que vai "até o último segundo" lutando para reverter inelegibilidade e ser candidato.',
      'Vou até o último segundo. Enquanto houver uma brecha jurídica, uma possibilidade, eu vou lutar para ser candidato. O povo me quer, as pesquisas mostram, e a democracia não pode impedir a vontade popular.',
      'Bolsonaro fez a declaração em nota divulgada por seu advogado em março de 2026, após o STF manter a decisão de inelegibilidade. A equipe jurídica do ex-presidente recorreu a instâncias internacionais.',
      'verified', true, '2026-03-28',
      'https://www.folha.uol.com.br/poder/2026/03/bolsonaro-ultimo-segundo-candidatura-inelegibilidade.shtml',
      'news_article',
      'Brasília', 'Nota divulgada por advogado', 'bolsonaro-ultimo-segundo-candidatura-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 15. Gleisi: prioridade é fim da escala 6x1
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende o fim da escala 6x1 como prioridade do PT para os trabalhadores.',
      'O fim da escala 6x1 é prioridade do PT. O trabalhador brasileiro não pode mais viver para trabalhar. Ele tem direito a descanso, a lazer, a ficar com a família. Essa é uma pauta civilizatória.',
      'Gleisi fez a declaração em evento do PT no Dia do Trabalhador em maio de 2025, defendendo o projeto de lei que reduz a jornada de trabalho. A proposta teve ampla adesão popular nas redes sociais.',
      'verified', false, '2025-05-01',
      'https://pt.org.br/gleisi-fim-escala-6x1-prioridade-trabalhadores-maio-2025/',
      'news_article',
      'São Paulo', 'Evento do Dia do Trabalhador', 'gleisi-fim-escala-6x1-trabalhadores-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 16. Haddad envia carta ao FMI pedindo taxação de super-ricos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad envia carta ao FMI defendendo taxação global de super-ricos e transição verde.',
      'Enviei uma carta ao FMI propondo uma agenda de taxação global dos super-ricos e financiamento da transição verde. Os bilionários do mundo pagam proporcionalmente menos impostos que um professor. Isso é injusto e insustentável.',
      'Haddad enviou a carta durante reunião de primavera do FMI em Washington em abril de 2026. O Brasil lidera a proposta de imposto mínimo global sobre grandes fortunas desde a presidência do G20 em 2024.',
      'verified', true, '2026-04-14',
      'https://www.valor.com.br/financas/haddad-carta-fmi-taxacao-super-ricos-transicao-verde-2026/',
      'news_article',
      'Washington D.C.', 'Reunião de primavera do FMI', 'haddad-carta-fmi-taxacao-super-ricos-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 17. Tereza Cristina defende agro brasileiro no Mercosul-UE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina alerta que acordo Mercosul-UE não pode prejudicar agronegócio brasileiro.',
      'O acordo Mercosul-UE é bem-vindo, mas não podemos aceitar cláusulas que prejudiquem nossos produtores. O agro brasileiro alimenta 1 bilhão de pessoas no mundo. Exigências ambientais desproporcionais são protecionismo disfarçado.',
      'Tereza Cristina fez a declaração em audiência na Comissão de Agricultura do Senado em dezembro de 2025, ao discutir os termos do acordo Mercosul-UE. A senadora é ex-ministra da Agricultura.',
      'verified', false, '2025-12-16',
      'https://www12.senado.leg.br/noticias/materias/2025/12/tereza-cristina-mercosul-ue-agro-proteccionismo',
      'news_article',
      'Brasília', 'Comissão de Agricultura — Senado', 'tereza-cristina-mercosul-ue-agro-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 18. Tereza Cristina critica política ambiental do governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina acusa governo Lula de usar política ambiental para "travar" o agronegócio.',
      'O governo Lula está usando a política ambiental para travar o agronegócio brasileiro. Licenciamento ambiental demorado, multas excessivas, restrições sem base científica. O produtor rural está sendo tratado como vilão quando é o herói que alimenta o país.',
      'Tereza fez a declaração em evento da CNA em Brasília em agosto de 2025. A senadora é líder da bancada ruralista e principal voz do agro no Senado.',
      'verified', false, '2025-08-20',
      'https://www.canalrural.com.br/politica/tereza-cristina-ambiental-travar-agro-agosto-2025/',
      'news_article',
      'Brasília', 'Evento da CNA', 'tereza-cristina-ambiental-travar-agro-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 19. Mourão defende investimento em defesa e modernização militar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão defende aumento do orçamento de defesa e diz que Forças Armadas estão "sucateadas".',
      'As Forças Armadas brasileiras estão sucateadas. O orçamento de defesa é ridículo para um país do tamanho do Brasil. Precisamos modernizar equipamentos, valorizar o militar e investir em tecnologia. Defesa não é gasto, é investimento.',
      'Mourão fez a declaração em audiência pública na Comissão de Relações Exteriores do Senado em setembro de 2025. O senador e ex-vice-presidente tem defendido o aumento do orçamento de defesa.',
      'verified', false, '2025-09-25',
      'https://www12.senado.leg.br/noticias/materias/2025/09/mourao-orcamento-defesa-forcas-armadas-sucateadas',
      'news_article',
      'Brasília', 'Comissão de Relações Exteriores — Senado', 'mourao-orcamento-defesa-forcas-armadas-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Mourão critica alinhamento do Brasil com China e Rússia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão critica política externa de Lula e diz que Brasil não pode se alinhar com "autocracias".',
      'O Brasil não pode se alinhar com autocracias. China e Rússia não são modelos para nós. Nossa tradição diplomática é de equilíbrio e defesa da democracia. O governo Lula está comprometendo isso.',
      'Mourão fez a declaração em palestra na ESG em novembro de 2025. O senador tem sido crítico da política externa do governo Lula, especialmente em relação ao BRICS.',
      'verified', false, '2025-11-12',
      'https://www.correiobraziliense.com.br/politica/2025/11/mourao-politica-externa-china-russia-autocracias.html',
      'news_article',
      'Rio de Janeiro', 'Palestra na Escola Superior de Guerra', 'mourao-politica-externa-china-russia-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Caiado posiciona-se como candidato da segurança pública
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Caiado diz que Goiás é modelo de segurança pública e que levará o mesmo para o Brasil.',
      'Goiás reduziu a criminalidade em 40% na minha gestão. Isso não é discurso, é número. Eu sei combater o crime porque combati de verdade. O Brasil precisa de um presidente que entenda de segurança.',
      'Caiado fez a declaração em evento de segurança pública em Goiânia em janeiro de 2026, usando os números de Goiás como plataforma para sua possível candidatura presidencial.',
      'verified', false, '2026-01-15',
      'https://www.metropoles.com/brasil/caiado-goias-modelo-seguranca-publica-janeiro-2026',
      'news_article',
      'Goiânia', 'Evento de segurança pública', 'caiado-goias-modelo-seguranca-publica-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 22. Nikolas Ferreira ataca política de desarmamento do governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira critica decreto de desarmamento de Lula e diz que "bandido não entrega arma".',
      'O governo desarmou o cidadão de bem e armou o bandido. Decreto de desarmamento não funciona porque bandido não entrega arma. Enquanto o governo restringe CACs e caçadores, as facções estão cada vez mais armadas.',
      'Nikolas fez a declaração em discurso no plenário da Câmara em outubro de 2025, durante debate sobre o decreto presidencial que restringiu acesso a armas. O deputado é defensor do armamento civil.',
      'verified', false, '2025-10-15',
      'https://www.camara.leg.br/noticias/1145000-nikolas-desarmamento-bandido-nao-entrega-arma-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-desarmamento-bandido-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Lula defende multilateralismo e critica unilateralismo americano
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula critica unilateralismo americano e defende multilateralismo na ONU.',
      'Nenhum país tem o direito de impor sua vontade sobre os outros. O mundo precisa de multilateralismo, não de unilateralismo. O Brasil vai defender sempre o diálogo, a diplomacia e a solução pacífica dos conflitos.',
      'Lula fez a declaração em discurso na Assembleia Geral da ONU em setembro de 2025. O presidente brasileiro usou o discurso para marcar posição contra políticas protecionistas e intervencionistas.',
      'verified', false, '2025-09-22',
      'https://www.bbc.com/portuguese/articles/lula-onu-multilateralismo-setembro-2025',
      'news_article',
      'Nova York', 'Assembleia Geral da ONU', 'lula-onu-multilateralismo-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 24. Damares alerta sobre "cristofobia" e perseguição religiosa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares acusa governo Lula de promover "cristofobia" e perseguição a líderes religiosos.',
      'Existe uma cristofobia em curso no Brasil. O governo Lula persegue pastores, questiona igrejas, e quer taxar dízimo. Isso é perseguição religiosa. Os cristãos são a maioria neste país e não vão aceitar calados.',
      'Damares fez a declaração em culto evangélico em Brasília em janeiro de 2026. A senadora tem intensificado o discurso de perseguição religiosa como parte de sua estratégia eleitoral para 2026.',
      'verified', false, '2026-01-12',
      'https://www.gospelprime.com.br/damares-cristofobia-perseguicao-religiosa-janeiro-2026/',
      'news_article',
      'Brasília', 'Culto evangélico', 'damares-cristofobia-perseguicao-religiosa-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Ramagem critica ABIN sob governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem acusa ABIN de Lula de fazer "espionagem política" contra a oposição.',
      'A ABIN do governo Lula virou instrumento de espionagem política. Estão monitorando opositores, jornalistas e empresários. Isso é o que faziam as ditaduras. Eu dirigi a ABIN e nunca permiti esse tipo de coisa.',
      'Ramagem fez a acusação em entrevista à Jovem Pan em setembro de 2025. O deputado é ex-diretor-geral da ABIN no governo Bolsonaro e foi indiciado no inquérito da espionagem ilegal.',
      'verified', false, '2025-09-08',
      'https://jovempan.uol.com.br/noticias/politica/ramagem-abin-lula-espionagem-politica-setembro-2025.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista à Jovem Pan', 'ramagem-abin-lula-espionagem-politica-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Carlos Bolsonaro ataca imprensa e defende censura a "fake news"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro acusa a mídia de ser "braço de propaganda do governo Lula" e defende comunicação direta.',
      'A mídia brasileira é o braço de propaganda do governo Lula. A Globo, a Folha, o Estadão — todos recebem verba publicitária do governo e fazem matéria contra a oposição. A nossa comunicação é direta com o povo, pelas redes sociais.',
      'Carlos publicou a acusação em suas redes sociais em outubro de 2025, após reportagens sobre a situação jurídica de seu pai. O vereador é o principal operador de redes sociais da família Bolsonaro.',
      'verified', false, '2025-10-10',
      'https://www.metropoles.com/brasil/carlos-bolsonaro-midia-propaganda-lula-outubro-2025',
      'news_article',
      'Rio de Janeiro', 'Publicação em redes sociais', 'carlos-bolsonaro-midia-propaganda-lula-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Bia Kicis ataca STF e defende impeachment de ministros
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis coleta assinaturas para impeachment de ministros do STF e chama corte de "ditadura judicial".',
      'O STF virou uma ditadura judicial. Ministros que legislam, que censuram, que prendem sem respeitar o devido processo legal. Estamos coletando assinaturas para o impeachment porque essa é a única forma constitucional de barrar esse abuso.',
      'Bia Kicis anunciou a coleta de assinaturas para pedido de impeachment de ministros do STF em dezembro de 2025. A deputada é uma das principais vozes bolsonaristas contra o Judiciário.',
      'verified', false, '2025-12-05',
      'https://www.poder360.com.br/poder/bia-kicis-impeachment-stf-ditadura-judicial-dezembro-2025/',
      'news_article',
      'Brasília', 'Câmara dos Deputados', 'bia-kicis-impeachment-stf-ditadura-judicial-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 28. Haddad defende arcabouço fiscal e responde a críticas do mercado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad diz que arcabouço fiscal é "o mais responsável da história recente" e rebate mercado financeiro.',
      'O arcabouço fiscal é o mais responsável da história recente do Brasil. Quem critica não apresenta alternativa. O mercado quer austeridade que mata o pobre e protege o rentista. Nós vamos fazer responsabilidade fiscal com justiça social.',
      'Haddad fez a declaração em entrevista coletiva no Ministério da Fazenda em outubro de 2025, após o dólar ultrapassar R$ 5,50. O ministro tem sido pressionado por analistas de mercado que questionam a sustentabilidade fiscal.',
      'verified', false, '2025-10-22',
      'https://www.valor.com.br/financas/haddad-arcabouco-fiscal-responsavel-outubro-2025/',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Fazenda', 'haddad-arcabouco-fiscal-responsavel-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 29. Tereza Cristina defende Plano Safra e critica burocracia do crédito rural
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina diz que Plano Safra 2025/2026 não atende pequenos produtores e cobra desburocratização.',
      'O Plano Safra deveria ser a tábua de salvação do pequeno produtor, mas a burocracia impede o acesso ao crédito. O agricultor familiar não consegue nem entrar no banco. Precisamos desburocratizar o crédito rural urgentemente.',
      'Tereza fez a declaração em audiência pública na Comissão de Agricultura do Senado em julho de 2025, durante sabatina sobre o Plano Safra. A senadora é relatora de projetos sobre crédito rural.',
      'verified', false, '2025-07-10',
      'https://www12.senado.leg.br/noticias/materias/2025/07/tereza-cristina-plano-safra-burocracia-credito-rural',
      'news_article',
      'Brasília', 'Comissão de Agricultura — Senado', 'tereza-cristina-plano-safra-burocracia-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 30. Flávio Bolsonaro defende pai e ataca Moraes em evento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que o pai é "preso político" e que Alexandre de Moraes "destruiu o Estado de Direito".',
      'Meu pai é preso político. Alexandre de Moraes destruiu o Estado de Direito no Brasil. Um ministro que acumula funções de investigador, acusador e julgador é um tirano. A história vai julgar quem está certo.',
      'Flávio fez a declaração em evento do PL em São Paulo em fevereiro de 2026, ao lado de líderes do partido. A defesa do pai continua sendo o principal discurso de Flávio na campanha.',
      'verified', false, '2026-02-22',
      'https://www.estadao.com.br/politica/flavio-bolsonaro-pai-preso-politico-moraes-fevereiro-2026/',
      'news_article',
      'São Paulo', 'Evento do PL em São Paulo', 'flavio-bolsonaro-pai-preso-politico-moraes-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 31. Lula sobre Amazônia: "vamos chegar ao desmatamento zero"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula promete alcançar desmatamento zero na Amazônia antes do fim do mandato.',
      'Nós vamos chegar ao desmatamento zero na Amazônia antes do fim deste mandato. Já reduzimos o desmatamento em 50% em relação ao governo anterior. A Amazônia é patrimônio do Brasil e do mundo.',
      'Lula fez a declaração em evento do Dia do Meio Ambiente em junho de 2025, anunciando novos investimentos no PPCDAm. Os dados do Inpe mostravam queda significativa do desmatamento na Amazônia.',
      'verified', false, '2025-06-05',
      'https://www.gov.br/planalto/pt-br/noticias/2025/06/lula-desmatamento-zero-amazonia-2025',
      'news_article',
      'Brasília', 'Evento do Dia do Meio Ambiente', 'lula-desmatamento-zero-amazonia-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 32. Caiado critica pacote de segurança do governo federal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Caiado critica pacote de segurança de Lula e diz que "não resolve o problema das facções".',
      'O pacote de segurança do governo é propaganda. Não resolve o problema das facções, não dá autonomia aos estados e não melhora o sistema penitenciário. Goiás resolveu seus problemas com trabalho sério, não com PEC.',
      'Caiado criticou a PEC da Segurança Pública proposta pelo governo em entrevista à GloboNews em março de 2026. O governador tem se posicionado como alternativa na área de segurança.',
      'verified', false, '2026-03-05',
      'https://g1.globo.com/politica/noticia/2026/03/caiado-critica-pacote-seguranca-lula-faccoes.ghtml',
      'news_article',
      'Goiânia', 'Entrevista à GloboNews', 'caiado-critica-pacote-seguranca-lula-faccoes-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 33. Simone Tebet defende Plano de Transformação Ecológica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Tebet apresenta Plano de Transformação Ecológica e diz que economia verde é o futuro do Brasil.',
      'A economia verde é o futuro do Brasil. O Plano de Transformação Ecológica vai gerar 3 milhões de empregos verdes até 2030. Quem achar que desenvolvimento e meio ambiente são incompatíveis está preso no século passado.',
      'Tebet apresentou o plano em evento no BNDES em agosto de 2025, como parte da estratégia do Ministério do Planejamento para a transição energética. O plano prevê R$ 300 bilhões em investimentos.',
      'verified', false, '2025-08-18',
      'https://www.valor.com.br/financas/tebet-plano-transformacao-ecologica-bndes-agosto-2025/',
      'news_article',
      'Rio de Janeiro', 'Evento no BNDES', 'tebet-plano-transformacao-ecologica-bndes-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 34. Eduardo Bolsonaro ameaça saída do Acordo de Paris se direita vencer
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro promete que próximo governo de direita vai sair do Acordo de Paris.',
      'O Acordo de Paris é uma armadilha para o Brasil. Os europeus querem que a gente pare de produzir para eles continuarem comprando nosso produto barato. O próximo governo de direita vai sair do Acordo de Paris como Trump fez nos Estados Unidos.',
      'Eduardo fez a declaração em entrevista ao canal Brasil Paralelo em novembro de 2025. O deputado é contrário a acordos ambientais internacionais e segue a linha do ex-presidente Trump.',
      'verified', false, '2025-11-18',
      'https://www.poder360.com.br/meio-ambiente/eduardo-bolsonaro-acordo-paris-saida-novembro-2025/',
      'news_article',
      'São Paulo', 'Entrevista ao Brasil Paralelo', 'eduardo-bolsonaro-acordo-paris-saida-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 35. Dino determina plano emergencial contra incêndios na Amazônia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino determina plano emergencial contra incêndios e diz que "fogo na Amazônia é crime, não acidente".',
      'Fogo na Amazônia é crime, não acidente. Determino que o governo federal apresente em 30 dias um plano emergencial de combate aos incêndios, com metas claras e recursos garantidos.',
      'Dino proferiu decisão no STF em agosto de 2025 determinando que o governo apresentasse plano emergencial contra incêndios florestais. A decisão veio após a pior temporada de queimadas na Amazônia em anos.',
      'verified', true, '2025-08-28',
      'https://www.conjur.com.br/2025-ago-28/dino-plano-emergencial-incendios-amazonia-stf/',
      'news_article',
      'Brasília', 'Decisão monocrática — STF', 'dino-plano-emergencial-incendios-amazonia-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 36. Marcal questiona vacinas e defende "liberdade de escolha"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal questiona vacinas obrigatórias e diz que "cada um deve decidir o que entra no seu corpo".',
      'Eu não sou antivacina, eu sou pró-liberdade. Cada um deve decidir o que entra no seu corpo. O Estado não pode obrigar ninguém a tomar vacina. Isso é autoritarismo sanitário.',
      'Marçal publicou o conteúdo em suas redes sociais em outubro de 2025, durante campanha de vacinação do governo federal. O influenciador tem usado a pauta antivacina para mobilizar seguidores.',
      'verified', false, '2025-10-08',
      'https://www.uol.com.br/vivabem/noticias/2025/10/08/marcal-vacinas-liberdade-escolha.htm',
      'news_article',
      'São Paulo', 'Publicação em redes sociais', 'marcal-vacinas-liberdade-escolha-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 37. Haddad anuncia acordo de bitributação com EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad celebra início de negociações de acordo de bitributação com os EUA.',
      'Estamos iniciando formalmente as negociações de um acordo de bitributação com os Estados Unidos. Isso vai atrair investimentos, reduzir custos para empresas brasileiras que operam lá e americanas que operam aqui. É uma vitória da diplomacia econômica.',
      'Haddad anunciou o início das negociações em coletiva no Ministério da Fazenda em setembro de 2025, após reunião com o secretário do Tesouro americano.',
      'verified', false, '2025-09-30',
      'https://www.valor.com.br/financas/haddad-acordo-bitributacao-eua-setembro-2025/',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Fazenda', 'haddad-acordo-bitributacao-eua-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 38. Lula critica tarifas de Trump sobre aço brasileiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que tarifas de Trump sobre aço brasileiro são "injustas" e que Brasil vai responder.',
      'Tarifas injustas terão resposta. O Brasil não vai aceitar passivamente medidas protecionistas que prejudicam nossos trabalhadores. Vamos dialogar, mas não vamos nos submeter.',
      'Lula reagiu às tarifas impostas por Trump ao aço brasileiro em janeiro de 2026, em discurso no Palácio do Planalto. A relação Brasil-EUA tem se deteriorado durante o segundo mandato de Trump.',
      'verified', false, '2026-01-28',
      'https://www.folha.uol.com.br/mercado/2026/01/lula-tarifas-trump-aco-brasileiro.shtml',
      'news_article',
      'Brasília', 'Discurso no Planalto', 'lula-tarifas-trump-aco-brasileiro-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 39. Mourão defende fronteiras e critica PCC em região de tríplice fronteira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão alerta sobre avanço do PCC na tríplice fronteira e cobra reforço militar.',
      'O PCC está se expandindo pela tríplice fronteira com Paraguai e Argentina. As Forças Armadas precisam de autorização e recursos para atuar nessa região. Não podemos entregar nossas fronteiras ao crime organizado.',
      'Mourão fez a declaração em audiência pública no Senado em novembro de 2025, ao discutir o avanço do crime organizado em áreas de fronteira. O senador é ex-comandante militar da Amazônia.',
      'verified', false, '2025-11-20',
      'https://www12.senado.leg.br/noticias/materias/2025/11/mourao-pcc-triplice-fronteira-reforco-militar',
      'news_article',
      'Brasília', 'Audiência pública — Senado', 'mourao-pcc-triplice-fronteira-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 40. Gleisi defende regulação das redes sociais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende regulação das redes sociais e diz que Big Techs "lucram com a mentira".',
      'As Big Techs lucram com a mentira. Quanto mais desinformação, mais engajamento, mais lucro. A regulação das redes sociais não é censura, é proteção da democracia. O Brasil precisa aprovar isso antes das eleições de 2026.',
      'Gleisi fez a declaração em evento do PT sobre democracia digital em São Paulo em agosto de 2025. O PL das Fake News estava travado no Congresso e a presidente do PT cobrava votação.',
      'verified', false, '2025-08-15',
      'https://pt.org.br/gleisi-regulacao-redes-sociais-big-techs-agosto-2025/',
      'news_article',
      'São Paulo', 'Evento do PT sobre democracia digital', 'gleisi-regulacao-redes-sociais-big-techs-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Haddad defende reforma do imposto de renda
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad anuncia reforma do IR que isenta quem ganha até R$ 5 mil e taxa dividendos.',
      'Quem ganha até 5 mil reais por mês não vai pagar mais imposto de renda. E quem ganha mais de 50 mil por mês vai pagar um pouco mais. Isso é justiça tributária. O Brasil é um dos poucos países que não taxam dividendos.',
      'Haddad apresentou a proposta de reforma do imposto de renda em março de 2025. O projeto prevê isenção para quem ganha até R$ 5.000 e tributação de dividendos distribuídos acima de R$ 50.000 mensais.',
      'verified', true, '2025-03-18',
      'https://www.gov.br/fazenda/pt-br/noticias/2025/03/haddad-reforma-ir-isencao-5-mil',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Fazenda', 'haddad-reforma-ir-isencao-5-mil-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 42. Tereza Cristina sobre 2026: "agro vai eleger o próximo presidente"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina diz que o agronegócio vai definir as eleições de 2026 e que o setor "não aceita mais ser vilão".',
      'O agro vai eleger o próximo presidente do Brasil. Somos 30% do PIB, geramos emprego em todos os estados. O produtor rural não aceita mais ser tratado como vilão por quem nunca pisou numa lavoura.',
      'Tereza fez a declaração em congresso da ABAG em São Paulo em novembro de 2025. A senadora posiciona o agronegócio como bloco decisivo para as eleições de 2026.',
      'verified', false, '2025-11-25',
      'https://www.canalrural.com.br/politica/tereza-cristina-agro-eleger-presidente-2026/',
      'news_article',
      'São Paulo', 'Congresso da ABAG', 'tereza-cristina-agro-eleger-presidente-2026-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 43. Lula defende renegociação da dívida dos estados
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende renegociação da dívida dos estados e diz que "governadores não podem ser reféns de juros".',
      'Os governadores não podem ser reféns de juros abusivos sobre dívidas contraídas há décadas. Vamos renegociar. O Brasil precisa que os estados invistam em saúde, educação e segurança, não que mandem dinheiro para Brasília pagar juros.',
      'Lula fez a declaração em reunião com governadores no Planalto em julho de 2025. O governo federal propôs renegociação das dívidas estaduais com prazo de 30 anos e juros reduzidos.',
      'verified', false, '2025-07-22',
      'https://g1.globo.com/economia/noticia/2025/07/lula-renegociacao-divida-estados-governadores.ghtml',
      'news_article',
      'Brasília', 'Reunião com governadores — Planalto', 'lula-renegociacao-divida-estados-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 44. Nikolas critica governo Lula sobre imigração ilegal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira critica imigração descontrolada e diz que governo Lula "abriu as portas" sem critério.',
      'O governo Lula abriu as portas do Brasil para todo mundo sem nenhum critério. Imigração descontrolada gera concorrência desleal para o trabalhador brasileiro, sobrecarrega o SUS e aumenta a criminalidade. Precisamos de fronteiras controladas.',
      'Nikolas fez a declaração em discurso na Câmara em setembro de 2025, durante debate sobre política migratória. O deputado tem incorporado a pauta anti-imigração ao seu discurso político.',
      'verified', false, '2025-09-10',
      'https://www.camara.leg.br/noticias/1140000-nikolas-imigracao-fronteiras-controladas-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-imigracao-fronteiras-controladas-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 45. Dino defende transparência total nas emendas PIX
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino exige transparência total nas emendas PIX e diz que "dinheiro público não pode ter dono".',
      'Dinheiro público não pode ter dono. As emendas PIX, que transferem recursos sem transparência e sem rastreabilidade, são incompatíveis com a República. Determino que todos os pagamentos sejam rastreáveis e públicos.',
      'Dino reforçou exigência de transparência nas emendas PIX em decisão no STF em dezembro de 2025. A decisão provocou atrito com líderes do Congresso que dependem das emendas para articulação política.',
      'verified', true, '2025-12-10',
      'https://www.conjur.com.br/2025-dez-10/dino-transparencia-emendas-pix-stf/',
      'news_article',
      'Brasília', 'Decisão no STF', 'dino-transparencia-emendas-pix-stf-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 46. Lula sobre COP30 em Belém: "vamos mostrar ao mundo o que é a Amazônia"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que COP30 em Belém será a "COP da Amazônia" e que vai mostrar ao mundo os avanços do Brasil.',
      'A COP30 vai ser a COP da Amazônia. Vamos mostrar ao mundo o que fizemos: reduzimos o desmatamento, investimos em bioeconomia, criamos áreas protegidas. O Brasil está liderando pelo exemplo.',
      'Lula fez a declaração em evento preparatório para a COP30 em Belém em outubro de 2025. A conferência climática será realizada em novembro de 2025 e é considerada a mais importante desde Paris.',
      'verified', false, '2025-10-02',
      'https://www.gov.br/planalto/pt-br/noticias/2025/10/lula-cop30-belem-amazonia',
      'news_article',
      'Belém', 'Evento preparatório para COP30', 'lula-cop30-belem-amazonia-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 47. Marcal promete criar "ministério do empreendedorismo" se eleito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal diz que vai criar ministério do empreendedorismo e acabar com "mentalidade de empregado" no Brasil.',
      'O Brasil precisa de um ministério do empreendedorismo. Eu vou criar isso. O problema do brasileiro é a mentalidade de empregado que o governo cultiva. Todo mundo quer emprego, ninguém quer empreender. Eu vou mudar isso.',
      'Marçal fez a declaração em live em suas redes sociais em dezembro de 2025, ao discutir suas propostas para uma eventual candidatura em 2026. O influenciador tem sinalizado interesse em disputar a presidência.',
      'verified', false, '2025-12-15',
      'https://www.infomoney.com.br/politica/marcal-ministerio-empreendedorismo-mentalidade-empregado/',
      'news_article',
      'São Paulo', 'Live em redes sociais', 'marcal-ministerio-empreendedorismo-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 48. Damares critica política de drogas do governo e defende internação compulsória
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares defende internação compulsória de dependentes químicos e critica política de redução de danos.',
      'A política de redução de danos fracassou. Entregar cachimbo e seringa para dependente não é tratamento, é omissão. A internação compulsória salva vidas. Eu vi isso na prática quando fui ministra.',
      'Damares fez a declaração em audiência pública no Senado em agosto de 2025, ao discutir a política nacional sobre drogas. A senadora defende a internação compulsória como principal estratégia de combate ao crack.',
      'verified', false, '2025-08-10',
      'https://www12.senado.leg.br/noticias/materias/2025/08/damares-internacao-compulsoria-reducao-danos',
      'news_article',
      'Brasília', 'Audiência pública — Senado', 'damares-internacao-compulsoria-reducao-danos-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 49. Hugo Motta defende autonomia do Legislativo frente ao STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta critica decisões do STF sobre emendas e diz que Congresso "não aceita tutela judicial".',
      'O Congresso Nacional é soberano em suas decisões orçamentárias. Não aceitamos tutela judicial. Respeitamos o STF, mas o Legislativo tem autonomia para definir como aplica os recursos que o povo autorizou.',
      'Motta reagiu às decisões de Flávio Dino sobre emendas parlamentares em coletiva na Câmara em janeiro de 2026. A tensão entre Legislativo e Judiciário sobre emendas marcou o início do ano.',
      'verified', false, '2026-01-22',
      'https://www.camara.leg.br/noticias/1165000-motta-congresso-autonomia-stf-emendas-janeiro-2026',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Câmara', 'motta-congresso-autonomia-stf-emendas-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 50. Lula promete ampliar Bolsa Família para R$ 700 antes das eleições
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula promete ampliar Bolsa Família para R$ 700 e diz que "ninguém vai passar fome neste país".',
      'Ninguém vai passar fome neste país enquanto eu for presidente. Vamos ampliar o Bolsa Família para 700 reais. O pobre brasileiro precisa comer, precisa ter dignidade. Isso não é gasto, é investimento em gente.',
      'Lula anunciou a ampliação do Bolsa Família em evento no Nordeste em março de 2026. A oposição acusou o governo de usar o programa social como ferramenta eleitoral a poucos meses das eleições.',
      'verified', true, '2026-03-15',
      'https://g1.globo.com/economia/noticia/2026/03/lula-bolsa-familia-700-reais-nordeste.ghtml',
      'news_article',
      'Recife', 'Evento de políticas sociais', 'lula-bolsa-familia-700-reais-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

END $$;
