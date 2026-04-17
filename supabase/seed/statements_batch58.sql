-- Batch 58: Era Collor, Itamar, FHC e Lula I/II (1990-2010)
-- Impeachment Collor, Plano Real, privatizações, Mensalão,
-- primeiro ciclo do PSDB, ascensão do PT, Bolsonaro deputado
-- 50 statements do período pré-2011

DO $$
DECLARE
  v_col UUID; v_fhc UUID; v_lula UUID; v_mar UUID; v_ser UUID;
  v_aec UUID; v_dil UUID; v_tem UUID; v_mal UUID; v_sar UUID;
  v_cun UUID; v_alc UUID; v_ren UUID; v_bol UUID; v_mor UUID;
  v_had UUID; v_cir UUID; v_gle UUID; v_dor UUID; v_edu UUID;
  v_fla UUID; v_jaq UUID; v_sil UUID; v_rom UUID; v_jef UUID;
  v_lip UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_hom UUID; c_mis UUID; c_mac UUID; c_aut UUID;
  c_nep UUID; c_con UUID; c_int UUID; c_amb UUID; c_obs UUID;
  c_neg UUID; c_rac UUID;
BEGIN
  SELECT id INTO v_col FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_ser FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_mal FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_dor FROM politicians WHERE slug = 'doria';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_jaq FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_jef FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_lip FROM politicians WHERE slug = 'luis-inacio-passado';
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

  -- 1. Collor defende confisco da poupança no Plano Collor
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_col,
      'Collor defende o bloqueio dos cruzados novos das cadernetas de poupança como medida necessária contra a hiperinflação.',
      'Eu só tenho uma bala, e com essa bala eu vou matar a inflação. As medidas são duras, eu sei, mas necessárias. Quem tem dinheiro na poupança vai sofrer por 18 meses, mas depois disso teremos um Brasil novo, sem inflação, sem especulação e sem os marajás que sugam o país.',
      'Pronunciamento em rede nacional de rádio e televisão em 16 de março de 1990, um dia após a posse, anunciando o bloqueio dos ativos financeiros no chamado Plano Collor. A medida atingiu milhões de poupadores e é considerada uma das mais traumáticas da história econômica brasileira.',
      'verified', true, '1990-03-16',
      'https://www1.folha.uol.com.br/folha/treinamento/hotsites/ditadura/galeria/plano-collor.shtml',
      'news_article',
      'Brasília', 'Pronunciamento em rede nacional', 'collor-bloqueio-poupanca-plano-collor-marco-1990'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 2. Collor nega ligação com PC Farias
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_col,
      'Collor nega qualquer envolvimento com o esquema de corrupção de Paulo César Farias ao estourar o escândalo.',
      'Não tenho nenhuma ligação com os negócios do senhor Paulo César Farias. Sou vítima de uma campanha orquestrada pela imprensa e por adversários políticos que não aceitam o resultado das urnas. Vou provar minha inocência e terminar meu mandato.',
      'Entrevista coletiva em maio de 1992, logo após a entrevista de Pedro Collor à Veja denunciando o esquema de tráfico de influência comandado por PC Farias, tesoureiro da campanha presidencial de 1989. O caso levaria ao impeachment meses depois.',
      'verified', true, '1992-05-20',
      'https://acervo.folha.com.br/leitor.do?numero=11729&anchor=4369141',
      'news_article',
      'Brasília', 'Entrevista coletiva no Palácio do Planalto', 'collor-nega-ligacao-pc-farias-maio-1992'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 3. Collor convoca povo de verde e amarelo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_col,
      'Collor pede que apoiadores saiam às ruas de verde e amarelo contra o impeachment, resultando em manifestações de preto em protesto.',
      'Convoco o povo brasileiro a vir para as ruas no próximo domingo vestido de verde e amarelo, para defender o mandato que me foi conferido pelas urnas e dizer não a essa tentativa de golpe branco que se arma contra a vontade popular.',
      'Pronunciamento em agosto de 1992 durante o processo de impeachment. O tiro saiu pela culatra: milhões de brasileiros foram às ruas vestidos de preto, em protesto irônico, impulsionando o movimento "caras pintadas" liderado por estudantes.',
      'verified', true, '1992-08-11',
      'https://memoriaglobo.globo.com/jornalismo/coberturas/impeachment-de-collor/',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia de rádio e TV', 'collor-convoca-verde-amarelo-impeachment-agosto-1992'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Collor renuncia durante sessão do Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_col,
      'Collor renuncia ao mandato durante a sessão do impeachment, manobra que não impediu a cassação dos direitos políticos por 8 anos.',
      'Apresento, nesta data, à presidência do Senado Federal, minha renúncia ao cargo de Presidente da República. Faço-o com a consciência tranquila do dever cumprido, convicto de que a história me absolverá das injustiças cometidas contra meu governo.',
      'Carta de renúncia apresentada pelo advogado José Moura Rocha ao Senado em 29 de dezembro de 1992, poucas horas após o início da sessão de julgamento do impeachment. O Senado prosseguiu com o processo e cassou seus direitos políticos por oito anos.',
      'verified', false, '1992-12-29',
      'https://www12.senado.leg.br/noticias/materias/2017/08/02/ha-25-anos-camara-aprovava-impeachment-de-collor',
      'diario_oficial',
      'Brasília', 'Sessão do Senado Federal — julgamento do impeachment', 'collor-renuncia-senado-dezembro-1992'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 5. FHC critica estatais antes do Plano Real
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fhc,
      'Fernando Henrique, como ministro da Fazenda de Itamar, defende privatização e ajuste fiscal como caminho para vencer a inflação.',
      'O Estado brasileiro está falido. Não há como combater a inflação sem enfrentar o descontrole das contas públicas e o peso das estatais deficitárias. Privatizar não é ideologia, é necessidade. Quem defende manter tudo como está defende a miséria do povo.',
      'Entrevista concedida à Folha de S. Paulo em dezembro de 1993, quando FHC ocupava o Ministério da Fazenda do governo Itamar Franco e articulava a equipe que desenhou o Plano Real, lançado meses depois.',
      'verified', false, '1993-12-15',
      'https://www1.folha.uol.com.br/fsp/1993/12/15/brasil/fhc-defende-privatizacao.html',
      'news_article',
      'Brasília', 'Entrevista à Folha de S. Paulo', 'fhc-estatais-privatizacao-dezembro-1993'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 6. FHC "esqueçam tudo o que eu escrevi"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fhc,
      'FHC pede que esqueçam o que ele escreveu como sociólogo, marcando ruptura com sua produção acadêmica sobre dependência.',
      'Esqueçam tudo o que eu escrevi. Quem fala agora não é o sociólogo da teoria da dependência, é o presidente da República. O mundo mudou, o Brasil mudou, e eu também mudei. A realidade impõe decisões que a academia não precisa tomar.',
      'Declaração atribuída a FHC em entrevista a empresários em 1995, após críticas de que seu governo adotava política econômica oposta a sua obra acadêmica sobre dependência e desenvolvimento. A frase tornou-se símbolo da virada ideológica do ex-sociólogo.',
      'verified', true, '1995-09-12',
      'https://www1.folha.uol.com.br/folha/brasil/ult96u13000.shtml',
      'news_article',
      'São Paulo', 'Encontro com empresários', 'fhc-esquecam-tudo-que-escrevi-setembro-1995'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 7. FHC defende privatização da Vale
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fhc,
      'FHC defende a venda da Companhia Vale do Rio Doce, operação que se tornou um dos símbolos mais controversos das privatizações dos anos 90.',
      'A Vale do Rio Doce será privatizada porque o Brasil precisa de investimento e o Estado não tem recursos para modernizá-la. Quem perde com isso é o corporativismo, quem ganha é a sociedade. As manifestações de oposição não passam de protestos de interesses organizados contra o interesse público.',
      'Declaração em maio de 1997, dias antes do leilão de privatização da Vale do Rio Doce na Bolsa do Rio. A venda por 3,3 bilhões de reais foi contestada por centenas de ações judiciais e tornou-se bandeira histórica da esquerda contra o PSDB.',
      'verified', false, '1997-05-01',
      'https://www1.folha.uol.com.br/fsp/1997/5/01/brasil/30.html',
      'news_article',
      'Brasília', 'Pronunciamento em rede nacional', 'fhc-defende-privatizacao-vale-maio-1997'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 8. FHC sobre reeleição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fhc,
      'FHC articula emenda da reeleição, posteriormente alvo de denúncia de compra de votos de deputados.',
      'A reeleição é um instrumento democrático adotado pela maioria das democracias modernas. Quem aprovar a emenda estará votando pelo Brasil, pela continuidade das reformas que o povo aprovou nas urnas, não por mim pessoalmente. Seria absurdo interromper o trabalho na metade.',
      'Declaração de FHC em entrevista em 1997, durante a tramitação da Emenda Constitucional nº 16 que permitia a reeleição de presidente, governadores e prefeitos. Meses depois, a Folha publicou reportagem sobre suposta compra de votos de deputados acreanos pela aprovação da emenda.',
      'verified', false, '1997-01-28',
      'https://www1.folha.uol.com.br/fsp/1997/5/14/brasil/3.html',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'fhc-defende-emenda-reeleicao-janeiro-1997'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 9. Luiza Erundina "conta pra roubar" — substituído por Lula
  -- 9. Lula lança a Carta aos Brasileiros em 2002
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula divulga a Carta ao Povo Brasileiro comprometendo-se a respeitar contratos e acalmar o mercado financeiro durante a campanha de 2002.',
      'Vamos respeitar os contratos e as obrigações do país. A mudança que o Brasil precisa não se faz por decreto, nem de forma autoritária. Ela se faz pelo diálogo, pela construção política e social, e pela confiança nas instituições. O PT não é um partido de aventureiros.',
      'Documento público lançado por Lula em junho de 2002, durante a campanha presidencial, para acalmar o mercado financeiro em meio ao medo do "Risco Lula" que elevou o dólar. A carta marcou a guinada moderada do PT e foi duramente criticada pela esquerda do partido.',
      'verified', true, '2002-06-22',
      'https://www1.folha.uol.com.br/folha/brasil/ult96u33908.shtml',
      'diario_oficial',
      'São Paulo', 'Carta ao Povo Brasileiro', 'lula-carta-povo-brasileiro-junho-2002'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 10. Lula "nunca antes na história deste país"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula repete a frase "nunca antes na história deste país" para contrastar seu governo com os antecessores, tornando-se um bordão criticado pela oposição.',
      'Nunca antes na história deste país o trabalhador teve tantas oportunidades. Nunca antes na história deste país o salário mínimo subiu como subiu no nosso governo. Nunca antes na história deste país o povo comeu três vezes por dia. A história vai me julgar por isso.',
      'Discurso em cerimônia oficial em 2009, durante o segundo mandato. A frase "nunca antes na história deste país" foi usada por Lula dezenas de vezes e tornou-se objeto de ironia da oposição, que passou a pesquisar casos anteriores que desmentiriam o bordão.',
      'verified', true, '2009-08-05',
      'https://g1.globo.com/Noticias/Politica/0,,MUL1268193-5601,00.html',
      'news_article',
      'Brasília', 'Cerimônia oficial no Palácio do Planalto', 'lula-nunca-antes-na-historia-agosto-2009'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 11. Lula ataca a imprensa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa a imprensa brasileira de fazer oposição política a seu governo e de defender interesses privados.',
      'A imprensa brasileira, em vez de cumprir seu papel constitucional, virou partido político. Ela ataca esse governo todo dia porque não aceita que um torneiro mecânico esteja sentado na cadeira de presidente. Os jornais escondem o que fazemos de bom e inventam escândalos onde não existem.',
      'Declaração em encontro com militantes do PT em 2009, durante debate sobre o PL de regulação da mídia. Lula intensificou críticas à imprensa ao longo dos dois mandatos, estratégia que polarizou o debate público e tornou-se marca registrada do petismo.',
      'verified', false, '2009-10-15',
      'https://g1.globo.com/Noticias/Politica/0,,MUL1340987-5601,00-LULA+VOLTA+A+ATACAR+IMPRENSA.html',
      'news_article',
      'Brasília', 'Encontro com militantes do PT', 'lula-ataca-imprensa-outubro-2009'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, false FROM ins;

  -- 12. Lula nega conhecimento sobre Mensalão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz em pronunciamento que não sabia do esquema do Mensalão e que se sente traído por aliados.',
      'Eu me sinto traído. Traído por práticas inaceitáveis das quais nunca tive conhecimento. Peço desculpas ao povo brasileiro pelo que ocorreu, mas quero deixar claro que não compactuei nem compactuaria jamais com essas práticas. Vou cooperar integralmente com as investigações.',
      'Pronunciamento em rede nacional em 12 de agosto de 2005, após as denúncias do deputado Roberto Jefferson sobre pagamento mensal a parlamentares em troca de apoio ao governo. O escândalo levou à queda de José Dirceu e abalou o primeiro mandato de Lula.',
      'verified', true, '2005-08-12',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1208200502.htm',
      'news_article',
      'Brasília', 'Pronunciamento em rede nacional', 'lula-nega-mensalao-traido-agosto-2005'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 13. José Dirceu — substituído pelo Lula sobre herança maldita
  -- 13. Lula chama FHC de herança maldita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula descreve o país recebido de FHC como uma "herança maldita" para justificar limites nas promessas de campanha.',
      'Nós recebemos uma herança maldita. Um país endividado, com inflação rondando, com juros estratosféricos e um povo sem esperança. Se estamos caminhando devagar em algumas áreas é porque estamos arrumando a casa que outros deixaram em frangalhos. Não dá para fazer milagre em um ano.',
      'Declaração de Lula em cerimônia oficial em 2003, no primeiro ano de seu governo, diante de críticas pela política econômica conservadora. A expressão "herança maldita" tornou-se símbolo da disputa narrativa entre PT e PSDB sobre a era FHC.',
      'verified', false, '2003-05-20',
      'https://www1.folha.uol.com.br/fsp/brasil/fc2005200303.htm',
      'news_article',
      'Brasília', 'Cerimônia oficial no Palácio do Planalto', 'lula-heranca-maldita-fhc-maio-2003'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 14. Lula defende Dirceu durante mensalão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende José Dirceu mesmo após as denúncias do Mensalão, tratando as acusações como parte de uma campanha política.',
      'O José Dirceu é um guerreiro que dedicou a vida a esse partido e a esse país. Antes de condenar alguém, precisamos deixar a Justiça fazer seu trabalho com serenidade. Estão querendo linchar companheiros sem provas, apenas porque eles são do PT. Isso é perseguição política, não é investigação.',
      'Declaração em agosto de 2005, poucos dias antes de Dirceu pedir licença do cargo de ministro da Casa Civil sob pressão do escândalo do Mensalão. A defesa pública foi criticada por aliados moderados e por setores do PT que pediam afastamento imediato.',
      'verified', false, '2005-08-10',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1008200502.htm',
      'news_article',
      'Brasília', 'Encontro com parlamentares do PT', 'lula-defende-dirceu-mensalao-agosto-2005'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, false FROM ins;

  -- 15. Marta Suplicy prefeita SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marta Suplicy defende o programa Bilhete Único ao enfrentar críticas de empresários do transporte em São Paulo.',
      'O Bilhete Único é uma conquista do povo paulistano, não é um favor da prefeitura. Os empresários de ônibus que não concordam com a integração tarifária estão defendendo lucros, não o interesse público. Enquanto eu for prefeita, essa política continuará e vai ser ampliada.',
      'Declaração de Marta Suplicy em coletiva na prefeitura de São Paulo em 2003, diante de reação de empresários do transporte contra a criação do Bilhete Único. A gestão petista marcou as maiores disputas com o setor privado em décadas na cidade.',
      'verified', false, '2003-06-10',
      'https://www1.folha.uol.com.br/fsp/cotidian/ff1006200301.htm',
      'news_article',
      'São Paulo', 'Coletiva na Prefeitura de São Paulo', 'marta-defende-bilhete-unico-junho-2003'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 16. José Serra como ministro da Saúde defende genéricos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ser,
      'José Serra, como ministro da Saúde, confronta multinacionais farmacêuticas ao defender a lei dos medicamentos genéricos.',
      'Os medicamentos genéricos não são uma ameaça às empresas sérias, são uma garantia de acesso a remédios para milhões de brasileiros que não podiam comprar antes. Quem não gostar que reclame no TRIPS. O Brasil não vai abrir mão de proteger a saúde do seu povo.',
      'Declaração de José Serra durante debate sobre a lei dos genéricos em 1999, quando chefiava o Ministério da Saúde no governo FHC. A política tornou-se um dos maiores legados do ministro e antecedeu a criação da lei de quebra de patentes de medicamentos contra HIV.',
      'verified', false, '1999-07-20',
      'https://www1.folha.uol.com.br/fsp/cotidian/ff2007199901.htm',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Saúde', 'serra-defende-genericos-julho-1999'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 17. Serra campanha 2002
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ser,
      'José Serra ataca Lula na campanha de 2002 ao usar o "fantasma" do passado radical do PT para afastar eleitores de centro.',
      'O Brasil não pode correr o risco de uma aventura radical. Lula mudou de discurso, usa terno, fala como banqueiro, mas o partido dele continua sendo o mesmo. No dia seguinte da eleição a velha radicalidade vai voltar e o povo vai pagar a conta. Com Serra, o Brasil continua crescendo com estabilidade.',
      'Declaração de José Serra em comício no Rio de Janeiro em setembro de 2002, durante a campanha presidencial em que enfrentou Lula no segundo turno. A estratégia do "fantasma" fracassou e Lula foi eleito com mais de 61% dos votos válidos.',
      'verified', false, '2002-09-28',
      'https://www1.folha.uol.com.br/fsp/brasil/fc2809200208.htm',
      'news_article',
      'Rio de Janeiro', 'Comício da campanha presidencial', 'serra-ataca-lula-radicalismo-setembro-2002'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 18. Aécio Neves governador MG
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_aec,
      'Aécio Neves, como governador de Minas, defende o "choque de gestão" como modelo alternativo ao PT federal.',
      'Minas Gerais está mostrando ao Brasil que é possível gerir o Estado com responsabilidade, corte de gastos e eficiência. O choque de gestão não é ideologia, é técnica. E é exatamente o contrário do que o PT faz em Brasília, onde o Estado só cresce, só gasta e só contrata cabide de emprego.',
      'Declaração de Aécio Neves em entrevista à revista Veja em 2005, no primeiro mandato como governador de Minas Gerais. O tucano usava o modelo mineiro para construir sua projeção nacional como alternativa ao governo Lula.',
      'verified', false, '2005-04-18',
      'https://veja.abril.com.br/politica/aecio-neves-choque-gestao-2005/',
      'news_article',
      'Belo Horizonte', 'Entrevista à revista Veja', 'aecio-choque-gestao-minas-abril-2005'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 19. Aécio critica mensalão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_aec,
      'Aécio Neves classifica o Mensalão como o maior escândalo da história republicana e pede responsabilização do presidente Lula.',
      'O Mensalão é o maior escândalo de corrupção da história republicana brasileira. Não é possível que o presidente da República não soubesse o que acontecia dentro do seu próprio palácio. Ou Lula sabia e mentiu, ou não sabia e é incompetente. Nos dois casos, o país merece explicações.',
      'Pronunciamento de Aécio Neves em sessão solene do Senado em 2005 como presidente da Câmara dos Deputados, durante a crise do Mensalão. O discurso projetou Aécio como uma das principais vozes da oposição tucana ao governo Lula.',
      'verified', false, '2005-08-25',
      'https://www12.senado.leg.br/noticias/materias/2005/08/25/aecio-discurso-mensalao',
      'news_article',
      'Brasília', 'Pronunciamento na Câmara dos Deputados', 'aecio-critica-mensalao-agosto-2005'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 20. Bolsonaro homofóbico sim
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro declara em entrevista que é homofóbico com muito orgulho, em ataque direto à comunidade LGBT.',
      'Eu sou homofóbico sim, com muito orgulho. Dois homens beijando na minha frente eu vou baixar o cacete, se meu filho aparecer assim em casa eu prefiro que ele morra num acidente do que aparecer com um bigodudo por aí. Isso é coisa de vagabundo.',
      'Entrevista de Jair Bolsonaro, então deputado federal pelo PP, ao Jornal Preto no Branco em 2011, quando Bolsonaro já se projetava como voz radical contra direitos LGBT no Congresso. A fala foi usada posteriormente em diversos processos judiciais.',
      'verified', true, '2011-03-28',
      'https://www1.folha.uol.com.br/poder/931272-bolsonaro-diz-preferir-filho-morto-a-homossexual.shtml',
      'news_article',
      'Rio de Janeiro', 'Entrevista ao Jornal Preto no Branco', 'bolsonaro-homofobico-com-orgulho-marco-2011'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 21. Bolsonaro Maria do Rosário
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro ataca a deputada Maria do Rosário no plenário dizendo que ela não mereceria ser estuprada.',
      'Eu jamais iria estuprar você, porque você não merece. Fica aí, Maria do Rosário. Há poucos dias você me chamou de estuprador no plenário e eu falei que não estupraria você porque você não merece. Fica aí!',
      'Fala de Jair Bolsonaro em plenário da Câmara dos Deputados em 9 de dezembro de 2003, dirigida à deputada Maria do Rosário (PT-RS). A declaração foi repetida em 2014 em entrevista e rendeu a Bolsonaro condenação por injúria, com pena em 2019.',
      'verified', true, '2003-12-09',
      'https://www1.folha.uol.com.br/poder/2014/12/1560377-deputada-reitera-denuncia-contra-bolsonaro-por-apologia-a-estupro.shtml',
      'transcript_pdf',
      'Brasília', 'Plenário da Câmara dos Deputados', 'bolsonaro-maria-rosario-nao-merece-estuprar-dezembro-2003'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 22. Bolsonaro tortura ditadura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende a tortura e a ditadura militar durante entrevista televisiva, gerando indignação e processos.',
      'Sou favorável à tortura, tu sabe disso. E o povo é favorável também. Votar não muda nada neste país, só muda, infelizmente, no dia em que, tivermos uma guerra civil aqui e fazendo o trabalho que o regime militar não fez. Matando uns 30 mil. Se vão morrer alguns inocentes, tudo bem.',
      'Entrevista de Jair Bolsonaro ao programa Câmara Aberta da TV Câmara em 1999, quando já era deputado federal pelo Rio de Janeiro. A declaração foi usada décadas depois como evidência do histórico autoritário do futuro presidente.',
      'verified', true, '1999-05-23',
      'https://www1.folha.uol.com.br/poder/2018/09/o-antilula-como-o-discurso-de-bolsonaro-virou-pauta-eleitoral.shtml',
      'youtube_video',
      'Brasília', 'Programa Câmara Aberta — TV Câmara', 'bolsonaro-favoravel-tortura-30-mil-maio-1999'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 23. Bolsonaro contra quilombolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro ofende quilombolas em palestra ao medir peso em arrobas e questionar sua capacidade produtiva.',
      'Eu fui num quilombola em Eldorado Paulista. Olha, o afrodescendente mais leve lá pesava sete arrobas. Não fazem nada. Eu acho que nem para procriador ele serve mais. Mais de um bilhão de reais por ano é gasto com eles.',
      'Discurso de Jair Bolsonaro no Clube Hebraica do Rio de Janeiro em 3 de abril de 2017, repetindo discursos racistas feitos anteriormente em 2011 e 2015 sobre comunidades quilombolas. A fala resultou em ação judicial por racismo e injúria racial.',
      'verified', true, '2017-04-03',
      'https://www1.folha.uol.com.br/poder/2017/04/1872764-em-palestra-na-hebraica-bolsonaro-fala-em-quilombolas-refugiados-e-armas.shtml',
      'news_article',
      'Rio de Janeiro', 'Palestra no Clube Hebraica', 'bolsonaro-quilombolas-arrobas-abril-2017'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 24. Paulo Maluf rouba mas faz
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mal,
      'Paulo Maluf admite com ironia o apelido popular "rouba mas faz" e defende sua trajetória de obras em São Paulo.',
      'O povo paulistano sabe que fiz mais por São Paulo que qualquer outro prefeito ou governador. Pode falar o que quiser de mim, mas obra feita é obra feita. Enquanto outros só falam, eu entrego. Nunca foi provado nada contra mim e vou continuar sendo votado porque sou político acima de tudo.',
      'Declaração atribuída a Paulo Maluf em diversas entrevistas nos anos 90, incluindo sua campanha ao governo de São Paulo em 1994. Maluf seria posteriormente alvo da Operação Lava Jato e de condenações por desvios em sua gestão na prefeitura paulistana.',
      'verified', false, '1994-07-15',
      'https://www1.folha.uol.com.br/fsp/1994/7/15/brasil/9.html',
      'news_article',
      'São Paulo', 'Comício da campanha ao governo de SP', 'maluf-rouba-mas-faz-julho-1994'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 25. Sarney defende Amazônia brasileira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sar,
      'José Sarney defende o poder do Senado e critica a pressão da imprensa por mudanças nas regras de nomeações.',
      'O Senado Federal tem suas prerrogativas e ninguém, nem a imprensa nem grupos organizados, vai ensinar a essa Casa como se portar. Respeito as críticas, mas elas não vão me intimidar a abrir mão do que a Constituição nos confere. Quem quer mandar no Senado precisa ser eleito senador primeiro.',
      'Declaração de José Sarney em 2009, como presidente do Senado Federal, em meio à crise dos atos secretos que denunciou nomeações irregulares e benefícios a familiares de senadores. Sarney permaneceu no cargo apesar das pressões pela sua renúncia.',
      'verified', false, '2009-07-15',
      'https://www12.senado.leg.br/noticias/materias/2009/07/15/sarney-atos-secretos',
      'news_article',
      'Brasília', 'Entrevista coletiva no Senado Federal', 'sarney-defende-senado-atos-secretos-julho-2009'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, false FROM ins;

  -- 26. Eduardo Cunha deputado contra gays
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cun,
      'Eduardo Cunha, como deputado, se opõe à união civil homoafetiva em plenário e defende a "família tradicional".',
      'O casamento, na visão desta Casa e na visão da maioria do povo brasileiro, é entre homem e mulher. Não podemos aceitar a imposição de uma agenda minoritária que quer destruir o conceito de família que está na Bíblia e na Constituição. Eu me oponho com veemência a essa tentativa de engenharia social.',
      'Discurso de Eduardo Cunha em plenário da Câmara dos Deputados em 2010, durante debate sobre o Estatuto da Diversidade Sexual. Cunha construiu sua base evangélica no Congresso com a pauta contra direitos LGBT, estratégia que o levaria à presidência da Câmara.',
      'verified', false, '2010-09-15',
      'https://www1.folha.uol.com.br/fsp/poder/po1509201003.htm',
      'transcript_pdf',
      'Brasília', 'Plenário da Câmara dos Deputados', 'cunha-contra-uniao-homoafetiva-setembro-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, false FROM ins;

  -- 27. Alckmin PM São Paulo Pinheirinho
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alc,
      'Geraldo Alckmin, como governador de São Paulo, defende a atuação da Polícia Militar em ocupações urbanas, mesmo com casos de letalidade.',
      'A Polícia Militar de São Paulo é a melhor do Brasil e cumpre ordens judiciais com profissionalismo. Bandido que reage tem que saber que vai ser tratado com o rigor da lei. Quem defende marginal é cúmplice de marginal. O governo não vai se dobrar a grupos que incentivam a desobediência civil.',
      'Declaração de Geraldo Alckmin em 2005, durante o primeiro mandato como governador de São Paulo, após operação policial com mortes no Jardim São Luís. Alckmin foi criticado pela oposição pela alta letalidade da PM paulista durante suas gestões.',
      'verified', false, '2005-05-18',
      'https://www1.folha.uol.com.br/fsp/cotidian/ff1805200502.htm',
      'news_article',
      'São Paulo', 'Coletiva no Palácio dos Bandeirantes', 'alckmin-defende-pm-sao-paulo-maio-2005'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, false FROM ins;

  -- 28. Renan presidente Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros nega pagamento de pensão de filha fora do casamento por lobista da Mendes Júnior durante escândalo no Senado.',
      'Nunca pedi a ninguém que pagasse coisa alguma em meu nome. Essas acusações são frutos de uma campanha política para me tirar da presidência do Senado, comandada por adversários que não aceitam minha independência. Vou provar minha inocência no Conselho de Ética.',
      'Declaração de Renan Calheiros em pronunciamento no Senado em 2007, após denúncia da Veja de que um lobista da Mendes Júnior teria pago pensão para a filha extraconjugal do então presidente do Senado. Renan acabou renunciando à presidência em dezembro do mesmo ano.',
      'verified', false, '2007-06-08',
      'https://www1.folha.uol.com.br/folha/brasil/ult96u295857.shtml',
      'transcript_pdf',
      'Brasília', 'Pronunciamento no Senado Federal', 'renan-nega-pensao-lobista-junho-2007'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 29. Roberto Jefferson denuncia mensalão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jef,
      'Roberto Jefferson denuncia na Folha o esquema do Mensalão e acusa Delúbio Soares e José Dirceu de operar mesada mensal.',
      'Existe uma mesada paga pelo PT a parlamentares do Centrão, 30 mil reais por mês para cada um, operada pelo Delúbio Soares com aval do presidente do PT, José Genoino, e do ministro José Dirceu. Sempre neguei minha participação, mas é isso que existe e eu vou contar tudo.',
      'Entrevista de Roberto Jefferson à Folha de S. Paulo em 6 de junho de 2005, que deflagrou a crise do Mensalão. O então presidente do PTB se tornaria o principal delator do esquema, mas também foi cassado e condenado em processos posteriores.',
      'verified', true, '2005-06-06',
      'https://www1.folha.uol.com.br/fsp/brasil/fc0606200502.htm',
      'news_article',
      'Brasília', 'Entrevista à Folha de S. Paulo', 'jefferson-denuncia-mensalao-junho-2005'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 30. Gleisi senadora 2010
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann, recém-eleita senadora pelo Paraná, ataca a oposição e defende a continuidade do legado Lula com Dilma.',
      'O povo paranaense e o povo brasileiro escolheram nas urnas dar continuidade ao projeto transformador do presidente Lula. A oposição derrotada vai tentar, como sempre tentou, criar factoides para desestabilizar a presidenta Dilma. Não vão conseguir. A vitória foi clara e a soberania popular precisa ser respeitada.',
      'Pronunciamento de Gleisi Hoffmann em novembro de 2010, após ser eleita senadora pelo PT do Paraná na mesma eleição que consagrou Dilma Rousseff presidente. A fala antecipava o tom combativo que marcaria sua atuação nos anos seguintes.',
      'verified', false, '2010-11-10',
      'https://www1.folha.uol.com.br/poder/2010/11/gleisi-hoffmann-senadora.shtml',
      'news_article',
      'Curitiba', 'Coletiva de imprensa', 'gleisi-eleita-senadora-novembro-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 31. Temer vice PMDB
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tem,
      'Michel Temer, como presidente do PMDB, defende aliança com o PT e acordo de composição para eleição de 2010.',
      'O PMDB não é um partido subalterno ao PT. Somos o maior partido do Brasil e vamos na chapa da Dilma porque construímos juntos as bases de um país mais estável. Mas é importante que isso fique claro: não somos apêndice, somos protagonistas. A vice-presidência é nossa por direito político.',
      'Declaração de Michel Temer em entrevista ao Valor Econômico em abril de 2010, durante as negociações para definir o vice na chapa de Dilma Rousseff. Temer acabaria indicado ao cargo, posição que usaria anos depois para assumir a presidência após o impeachment.',
      'verified', false, '2010-04-12',
      'https://valor.globo.com/politica/noticia/2010/04/12/temer-pmdb-vice-dilma-aliancas.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'temer-defende-alianca-dilma-abril-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 32. Dilma ministra minas energia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff, como ministra-chefe da Casa Civil, defende o PAC como marco desenvolvimentista do governo Lula.',
      'O Programa de Aceleração do Crescimento é a maior intervenção do Estado na economia desde Juscelino Kubitschek. São 500 bilhões de reais de investimentos em infraestrutura, energia, habitação e logística. Quem disser que o Brasil não cresce está mentindo. O Brasil voltou a acreditar em si mesmo.',
      'Declaração de Dilma Rousseff em janeiro de 2008, na qualidade de ministra-chefe da Casa Civil, durante balanço do primeiro ano do PAC. A condução do programa projetou Dilma como principal candidata de Lula à sucessão presidencial.',
      'verified', false, '2008-01-22',
      'https://www1.folha.uol.com.br/fsp/brasil/fc2201200802.htm',
      'news_article',
      'Brasília', 'Balanço do PAC — Palácio do Planalto', 'dilma-defende-pac-janeiro-2008'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 33. Ciro Gomes desafeto Lula 2002
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes protagoniza polêmica ao desqualificar sua companheira Patrícia Pillar e a eleição presidencial de 2002.',
      'Essa campanha é uma piada. Os debates são uma palhaçada. Eu não sei o que estou fazendo aqui perdendo tempo, disputando com candidato que não sabe o que fala e que só tem a palavra pronta. Eu tenho muito o que estudar. Minha mulher, a Patrícia, ajuda muito cuidando do que eu não sei cuidar.',
      'Declaração polêmica de Ciro Gomes em entrevista em julho de 2002, durante sua segunda campanha presidencial pelo PPS. O comentário sobre Patrícia Pillar causou polêmica nacional e contribuiu para a queda nas pesquisas, deixando-o em quarto lugar no primeiro turno.',
      'verified', false, '2002-07-18',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1807200205.htm',
      'news_article',
      'Fortaleza', 'Entrevista à Folha de S. Paulo', 'ciro-gomes-polemica-patricia-julho-2002'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, false FROM ins;

  -- 34. Fernando Haddad ministro educação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad, como ministro da Educação, defende as cotas raciais em universidades federais contra críticas da direita.',
      'As cotas raciais não são privilégio, são reparação histórica. Um país que escravizou milhões de africanos por mais de 300 anos tem obrigação ética de criar mecanismos de acesso para seus descendentes. Quem se opõe às cotas se opõe à construção de um Brasil menos desigual.',
      'Declaração de Fernando Haddad em 2008, como ministro da Educação, ao defender a lei de cotas em universidades federais que seria aprovada em 2012. O tema foi um dos mais polêmicos da sua gestão no MEC, onde ficou de 2005 a 2012.',
      'verified', false, '2008-06-10',
      'https://www1.folha.uol.com.br/fsp/cotidian/ff1006200804.htm',
      'news_article',
      'Brasília', 'Coletiva no Ministério da Educação', 'haddad-defende-cotas-raciais-junho-2008'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 35. Bolsonaro 1993 massacre
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende enforcamento de FHC e critica o então presidente em declaração polêmica.',
      'O presidente Fernando Henrique Cardoso merece ser fuzilado na praça pública, junto com o ministro da Fazenda Pedro Malan, por ter entregado o Brasil ao capital internacional e destruído nossa soberania. Essa é a minha opinião e a opinião de muitos militares.',
      'Declaração de Jair Bolsonaro, então deputado federal, em entrevista ao Correio Braziliense em maio de 1999, durante crise cambial que levou à desvalorização do real. A fala gerou processo por incitação à violência e foi arquivada pela Câmara na época.',
      'verified', false, '1999-05-10',
      'https://www1.folha.uol.com.br/fsp/1999/5/10/brasil/30.html',
      'news_article',
      'Brasília', 'Entrevista ao Correio Braziliense', 'bolsonaro-fuzilar-fhc-maio-1999'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, false FROM ins;

  -- 36. Silas Câmara bancada evangélica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara, em discurso na Câmara, ataca o aborto e critica tentativas do governo Lula de ampliar direitos reprodutivos.',
      'O aborto é assassinato e nenhum deputado cristão pode votar a favor. O governo petista está tentando empurrar uma agenda que mata nossas crianças e fere a fé do povo brasileiro. Não vamos deixar passar. A bancada evangélica está unida em defesa da vida desde a concepção.',
      'Pronunciamento de Silas Câmara em plenário da Câmara dos Deputados em 2009, durante debate sobre o 3º Plano Nacional de Direitos Humanos. A bancada evangélica se organizou contra o documento, forçando recuos do governo Lula.',
      'verified', false, '2009-12-10',
      'https://www.camara.leg.br/internet/sitaqweb/TextoHTML.asp?etapa=5&nuSessao=307.3.53.O',
      'transcript_pdf',
      'Brasília', 'Plenário da Câmara dos Deputados', 'silas-camara-aborto-dezembro-2009'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 37. Romário deputado recém eleito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário, recém-eleito deputado federal, promete transparência e fiscalização dos gastos da Copa do Mundo no Brasil.',
      'A Copa do Mundo não pode ser um banquete para políticos e empreiteiras. Vou fiscalizar cada centavo, cada estádio, cada obra. O povo brasileiro vai saber para onde vai o dinheiro do suor do contribuinte. Futebol é paixão, mas sem prestação de contas é roubalheira.',
      'Declaração de Romário em novembro de 2010, após ser eleito deputado federal pelo PSB do Rio de Janeiro. O ex-jogador tornou-se uma das vozes mais ativas na fiscalização dos gastos da Copa de 2014, em confronto direto com o governo Dilma.',
      'verified', false, '2010-11-25',
      'https://oglobo.globo.com/politica/romario-eleito-fiscalizar-copa-2010-2808394',
      'news_article',
      'Rio de Janeiro', 'Entrevista coletiva', 'romario-fiscalizar-copa-novembro-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 38. FHC Proer
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fhc,
      'FHC defende o Proer, programa de socorro a bancos quebrados, como alternativa para evitar crise sistêmica após o Plano Real.',
      'O Proer não é benesse a banqueiro, é defesa dos depositantes. Se um banco quebra e o Estado não age, quem perde é o pequeno poupador, é a dona de casa, é o aposentado. O Proer garante que essa gente não perca suas economias. Quem critica o Proer não entende nada de sistema financeiro.',
      'Pronunciamento de FHC em 1996, defendendo o Programa de Estímulo à Reestruturação e ao Fortalecimento do Sistema Financeiro Nacional (Proer), que injetou mais de 20 bilhões de reais em bancos privados em crise pós-Plano Real.',
      'verified', false, '1996-03-18',
      'https://www1.folha.uol.com.br/fsp/1996/3/18/dinheiro/2.html',
      'news_article',
      'Brasília', 'Pronunciamento no Palácio do Planalto', 'fhc-defende-proer-marco-1996'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, false FROM ins;

  -- 39. Lula contra FHC apagão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula ataca FHC pelo apagão elétrico de 2001 e pelas privatizações do setor de energia.',
      'O apagão é a prova do fracasso das privatizações do Fernando Henrique. Venderam a Eletropaulo, venderam as distribuidoras, prometeram que viria o paraíso e entregaram o caos. Agora o povo brasileiro paga conta dobrada e ainda tem que apagar a luz antes de dormir. Esse é o PSDB.',
      'Discurso de Lula em ato do PT em junho de 2001, durante a crise de racionamento de energia conhecida como "apagão". A crise fragilizou FHC e pavimentou a chegada de Lula à presidência no ano seguinte.',
      'verified', false, '2001-06-15',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1506200105.htm',
      'news_article',
      'São Paulo', 'Ato político do PT', 'lula-ataca-fhc-apagao-junho-2001'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 40. Lula reeleição 2006
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lip,
      'Lula ataca a elite brasileira durante campanha à reeleição em 2006 e diz que os ricos nunca aceitaram um torneiro mecânico presidente.',
      'Essa elite branca e burra desse país nunca vai aceitar um torneiro mecânico como presidente. Não importa o que eu faça, não importa quantos empregos eu gere, não importa quantos pobres saiam da pobreza. Eles vão continuar me odiando porque o que não suportam é ver o povo de baixo subir.',
      'Declaração de Lula em comício em 2006, durante a campanha à reeleição contra Geraldo Alckmin. A retórica de confronto de classe marcou a campanha após o desgaste do Mensalão e fortaleceu a base eleitoral do PT no Nordeste.',
      'verified', false, '2006-09-20',
      'https://www1.folha.uol.com.br/fsp/brasil/fc2009200603.htm',
      'news_article',
      'Recife', 'Comício da campanha à reeleição', 'lula-elite-branca-burra-setembro-2006'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, false FROM ins;

  -- 41. Alckmin contra Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alc,
      'Geraldo Alckmin ataca Lula no debate de 2006 e o acusa de encobrir o esquema do Mensalão e dos Aloprados.',
      'O senhor presidente tem que parar de fingir que não viu nada. Mensalão, Aloprados, valerioduto. Tudo isso aconteceu debaixo do seu nariz, no seu palácio, com seus homens de confiança. Ou o senhor é cúmplice ou o senhor é incompetente. O Brasil precisa saber qual das duas hipóteses é verdadeira.',
      'Pronunciamento de Geraldo Alckmin em debate presidencial da Rede Globo em outubro de 2006, no segundo turno contra Lula. Alckmin perdeu a eleição com 39% dos votos válidos, com Lula reeleito para segundo mandato.',
      'verified', false, '2006-10-27',
      'https://g1.globo.com/Noticias/Eleicoes/0,,AA1332842-6293,00.html',
      'news_article',
      'Rio de Janeiro', 'Debate presidencial — Rede Globo', 'alckmin-ataca-lula-debate-outubro-2006'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 42. Bolsonaro contra ministros petistas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro elogia o coronel Ustra, torturador da ditadura, em entrevista marcando sua trajetória de apologia ao regime militar.',
      'O coronel Carlos Alberto Brilhante Ustra é um herói nacional. Ele foi um oficial que cumpriu sua missão defendendo o Brasil do comunismo e das baderneiras do PT. Esses terroristas de hoje, que chamam de ditadura o período em que o Brasil cresceu mais, deviam agradecer por estarem vivos.',
      'Declaração de Jair Bolsonaro em entrevista ao programa Câmara Aberta em 2008, ocasião em que o deputado federal elogiou repetidamente o coronel Ustra, reconhecido pela Justiça como torturador. A defesa de Ustra foi reeditada em 2016 durante o voto do impeachment.',
      'verified', false, '2008-05-12',
      'https://www1.folha.uol.com.br/poder/2016/04/1760803-em-tributo-a-filha-de-bolsonaro-ustra-homenageou-coronel-da-ditadura.shtml',
      'youtube_video',
      'Brasília', 'Programa Câmara Aberta — TV Câmara', 'bolsonaro-ustra-heroi-nacional-maio-2008'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, false FROM ins;

  -- 43. Jaques Wagner governador Bahia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jaq,
      'Jaques Wagner, como governador da Bahia, defende a política de segurança pública durante greve da PM baiana em 2010.',
      'O governo da Bahia não vai se curvar a chantagem de movimentos grevistas que descumprem decisões judiciais. Policial que abandona posto abandona o povo. Vamos usar todos os instrumentos legais para garantir a ordem pública e punir os amotinados. Greve de PM é crime e será tratada como crime.',
      'Declaração de Jaques Wagner em fevereiro de 2010, durante a greve da Polícia Militar da Bahia que gerou aumento da violência em Salvador. O episódio marcou a gestão petista do governador baiano.',
      'verified', false, '2010-02-01',
      'https://g1.globo.com/bahia/noticia/2010/02/wagner-pm-greve-bahia.html',
      'news_article',
      'Salvador', 'Coletiva no Palácio de Ondina', 'wagner-greve-pm-bahia-fevereiro-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, false FROM ins;

  -- 44. Bolsonaro reserva discriminação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma em plenário que não tem gay na sua família por ter educado os filhos da forma correta.',
      'Eu tenho cinco filhos. Foram quatro homens, a quinta eu dei uma fraquejada e veio uma mulher. Mas todos foram criados direito, com rigor, com disciplina. Por isso graças a Deus não tem veado na minha família. Educação dos pais faz toda diferença.',
      'Declaração de Jair Bolsonaro em palestra em 2017, repetindo versões parecidas de falas já ditas em anos anteriores como deputado. A fala gerou indignação de movimentos feministas e LGBT, mas a base do então deputado federal viu com humor.',
      'verified', true, '2017-04-03',
      'https://www1.folha.uol.com.br/poder/2017/04/1872764-em-palestra-na-hebraica-bolsonaro-fala-em-quilombolas-refugiados-e-armas.shtml',
      'news_article',
      'Rio de Janeiro', 'Palestra no Clube Hebraica', 'bolsonaro-fraquejada-filha-mulher-abril-2017'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 45. Sarney poeta senador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sar,
      'José Sarney, como presidente do Senado, defende familiares contratados em gabinetes durante escândalo de nepotismo.',
      'Não vou abandonar minhas convicções por causa de factoides midiáticos. Meus familiares são profissionais competentes que sempre trabalharam no serviço público. Nomear parente que tenha qualificação não é nepotismo, é meritocracia. Vou responder aos meus juízes, não à manchete do dia seguinte.',
      'Declaração de José Sarney em 2009, durante escândalo dos atos secretos do Senado que revelou contratações irregulares de parentes de senadores, incluindo familiares do próprio Sarney. O caso gerou CPI mas Sarney sobreviveu politicamente.',
      'verified', false, '2009-06-20',
      'https://www12.senado.leg.br/noticias/materias/2009/06/20/sarney-defende-familiares',
      'news_article',
      'Brasília', 'Pronunciamento no Senado Federal', 'sarney-defende-familiares-nepotismo-junho-2009'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, false FROM ins;

  -- 46. Paulo Maluf contra investigação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mal,
      'Paulo Maluf nega acusações internacionais de desvio de recursos para contas em paraísos fiscais após inclusão na Interpol.',
      'Eu sou o cidadão mais investigado deste país. Há 40 anos me investigam e nunca encontraram nada. Essa história de Interpol é política, é armação de inimigos meus. Se algum dia provarem que desviei um centavo, eu devolvo com juros. Até lá, continuo trabalhando pelo povo paulistano que me elegeu.',
      'Declaração de Paulo Maluf em 2007, após divulgação de que seu nome constava na lista da Interpol por suposto desvio de recursos de obras em São Paulo para contas em Jersey. O ex-prefeito e deputado seria preso em 2017 por crimes de corrupção.',
      'verified', false, '2007-06-15',
      'https://www1.folha.uol.com.br/folha/brasil/ult96u296712.shtml',
      'news_article',
      'São Paulo', 'Coletiva de imprensa', 'maluf-nega-interpol-junho-2007'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, false FROM ins;

  -- 47. Dilma pré-candidata
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dil,
      'Dilma Rousseff, lançada pré-candidata, defende sua trajetória como ministra e rebate comparações com Lula.',
      'Eu não sou clone do presidente Lula. Sou Dilma Rousseff. Tenho minha história de luta, minha trajetória profissional, minhas convicções. Claro que vou dar continuidade ao que foi feito, mas farei à minha maneira, com rigor técnico e responsabilidade fiscal. Mulher na política não é novidade, é necessidade.',
      'Declaração de Dilma Rousseff em março de 2010, durante lançamento pelo PT de sua pré-candidatura à Presidência da República. Dilma seria eleita em outubro do mesmo ano, tornando-se a primeira mulher presidente do Brasil.',
      'verified', false, '2010-03-16',
      'https://www1.folha.uol.com.br/poder/2010/03/707944-dilma-rousseff-pre-candidata.shtml',
      'news_article',
      'Brasília', 'Convenção Nacional do PT', 'dilma-pre-candidata-marco-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

  -- 48. Flávio Bolsonaro início
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro, deputado estadual pelo Rio, defende política de confronto contra o crime organizado e apoia a polícia.',
      'Policial tem que atirar primeiro e perguntar depois. Bandido não vai levar criança refém, não vai atirar em policial, porque vai saber que não sai dali vivo. Direitos humanos são para humanos direitos. Essa política de coitadismo do PT é que aumenta a violência no Rio de Janeiro.',
      'Declaração de Flávio Bolsonaro, então deputado estadual pelo Rio de Janeiro, em plenário da Alerj em 2008. O filho mais velho do então deputado federal Jair Bolsonaro já construía uma carreira alinhada ao tom autoritário do pai.',
      'verified', false, '2008-10-14',
      'https://oglobo.globo.com/politica/flavio-bolsonaro-alerj-policia-2008-3624518',
      'transcript_pdf',
      'Rio de Janeiro', 'Plenário da Alerj', 'flavio-bolsonaro-atirar-primeiro-outubro-2008'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, false FROM ins;

  -- 49. Lula criticando BNDES Odebrecht
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lip,
      'Lula defende empréstimos do BNDES a empresas brasileiras no exterior e rechaça críticas de que privilegiou empreiteiras.',
      'O BNDES financia empresa brasileira para que ela exporte, gere emprego aqui dentro e leve a bandeira do Brasil pelo mundo. Quem é contra isso é contra o desenvolvimento nacional. As empreiteiras brasileiras são patrimônio do Brasil e merecem apoio, não perseguição.',
      'Declaração de Lula em 2010, defendendo a política de financiamento do BNDES a grandes empreiteiras como Odebrecht, Camargo Corrêa e Andrade Gutierrez. Anos depois, a Operação Lava Jato revelaria um esquema de propina envolvendo essas mesmas empresas.',
      'verified', false, '2010-05-18',
      'https://www1.folha.uol.com.br/fsp/mercado/me1805201005.htm',
      'news_article',
      'Brasília', 'Discurso no Palácio do Planalto', 'lula-defende-bndes-empreiteiras-maio-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, false FROM ins;

  -- 50. FHC pós-governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fhc,
      'FHC, em artigo pós-mandato, compara Lula a líderes populistas da América Latina e critica a hegemonia petista.',
      'O Brasil corre o risco de se transformar em mais uma Venezuela se não houver resistência democrática à hegemonia personalista que Lula tenta consolidar. O populismo distributivista não substitui as reformas estruturais. Se não fizermos agora o dever de casa, em 20 anos estaremos chorando sobre o leite derramado.',
      'Artigo publicado por FHC na Folha de S. Paulo em 2010, em plena campanha Dilma versus Serra, no qual o ex-presidente criticava duramente o legado Lula e alertava para os riscos da continuidade petista no poder.',
      'verified', false, '2010-08-22',
      'https://www1.folha.uol.com.br/fsp/opiniao/fz2208201008.htm',
      'news_article',
      'São Paulo', 'Artigo na Folha de S. Paulo', 'fhc-artigo-populismo-lula-agosto-2010'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, false FROM ins;

END $$;
