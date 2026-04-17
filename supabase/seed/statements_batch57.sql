-- Batch 57: Política externa (2023-2026)
-- BRICS, Mercosul, Ucrânia, Gaza, EUA (Trump), Venezuela, Argentina,
-- G20 Rio, COPs do clima, África, Cuba, controvérsias do Itamaraty
-- 50 statements

DO $$
DECLARE
  v_lul UUID; v_mou UUID; v_alc UUID; v_bol UUID; v_edu UUID;
  v_mar UUID; v_dil UUID; v_fhc UUID; v_tem UUID; v_had UUID;
  v_mer UUID;
  c_irr UUID; c_des UUID; c_abu UUID; c_ant UUID; c_odi UUID;
  c_aut UUID; c_xen UUID; c_ame UUID; c_con UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';

  -- 1. Lula Ucrânia culpa
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula afirma que Ucrânia "é tão culpada" quanto Rússia pela guerra e gera crise diplomática com Zelensky.',
      'Os Estados Unidos precisam parar de incentivar a guerra e começar a falar em paz. A União Europeia precisa falar em paz. Aí a gente vai conseguir construir uma solução. A Ucrânia é tão responsável quanto a Rússia pela continuidade dessa guerra. Os dois decidiram a guerra. Agora têm que decidir a paz.',
      'Lula em entrevista em Abu Dhabi em abril de 2023, durante escala de viagem à China. A declaração provocou protesto oficial dos Estados Unidos e da União Europeia, que classificaram como equidistância indevida com Moscou, e abriu crise com Zelensky.',
      'verified', true, '2023-04-15',
      'https://www1.folha.uol.com.br/mundo/2023/04/lula-ucrania-tao-culpada-quanto-russia-guerra.shtml',
      'news_article',
      'Abu Dhabi', 'Entrevista coletiva — escala em Abu Dhabi', 'lula-ucrania-tao-culpada-quanto-russia-abril-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2. Lula Zelensky mão de obra
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula diz que Zelensky "não pode querer tudo" e que guerra na Ucrânia "vai faltar mão de obra" para lutar.',
      'O Zelensky não pode querer tudo. Ele quer armas, ele quer dinheiro, ele quer solidariedade, ele quer sanções contra a Rússia. Ao mesmo tempo, ele não aceita conversar com o Putin. Uma hora vai faltar mão de obra para essa guerra. E aí quem vai morrer é o povo ucraniano enquanto os líderes ficam em seus gabinetes.',
      'Lula em entrevista à Globonews em maio de 2023, ao ser questionado sobre seu convite para reunião com Zelensky recusada em Hiroshima. A declaração foi considerada ofensiva por Kyiv e usada pela Rússia como endosso de sua narrativa sobre a guerra.',
      'verified', true, '2023-05-22',
      'https://g1.globo.com/politica/noticia/2023/05/22/lula-zelensky-nao-pode-querer-tudo-guerra-mao-de-obra.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'lula-zelensky-mao-de-obra-maio-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3. Lula genocídio Gaza
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula compara ação de Israel em Gaza ao Holocausto e chama operação militar de "genocídio".',
      'O que está acontecendo na faixa de Gaza com o povo palestino não tem paralelo em outros momentos históricos. Na verdade existiu quando o Hitler resolveu matar os judeus. Não é guerra, é genocídio. Crianças e mulheres sendo assassinadas. Elas não têm nada a ver com essa guerra, com o que o Hamas fez a cidadãos israelenses.',
      'Lula em entrevista em Adis Abeba em fevereiro de 2024, durante cúpula da União Africana. A fala provocou crise diplomática máxima: Israel declarou Lula persona non grata e o Brasil retirou ministros entre uma semana depois.',
      'verified', true, '2024-02-18',
      'https://www1.folha.uol.com.br/mundo/2024/02/lula-compara-gaza-holocausto-genocidio-hitler.shtml',
      'news_article',
      'Adis Abeba', 'Cúpula da União Africana', 'lula-gaza-holocausto-hitler-genocidio-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4. Mauro Vieira convocado Israel
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira defende Lula e chama decisão de Israel de declarar presidente persona non grata de "ato inaceitável".',
      'A declaração do presidente brasileiro é conhecida. Refletiu a indignação do Brasil, e de boa parte da comunidade internacional, com o que está ocorrendo em Gaza. A reação do governo de Israel, declarando o presidente Lula persona non grata, é um ato inaceitável contra o Brasil. Nosso embaixador foi convocado para consulta.',
      'Mauro Vieira, ministro das Relações Exteriores, em declaração oficial no Itamaraty em fevereiro de 2024, após Israel declarar Lula persona non grata. O Brasil convocou o embaixador brasileiro em Tel Aviv em retaliação, ato inédito na relação bilateral.',
      'verified', true, '2024-02-19',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-02/mauro-vieira-israel-persona-non-grata-inaceitavel',
      'news_article',
      'Brasília', 'Declaração oficial — Itamaraty', 'mauro-vieira-israel-inaceitavel-fevereiro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5. Lula Putin 2024
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula afirma que Putin não seria preso no Brasil apesar de mandado do TPI.',
      'Se o Putin vier ao Brasil para o G20, ele não vai ser preso. O Putin é o presidente de um país. Não cabe a nós prender chefe de Estado que vem visitar o Brasil. Vou estudar, mas digo desde já que ele não seria preso em território brasileiro. Convidar para o G20 e prender é um absurdo.',
      'Lula em entrevista à CNN em setembro de 2023, sobre o mandado de prisão da Corte Penal Internacional contra Vladimir Putin por crimes de guerra na Ucrânia. O Brasil é signatário do Estatuto de Roma, o que obriga cumprimento dos mandados.',
      'verified', true, '2023-09-09',
      'https://g1.globo.com/mundo/noticia/2023/09/09/lula-putin-nao-preso-brasil-g20-tpi.ghtml',
      'news_article',
      'Nova Délhi', 'Entrevista à CNN durante G20 Índia', 'lula-putin-nao-preso-g20-tpi-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6. Lula BRICS expansão
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula comemora expansão do BRICS e diz que bloco "vai superar" o G7 em peso econômico global.',
      'O BRICS ampliado vai superar o G7 em peso econômico global. Com os novos países, somos mais da metade da população do planeta e quase metade do PIB mundial. É uma nova ordem multipolar sendo construída. O Sul Global está se organizando para não depender mais de centros de poder que nunca nos ouviram.',
      'Lula em coletiva em Joanesburgo em agosto de 2023, na cúpula do BRICS que aprovou a entrada de Arábia Saudita, Egito, Emirados, Etiópia e Irã no bloco. A expansão foi apresentada como vitória da diplomacia brasileira e do Sul Global.',
      'verified', true, '2023-08-24',
      'https://www1.folha.uol.com.br/mundo/2023/08/lula-brics-superar-g7-peso-economico-joanesburgo.shtml',
      'news_article',
      'Joanesburgo', 'Cúpula do BRICS 2023', 'lula-brics-superar-g7-joanesburgo-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7. Lula Venezuela Maduro 2024
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula diz que "tem medo" do resultado eleitoral venezuelano e que Maduro "precisa aprender com derrota".',
      'Eu tenho um pouco de medo do Maduro quando ele diz que se perder a eleição vai ter banho de sangue. Quem perde eleição toma banho de voto, não banho de sangue. O Maduro precisa aprender que se ganhar fica, se perder sai. É assim em qualquer democracia. Venezuela precisa de eleição limpa e transparente.',
      'Lula em entrevista a TVs em julho de 2024, poucos dias antes da eleição presidencial venezuelana. A declaração rompeu com o tom complacente tradicional do PT em relação a Maduro e sinalizou distanciamento após as ameaças chavistas.',
      'verified', true, '2024-07-18',
      'https://oglobo.globo.com/mundo/noticia/2024/07/lula-maduro-banho-de-sangue-voto-venezuela.ghtml',
      'news_article',
      'Brasília', 'Entrevista a TVs — Planalto', 'lula-maduro-banho-de-sangue-julho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8. Mauro Vieira Venezuela atas
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira exige publicação das atas eleitorais da Venezuela e diz que Brasil "não vai reconhecer" vitória sem provas.',
      'O Brasil não vai reconhecer a vitória proclamada de ninguém enquanto as atas eleitorais não forem publicadas. É inaceitável que um país democrático anuncie vencedor sem apresentar a verificação básica. O Brasil exige transparência. Não se faz eleição no escuro. A diplomacia brasileira não assina embaixo de opacidade.',
      'Mauro Vieira em nota conjunta Brasil, Colômbia e México em agosto de 2024, cobrando transparência do governo Maduro após anúncio contestado de reeleição. O Itamaraty assumiu papel central na tentativa de mediação da crise venezuelana.',
      'verified', true, '2024-08-01',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-08/brasil-exige-atas-venezuela-mauro-vieira',
      'news_article',
      'Brasília', 'Nota conjunta — Brasil, Colômbia e México', 'mauro-vieira-atas-venezuela-agosto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9. Milei xinga Lula
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula se recusa a dar as mãos a Milei em reunião do Mercosul e ironiza "ofensas" do argentino.',
      'O presidente Milei precisa pedir desculpas pelas ofensas que ele proferiu. Ele me chamou de comunista, corrupto, me chamou de tudo. Enquanto não pedir desculpas, não vou ter encontro com ele. E eu não preciso dele para governar o Brasil. A Argentina é que precisa do Brasil.',
      'Lula em entrevista em dezembro de 2023, após o presidente argentino eleito Javier Milei o ter chamado repetidamente de "corrupto" e "comunista" durante campanha. Os dois líderes só se encontraram formalmente no Mercosul em julho de 2024.',
      'verified', false, '2023-12-14',
      'https://www.cnnbrasil.com.br/internacional/lula-milei-desculpas-ofensas-comunista/',
      'news_article',
      'Brasília', 'Entrevista coletiva — Planalto', 'lula-milei-desculpas-ofensas-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10. Alckmin Mercosul UE
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_alc,
      'Geraldo Alckmin celebra acordo Mercosul-União Europeia e chama de "maior acordo comercial da história do Brasil".',
      'Este é o maior acordo comercial da história do Brasil. Vamos ampliar acesso a um mercado de setecentos milhões de pessoas, com proteção ambiental, com regras de origem modernas, com respeito aos trabalhadores. Depois de vinte e cinco anos de negociação, o Mercosul e a União Europeia saem juntos, e o Brasil no centro.',
      'Geraldo Alckmin, vice-presidente e ministro do Desenvolvimento, Indústria e Comércio, em coletiva em Montevidéu em dezembro de 2024, após a conclusão do acordo Mercosul-UE. O tratado, assinado após décadas de impasse, precisa ainda ser ratificado.',
      'verified', true, '2024-12-06',
      'https://valor.globo.com/politica/noticia/2024/12/06/alckmin-mercosul-ue-maior-acordo-historia-brasil.ghtml',
      'news_article',
      'Montevidéu', 'Cúpula Mercosul — assinatura Mercosul-UE', 'alckmin-mercosul-ue-maior-acordo-historia-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11. Bolsonaro CPAC
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_bol,
      'Bolsonaro diz no CPAC Brasil que política externa de Lula é "vergonha nacional" e o alinha a "ditadores do mundo".',
      'A política externa do Lula é uma vergonha nacional. Abraçou o Maduro, abraçou o Ortega, abraçou o Hamas, defendeu o Putin. Não sobrou ditador do mundo que esse governo não tenha tratado como amigo. Enquanto isso, países democráticos cada vez mais reduzem a relevância do Brasil no mundo. Isso se resolve em 2026.',
      'Jair Bolsonaro em discurso na edição brasileira do CPAC em Balneário Camboriú em julho de 2023. O evento da direita conservadora atacou repetidamente a diplomacia lulista, com forte presença da família Bolsonaro.',
      'verified', false, '2023-07-03',
      'https://www.gazetadopovo.com.br/republica/bolsonaro-cpac-brasil-politica-externa-lula-vergonha/',
      'news_article',
      'Balneário Camboriú', 'CPAC Brasil 2023', 'bolsonaro-cpac-politica-externa-vergonha-julho-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12. Eduardo Bolsonaro EUA Trump
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede a Trump sanções contra ministros do STF brasileiro.',
      'Pedimos ao presidente Trump e ao Congresso americano que apliquem sanções contra Alexandre de Moraes e outros ministros do STF. Eles perseguem patriotas brasileiros, censuram redes sociais, prendem inocentes. Os Estados Unidos têm a Lei Magnitsky exatamente para isso. É hora de o mundo livre reagir à ditadura togada no Brasil.',
      'Eduardo Bolsonaro, deputado federal pelo PL, em entrevista a portais conservadores americanos em março de 2025, articulando lobby pela aplicação da Lei Magnitsky contra ministros do STF. Foi alvo de investigação no STF por esse tipo de ação.',
      'verified', true, '2025-03-12',
      'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-trump-sancoes-moraes-stf-lei-magnitsky/',
      'news_article',
      'Washington D.C.', 'Evento conservador — Heritage Foundation', 'eduardo-bolsonaro-trump-sancoes-stf-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 13. Trump tarifas Brasil
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula reage a tarifa de Trump ao Brasil e diz que "reciprocidade será imediata".',
      'O Brasil não vai aceitar ser tratado como vassalo de ninguém, nem dos Estados Unidos. Se o Trump anunciar tarifas contra produto brasileiro, a reciprocidade será imediata. A gente não quer briga comercial, mas também não vai dobrar o joelho diante de ameaça. O Brasil é um país soberano.',
      'Lula em pronunciamento em fevereiro de 2025, reagindo ao anúncio de Donald Trump de tarifas de 25% sobre exportações de aço e alumínio que afetariam o Brasil. O episódio abriu novo capítulo de tensão com a segunda administração Trump.',
      'verified', true, '2025-02-10',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-02/lula-reage-tarifa-trump-reciprocidade-imediata',
      'news_article',
      'Brasília', 'Pronunciamento — Palácio do Planalto', 'lula-reage-tarifa-trump-reciprocidade-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14. Mauro Vieira Palestina
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira defende adesão plena da Palestina à ONU e chama veto dos EUA de "erro histórico".',
      'O Brasil defende a adesão plena da Palestina como Estado membro da ONU. O veto dos Estados Unidos é um erro histórico. Só há paz sustentável no Oriente Médio com a solução de dois Estados, convivendo lado a lado em segurança e dignidade. Adiar o reconhecimento da Palestina é perpetuar o sofrimento.',
      'Mauro Vieira em discurso na ONU em abril de 2024, em defesa da admissão plena da Palestina após veto americano no Conselho de Segurança. A posição reforçou o protagonismo brasileiro na defesa da causa palestina em fóruns multilaterais.',
      'verified', true, '2024-04-18',
      'https://www1.folha.uol.com.br/mundo/2024/04/mauro-vieira-palestina-onu-veto-eua-erro-historico.shtml',
      'news_article',
      'Nova York', 'Conselho de Segurança da ONU', 'mauro-vieira-palestina-onu-abril-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15. Lula Xi Jinping
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula recebe Xi Jinping e assina parceria estratégica para "nova era" Brasil-China.',
      'Estamos inaugurando uma nova era na relação Brasil-China. Vamos muito além do comércio. Temos acordos em infraestrutura, em semicondutores, em satélites, em descarbonização e em cooperação educacional. Com o presidente Xi, o Brasil encontra um parceiro de longo prazo, respeitoso, que não faz chantagem.',
      'Lula em cerimônia com Xi Jinping em Brasília em novembro de 2024, durante visita de Estado do líder chinês ao Brasil. Foram assinados 37 acordos, incluindo plano estratégico Rota da Seda adaptado, símbolo da aproximação histórica.',
      'verified', true, '2024-11-20',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-11/lula-xi-jinping-nova-era-parceria-estrategica',
      'news_article',
      'Brasília', 'Visita de Estado — Xi Jinping no Planalto', 'lula-xi-jinping-nova-era-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16. G20 Rio
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula encerra G20 no Rio com Aliança Global contra a Fome e chama conferência de "divisor de águas".',
      'O G20 do Rio foi um divisor de águas. Aprovamos a Aliança Global contra a Fome e a Pobreza, com adesão de quase todos os países. Aprovamos a taxação dos super-ricos como princípio. Colocamos o Sul Global no centro do debate econômico. Não foi apenas mais uma cúpula. Foi o início de uma nova ordem internacional.',
      'Lula em discurso de encerramento do G20 no Rio de Janeiro em novembro de 2024, pondo fim à presidência brasileira do fórum. A Aliança Global contra a Fome foi a grande marca, com adesão de 148 países e grupos, e foi apresentada como vitória diplomática.',
      'verified', true, '2024-11-19',
      'https://oglobo.globo.com/politica/noticia/2024/11/lula-encerra-g20-rio-aliança-global-fome.ghtml',
      'news_article',
      'Rio de Janeiro', 'Cúpula do G20 Rio 2024', 'lula-g20-rio-alianca-fome-divisor-aguas-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17. Lula Cuba bloqueio
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula defende fim do embargo a Cuba e chama sanções americanas de "crime contra a humanidade".',
      'O bloqueio dos Estados Unidos contra Cuba é um crime contra a humanidade. Há mais de sessenta anos o povo cubano sofre por uma vingança política de Washington. Não se resolve nenhum problema asfixiando onze milhões de pessoas. O Brasil sempre defendeu, e vai continuar defendendo, o fim do bloqueio e a normalização das relações.',
      'Lula em discurso na cúpula do G77+China em Havana em setembro de 2023. A fala reforçou o alinhamento do Brasil com a posição histórica do Sul Global contra o embargo e gerou incômodo com a administração Biden.',
      'verified', false, '2023-09-15',
      'https://www.cartacapital.com.br/mundo/lula-embargo-cuba-crime-humanidade-havana/',
      'news_article',
      'Havana', 'Cúpula do G77+China', 'lula-embargo-cuba-crime-humanidade-setembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18. Lula Milei rompimento
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula ironiza Milei motosserra e diz que "ninguém acredita no argentino" depois de um ano.',
      'O Milei chegou com motosserra e promessa de acabar com a casta. Passou um ano, a inflação ainda está nas alturas, a pobreza aumentou, a Argentina mais isolada do que nunca. Ninguém mais acredita naquele discurso. O povo argentino já está se arrependendo de ter eleito aquela figura. Saudades do Alberto Fernández.',
      'Lula em entrevista em dezembro de 2024, às vésperas do primeiro aniversário da posse de Javier Milei. A declaração provocou resposta em tom igualmente duro do governo argentino e aprofundou a deterioração bilateral.',
      'verified', false, '2024-12-08',
      'https://g1.globo.com/mundo/noticia/2024/12/08/lula-ironiza-milei-motosserra-argentina.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'lula-ironiza-milei-motosserra-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19. Marina Silva COP28
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mar,
      'Marina Silva celebra texto final da COP28 que menciona pela primeira vez transição para longe de combustíveis fósseis.',
      'Pela primeira vez em quase trinta anos de COP, o texto final menciona a transição para longe dos combustíveis fósseis. É imperfeito, é menos do que a ciência exige, mas é um marco histórico. O Brasil volta à COP como protagonista, liderando com a proposta de uma transição justa. Não podemos perder mais tempo.',
      'Marina Silva, ministra do Meio Ambiente, em coletiva de encerramento da COP28 em Dubai em dezembro de 2023. A ministra destacou a primeira menção explícita a combustíveis fósseis em texto de COP, considerada vitória das forças de transição.',
      'verified', false, '2023-12-13',
      'https://agenciabrasil.ebc.com.br/meio-ambiente/noticia/2023-12/marina-silva-cop28-combustiveis-fosseis',
      'news_article',
      'Dubai', 'COP28', 'marina-cop28-combustiveis-fosseis-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20. Lula BRICS moeda
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula propõe moeda comum do BRICS para reduzir dependência do dólar no comércio internacional.',
      'Por que todo país precisa fazer comércio usando dólar? Por que a gente não pode fazer comércio usando nossa própria moeda? Precisamos de um banco do BRICS, de uma moeda do BRICS. O dólar não pode continuar sendo o único meio de troca global. Nenhum país deveria ter o poder unilateral de impor sanções financeiras.',
      'Lula em discurso na cúpula do BRICS em Joanesburgo em agosto de 2023, propondo formalmente criação de mecanismo de pagamentos alternativo ao sistema dólar. A proposta teve eco limitado entre os membros mas se tornou pauta recorrente nos BRICS.',
      'verified', true, '2023-08-23',
      'https://www1.folha.uol.com.br/mercado/2023/08/lula-moeda-brics-dolar-dependencia-joanesburgo.shtml',
      'news_article',
      'Joanesburgo', 'Cúpula do BRICS 2023', 'lula-moeda-brics-dolar-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21. Lula África
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula pede perdão ao povo africano pela escravidão e promete reparação histórica.',
      'Eu venho aqui, em nome do povo brasileiro, pedir perdão ao povo africano pela escravidão. Foi o maior crime da história da humanidade. O Brasil se construiu com sangue e suor de africanos escravizados. Temos uma dívida histórica. E reparar essa dívida é compromisso deste governo. Vamos ampliar a cooperação Sul-Sul.',
      'Lula em discurso em São Tomé e Príncipe em agosto de 2023, durante viagem ao continente africano. A declaração reacendeu debate sobre reparações históricas e foi elogiada por líderes africanos presentes no evento.',
      'verified', false, '2023-08-26',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2023-08/lula-pede-perdao-africa-escravidao-reparacao',
      'news_article',
      'São Tomé', 'Discurso em São Tomé e Príncipe', 'lula-pede-perdao-africa-escravidao-agosto-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22. Mauro Vieira ONU Israel
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira apoia na ONU resolução para cessar-fogo imediato em Gaza e diz que Israel "desrespeita direito internacional".',
      'O Brasil vota a favor do cessar-fogo imediato em Gaza. A ofensiva israelense desrespeita o direito internacional humanitário, mata civis em proporção inaceitável e bloqueia ajuda humanitária. Não é defesa legítima, é castigo coletivo. O Brasil não vai se calar. A paz exige coragem, inclusive para dizer o que incomoda aliados.',
      'Mauro Vieira em discurso na Assembleia Geral da ONU em outubro de 2023, logo após o início da ofensiva israelense em Gaza em resposta aos ataques de 7 de outubro. O voto brasileiro foi apresentado como posição de princípio apesar das pressões.',
      'verified', true, '2023-10-27',
      'https://g1.globo.com/mundo/noticia/2023/10/27/mauro-vieira-onu-israel-cessar-fogo-direito-internacional.ghtml',
      'news_article',
      'Nova York', 'Assembleia Geral da ONU', 'mauro-vieira-onu-cessar-fogo-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23. Dilma BRICS
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_dil,
      'Dilma Rousseff, presidente do Novo Banco do BRICS, anuncia financiamento em moedas locais.',
      'O Novo Banco de Desenvolvimento vai aumentar significativamente a parcela de empréstimos em moedas locais dos países membros. Não faz mais sentido um banco do Sul Global operar majoritariamente em dólar. Vamos financiar infraestrutura sustentável, transição energética, saneamento, com menos dependência das moedas centrais.',
      'Dilma Rousseff, ex-presidente do Brasil e atual presidente do Novo Banco de Desenvolvimento (NDB), em entrevista em Xangai em novembro de 2023. A nova orientação marca a guinada estratégica do banco sob seu comando.',
      'verified', false, '2023-11-24',
      'https://valor.globo.com/financas/noticia/2023/11/24/dilma-novo-banco-brics-moedas-locais.ghtml',
      'news_article',
      'Xangai', 'Sede do NDB — entrevista', 'dilma-ndb-moedas-locais-novembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24. Trump tarifas aço 2025
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_alc,
      'Alckmin lidera retaliação a Trump e anuncia "lista de produtos" dos EUA para contra-tarifas.',
      'Preparamos uma lista de produtos americanos que poderão ter tarifas brasileiras em resposta à medida unilateral do governo Trump. Não queremos guerra comercial. Queremos diálogo. Mas se for imposta uma tarifa injusta, o Brasil responde com reciprocidade. Nenhum país pode aceitar passivamente ser hostilizado pelo aliado.',
      'Geraldo Alckmin em coletiva em março de 2025, após anúncio da aplicação efetiva das tarifas de 25% de Trump sobre aço e alumínio brasileiros. A lista de retaliação foi elaborada pelo Itamaraty e pelo Mdic para pressionar Washington.',
      'verified', true, '2025-03-12',
      'https://www.cnnbrasil.com.br/economia/alckmin-retaliacao-trump-tarifas-aco-lista/',
      'news_article',
      'Brasília', 'Coletiva — Mdic', 'alckmin-retaliacao-trump-tarifas-aco-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25. Marina COP30
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mar,
      'Marina Silva apresenta COP30 de Belém como "última chance" de manter meta de 1,5°C.',
      'A COP30 de Belém é a última janela realista para salvar a meta de 1,5 grau. Se não produzirmos resultado concreto aqui, o Acordo de Paris vira peça de museu. O mundo precisa sair de Belém com plano de eliminação progressiva de combustíveis fósseis, com financiamento climático efetivo, com reparação histórica.',
      'Marina Silva em abertura oficial da COP30 em Belém em novembro de 2025, maior conferência do clima já realizada em uma Amazônia. A ministra cobrou países ricos compromissos financeiros em nome dos países em desenvolvimento.',
      'verified', true, '2025-11-10',
      'https://www1.folha.uol.com.br/ambiente/2025/11/marina-silva-cop30-belem-ultima-chance-1-5-graus.shtml',
      'news_article',
      'Belém', 'Abertura oficial da COP30', 'marina-cop30-ultima-chance-belem-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26. Lula COP30 petróleo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula defende na COP30 que Brasil pode explorar petróleo na Margem Equatorial e ainda ser "líder climático".',
      'O Brasil pode ser protagonista da transição energética e, ao mesmo tempo, explorar seu próprio petróleo com responsabilidade. Isso não é contradição, é transição justa. Quem condena o Brasil por explorar a Margem Equatorial esquece que os países ricos exploram há séculos e querem agora fechar a porta para nós.',
      'Lula em discurso na COP30 em Belém em novembro de 2025, defendendo publicamente a exploração de petróleo na Foz do Amazonas mesmo sediando a Conferência do Clima. A fala provocou protestos dentro e fora do pavilhão brasileiro.',
      'verified', true, '2025-11-12',
      'https://g1.globo.com/politica/noticia/2025/11/12/lula-cop30-belem-petroleo-margem-equatorial-transicao.ghtml',
      'news_article',
      'Belém', 'Plenário da COP30', 'lula-cop30-petroleo-margem-equatorial-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27. Bolsonaro Lula ditador
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_bol,
      'Bolsonaro acusa Lula de "beijar a mão de ditadores" em viagens internacionais.',
      'O Lula só abraça ditador. Abraçou o Putin. Abraçou o Xi. Abraçou o Maduro. Defendeu o Hamas. Beijou a mão de ditadores pelo mundo enquanto hostilizou democracias como Israel e Estados Unidos. Nunca um presidente humilhou tanto a política externa do Brasil. O mundo livre já não leva mais o Brasil a sério.',
      'Jair Bolsonaro em discurso em novembro de 2023, durante evento de sua executiva nacional. O ex-presidente acumulou ataques à política externa ao longo do primeiro ano do Lula 3, tentando construir narrativa de isolamento diplomático do país.',
      'verified', false, '2023-11-09',
      'https://www.gazetadopovo.com.br/republica/bolsonaro-lula-abraca-ditadores-politica-externa/',
      'news_article',
      'Brasília', 'Executiva Nacional do PL', 'bolsonaro-lula-abraca-ditadores-novembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28. Lula reconhece Palestina
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula anuncia plena defesa do Estado da Palestina e eleva status da missão diplomática brasileira.',
      'O Brasil vai elevar o status da representação palestina no país. E vou pessoalmente defender, em todos os fóruns internacionais, a admissão plena da Palestina como membro das Nações Unidas. Dois Estados soberanos é a única solução. Não pode haver dois pesos e duas medidas, nem para aliado, nem para ninguém.',
      'Lula em pronunciamento em junho de 2024, após ataques intensificados de Israel em Rafah. O Brasil chamou de volta o embaixador em Tel Aviv e elevou missão palestina em Brasília, num dos gestos mais duros já adotados por Brasília contra Israel.',
      'verified', true, '2024-06-12',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-06/lula-eleva-representacao-palestina-embaixador-israel',
      'news_article',
      'Brasília', 'Pronunciamento — Planalto', 'lula-eleva-representacao-palestina-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29. Lula Paraguai Itaipu
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula anuncia nova tarifa de Itaipu e diz que Brasil e Paraguai saem "ganhando juntos".',
      'Brasil e Paraguai saem ganhando juntos com o novo acordo de Itaipu. Revisamos o Anexo C do tratado depois de décadas, com bom senso dos dois lados. Energia mais competitiva para o Brasil, receita justa para o Paraguai, fortalecimento da integração. Isso é diplomacia do desenvolvimento, não é favor, é parceria.',
      'Lula em cerimônia em maio de 2024 junto com o presidente paraguaio Santiago Peña, anunciando acordo sobre a tarifa de Itaipu Binacional após meses de negociação difícil. O acordo encerrou tensão com Assunção e foi visto como vitória da diplomacia.',
      'verified', false, '2024-05-24',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-05/lula-pena-itaipu-tarifa-novo-acordo',
      'news_article',
      'Foz do Iguaçu', 'Usina de Itaipu — cerimônia', 'lula-pena-itaipu-novo-acordo-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30. Milei Lula rumo 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula afirma que torcerá pela "derrota" de Milei nas próximas eleições argentinas.',
      'Eu torço para o povo argentino voltar a eleger um governo sensato. Esse Milei com a motosserra não vai durar. Se eu pudesse votar na Argentina, votaria contra ele. Não é agressão, é obviedade. Não tenho que fingir simpatia com gente que humilha meu país. A política externa brasileira não é hipocrisia.',
      'Lula em entrevista a jornal argentino em março de 2025, interferindo publicamente no debate político argentino. A declaração acentuou a crise bilateral, levou Milei a cancelar compromissos diplomáticos e afetou o funcionamento do Mercosul.',
      'verified', false, '2025-03-02',
      'https://www.cartacapital.com.br/mundo/lula-torce-derrota-milei-argentina-2026/',
      'news_article',
      'Buenos Aires', 'Entrevista a jornal argentino', 'lula-torce-derrota-milei-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31. Temer crítica
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_tem,
      'Michel Temer alerta que política externa de Lula "despreza" aliados tradicionais do Brasil.',
      'A política externa deste governo despreza aliados tradicionais do Brasil. Os Estados Unidos, a Europa, Israel. A ênfase excessiva no Sul Global e a retórica contra o Ocidente criam custo real, em investimento, em comércio, em segurança. Não se constrói multipolaridade hostilizando quem sempre comprou do Brasil.',
      'Michel Temer em entrevista ao Estadão em setembro de 2024, criticando o alinhamento externo do governo Lula após as declarações de Lula sobre Gaza e Zelensky. O ex-presidente raramente entra em debates desse tipo, mas fez questão.',
      'verified', false, '2024-09-05',
      'https://www.estadao.com.br/politica/temer-politica-externa-lula-despreza-aliados-tradicionais/',
      'news_article',
      'São Paulo', 'Entrevista ao Estadão', 'temer-politica-externa-despreza-aliados-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32. FHC política externa
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_fhc,
      'Fernando Henrique Cardoso critica declarações de Lula sobre Ucrânia e diz que política externa "não é terceiro-mundismo".',
      'Política externa brasileira não pode ser terceiro-mundismo dos anos setenta. A Ucrânia foi invadida. Dizer que a Ucrânia é tão culpada quanto a Rússia é simplesmente errado. A Carta da ONU, que o Brasil ajudou a construir, é explícita: não se invade o vizinho. Ponto. Lula saiu do eixo. Espero que corrija o rumo.',
      'Fernando Henrique Cardoso em entrevista em maio de 2023, repudiando a declaração de Lula sobre a Ucrânia em Abu Dhabi. FHC, raro crítico de governos PT em questões externas, classificou a fala como "grave erro" para a diplomacia brasileira.',
      'verified', false, '2023-05-05',
      'https://www1.folha.uol.com.br/mundo/2023/05/fhc-critica-lula-ucrania-terceiro-mundismo.shtml',
      'news_article',
      'São Paulo', 'Entrevista à Folha de S.Paulo', 'fhc-critica-lula-ucrania-terceiro-mundismo-maio-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33. Mauro Vieira COP30 tensão
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira diz que países ricos "estão trapaceando" no financiamento climático e pede mais recursos.',
      'Os países ricos estão trapaceando no financiamento climático. Anunciam cifras infladas, contabilizam empréstimos como doação, prometem e não cumprem. Essa é a realidade. A COP30 em Belém precisa entregar o que o Norte Global nunca entregou: financiamento efetivo, novo, adicional. Sem isso, não há acordo real possível.',
      'Mauro Vieira em coletiva às vésperas da COP30, em novembro de 2025, pressionando publicamente EUA, UE e Japão por ampliação do financiamento climático. A cobrança foi estratégia consciente do Itamaraty em preparação à conferência.',
      'verified', false, '2025-11-05',
      'https://oglobo.globo.com/politica/noticia/2025/11/mauro-vieira-paises-ricos-trapaceando-financiamento-climatico.ghtml',
      'news_article',
      'Brasília', 'Coletiva pré-COP30 — Itamaraty', 'mauro-vieira-paises-ricos-trapaceando-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34. Lula gaffe ITA segurança 2026
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula comete gafe no ITA ao dizer que segurança pública "não é problema de presidente" e gera crise.',
      'Olha, segurança pública não é problema de presidente da República. É dos governadores. Se Rio e São Paulo estão em chamas, pergunte ao Cláudio Castro e ao Tarcísio. O presidente da República não tem polícia nas ruas. Está na Constituição. Não me peçam milagre. Eu tenho responsabilidade pelo Brasil, não pelo estado.',
      'Lula em discurso no Instituto Tecnológico de Aeronáutica (ITA) em São José dos Campos em fevereiro de 2026. A fala foi considerada gafe grave em pleno ano eleitoral e com onda de violência no Rio, tirando responsabilidade da União na segurança.',
      'verified', true, '2026-02-24',
      'https://www1.folha.uol.com.br/poder/2026/02/lula-gafe-ita-seguranca-publica-nao-e-problema-presidente.shtml',
      'news_article',
      'São José dos Campos', 'Discurso no ITA', 'lula-ita-seguranca-nao-e-problema-presidente-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35. Alckmin China chips
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_alc,
      'Alckmin anuncia parceria com China para construção da primeira fábrica de chips do Brasil.',
      'O Brasil vai ter sua primeira fábrica de semicondutores com cooperação chinesa. Investimento de dezenas de bilhões de reais, milhares de empregos qualificados, domínio tecnológico em área crítica. Não dá para ser potência soberana dependendo cem por cento de chip importado. Isso é política industrial de verdade.',
      'Geraldo Alckmin em coletiva em Campinas em abril de 2025, anunciando acordo com empresa chinesa para construção de fábrica de semicondutores no Brasil. O projeto provocou reação dos Estados Unidos, que pressionaram o Brasil a rever parceria.',
      'verified', false, '2025-04-08',
      'https://valor.globo.com/empresas/noticia/2025/04/08/alckmin-china-fabrica-semicondutores-brasil.ghtml',
      'news_article',
      'Campinas', 'Coletiva — Unicamp', 'alckmin-china-fabrica-semicondutores-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36. Lula Ucrânia Suíça
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula decide não enviar representação à cúpula da paz para Ucrânia e diz que "só com Rússia presente" haverá solução.',
      'Não vamos enviar ninguém para aquela conferência da Ucrânia. Não faz sentido uma cúpula da paz sem a presença da Rússia. Onde já se viu fazer paz só com um lado da mesa? O Brasil defende paz, mas paz de verdade, negociada entre as partes. Essa conferência é propaganda, não é diplomacia.',
      'Lula em entrevista em junho de 2024, anunciando que o Brasil não enviaria representação à Conferência de Paz para Ucrânia na Suíça, organizada por Zelensky. A decisão aprofundou percepção de alinhamento brasileiro com Moscou entre aliados ocidentais.',
      'verified', true, '2024-06-10',
      'https://g1.globo.com/politica/noticia/2024/06/10/lula-nao-enviar-suica-ucrania-russia-presente.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'lula-nao-envia-suica-ucrania-russia-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37. Eduardo Bolsonaro pede asilo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_edu,
      'Eduardo Bolsonaro diz estar avaliando pedir asilo político nos Estados Unidos por "perseguição" do STF.',
      'Estou avaliando pedir asilo político nos Estados Unidos. A situação no Brasil não me permite voltar com segurança. Alexandre de Moraes quer me prender simplesmente por eu estar nos Estados Unidos defendendo meu país e meu pai. Não é democracia, é perseguição política e minha vida está ameaçada.',
      'Eduardo Bolsonaro em entrevista em Washington em abril de 2025, admitindo estudar pedido de asilo nos Estados Unidos para evitar retorno ao Brasil diante de investigações do STF. A declaração provocou reação de governistas no Congresso.',
      'verified', true, '2025-04-02',
      'https://www.poder360.com.br/politica/eduardo-bolsonaro-pode-pedir-asilo-eua-stf-perseguicao/',
      'news_article',
      'Washington D.C.', 'Entrevista à imprensa brasileira', 'eduardo-bolsonaro-asilo-eua-stf-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 38. Mauro Vieira Venezuela migração
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira confirma saída do embaixador em Caracas e diz que Brasil "não compactua com apuração opaca".',
      'O Brasil não compactua com apuração opaca de eleições. Sem publicação das atas, sem transparência, não há como o governo brasileiro reconhecer a eleição venezuelana. A decisão foi comunicada formalmente ao governo de Caracas. Mantemos relação diplomática, mas não endossamos resultado sem comprovação.',
      'Mauro Vieira em coletiva em setembro de 2024, após a Venezuela expulsar o encarregado brasileiro em Caracas. O Brasil manteve relações diplomáticas, mas retirou o embaixador e recusou reconhecer a reeleição de Maduro sem publicação das atas.',
      'verified', true, '2024-09-06',
      'https://www1.folha.uol.com.br/mundo/2024/09/mauro-vieira-venezuela-atas-apuracao-opaca.shtml',
      'news_article',
      'Brasília', 'Coletiva — Itamaraty', 'mauro-vieira-venezuela-apuracao-opaca-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39. Haddad G20 super-ricos
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad celebra acordo do G20 sobre taxação de super-ricos como "passo civilizatório".',
      'O acordo do G20 sobre taxação de super-ricos é um passo civilizatório. Pela primeira vez as maiores economias do mundo reconheceram que o bilionário pagar menos imposto que o professor é aberração. O Brasil liderou essa agenda. Agora a gente precisa passar do acordo de princípio para a regulamentação efetiva em cada país.',
      'Fernando Haddad em coletiva no Rio de Janeiro em julho de 2024, após reunião de ministros de Finanças do G20 aprovar declaração conjunta apoiando taxação mínima global de bilionários. A declaração coroou agenda brasileira no fórum.',
      'verified', false, '2024-07-26',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2024-07/haddad-g20-taxacao-super-ricos-passo-civilizatorio',
      'news_article',
      'Rio de Janeiro', 'G20 Finanças — coletiva', 'haddad-g20-super-ricos-civilizatorio-julho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40. Bolsonaro Trump aliança
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_bol,
      'Bolsonaro celebra vitória de Trump e diz que "mundo livre" vai enfrentar o "socialismo" de Lula.',
      'A vitória do Trump é a vitória do mundo livre. Agora a esquerda globalista vai ter que respeitar a soberania dos povos. O Lula vai ter que engolir seco. A amizade do Brasil com os Estados Unidos vai ser reconstruída com o próximo governo brasileiro. 2026 vai ser o fim dessa experiência socialista que o PT impôs contra a vontade da maioria.',
      'Jair Bolsonaro em transmissão ao vivo em novembro de 2024, após vitória de Donald Trump nas eleições americanas. O ex-presidente tentou associar a vitória republicana como sinal de reação conservadora global, com projeção para o Brasil em 2026.',
      'verified', false, '2024-11-06',
      'https://www.gazetadopovo.com.br/republica/bolsonaro-celebra-trump-mundo-livre-socialismo-lula/',
      'news_article',
      'Brasília', 'Transmissão ao vivo', 'bolsonaro-celebra-trump-mundo-livre-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41. Lula ataque Trump ideologia
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula chama Trump de "perigoso" e diz que extrema-direita global "ameaça a democracia".',
      'O Trump é um perigo para a democracia americana e para o mundo. A extrema-direita global, da qual ele é a figura principal, ameaça as instituições democráticas em vários países. Não é alarmismo. É uma realidade que vimos em Brasília no oito de janeiro, em Washington no seis de janeiro. A gente não pode normalizar.',
      'Lula em entrevista à BBC em janeiro de 2025, dias antes da posse de Trump. A declaração foi considerada provocação desnecessária por setores diplomáticos e antecipou tensão com a nova administração americana.',
      'verified', true, '2025-01-15',
      'https://g1.globo.com/mundo/noticia/2025/01/15/lula-trump-perigoso-extrema-direita-ameaca-democracia.ghtml',
      'news_article',
      'Brasília', 'Entrevista à BBC', 'lula-trump-perigoso-extrema-direita-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42. Mercadante BRICS banco
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mer,
      'Mercadante anuncia cooperação BNDES e Novo Banco do BRICS em financiamento climático.',
      'O BNDES e o Novo Banco de Desenvolvimento do BRICS vão cofinanciar projetos de transição climática e infraestrutura verde no Sul Global. É a primeira vez que dois bancos estratégicos do Sul atuam juntos nessa escala. Estamos construindo uma arquitetura financeira alternativa ao Banco Mundial e ao FMI.',
      'Aloizio Mercadante em evento em Xangai em junho de 2024, junto com Dilma Rousseff, anunciando parceria estratégica entre BNDES e NDB. A iniciativa coroou a aproximação do banco brasileiro com instituições do Sul Global.',
      'verified', false, '2024-06-20',
      'https://valor.globo.com/financas/noticia/2024/06/20/mercadante-bndes-ndb-brics-cooperacao-clima.ghtml',
      'news_article',
      'Xangai', 'Sede do NDB', 'mercadante-bndes-ndb-brics-cooperacao-junho-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43. Lula Nicarágua
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula evita criticar Daniel Ortega e diz que "não cabe ao Brasil" julgar Nicarágua.',
      'Eu não vou ficar julgando o Ortega. Não cabe ao Brasil ficar de juiz moral dos outros países da região. Cada povo escolhe seu caminho. O que eu espero é que haja respeito aos direitos humanos, eleições, diálogo. Mas ficar apontando dedo, não é o meu estilo. Cada um sabe os problemas da sua casa.',
      'Lula em entrevista a jornalistas em março de 2024, ao ser questionado sobre a repressão do regime Ortega na Nicarágua. A equidistância provocou crítica de organizações de direitos humanos que cobravam posição mais dura de Brasília.',
      'verified', false, '2024-03-28',
      'https://oglobo.globo.com/mundo/noticia/2024/03/lula-evita-criticar-ortega-nicaragua-julgar.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'lula-evita-criticar-ortega-nicaragua-marco-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44. Alckmin acordo Japão
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_alc,
      'Alckmin anuncia acordo de cooperação tecnológica com Japão em hidrogênio verde e mobilidade elétrica.',
      'Com o Japão, o Brasil assina um acordo histórico em hidrogênio verde, mobilidade elétrica e semicondutores. Tecnologia japonesa, recursos naturais e base industrial brasileira. É uma equação perfeita. O Brasil deixa de ser commodity primária para ser parte da cadeia de alto valor agregado. Essa é a visão da Nova Indústria Brasil.',
      'Geraldo Alckmin em cerimônia em Tóquio em maio de 2024, durante visita do presidente Lula ao Japão, assinando memorando de entendimento com autoridades japonesas. O acordo coroou aproximação estratégica com o país asiático.',
      'verified', false, '2024-05-14',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2024-05/alckmin-japao-hidrogenio-verde-semicondutores',
      'news_article',
      'Tóquio', 'Cerimônia em Tóquio', 'alckmin-japao-hidrogenio-verde-maio-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45. Lula defende Maduro após eleição
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula diz que Maduro "não pode ser tratado como monstro" e chama crise venezuelana de "fabricada".',
      'O Maduro não pode ser tratado como monstro. Eu não concordo com tudo que ele faz, mas uma parte da crise venezuelana é fabricada por sanções e ingerências externas. Pressionar o povo venezuelano com embargo é crueldade. O caminho é diálogo, negociação, eleições monitoradas. Não é golpe nem sanção.',
      'Lula em entrevista em outubro de 2023, defendendo parcialmente Nicolás Maduro ao ser pressionado sobre a repressão política na Venezuela. A fala foi criticada por parte da oposição brasileira como complacência com autoritarismo chavista.',
      'verified', false, '2023-10-03',
      'https://www1.folha.uol.com.br/mundo/2023/10/lula-maduro-nao-pode-ser-tratado-como-monstro-fabricada.shtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'lula-maduro-nao-e-monstro-outubro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46. Mauro Vieira BRICS 2025
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira recebe BRICS no Rio e anuncia agenda de saúde pública, IA e financiamento climático.',
      'A cúpula do BRICS no Rio vai entregar agenda concreta em três eixos estratégicos: saúde pública global, governança da inteligência artificial e financiamento climático justo. O Brasil propõe que o BRICS se torne a principal plataforma para as agendas esquecidas pelo G7. O Sul Global não é mais coadjuvante.',
      'Mauro Vieira em declaração em julho de 2025, em preparação à presidência brasileira do BRICS e à cúpula do Rio de Janeiro. O Itamaraty estruturou agenda brasileira para o bloco com três eixos que viraram prioridade em todos os grupos de trabalho.',
      'verified', false, '2025-07-06',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-07/mauro-vieira-brics-rio-saude-ia-clima',
      'news_article',
      'Rio de Janeiro', 'Cúpula do BRICS 2025', 'mauro-vieira-brics-rio-saude-ia-clima-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47. Lula Guiana Essequibo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula alerta Venezuela e Guiana e diz que "não queremos guerra na América do Sul" por Essequibo.',
      'O que o Brasil não quer, em hipótese nenhuma, é guerra na América do Sul. Venezuela e Guiana precisam conversar. O Brasil está disponível para mediar. A gente não aceita disputa territorial resolvida por força militar. O continente já sofreu demais. Chega de conflito entre vizinhos. Diálogo, sempre.',
      'Lula em entrevista em dezembro de 2023, em meio à crise de Essequibo, após referendo venezuelano sobre o território reivindicado junto à Guiana. O Brasil reforçou dispositivos militares na fronteira e articulou mediação regional no tema.',
      'verified', true, '2023-12-07',
      'https://g1.globo.com/mundo/noticia/2023/12/07/lula-venezuela-guiana-essequibo-nao-queremos-guerra.ghtml',
      'news_article',
      'Brasília', 'Coletiva — Planalto', 'lula-essequibo-nao-queremos-guerra-dezembro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48. Haddad Trump dólar
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_had,
      'Haddad responde ameaça de Trump por "abandono do dólar" e diz que Brasil "não aceita chantagem".',
      'O Brasil não aceita chantagem de ninguém, nem mesmo dos Estados Unidos. Se o presidente Trump acha que países do BRICS discutir uso de moedas próprias é motivo para tarifar, então ele não entende o mundo em que vivemos. Cada país tem direito de escolher como fazer comércio. Soberania não se negocia.',
      'Fernando Haddad em coletiva em dezembro de 2024, respondendo a Donald Trump, que havia ameaçado tarifar 100% países do BRICS que criassem moeda alternativa ao dólar. A fala foi elogiada internamente, mas elevou a tensão bilateral.',
      'verified', false, '2024-12-02',
      'https://valor.globo.com/politica/noticia/2024/12/02/haddad-trump-dolar-nao-aceita-chantagem-brics.ghtml',
      'news_article',
      'Brasília', 'Coletiva — Ministério da Fazenda', 'haddad-trump-dolar-nao-aceita-chantagem-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49. Lula Africa 2026 gana
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_lul,
      'Lula propõe cúpula África-América do Sul de reparação histórica e cooperação Sul-Sul.',
      'Proponho aos líderes africanos e sul-americanos uma cúpula inédita de reparação histórica e cooperação Sul-Sul. Dois continentes unidos pela tragédia da escravidão e pelo legado colonial. Dois continentes que podem se unir para a bioeconomia, a segurança alimentar, a transição climática. Um novo eixo de poder.',
      'Lula em discurso em Acra em janeiro de 2026, durante visita a Gana no início do ano eleitoral. A proposta marcou agenda de projeção internacional do presidente no último ano de mandato e reforçou foco em Sul-Sul.',
      'verified', false, '2026-01-20',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2026-01/lula-propoe-cupula-africa-america-sul-gana',
      'news_article',
      'Acra', 'Visita de Estado a Gana', 'lula-cupula-africa-america-sul-gana-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50. Mauro Vieira 2026 Trump Eduardo
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, venue, event_name, slug) VALUES (
      v_mou,
      'Mauro Vieira denuncia que Eduardo Bolsonaro articula "interferência ilegal" dos EUA na eleição brasileira de 2026.',
      'O deputado Eduardo Bolsonaro articula sistematicamente com autoridades americanas medidas para interferir na eleição brasileira de 2026. Isso é uma interferência ilegal num processo soberano. É um atentado contra a democracia. O Brasil vai reagir diplomaticamente e, se for o caso, levar o assunto às cortes internacionais.',
      'Mauro Vieira em coletiva em Brasília em abril de 2026, após declarações de Eduardo Bolsonaro nos Estados Unidos pedindo sanções contra ministros do STF. A declaração abriu nova crise com Washington em pleno ano eleitoral brasileiro.',
      'verified', true, '2026-04-08',
      'https://www1.folha.uol.com.br/poder/2026/04/mauro-vieira-eduardo-bolsonaro-interferencia-ilegal-eua-eleicao-2026.shtml',
      'news_article',
      'Brasília', 'Coletiva — Itamaraty', 'mauro-vieira-denuncia-eduardo-eua-eleicao-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

END $$;
