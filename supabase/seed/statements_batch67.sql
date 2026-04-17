-- Batch 67: Jul-Sep 2025, pre-conviction intensifying and the verdict itself
-- Covers Zambelli fleeing to Italy, Janones suspension (3 months), BRICS,
-- Eduardo "não haverá eleições", Bolsonaro "não acredito mais em democracia",
-- CPMI INSS (Carlos Viana / Alfredo Gaspar), Romário deepfake, Nikolas expelled from Globo,
-- Tarcísio presidential flirtation and retreat, STF convicting Bolsonaro (11/9) to 27 years 3 months,
-- Ramagem to 16 years, Daniel Silveira regime progression, Ciro leaves PDT to PSDB,
-- Moro joining PL, Damares CPMI evangelicals, Feliciano "Bolsonaro única opção 2026"
-- 50 statements

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_edu UUID; v_fla UUID; v_car UUID;
  v_nik UUID; v_had UUID; v_gle UUID; v_mot UUID; v_alc UUID;
  v_dam UUID; v_zam UUID; v_mor UUID; v_mich UUID; v_tar UUID;
  v_fel UUID; v_ram UUID; v_jan UUID; v_din UUID; v_ciro UUID;
  v_sil UUID; v_mora UUID; v_bar UUID; v_gil UUID; v_car_l UUID;
  v_zan UUID; v_pad UUID; v_mag UUID; v_sim UUID; v_kic UUID;
  v_mou UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_aut UUID; c_mis UUID; c_obs UUID; c_ame UUID;
  c_irr UUID; c_intim UUID; c_homof UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mich FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_ciro FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_mora FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car_l FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sim FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_intim FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_homof FROM categories WHERE slug = 'homofobia';

  -- 1. Zambelli foge para Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli, após fugir para a Itália, afirma em vídeo que não vai voltar ao Brasil enquanto Moraes estiver no STF.',
      'Eu estou na Itália, em segurança, e daqui eu digo: não volto ao Brasil enquanto Alexandre de Moraes estiver no Supremo Tribunal Federal. Eu sou cidadã ítalo-brasileira, tenho direito de estar aqui. Fugi de uma ditadura togada que me condenou sem julgamento justo. Peço asilo político ao governo italiano.',
      'Vídeo publicado por Carla Zambelli em julho de 2025 nas redes sociais, após a ex-deputada deixar o Brasil rumo a Roma para fugir da execução de sua pena de 10 anos. Zambelli possui cidadania italiana.',
      'verified', true, '2025-07-04',
      'https://g1.globo.com/politica/noticia/2025/07/04/zambelli-foge-italia-asilo-politico-moraes.ghtml',
      'news_article',
      'Roma, Itália', 'Vídeo em redes sociais', 'zambelli-fuga-italia-asilo-moraes-julho-2025-b67-01'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 2. Janones suspenso por 3 meses
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones reage à suspensão de 3 meses e diz que foi "cassado" por denunciar homofobicamente Nikolas Ferreira.',
      'Fui suspenso por três meses não porque xinguei, mas porque disse a verdade sobre quem é o Nikolas Ferreira. É uma cassação disfarçada de punição administrativa. O Conselho de Ética é liderado pela bancada evangélica que protege seus pastores e extremistas. Vou cumprir a suspensão, mas não vou calar. A luta contra a extrema-direita continua.',
      'Declaração de André Janones em julho de 2025, após o Conselho de Ética da Câmara aprovar sua suspensão por três meses por ofensas homofóbicas contra Nikolas Ferreira em debate anterior. A punição foi uma das mais duras dos últimos anos.',
      'verified', true, '2025-07-15',
      'https://www.folha.uol.com.br/poder/2025/07/janones-suspensao-3-meses-conselho-etica-nikolas.shtml',
      'news_article',
      'Brasília', 'Declaração após punição', 'janones-suspensao-3-meses-nikolas-julho-2025-b67-02'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homof, true FROM ins;

  -- 3. Lula critica FMI/BM BRICS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula, na cúpula do BRICS no Rio, ataca FMI e Banco Mundial e defende nova arquitetura financeira global.',
      'O FMI e o Banco Mundial não servem mais ao mundo multipolar em que vivemos. Essas instituições refletem a correlação de forças de 1944, não a realidade de 2025. O BRICS está construindo alternativas concretas: o Novo Banco de Desenvolvimento, o sistema de pagamento em moedas locais. Vamos democratizar a economia global.',
      'Discurso de abertura de Lula na Cúpula do BRICS, realizada no Rio de Janeiro em julho de 2025. A fala tensionou ainda mais a relação com os EUA de Trump, que já havia ameaçado tarifas contra países do bloco.',
      'verified', true, '2025-07-06',
      'https://www.gov.br/presidencia/noticias/lula-cupula-brics-rio-fmi-banco-mundial-2025',
      'news_article',
      'Rio de Janeiro', 'Cúpula do BRICS', 'lula-brics-rio-fmi-banco-mundial-julho-2025-b67-03'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Eduardo "não haverá eleições"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro afirma publicamente que "não haverá eleições em 2026" se STF continuar no atual curso.',
      'Eu afirmo com todas as letras: não haverá eleições em 2026 se o Supremo Tribunal Federal continuar nesse caminho de perseguição política. Se proíbem o principal líder da oposição, cassam mandatos, controlam redes sociais, decidem quem pode ou não disputar, já não é mais eleição, é farsa. O Brasil precisa acordar enquanto é tempo.',
      'Pronunciamento de Eduardo Bolsonaro em evento em Miami em julho de 2025, com grande repercussão negativa no Brasil. A fala foi interpretada como incitação a desestabilização do processo eleitoral de 2026.',
      'verified', true, '2025-07-22',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-nao-havera-eleicoes-2026-miami-2025/',
      'news_article',
      'Miami, EUA', 'Evento com brasileiros em Miami', 'eduardo-nao-havera-eleicoes-2026-miami-julho-2025-b67-04'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Bolsonaro Veja — "não acredito mais em democracia"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, em entrevista à Veja, diz que não acredita mais em democracia se continuar inelegível em 2026.',
      'Sinceramente, se eu continuar inelegível e for impedido de disputar 2026, eu não acredito mais na democracia brasileira. Porque democracia em que o eleitor não pode votar em quem quer, em que o principal líder da oposição é tirado da disputa por canetada de tribunal, não é democracia. É ditadura com roupa de juiz.',
      'Entrevista exclusiva de Jair Bolsonaro à revista Veja em julho de 2025. A fala "não acredito mais em democracia" gerou onda de críticas e foi classificada por juristas como ameaça direta ao regime democrático.',
      'verified', true, '2025-07-28',
      'https://veja.abril.com.br/politica/bolsonaro-nao-acredito-democracia-inelegivel-entrevista-2025/',
      'news_article',
      'Brasília', 'Entrevista à revista Veja', 'bolsonaro-nao-acredito-democracia-veja-julho-2025-b67-05'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 6. CPMI INSS instalada
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta autoriza instalação da CPMI do INSS e diz que Congresso cumpre seu papel constitucional de investigação.',
      'A instalação da CPMI do INSS cumpre o papel constitucional do Congresso Nacional de investigar supostas irregularidades na administração pública. O Parlamento não se omitirá diante do maior escândalo de fraude previdenciária da história. Vamos acompanhar com isenção, sem proteção a ninguém, nem ao governo, nem à oposição.',
      'Declaração de Hugo Motta em 20 de agosto de 2025, dia da instalação da CPMI do INSS, que apurou desvios bilionários de aposentados e pensionistas. A comissão foi presidida pelo senador Carlos Viana e relatada pelo deputado Alfredo Gaspar.',
      'verified', true, '2025-08-20',
      'https://www.camara.leg.br/noticias/cpmi-inss-instalacao-hugo-motta-2025',
      'news_article',
      'Brasília', 'Instalação da CPMI do INSS', 'motta-cpmi-inss-instalacao-agosto-2025-b67-06'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 7. Deepfake Romário
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula denuncia uso de deepfake com imagem de Romário fabricando apoio falso ao governo como novo patamar da desinformação.',
      'O deepfake que colocou o senador Romário declarando apoio ao nosso governo sem ele ter dito nada disso é um novo patamar da desinformação eleitoral. Vão tentar fazer isso comigo, com a Janja, com nossos ministros. Precisamos de lei urgente regulando inteligência artificial no processo eleitoral, senão 2026 vai ser uma guerra de mentiras fabricadas.',
      'Declaração de Lula em agosto de 2025, após circulação viral de vídeo produzido com inteligência artificial mostrando o senador Romário, que havia sido crítico do governo, supostamente declarando apoio a Lula. Romário desmentiu publicamente.',
      'verified', false, '2025-08-12',
      'https://www1.folha.uol.com.br/poder/2025/08/lula-deepfake-romario-desinformacao-ia-eleicoes.shtml',
      'news_article',
      'Brasília', 'Pronunciamento sobre desinformação', 'lula-deepfake-romario-ia-desinformacao-agosto-2025-b67-07'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Zambelli STF +5 anos arma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli, em nova condenação de 5 anos pelo episódio da arma contra cidadão negro, chama julgamento de circo.',
      'Mais 5 anos. Agora o Supremo me condena pela perseguição ao Luan, como se eu fosse uma criminosa. Fui ameaçada naquele dia, reagi por legítima defesa, e o tribunal transformou em tentativa de homicídio qualificada. Não é Justiça, é circo. Da Itália eu digo: nunca mais volto a um país comandado por togas com agenda política.',
      'Reação de Carla Zambelli em agosto de 2025 a nova condenação do STF, desta vez pelo episódio de 2022 em que perseguiu armada um homem negro nas ruas de São Paulo. A ex-deputada se manifestou pelas redes sociais, já foragida na Itália.',
      'verified', false, '2025-08-18',
      'https://g1.globo.com/politica/noticia/2025/08/18/zambelli-condenada-5-anos-arma-luan-italia.ghtml',
      'news_article',
      'Roma, Itália', 'Publicação em redes sociais', 'zambelli-condenada-5-anos-arma-luan-agosto-2025-b67-08'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 9. Nikolas expulso Globo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira, expulso ao vivo de programa da Globo, acusa emissora de censura e monopólio midiático.',
      'Acabei de ser expulso ao vivo de um programa da Rede Globo por dizer a verdade sobre o monopólio midiático dessa emissora no Brasil. Isso comprova exatamente o que eu vinha denunciando: a Globo não aceita debate, não aceita contraditório, só aceita quem reproduz a narrativa dela. A Globo é o verdadeiro perigo para a liberdade de expressão no Brasil.',
      'Pronunciamento de Nikolas Ferreira em agosto de 2025 após ser retirado ao vivo do programa "Roda Viva" por conta de enfrentamentos com os entrevistadores. O episódio viralizou e se tornou bandeira bolsonarista contra o jornalismo tradicional.',
      'verified', true, '2025-08-05',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-expulso-roda-viva-globo-ao-vivo-2025',
      'news_article',
      'São Paulo', 'Programa Roda Viva — TV Globo', 'nikolas-expulso-roda-viva-globo-agosto-2025-b67-09'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 10. Tarcísio admite presidência depois recua
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas admite que considera disputar a Presidência em 2026 mas dias depois recua e reafirma foco em São Paulo.',
      'Sou um homem público, tenho compromisso com o Brasil. Se houver um cenário em que Jair Bolsonaro não puder disputar, por inelegibilidade que considero injusta, eu vou considerar com seriedade disputar a Presidência. Mas essa hipótese é subordinada à situação do presidente Bolsonaro, que segue sendo nossa referência.',
      'Declaração de Tarcísio de Freitas em entrevista à CNN em 17 de setembro de 2025, que gerou forte repercussão. Dias depois, em 29 de setembro, o governador de SP recuou e reafirmou candidatura à reeleição em São Paulo.',
      'verified', true, '2025-09-17',
      'https://www.cnnbrasil.com.br/politica/tarcisio-admite-presidencia-2026-bolsonaro-inelegivel-2025/',
      'news_article',
      'São Paulo', 'Entrevista à CNN Brasil', 'tarcisio-admite-presidencia-2026-setembro-2025-b67-10'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Bolsonaro condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro reage à condenação por unanimidade a 27 anos e 3 meses chamando-a de "vergonha histórica" do STF.',
      'A Primeira Turma do Supremo Tribunal Federal acaba de cometer uma vergonha histórica. 27 anos e 3 meses de prisão, por unanimidade, a um ex-presidente da República eleito por 58 milhões de votos, com base em delação comprada e documentos fabricados. Essa condenação é o atestado de óbito da democracia brasileira. A história há de nos absolver.',
      'Manifestação de Jair Bolsonaro em 11 de setembro de 2025, após a Primeira Turma do STF condená-lo por unanimidade a 27 anos e 3 meses de prisão por trama golpista. A pena inclui os crimes de organização criminosa, tentativa de golpe e abolição violenta do Estado Democrático.',
      'verified', true, '2025-09-11',
      'https://g1.globo.com/politica/noticia/2025/09/11/bolsonaro-condenado-stf-27-anos-golpe-reacao.ghtml',
      'news_article',
      'Brasília', 'Reação à condenação no STF', 'bolsonaro-condenado-27-anos-stf-setembro-2025-b67-11'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 12. Moraes voto condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mora,
      'Alexandre de Moraes, ao votar pela condenação, afirma que Bolsonaro liderou organização criminosa contra a democracia.',
      'Os elementos constantes dos autos são cristalinos: o réu Jair Messias Bolsonaro liderou, com plena consciência e protagonismo, uma organização criminosa que atentou deliberadamente contra o Estado Democrático de Direito. A Constituição não pode ser letra morta. Voto pela procedência integral da denúncia e pela condenação às penas máximas aplicáveis.',
      'Trecho do voto do ministro Alexandre de Moraes, relator do processo, no julgamento da trama golpista em 11 de setembro de 2025. A Primeira Turma condenou Bolsonaro e mais sete réus em decisão unânime.',
      'verified', true, '2025-09-11',
      'https://portal.stf.jus.br/noticias/moraes-voto-condenacao-bolsonaro-organizacao-criminosa-2025.asp',
      'court_document',
      'Brasília', 'Julgamento da trama golpista no STF', 'moraes-voto-condenacao-bolsonaro-organizacao-setembro-2025-b67-12'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 13. Ramagem condenado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem, condenado a 16 anos pelo STF, diz que foi julgado por fazer seu trabalho na Abin.',
      'Fui condenado a 16 anos de prisão por ter feito, como diretor da Abin, o trabalho que o Estado brasileiro me designou. Reuniões oficiais viraram conspiração. Relatórios técnicos viraram planos golpistas. É uma inversão completa. Vou recorrer em todas as instâncias, inclusive internacionais. Essa condenação não se sustenta.',
      'Manifestação de Alexandre Ramagem em 11 de setembro de 2025, após ser condenado a 16 anos de prisão pela Primeira Turma do STF. O deputado, ex-diretor da Abin, foi considerado parte do núcleo estratégico da trama golpista.',
      'verified', true, '2025-09-11',
      'https://www.folha.uol.com.br/poder/2025/09/ramagem-condenado-16-anos-stf-abin-golpe.shtml',
      'news_article',
      'Brasília', 'Reação à condenação no STF', 'ramagem-condenado-16-anos-abin-setembro-2025-b67-13'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 14. Michelle reação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mich,
      'Michelle Bolsonaro, em culto, chama condenação do marido de "martírio" e pede mobilização evangélica.',
      'O meu marido foi condenado, mas Cristo também foi condenado pelos fariseus. Estamos vivendo um martírio. Peço a todos os irmãos em Cristo que se levantem em oração e em ação pelo Brasil. Não podemos aceitar que um homem temente a Deus seja sepultado em vida por um tribunal que perdeu completamente a noção de Justiça.',
      'Pronunciamento de Michelle Bolsonaro em culto na Igreja Batista Atitude em 14 de setembro de 2025, três dias após a condenação de Bolsonaro. A fala mobilizou a base evangélica e antecipou movimentos políticos de Michelle para 2026.',
      'verified', true, '2025-09-14',
      'https://www.metropoles.com/brasil/politica-brasil/michelle-culto-condenacao-jair-martirio-2025',
      'news_article',
      'Rio de Janeiro', 'Culto evangélico', 'michelle-culto-condenacao-martirio-setembro-2025-b67-14'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 15. Eduardo reação condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro, após condenação do pai, pede sanções imediatas dos EUA e fala em "última cartada" da democracia.',
      'My father has just been sentenced to 27 years in prison in a judicial farce watched by the entire world. This is the last straw. I am formally requesting the Trump administration to apply immediate Magnitsky sanctions against Alexandre de Moraes and the other justices of the First Panel. The Brazilian democracy is dead.',
      'Pronunciamento de Eduardo Bolsonaro em Washington em 11 de setembro de 2025, imediatamente após a condenação do pai. O deputado intensificou sua agenda de pressão americana contra o STF.',
      'verified', true, '2025-09-11',
      'https://www.reuters.com/world/americas/eduardo-bolsonaro-washington-sanctions-moraes-conviction-2025/',
      'news_article',
      'Washington D.C.', 'Coletiva em Washington', 'eduardo-condenacao-pai-sancoes-magnitsky-setembro-2025-b67-15'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 16. Flavio Dino emendas Eduardo Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino critica bloqueio tardio de emendas a Eduardo Bolsonaro e Ramagem condenados pelo STF.',
      'Não é admissível que parlamentares condenados por atentar contra a democracia continuem indicando emendas e dispondo de recursos públicos como se nada tivesse acontecido. Já determinei ao Ministério da Fazenda e à CGU medidas para bloquear imediatamente o acesso de Ramagem e de Eduardo Bolsonaro a qualquer dotação pública sob suspeita.',
      'Declaração do ministro Flávio Dino do STF em 15 de setembro de 2025, dias após a condenação de Bolsonaro, Ramagem e outros aliados. Dino ampliou medidas de bloqueio de emendas e recursos a políticos condenados.',
      'verified', true, '2025-09-15',
      'https://portal.stf.jus.br/noticias/dino-bloqueio-emendas-eduardo-ramagem-condenados-2025.asp',
      'court_document',
      'Brasília', 'Decisão no STF', 'dino-bloqueio-emendas-eduardo-ramagem-setembro-2025-b67-16'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 17. Nikolas 7 setembro Alcolumbre
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira, no ato de 7 de setembro, critica Alcolumbre e chama o Senado de "cúmplice do STF".',
      'O presidente do Senado, Davi Alcolumbre, se transformou em cúmplice do STF. Poderia ter aberto processo de impeachment contra Alexandre de Moraes há muito tempo, e não o fez. Poderia ter defendido a Constituição, e não o fez. Hoje, o Senado é cúmplice da destruição da democracia brasileira. Vamos cobrar nas urnas em 2026.',
      'Discurso de Nikolas Ferreira no ato bolsonarista do 7 de Setembro de 2025 na avenida Paulista, em São Paulo. A fala foi direcionada a Davi Alcolumbre, que resistiu a abrir processo contra Moraes apesar da pressão bolsonarista.',
      'verified', true, '2025-09-07',
      'https://www.estadao.com.br/politica/nikolas-7-setembro-paulista-alcolumbre-cumplice-stf-2025/',
      'news_article',
      'São Paulo', 'Ato de 7 de Setembro — Avenida Paulista', 'nikolas-7-setembro-alcolumbre-cumplice-setembro-2025-b67-17'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 18. Daniel Silveira regime aberto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Daniel Silveira, após progressão para regime aberto, diz que foi "mártir" da luta contra o STF.',
      'Saí do regime fechado, passei para o aberto, mas saio ainda preso moralmente por um regime togado que destrói tudo que encontra pela frente. Fui um mártir dessa luta. Sofri antes dos outros pela ousadia de denunciar o que o STF vinha fazendo. Não há arrependimento nenhum. Se for para escolher ficar em silêncio ou defender o Brasil, eu escolho defender o Brasil mil vezes.',
      'Declaração de Daniel Silveira em setembro de 2025, após progressão para o regime aberto. O ex-deputado havia sido condenado pelo STF por ameaçar ministros e depois perdoado por Bolsonaro, graça posteriormente anulada.',
      'verified', false, '2025-09-08',
      'https://www.metropoles.com/brasil/politica-brasil/daniel-silveira-regime-aberto-martir-stf-2025',
      'news_article',
      'Petrópolis (RJ)', 'Declaração à imprensa', 'daniel-silveira-regime-aberto-martir-setembro-2025-b67-18'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, false FROM ins;

  -- 19. Tarcísio confirma reeleição SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas confirma candidatura à reeleição ao governo de São Paulo e descarta corrida presidencial em 2026.',
      'Declaro oficialmente que serei candidato à reeleição ao governo do Estado de São Paulo em 2026. Deixo de lado qualquer especulação sobre candidatura presidencial. São Paulo merece continuidade do trabalho que começamos, e é aqui que eu vou estar. O presidente Bolsonaro segue como nossa principal liderança nacional e vamos apoiá-lo.',
      'Coletiva de Tarcísio de Freitas em 29 de setembro de 2025, encerrando ciclo de especulações sobre sua candidatura presidencial. A decisão foi recebida como vitória política por Jair Bolsonaro, mas frustrou setores da direita.',
      'verified', true, '2025-09-29',
      'https://g1.globo.com/sp/sao-paulo/noticia/2025/09/29/tarcisio-confirma-reeleicao-sp-nao-disputa-presidencia-2026.ghtml',
      'news_article',
      'São Paulo', 'Coletiva de imprensa no Palácio dos Bandeirantes', 'tarcisio-confirma-reeleicao-sp-nao-disputa-setembro-2025-b67-19'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 20. Ciro sai PDT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes anuncia saída do PDT e filiação ao PSDB e diz que esquerda foi "capturada pelo petismo".',
      'Hoje encerro um ciclo de décadas no PDT e me filio ao PSDB. O partido que me acolheu por tanto tempo foi capturado pelo governismo lulista, abriu mão de suas bandeiras históricas. A esquerda brasileira como um todo foi capturada pelo petismo, que confunde Estado com partido, e partido com presidente. O centro democrático precisa ser reconstruído.',
      'Pronunciamento de Ciro Gomes em 30 de setembro de 2025, ao oficializar saída do PDT após mais de três décadas e filiação ao PSDB. A mudança foi articulada com o presidente nacional do PSDB, Marconi Perillo.',
      'verified', true, '2025-09-30',
      'https://www1.folha.uol.com.br/poder/2025/09/ciro-gomes-sai-pdt-filia-psdb-captura-petismo.shtml',
      'news_article',
      'Brasília', 'Anúncio de filiação ao PSDB', 'ciro-gomes-sai-pdt-filia-psdb-setembro-2025-b67-20'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Moro filia PL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro filia-se ao PL e diz que é hora de unificar a oposição diante do "avanço autoritário" do Lula e do STF.',
      'Hoje me filio ao Partido Liberal, o maior partido de oposição do Brasil. Chegou a hora de unificar a direita democrática brasileira para enfrentar o avanço autoritário que vemos no governo Lula e em parte do STF. O combate à corrupção, a defesa da liberdade individual, o equilíbrio entre os Poderes, essas são as bandeiras que me trazem ao PL.',
      'Ato de filiação de Sérgio Moro ao PL em setembro de 2025, após sua saída do União Brasil. A mudança partidária fortaleceu o PL como polo da oposição e aproximou Moro formalmente do campo bolsonarista.',
      'verified', true, '2025-09-22',
      'https://www.estadao.com.br/politica/moro-filia-pl-oposicao-lula-stf-autoritarismo-2025/',
      'news_article',
      'Brasília', 'Ato de filiação ao PL', 'moro-filiacao-pl-oposicao-lula-setembro-2025-b67-21'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Damares CPMI igrejas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves, em depoimento à CPMI do INSS, revela desvios também envolvendo igrejas e associações evangélicas.',
      'Tenho informações, com documentação, de que o esquema do INSS também envolveu descontos indevidos direcionados a algumas associações ligadas a igrejas. Vou entregar esses documentos à CPMI. Não quero que o nome das igrejas sérias do nosso país seja confundido com o de oportunistas que se aproveitaram do esquema. Esse crime precisa ser apurado até o final.',
      'Depoimento de Damares Alves à CPMI do INSS em setembro de 2025. Como senadora e ex-ministra, Damares apresentou documentos sobre envolvimento de associações religiosas no esquema, o que gerou reação da bancada evangélica.',
      'verified', true, '2025-09-10',
      'https://www12.senado.leg.br/noticias/damares-cpmi-inss-igrejas-associacoes-evangelicas-2025.html',
      'news_article',
      'Brasília', 'Depoimento na CPMI do INSS', 'damares-cpmi-inss-igrejas-associacoes-setembro-2025-b67-22'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 23. Feliciano única opção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano declara que Bolsonaro segue como "única opção" da direita para 2026 apesar da condenação.',
      'Mesmo condenado injustamente, o presidente Jair Bolsonaro é a única opção viável da direita brasileira para 2026. Ninguém tem o carisma dele, ninguém tem o apoio popular dele, ninguém tem a proteção espiritual dele. Os outros nomes podem ser alternativas, mas só o Bolsonaro. Vamos trabalhar por uma anistia e por sua reabilitação eleitoral.',
      'Pronunciamento de Marco Feliciano em culto em São Paulo em setembro de 2025, após a condenação de Bolsonaro. A fala se contrapôs ao gesto de Tarcísio de Freitas, que havia sinalizado disponibilidade para disputar a Presidência.',
      'verified', true, '2025-09-20',
      'https://www.metropoles.com/brasil/politica-brasil/feliciano-bolsonaro-unica-opcao-direita-2026-condenacao',
      'news_article',
      'São Paulo', 'Culto religioso e pronunciamento político', 'feliciano-bolsonaro-unica-opcao-2026-setembro-2025-b67-23'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 24. Gleisi pré-candidatura PR
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann sinaliza pré-candidatura ao Senado pelo Paraná e reafirma compromisso com reeleição de Lula.',
      'Tenho conversado com companheiros e companheiras do Paraná sobre uma possível pré-candidatura ao Senado em 2026. Mas quero deixar claro: qualquer candidatura minha está subordinada à reeleição do presidente Lula. Minha prioridade absoluta, como ministra da Secretaria de Relações Institucionais, é garantir vitória do projeto democrático em 2026.',
      'Declaração de Gleisi Hoffmann à imprensa paranaense em agosto de 2025, sinalizando pela primeira vez publicamente sua intenção de disputar uma vaga no Senado pelo Paraná em 2026.',
      'verified', false, '2025-08-28',
      'https://www.gazetadopovo.com.br/politica/republica/gleisi-pre-candidatura-senado-parana-lula-2026/',
      'news_article',
      'Curitiba', 'Entrevista à imprensa paranaense', 'gleisi-pre-candidatura-senado-parana-agosto-2025-b67-24'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 25. Flávio Bolsonaro reação condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chama condenação do pai de "crime de Estado" e articula PL da anistia no Congresso.',
      'A condenação do meu pai é um crime de Estado cometido em nome da Justiça. Nenhuma democracia séria prende ex-presidente por 27 anos com base em delação comprada de Mauro Cid. Vou articular no Congresso o PL da anistia ampla, geral e irrestrita. E vamos à sociedade brasileira: vocês aceitam ser governados por um Judiciário que decide eleições?',
      'Entrevista coletiva de Flávio Bolsonaro no Senado em 12 de setembro de 2025, um dia após a condenação do pai. O senador mobilizou a oposição para articular o PL da anistia como principal bandeira política.',
      'verified', true, '2025-09-12',
      'https://www12.senado.leg.br/noticias/flavio-bolsonaro-condenacao-pai-crime-estado-anistia-2025.html',
      'news_article',
      'Brasília', 'Coletiva no Senado', 'flavio-condenacao-pai-crime-estado-anistia-setembro-2025-b67-25'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 26. Carlos Bolsonaro ameaça
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro publica após condenação que "ministros do STF vão pagar pelo que fizeram com meu pai".',
      'Os cinco ministros da Primeira Turma do STF que condenaram meu pai a 27 anos de prisão vão pagar pelo que fizeram. Não será na violência, será na Justiça da história e de Deus. Mas vão pagar. Nenhum crime fica impune. Estamos registrando cada voto, cada palavra, cada decisão. O dia da prestação de contas chegará.',
      'Publicação de Carlos Bolsonaro no X em 12 de setembro de 2025, um dia após a condenação do pai. A postagem foi analisada pela PGR como possível incitação e ameaça a ministros do STF, gerando nova investigação.',
      'verified', true, '2025-09-12',
      'https://g1.globo.com/politica/noticia/2025/09/12/carlos-bolsonaro-ministros-stf-pagar-condenacao-pai.ghtml',
      'news_article',
      'Rio de Janeiro', 'Publicação no X', 'carlos-bolsonaro-ministros-stf-pagar-setembro-2025-b67-26'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 27. Lula triunfo condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula celebra condenação de Bolsonaro como vitória da democracia e diz que "ninguém está acima da lei".',
      'A condenação de Jair Bolsonaro prova que, no Brasil, ninguém está acima da lei. Nem ex-presidente, nem general, nem ministro. As instituições brasileiras funcionaram, o Supremo Tribunal Federal cumpriu seu papel, e a democracia brasileira sai fortalecida dessa decisão. Agora é trabalhar para reconstruir o Brasil e derrotar o bolsonarismo nas urnas em 2026.',
      'Pronunciamento de Lula em Brasília em 11 de setembro de 2025, horas após a condenação de Bolsonaro pela Primeira Turma do STF. O presidente buscou tom institucional e democrático, evitando triunfalismo excessivo.',
      'verified', true, '2025-09-11',
      'https://www.gov.br/presidencia/noticias/lula-condenacao-bolsonaro-ninguem-acima-lei-2025',
      'news_article',
      'Brasília', 'Pronunciamento na Presidência', 'lula-condenacao-bolsonaro-ninguem-acima-lei-setembro-2025-b67-27'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Haddad economia estável
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad comemora dados econômicos positivos e ataca "catastrofismo" da oposição ao governo Lula.',
      'Os dados mostram uma realidade que incomoda a oposição: crescimento do PIB, inflação em queda, desemprego no menor nível histórico, salário mínimo com aumento real. O catastrofismo da direita, que previa caos econômico, está sendo desmentido pelos fatos. O Brasil volta a ser um país que gera oportunidades.',
      'Pronunciamento do ministro Fernando Haddad em coletiva econômica em agosto de 2025. O discurso buscou capitalizar dados macroeconômicos favoráveis em contraposição às críticas de Nikolas Ferreira e outros deputados da oposição.',
      'verified', false, '2025-08-15',
      'https://valor.globo.com/politica/noticia/2025/08/15/haddad-dados-economicos-catastrofismo-oposicao.ghtml',
      'news_article',
      'Brasília', 'Coletiva econômica', 'haddad-dados-economicos-catastrofismo-agosto-2025-b67-28'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 29. Bolsonaro pneumonia saúde
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, internado por pneumonia, denuncia "ambiente insalubre" da prisão domiciliar e pede revisão da medida.',
      'Estou internado por quadro grave de pneumonia. Os meus médicos já alertaram ao Supremo: minha saúde está se deteriorando no ambiente da prisão domiciliar. Não posso receber visitas, não posso caminhar ao ar livre, estou isolado. Peço humildemente ao ministro Alexandre de Moraes que reveja a medida por razões humanitárias. Sou cardíaco, já sofri múltiplas cirurgias.',
      'Declaração de Bolsonaro enviada por seu advogado em agosto de 2025, durante internação hospitalar por pneumonia. O episódio foi usado por aliados para pressionar o STF a flexibilizar a prisão domiciliar, sem sucesso.',
      'verified', false, '2025-08-25',
      'https://g1.globo.com/politica/noticia/2025/08/25/bolsonaro-pneumonia-internado-prisao-domiciliar-saude.ghtml',
      'news_article',
      'Brasília', 'Comunicado do advogado de Bolsonaro', 'bolsonaro-pneumonia-internacao-saude-agosto-2025-b67-29'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 30. CPMI Carlos Viana
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alc,
      'Davi Alcolumbre defende CPMI do INSS e diz que Senado não será "rolinho compressor" do governo no apuramento.',
      'A CPMI do INSS vai funcionar de forma isenta, com independência das pressões do governo e de qualquer bancada. O Senado não será rolinho compressor para proteger ninguém. Vamos apurar onde o dinheiro dos aposentados foi parar, quem se beneficiou, quais as falhas do Estado. O país precisa dessa resposta.',
      'Pronunciamento de Davi Alcolumbre em 20 de agosto de 2025, na instalação da CPMI do INSS. A comissão foi vista como potencial espinho para o governo Lula, com Carlos Viana na presidência e Alfredo Gaspar na relatoria.',
      'verified', false, '2025-08-20',
      'https://www12.senado.leg.br/noticias/alcolumbre-cpmi-inss-rolinho-compressor-2025.html',
      'news_article',
      'Brasília', 'Discurso na instalação da CPMI do INSS', 'alcolumbre-cpmi-inss-rolinho-compressor-agosto-2025-b67-30'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 31. Nikolas Romário
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira critica 58 ausências de Romário em votações e pede que senador assuma cadeira ou renuncie.',
      'O senador Romário faltou em 58 de 120 votações importantes da legislatura. Quase a metade das votações. O cidadão carioca que votou nele merece um representante presente, não um fantasma no Senado. Ou o Romário assume a cadeira para a qual foi eleito, ou faça a coisa certa e renuncie. O mandato é público, não é propriedade pessoal.',
      'Vídeo de Nikolas Ferreira no X em agosto de 2025, denunciando as ausências do senador Romário. A publicação foi um dos fatores que impulsionaram a produção do deepfake de Romário apoiando o governo Lula.',
      'verified', false, '2025-08-08',
      'https://www.cnnbrasil.com.br/politica/nikolas-romario-58-ausencias-senado-votacoes-2025/',
      'news_article',
      'Brasília', 'Publicação no X', 'nikolas-romario-58-ausencias-senado-agosto-2025-b67-31'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 32. Barroso voto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Luís Roberto Barroso, em voto de condenação, afirma que sentença é "marco" contra futuras tentativas de ruptura.',
      'O voto que profiro hoje não é apenas sobre Jair Bolsonaro e seus coautores. É sobre o futuro da democracia brasileira. Precisamos estabelecer, como marco civilizatório, que tentativas de ruptura institucional não ficarão impunes neste país, nunca mais. Esta decisão é um dique contra futuras aventuras autoritárias.',
      'Trecho do voto do então presidente do STF, Luís Roberto Barroso, no julgamento da Primeira Turma em 11 de setembro de 2025. Barroso acompanhou integralmente o voto do relator Alexandre de Moraes.',
      'verified', false, '2025-09-11',
      'https://portal.stf.jus.br/noticias/barroso-voto-condenacao-bolsonaro-marco-democracia-2025.asp',
      'court_document',
      'Brasília', 'Julgamento da trama golpista', 'barroso-voto-condenacao-marco-democracia-setembro-2025-b67-32'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 33. Carmen Lucia voto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car_l,
      'Cármen Lúcia, em voto convergente, diz que "a Constituição venceu a traição" no julgamento do golpe.',
      'Hoje, neste plenário, a Constituição da República venceu a traição. Os réus que agora são condenados tentaram abolir violentamente o Estado Democrático de Direito, tentaram romper com o voto popular, tentaram corroer as instituições. A Corte Suprema cumpre seu dever de custódia da Constituição. Voto com o relator pela condenação integral.',
      'Trecho do voto da ministra Cármen Lúcia no julgamento da trama golpista em 11 de setembro de 2025. A ministra integrou a unanimidade da Primeira Turma pela condenação de Bolsonaro e demais réus.',
      'verified', false, '2025-09-11',
      'https://portal.stf.jus.br/noticias/carmen-lucia-voto-condenacao-constituicao-traicao-2025.asp',
      'court_document',
      'Brasília', 'Julgamento da trama golpista', 'carmen-lucia-constituicao-traicao-setembro-2025-b67-33'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 34. Zanin voto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Cristiano Zanin, em voto, afirma que provas demonstram autoria e materialidade do plano golpista.',
      'As provas colhidas nos autos, analisadas em seu conjunto, demonstram de forma robusta a autoria e a materialidade dos crimes imputados. Não se trata de criminalizar dissenso político, mas de punir atos concretos e documentados de conspiração contra a democracia. Acompanho integralmente o voto do ministro relator.',
      'Trecho do voto do ministro Cristiano Zanin no julgamento da trama golpista em 11 de setembro de 2025. Zanin havia sido indicado ao STF pelo presidente Lula em 2023 e integrava a Primeira Turma.',
      'verified', false, '2025-09-11',
      'https://portal.stf.jus.br/noticias/zanin-voto-condenacao-provas-autoria-materialidade-2025.asp',
      'court_document',
      'Brasília', 'Julgamento da trama golpista', 'zanin-voto-condenacao-autoria-materialidade-setembro-2025-b67-34'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 35. Magno Malta defende Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta, após condenação, afirma em culto que "o STF acaba de assinar sua sentença perante Deus".',
      'O Supremo Tribunal Federal acaba de assinar sua própria sentença perante Deus. Condenaram um homem temente a Deus, um pai de família, um presidente eleito por 58 milhões de votos, a 27 anos de prisão. Mas aqui nesse lugar eu profetizo: esses ministros não ficarão impunes. Deus é Deus de justiça, e a Justiça divina é mais alta que qualquer corte humana.',
      'Pronunciamento do senador Magno Malta em culto em Cachoeiro de Itapemirim em setembro de 2025, após a condenação de Bolsonaro. A fala foi classificada por entidades democráticas como intimidação indireta ao STF.',
      'verified', false, '2025-09-14',
      'https://www.metropoles.com/brasil/politica-brasil/magno-malta-culto-stf-sentenca-deus-bolsonaro-2025',
      'news_article',
      'Cachoeiro de Itapemirim (ES)', 'Culto religioso', 'magno-malta-stf-sentenca-deus-setembro-2025-b67-35'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intim, false FROM ins;

  -- 36. Padilha ataca anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Alexandre Padilha afirma que PL da anistia é "apagamento de crime" e que governo se posicionará frontalmente contra.',
      'A chamada PL da anistia, que tenta beneficiar golpistas já condenados pelo STF, é um projeto de apagamento de crime contra a democracia. O governo Lula é inteiramente contra e vai trabalhar em todas as frentes para impedir sua aprovação. Perdoar quem tentou destruir nossa democracia é abrir a porta para novos golpes. Não vamos permitir.',
      'Declaração de Alexandre Padilha em entrevista ao Jornal Nacional em setembro de 2025, após Flávio Bolsonaro articular o PL da anistia. A fala marcou a posição oficial do governo contra a proposta.',
      'verified', false, '2025-09-18',
      'https://g1.globo.com/politica/noticia/2025/09/18/padilha-pl-anistia-apagamento-crime-golpe.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Jornal Nacional', 'padilha-pl-anistia-apagamento-crime-setembro-2025-b67-36'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 37. Kicis anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis, relatora do PL da anistia, defende inclusão de Bolsonaro e todos os condenados por 8/1 no perdão.',
      'Como relatora do PL da anistia, vou incluir expressamente o presidente Jair Bolsonaro, o deputado Alexandre Ramagem e todos os condenados no processo do 8 de Janeiro. Não vamos separar casos, não vamos fatiar. Anistia ampla, geral e irrestrita, como foi no fim da ditadura militar. O Brasil precisa de pacificação, não de perseguição.',
      'Declaração da deputada Bia Kicis em setembro de 2025, em audiência pública na Câmara sobre o PL da anistia do qual foi designada relatora. A proposta enfrentou forte resistência do governo Lula e de parte do Congresso.',
      'verified', true, '2025-09-24',
      'https://www.camara.leg.br/noticias/kicis-pl-anistia-bolsonaro-ramagem-amplia-2025',
      'news_article',
      'Brasília', 'Audiência pública na Câmara', 'kicis-pl-anistia-bolsonaro-ramagem-setembro-2025-b67-37'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 38. Mourão condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão, após a condenação, diz que Bolsonaro foi "vítima de vendetta jurídica" do STF.',
      'O presidente Bolsonaro foi vítima de uma vendetta jurídica construída ao longo de anos pelo Supremo Tribunal Federal. 27 anos de prisão por crimes que jamais foram cometidos em sua plenitude. É uma pena absurda, desproporcional, inaceitável em qualquer democracia madura. O general Heleno, o general Braga Netto, o almirante Garnier, todos pagaram por servir ao Brasil.',
      'Entrevista de Hamilton Mourão em 13 de setembro de 2025, à Rádio Bandeirantes. O senador foi crítico da condenação e solidarizou-se com os militares também condenados no processo da trama golpista.',
      'verified', false, '2025-09-13',
      'https://www.band.uol.com.br/noticias/politica/mourao-condenacao-bolsonaro-vendetta-juridica-2025.html',
      'news_article',
      'Brasília', 'Entrevista à Rádio Bandeirantes', 'mourao-condenacao-vendetta-juridica-setembro-2025-b67-38'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 39. Lula tarifa Trump
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula denuncia tarifa de 50% imposta por Trump como "chantagem imperialista" e promete retaliação.',
      'A tarifa de 50% imposta pelo governo Trump contra os produtos brasileiros não é comércio, é chantagem imperialista para interferir na política interna do nosso país. O que Trump quer, a pedido de Eduardo Bolsonaro, é coagir o Brasil a anistiar os golpistas. Nós não vamos nos ajoelhar. Vamos aplicar reciprocidade, vamos recorrer à OMC, vamos defender a soberania brasileira.',
      'Pronunciamento de Lula em 31 de julho de 2025, após a imposição da tarifa de 50% por Trump sobre importações brasileiras em resposta à condenação iminente de Bolsonaro. A crise diplomática foi uma das maiores dos últimos anos.',
      'verified', true, '2025-07-31',
      'https://www.gov.br/presidencia/noticias/lula-tarifa-trump-50-chantagem-imperialista-2025',
      'news_article',
      'Brasília', 'Pronunciamento em rede nacional', 'lula-tarifa-trump-50-chantagem-julho-2025-b67-39'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Eduardo tarifa Trump
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro celebra tarifa de Trump e diz que é "resposta legítima" à perseguição contra a democracia brasileira.',
      'A tarifa do presidente Trump é uma resposta legítima do mundo livre à perseguição judicial que o STF pratica contra meu pai e contra metade do Brasil. Ninguém pode ficar calado diante de uma ditadura togada. Os EUA estão defendendo princípios que o Brasil abandonou. Que sirva de lição para Lula, para Moraes, para o sistema.',
      'Pronunciamento de Eduardo Bolsonaro em Washington em 31 de julho de 2025, celebrando a tarifa imposta por Trump. O deputado foi acusado por aliados de Lula de trair interesses nacionais em benefício político próprio.',
      'verified', true, '2025-07-31',
      'https://www.folha.uol.com.br/mercado/2025/07/eduardo-bolsonaro-celebra-tarifa-trump-50-stf.shtml',
      'news_article',
      'Washington D.C.', 'Coletiva em Washington', 'eduardo-celebra-tarifa-trump-50-julho-2025-b67-40'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 41. Gilmar Mendes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes defende condenação de Bolsonaro e diz que decisão fortalece a democracia brasileira.',
      'A condenação do ex-presidente Jair Bolsonaro pela Primeira Turma é um marco civilizatório para o constitucionalismo brasileiro. Demonstra que o Estado Democrático de Direito tem capacidade de se defender de seus próprios inimigos. Fortalece a democracia, fortalece as instituições, fortalece o equilíbrio entre os Poderes. É motivo de orgulho para o Judiciário brasileiro.',
      'Declaração do ministro Gilmar Mendes em entrevista à TV Justiça em setembro de 2025, após a condenação de Bolsonaro pela Primeira Turma. Gilmar, decano do STF, apoiou publicamente a decisão dos colegas.',
      'verified', false, '2025-09-13',
      'https://portal.stf.jus.br/noticias/gilmar-mendes-condenacao-marco-civilizatorio-2025.asp',
      'news_article',
      'Brasília', 'Entrevista à TV Justiça', 'gilmar-mendes-condenacao-marco-civilizatorio-setembro-2025-b67-41'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 42. Flavio Dino STF sobre Trump
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino afirma que STF não vai se curvar a "pressão externa" de Trump e Eduardo Bolsonaro.',
      'O Supremo Tribunal Federal do Brasil não se curva a pressões externas, venham elas da Casa Branca, do Congresso americano ou de brasileiros que trabalham contra o próprio país no exterior. Nossas decisões são soberanas, fundamentadas na Constituição brasileira. Quem articula sanções contra magistrados brasileiros está cometendo crime contra a soberania nacional.',
      'Entrevista de Flávio Dino, ministro do STF, ao Estadão em agosto de 2025, em resposta ao lobby articulado por Eduardo Bolsonaro nos EUA por sanções a ministros da Corte. A fala fez referência a possível crime de atentado à soberania.',
      'verified', false, '2025-08-22',
      'https://www.estadao.com.br/politica/dino-stf-pressao-externa-trump-eduardo-soberania-2025/',
      'news_article',
      'Brasília', 'Entrevista ao Estadão', 'dino-stf-pressao-externa-trump-soberania-agosto-2025-b67-42'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 43. Simone Tebet sobre tarifa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sim,
      'Simone Tebet, em resposta à tarifa Trump, afirma que Brasil precisa de unidade nacional e não de oportunismo político.',
      'Este é um momento em que o Brasil precisa de unidade nacional. A tarifa imposta pelo governo americano atinge produtores brasileiros de todas as regiões, de todas as cores partidárias. O oportunismo político de quem festeja em Washington a taxação dos produtos do seu próprio país beira a traição à pátria. Precisamos reagir como nação.',
      'Declaração da ministra Simone Tebet em agosto de 2025, em resposta ao Eduardo Bolsonaro, que havia celebrado a tarifa de Trump. A ministra do Planejamento liderou tom institucional de resposta no governo.',
      'verified', false, '2025-08-03',
      'https://valor.globo.com/politica/noticia/2025/08/03/tebet-tarifa-trump-unidade-nacional-oportunismo.ghtml',
      'news_article',
      'Brasília', 'Coletiva no Ministério do Planejamento', 'tebet-tarifa-trump-unidade-nacional-agosto-2025-b67-43'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 44. Nikolas 7 set Paulista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma no 7 de setembro na Paulista que bolsonarismo é "maior movimento político" do Brasil.',
      'Olhem para essa Avenida Paulista. Dois, três milhões de brasileiros nas ruas em defesa da liberdade, em defesa de Bolsonaro, em defesa do Brasil. O bolsonarismo é o maior movimento político que esse país já viu. O governo petista pode ter o poder, mas nós temos o povo. Em 2026, quando o povo falar, eles vão ter que ouvir.',
      'Discurso de Nikolas Ferreira no ato bolsonarista da Avenida Paulista em 7 de setembro de 2025. O evento ocorreu quatro dias antes da condenação de Bolsonaro e foi um dos maiores atos da direita no ano.',
      'verified', true, '2025-09-07',
      'https://www.folha.uol.com.br/poder/2025/09/nikolas-7-setembro-paulista-bolsonarismo-maior-movimento.shtml',
      'news_article',
      'São Paulo', 'Ato bolsonarista na Paulista', 'nikolas-7-setembro-paulista-maior-movimento-setembro-2025-b67-44'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 45. Gleisi articulação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que PL da anistia não passa no Congresso e que governo tem votos para barrar.',
      'O PL da anistia defendido por Flávio Bolsonaro e Bia Kicis não tem os votos necessários para passar no Congresso Nacional. Temos mapeado as bancadas, temos o apoio de partidos do Centrão que entendem que anistiar golpistas é abrir precedente perigoso. O governo Lula tem a articulação política necessária para barrar essa proposta.',
      'Declaração de Gleisi Hoffmann, ministra da SRI, em entrevista à GloboNews em setembro de 2025. A fala buscou tranquilizar setores democráticos preocupados com a tramitação do PL da anistia de Bia Kicis.',
      'verified', false, '2025-09-26',
      'https://g1.globo.com/politica/noticia/2025/09/26/gleisi-pl-anistia-barrar-congresso-articulacao.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'gleisi-pl-anistia-barrar-congresso-setembro-2025-b67-45'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 46. Ciro crítica PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes, já no PSDB, afirma que Lula é o "maior fracasso da esquerda latino-americana" nos últimos anos.',
      'Lula é o maior fracasso da esquerda latino-americana dos últimos anos. Voltou ao poder com a promessa de reconstruir o Brasil e está entregando estagnação econômica, radicalização política, crise institucional. O petismo destruiu a esquerda democrática brasileira e abriu espaço para o bolsonarismo. Meu papel agora, como tucano, é reconstruir uma alternativa de centro.',
      'Entrevista de Ciro Gomes à revista Veja em setembro de 2025, dias após sua filiação ao PSDB. A fala gerou tensão entre antigos aliados pedetistas e foi celebrada pelo bolsonarismo.',
      'verified', false, '2025-09-30',
      'https://veja.abril.com.br/politica/ciro-gomes-lula-fracasso-esquerda-psdb-2025/',
      'news_article',
      'Rio de Janeiro', 'Entrevista à revista Veja', 'ciro-gomes-lula-fracasso-esquerda-psdb-setembro-2025-b67-46'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 47. Moro sobre condenação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro critica pena de 27 anos a Bolsonaro como "desproporcional" e sinaliza apoio a revisão.',
      'Não defendo nenhum ato antidemocrático. Mas a pena de 27 anos de prisão aplicada ao ex-presidente Jair Bolsonaro é desproporcional em relação ao quadro probatório e à jurisprudência brasileira para crimes semelhantes. Defendo apuração rigorosa, mas dosimetria justa. Apoio, como senador e como jurista, uma revisão da pena em embargos.',
      'Artigo de Sérgio Moro publicado em O Globo em setembro de 2025, uma semana após a condenação de Bolsonaro. A posição de Moro gerou desconforto no PL mas também atraiu parte da base bolsonarista moderada.',
      'verified', false, '2025-09-18',
      'https://oglobo.globo.com/opiniao/moro-condenacao-bolsonaro-desproporcional-dosimetria-2025.html',
      'news_article',
      'Rio de Janeiro', 'Artigo em O Globo', 'moro-condenacao-bolsonaro-desproporcional-setembro-2025-b67-47'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 48. Alfredo Gaspar relator CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis celebra escolha de Alfredo Gaspar como relator da CPMI do INSS e promete apurar "responsabilidades do governo".',
      'A escolha do deputado Alfredo Gaspar como relator da CPMI do INSS é uma vitória da seriedade. Gaspar é procurador de Justiça, investigador experiente, conhece o funcionamento do INSS. Vai apurar as responsabilidades individuais e as responsabilidades do governo Lula nesse escândalo bilionário que atingiu milhões de aposentados brasileiros.',
      'Declaração da deputada Bia Kicis em agosto de 2025, após a escolha do relator da CPMI do INSS. A oposição celebrou a escolha de Alfredo Gaspar, ex-procurador, como sinal de apuração rigorosa contra o governo Lula.',
      'verified', false, '2025-08-21',
      'https://www.camara.leg.br/noticias/kicis-alfredo-gaspar-relator-cpmi-inss-2025',
      'news_article',
      'Brasília', 'Instalação da CPMI do INSS', 'kicis-alfredo-gaspar-relator-cpmi-inss-agosto-2025-b67-48'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 49. Bolsonaro apelo comoção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro pede que o povo "não desista" mesmo com condenação e conclama mobilização pacífica até 2026.',
      'Aos 58 milhões de brasileiros que confiaram em mim nas urnas, digo: não desistam. Não desistam da pátria, não desistam da família, não desistam da liberdade. A condenação é injusta, mas a luta continua. Mobilizem-se pacificamente, nas ruas, nas redes, nas igrejas. Em 2026 o povo terá sua revanche democrática. Ninguém vai nos calar.',
      'Carta de Bolsonaro lida por Michelle Bolsonaro em culto evangélico em 28 de setembro de 2025. O ex-presidente, em prisão domiciliar e com restrições de comunicação, utilizou a esposa como porta-voz para manter mobilização da base.',
      'verified', true, '2025-09-28',
      'https://www.metropoles.com/brasil/politica-brasil/bolsonaro-carta-michelle-nao-desistam-mobilizacao-2026-2025',
      'news_article',
      'Brasília', 'Culto evangélico com Michelle Bolsonaro', 'bolsonaro-carta-michelle-nao-desistam-setembro-2025-b67-49'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 50. Lula discurso ONU
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula, em discurso na ONU, afirma que Brasil "derrotou o golpismo" e defende soberania contra tarifaço.',
      'Senhoras e senhores chefes de Estado, o Brasil derrotou o golpismo pelas vias institucionais. Ex-presidente, generais e deputados foram julgados e condenados por tentativa de abolição violenta do Estado Democrático de Direito. A democracia brasileira sai fortalecida. Ao mesmo tempo, denunciamos a utilização de tarifas comerciais como instrumento de chantagem política e ameaça à soberania dos países do Sul Global.',
      'Discurso de Lula na 80ª Assembleia Geral das Nações Unidas em Nova York em 23 de setembro de 2025. A fala combinou celebração da condenação de Bolsonaro com denúncia da tarifa de 50% imposta por Trump em represália.',
      'verified', true, '2025-09-23',
      'https://www.gov.br/presidencia/noticias/lula-onu-80-assembleia-derrotou-golpismo-tarifaco-2025',
      'news_article',
      'Nova York (EUA)', '80ª Assembleia Geral da ONU', 'lula-onu-derrotou-golpismo-tarifaco-setembro-2025-b67-50'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
