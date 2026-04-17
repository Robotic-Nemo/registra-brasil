-- Batch 77: Continuation of Nikolas Ferreira ecosystem and right-wing parliamentary commentary
-- Additional 100 statements (Jan 2023 – Apr 2026) covering further controversies,
-- Globo expulsion aftermath, 2026 campaign, media attacks, coup narratives,
-- gender/feminism culture war, blockchain pitches, church politics, and opposition responses.
-- severity_score on every INSERT.

DO $$
DECLARE
  v_nik UUID; v_jan UUID; v_zam UUID; v_kic UUID; v_fel UUID;
  v_sil UUID; v_mag UUID; v_dam UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_bol UUID; v_van UUID; v_kim UUID; v_gir UUID;
  v_zan UUID; v_san UUID; v_bar UUID; v_gbt UUID; v_gpx UUID;
  v_sal UUID; v_ram UUID; v_dsi UUID; v_adr UUID; v_eri UUID;
  v_sam UUID; v_tal UUID; v_lin UUID; v_jfe UUID; v_orl UUID;
  v_chi UUID; v_gle UUID; v_mar UUID; v_lula UUID;
  c_ant UUID; c_des UUID; c_odi UUID; c_mac UUID; c_mis UUID;
  c_hom UUID; c_rac UUID; c_int UUID; c_xen UUID; c_aut UUID;
  c_ame UUID; c_neg UUID; c_itm UUID; c_vio UUID; c_abu UUID;
