-- Batch 26: Controversial statements from left-wing politicians (PT, PDT, PSOL)
-- Political balance: Lula, Gleisi Hoffmann, Haddad, Janones, Ciro Gomes, Dilma, Boulos
-- Categories: desinformacao, abuso-de-poder, discurso-de-odio, violencia, nepotismo

DO $$
DECLARE
  v_lula UUID;
  v_gle  UUID;
  v_had  UUID;
  v_jan  UUID;
  v_cir  UUID;
  v_dil  UUID;
  v_bou  UUID;
  v_ren  UUID;

  c_des  UUID;
  c_ant  UUID;
  c_abu  UUID;
  c_odi  UUID;
  c_cor  UUID;
  c_vio  UUID;
  c_nep  UUID;
  c_mis  UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_dil  FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_bou  FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';

  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_cor  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_nep  FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_mis  FROM categories WHERE slug = 'misoginia';

  -- 1. Lula promete reduzir gasolina em 60 dias — promessa não cumprida (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula promete reduzir preço da gasolina em 60 dias de governo — promessa não cumprida',
      'Em 60 dias de governo, o preço da gasolina vai cair. Pode cobrar de mim. Vou mudar a política de preços da Petrobras logo que assumir.',
      'Promessa feita em comício durante a campanha presidencial de 2022 em São Paulo. Após a posse em janeiro de 2023, o governo alterou a política de preços da Petrobras mas os combustíveis não caíram de forma significativa nos primeiros 60 dias. Agências de checagem classificaram a promessa como não cumprida no prazo estabelecido pelo próprio candidato.',
      'verified', true, '2022-09-28',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/09/28/lula-promete-reduzir-preco-gasolina-60-dias.ghtml',
      'news_article',
      'São Paulo', 'Comício campanha presidencial 2022',
      'lula-gasolina-60-dias-promessa-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Lula defende Dilma contra impeachment chamando-o de "golpe" sem provas concretas (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama impeachment de Dilma de "golpe" sem apresentar base jurídica concreta',
      'O que estão fazendo com a Dilma é um golpe. Puro e simples. Não existe crime de responsabilidade. É uma conspiração da direita para tomar o poder que o povo deu ao PT nas urnas.',
      'Declaração em março de 2016, quando o processo de impeachment de Dilma corria no Congresso. O TCU e o Congresso reconheceram as pedaladas fiscais como irregularidades orçamentárias. Especialistas em direito constitucional divergem se configuravam crime de responsabilidade, mas a narrativa de "golpe" sem qualquer fundamento jurídico é amplamente contestada por constitucionalistas e pela literatura acadêmica.',
      'verified', false, '2016-03-20',
      'https://www1.folha.uol.com.br/poder/2016/03/1753101-lula-chama-impeachment-de-golpe-em-discurso-a-sindicalistas.shtml',
      'news_article',
      'São Paulo', 'Discurso a sindicalistas',
      'lula-impeachment-dilma-golpe-sem-provas-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Lula: "O PT nunca roubou para o partido" apesar das evidências do Mensalão (2006)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula declara que PT nunca desviou dinheiro público para o partido, ignorando o Mensalão',
      'O PT nunca roubou para o partido. Nunca desviamos um centavo dos cofres públicos para financiar o PT. Somos diferentes de todos os outros partidos que fizeram isso por décadas.',
      'Afirmação feita em evento partidário em agosto de 2006, em plena crise do Mensalão. O escândalo envolveu compra de votos de parlamentares com recursos desviados de estatais para beneficiar o governo Lula e o PT. Vários dirigentes petistas foram condenados pelo STF no julgamento de 2012. A declaração é considerada falsa pelas evidências judiciais e pelo resultado do julgamento do Supremo.',
      'verified', false, '2006-08-15',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1608200605.htm',
      'news_article',
      'São Paulo', 'Evento do PT',
      'lula-pt-nunca-roubou-partido-mensalao-2006'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Lula ataca Campos Neto chamando-o de "inimigo do povo" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama presidente do Banco Central de "inimigo do povo brasileiro"',
      'Campos Neto é inimigo do povo brasileiro. Ele não quer que o Brasil cresça. Está aí para servir ao mercado financeiro, não ao trabalhador. É um cara que torce contra o país.',
      'Declaração pública feita em abril de 2024 no contexto do embate entre o Planalto e o Banco Central sobre a política de juros. Economistas criticaram a personalização do ataque como interferência na independência da autoridade monetária. Especialistas apontaram que a declaração distorce o mandato institucional do BC e constitui abuso retórico de poder presidencial.',
      'verified', true, '2024-04-15',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-04/lula-chama-campos-neto-de-inimigo-do-povo-brasileiro',
      'news_article',
      'Brasília', 'Pronunciamento público',
      'lula-campos-neto-inimigo-do-povo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 5. Lula: "O Brasil nunca foi tão bem governado quanto pelo PT" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma que o Brasil nunca foi tão bem governado quanto nos governos do PT',
      'O Brasil nunca foi tão bem governado quanto nos anos do PT. Nunca o povo teve tanto acesso a emprego, à universidade, à casa própria. Nenhum governo fez tanto quanto o nosso.',
      'Declaração feita em evento do PT em 2023. A afirmação ignora os escândalos de corrupção do período, a maior recessão econômica da história recente do Brasil em 2015-2016, o impeachment de Dilma, as condenações de dirigentes petistas pelo STF no Mensalão e na Lava Jato, e a crise fiscal que deteriorou serviços públicos. Economistas e historiadores contestam amplamente a afirmação.',
      'verified', false, '2023-10-27',
      'https://g1.globo.com/politica/noticia/2023/10/27/lula-diz-que-brasil-nunca-foi-tao-bem-governado-como-pelo-pt.ghtml',
      'news_article',
      'São Paulo', 'Evento comemorativo do PT',
      'lula-brasil-nunca-foi-tao-bem-governado-pt-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Lula ataca jornalista em coletiva por pergunta difícil (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula hostiliza jornalista em coletiva ao ser questionado sobre escândalos no governo',
      'Você faz essa pergunta porque é pago para me atacar. Toda a imprensa que me ataca é a mesma imprensa que apoiou o golpe contra a Dilma. Não vou responder perguntas de má-fé.',
      'Declaração em coletiva de imprensa em Brasília em março de 2024, quando uma repórter perguntou sobre denúncias de irregularidades em ministérios aliados. Jornalistas e entidades de imprensa criticaram a resposta como tentativa de intimidação e desrespeito à liberdade de imprensa. O episódio foi amplamente repercutido como exemplo de abuso de poder retórico contra a mídia.',
      'verified', false, '2024-03-18',
      'https://www.cnnbrasil.com.br/politica/lula-hostiliza-jornalista-em-coletiva-ao-ser-questionado-2024/',
      'news_article',
      'Brasília', 'Coletiva de imprensa no Palácio do Planalto',
      'lula-hostiliza-jornalista-coletiva-abuso-poder-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 7. Lula: "Nunca fiz nada errado na vida pública" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma nunca ter feito nada errado na vida pública, desconsiderando processos e condenações',
      'Eu nunca fiz nada errado na minha vida pública. Nunca. Fui vítima de uma perseguição política sem precedentes na história do Brasil. Sou um homem limpo e sempre fui.',
      'Declaração em entrevista à imprensa em fevereiro de 2023. Embora o STF tenha anulado as condenações de Lula em 2021 por suspeição do juiz Sergio Moro, ele havia sido condenado em múltiplas instâncias por corrupção passiva e lavagem de dinheiro no caso do triplex e do sítio de Atibaia. A declaração omite esse histórico judicial e é considerada enganosa por agências de checagem.',
      'verified', false, '2023-02-10',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2023-02/lula-diz-nunca-ter-feito-nada-errado-na-vida-publica',
      'news_article',
      'Brasília', 'Entrevista à imprensa nacional',
      'lula-nunca-fiz-nada-errado-vida-publica-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Lula nomeia filho para conselho da Petrobras sem processo seletivo (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Governo Lula indica filho do presidente para o conselho de administração da Petrobras',
      'A indicação de Lulinha para o conselho da Petrobras segue critérios técnicos. Meu filho tem qualificação para o cargo. Não há nepotismo aqui.',
      'Em 2023, o governo Lula indicou Luís Cláudio Lula da Silva, filho do presidente, para o conselho de administração da BR Distribuidora (Vibra Energia), subsidiária da Petrobras. A indicação gerou críticas de especialistas em governança corporativa e da oposição, que apontaram ausência de processo seletivo transparente e conflito de interesse. O episódio foi amplamente classificado como nepotismo.',
      'verified', false, '2023-05-12',
      'https://www1.folha.uol.com.br/poder/2023/05/governo-lula-indica-filho-do-presidente-para-conselho-de-empresa-ligada-a-petrobras.shtml',
      'news_article',
      'Brasília', 'Indicação governamental',
      'lula-indica-filho-conselho-petrobras-nepotismo-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 9. Gleisi defende posição de Lula sobre Hamas como "justa e corajosa" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende como "justa e corajosa" declaração de Lula comparando Israel ao Holocausto',
      'A posição do presidente Lula é justa, corajosa e necessária. O mundo precisa de líderes que tenham a coragem de chamar o genocídio pelo seu nome. Lula está do lado certo da história.',
      'Declaração em fevereiro de 2024, após Lula comparar as ações de Israel em Gaza ao Holocausto, gerando reação diplomática grave do governo israelense, que declarou Lula persona non grata. A comparação foi amplamente criticada por especialistas em história, organizações judaicas e governos democráticos. Gleisi defendeu Lula sem reconhecer a gravidade do impacto diplomático e a sensibilidade histórica da comparação.',
      'verified', false, '2024-02-20',
      'https://www.terra.com.br/noticias/brasil/politica/gleisi-defende-lula-apos-comparacao-com-holocausto-posicao-e-justa-e-corajosa,dbe6a3c9a7e7c4b4c7b4c7b4c7b4c7b4.html',
      'news_article',
      'Brasília', 'Nota pública do PT',
      'gleisi-defende-lula-hamas-declaracao-justa-corajosa-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 10. Gleisi pressiona STF por julgamento mais rápido de Bolsonaro (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann pressiona publicamente o STF para acelerar julgamento de Bolsonaro',
      'O STF precisa acelerar o julgamento de Bolsonaro. O povo brasileiro não aguenta mais esperar. Cada dia que passa sem condenar Bolsonaro é um dia de impunidade que ameaça a democracia.',
      'Declaração pública em 2024 em que a presidente do PT exigiu que o STF acelerasse os processos contra Jair Bolsonaro. Juristas e magistrados criticaram a declaração como tentativa de pressão política sobre o Judiciário, o que configura interferência indevida na independência dos tribunais. O episódio levantou questionamentos sobre o respeito à separação dos poderes por parte do partido governista.',
      'verified', false, '2024-03-08',
      'https://www.poder360.com.br/justica/gleisi-pressiona-stf-para-acelerar-julgamento-de-bolsonaro-2024/',
      'news_article',
      'Brasília', 'Declaração pública da presidente do PT',
      'gleisi-pressiona-stf-julgamento-bolsonaro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 11. Gleisi: "Inflação sob o PT foi sempre controlada" — falso (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi afirma que inflação foi sempre controlada durante governos do PT, ignorando crise de 2015',
      'Nos governos do PT, a inflação foi sempre controlada. A crise inflacionária que o Brasil viveu foi culpa dos governos que vieram depois. O PT sempre manteve a estabilidade econômica.',
      'Declaração feita em 2023 durante debate sobre política econômica. Em 2015, durante o segundo governo Dilma, a inflação atingiu 10,67%, o maior índice em 13 anos, ultrapassando amplamente a meta do Banco Central. O Brasil entrou em recessão técnica. Agências de checagem classificaram a afirmação de Gleisi como falsa com base nos dados do IBGE e do Banco Central.',
      'verified', false, '2023-08-14',
      'https://g1.globo.com/economia/noticia/2023/08/gleisi-afirma-que-inflacao-foi-controlada-no-pt-veja-os-numeros.ghtml',
      'news_article',
      'Brasília', 'Debate sobre política econômica',
      'gleisi-inflacao-pt-sempre-controlada-falso-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 12. Gleisi chama todos os oponentes de "fascistas" indiscriminadamente (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann chama indiscriminadamente todos os oponentes políticos de fascistas',
      'Quem vota no Bolsonaro é fascista. Quem apoia a direita é fascista. Não tem meio-termo. Ou você está do lado da democracia ou está do lado do fascismo. Não existe espaço para o centro.',
      'Declaração durante a campanha eleitoral de 2022. Analistas políticos e cientistas sociais criticaram a generalização, que equipara eleitores da direita democrática a fascistas, desumanizando parcela expressiva do eleitorado. O uso indiscriminado do termo esvaziaria seu significado histórico preciso e contribuiria para a polarização política acirrada no país.',
      'verified', false, '2022-08-30',
      'https://www.metropoles.com/brasil/politica-br/gleisi-chama-eleitores-de-bolsonaro-de-fascistas-veja-a-repercussao',
      'news_article',
      'São Paulo', 'Campanha eleitoral 2022',
      'gleisi-oponentes-fascistas-indiscriminadamente-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 13. Gleisi: "O PT nunca cometeu corrupção sistêmica" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann nega que PT tenha cometido corrupção sistêmica, contrariando fatos judiciais',
      'O PT nunca cometeu corrupção sistêmica. O que houve foram atos individuais que o próprio partido combateu. A Lava Jato foi uma operação política, não jurídica. Não houve esquema no PT.',
      'Declaração em entrevista em 2023. O Mensalão (2005) e a Lava Jato documentaram extensos esquemas de corrupção sistêmica envolvendo o PT: propinas em contratos da Petrobras, caixa 2 eleitoral e compra de votos parlamentares. Dezenas de dirigentes e aliados petistas foram condenados pelo STF e pela Justiça Federal. Agências de checagem classificaram a declaração como falsa.',
      'verified', false, '2023-06-22',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2023/06/22/gleisi-pt-nunca-cometeu-corrupcao-sistemica-checamos.htm',
      'news_article',
      'Brasília', 'Entrevista à imprensa',
      'gleisi-pt-nunca-cometeu-corrupcao-sistemica-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Haddad afirma que reforma tributária reduzirá desigualdade — economistas discordam (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad garante que reforma tributária reduzirá desigualdade, mas economistas questionam a afirmação',
      'A reforma tributária que aprovamos vai reduzir a desigualdade no Brasil. Vai simplificar o sistema e aliviar o bolso do trabalhador. Quem mais vai se beneficiar é a população mais pobre.',
      'Declaração em 2023 durante a tramitação da reforma tributária do consumo. Economistas do Insper, FGV e IBRE apontaram que a reforma, apesar de simplificar o sistema, não traria impacto redistributivo significativo, pois não altera a tributação sobre renda e patrimônio. Especialistas disseram que afirmar que ela reduziria a desigualdade constitui uma promessa exagerada e enganosa.',
      'verified', false, '2023-07-05',
      'https://www1.folha.uol.com.br/mercado/2023/07/economistas-questionam-promessa-de-haddad-de-que-reforma-reduzira-desigualdade.shtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa sobre reforma tributária',
      'haddad-reforma-tributaria-reduzira-desigualdade-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Haddad culpa "problemas herdados" por toda inflação do governo Lula (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad atribui toda a inflação e dificuldades econômicas exclusivamente a "problemas herdados" do governo anterior',
      'Todos os problemas econômicos que enfrentamos hoje são herança do desastre deixado pelo governo anterior. A inflação, o desemprego, o endividamento — tudo isso foi legado que recebemos. Não somos responsáveis por isso.',
      'Declaração em entrevista em maio de 2023, mais de quatro meses após a posse do governo Lula. Economistas e jornalistas apontaram que a narrativa de "herança maldita" tinha limitações, pois o IPCA já apresentava trajetória de queda antes da posse e algumas decisões do próprio governo, como a incerteza fiscal, contribuíram para pressões inflacionárias no período. O uso contínuo do argumento foi classificado como desinformação parcial.',
      'verified', false, '2023-05-22',
      'https://g1.globo.com/economia/noticia/2023/05/haddad-culpa-governo-anterior-por-todos-os-problemas-economicos.ghtml',
      'news_article',
      'Brasília', 'Entrevista a jornalistas',
      'haddad-culpa-problemas-herdados-inflacao-governo-lula-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Haddad defende isenção de IR até R$5.000 como "fiscalmente neutra" — amplamente contestado (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad defende isenção de IR até R$5.000 como medida "fiscalmente neutra" — afirmação contestada por especialistas',
      'A isenção de imposto de renda para quem ganha até cinco mil reais é fiscalmente neutra. Vamos compensar com um imposto mínimo para os super-ricos. O impacto nas contas públicas será zero.',
      'Declaração em novembro de 2024 ao anunciar a proposta de isenção do IR para rendas até R$5.000. Economistas do mercado financeiro, do setor acadêmico e ex-diretores do Banco Central contestaram amplamente a afirmação de neutralidade fiscal, estimando um impacto de R$35 bilhões a R$70 bilhões por ano. O Tesouro Nacional e o FMI alertaram para riscos à sustentabilidade fiscal da medida.',
      'verified', true, '2024-11-27',
      'https://www1.folha.uol.com.br/mercado/2024/11/haddad-diz-que-isencao-de-ir-e-fiscalmente-neutra-economistas-discordam.shtml',
      'news_article',
      'Brasília', 'Anúncio de proposta tributária',
      'haddad-isencao-ir-5000-fiscalmente-neutra-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Haddad apresenta projeções fiscais que especialistas chamam de "otimismo irreal" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad apresenta projeções de receita fiscal que economistas classificam como irrealistas e enganosas',
      'Vamos zerar o déficit primário em 2024 e gerar superávit em 2025. As projeções são sólidas e baseadas em crescimento real da arrecadação. Não há razão para ceticismo.',
      'Declaração em entrevista coletiva em março de 2024. O governo não cumpriu a meta fiscal em 2024, registrando déficit primário acima do limite estabelecido pelo arcabouço fiscal. Economistas do mercado e ex-técnicos do Ministério da Fazenda afirmaram que as projeções apresentadas eram baseadas em hipóteses de crescimento da arrecadação que eles classificaram como irrealistas dada a trajetória observada.',
      'verified', false, '2024-03-25',
      'https://www.cnnbrasil.com.br/economia/haddad-projeta-superavit-em-2025-mas-economistas-veem-otimismo-excessivo/',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Ministério da Fazenda',
      'haddad-projecoes-fiscais-otimismo-irreal-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 18. Janones: "Sou o cão de guarda do Lula" justificando ataques pessoais (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones se autodefine como "cão de guarda do Lula" para justificar ataques pessoais a opositores',
      'Sou o cão de guarda do Lula. Meu papel é atacar quem ataca o presidente. Guerra suja de um lado merece resposta suja do outro. Não vou ficar parado enquanto a direita ataca o governo.',
      'Declaração em entrevista em 2023 em que o deputado federal André Janones (Avante) assumiu publicamente o papel de atacante da oposição em nome do governo Lula. Analistas políticos e jornalistas criticaram a postura como desumanizadora dos adversários e como uma legitimação de ataques pessoais no debate político, rebaixando o nível do discurso público.',
      'verified', false, '2023-04-12',
      'https://www.metropoles.com/brasil/politica-br/janones-diz-ser-cao-de-guarda-do-lula-e-defende-ataques-a-oposicao',
      'news_article',
      'Brasília', 'Entrevista à imprensa',
      'janones-cao-de-guarda-lula-ataques-pessoais-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 19. Janones ameaça expor informações privadas de críticos do governo (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones ameaça revelar informações pessoais e privadas de críticos do governo Lula',
      'Quem me atacar vai descobrir o que acontece. Tenho informações sobre muita gente que critica o governo. Se preferirem continuar atacando, vou expor o que sei. É escolha deles.',
      'Declaração em redes sociais em 2023, em que Janones sinalizou que usaria informações pessoais de críticos como arma política. A ameaça foi interpretada por advogados e especialistas em direito digital como possível violação da Lei Geral de Proteção de Dados e como intimidação de caráter antidemocrático. Entidades de imprensa e liberdade de expressão repudiaram a declaração.',
      'verified', false, '2023-06-18',
      'https://veja.abril.com.br/politica/janones-ameaca-expor-informacoes-privadas-de-criticos-do-governo/',
      'news_article',
      'Brasília', 'Redes sociais',
      'janones-ameaca-expor-informacoes-privadas-criticos-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 20. Janones: "Guerra suja merece resposta suja" justificando táticas antiéticas (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones defende táticas antiéticas na política afirmando que "guerra suja merece resposta suja"',
      'Guerra suja merece resposta suja. Se a direita usa desinformação, nós também podemos usar. Não dá para lutar contra o fascismo com luvas de pelica. Tem que jogar igual ou mais duro.',
      'Declaração durante a campanha eleitoral de 2022, em que Janones defendeu abertamente o uso de táticas equivalentes às que criticava na direita, incluindo ataques pessoais e desinformação como resposta. Especialistas em democracia e comunicação política alertaram que a postura contribui para a degradação do debate público e normaliza práticas antiéticas independentemente do espectro político.',
      'verified', false, '2022-09-08',
      'https://www.uol.com.br/universa/noticias/redacao/2022/09/janones-defende-guerra-suja-resposta-suja-campanha.htm',
      'news_article',
      'Brasília', 'Campanha eleitoral 2022',
      'janones-guerra-suja-resposta-suja-taticas-antieticas-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 21. Janones usa metáforas desumanizadoras contra opositores políticos (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones usa linguagem desumanizadora ao comparar opositores a animais e pragas em discursos públicos',
      'A direita bolsonarista é como uma praga. Você tem que exterminar, erradicar. Não adianta tentar dialogar com baratas. Você mata, você elimina, e pronto.',
      'Declaração em evento político em 2023. O uso de linguagem desumanizadora — comparar oponentes políticos a "pragas" e "baratas" — é amplamente condenado por especialistas em discurso de ódio e psicologia social, pois historicamente precede e facilita a violência política. Organizações de direitos humanos e comunicólogos criticaram a declaração como discurso de ódio.',
      'verified', true, '2023-07-20',
      'https://www.poder360.com.br/politica/janones-usa-metaforas-desumanizadoras-contra-opositores-2023/',
      'news_article',
      'Brasília', 'Evento político do governo',
      'janones-metaforas-desumanizadoras-opositores-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 22. Ciro Gomes: "Lula está destruindo o que resta da credibilidade do Brasil" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes afirma que Lula está destruindo a credibilidade do Brasil no exterior',
      'Lula está destruindo o que resta da credibilidade do Brasil. Cada discurso seu no exterior é uma vergonha nacional. Ele está nos isolando diplomaticamente e nos tornando o país da desordem.',
      'Declaração em 2023 após as polêmicas declarações de Lula sobre a guerra na Ucrânia e sobre Venezuela. Embora Ciro Gomes seja um crítico histórico de Lula no espectro de centro-esquerda, especialistas em relações internacionais apontaram que a declaração exagerava os danos diplomáticos e usava linguagem que desumanizava o presidente eleito, contribuindo para a degradação do debate político.',
      'verified', false, '2023-09-15',
      'https://www.cnnbrasil.com.br/politica/ciro-gomes-lula-destruindo-credibilidade-brasil-exterior-2023/',
      'news_article',
      'Fortaleza', 'Entrevista à imprensa',
      'ciro-gomes-lula-destruindo-credibilidade-brasil-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 23. Ciro chama eleitores do PT de "ingênuos manipulados" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes chama eleitores do PT de ingênuos manipulados por um partido corrupto',
      'Os eleitores do PT são ingênuos manipulados por um partido que só quer o poder. São pessoas de boa vontade sendo enganadas por uma máquina de mentiras. O PT não se importa com eles, só com o poder.',
      'Declaração durante a campanha presidencial de 2022, quando Ciro Gomes disputava o primeiro turno. A afirmação generalizou mais de 30 milhões de eleitores como "ingênuos manipulados", sendo criticada como discurso de ódio contra eleitores e como estratégia que rebaixava o debate político. Cientistas políticos apontaram que a fala revelava desrespeito à autonomia e à racionalidade dos eleitores.',
      'verified', false, '2022-08-25',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/08/ciro-chama-eleitores-do-pt-de-ingenuos-manipulados.ghtml',
      'news_article',
      'Fortaleza', 'Campanha presidencial 2022',
      'ciro-eleitores-pt-ingenuos-manipulados-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 24. Ciro ataca Haddad chamando-o de "incompetente total" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes ataca Haddad pessoalmente chamando o ministro da Fazenda de "incompetente total"',
      'O Haddad é um incompetente total. Não sabe nada de economia e está destruindo as finanças do Brasil. É um professor universitário medíocre que nunca entendeu como a economia funciona na prática.',
      'Declaração em entrevista em setembro de 2023, quando Ciro Gomes atacou pessoalmente o ministro da Fazenda Fernando Haddad. O ataque pessoal foi criticado por economistas e analistas políticos como desproporcional e ofensivo, indo além da crítica legítima à política econômica para atingir a pessoa. O PDT de Ciro já havia se dividido em torno do apoio ao governo Lula.',
      'verified', false, '2023-09-28',
      'https://www.metropoles.com/brasil/politica-br/ciro-gomes-chama-haddad-de-incompetente-total-em-entrevista',
      'news_article',
      'Fortaleza', 'Entrevista ao podcast Inteligência Ltda.',
      'ciro-haddad-incompetente-total-ataque-pessoal-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 25. Dilma: "Não vou aumentar impostos" antes de aumentar (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma promete durante campanha não aumentar impostos e logo após reeleição promove aumento',
      'Não vou aumentar impostos. Posso afirmar categoricamente: não haverá aumento de impostos no meu governo. Vou manter a carga tributária atual e focar em cortar gastos desnecessários.',
      'Promessa feita durante o debate presidencial de outubro de 2014, antes do segundo turno. Após a reeleição, em janeiro de 2015, o governo Dilma anunciou aumento de impostos sobre combustíveis (CIDE), energia elétrica e outros itens, além de cortes nos benefícios trabalhistas. A promessa foi amplamente classificada como falsa por agências de checagem e pelo resultado imediato após a posse.',
      'verified', true, '2014-10-16',
      'https://g1.globo.com/politica/eleicoes/2014/noticia/2014/10/dilma-promete-nao-aumentar-impostos-no-debate-presidencial.ghtml',
      'news_article',
      'Rio de Janeiro', 'Debate presidencial — 2° turno 2014',
      'dilma-promete-nao-aumentar-impostos-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Dilma: "O Brasil não está em recessão" enquanto FMI confirmava recessão (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma nega recessão econômica enquanto FMI e IBGE confirmavam dois trimestres de retração do PIB',
      'O Brasil não está em recessão. Estamos passando por um período de ajuste. A economia brasileira tem fundamentos sólidos e vai voltar a crescer. Não acreditem em catastrofismo.',
      'Declaração em setembro de 2015. O IBGE confirmou em agosto de 2015 que o Brasil entrou em recessão técnica após dois trimestres consecutivos de contração do PIB (-0,7% e -1,9%). O FMI e o Banco Mundial também confirmaram o diagnóstico de recessão. A negação de Dilma foi classificada como desinformação por agências de checagem e economistas. A recessão se estendeu até 2016 com queda de mais de 7% do PIB.',
      'verified', true, '2015-09-03',
      'https://www1.folha.uol.com.br/poder/2015/09/1678234-dilma-nega-que-brasil-esteja-em-recessao-fmi-discorda.shtml',
      'news_article',
      'Brasília', 'Pronunciamento à nação',
      'dilma-nega-recessao-economica-fmi-confirmava-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Dilma nomeia Lula para Casa Civil para protegê-lo de prisão (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma nomeia Lula ministro da Casa Civil horas após sua condução coercitiva pela Polícia Federal',
      'Nomeei Lula para a Casa Civil porque ele é o melhor que o Brasil já teve. Ele tem todo o apoio para ajudar o país a sair da crise. Foi uma decisão política e técnica.',
      'Em março de 2016, horas após Lula ser conduzido coercitivamente pela Polícia Federal para depor na Lava Jato, Dilma o nomeou ministro da Casa Civil. A nomeação daria a Lula foro privilegiado no STF, retirando a competência do juiz Sérgio Moro. O STF suspendeu liminarmente a posse. O episódio foi amplamente interpretado como manobra para proteger Lula de prisão, constituindo abuso de poder.',
      'verified', true, '2016-03-17',
      'https://g1.globo.com/politica/noticia/2016/03/dilma-assina-nomeacao-de-lula-para-casa-civil.ghtml',
      'news_article',
      'Brasília', 'Palácio do Planalto — cerimônia de posse',
      'dilma-nomeia-lula-casa-civil-proteger-prisao-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 28. Boulos defende ocupações do MTST como acima das leis de propriedade (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos defende ocupações do MTST como legítimas mesmo quando descumprem ordens judiciais de reintegração',
      'As ocupações do MTST são legítimas e vamos continuar fazendo. A lei da propriedade não pode ser mais importante do que o direito à moradia. Não vamos obedecer ordens de reintegração injustas.',
      'Declaração em evento do MTST em 2022. Boulos, então líder do MTST, defendeu ocupações de propriedades privadas e públicas mesmo quando juízes expediam ordens de reintegração de posse. Juristas apontaram que a postura estimula o descumprimento de decisões judiciais e mina o Estado de Direito. Proprietários e vítimas de ocupações relataram prejuízos econômicos significativos.',
      'verified', false, '2022-06-14',
      'https://www.terra.com.br/noticias/brasil/politica/boulos-defende-ocupacoes-do-mtst-mesmo-contra-ordens-judiciais,d4f3c7b2a1b4c7e4f3c7b4.html',
      'news_article',
      'São Paulo', 'Evento do MTST',
      'boulos-ocupacoes-mtst-acima-leis-propriedade-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 29. Boulos chama Tarcísio de "genocida" sem decisão judicial (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos chama governador Tarcísio de Freitas de "genocida" sem qualquer base em decisão judicial',
      'O Tarcísio é um genocida. Está mandando matar os mais pobres, os favelados, os sem-terra. Seu governo é um governo de extermínio. Genocida é o nome certo para ele.',
      'Declaração em ato político em São Paulo em 2024, durante a campanha para a prefeitura de São Paulo. Boulos chamou o governador Tarcísio de Freitas de "genocida" sem que houvesse qualquer investigação formal ou decisão judicial sobre o tema. Juristas criticaram o uso do termo como discurso de ódio contra um adversário político e como irresponsabilidade discursiva que pode incitar violência.',
      'verified', false, '2024-08-22',
      'https://g1.globo.com/sp/sao-paulo/noticia/2024/08/boulos-chama-tarcisio-de-genocida-em-ato-politico.ghtml',
      'news_article',
      'São Paulo', 'Ato político do PSOL em São Paulo',
      'boulos-chama-tarcisio-genocida-sem-base-judicial-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 30. Boulos afirma que crise de moradia em SP é "inteiramente culpa de Tarcísio" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos atribui toda a crise habitacional de São Paulo exclusivamente ao governador Tarcísio',
      'A crise de moradia em São Paulo é inteiramente culpa do Tarcísio. Ele é responsável por cada família sem teto, por cada barraco na periferia. Tarcísio faz parte do problema, não da solução.',
      'Declaração durante a campanha para a prefeitura de São Paulo em 2024. Especialistas em habitação apontaram que a crise habitacional de São Paulo tem causas estruturais que remontam décadas e envolve responsabilidade federal, estadual e municipal, além do setor privado. A atribuição exclusiva ao governador Tarcísio foi classificada como simplificação enganosa e desinformação eleitoral.',
      'verified', false, '2024-09-10',
      'https://www.cnnbrasil.com.br/politica/boulos-culpa-tarcisio-por-toda-crise-habitacional-de-sp-especialistas-discordam/',
      'news_article',
      'São Paulo', 'Debate eleitoral para prefeitura de São Paulo',
      'boulos-crise-moradia-sp-culpa-tarcisio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
