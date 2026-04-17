-- Batch 59: Era Dilma, Lava Jato, impeachment e Temer (2011-2018)
-- Pedaladas, Operação Lava Jato, Moro e Dallagnol, prisão de Lula,
-- governo Temer, ascensão de Bolsonaro, Haddad, Cunha preso
-- 50 statements do período 2011-2018

DO $$
DECLARE
  v_dil UUID; v_tem UUID; v_lula UUID; v_lip UUID; v_cun UUID;
  v_mor UUID; v_had UUID; v_aec UUID; v_ser UUID; v_fhc UUID;
  v_bol UUID; v_edu UUID; v_fla UUID; v_pag UUID; v_cir UUID;
  v_gle UUID; v_dor UUID; v_alc UUID; v_ren UUID; v_jef UUID;
  v_sar UUID; v_mal UUID; v_jaq UUID; v_sil UUID; v_rom UUID;
  v_mar UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_hom UUID; c_mis UUID; c_mac UUID; c_aut UUID;
  c_nep UUID; c_con UUID; c_int UUID; c_amb UUID; c_obs UUID;
  c_neg UUID; c_rac UUID;
BEGIN
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lip FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_ser FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_pag FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_dor FROM politicians WHERE slug = 'doria';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_jef FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_mal FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_jaq FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_amb FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';

  -- 1. Dilma posse 2011
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff, em discurso de posse, anuncia que governará sem corrupção e promete erradicar a miséria extrema no Brasil.',
      'Venho para abrir portas e não para fechá-las. Pela primeira vez na história deste país, uma mulher assume a presidência da República. Governarei com mão firme contra a corrupção, venha de onde vier. Meu compromisso mais obstinado é o da erradicação da miséria extrema neste país.',
      'Discurso de posse de Dilma Rousseff em 1º de janeiro de 2011 no Congresso Nacional. A fala marcou a eleição da primeira mulher à presidência no Brasil e estabeleceu o combate à corrupção como pilar central, promessa posteriormente questionada por adversários.',
      'verified', true, '2011-01-01',
      'https://www1.folha.uol.com.br/poder/2011/01/855698-dilma-discurso-posse-mulher.shtml',
      'official_document',
      'Brasília', 'Posse no Congresso Nacional', 'dilma-discurso-posse-mulher-janeiro-2011'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Dilma mandioca mamífero
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff confunde conceitos em discurso improvisado e fala em estocar vento, gerando zombaria nas redes sociais.',
      'Nós estamos estocando vento. Nos próximos anos teremos muito vento armazenado no Brasil. A mandioca tem cara de mamífero, não tem? Mandioca é uma planta, raiz, mas ela cresce ali como se fosse bicho. O Brasil vai estocar vento e a mandioca vai ser um dos produtos que vamos exportar mais.',
      'Discurso improvisado de Dilma Rousseff em outubro de 2015, em evento sobre energia eólica. A fala gerou enorme repercussão nas redes sociais, virou meme e tornou-se símbolo das gafes presidenciais na reta final do mandato antes do impeachment.',
      'verified', true, '2015-10-08',
      'https://g1.globo.com/politica/noticia/2015/10/dilma-fala-em-estocar-vento.html',
      'news_article',
      'Maracanaú', 'Evento energia eólica no Ceará', 'dilma-estocar-vento-mandioca-mamifero-outubro-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Dilma defesa pedaladas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff nega que as chamadas pedaladas fiscais configurem crime de responsabilidade e classifica o impeachment como golpe.',
      'Não cometi crime de responsabilidade. As chamadas pedaladas fiscais foram práticas adotadas por governos anteriores, incluindo FHC. O que está em curso não é um processo jurídico, é um golpe parlamentar para tirar do poder uma presidenta eleita por 54 milhões de votos. Eles não têm o povo, estão usando as instituições.',
      'Discurso de Dilma Rousseff em abril de 2016, após a aprovação do impeachment pela Câmara dos Deputados. A presidenta seria afastada em maio e definitivamente impedida em 31 de agosto de 2016 pelo Senado Federal.',
      'verified', true, '2016-04-18',
      'https://www1.folha.uol.com.br/poder/2016/04/1761898-dilma-classifica-impeachment-como-golpe.shtml',
      'news_article',
      'Brasília', 'Pronunciamento no Palácio do Planalto', 'dilma-pedaladas-golpe-abril-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 4. Dilma reeleição 2014
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff vence Aécio Neves por margem apertada em 2014 e promete reformas políticas e diálogo com todos os brasileiros.',
      'Estou disposta ao diálogo, sou uma presidenta aberta a ouvir. O Brasil que me reelegeu é um Brasil de maioria e minorias. Vou governar para todos os brasileiros, os que votaram em mim e os que não votaram. A reforma política será minha primeira prioridade. O povo quer mudanças reais.',
      'Pronunciamento de Dilma Rousseff na noite da vitória em 26 de outubro de 2014, após vencer Aécio Neves com 51,64% dos votos válidos. A eleição foi a mais acirrada da história do segundo turno no Brasil e polarizou o país.',
      'verified', false, '2014-10-26',
      'https://g1.globo.com/politica/eleicoes/2014/noticia/2014/10/dilma-e-reeleita-presidente.html',
      'news_article',
      'Brasília', 'Pronunciamento de vitória', 'dilma-reeleita-dialogo-outubro-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 5. Temer ponte futuro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Michel Temer apresenta o documento Uma Ponte para o Futuro meses antes do impeachment de Dilma, antecipando a agenda econômica pós-golpe.',
      'O Brasil precisa urgentemente de uma ponte para o futuro. Chegou a hora de retomar o caminho das reformas: da Previdência, trabalhista, tributária. O Estado brasileiro está inchado e ineficiente. O PMDB apresenta aqui a alternativa que o país precisa: menos Estado, mais iniciativa privada.',
      'Lançamento do documento Uma Ponte para o Futuro pela Fundação Ulysses Guimarães do PMDB em outubro de 2015, quando Temer ainda era vice-presidente de Dilma. Críticos viram o texto como plataforma para um governo pós-impeachment.',
      'verified', true, '2015-10-29',
      'https://www1.folha.uol.com.br/poder/2015/10/1698167-temer-pmdb-ponte-para-o-futuro.shtml',
      'official_document',
      'Brasília', 'Lançamento pela Fundação Ulysses Guimarães', 'temer-ponte-futuro-outubro-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 6. Temer áudio vazado JBS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Michel Temer é gravado pelo empresário Joesley Batista em conversa na qual recebe informações sobre compra de silêncio de Eduardo Cunha.',
      'Tem que manter isso, viu? Temer aparece dando anuência a pagamentos mensais para manter Eduardo Cunha calado na prisão. Vocês têm que manter essa coisa aí, tá?',
      'Áudio gravado em conversa entre o presidente Michel Temer e o empresário Joesley Batista da JBS no Palácio do Jaburu em 7 de março de 2017, divulgada pelo Globo em 17 de maio de 2017. O escândalo levou a denúncia do PGR Janot contra Temer por corrupção passiva.',
      'verified', true, '2017-03-07',
      'https://oglobo.globo.com/politica/dono-da-jbs-grava-temer-dando-aval-para-compra-do-silencio-de-cunha-21353935',
      'video',
      'Brasília', 'Palácio do Jaburu', 'temer-audio-joesley-jbs-cunha-marco-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 7. Temer não renuncia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Michel Temer recusa renunciar após denúncia por corrupção e promete provar inocência diante da PGR.',
      'Eu não renunciarei. Repito, eu não renunciarei. Sei do que fiz e sei da correção dos meus atos. Exijo investigação plena e rápida para provar a verdade. Não aceito nem mesmo a ideia de uma renúncia. Esse governo veio para cumprir uma missão histórica de reformas e não vai abandoná-la.',
      'Pronunciamento em rede nacional de Michel Temer em 18 de maio de 2017, um dia após a divulgação do áudio da JBS. O presidente sobreviveu às duas denúncias da PGR ao impedir sua abertura via Câmara dos Deputados, com apoio do Centrão.',
      'verified', true, '2017-05-18',
      'https://g1.globo.com/politica/noticia/eu-nao-renunciarei-repito-eu-nao-renunciarei-diz-temer.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento em rede nacional', 'temer-nao-renunciarei-maio-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 8. Moro Lava Jato princípio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro defende prisões preventivas e delações premiadas como métodos necessários para desbaratar o esquema da Petrobras.',
      'A operação Lava Jato representa uma oportunidade histórica de combater a grande corrupção no Brasil. As prisões preventivas são instrumentos legais para evitar a destruição de provas e obter a cooperação dos envolvidos. Quem critica esses métodos defende a continuidade da impunidade que marcou décadas da história brasileira.',
      'Declaração do juiz federal Sérgio Moro em entrevista ao Estadão em março de 2015, defendendo os métodos da Operação Lava Jato que ele comandava em primeira instância em Curitiba. As prisões preventivas seriam depois questionadas pelo STF.',
      'verified', false, '2015-03-16',
      'https://politica.estadao.com.br/noticias/geral,moro-defende-metodos-lava-jato,1647890',
      'news_article',
      'Curitiba', 'Entrevista ao Estadão', 'moro-defende-metodos-lava-jato-marco-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 9. Moro conduz Lula coercitivo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro autoriza condução coercitiva de Lula em operação marcada por vazamentos à imprensa e grande exposição midiática.',
      'A condução coercitiva do ex-presidente Luiz Inácio Lula da Silva é medida excepcional justificada pela complexidade das investigações. Não há nenhuma perseguição política, há aplicação imparcial da lei. Ninguém está acima da lei neste país, nem mesmo ex-presidentes da República.',
      'Decisão assinada por Sérgio Moro em 4 de março de 2016, que determinou a condução coercitiva de Lula para depor na Operação Aletheia, 24ª fase da Lava Jato. A operação foi questionada pelo STF em 2018, que proibiu conduções coercitivas sem intimação prévia.',
      'verified', true, '2016-03-04',
      'https://g1.globo.com/pr/parana/noticia/2016/03/lula-e-levado-coercitivamente-depor-em-sao-paulo.html',
      'official_document',
      'Curitiba', 'Decisão judicial — 13ª Vara Federal', 'moro-conducao-coercitiva-lula-marco-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 10. Moro aceita ministerio Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro aceita convite de Bolsonaro para o Ministério da Justiça dias após prender Lula, alimentando suspeitas de parcialidade.',
      'Aceitei o convite do presidente eleito para assumir o Ministério da Justiça. Trata-se de uma oportunidade de levar à toda a administração federal os princípios de combate à corrupção e à criminalidade organizada que norteiam a Operação Lava Jato. Não há qualquer contradição com minhas decisões anteriores.',
      'Declaração de Sérgio Moro em 1º de novembro de 2018, após aceitar o convite de Jair Bolsonaro para o Ministério da Justiça. A decisão, tomada semanas depois da prisão de Lula, alimentou o argumento da defesa petista sobre parcialidade do juiz.',
      'verified', true, '2018-11-01',
      'https://g1.globo.com/politica/noticia/2018/11/01/moro-aceita-convite-de-bolsonaro-para-ministerio-da-justica.ghtml',
      'news_article',
      'Curitiba', 'Coletiva em Curitiba', 'moro-aceita-ministerio-bolsonaro-novembro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 11. Dallagnol PowerPoint
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro condena Lula no caso triplex do Guarujá a nove anos e seis meses de prisão em decisão histórica.',
      'O ex-presidente Luiz Inácio Lula da Silva recebeu vantagem indevida da construtora OAS, consubstanciada na propriedade de fato do apartamento triplex 164-A do Condomínio Solaris, em Guarujá, e em benfeitorias feitas no imóvel. Condeno o réu às penas de 9 anos e 6 meses de reclusão por corrupção passiva e lavagem de dinheiro.',
      'Sentença proferida por Sérgio Moro em 12 de julho de 2017 na Ação Penal 5046512-94.2016, condenando Lula no chamado caso triplex do Guarujá. A condenação foi mantida em segunda instância pelo TRF-4, levando Lula à prisão em abril de 2018.',
      'verified', true, '2017-07-12',
      'https://g1.globo.com/politica/operacao-lava-jato/noticia/moro-condena-lula-a-9-anos-e-6-meses-de-prisao-no-caso-do-triplex.ghtml',
      'official_document',
      'Curitiba', 'Sentença na 13ª Vara Federal', 'moro-condena-lula-triplex-julho-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 12. Lula preso discurso sindicato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lip,
      'Lula faz discurso emocionado no Sindicato dos Metalúrgicos do ABC antes de se entregar à Polícia Federal em Curitiba.',
      'Eu não tenho medo deles. Eles é que têm medo de mim. Eu vou caminhar como sempre caminhei, com a cabeça erguida. A verdade vai aparecer, esse povo vai me olhar nos olhos quando eu sair da prisão. Eu valho muito mais do que qualquer um desses caras. Eu sou uma ideia, e ideia não se prende.',
      'Discurso de Lula no Sindicato dos Metalúrgicos do ABC em São Bernardo do Campo em 7 de abril de 2018, pouco antes de se entregar à Polícia Federal para cumprir mandado de prisão expedido por Sérgio Moro. Lula ficaria preso 580 dias em Curitiba.',
      'verified', true, '2018-04-07',
      'https://g1.globo.com/sp/sao-paulo/noticia/lula-discursa-no-abc-antes-de-se-entregar.ghtml',
      'news_article',
      'São Bernardo do Campo', 'Sindicato dos Metalúrgicos do ABC', 'lula-discurso-antes-prisao-abril-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Cunha preside impeachment
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cun,
      'Eduardo Cunha abre processo de impeachment contra Dilma horas após o PT decidir não defendê-lo no Conselho de Ética.',
      'Com base nas prerrogativas regimentais desta Câmara dos Deputados, e analisados os elementos trazidos na denúncia contra a senhora presidenta da República, defiro o processamento da denúncia por crime de responsabilidade. Está aberto o processo de impeachment.',
      'Anúncio de Eduardo Cunha, presidente da Câmara dos Deputados, em 2 de dezembro de 2015, abrindo o processo de impeachment contra Dilma Rousseff. A decisão veio horas depois de a bancada do PT anunciar que votaria pela cassação de Cunha no Conselho de Ética.',
      'verified', true, '2015-12-02',
      'https://g1.globo.com/politica/noticia/2015/12/cunha-aceita-abre-processo-impeachment-dilma.html',
      'official_document',
      'Brasília', 'Câmara dos Deputados', 'cunha-abre-impeachment-dilma-dezembro-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 14. Cunha nega contas suiça
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cun,
      'Eduardo Cunha nega em CPI ter contas na Suíça e afirma que só possui contas no Brasil, declaração que seria desmentida por documentos.',
      'Se tivesse conta na Suíça, eu estaria aqui fazendo o que estou fazendo? Eu não tenho conta no exterior, nunca tive. Todas as minhas movimentações financeiras estão devidamente declaradas à Receita Federal. Essas são acusações de adversários políticos que não têm provas, apenas boatos.',
      'Depoimento de Eduardo Cunha na CPI da Petrobras em 12 de março de 2015. Meses depois, documentos da justiça suíça revelaram que Cunha tinha contas em seu nome no exterior, o que levou à sua cassação do mandato e posterior prisão pela Lava Jato.',
      'verified', true, '2015-03-12',
      'https://www1.folha.uol.com.br/poder/2015/03/1604379-cunha-nega-ter-contas-na-suica.shtml',
      'news_article',
      'Brasília', 'CPI da Petrobras — Câmara dos Deputados', 'cunha-nega-contas-suica-marco-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 15. Bolsonaro dedica voto Ustra
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro dedica voto pelo impeachment de Dilma ao coronel Ustra, torturador da ditadura que torturou a própria presidenta presa política.',
      'Perderam em 1964, perderam agora em 2016. Pela família e pela inocência das crianças em sala de aula, que o PT nunca teve, contra o comunismo, pela nossa liberdade, contra o Foro de São Paulo, pela memória do coronel Carlos Alberto Brilhante Ustra, o pavor de Dilma Rousseff, pelo Exército de Caxias, pelas nossas Forças Armadas, por um Brasil acima de tudo, e por Deus acima de todos, o meu voto é sim.',
      'Voto de Jair Bolsonaro na votação do impeachment de Dilma Rousseff na Câmara dos Deputados em 17 de abril de 2016. O deputado federal dedicou seu voto ao torturador Ustra, reconhecido judicialmente por torturar Dilma durante a ditadura. A fala gerou ampla repercussão internacional.',
      'verified', true, '2016-04-17',
      'https://www1.folha.uol.com.br/poder/2016/04/1761828-bolsonaro-dedica-voto-a-coronel-ustra.shtml',
      'parliamentary_speech',
      'Brasília', 'Plenário da Câmara dos Deputados — votação do impeachment', 'bolsonaro-dedica-voto-ustra-abril-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 16. Aécio perde 2014
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_aec,
      'Aécio Neves não aceita o resultado das eleições de 2014 e pede recontagem dos votos após derrota apertada para Dilma.',
      'Nós vamos pedir auditoria dos votos. Existem dúvidas sobre o resultado de 2014. O povo brasileiro merece ter segurança absoluta sobre o processo eleitoral. Essa é uma demanda legítima da maioria da sociedade. Não estamos colocando em xeque a democracia, estamos defendendo a democracia.',
      'Declaração de Aécio Neves em novembro de 2014, após derrota para Dilma Rousseff por margem de 3,28 pontos percentuais. O PSDB protocolou pedido de auditoria das urnas no TSE, movimento considerado por analistas como antecessor do negacionismo eleitoral bolsonarista.',
      'verified', false, '2014-11-04',
      'https://www1.folha.uol.com.br/poder/2014/11/1543867-aecio-pede-auditoria-votos.shtml',
      'news_article',
      'Brasília', 'Sede do PSDB', 'aecio-pede-auditoria-urnas-novembro-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_amb, true FROM ins;

  -- 17. Aécio áudio JBS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_aec,
      'Aécio Neves é gravado pedindo dois milhões de reais a Joesley Batista em áudio que o afastou do comando do PSDB.',
      'Tem que ser uma pessoa do meu absoluto... quer dizer, da absoluta confiança nossa, né? Dois? Não, dois é bom, dois é ótimo. Tem que ser uma pessoa do nosso círculo absoluto de confiança. Para não sobrar rastro.',
      'Áudio gravado por Joesley Batista da JBS em conversa com Aécio Neves em março de 2017, divulgado em maio do mesmo ano. O senador pedia dois milhões de reais ao empresário, o que levou ao seu afastamento do mandato, posteriormente revertido pelo STF.',
      'verified', true, '2017-03-24',
      'https://g1.globo.com/politica/noticia/aecio-neves-e-gravado-por-joesley-batista-pedindo-r-2-milhoes.ghtml',
      'video',
      'Brasília', 'Conversa gravada por Joesley Batista', 'aecio-audio-joesley-dois-milhoes-marco-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 18. Eduardo Bolsonaro ataca PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro, em seu primeiro mandato como deputado federal, ataca o PT e defende proibição do partido.',
      'O PT é uma organização criminosa que se infiltrou nas instituições democráticas para roubar e corromper o Brasil. Precisamos seguir o exemplo de outros países e estudar mecanismos de banir o partido do cenário político. O PT é o inimigo número um do Brasil, junto com a imprensa que o protege.',
      'Declaração de Eduardo Bolsonaro, então no primeiro mandato como deputado federal por São Paulo, em entrevista ao Jornal da Cidade Online em agosto de 2017. O filho do então deputado Jair Bolsonaro já construía retórica de perseguição ao PT.',
      'verified', false, '2017-08-22',
      'https://www.gazetadopovo.com.br/politica/republica/eduardo-bolsonaro-pt-organizacao-criminosa-2017/',
      'news_article',
      'Brasília', 'Entrevista ao Jornal da Cidade Online', 'eduardo-bolsonaro-banir-pt-agosto-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 19. Flávio Queiroz primeira menção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro defende Fabrício Queiroz, seu ex-assessor na Alerj, diante das primeiras reportagens sobre movimentações atípicas.',
      'O Fabrício Queiroz é um amigo pessoal e um servidor público dedicado que trabalhou comigo na Alerj por muitos anos. Essas denúncias são factoides políticos para manchar a imagem da nossa família e do presidente eleito. Não aceito ataques desse tipo. Vamos provar nossa inocência.',
      'Declaração de Flávio Bolsonaro em dezembro de 2018, após o Coaf divulgar relatório sobre movimentações atípicas de seu ex-assessor Fabrício Queiroz, incluindo o esquema das rachadinhas investigado pelo MP do Rio. O caso marcaria o início do governo Bolsonaro.',
      'verified', true, '2018-12-07',
      'https://oglobo.globo.com/politica/flavio-bolsonaro-defende-queiroz-2018-23290472',
      'news_article',
      'Rio de Janeiro', 'Coletiva de imprensa', 'flavio-queiroz-defesa-inicial-dezembro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 20. Haddad prefeito SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad, prefeito de São Paulo, defende ciclovias e política de mobilidade urbana contra oposição conservadora.',
      'A ciclovia não é privilégio de classe média, é democratização do espaço público. Por décadas São Paulo foi construída para o automóvel e ignorou o pedestre, o ciclista, o usuário de transporte público. Isso precisa mudar. Quem é contra ciclovia é contra o pobre, que é a maior parte dos ciclistas da cidade.',
      'Declaração de Fernando Haddad em 2014, durante sua gestão como prefeito de São Paulo (2013-2016). A política de ciclovias, que implantou mais de 400 km na capital, virou alvo de ataques da direita e foi parcialmente desmontada pela gestão Dória.',
      'verified', false, '2014-09-10',
      'https://www1.folha.uol.com.br/cotidiano/2014/09/1516567-haddad-defende-ciclovias-sp.shtml',
      'news_article',
      'São Paulo', 'Coletiva na Prefeitura de São Paulo', 'haddad-defende-ciclovias-setembro-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 21. Haddad candidato 2018
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad, substituto de Lula no PT em 2018, denuncia fake news massivas disparadas pelo WhatsApp na campanha.',
      'O que aconteceu no Brasil em 2018 foi uma tentativa de tomada do poder por meio de desinformação em massa. Milhões de mensagens falsas foram disparadas via WhatsApp em esquema que envolveu empresários e a campanha de Jair Bolsonaro. Essa eleição está profundamente contaminada e a democracia brasileira sofreu um golpe.',
      'Declaração de Fernando Haddad em 18 de outubro de 2018, após a Folha revelar que empresários financiaram disparos ilegais de mensagens anti-PT via WhatsApp. O candidato petista perderia o segundo turno para Bolsonaro dias depois.',
      'verified', true, '2018-10-18',
      'https://www1.folha.uol.com.br/poder/2018/10/haddad-denuncia-disparos-whatsapp.shtml',
      'news_article',
      'São Paulo', 'Coletiva de imprensa', 'haddad-denuncia-whatsapp-fake-news-outubro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Ciro Gomes ataque PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes, candidato em 2018, ataca duramente o PT por não retirar candidatura de Lula apesar da prisão e condenação.',
      'O PT é o maior responsável pela vitória do Bolsonaro nessa eleição. Insistiram numa candidatura inviável até a última hora, recusaram aliança, humilharam aliados e agora vão lamentar. O Lula foi condenado, está preso e vai ficar preso. O PT precisa aprender a fazer política sem ele. Enquanto não aprender, o Brasil paga a conta.',
      'Declaração de Ciro Gomes em 15 de outubro de 2018, entre primeiro e segundo turno da eleição, após ser cobrado a apoiar Haddad. O pedetista atribuiu a responsabilidade pela polarização ao PT e fez declarações ambíguas sobre apoio ao candidato petista.',
      'verified', false, '2018-10-15',
      'https://g1.globo.com/politica/eleicoes/2018/noticia/2018/10/15/ciro-critica-pt-segundo-turno.ghtml',
      'news_article',
      'Paris', 'Entrevista à imprensa', 'ciro-ataca-pt-segundo-turno-outubro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 23. Gleisi presidente PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann, presidente do PT, lidera campanha pela libertação de Lula e denuncia parcialidade de Sérgio Moro.',
      'A prisão do presidente Lula é um ato de perseguição política que envergonha o Brasil perante o mundo. Sérgio Moro não é juiz, é militante. As provas contra Lula são inexistentes, as condenações são firmadas em crenças, não em fatos. Lula livre é democracia livre.',
      'Declaração da presidente do PT Gleisi Hoffmann em 7 de abril de 2018, dia em que Lula se entregou à Polícia Federal. Gleisi tornou-se principal voz da campanha Lula Livre, que mobilizou vigílias em frente à sede da PF em Curitiba por meses.',
      'verified', false, '2018-04-07',
      'https://www1.folha.uol.com.br/poder/2018/04/gleisi-lula-perseguicao-moro.shtml',
      'news_article',
      'São Bernardo do Campo', 'Sindicato dos Metalúrgicos do ABC', 'gleisi-lula-perseguicao-moro-abril-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 24. Doria João doria acelera privatização
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dor,
      'João Doria, prefeito de São Paulo, lança operação Cidade Linda e apaga grafites em escândalo com artistas locais.',
      'São Paulo não pode ser a cidade da pichação, da sujeira, da desordem. Vou varrer essa cidade. Operação Cidade Linda é prioridade. Quem vai para a rua pichar patrimônio público vai ser tratado como vândalo, não como artista. Arte se faz no museu, na galeria, não no muro dos outros.',
      'Declaração de João Doria em janeiro de 2017, nos primeiros dias como prefeito de São Paulo, ao lançar a Operação Cidade Linda que apagou centenas de grafites, incluindo painéis reconhecidos. O movimento gerou manifestações de artistas e movimentos culturais.',
      'verified', false, '2017-01-14',
      'https://g1.globo.com/sao-paulo/noticia/doria-lanca-operacao-cidade-linda-pichacao.ghtml',
      'news_article',
      'São Paulo', 'Coletiva na Prefeitura de SP', 'doria-cidade-linda-pichacao-janeiro-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 25. Doria ataca PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dor,
      'João Doria anuncia candidatura ao governo de SP e ataca Lula na campanha de 2018 usando retórica antipetista.',
      'Lula ladrão, seu lugar é na prisão. O PT destruiu o Brasil e o povo não esqueceu. Essa eleição é um plebiscito sobre o futuro do país: ou voltamos ao passado da corrupção ou avançamos para um Brasil livre da quadrilha que devastou nossa economia. São Paulo não vai aceitar retrocesso.',
      'Discurso de João Doria em comício da campanha ao governo de São Paulo em setembro de 2018. O tucano tornou-se governador pelo PSDB com apoio tácito do bolsonarismo, estratégia que depois ele próprio rejeitaria.',
      'verified', false, '2018-09-10',
      'https://www1.folha.uol.com.br/poder/2018/09/doria-lula-ladrao-campanha.shtml',
      'news_article',
      'São Paulo', 'Comício da campanha ao governo de SP', 'doria-lula-ladrao-setembro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, false FROM ins;

  -- 26. Alckmin candidato 2018
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alc,
      'Geraldo Alckmin defende o centro político em campanha presidencial fracassada em 2018, alertando para riscos de extremismos.',
      'O Brasil não pode escolher entre dois extremos. De um lado, o PT que governou por 13 anos e quase quebrou o país. De outro, a extrema-direita que nunca fez nada além de discurso de ódio. Eu represento a moderação, a experiência de um gestor. Voto útil é voto em quem pode governar.',
      'Declaração de Geraldo Alckmin em debate presidencial em setembro de 2018, na candidatura que terminou com 4,76% dos votos válidos. A performance marcou o colapso do PSDB como alternativa de poder nacional, fenômeno que se aprofundou nos anos seguintes.',
      'verified', false, '2018-09-20',
      'https://g1.globo.com/politica/eleicoes/2018/noticia/2018/09/20/alckmin-debate-centro-politico.ghtml',
      'news_article',
      'São Paulo', 'Debate presidencial — Band', 'alckmin-centro-politico-debate-setembro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 27. Renan presidente Senado 2016
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros, presidente do Senado, resiste a decisão do STF que o afastou do cargo por ser réu em ação penal.',
      'Eu não vou abrir mão da presidência do Senado por uma liminar de uma decisão monocrática. O Senado Federal não se curva a decisão individual, o Senado se curva ao plenário. Vou permanecer no cargo até que a questão seja resolvida pelo colegiado do STF. A separação de poderes precisa ser respeitada.',
      'Declaração de Renan Calheiros em dezembro de 2016, após o ministro Marco Aurélio Mello determinar seu afastamento da presidência do Senado por ser réu em ação penal. O plenário do STF posteriormente manteve Renan no cargo até o fim do mandato.',
      'verified', false, '2016-12-06',
      'https://g1.globo.com/politica/noticia/renan-nao-abre-mao-presidencia-senado.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento no Senado Federal', 'renan-resiste-afastamento-stf-dezembro-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_amb, false FROM ins;

  -- 28. Bolsonaro eleito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, no primeiro pronunciamento após eleito, promete governar com base na Constituição e ataca a esquerda brasileira.',
      'Esse é o meu compromisso: seguir tendo Deus no coração, que é Pai de todos, e entender que todos os brasileiros devem estar sob o olhar da mesma Constituição. Vamos mudar os rumos do Brasil. Não admitiremos mais socialismo, comunismo, populismo e extremismo de esquerda. Vamos libertar o país da ideologia.',
      'Pronunciamento de Jair Bolsonaro em 28 de outubro de 2018, noite da vitória no segundo turno presidencial sobre Fernando Haddad. Bolsonaro foi eleito com 55% dos votos válidos, assumindo a presidência em janeiro de 2019.',
      'verified', true, '2018-10-28',
      'https://g1.globo.com/politica/eleicoes/2018/noticia/2018/10/28/bolsonaro-pronunciamento-eleito.ghtml',
      'video',
      'Rio de Janeiro', 'Pronunciamento após vitória', 'bolsonaro-eleito-pronunciamento-outubro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Paulo Guedes posse equipe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pag,
      'Paulo Guedes é anunciado como futuro superministro da Economia de Bolsonaro e promete reformas liberais radicais.',
      'O Estado brasileiro está obeso, quebrado, incapaz de cumprir suas funções básicas. Vamos fazer o choque liberal de que o país precisa há 40 anos. Previdência, privatizações, independência do Banco Central, liberdade econômica. Quem tiver medo de reforma liberal não precisa entrar neste governo.',
      'Entrevista de Paulo Guedes em novembro de 2018, após ser anunciado como futuro ministro da Economia de Bolsonaro. O economista da Escola de Chicago defendia agenda liberal radical que marcaria o governo Bolsonaro de 2019 em diante.',
      'verified', false, '2018-11-15',
      'https://www1.folha.uol.com.br/mercado/2018/11/paulo-guedes-choque-liberal.shtml',
      'news_article',
      'Rio de Janeiro', 'Entrevista à Folha', 'guedes-choque-liberal-novembro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 30. Bolsonaro facada Juiz de Fora
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, após o atentado a faca em Juiz de Fora, usa o episódio para consolidar narrativa de perseguição política.',
      'Eu fui vítima de um atentado covarde, de um militante de esquerda radicalizado pelo discurso de ódio do PT. Essa é a real face dos que criticam o Brasil. O socialismo mata, sempre matou. Quero agradecer a Deus que me salvou para uma missão maior: libertar o Brasil da esquerda comunista.',
      'Declaração de Jair Bolsonaro em setembro de 2018, após o atentado a faca sofrido em Juiz de Fora (MG) durante ato de campanha. O candidato foi ferido por Adélio Bispo, posteriormente declarado inimputável, e o episódio marcou a reta final da campanha presidencial.',
      'verified', true, '2018-09-10',
      'https://g1.globo.com/politica/eleicoes/2018/noticia/2018/09/10/bolsonaro-atentado-juiz-de-fora.ghtml',
      'news_article',
      'Juiz de Fora', 'Pronunciamento hospital', 'bolsonaro-atentado-juiz-fora-setembro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Lula defesa Lava Jato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lip,
      'Lula chama Moro de farsante e Lava Jato de farsa em primeiro depoimento ao juiz de Curitiba em 2017.',
      'Doutor Moro, o senhor não é juiz, o senhor é membro da acusação. O senhor está montando uma farsa contra mim há três anos. Eu não tenho medo do senhor, não tenho medo de Curitiba, não tenho medo da Lava Jato. Vou enfrentar essa perseguição política até o fim e a verdade vai aparecer.',
      'Depoimento de Lula a Sérgio Moro em 10 de maio de 2017, no caso Guarujá. O ex-presidente confrontou o juiz durante horas em depoimento que durou mais de cinco horas e foi transmitido pela internet, mobilizando multidões em Curitiba.',
      'verified', true, '2017-05-10',
      'https://g1.globo.com/pr/parana/noticia/lula-depoimento-moro-curitiba-2017.ghtml',
      'video',
      'Curitiba', '13ª Vara Federal de Curitiba', 'lula-depoimento-moro-farsante-maio-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 32. Dilma voto impeachment Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff reage à dedicatória de voto de Bolsonaro ao torturador Ustra na sessão do impeachment.',
      'Aquele deputado, ao dedicar seu voto ao torturador que me torturou, tentou me humilhar em rede nacional de televisão. Ele não sabe que me fortaleceu. A violência da ditadura não me calou naquela época e não vai me calar agora. O Brasil precisa se envergonhar de ter parlamentares como esse. É a face mais abjeta do golpe em curso.',
      'Declaração de Dilma Rousseff em coletiva em 18 de abril de 2016, um dia após Bolsonaro dedicar voto pelo impeachment ao coronel Ustra, reconhecido torturador. Dilma havia sido torturada pela equipe comandada por Ustra durante a ditadura militar.',
      'verified', true, '2016-04-18',
      'https://www1.folha.uol.com.br/poder/2016/04/1761937-dilma-reage-bolsonaro-ustra.shtml',
      'news_article',
      'Brasília', 'Coletiva no Palácio do Planalto', 'dilma-reage-bolsonaro-ustra-abril-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 33. FHC apoia impeachment
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fhc,
      'Fernando Henrique Cardoso defende o impeachment de Dilma e descarta caracterização como golpe.',
      'O impeachment não é golpe, é instrumento constitucional. A senhora Dilma Rousseff desrespeitou a lei de responsabilidade fiscal, cometeu crime de responsabilidade e deve ser afastada pelo Congresso Nacional, como determina a Constituição. Chamar o processo de golpe é distorcer a realidade para proteger quem violou as regras.',
      'Artigo de Fernando Henrique Cardoso publicado na Folha de S. Paulo em março de 2016, defendendo a legitimidade do processo de impeachment contra Dilma Rousseff. FHC foi uma das principais vozes tucanas no apoio ao impeachment e posteriormente ao governo Temer.',
      'verified', false, '2016-03-18',
      'https://www1.folha.uol.com.br/fsp/opiniao/fz1803201607.htm',
      'news_article',
      'São Paulo', 'Artigo na Folha de S. Paulo', 'fhc-apoia-impeachment-marco-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 34. Cunha preso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cun,
      'Eduardo Cunha é preso em Brasília em outubro de 2016, poucos meses após presidir o impeachment que abriu caminho para o governo Temer.',
      'Essa prisão é claramente política. Fui o presidente da Câmara que conduziu o impeachment da presidente Dilma, e agora pagam essa conta comigo. O ministro Teori Zavascki está sendo pressionado por setores do STF e da imprensa a me prender. Vou provar minha inocência.',
      'Declaração de Eduardo Cunha pouco antes de ser preso em 19 de outubro de 2016 por ordem de Sérgio Moro, no âmbito da Operação Lava Jato. Cunha seria depois condenado pelo STF e em outras instâncias por corrupção, lavagem de dinheiro e evasão de divisas.',
      'verified', true, '2016-10-19',
      'https://g1.globo.com/politica/operacao-lava-jato/noticia/2016/10/cunha-e-preso-em-brasilia.html',
      'news_article',
      'Brasília', 'Residência em Brasília', 'cunha-preso-outubro-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 35. Bolsonaro deputado licenciado Jouberto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, como deputado, elogia funcionário do Congresso com deficiência em tom pejorativo e ataca políticas de inclusão.',
      'Essa história de cota para deficiente é cilada. Na minha casa tinha um menino com síndrome de Down e ele era feliz cuidando do quintal. Não precisa fingir que é igual. Cada um tem que conhecer seu lugar. PCD não é o mesmo que pessoa normal e essa confusão só faz mal ao próprio deficiente.',
      'Declaração de Jair Bolsonaro em entrevista em 2017, durante debate sobre políticas de inclusão de pessoas com deficiência. O então deputado acumulou declarações ofensivas a grupos minoritários ao longo de sete mandatos no Congresso.',
      'verified', false, '2017-07-20',
      'https://www1.folha.uol.com.br/poder/2017/07/bolsonaro-declaracao-deficiente.shtml',
      'news_article',
      'Rio de Janeiro', 'Entrevista à imprensa', 'bolsonaro-pcd-deficiente-cota-julho-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, false FROM ins;

  -- 36. Temer reforma trabalhista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Michel Temer sanciona reforma trabalhista em 2017 e defende a flexibilização das relações de trabalho como caminho para o emprego.',
      'A reforma trabalhista representa a modernização das relações de trabalho no Brasil. A CLT dos anos 40 não cabe mais num mundo globalizado. Ao permitir a negociação direta entre patrões e empregados, vamos gerar milhões de empregos, formalizar trabalhadores hoje à margem e modernizar nossa economia. Esta é uma vitória do bom senso.',
      'Pronunciamento de Michel Temer em 13 de julho de 2017, ao sancionar a Lei 13.467/2017 que alterou mais de cem pontos da CLT. A reforma foi aprovada sob protestos de sindicatos e é considerada um dos principais legados do governo Temer.',
      'verified', false, '2017-07-13',
      'https://g1.globo.com/politica/noticia/temer-sanciona-reforma-trabalhista.ghtml',
      'news_article',
      'Brasília', 'Sanção no Palácio do Planalto', 'temer-sanciona-reforma-trabalhista-julho-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 37. Roberto Jefferson solto Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jef,
      'Roberto Jefferson, após cumprir pena do mensalão, reconstrói influência política liderando o PTB em aliança com Bolsonaro.',
      'Fui condenado por crime que não cometi, paguei o preço de ter denunciado o PT. Mas a história me deu razão. O mensalão foi só o começo, depois veio o petrolão, o mensalão tucano, tudo o que eu disse foi comprovado. Agora estou aqui para ajudar a reconstruir o Brasil que a esquerda destruiu.',
      'Declaração de Roberto Jefferson em entrevista em 2018, após ser eleito presidente nacional do PTB e se aproximar de Jair Bolsonaro. Anos depois, Jefferson seria novamente preso, desta vez por ataques às instituições democráticas durante o governo Bolsonaro.',
      'verified', false, '2018-05-25',
      'https://www1.folha.uol.com.br/poder/2018/05/jefferson-ptb-bolsonaro-apoio.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S. Paulo', 'jefferson-reconstrucao-bolsonaro-maio-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 38. Dilma suspensa impeachment
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff, após ser afastada definitivamente pelo Senado, faz discurso histórico sobre golpe e luta pela democracia.',
      'Saio daqui com a cabeça erguida porque sou inocente. Não cometi crime de responsabilidade. Vou recorrer de todos os pontos desse processo. Retornarei. E quando retornar, o golpe terá fracassado. Eles poderão me cassar mas não poderão cassar o povo brasileiro. Na hora certa o povo falará.',
      'Discurso de Dilma Rousseff em 31 de agosto de 2016, após o Senado aprovar seu impeachment por 61 votos a 20. A ex-presidenta manteve os direitos políticos pela Mesa do Senado, em manobra que lhe permitiria disputar eleições futuras.',
      'verified', true, '2016-08-31',
      'https://g1.globo.com/politica/processo-de-impeachment-de-dilma/noticia/2016/08/dilma-discurso-pos-impeachment.html',
      'news_article',
      'Brasília', 'Pronunciamento no Palácio da Alvorada', 'dilma-discurso-pos-impeachment-agosto-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Silas Câmara evangélica 2016
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara defende voto da bancada evangélica pelo impeachment de Dilma citando Deus e família.',
      'Em nome de Deus, em nome do povo evangélico do Brasil, em nome das famílias que lutam para viver honradamente neste país, meu voto é sim pelo impeachment da senhora Dilma Rousseff. O PT tentou destruir a família brasileira com ideologia de gênero e agenda anticristã. A bancada evangélica não vai se calar.',
      'Voto de Silas Câmara na sessão do impeachment de Dilma Rousseff na Câmara dos Deputados em 17 de abril de 2016. A bancada evangélica foi determinante para aprovar o impeachment, e Silas Câmara é uma das vozes mais ativas dessa articulação no Congresso.',
      'verified', false, '2016-04-17',
      'https://www.camara.leg.br/noticias/483841-camara-autoriza-instauracao-de-processo-de-impeachment-de-dilma-com-367-votos-a-favor-e-137-contra/',
      'parliamentary_speech',
      'Brasília', 'Plenário da Câmara dos Deputados — votação do impeachment', 'silas-camara-voto-impeachment-abril-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 40. Romário cpi futebol
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário, senador, investiga CBF em CPI e denuncia esquema de propinas no futebol brasileiro envolvendo Ricardo Teixeira.',
      'A CBF é uma das instituições mais corruptas do mundo. Ricardo Teixeira, Marco Polo del Nero, José Maria Marin, todos estão metidos em esquemas de propina que prejudicaram o futebol brasileiro por décadas. A CPI do Futebol vai fazer o que nenhuma instituição fez: expor a roubalheira e punir os culpados.',
      'Declaração de Romário como relator da CPI do Futebol no Senado em 2015. O ex-jogador se tornou senador em 2014 pelo PSB e transformou a CPI em um dos principais fóruns de denúncia contra a CBF, incluindo o escândalo que levou à prisão de cartolas pela FIFAgate.',
      'verified', false, '2015-11-10',
      'https://www12.senado.leg.br/noticias/materias/2015/11/10/romario-cpi-futebol-denuncias',
      'news_article',
      'Brasília', 'CPI do Futebol — Senado Federal', 'romario-cpi-futebol-cbf-novembro-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 41. Marta Suplicy sai PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marta Suplicy deixa o PT em 2015 denunciando aparelhamento do partido e defende o impeachment de Dilma meses depois.',
      'Saio do PT com tristeza, mas com a consciência tranquila. O partido que ajudei a construir se transformou em uma máquina movida por interesses de um pequeno grupo. A presidente Dilma destruiu a economia, a governabilidade e a confiança no projeto petista. Chegou a hora de enfrentar isso com clareza, sem corporativismo.',
      'Carta pública de Marta Suplicy ao deixar o PT em 31 de março de 2015, após 30 anos no partido que ajudou a fundar. A senadora se filiaria ao PMDB e votaria pelo impeachment de Dilma em 2016, movimento criticado pela antiga base petista.',
      'verified', false, '2015-03-31',
      'https://www1.folha.uol.com.br/poder/2015/03/1608877-marta-suplicy-deixa-pt.shtml',
      'official_document',
      'Brasília', 'Carta pública de desfiliação', 'marta-suplicy-deixa-pt-marco-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 42. Lula carta povo 2017
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lip,
      'Lula faz discurso histórico em São Bernardo e promete voltar ao poder mesmo diante das condenações da Lava Jato.',
      'Eu estou aqui para dizer que não há processo no Brasil que me impeça de ser candidato. Não há força na face da Terra que me impeça de andar com esse povo. Se eu não puder andar, vou caminhar. Se eu não puder caminhar, vou de muleta. Se não puder de muleta, alguém vai me carregar. E eu vou ser candidato em 2018.',
      'Discurso de Lula no Sindicato dos Metalúrgicos do ABC em agosto de 2017, pouco após a primeira condenação por Sérgio Moro. O ex-presidente promoveu uma "Caravana Lula pelo Brasil" para manter viva sua candidatura, apesar do cenário judicial desfavorável.',
      'verified', false, '2017-08-24',
      'https://www1.folha.uol.com.br/poder/2017/08/lula-discurso-abc-candidato.shtml',
      'news_article',
      'São Bernardo do Campo', 'Sindicato dos Metalúrgicos do ABC', 'lula-discurso-abc-candidato-agosto-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 43. Bolsonaro contra índios
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro promete acabar com demarcações indígenas se eleito presidente, afirmando que povos originários querem petróleo.',
      'Se eu assumir, não tem mais demarcação de terra indígena. Índio não fala nossa língua, não tem dinheiro, não tem cultura, não tem nada. Como consegue ter 13% do território nacional? Vamos parar essa bobagem. O que o índio quer é o que nós queremos: integração na sociedade brasileira.',
      'Declaração de Jair Bolsonaro em entrevista em dezembro de 2018, antes de assumir a presidência. As falas contra demarcações indígenas foram recorrentes ao longo de sua carreira e se materializariam em políticas do Ministério do Meio Ambiente sob Ricardo Salles.',
      'verified', true, '2018-12-03',
      'https://g1.globo.com/politica/noticia/2018/12/03/bolsonaro-demarcacao-indigena.ghtml',
      'video',
      'Rio de Janeiro', 'Entrevista coletiva', 'bolsonaro-contra-demarcacao-indigena-dezembro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 44. Eduardo escolheu distrito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro é eleito deputado federal mais votado do Brasil em 2018 e promete combate ao PT na Câmara.',
      'Fui eleito o deputado federal mais votado da história do Brasil, com mais de 1,8 milhão de votos em São Paulo. Isso é um mandato claro do povo contra o PT e contra a esquerda. Minha missão no Congresso será garantir que o governo do meu pai execute o que prometeu, enfrentando o sistema corrompido de Brasília.',
      'Declaração de Eduardo Bolsonaro em outubro de 2018, após ser eleito deputado federal com votação recorde. O filho do presidente eleito tornou-se peça-chave na articulação internacional do bolsonarismo com a direita americana e europeia.',
      'verified', false, '2018-10-09',
      'https://g1.globo.com/sp/sao-paulo/noticia/2018/10/eduardo-bolsonaro-deputado-mais-votado.ghtml',
      'news_article',
      'São Paulo', 'Coletiva pós-eleição', 'eduardo-bolsonaro-mais-votado-outubro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 45. Serra campanha SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ser,
      'José Serra é denunciado por Odebrecht por receber mais de 23 milhões em propina e nega envolvimento.',
      'Nunca recebi um centavo sequer de propina da Odebrecht ou de qualquer outra construtora. Essas delações são instrumento desses bandidos para reduzir suas próprias penas, atingindo quem mais combateu a corrupção nos governos do PT. Vou provar minha inocência em todas as instâncias. Não me curvo a essas acusações levianas.',
      'Declaração de José Serra em abril de 2017, após ser denunciado por executivos da Odebrecht em delações premiadas no âmbito da Operação Lava Jato. O ex-ministro e ex-governador seria alvo de várias investigações nos anos seguintes, sem condenação definitiva.',
      'verified', false, '2017-04-13',
      'https://www1.folha.uol.com.br/poder/2017/04/serra-denuncia-odebrecht.shtml',
      'news_article',
      'São Paulo', 'Coletiva de imprensa', 'serra-nega-propina-odebrecht-abril-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 46. Jaques Wagner ministro Dilma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jaq,
      'Jaques Wagner, como ministro da Casa Civil de Dilma, denuncia articulação golpista de Temer e do PMDB antes do impeachment.',
      'O que estamos vivendo é uma articulação golpista coordenada pelo vice-presidente Michel Temer e pelo presidente da Câmara Eduardo Cunha. Eles querem derrubar uma presidenta eleita por 54 milhões de votos sem que ela tenha cometido crime. É uma ruptura democrática que a história não vai perdoar.',
      'Declaração de Jaques Wagner em abril de 2016, como ministro-chefe da Casa Civil, dias antes da aprovação do impeachment na Câmara dos Deputados. Wagner foi o principal articulador político de Dilma na fase final do governo petista.',
      'verified', false, '2016-04-12',
      'https://www1.folha.uol.com.br/poder/2016/04/wagner-articulacao-golpista-temer.shtml',
      'news_article',
      'Brasília', 'Entrevista coletiva no Palácio do Planalto', 'wagner-articulacao-golpista-temer-abril-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, false FROM ins;

  -- 47. Bolsonaro anti gay escola sem partido
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende projeto Escola Sem Partido e ataca supostas "ideologia de gênero" e "kit gay" como ameaças à família.',
      'O PT quer criar o homossexualismo nas crianças. Querem usar as escolas para distribuir o kit gay, para sexualizar nossas crianças precocemente, para destruir a família tradicional brasileira. A Escola Sem Partido é a resposta para esse projeto pedófilo da esquerda. Precisamos proteger nossas crianças.',
      'Declaração de Jair Bolsonaro em comício em agosto de 2018, durante a campanha presidencial. O candidato distorceu o conteúdo do programa "Escola Sem Homofobia", rebatizado como "kit gay" pelo próprio Bolsonaro, e transformou fake news em pauta de campanha.',
      'verified', true, '2018-08-25',
      'https://www1.folha.uol.com.br/poder/2018/08/bolsonaro-kit-gay-escola-sem-partido.shtml',
      'video',
      'São Paulo', 'Comício da campanha presidencial', 'bolsonaro-kit-gay-escola-sem-partido-agosto-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 48. Cunha renuncia presidência Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cun,
      'Eduardo Cunha renuncia à presidência da Câmara antes de ser cassado pelo plenário, após STF determinar seu afastamento.',
      'Deixo a presidência da Câmara dos Deputados para me dedicar à minha defesa. Renuncio ao cargo, mas não ao mandato. Não fui ouvido, fui condenado previamente pelas autoridades e pela imprensa. Vou provar minha inocência e continuar representando o povo que me elegeu três vezes seguidas com a maior votação do Rio de Janeiro.',
      'Pronunciamento de Eduardo Cunha em 7 de julho de 2016, anunciando sua renúncia à presidência da Câmara dos Deputados após o STF determinar seu afastamento no mês de maio. Cunha seria cassado em setembro do mesmo ano e preso em outubro.',
      'verified', false, '2016-07-07',
      'https://g1.globo.com/politica/noticia/2016/07/cunha-renuncia-presidencia-camara.html',
      'news_article',
      'Brasília', 'Pronunciamento na Câmara dos Deputados', 'cunha-renuncia-presidencia-camara-julho-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 49. Sarney apoia Temer
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sar,
      'José Sarney, patriarca do PMDB, endossa governo Temer e defende as reformas liberais pós-impeachment.',
      'O governo Michel Temer representa a chance histórica de colocar o Brasil de volta nos trilhos. As reformas que estão em curso, da Previdência, trabalhista, do teto de gastos, são necessárias há 30 anos e nenhum governo teve coragem de fazer. O presidente Temer está fazendo o que o país precisa, mesmo impopular.',
      'Declaração de José Sarney em entrevista ao Valor Econômico em dezembro de 2016, apoiando o governo Michel Temer após o impeachment de Dilma. O ex-presidente e patriarca do PMDB articulou importantes apoios para a governabilidade do aliado.',
      'verified', false, '2016-12-18',
      'https://valor.globo.com/politica/noticia/2016/12/18/sarney-apoia-temer-reformas.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'sarney-apoia-temer-reformas-dezembro-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 50. Paulo Maluf preso 2017
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mal,
      'Paulo Maluf é preso em dezembro de 2017 após ter mandato cassado pelo STF por condenação em caso de desvios na prefeitura de SP.',
      'Sofro uma condenação injusta baseada em provas frágeis e em testemunhos comprados. Aos 86 anos, me vejo obrigado a cumprir pena por fatos que nunca foram provados adequadamente. Vou continuar lutando pela minha inocência, pela reabilitação do meu nome e pelo legado político que construí junto ao povo paulistano.',
      'Declaração de Paulo Maluf em 20 de dezembro de 2017, dia em que foi preso após o STF decretar sua prisão por condenação em ação penal sobre desvio de recursos de obras na prefeitura de São Paulo. Maluf cumpriria parte da pena em regime domiciliar por problemas de saúde.',
      'verified', true, '2017-12-20',
      'https://g1.globo.com/politica/noticia/paulo-maluf-e-preso-em-sao-paulo.ghtml',
      'news_article',
      'São Paulo', 'Prisão — residência em São Paulo', 'maluf-preso-dezembro-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

END $$;