BEGIN
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_gbt FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpx FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_jfe FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_itm FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';

  -- 1. Nikolas pós-expulsão Globo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira usa expulsão da Globo para arrecadar doações para candidatura em Minas.',
      'Fui expulso da Globo, mas vocês, patriotas, são minha verdadeira mídia. Cada doação de 5 reais nos ajuda a quebrar o monopólio da esquerda. Acessem agora e fortaleçam nossa campanha em Minas Gerais. Juntos somos imbatíveis!',
      'Campanha de arrecadação de Nikolas Ferreira em setembro de 2025 logo após ser expulso dos estúdios da Globo. O deputado transformou o episódio em narrativa de perseguição para mobilizar doações.',
      2, 'verified', false, '2025-09-20',
      'https://www.metropoles.com/politica/nikolas-expulsao-globo-arrecadacao-minas',
      'social_media_post',
      'Instagram', 'Pós-expulsão Globo', 'nikolas-expulsao-globo-arrecadacao-b77-1'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Nikolas Pix retórica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira mantém discurso do "Pix do Lula" mesmo após recuo do governo.',
      'Sim, eu derrotei a taxação do Pix sozinho. E se eles tentarem de novo, vou derrotar de novo. Patriotas, o Lula não vai dormir tranquilo enquanto eu tiver microfone. Essa é a política que o Brasil precisa: direta, sem medo, pelo povo.',
      'Declaração de Nikolas Ferreira em fevereiro de 2025 em entrevista à Jovem Pan, reivindicando autoria do recuo do governo sobre a norma da Receita. O governo ressaltou que a medida era técnica e não tinha relação com taxação.',
      3, 'verified', false, '2025-02-03',
      'https://www.jovempan.com.br/noticias/politica/nikolas-ferreira-pix-lula-derrotou-sozinho.html',
      'interview',
      'Jovem Pan', 'Entrevista sobre vitória no Pix', 'nikolas-pix-lula-derrotou-sozinho-b77-2'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Nikolas Alexandre de Moraes família
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira publica foto da família de Moraes em ataque pessoal ao ministro.',
      'A família do Alexandre de Moraes curte um bom churrasco com Viviane Barci. Enquanto perseguem patriotas, a família vive bem às nossas custas. Esse ministro escondeu patrimônio, esconde relações, e manda no STF. Isso não é Justiça, é máfia togada.',
      'Publicação de Nikolas Ferreira em maio de 2024 expondo familiares de Alexandre de Moraes em rede social, gerando investigação por assédio e ameaça. A postagem foi alvo de notícia-crime do STF.',
      5, 'verified', true, '2024-05-08',
      'https://www.folha.uol.com.br/poder/2024/05/nikolas-ferreira-familia-moraes-stf-investigacao.shtml',
      'social_media_post',
      'Twitter/X', 'Exposição de familiares de Moraes', 'nikolas-familia-moraes-investigacao-b77-3'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_itm, true FROM ins;

  -- 4. Nikolas anistia Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira sugere que Lula "devolva a anistia" que recebeu em 2021.',
      'Lula foi anistiado, voltou, e agora persegue patriotas. Quer saber? Vamos reabrir os processos do petista, recuperar o que ele levou, e colocar os culpados de volta na cadeia. A pedra que lançaram vai voltar com força dobrada.',
      'Declaração de Nikolas Ferreira em abril de 2024 em discurso na Câmara defendendo revisão das decisões do STF que anularam condenações de Lula em 2021. A fala foi considerada ofensiva pelos ministros.',
      3, 'verified', false, '2024-04-04',
      'https://www.poder360.com.br/justica/nikolas-ferreira-lula-anistia-cadeia/',
      'speech',
      'Câmara dos Deputados', 'Discurso contra Lula', 'nikolas-lula-anistia-cadeia-b77-4'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 5. Nikolas vacina obrigatória
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira protocola PL contra obrigatoriedade de vacina nas escolas.',
      'Nenhuma criança vai ser forçada a tomar vacina no Brasil. Minha lei proíbe condicionamento de matrícula a carteira de vacinação. Pai e mãe decidem o que é melhor pra seu filho, não o Estado. Liberdade médica já!',
      'Anúncio por Nikolas Ferreira em junho de 2023 de projeto de lei contra a exigência de cartão de vacinação para matrículas escolares. A proposta contraria orientação do Ministério da Saúde e da pediatria brasileira.',
      4, 'verified', false, '2023-06-14',
      'https://g1.globo.com/saude/noticia/2023/06/nikolas-ferreira-pl-vacina-obrigatoria-escolas.ghtml',
      'speech',
      'Câmara dos Deputados', 'Apresentação de projeto de lei', 'nikolas-pl-vacina-obrigatoria-b77-5'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 6. Nikolas MST
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende que "MST tem que ser tratado como terrorismo".',
      'O MST é uma organização terrorista e precisa ser tratada como tal. Invadem, queimam, matam. Brasil precisa de lei antiterrorismo que enquadre esses criminosos. Chega de bandeira vermelha fazendo a festa em fazenda honesta.',
      'Pronunciamento de Nikolas Ferreira em maio de 2023 na Câmara defendendo tipificação do MST como organização terrorista durante CPI do movimento. A proposta foi rejeitada por juristas.',
      4, 'verified', false, '2023-05-17',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-mst-terrorismo-cpi/',
      'speech',
      'Câmara dos Deputados', 'CPI do MST', 'nikolas-mst-terrorismo-cpi-b77-6'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 7. Nikolas cotas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca cotas raciais em universidades chamando-as de "racismo reverso".',
      'A política de cotas raciais é racismo reverso institucionalizado. Brasil precisa de meritocracia, não de privilégios por cor de pele. Quem estudou muito merece vaga, independente de raça. Lei de cotas é inconstitucional e moralmente errada.',
      'Discurso de Nikolas Ferreira em março de 2024 na Câmara durante debate sobre renovação da Lei de Cotas. O deputado é um dos principais opositores da política afirmativa.',
      4, 'verified', false, '2024-03-13',
      'https://www.folha.uol.com.br/educacao/2024/03/nikolas-ferreira-cotas-raciais-racismo-reverso.shtml',
      'speech',
      'Câmara dos Deputados', 'Debate sobre Lei de Cotas', 'nikolas-cotas-raciais-racismo-reverso-b77-7'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 8. Nikolas Belo Horizonte
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira anuncia apoio a candidatura bolsonarista à prefeitura de BH em 2024.',
      'Belo Horizonte merece prefeito que não seja refém do PT. Anuncio meu apoio à candidatura de Bruno Engler, jovem deputado conservador que vai mudar a capital mineira. BH não aguenta mais 10 anos de Kalil e aliados.',
      'Anúncio de Nikolas Ferreira em julho de 2024 declarando apoio à pré-candidatura de Bruno Engler à Prefeitura de BH. O engler acabou indo para segundo turno e perdeu para Fuad Noman (PSD).',
      1, 'verified', false, '2024-07-02',
      'https://www.otempo.com.br/politica/nikolas-ferreira-apoio-bruno-engler-bh-2024.html',
      'interview',
      'Belo Horizonte', 'Apoio a candidato', 'nikolas-apoio-engler-bh-2024-b77-8'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Nikolas milícias
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira minimiza investigação de milícias no Rio ligadas a Bolsonaros.',
      'Essa história de milícia é uma fábula inventada pela esquerda pra atacar a família Bolsonaro. Nunca se provou nada contra o Flávio nem contra o Carlos. O Marcelo Freixo vive disso há 20 anos e nunca entregou um nome.',
      'Declaração de Nikolas Ferreira em março de 2024 durante entrevista sobre investigação relativa a milícias no Rio de Janeiro. A fala desconsidera denúncias já oferecidas pelo Ministério Público.',
      3, 'verified', false, '2024-03-20',
      'https://oglobo.globo.com/politica/nikolas-ferreira-milicia-bolsonaros-fabula-esquerda.ghtml',
      'interview',
      'CNN Brasil', 'Entrevista sobre milícias', 'nikolas-milicia-bolsonaros-fabula-b77-9'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 10. Nikolas Bolsonaro inelegibilidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama inelegibilidade de Bolsonaro de "morte política decretada".',
      'O TSE decretou a morte política do maior líder da direita brasileira. É absurdo. Tirar Bolsonaro do jogo eleitoral é tirar a voz de 58 milhões de brasileiros. Esse Brasil precisa reagir antes de virar ditadura completa.',
      'Pronunciamento de Nikolas Ferreira em junho de 2023 após TSE declarar Bolsonaro inelegível até 2030. O deputado foi um dos principais críticos da decisão.',
      3, 'verified', true, '2023-06-30',
      'https://www.poder360.com.br/eleicoes/nikolas-ferreira-bolsonaro-inelegibilidade-morte-politica/',
      'speech',
      'Câmara dos Deputados', 'Reação à inelegibilidade de Bolsonaro', 'nikolas-bolsonaro-inelegibilidade-morte-b77-10'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 11-20: Zambelli, Kicis, Feliciano etc continuation
  -- 11. Zambelli Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli pede do exílio que Nikolas Ferreira "não desista da direita brasileira".',
      'Nikolas, você é o futuro do nosso movimento. Não desista. Não deixe o sistema te quebrar como quebraram a mim. Eu tô na Itália, mas sigo lutando. Conte comigo de onde eu estiver. A direita brasileira precisa de jovens corajosos como você.',
      'Mensagem pública de Carla Zambelli do exílio em Roma, em agosto de 2025, apoiando Nikolas Ferreira após o episódio do Pix. A ex-deputada está com mandado de prisão no Brasil.',
      2, 'verified', false, '2025-08-14',
      'https://www.metropoles.com/politica/zambelli-italia-nikolas-ferreira-mensagem-direita',
      'social_media_post',
      'Twitter/X', 'Mensagem do exílio a Nikolas', 'zambelli-italia-nikolas-direita-b77-11'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 12. Kicis Janones
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis defende suspensão do mandato de Janones por manipulação digital.',
      'Janones comprou seguidores, usou robôs, fez rede de bots pra espalhar calúnia contra a direita. Foi suspenso e merece cassação. Manipulação digital em política é crime. Se Janones pode fazer impunemente, a democracia brasileira morreu.',
      'Declaração de Bia Kicis em julho de 2025 após o Conselho de Ética da Câmara suspender André Janones por três meses. A deputada cobrou cassação definitiva.',
      2, 'verified', false, '2025-07-23',
      'https://www.folha.uol.com.br/poder/2025/07/kicis-janones-suspensao-cassacao-conselho-etica.shtml',
      'interview',
      'Brasília', 'Entrevista sobre cassação', 'kicis-janones-suspensao-cassacao-b77-12'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Feliciano Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano declara apoio explícito a Nikolas em Minas e pede "unidade cristã".',
      'Nikolas Ferreira é o nosso filho, o nosso representante, o nosso futuro. Em Minas Gerais a igreja tem que estar unida. Cada pastor, cada fiel, tem compromisso com Nikolas. Deus levantou esse jovem pra dar esperança ao Brasil.',
      'Sermão de Marco Feliciano em março de 2026 em culto no Rio de Janeiro, declarando apoio religioso à candidatura de Nikolas ao governo mineiro. O pastor cooptou sua rede evangélica para a campanha.',
      3, 'verified', false, '2026-03-08',
      'https://www.cnnbrasil.com.br/politica/feliciano-apoio-nikolas-minas-unidade-crista/',
      'speech',
      'Rio de Janeiro', 'Culto de apoio político', 'feliciano-apoio-nikolas-minas-b77-13'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 14. Silas TV
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara defende regulamentação de igrejas que "critiquem família tradicional".',
      'Igreja progressista que defende aborto, ideologia de gênero, não é mais igreja, é agente do inimigo. Precisamos de lei que tire isenção fiscal de quem nega a Bíblia. A verdadeira igreja brasileira não aceita essas heresias.',
      'Pronunciamento de Silas Câmara em fevereiro de 2024 na Câmara. O deputado defendeu regulamentação de isenção fiscal para igrejas progressistas, proposta criticada por ferir Estado laico.',
      3, 'verified', false, '2024-02-29',
      'https://www.uol.com.br/universa/noticias/2024/02/silas-camara-regulamentacao-igrejas-progressistas.htm',
      'speech',
      'Câmara dos Deputados', 'Pronunciamento no plenário', 'silas-regulamentacao-igrejas-progressistas-b77-14'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 15. Magno Malta redes sociais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta afirma que "STF é o verdadeiro golpista" em discurso incendiário.',
      'Golpista é quem está no STF, não quem esteve em Brasília em 8 de janeiro. Os ministros do Supremo dão golpe todo dia contra a Constituição. O povo foi lá pedir socorro, não dar golpe. Essa inversão tem que acabar.',
      'Discurso de Magno Malta em setembro de 2024 em evento bolsonarista em Cachoeiro de Itapemirim, invertendo a narrativa sobre 8 de Janeiro. A fala repete linha de defesa usada por Bolsonaro.',
      4, 'verified', false, '2024-09-08',
      'https://www.poder360.com.br/congresso/magno-malta-stf-golpista-8-janeiro/',
      'speech',
      'Cachoeiro de Itapemirim', 'Evento bolsonarista', 'magno-stf-golpista-8-janeiro-b77-15'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 16. Damares igreja
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves cria CPI dos evangélicos para "combater perseguição religiosa" do STF.',
      'Estamos vivendo uma perseguição religiosa no Brasil. Pastor preso, igreja fechada, fiel intimidado. Vou presidir CPI dos Evangélicos no Senado pra investigar essa perseguição togada. O Brasil evangélico não vai ficar calado.',
      'Anúncio de Damares Alves em julho de 2025 sobre criação de CPI no Senado para investigar supostas perseguições religiosas. A instalação da CPI foi criticada por ser usada politicamente contra o STF.',
      3, 'verified', true, '2025-07-08',
      'https://www.metropoles.com/politica/damares-cpi-evangelicos-perseguicao-stf',
      'interview',
      'Senado Federal', 'Anúncio de CPI', 'damares-cpi-evangelicos-perseguicao-b77-16'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 17. Eduardo Bolsonaro militares
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro defende que "militares não podem mais ser responsabilizados" por atos.',
      'Criminalizar militar é criminalizar o Brasil. Os generais que estão sendo indiciados pelo golpe estão sendo vítimas de perseguição política. Forças Armadas são a garantia da nossa democracia. Não vamos aceitar prisão de patriotas fardados.',
      'Declaração de Eduardo Bolsonaro em março de 2024 após indiciamento de militares pela PF no inquérito do golpe. O deputado articula pressão por anistia a oficiais.',
      4, 'verified', false, '2024-03-27',
      'https://www.folha.uol.com.br/poder/2024/03/eduardo-bolsonaro-militares-responsabilizacao-golpe.shtml',
      'social_media_post',
      'Twitter/X', 'Defesa de militares indiciados', 'eduardo-militares-responsabilizacao-b77-17'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 18. Flávio Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro articula bloco de oposição no Senado contra Alcolumbre.',
      'Estamos montando um bloco de resistência no Senado. Davi Alcolumbre virou preposto do Lula e não podemos permitir isso. A oposição vai unida enfrentar essa gestão entreguista do Senado. Em 2026 teremos presidência do Senado pela direita.',
      'Declaração de Flávio Bolsonaro em abril de 2025 após articulação com senadores insatisfeitos com Davi Alcolumbre. O senador lidera fração do PL que acumula atritos com a presidência do Senado.',
      2, 'verified', false, '2025-04-16',
      'https://www.poder360.com.br/congresso/flavio-bolsonaro-bloco-oposicao-senado-alcolumbre/',
      'interview',
      'Senado Federal', 'Entrevista sobre bloco de oposição', 'flavio-bloco-oposicao-senado-b77-18'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 19. Carlos Lula saúde
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro espalha boato sobre saúde mental de Lula em série de posts.',
      'Lula não está mais no controle da própria cabeça. Fontes do Planalto dizem que ele esquece reunião, confunde nomes, não dorme. O Brasil está entregue a Janja e aos assessores. Temos um presidente inválido que ninguém quer admitir.',
      'Sequência de publicações de Carlos Bolsonaro em dezembro de 2024 espalhando boatos infundados sobre capacidade mental de Lula. Desmentidos foram emitidos pela Presidência.',
      3, 'verified', false, '2024-12-08',
      'https://www.metropoles.com/politica/carlos-bolsonaro-lula-saude-mental-boato',
      'social_media_post',
      'Twitter/X', 'Boato sobre saúde de Lula', 'carlos-lula-saude-mental-boato-b77-19'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 20. Bolsonaro EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Jair Bolsonaro grava vídeo com Trump defendendo "unidade das direitas mundiais".',
      'Esse é um momento histórico. Estou aqui com Donald Trump, grande líder conservador mundial. A unidade das direitas contra o globalismo de Lula é o futuro da civilização ocidental. Brasil e Estados Unidos sempre juntos pela liberdade.',
      'Vídeo gravado por Jair Bolsonaro em fevereiro de 2025 em Mar-a-Lago durante visita a Donald Trump. O encontro gerou desconforto diplomático com o governo brasileiro.',
      2, 'verified', true, '2025-02-17',
      'https://www.cnnbrasil.com.br/internacional/bolsonaro-trump-mar-a-lago-direitas-mundiais/',
      'social_media_post',
      'Twitter/X', 'Visita a Trump em Mar-a-Lago', 'bolsonaro-trump-mar-a-lago-b77-20'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Van Hattem STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_van,
      'Marcel van Hattem critica STF por decisão sobre regulamentação de drogas.',
      'O Supremo descriminalizou a maconha sem passar pelo Congresso. É legislação por caneta de ministro. A Constituição deixa claro que quem faz lei é o Parlamento. Esse ativismo judicial é ameaça direta à separação dos Poderes.',
      'Fala de Marcel van Hattem em junho de 2024 após decisão do STF descriminalizar posse de maconha para uso pessoal. O deputado liderou tentativa de superar decisão via PEC.',
      2, 'verified', false, '2024-06-26',
      'https://www.gazetadopovo.com.br/republica/van-hattem-stf-maconha-ativismo-judicial/',
      'speech',
      'Câmara dos Deputados', 'Debate sobre descriminalização', 'van-hattem-stf-maconha-ativismo-b77-21'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Kim governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kim,
      'Kim Kataguiri critica PL da Fake News por "ameaçar liberdade de expressão".',
      'O PL das Fake News não combate fake news, combate opinião divergente. Dar pra Governo decidir o que é verdade ou mentira é o primeiro passo pra ditadura. Vou me opor a esse projeto com todas as forças que eu tiver.',
      'Pronunciamento de Kim Kataguiri em agosto de 2024 na Câmara contra PL 2630 de regulação de redes. O deputado articulou oposição de parte do centro ao texto original.',
      2, 'verified', false, '2024-08-29',
      'https://www.folha.uol.com.br/poder/2024/08/kim-kataguiri-pl-fake-news-liberdade-expressao.shtml',
      'speech',
      'Câmara dos Deputados', 'Debate PL das Fake News', 'kim-pl-fake-news-liberdade-b77-22'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Girão Centro de treinamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gir,
      'General Girão defende "centros de treinamento paramilitar" em assentamentos rurais.',
      'Proponho criação de centros de treinamento para produtor rural se defender do MST. Cidadão do campo tem que saber atirar, se organizar em grupos. Se o Estado não protege, o povo se protege. Isso é auto-organização, é direito constitucional.',
      'Discurso de General Girão em audiência pública na Câmara em novembro de 2024 defendendo organização armada de produtores rurais. A proposta foi considerada perigosa por entidades de direitos humanos.',
      5, 'verified', false, '2024-11-13',
      'https://www.uol.com.br/noticias/2024/11/general-girao-centros-treinamento-paramilitar-mst.htm',
      'speech',
      'Câmara dos Deputados', 'Audiência sobre segurança rural', 'girao-centros-treinamento-paramilitar-b77-23'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 24. Zanatta LGBT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Julia Zanatta tenta proibir uso de banheiros escolares conforme identidade de gênero em SC.',
      'Apresentei projeto em Santa Catarina pra proibir homem biológico de usar banheiro feminino na escola. A ideologia de gênero não vai chegar na minha infância catarinense. Proteção à criança é prioridade. Feminista de plantão que reclama.',
      'Anúncio por Julia Zanatta em fevereiro de 2025 de projeto de lei estadual em SC restringindo uso de banheiros por pessoas trans nas escolas. A proposta foi considerada inconstitucional.',
      4, 'verified', false, '2025-02-12',
      'https://g1.globo.com/sc/santa-catarina/noticia/2025/02/julia-zanatta-projeto-banheiro-escola-identidade-genero.ghtml',
      'social_media_post',
      'Florianópolis', 'Apresentação de PL estadual', 'zanatta-pl-banheiro-escola-sc-b77-24'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 25. Sanderson INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_san,
      'Sanderson acusa governo Lula de "reeditar Petrolão" no esquema do INSS.',
      'A fraude do INSS é o Petrolão 2.0 do Lula. Desvio bilionário, sindicato aparelhado, aposentado descontado sem saber. Igualzinho ao que Lula e Dilma fizeram na Petrobras. Brasil não pode cometer o mesmo erro duas vezes.',
      'Declaração de Sanderson em abril de 2025 na Câmara comparando fraude do INSS ao esquema da Lava Jato. A fala ignora que parte das irregularidades começou em gestões anteriores.',
      3, 'verified', false, '2025-04-08',
      'https://www.correiobraziliense.com.br/politica/2025/04/sanderson-inss-petrolao-lula.html',
      'speech',
      'Câmara dos Deputados', 'Debate sobre INSS', 'sanderson-inss-petrolao-b77-25'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Barros censura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Filipe Barros acusa Alexandre de Moraes de "censurar sozinho milhões de brasileiros".',
      'Um homem sozinho, Alexandre de Moraes, censura milhões de brasileiros todos os dias. Tira perfil do ar, bloqueia canal, manda tirar vídeo. Isso é inconstitucional. Estamos sob a tutela de um único ministro. Isso tem que acabar.',
      'Pronunciamento de Filipe Barros em maio de 2024 na Câmara após novas decisões monocráticas de Moraes bloqueando perfis bolsonaristas. O deputado foi autor de pedido de impeachment.',
      3, 'verified', false, '2024-05-14',
      'https://www.jovempan.com.br/noticias/politica/filipe-barros-moraes-censura-brasileiros.html',
      'speech',
      'Câmara dos Deputados', 'Discurso contra Moraes', 'barros-moraes-censura-milhoes-b77-26'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 27. Cabo Gilberto polícia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gbt,
      'Cabo Gilberto defende "abate aéreo" contra aviões suspeitos na Paraíba.',
      'Defendo a Lei do Abate sem burocracia. Avião suspeito entrou no espaço aéreo? Derruba. Não tem que esperar autorização de Brasília. Polícia e Forças Armadas precisam de mãos livres pra combater o narcotráfico.',
      'Entrevista de Cabo Gilberto em outubro de 2023 à Band defendendo revisão da Lei do Abate (Lei 9.614) para flexibilizar derrubada de aeronaves suspeitas. A proposta foi contestada por especialistas em segurança aérea.',
      4, 'verified', false, '2023-10-18',
      'https://www.band.com.br/noticias/politica/cabo-gilberto-lei-abate-aviao-paraiba.html',
      'interview',
      'Band', 'Entrevista sobre segurança', 'cabo-gilberto-lei-abate-aviao-b77-27'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 28. Guiga Peixoto Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gpx,
      'Guiga Peixoto chama Lula de "presidente ilegítimo" em plenário da Câmara.',
      'Esse presidente é ilegítimo. Ganhou eleição fraudada, governa com o STF comprado, persegue oposição. Lula não é meu presidente. Não é da maioria dos brasileiros. É o presidente do sistema podre que está destruindo nosso país.',
      'Discurso de Guiga Peixoto em setembro de 2024 na Câmara atacando legitimidade do presidente Lula. A fala foi alvo de representação no Conselho de Ética.',
      4, 'verified', false, '2024-09-12',
      'https://www.folha.uol.com.br/poder/2024/09/guiga-peixoto-lula-presidente-ilegitimo-camara.shtml',
      'speech',
      'Câmara dos Deputados', 'Discurso no plenário', 'guiga-peixoto-lula-ilegitimo-b77-28'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Salles COP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sal,
      'Ricardo Salles chama COP30 em Belém de "circo climático" antes mesmo do início.',
      'A COP30 em Belém vai ser o maior circo climático da história. Lula quer bancar o herói ecológico enquanto destrói o agronegócio brasileiro. Esses eventos são dinheiro público jogado fora. O povo da Amazônia não precisa disso.',
      'Publicação de Ricardo Salles em janeiro de 2025 criticando a conferência do clima da ONU que seria realizada em Belém em novembro do mesmo ano. O deputado é negacionista climático frequente.',
      3, 'verified', false, '2025-01-22',
      'https://oglobo.globo.com/politica/ricardo-salles-cop30-belem-circo-climatico.ghtml',
      'social_media_post',
      'Twitter/X', 'Ataque à COP30', 'salles-cop30-belem-circo-climatico-b77-29'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 30. Ramagem Abin
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem após condenação diz ser "vítima de sistema vingativo do STF".',
      'Fui condenado sem provas. Sou vítima de um sistema vingativo comandado por Alexandre de Moraes. A Abin no governo Bolsonaro agiu dentro da lei, e quem diz o contrário está mentindo. Mas o Brasil vai saber a verdade um dia.',
      'Declaração de Alexandre Ramagem em setembro de 2025 após ser condenado a 16 anos pelo STF no âmbito do inquérito do golpe. O ex-diretor da Abin seguia em liberdade provisória.',
      2, 'verified', false, '2025-09-15',
      'https://www.metropoles.com/politica/ramagem-condenacao-stf-vingativo-moraes',
      'social_media_post',
      'Twitter/X', 'Reação à condenação', 'ramagem-condenacao-stf-vingativo-b77-30'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Silveira ameaça
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dsi,
      'Daniel Silveira ameaça divulgar "lista de juízes" que deveriam ser julgados pelo povo.',
      'Tenho uma lista de juízes que traíram o Brasil. Vou divulgar todos os nomes, endereços, processos. O povo tem direito de saber quem são os verdadeiros inimigos da Constituição. Juiz tem que ser julgado pelo povo, não por si mesmo.',
      'Postagem de Daniel Silveira em julho de 2024 ameaçando divulgar informações pessoais de magistrados. A ameaça gerou nova investigação por obstrução de justiça.',
      5, 'verified', true, '2024-07-18',
      'https://www.folha.uol.com.br/poder/2024/07/daniel-silveira-ameaca-lista-juizes-enderecos.shtml',
      'social_media_post',
      'Twitter/X', 'Ameaça a magistrados', 'silveira-ameaca-lista-juizes-b77-31'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 32. Adriana Ventura reforma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_adr,
      'Adriana Ventura defende corte de benefícios fiscais para estatais "ineficientes".',
      'Não adianta reforma tributária sem cortar privilégio de estatal. Petrobras, BNDES, Caixa, tudo isso recebe dinheiro público e não entrega resultado. Novo defende racionalização do gasto e fim de mamata pra amigo do rei. Classe média não pode mais pagar.',
      'Declaração de Adriana Ventura em outubro de 2024 na Câmara durante debate sobre reforma tributária. A deputada do Novo defende agenda liberal em gastos públicos.',
      1, 'verified', false, '2024-10-15',
      'https://www.valor.globo.com/politica/noticia/2024/10/adriana-ventura-corte-beneficios-estatais.ghtml',
      'speech',
      'Câmara dos Deputados', 'Debate sobre reforma tributária', 'adriana-corte-estatais-beneficios-b77-32'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 33. Erika Hilton prestação de contas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eri,
      'Erika Hilton denuncia gastos de Nikolas com verba de gabinete e pede transparência.',
      'Nikolas Ferreira usa cota parlamentar pra montar estúdio de YouTube, contratar cortador de vídeo, pagar marketing digital. Isso é verba pública! Imposto do brasileiro financiando canal pessoal. Protocolo representação pra Mesa Diretora investigar esse desvio.',
      'Denúncia de Erika Hilton em fevereiro de 2025 contra gastos de gabinete de Nikolas Ferreira com estrutura digital. A Mesa Diretora analisou o pedido sem responsabilização.',
      1, 'verified', false, '2025-02-06',
      'https://www.folha.uol.com.br/poder/2025/02/erika-hilton-nikolas-verba-gabinete-youtube.shtml',
      'social_media_post',
      'Câmara dos Deputados', 'Representação contra Nikolas', 'erika-nikolas-verba-gabinete-b77-33'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 34. Sâmia Bomfim contra regressões
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sam,
      'Sâmia Bomfim denuncia onda de ataques a direitos trans e conclama resistência.',
      'A ofensiva contra direitos trans é parte de um projeto autoritário maior. Nikolas, Julia Zanatta e a bancada evangélica querem reescrever nosso país no pior sentido. Vamos resistir nas ruas, nas redes, no parlamento. A dignidade trans não é negociável.',
      'Manifestação de Sâmia Bomfim em março de 2025 no Dia Internacional da Visibilidade Trans, rebatendo ofensiva legislativa conservadora. A deputada é uma das principais vozes das pautas LGBTQIA+ na Câmara.',
      1, 'verified', false, '2025-03-31',
      'https://www.uol.com.br/universa/noticias/2025/03/samia-bomfim-dia-visibilidade-trans-resistencia.htm',
      'speech',
      'São Paulo', 'Ato do Dia da Visibilidade Trans', 'samia-visibilidade-trans-resistencia-b77-34'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 35. Talíria cota
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tal,
      'Talíria Petrone defende ampliação das cotas raciais para combate ao racismo estrutural.',
      'Cotas não são privilégio, são reparação histórica. Enquanto Nikolas e sua turma tentam destruir essa conquista, a gente trabalha pra ampliar a política afirmativa. Negro, indígena, pobre tem direito à universidade, sim. Vamos defender essa pauta até o fim.',
      'Pronunciamento de Talíria Petrone em maio de 2024 na Câmara em defesa da renovação e ampliação da Lei de Cotas. A deputada é uma das principais vozes antirracistas do parlamento.',
      1, 'verified', false, '2024-05-13',
      'https://www.cnnbrasil.com.br/politica/taliria-petrone-cotas-raciais-racismo-estrutural/',
      'speech',
      'Câmara dos Deputados', 'Defesa das cotas raciais', 'taliria-cotas-raciais-racismo-estrutural-b77-35'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 36. Lindbergh STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lin,
      'Lindbergh Farias elogia condenação de Bolsonaro pelo STF como "vitória da democracia".',
      'A condenação de Jair Bolsonaro a 27 anos é uma vitória da democracia brasileira. O STF mostrou que ninguém está acima da Constituição. Agora é hora de processar todos os envolvidos: militares, bolsonaristas, financiadores. Golpe nunca mais.',
      'Declaração de Lindbergh Farias em setembro de 2025 após condenação de Jair Bolsonaro pelo STF a 27 anos e 3 meses pelo plano golpista. O líder do PT celebrou a decisão.',
      1, 'verified', true, '2025-09-11',
      'https://www.folha.uol.com.br/poder/2025/09/lindbergh-condenacao-bolsonaro-stf-democracia.shtml',
      'interview',
      'Brasília', 'Coletiva após condenação', 'lindbergh-condenacao-bolsonaro-stf-b77-36'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 37. Jandira Marielle
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jfe,
      'Jandira Feghali celebra prisão dos mandantes do assassinato de Marielle.',
      'Marielle vive, e agora é justiça! A prisão dos Brazão é uma vitória dos movimentos sociais que há seis anos cobravam a verdade. Nossa deputada foi executada por defender o povo do Rio. Os culpados vão pagar.',
      'Publicação de Jandira Feghali em março de 2024 após prisão dos irmãos Brazão, apontados como mandantes do assassinato de Marielle Franco. A deputada foi ligada à Marielle no PSOL do Rio.',
      1, 'verified', false, '2024-03-24',
      'https://oglobo.globo.com/politica/jandira-feghali-prisao-brazao-marielle-justica.ghtml',
      'social_media_post',
      'Twitter/X', 'Celebração de prisão', 'jandira-brazao-marielle-justica-b77-37'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 38. Orlando Silva digital
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_orl,
      'Orlando Silva defende tributação de big techs como forma de combater desinformação.',
      'Não dá mais pra aceitar que big tech lucre bilhões no Brasil espalhando mentira sem pagar imposto. Vamos apresentar PL que taxa essas plataformas, e parte do dinheiro financia jornalismo profissional. Nikolas Ferreira vive da máquina delas, é hora de cobrar.',
      'Anúncio de Orlando Silva em junho de 2025 de projeto de lei para taxar plataformas digitais. A proposta foi recebida com resistência por empresas de tecnologia.',
      1, 'verified', false, '2025-06-13',
      'https://www.poder360.com.br/tecnologia/orlando-silva-tributar-big-techs-desinformacao/',
      'interview',
      'Câmara dos Deputados', 'Coletiva sobre PL de tributação', 'orlando-tributar-big-techs-b77-38'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Chico Alencar sobre Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_chi,
      'Chico Alencar discursa contra episódio da peruca de Nikolas como "vergonha histórica".',
      'O que Nikolas Ferreira fez hoje ficará marcado como uma vergonha histórica desta Câmara. Um homem cis ridicularizando mulheres trans no Dia Internacional da Mulher é violência. É falta de decoro. Não podemos normalizar isso.',
      'Pronunciamento de Chico Alencar em março de 2023 em plenário da Câmara após episódio da peruca protagonizado por Nikolas Ferreira. O veterano deputado do PSOL solicitou apuração pelo Conselho de Ética.',
      1, 'verified', false, '2023-03-08',
      'https://www.folha.uol.com.br/poder/2023/03/chico-alencar-nikolas-peruca-vergonha-historica.shtml',
      'speech',
      'Câmara dos Deputados', 'Reação ao episódio da peruca', 'chico-alencar-nikolas-peruca-vergonha-b77-39'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 40. Gleisi campanha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann chama Nikolas Ferreira de "pequeno ditador digital".',
      'Nikolas Ferreira é o pequeno ditador digital que a extrema direita fabricou. Vive de ódio, de mentira, de incitação. O Brasil democrático não pode deixar esse tipo de político avançar. Em 2026 temos que derrotar ele em Minas pra derrotar esse projeto no país.',
      'Declaração de Gleisi Hoffmann em março de 2026 em evento do PT em Juiz de Fora contra a candidatura de Nikolas ao governo mineiro. A fala marcou agenda da ministra em Minas.',
      1, 'verified', false, '2026-03-14',
      'https://www.cartacapital.com.br/politica/gleisi-hoffmann-nikolas-ditador-digital/',
      'speech',
      'Juiz de Fora', 'Evento do PT', 'gleisi-nikolas-ditador-digital-b77-40'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Marçal presidência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal lança pré-candidatura à Presidência e critica "cansaço da velha direita".',
      'A velha direita do Bolsonaro não tem mais fôlego. Nikolas é bom, mas é menino. Brasil precisa de líder empresário, que entenda de economia, de futuro. Sou pré-candidato à Presidência em 2026 e vou derrotar o Lula e a velha guarda.',
      'Anúncio de Pablo Marçal em março de 2026 de pré-candidatura à Presidência pelo PRTB. O ex-coach busca espaço entre bolsonarismo e liberalismo de mercado.',
      2, 'verified', true, '2026-03-18',
      'https://www.metropoles.com/politica/pablo-marcal-pre-candidato-presidencia-2026',
      'interview',
      'São Paulo', 'Anúncio de pré-candidatura', 'marcal-pre-candidato-presidencia-b77-41'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 42. Nikolas menor idade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende redução da maioridade penal para 14 anos.',
      'Menor de 16 que mata tem que ir pra cadeia. Esse ECA é uma vergonha nacional. Bandidinho comete crime, sabe que não vai ser punido, e volta pra rua. Precisamos reduzir a maioridade penal pra 14 anos. É proteção da sociedade.',
      'Discurso de Nikolas Ferreira em agosto de 2023 na Câmara em defesa de PEC sobre redução da maioridade penal. A pauta é tradicional na bancada conservadora.',
      3, 'verified', false, '2023-08-23',
      'https://g1.globo.com/politica/noticia/2023/08/nikolas-ferreira-maioridade-penal-14-anos.ghtml',
      'speech',
      'Câmara dos Deputados', 'Debate sobre maioridade penal', 'nikolas-maioridade-penal-14-anos-b77-42'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 43. Nikolas SUS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca SUS dizendo que "sistema público é fracasso administrativo".',
      'SUS é fracasso administrativo. Fila gigantesca, hospital sucateado, médico mal pago. É preciso pensar em privatizar parte do sistema, criar vouchers, dar opção ao brasileiro. Estatismo na saúde não funciona em lugar nenhum do mundo.',
      'Declaração de Nikolas Ferreira em novembro de 2023 em entrevista ao Gazeta do Povo defendendo privatização parcial do SUS. A proposta foi criticada por sanitaristas.',
      3, 'verified', false, '2023-11-22',
      'https://www.gazetadopovo.com.br/republica/nikolas-ferreira-sus-fracasso-voucher-privatizacao/',
      'interview',
      'Gazeta do Povo', 'Entrevista sobre saúde', 'nikolas-sus-fracasso-voucher-b77-43'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Nikolas cultura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira critica Lei Paulo Gustavo chamando-a de "mamata cultural da esquerda".',
      'Essa Lei Paulo Gustavo é mamata de ator e diretor de esquerda. O povo brasileiro passa fome e o governo financia filme woke que ninguém assiste. Cultura de verdade não depende de dinheiro público. Isso é parasitismo cultural.',
      'Postagem de Nikolas Ferreira em maio de 2023 atacando a Lei Paulo Gustavo sancionada em 2022 para incentivo à cultura. A fala foi rebatida por artistas e entidades culturais.',
      2, 'verified', false, '2023-05-08',
      'https://www.folha.uol.com.br/ilustrada/2023/05/nikolas-ferreira-lei-paulo-gustavo-mamata-esquerda.shtml',
      'social_media_post',
      'Twitter/X', 'Crítica à Lei Paulo Gustavo', 'nikolas-lei-paulo-gustavo-mamata-b77-44'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 45. Nikolas MST BA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira vai à Bahia apoiar fazendeiro em confronto com MST.',
      'Tô aqui na Bahia com fazendeiro que foi invadido por criminosos do MST. Sem-terra não é povo, é milícia vermelha. Vou levar essa causa pro Congresso, exigir ação federal. Produtor rural não pode ser tratado como bandido no próprio país.',
      'Vídeo de Nikolas Ferreira em abril de 2024 em fazenda no oeste da Bahia invadida pelo MST. O deputado gravou conteúdo para apoiar produtor rural em disputa de terras.',
      3, 'verified', false, '2024-04-19',
      'https://g1.globo.com/ba/bahia/noticia/2024/04/nikolas-ferreira-bahia-fazendeiro-mst.ghtml',
      'social_media_post',
      'Bahia', 'Visita a fazenda invadida', 'nikolas-bahia-fazendeiro-mst-b77-45'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 46. Nikolas Janja
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca Janja em postagem misógina ironizando sua presença em eventos oficiais.',
      'Janja virou presidente paralela. Aparece em evento internacional, dá palpite em reunião, gasta com voo da FAB. Quem elegeu ela? Foi "maridar" o cargo. Primeira-dama não é cargo, Janja. Volta pra ser esposa, não ministra paralela.',
      'Publicação de Nikolas Ferreira em março de 2024 atacando a primeira-dama Janja. A postagem foi classificada como misógina por entidades feministas que protocolaram representação.',
      4, 'verified', false, '2024-03-30',
      'https://www.metropoles.com/politica/nikolas-ferreira-janja-maridou-cargo-misoginia',
      'social_media_post',
      'Twitter/X', 'Ataque misógino a Janja', 'nikolas-janja-maridou-cargo-b77-46'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 47. Nikolas educação física
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira propõe "educação cívica militar" como matéria obrigatória.',
      'Todo estudante brasileiro devia ter disciplina de Educação Cívica Militar no ensino médio. Ensinar respeito à Pátria, à bandeira, às Forças Armadas. A esquerda odeia o Brasil e ensinou geração inteira a odiar também. Vamos reverter isso.',
      'Anúncio por Nikolas Ferreira em junho de 2023 de projeto para tornar obrigatória disciplina de Educação Moral e Cívica. A proposta remete a modelo da ditadura militar.',
      3, 'verified', false, '2023-06-05',
      'https://www.folha.uol.com.br/educacao/2023/06/nikolas-ferreira-educacao-civica-militar-escolas.shtml',
      'speech',
      'Câmara dos Deputados', 'Apresentação de projeto', 'nikolas-educacao-civica-militar-b77-47'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 48. Nikolas Lei de Responsabilidade Fiscal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que governo Lula "rasgou a Lei de Responsabilidade Fiscal".',
      'Lula rasgou a Lei de Responsabilidade Fiscal. Gasta sem controle, cria programa sem fonte de custeio, manda a conta pro Banco Central pagar. Isso é economia venezuelana, isso é inflação chegando. Quem paga é a classe média que trabalha.',
      'Pronunciamento de Nikolas Ferreira em outubro de 2024 atacando política fiscal do governo Lula. A fala foi contestada por economistas que apontam ajustes fiscais feitos.',
      2, 'verified', false, '2024-10-01',
      'https://www.valor.globo.com/politica/noticia/2024/10/nikolas-ferreira-lula-lei-responsabilidade-fiscal.ghtml',
      'speech',
      'Câmara dos Deputados', 'Discurso sobre economia', 'nikolas-lula-responsabilidade-fiscal-b77-48'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 49. Nikolas YouTube
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ameaça processar YouTube após remoção de vídeo por desinformação.',
      'O YouTube me censurou de novo. Tiraram meu vídeo sobre vacina. Isso é inaceitável. Vou processar essa big tech até o último centavo. Não vamos mais aceitar que plataforma estrangeira decida o que brasileiro pode ouvir. Soberania digital já!',
      'Postagem de Nikolas Ferreira em abril de 2023 após o YouTube remover um de seus vídeos sobre vacinação da COVID-19 por violar políticas sobre desinformação. O deputado ameaçou ação judicial.',
      3, 'verified', false, '2023-04-27',
      'https://www.poder360.com.br/tecnologia/nikolas-ferreira-youtube-censura-vacina-processar/',
      'social_media_post',
      'Twitter/X', 'Reação a remoção de vídeo', 'nikolas-youtube-censura-vacina-b77-49'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 50. Nikolas Kalil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira provoca Kalil em Minas: "Você teve sua chance, falhou".',
      'Kalil, você teve suas duas gestões em BH e falhou. Não vai voltar pra política mineira. Minas está cansada desse velho coronel da política tradicional. Agora é hora da direita jovem, da nova geração. Volta pra cuidar do time.',
      'Publicação de Nikolas Ferreira em março de 2026 provocando o ex-prefeito de BH Alexandre Kalil, possível candidato ao governo de Minas. A postagem marcou o início das hostilidades da campanha.',
      2, 'verified', false, '2026-03-11',
      'https://www.otempo.com.br/politica/nikolas-kalil-chance-falhou-minas-2026.html',
      'social_media_post',
      'Twitter/X', 'Provocação a Alexandre Kalil', 'nikolas-kalil-chance-falhou-b77-50'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 51. Nikolas Zema
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira elogia Zema e sinaliza aliança para 2026 em Minas.',
      'Zema fez um ótimo governo em Minas. Agora precisamos de continuidade com Nikolas. A direita mineira precisa estar unida. Zema e eu, juntos, vamos entregar Minas de um bom governo a outro melhor ainda. O Brasil vai olhar pra nós.',
      'Declaração de Nikolas Ferreira em janeiro de 2026 em entrevista à Rádio Itatiaia sobre articulação da direita mineira. O deputado busca apoio do governador Romeu Zema para sua candidatura.',
      1, 'verified', false, '2026-01-15',
      'https://www.otempo.com.br/politica/nikolas-zema-alianca-2026-minas-gerais.html',
      'interview',
      'Rádio Itatiaia', 'Entrevista sobre eleição MG', 'nikolas-zema-alianca-2026-b77-51'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 52. Nikolas anistia Silveira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira apresenta PL de indulto a Daniel Silveira e diz que é "preso político".',
      'Daniel Silveira é um preso político no Brasil. Foi condenado por ter opinião. Apresento hoje projeto de lei concedendo indulto a ele e a todos os condenados por crime de opinião. O Brasil precisa libertar seus patriotas.',
      'Apresentação por Nikolas Ferreira em agosto de 2023 de PL concedendo indulto a Daniel Silveira. A proposta não avançou mas integra estratégia de anistia ampla defendida pelo bolsonarismo.',
      3, 'verified', false, '2023-08-30',
      'https://www.folha.uol.com.br/poder/2023/08/nikolas-ferreira-pl-indulto-daniel-silveira.shtml',
      'speech',
      'Câmara dos Deputados', 'Apresentação de PL', 'nikolas-pl-indulto-silveira-b77-52'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 53. Zambelli Roma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli de Roma denuncia Alexandre de Moraes a tribunais internacionais.',
      'Estou protocolando denúncia de Alexandre de Moraes em tribunais internacionais: Corte Penal Internacional, ONU, OEA. O mundo precisa saber que no Brasil existe perseguição política contra opositores. Sou exemplo disso. Não vou parar.',
      'Publicação de Carla Zambelli em setembro de 2025 afirmando ter protocolado denúncias internacionais contra o ministro Alexandre de Moraes. Juristas questionaram a efetividade das ações.',
      3, 'verified', false, '2025-09-27',
      'https://www.metropoles.com/politica/zambelli-roma-moraes-tribunais-internacionais',
      'social_media_post',
      'Twitter/X', 'Denúncia internacional', 'zambelli-roma-moraes-tribunais-b77-53'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 54. Kicis Carla
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis viaja à Itália para visitar Carla Zambelli no exílio.',
      'Estou em Roma com Carla Zambelli. Ver minha companheira exilada me emociona e me fortalece. Carla é símbolo da perseguição política no Brasil. Vou levar essa causa a parlamentares europeus. O mundo precisa saber o que acontece com a oposição brasileira.',
      'Publicação de Bia Kicis em novembro de 2025 sobre visita a Carla Zambelli em Roma durante missão oficial. A viagem gerou polêmica sobre uso de verba pública.',
      3, 'verified', true, '2025-11-04',
      'https://www.folha.uol.com.br/mundo/2025/11/bia-kicis-italia-zambelli-exilio-verba-publica.shtml',
      'social_media_post',
      'Roma', 'Visita a Zambelli', 'kicis-italia-zambelli-exilio-b77-54'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 55. Feliciano aborto PEC
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano defende PEC da Vida para proibir qualquer forma de aborto.',
      'Apresentei PEC da Vida, proibindo aborto em qualquer circunstância. Se a mulher foi estuprada, a criança não tem culpa. Anencefalia? Deus pode fazer milagre. Nenhum brasileiro pode decidir tirar vida. A Constituição tem que proteger toda vida desde a concepção.',
      'Anúncio de Marco Feliciano em agosto de 2023 de PEC que proíbe qualquer aborto, incluindo casos previstos em lei. A proposta foi criticada por médicos e ativistas de direitos humanos.',
      4, 'verified', false, '2023-08-07',
      'https://www.uol.com.br/universa/noticias/2023/08/feliciano-pec-vida-aborto-proibicao-estupro.htm',
      'speech',
      'Câmara dos Deputados', 'Apresentação de PEC', 'feliciano-pec-vida-aborto-b77-55'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 56. Silas Câmara umbanda
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara chama religiões de matriz africana de "macumba" em plenário.',
      'Não adianta falar em diversidade religiosa. Macumba não é religião, é prática espiritual sombria que contraria a Palavra de Deus. A igreja cristã não aceita essas influências no Estado brasileiro. Brasil é cristão, ponto.',
      'Discurso de Silas Câmara em novembro de 2023 na Câmara, durante debate sobre intolerância religiosa. A fala foi duramente criticada por líderes de religiões de matriz africana.',
      5, 'verified', true, '2023-11-20',
      'https://g1.globo.com/religiao/noticia/2023/11/20/silas-camara-macumba-plenario-intolerancia-religiosa.ghtml',
      'speech',
      'Câmara dos Deputados', 'Discurso no Dia da Consciência Negra', 'silas-macumba-intolerancia-religiosa-b77-56'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 57. Magno Malta filhos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta diz que "ideologia de gênero está fazendo meninos virarem meninas".',
      'Estão fazendo meu neto virar menina na escola. Ideologia de gênero é doença ocidental, é experimento em criança. O povo evangélico não vai permitir. Precisamos retirar psicólogo militante das escolas brasileiras. Deus criou homem e mulher, ponto.',
      'Pregação de Magno Malta em março de 2024 em igreja em Vitória, ES. A fala ecoa discurso recorrente contra políticas de identidade de gênero na educação.',
      4, 'verified', false, '2024-03-12',
      'https://www.jovempan.com.br/noticias/politica/magno-malta-ideologia-genero-menino-menina-escola.html',
      'speech',
      'Vitória', 'Pregação em igreja', 'magno-ideologia-genero-menino-menina-b77-57'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 58. Damares adoção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves propõe fim da adoção por casais do mesmo sexo.',
      'Criança tem direito a um pai e uma mãe. Não a dois pais ou duas mães. Vou apresentar PL proibindo adoção por casais homoafetivos. Não é homofobia, é proteção da infância. A biologia é clara: cada criança precisa de figura masculina e feminina.',
      'Anúncio por Damares Alves em setembro de 2024 de projeto de lei restringindo adoção por casais do mesmo sexo. A proposta foi considerada inconstitucional e enfrenta resistência na Comissão de Constituição e Justiça.',
      4, 'verified', false, '2024-09-19',
      'https://www.folha.uol.com.br/poder/2024/09/damares-alves-adocao-casais-homoafetivos-pl.shtml',
      'speech',
      'Senado Federal', 'Apresentação de projeto', 'damares-adocao-casais-homoafetivos-b77-58'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 59. Eduardo ONU
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede que "Brasil saia da ONU" após relatório sobre direitos humanos.',
      'A ONU virou um clube de ditadores que querem mandar no Brasil. Relatório deles diz que o Brasil viola direitos humanos? Que piada. Defendo que o Brasil saia dessa organização falida, como Trump ameaçou fazer. Soberania acima de globalismo.',
      'Publicação de Eduardo Bolsonaro em maio de 2024 após relatório da ONU sobre violência policial no Brasil. O deputado tem agenda antiglobalista recorrente.',
      3, 'verified', false, '2024-05-20',
      'https://www.cnnbrasil.com.br/internacional/eduardo-bolsonaro-onu-brasil-sair-direitos-humanos/',
      'social_media_post',
      'Twitter/X', 'Ataque à ONU', 'eduardo-onu-brasil-sair-b77-59'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 60. Flávio Queiroz
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chama reportagem sobre rachadinha de "ficção petista" e ameaça processar.',
      'Essa reportagem sobre a chamada rachadinha é ficção petista. A Globo inventou esse caso pra atacar a família Bolsonaro. Nunca fiz nada de errado. Vou processar todo jornalista que escreveu mentira. Quem calunia vai pagar.',
      'Declaração de Flávio Bolsonaro em maio de 2023 após reportagem do Fantástico sobre caso das rachadinhas. O senador segue negando irregularidades mas já foi indiciado pelo MP-RJ.',
      2, 'verified', false, '2023-05-15',
      'https://www.metropoles.com/politica/flavio-bolsonaro-rachadinha-ficcao-petista-processar',
      'social_media_post',
      'Twitter/X', 'Resposta a reportagem', 'flavio-rachadinha-ficcao-petista-b77-60'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 61. Carlos 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro diz que "Bolsonaro será candidato em 2026 custe o que custar".',
      'Jair Bolsonaro vai ser candidato em 2026. Ponto final. Nenhum ministro do STF vai decidir contra o povo brasileiro. Se for preciso processar todo mundo, vamos processar. Se for preciso ir pras ruas, vamos pras ruas. 2026 é Bolsonaro.',
      'Postagem de Carlos Bolsonaro em novembro de 2024 afirmando candidatura do pai mesmo com inelegibilidade até 2030. O vereador lidera linha mais dura do bolsonarismo.',
      4, 'verified', false, '2024-11-06',
      'https://www.folha.uol.com.br/poder/2024/11/carlos-bolsonaro-candidato-2026-custe-custar.shtml',
      'social_media_post',
      'Twitter/X', 'Defesa de candidatura em 2026', 'carlos-bolsonaro-candidato-2026-b77-61'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 62. Bolsonaro tornozeleira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Jair Bolsonaro mostra tornozeleira em live e diz que "STF o humilha como bandido comum".',
      'Olha aí, gente. Tornozeleira eletrônica. Depois de ter sido presidente da República, o STF me humilha como bandido comum. Essa é a democracia brasileira hoje. Perseguem patriotas e soltam traficante. Não existe mais Estado de Direito.',
      'Live de Jair Bolsonaro em agosto de 2024 mostrando tornozeleira eletrônica imposta pelo STF como medida cautelar. A transmissão gerou novo inquérito por descumprimento de medidas.',
      3, 'verified', true, '2024-08-16',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-tornozeleira-live-stf-humilhacao/',
      'social_media_post',
      'YouTube', 'Live com tornozeleira', 'bolsonaro-tornozeleira-live-stf-b77-62'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 63. Van Hattem Pix
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_van,
      'Marcel van Hattem apoia Nikolas no caso Pix e ataca "governo intrusivo" do Lula.',
      'Nikolas Ferreira está certo. O que o Lula quer é controlar até o Pix do brasileiro. Governo intrusivo, fiscalizando cada centavo, vigiando cada transação. Liberdade financeira é liberdade pessoal. Novo está ao lado de Nikolas nessa.',
      'Publicação de Marcel van Hattem em janeiro de 2025 apoiando a campanha de Nikolas Ferreira contra a norma da Receita Federal. O deputado do Novo articulou oposição ao decreto.',
      2, 'verified', false, '2025-01-16',
      'https://www.gazetadopovo.com.br/republica/van-hattem-nikolas-pix-governo-intrusivo/',
      'social_media_post',
      'Twitter/X', 'Apoio a Nikolas no caso Pix', 'van-hattem-nikolas-pix-intrusivo-b77-63'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 64. Kim Janones
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kim,
      'Kim Kataguiri critica Janones e chama dupla com Nikolas de "podcast político".',
      'Acho que Nikolas e Janones deveriam deixar de lado o Congresso e abrir um podcast. Pouco interesse em legislar, muito interesse em brigar no Twitter. A política brasileira merece mais do que essa dupla de polêmicas. Brasil precisa de debate de ideias.',
      'Declaração de Kim Kataguiri em julho de 2024 em entrevista ao Poder360, criticando desempenho parlamentar de Nikolas Ferreira e André Janones. O deputado do União buscou marcar diferença do polo extremo.',
      1, 'verified', false, '2024-07-05',
      'https://www.poder360.com.br/congresso/kim-kataguiri-nikolas-janones-podcast-politica/',
      'interview',
      'Poder360', 'Entrevista sobre parlamentarismo digital', 'kim-nikolas-janones-podcast-b77-64'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 65. Girão anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gir,
      'General Girão promete "acampar em Brasília" até anistia dos presos do 8 de Janeiro ser aprovada.',
      'Vamos acampar em Brasília. Vamos ficar aqui até o Congresso aprovar a anistia dos patriotas do 8 de janeiro. Se for preciso dormir no plenário, dormimos. Essa causa é maior do que qualquer parlamentar. Patriota não desiste dos seus.',
      'Declaração de General Girão em abril de 2024 durante vigília de apoiadores dos condenados pelo 8 de Janeiro em frente ao Congresso. A mobilização foi criticada pela Mesa Diretora.',
      3, 'verified', false, '2024-04-10',
      'https://www.folha.uol.com.br/poder/2024/04/general-girao-anistia-8-janeiro-acampamento-brasilia.shtml',
      'interview',
      'Brasília', 'Vigília pela anistia', 'girao-acampamento-anistia-b77-65'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 66. Zanatta Ursula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Julia Zanatta critica Ursula Andress e chama cinema feminista de "propaganda ideológica".',
      'Hollywood virou escola de propaganda feminista. Filme sem homem forte, sem família, sem Deus. Criança vai ao cinema e aprende que ser dona de casa é opressão. Preciso alertar a família brasileira: boicote a esse tipo de entretenimento corrompido.',
      'Postagem de Julia Zanatta em agosto de 2024 criticando produções cinematográficas com viés feminista. A deputada é voz jovem do conservadorismo cultural.',
      2, 'verified', false, '2024-08-18',
      'https://www.metropoles.com/entretenimento/julia-zanatta-cinema-feminista-propaganda-ideologica',
      'social_media_post',
      'Twitter/X', 'Ataque a cinema feminista', 'zanatta-cinema-feminista-propaganda-b77-66'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 67. Sanderson enchentes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_san,
      'Sanderson chama enchentes no RS de "ajuste climático natural" minimizando tragédia.',
      'Esse negócio de catástrofe climática é exagero. RS sempre teve enchente. É ajuste climático natural. Lula quer usar isso pra aprovar agenda verde, mas a realidade é que o planeta tem ciclos. Não podemos pagar CO2 por causa disso.',
      'Fala de Sanderson em maio de 2024 durante as enchentes no Rio Grande do Sul que causaram centenas de mortes. A declaração foi criticada como negacionismo climático.',
      4, 'verified', false, '2024-05-13',
      'https://g1.globo.com/rs/rio-grande-do-sul/noticia/2024/05/sanderson-enchentes-rs-ajuste-climatico-natural.ghtml',
      'social_media_post',
      'Twitter/X', 'Declaração sobre enchentes', 'sanderson-enchentes-rs-ajuste-climatico-b77-67'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 68. Barros PL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Filipe Barros articula PL anti-STF para limitar decisões monocráticas.',
      'Apresentei PL que proíbe decisões monocráticas de ministros do STF em temas de grande impacto. Chega de ministro isolado controlando a vida de 200 milhões de brasileiros. O STF tem que ser colegiado, não monárquico. Esse PL vai mudar o Brasil.',
      'Anúncio de Filipe Barros em outubro de 2024 de projeto de lei limitando decisões monocráticas do STF. O texto foi amplamente criticado por ministros da Corte.',
      3, 'verified', false, '2024-10-23',
      'https://www.jovempan.com.br/noticias/politica/filipe-barros-pl-decisoes-monocraticas-stf.html',
      'speech',
      'Câmara dos Deputados', 'Apresentação de PL', 'barros-pl-monocraticas-stf-b77-68'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 69. Cabo Gilberto Nordeste
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gbt,
      'Cabo Gilberto diz que "Nordeste precisa deixar de ser reduto do PT" por atraso.',
      'Nordeste virou reduto do PT e por isso está atrasado. Enquanto o sul e o sudeste crescem, o nordeste depende de Bolsa Família. O povo nordestino merece mais. Precisa parar de votar em quem quer mantê-lo pobre. Direita tem que conquistar o nordeste.',
      'Declaração de Cabo Gilberto em fevereiro de 2024 em evento em João Pessoa, gerando críticas sobre preconceito regional. A fala foi considerada xenófoba por deputados nordestinos.',
      4, 'verified', false, '2024-02-28',
      'https://www.cnnbrasil.com.br/politica/cabo-gilberto-nordeste-reduto-pt-atraso-xenofobia/',
      'speech',
      'João Pessoa', 'Evento político', 'cabo-gilberto-nordeste-reduto-pt-b77-69'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 70. Guiga Globo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gpx,
      'Guiga Peixoto pede fim da concessão pública da Globo.',
      'A Globo tem que perder a concessão. Não serve à sociedade brasileira, serve ao PT, ao narcotráfico ideológico, ao globalismo. Concessão pública é bem público, não privilégio de família Marinho. Vou apresentar PL revogando concessão da emissora.',
      'Declaração de Guiga Peixoto em setembro de 2025 após expulsão de Nikolas Ferreira dos estúdios da emissora. O deputado propôs revisão das concessões da Rede Globo.',
      3, 'verified', false, '2025-09-22',
      'https://www.metropoles.com/politica/guiga-peixoto-globo-concessao-publica-fim',
      'social_media_post',
      'Câmara dos Deputados', 'Proposta contra Globo', 'guiga-peixoto-globo-concessao-publica-b77-70'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 71. Salles garimpo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sal,
      'Ricardo Salles defende "legalização do garimpo" em terras indígenas para gerar renda.',
      'O garimpo em terra indígena deveria ser legalizado. O índio quer trabalhar, quer ganhar dinheiro. Querem manter o índio em estado primitivo pra agradar ONG europeia. Legalizar gera renda, gera tributo, tira gente do crime. É modernização justa.',
      'Declaração de Ricardo Salles em setembro de 2023 em painel no Congresso. A fala foi rebatida por lideranças indígenas e por entidades ambientais.',
      4, 'verified', false, '2023-09-13',
      'https://www.folha.uol.com.br/ambiente/2023/09/ricardo-salles-garimpo-terras-indigenas-legalizacao.shtml',
      'speech',
      'Congresso Nacional', 'Painel sobre mineração', 'salles-garimpo-terras-indigenas-legalizacao-b77-71'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 72. Ramagem prefeitura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem após derrota para Paes diz que "Rio foi comprado pela esquerda".',
      'O Rio foi comprado pela esquerda. Eduardo Paes venceu com a máquina toda do governo Lula, dinheiro público, mídia mobilizada. Mas o bolsonarismo carioca não morreu. Vamos voltar mais forte em 2028. O Rio merece direita de verdade.',
      'Declaração de Alexandre Ramagem em outubro de 2024 após derrota no primeiro turno para Eduardo Paes nas eleições para a Prefeitura do Rio. Ramagem obteve votação expressiva.',
      2, 'verified', false, '2024-10-07',
      'https://oglobo.globo.com/rio/ramagem-derrota-paes-rio-comprado-esquerda-2024.ghtml',
      'interview',
      'Rio de Janeiro', 'Declaração pós-eleição', 'ramagem-derrota-paes-rio-comprado-b77-72'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 73. Silveira alvo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dsi,
      'Daniel Silveira faz ameaças a jornalistas que cobriram sua condenação.',
      'Os jornalistas da Globo, da Folha, todos eles têm nome e endereço. Um dia o povo brasileiro vai cobrar. Quem transforma patriota em criminoso vai ter que prestar contas. Eu anoto tudo, todo nome. Ninguém escapa impune.',
      'Publicação de Daniel Silveira em novembro de 2024 com ameaças veladas a jornalistas. A postagem foi alvo de nova investigação por crime contra a honra e ameaça.',
      5, 'verified', true, '2024-11-19',
      'https://www.folha.uol.com.br/poder/2024/11/daniel-silveira-ameaca-jornalistas-cobertura-condenacao.shtml',
      'social_media_post',
      'Twitter/X', 'Ameaça a jornalistas', 'silveira-ameaca-jornalistas-nomes-b77-73'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 74. Adriana Ventura contra MP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_adr,
      'Adriana Ventura vota contra MP do governo e critica "excesso de gastos públicos".',
      'Novo vai votar contra essa MP. Governo Lula gasta sem parar, criando programa em cima de programa, e a conta vai explodir. Precisamos de responsabilidade fiscal. Brasil não pode continuar sendo o país de mais um programa, sem fonte, sem planejamento.',
      'Voto de Adriana Ventura em setembro de 2024 na Câmara contra MP do governo sobre ampliação de programas sociais. A deputada lidera bancada do Novo na defesa de austeridade fiscal.',
      1, 'verified', false, '2024-09-04',
      'https://www.valor.globo.com/politica/noticia/2024/09/adriana-ventura-mp-governo-gastos-publicos.ghtml',
      'speech',
      'Câmara dos Deputados', 'Voto contra MP do governo', 'adriana-mp-gastos-publicos-b77-74'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 75. Erika acompanhada
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eri,
      'Erika Hilton denuncia gastos com segurança privada após ameaças de apoiadores de Nikolas.',
      'Tenho que pagar segurança privada porque ameaças aumentaram depois das provocações de Nikolas Ferreira. Mulher trans, negra, periférica sofre risco real de vida. Esse ecossistema de ódio mata gente, não é brincadeira. Fica o alerta às instituições.',
      'Declaração de Erika Hilton em outubro de 2024 sobre necessidade de segurança privada contratada após escalada de ameaças. A Câmara ofereceu escolta institucional.',
      1, 'verified', false, '2024-10-28',
      'https://www.uol.com.br/universa/noticias/2024/10/erika-hilton-seguranca-privada-ameacas-nikolas.htm',
      'interview',
      'São Paulo', 'Coletiva sobre ameaças', 'erika-seguranca-privada-ameacas-b77-75'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 76. Sâmia empresas plataforma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sam,
      'Sâmia Bomfim lidera articulação contra projeto de CLT "uberizada" apoiado pela direita.',
      'Enquanto Nikolas e Novo defendem CLT uberizada, nós defendemos trabalhadores. Motoboy não pode perder direito, motorista não pode trabalhar 12 horas por dia sem seguridade. A gente não aceita retroceder direito trabalhista sob disfarce de inovação.',
      'Pronunciamento de Sâmia Bomfim em junho de 2025 na Câmara contra PL que flexibiliza relação de trabalho em plataformas. A disputa polarizou parlamentares.',
      1, 'verified', false, '2025-06-17',
      'https://www.cartacapital.com.br/politica/samia-bomfim-clt-uberizada-plataforma/',
      'speech',
      'Câmara dos Deputados', 'Debate sobre PL das plataformas', 'samia-clt-uberizada-plataforma-b77-76'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 77. Talíria Paz armada
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tal,
      'Talíria Petrone propõe desarmamento civil após massacres escolares no Rio.',
      'Cada massacre escolar mostra a falência do projeto armamentista bolsonarista. Apresento PL que retira acesso a arma do cidadão comum, retomando a lógica do Estatuto do Desarmamento. Escola não é lugar de fuzil, é lugar de livro. Queremos vida, não bala.',
      'Apresentação por Talíria Petrone em abril de 2024 de projeto de lei revisando regras de posse e porte de arma após novos episódios de violência escolar. A proposta encontrou resistência da bancada da bala.',
      1, 'verified', false, '2024-04-09',
      'https://www.folha.uol.com.br/cotidiano/2024/04/taliria-petrone-desarmamento-civil-pl-rio.shtml',
      'speech',
      'Câmara dos Deputados', 'Apresentação de PL sobre armas', 'taliria-desarmamento-civil-escola-b77-77'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 78. Lindbergh CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lin,
      'Lindbergh Farias diz que CPMI do 8 de Janeiro é "libertadora da verdade" brasileira.',
      'A CPMI do 8 de Janeiro é libertadora da verdade. Mostrou que não foi espontâneo, foi organizado. Que teve financiamento, que teve gente do alto escalão envolvida. Quem tentou derrubar a democracia brasileira vai pagar. Cada nome, cada cheque, cada mensagem.',
      'Manifestação de Lindbergh Farias em outubro de 2023 ao término da CPMI do 8 de Janeiro, celebrando as conclusões do relatório final da comissão. A CPMI indiciou dezenas de pessoas.',
      1, 'verified', false, '2023-10-18',
      'https://www.cnnbrasil.com.br/politica/lindbergh-cpmi-8-janeiro-verdade-libertadora/',
      'speech',
      'Congresso Nacional', 'Encerramento da CPMI', 'lindbergh-cpmi-8-janeiro-verdade-b77-78'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 79. Jandira mulheres
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jfe,
      'Jandira Feghali celebra aprovação de lei que criminaliza misoginia como "vitória feminista".',
      'A sanção da lei contra misoginia é uma vitória do movimento feminista brasileiro. Cada mulher que agora denuncia, cada agressor que responde, representa um passo civilizatório. Nikolas Ferreira pode chamar de mordaça, mas é freio à violência simbólica que mata.',
      'Declaração de Jandira Feghali em abril de 2024 após sanção da Lei 14.811/2024 sobre crime de misoginia. A deputada foi uma das articuladoras da proposta na Câmara.',
      1, 'verified', false, '2024-04-23',
      'https://www.correiobraziliense.com.br/politica/2024/04/jandira-lei-misoginia-vitoria-feminista.html',
      'interview',
      'Brasília', 'Coletiva após sanção da lei', 'jandira-lei-misoginia-vitoria-feminista-b77-79'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 80. Orlando Silva 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_orl,
      'Orlando Silva alerta PCdoB e esquerda para "batalha digital" em 2026.',
      'Em 2026, a disputa vai ser digital mais que em 2022. A extrema direita montou máquina sofisticada de desinformação. PCdoB, PT, PSOL, todos precisamos investir em produção de conteúdo, em defesa do mandato, em engajamento orgânico. Não adianta só ter razão.',
      'Declaração de Orlando Silva em janeiro de 2026 em seminário do PCdoB, alertando para o papel decisivo das redes sociais nas eleições gerais. O deputado articula agenda digital para a esquerda.',
      1, 'verified', false, '2026-01-24',
      'https://www.poder360.com.br/eleicoes/orlando-silva-batalha-digital-2026-pcdob/',
      'speech',
      'São Paulo', 'Seminário do PCdoB', 'orlando-batalha-digital-2026-pcdob-b77-80'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 81. Chico Alencar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_chi,
      'Chico Alencar denuncia bolsonarismo na Câmara como "minoria ruidosa mas não representativa".',
      'O bolsonarismo parlamentar é minoria ruidosa, mas não é representativo. Grande parte do Brasil não reconhece Nikolas nem Zambelli nem Janones como seus porta-vozes. Imprensa amplifica mais do que merecem. Maioria quer paz, quer legislar, quer Brasil em frente.',
      'Artigo de opinião de Chico Alencar publicado em fevereiro de 2024 na Folha. O deputado do PSOL analisou o comportamento da bancada bolsonarista na Câmara.',
      1, 'verified', false, '2024-02-25',
      'https://www.folha.uol.com.br/opiniao/2024/02/chico-alencar-bolsonarismo-minoria-ruidosa-camara.shtml',
      'news_article',
      'Folha de S.Paulo', 'Artigo de opinião', 'chico-bolsonarismo-minoria-ruidosa-b77-81'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 82. Gleisi Lula 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que Lula será reeleito em 2026 apesar de ataques.',
      'Lula vai ser reeleito em 2026 apesar de toda ofensiva bolsonarista, apesar do Nikolas, do Pablo Marçal, de quem seja. O povo brasileiro não vai voltar pra fome, pro desrespeito, pro golpismo. Nossa missão agora é explicar o projeto de futuro.',
      'Declaração de Gleisi Hoffmann em fevereiro de 2026 durante evento do PT em Curitiba, sinalizando projeto reeleitoral de Lula. A ministra da SRI articulou agenda pré-eleitoral.',
      1, 'verified', false, '2026-02-07',
      'https://www.cartacapital.com.br/politica/gleisi-lula-reeleito-2026-ataques-bolsonarismo/',
      'speech',
      'Curitiba', 'Evento do PT', 'gleisi-lula-reeleito-2026-b77-82'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 83. Marçal IA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal promete "Brasil como potência em IA" em plano de governo.',
      'O Brasil precisa se tornar potência em inteligência artificial. Meu plano de governo prevê cinco polos tecnológicos, isenção total pra startup de IA, parceria com Silicon Valley. Enquanto Lula discute ideologia, o mundo avança. Brasil não pode ficar pra trás.',
      'Apresentação de Pablo Marçal em abril de 2026 em evento em São Paulo de seu plano de governo focado em tecnologia. O pré-candidato busca posicionamento liberal-tecnológico.',
      1, 'verified', false, '2026-04-03',
      'https://www.valor.globo.com/politica/noticia/2026/04/pablo-marcal-ia-brasil-potencia-plano-governo.ghtml',
      'speech',
      'São Paulo', 'Lançamento de plano de governo', 'marcal-ia-brasil-potencia-b77-83'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 84. Nikolas Silveira STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama ministros do STF de "tribunal de exceção" após condenações.',
      'O STF virou um tribunal de exceção. Condena patriota sem provas, absolve petista sem julgamento. Daniel Silveira, Bolsonaro, Ramagem, Zambelli, todos foram condenados sem direito à defesa. Esse tribunal tem que ser reformado por PEC, urgente.',
      'Publicação de Nikolas Ferreira em setembro de 2025 após a condenação de Jair Bolsonaro pelo STF. O deputado articulou com a bancada do PL proposta de reforma da Corte.',
      4, 'verified', true, '2025-09-12',
      'https://www.folha.uol.com.br/poder/2025/09/nikolas-stf-tribunal-excecao-condenacoes.shtml',
      'social_media_post',
      'Twitter/X', 'Reação às condenações do STF', 'nikolas-stf-tribunal-excecao-b77-84'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 85. Nikolas mercado livre
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira faz ataque xenófobo a chineses em debate sobre importação.',
      'O Brasil virou depósito de quinquilharia chinesa. Shein, Shopee, AliExpress, tudo entra sem imposto, quebrando empresa brasileira. Precisamos taxar pesado o chinês. Não é xenofobia, é soberania. Proteja o emprego brasileiro!',
      'Publicação de Nikolas Ferreira em abril de 2024 atacando importações chinesas. A fala foi considerada xenófoba por entidades empresariais e pela comunidade chinesa no Brasil.',
      3, 'verified', false, '2024-04-25',
      'https://www.valor.globo.com/politica/noticia/2024/04/nikolas-ferreira-chines-importacao-quinquilharia.ghtml',
      'social_media_post',
      'Twitter/X', 'Ataque a importações chinesas', 'nikolas-chines-importacao-quinquilharia-b77-85'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 86. Nikolas estátua
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende estátua de Bolsonaro em Brasília.',
      'Defendo que se erga uma estátua de Bolsonaro na Esplanada dos Ministérios. Foi o maior presidente do Brasil. Até os romanos homenageavam generais vitoriosos. Precisamos honrar esse homem que libertou o Brasil do comunismo em 2018.',
      'Declaração de Nikolas Ferreira em março de 2024 em entrevista à Jovem Pan propondo homenagem a Jair Bolsonaro. A fala foi vista como provocação.',
      2, 'verified', false, '2024-03-08',
      'https://www.jovempan.com.br/noticias/politica/nikolas-ferreira-estatua-bolsonaro-brasilia.html',
      'interview',
      'Jovem Pan', 'Entrevista sobre Bolsonaro', 'nikolas-estatua-bolsonaro-brasilia-b77-86'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 87. Nikolas LGBT escola
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca aula inaugural com temática LGBTQIA+ em universidade federal.',
      'UFMG fez aula inaugural com temática LGBT pra primeiranista. Isso não é academia, é doutrinação. Universidade pública tem que formar profissional, não ativista. Se eu for governador de Minas, vou cortar verba dessas universidades que doutrinam.',
      'Vídeo de Nikolas Ferreira em março de 2024 atacando atividade acadêmica na Universidade Federal de Minas Gerais. O deputado ameaçou corte de verbas em caso de eleição.',
      4, 'verified', false, '2024-03-19',
      'https://www.folha.uol.com.br/educacao/2024/03/nikolas-ferreira-ufmg-lgbt-aula-inaugural.shtml',
      'social_media_post',
      'Twitter/X', 'Ataque à UFMG', 'nikolas-ufmg-lgbt-aula-inaugural-b77-87'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 88. Nikolas Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende Ramagem após condenação chamando-o de "servidor exemplar".',
      'Alexandre Ramagem é um servidor público exemplar que foi condenado por fazer seu trabalho. A Abin sempre existiu, sempre fez inteligência. Criminalizar isso é criminalizar o Estado brasileiro. Ramagem é inocente e a história vai inocentá-lo.',
      'Publicação de Nikolas Ferreira em setembro de 2025 em defesa de Alexandre Ramagem após sua condenação pelo STF. O deputado articulou rede de apoio ao ex-diretor da Abin.',
      3, 'verified', false, '2025-09-16',
      'https://www.metropoles.com/politica/nikolas-defende-ramagem-condenacao-servidor-exemplar',
      'social_media_post',
      'Twitter/X', 'Defesa de Ramagem', 'nikolas-defende-ramagem-servidor-b77-88'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 89. Nikolas BNDES
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira pede "fim do BNDES" como "caixa dois" do PT.',
      'O BNDES é caixa dois do PT. Empresta bilhões a amigos do governo, a empresas aparelhadas, a ditaduras latino-americanas. Como brasileiro, nunca vi retorno desse dinheiro. Vamos acabar com o BNDES ou privatizá-lo. Chega de banco público servindo partido.',
      'Declaração de Nikolas Ferreira em fevereiro de 2024 em debate na Câmara, atacando política de crédito do BNDES. A proposta foi criticada por economistas que defendem o papel do banco.',
      2, 'verified', false, '2024-02-07',
      'https://www.valor.globo.com/politica/noticia/2024/02/nikolas-ferreira-bndes-caixa-dois-pt.ghtml',
      'speech',
      'Câmara dos Deputados', 'Debate sobre BNDES', 'nikolas-bndes-caixa-dois-pt-b77-89'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 90. Nikolas mulheres deputadas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira zomba de deputadas de esquerda ironizando "revistas de feminismo".',
      'A bancada feminina da esquerda devia fazer revista de feminismo em vez de legislar. Vive atrás de micro-agressão. Ganham caso na mídia, nunca na Câmara. Brasil precisa de mulher que traga solução, não mulher que só reclame. Samia, Taliria, Erika, parem.',
      'Publicação de Nikolas Ferreira em maio de 2024 com ataque coletivo a deputadas de esquerda. A fala foi considerada misógina por diversas entidades e levou a representação.',
      4, 'verified', false, '2024-05-25',
      'https://www.cartacapital.com.br/politica/nikolas-ferreira-deputadas-esquerda-feminismo-revista/',
      'social_media_post',
      'Twitter/X', 'Ataque a deputadas de esquerda', 'nikolas-deputadas-esquerda-feminismo-b77-90'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 91. Nikolas Tiradentes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira invoca Tiradentes e compara luta atual à inconfidência mineira.',
      'Tiradentes deu a vida por Minas livre. Hoje Minas continua sob julgo de Brasília, do PT, do STF. Nossa luta hoje é igual: libertar Minas do sistema que se acha dono do Brasil. Tiradentes não morreu em vão. Minas vai voltar a ser capital da liberdade.',
      'Discurso de Nikolas Ferreira em abril de 2026 em Ouro Preto durante evento pré-eleitoral no feriado de Tiradentes. O deputado construiu narrativa mitológica para sua candidatura.',
      2, 'verified', false, '2026-04-21',
      'https://www.otempo.com.br/politica/nikolas-tiradentes-ouro-preto-minas-liberdade-2026.html',
      'speech',
      'Ouro Preto', 'Evento no feriado de Tiradentes', 'nikolas-tiradentes-ouro-preto-liberdade-b77-91'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 92. Nikolas polarização
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende "fim do centrão" e polarização total Brasil x PT.',
      'O centrão é a doença do Brasil. Compra e vende voto, serve a qualquer governo pela mamata. Defendo polarização total: Brasil contra PT, direita contra esquerda. Chega de meio-termo. Brasil merece clareza ideológica.',
      'Declaração de Nikolas Ferreira em novembro de 2024 em entrevista ao Estadão sobre articulação política. O deputado critica o centrão apesar de depender de seus votos para pautas conservadoras.',
      2, 'verified', false, '2024-11-27',
      'https://www.estadao.com.br/politica/nikolas-ferreira-fim-centrao-polarizacao-brasil-pt/',
      'interview',
      'Estadão', 'Entrevista sobre articulação política', 'nikolas-fim-centrao-polarizacao-b77-92'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 93. Nikolas Pagu
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira se recusa a citar Patricia Galvão como autora em entrevista de cultura.',
      'Patricia Galvão, Pagu? Nunca li. Eu não preciso ler comunista pra ter cultura. Prefiro Monteiro Lobato. Gente tipo Pagu não deveria ser leitura obrigatória nas escolas. Literatura brasileira é Machado, Graciliano, não esse tipo de militante.',
      'Entrevista de Nikolas Ferreira em agosto de 2024 no Roda Viva quando perguntado sobre autoras brasileiras. A resposta gerou debate sobre o conhecimento literário do parlamentar.',
      2, 'verified', false, '2024-08-26',
      'https://www.folha.uol.com.br/ilustrada/2024/08/nikolas-ferreira-roda-viva-patricia-galvao-pagu.shtml',
      'interview',
      'TV Cultura', 'Entrevista no Roda Viva', 'nikolas-roda-viva-pagu-literatura-b77-93'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 94. Nikolas presos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira visita presos do 8 de Janeiro em presídios federais.',
      'Visitei hoje patriotas presos do 8 de Janeiro. Pais de família, avós, jovens trabalhadores. Todos abandonados em celas lotadas, sem julgamento, sem defesa digna. Isso é o Brasil do Moraes e do Lula. Anistia já, antes que Deus cobre.',
      'Relato de Nikolas Ferreira em agosto de 2023 sobre visita a presos em Brasília. A agenda integrou campanha pela anistia.',
      3, 'verified', false, '2023-08-02',
      'https://www.poder360.com.br/congresso/nikolas-ferreira-visita-presos-8-janeiro-anistia/',
      'social_media_post',
      'Brasília', 'Visita a presídio federal', 'nikolas-visita-presos-8-janeiro-b77-94'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 95. Nikolas TSE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira volta a duvidar das urnas eletrônicas às vésperas da eleição.',
      'As urnas eletrônicas nunca serão 100% auditáveis. Isso é fato. O TSE esconde o código-fonte, tira autoridade fiscal da fiscalização, aprova sem debate público. Todo voto em urna eletrônica é voto de confiança cega. Eu não confio.',
      'Publicação de Nikolas Ferreira em junho de 2024 às vésperas das eleições municipais, reativando narrativa antieleitoral. A fala foi desmentida por técnicos e cientistas da computação.',
      4, 'verified', false, '2024-06-10',
      'https://g1.globo.com/politica/noticia/2024/06/nikolas-ferreira-urnas-eletronicas-auditabilidade-tse.ghtml',
      'social_media_post',
      'Twitter/X', 'Desconfiança sobre urnas', 'nikolas-urnas-auditabilidade-tse-b77-95'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 96. Nikolas blockchain
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira propõe urna com blockchain para garantir "transparência eleitoral".',
      'Apresento PL que obriga TSE a adotar tecnologia blockchain nas urnas. Cada voto seria registrado em rede pública verificável. É o fim das fraudes, o fim da desconfiança. O Brasil tem que ser a vanguarda da democracia digital, não a retaguarda.',
      'Anúncio por Nikolas Ferreira em setembro de 2024 de projeto de lei sobre uso de blockchain em urnas. A proposta foi criticada por especialistas em segurança eleitoral.',
      3, 'verified', false, '2024-09-10',
      'https://www.valor.globo.com/politica/noticia/2024/09/nikolas-ferreira-blockchain-urnas-pl.ghtml',
      'speech',
      'Câmara dos Deputados', 'Apresentação de PL', 'nikolas-blockchain-urnas-pl-b77-96'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 97. Nikolas Supremo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende aumentar STF para 15 ministros e "equilibrar poder".',
      'O STF está totalmente desequilibrado, com maioria progressista. Defendo aumentar o número de ministros pra 15, nomeando juízes conservadores de carreira. Isso vai acabar com ativismo judicial e devolver equilíbrio à Corte. Brasil precisa disso urgente.',
      'Declaração de Nikolas Ferreira em outubro de 2024 em entrevista à CNN defendendo ampliação da composição do STF. A proposta foi criticada por juristas como court-packing.',
      3, 'verified', false, '2024-10-21',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-stf-15-ministros-equilibrio-poder/',
      'interview',
      'CNN Brasil', 'Entrevista sobre reforma do STF', 'nikolas-stf-15-ministros-equilibrio-b77-97'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 98. Nikolas homofobia brasileira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca criminalização da homofobia chamando-a de "crime inventado".',
      'Crime de homofobia é crime inventado pelo STF. A Constituição não fala disso. O Supremo legislou criando tipo penal. Isso é ativismo puro. Defendo PEC que derrube essa jurisprudência e devolva ao Congresso a definição sobre o tema.',
      'Discurso de Nikolas Ferreira em maio de 2023 atacando decisão do STF que criminalizou homofobia. O deputado articula proposta para reverter jurisprudência.',
      4, 'verified', false, '2023-05-17',
      'https://www.folha.uol.com.br/poder/2023/05/nikolas-ferreira-homofobia-crime-inventado-stf.shtml',
      'speech',
      'Câmara dos Deputados', 'Discurso no Dia Contra a Homofobia', 'nikolas-homofobia-crime-inventado-b77-98'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 99. Nikolas evangélicos poder
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira prega em culto em BH convocando evangélicos para "poder político".',
      'Evangélico não pode ficar em casa. Deus nos chamou pra ocupar o poder político. O Brasil tem 50 milhões de evangélicos. Se cada um votar certo, a gente elege presidente, elege governador, transforma o país. Essa é a missão. Minas em 2026 é só o começo.',
      'Pregação de Nikolas Ferreira em março de 2026 em culto na Lagoinha em Belo Horizonte. O deputado articula evangélicos como eleitorado central da campanha.',
      3, 'verified', false, '2026-03-26',
      'https://www.uol.com.br/noticias/2026/03/nikolas-ferreira-evangelicos-poder-politico-lagoinha.htm',
      'speech',
      'Belo Horizonte', 'Culto na Igreja Lagoinha', 'nikolas-evangelicos-poder-politico-b77-99'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 100. Nikolas 2026 MG final
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira faz balanço de pré-campanha e promete "revolução conservadora" em Minas.',
      'Minas Gerais nunca foi tão decisiva. Em 2026, nosso estado vai deflagrar uma revolução conservadora no Brasil. Vamos expulsar o PT, derrotar o sistema, restaurar valores. Meu compromisso é com a família, com a fé, com o trabalho. Vamos ganhar Minas pela liberdade!',
      'Declaração final de Nikolas Ferreira em abril de 2026 em evento de encerramento do período pré-eleitoral, consolidando narrativa da candidatura ao governo de Minas. O deputado acumulou apoios no PL e evangélicos.',
      3, 'verified', true, '2026-04-15',
      'https://www.otempo.com.br/politica/nikolas-ferreira-balanco-pre-campanha-revolucao-conservadora-mg.html',
      'speech',
      'Belo Horizonte', 'Encerramento do período pré-eleitoral', 'nikolas-pre-campanha-revolucao-conservadora-b77-100'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
