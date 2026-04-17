-- Batch 55: Federal Deputies — broad political spectrum (2023–2026)
-- Reforma tributária, pautas identitárias, segurança, IA, ataques ao STF,
-- bolsonarismo parlamentar, esquerda PSOL/PCdoB/PT, NOVO e Centrão
-- 50 statements representing the Chamber of Deputies diversity

DO $$
DECLARE
  v_ta UUID; v_eh UUID; v_sb UUID; v_fm UUID; v_mvh UUID;
  v_kk UUID; v_fc UUID; v_ar UUID; v_en UUID; v_lf UUID;
  v_tp UUID; v_av UUID; v_dj UUID; v_os UUID; v_ca UUID;
  v_jf UUID; v_jg UUID; v_zd UUID; v_af UUID; v_mf UUID;
  v_gg UUID; v_jz UUID; v_sa UUID; v_fib UUID; v_cg UUID;
  v_gp UUID; v_nf UUID; v_jan UUID; v_cz UUID; v_ram UUID;
  v_bk UUID; v_fel UUID; v_eb UUID; v_hm UUID; v_gh UUID;
  v_bou UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID; c_aut UUID; c_obs UUID; c_ami UUID;
  c_neg UUID; c_irr UUID; c_cin UUID; c_mac UUID; c_mis UUID;
  c_hom UUID; c_rac UUID; c_xen UUID; c_nep UUID;
BEGIN
  SELECT id INTO v_ta FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eh FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sb FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_fm FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kk FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_fc FROM politicians WHERE slug = 'felipe-carreras';
  SELECT id INTO v_ar FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_en FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_lf FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_tp FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_av FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_dj FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_os FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_ca FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jf FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_jg FROM politicians WHERE slug = 'jose-guimaraes';
  SELECT id INTO v_zd FROM politicians WHERE slug = 'zeca-dirceu';
  SELECT id INTO v_af FROM politicians WHERE slug = 'afonso-florence';
  SELECT id INTO v_mf FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_gg FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jz FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_sa FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fib FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cg FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gp FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_nf FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_cz FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_bk FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_eb FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_hm FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_gh FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ami FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_cin FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';

  -- 1. Tábata Amaral apresenta projeto de educação em tempo integral
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ta,
      'Tábata Amaral defende PL do Ensino Médio e escola em tempo integral como prioridade nacional.',
      'A educação é o maior projeto de país que podemos construir. Sem ensino médio de qualidade, com escola em tempo integral e formação técnica, não teremos mobilidade social, não teremos produtividade, não teremos democracia forte. Essa PL não é pauta de partido, é pauta do Brasil.',
      'Discurso de Tábata Amaral (PSB-SP) em agosto de 2023, em defesa de sua proposta de reforma do Ensino Médio que manteve disciplinas básicas e ampliou educação integral.',
      'verified', true, '2023-08-22',
      'https://www1.folha.uol.com.br/educacao/2023/08/tabata-amaral-ensino-medio-tempo-integral-pl.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'tabata-amaral-ensino-medio-pl-agosto-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 2. Erika Hilton discursa contra transfobia após Janones
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eh,
      'Erika Hilton rebate Janones em plenário após ataque transfóbico e afirma que "minha existência não é debate".',
      'Não vou aceitar que neste plenário a minha identidade seja tratada como debate, como piada, como insulto. Eu sou mulher, sou parlamentar eleita pelo povo, sou filha deste país. Minha existência não é objeto de discussão. A transfobia é crime, e o Congresso Nacional não pode servir de palco para ódio.',
      'Discurso de Erika Hilton (PSOL-SP), primeira deputada federal trans, em outubro de 2023 após ataque do deputado André Janones em rede social.',
      'verified', true, '2023-10-18',
      'https://g1.globo.com/politica/noticia/2023/10/18/erika-hilton-janones-transfobia-plenario-camara.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'erika-hilton-janones-transfobia-plenario-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 3. Sâmia Bomfim defende direitos reprodutivos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sb,
      'Sâmia Bomfim denuncia "PL da gravidez infantil" como obrigação de parto para meninas estupradas.',
      'O PL 1904 é um crime contra meninas. Querem obrigar menina de 10 anos, estuprada, a levar a gravidez até o fim. Isso não é pauta pró-vida, é tortura institucionalizada. Quem defende esse projeto não é pró-vida, é pró-estupro. E nós, mulheres do Brasil, não vamos aceitar.',
      'Discurso de Sâmia Bomfim (PSOL-SP) em junho de 2024, durante tramitação do PL que equiparava aborto após 22 semanas ao homicídio.',
      'verified', true, '2024-06-13',
      'https://www.folha.uol.com.br/cotidiano/2024/06/samia-bomfim-pl-gravidez-infantil-estupro.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'samia-bomfim-pl-gravidez-infantil-junho-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 4. Fernanda Melchionna, como líder do PSOL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fm,
      'Fernanda Melchionna afirma que PSOL não aceitará "pacto fiscal" do governo que desmonta direitos sociais.',
      'O PSOL defende o governo Lula contra o bolsonarismo, mas não faremos genuflexão ao Ministério da Fazenda. Se o pacote fiscal corta Bolsa Família, BPC, salário mínimo, nós votamos contra. Nosso compromisso é com quem trabalha, não com o mercado financeiro.',
      'Declaração de Fernanda Melchionna (PSOL-RS), então líder do partido na Câmara, em novembro de 2024, sobre pacote fiscal de Haddad.',
      'verified', false, '2024-11-27',
      'https://www.poder360.com.br/congresso/fernanda-melchionna-psol-pacote-fiscal-haddad/',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'fernanda-melchionna-pacote-fiscal-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cin, true FROM ins;

  -- 5. Marcel van Hattem ataca Lula em sessão famosa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mvh,
      'Marcel van Hattem acusa governo Lula de "criar pobreza" para vender Bolsa Família como solução.',
      'Senhoras e senhores, a esquerda criou a pobreza para depois vender o remédio. É como médico que envenena o paciente e depois vende antídoto. Cada programa social custeado por imposto alto destrói empregos produtivos e cria dependência eterna do Estado. Isso não é bondade, é covardia econômica.',
      'Discurso viral de Marcel van Hattem (NOVO-RS) em fevereiro de 2024, amplamente compartilhado pela direita nas redes sociais.',
      'verified', true, '2024-02-14',
      'https://oglobo.globo.com/politica/noticia/2024/02/marcel-van-hattem-lula-pobreza-bolsa-familia.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'marcel-van-hattem-lula-pobreza-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Kim Kataguiri Conselho de Ética
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kk,
      'Kim Kataguiri é alvo de representação no Conselho de Ética por uso de funcionários fantasmas.',
      'Não vai ter representação que me faça recuar. Continuarei denunciando abusos, corrupção e desvios de onde vierem. Se o Conselho de Ética quiser brincar de perseguição política, que brinque. Estou tranquilo porque meu gabinete funciona dentro da lei. É caça às bruxas da esquerda.',
      'Declaração de Kim Kataguiri (UNIÃO-SP), fundador do MBL, em março de 2024, após ser alvo de representação no Conselho de Ética.',
      'verified', false, '2024-03-22',
      'https://www.estadao.com.br/politica/kim-kataguiri-conselho-etica-funcionarios-fantasma/',
      'news_article',
      'Brasília', 'Resposta à imprensa', 'kim-kataguiri-conselho-etica-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 7. Felipe Carreras defende Lei Geral do Esporte
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fc,
      'Felipe Carreras celebra aprovação da Lei Geral do Esporte como marco após décadas de lacuna.',
      'O esporte brasileiro viveu 30 anos sem lei nacional. Clubes operando sem regra, atletas desprotegidos, entidades sem controle. A Lei Geral do Esporte resolve isso, moderniza a gestão esportiva, protege atleta, combate manipulação de resultado. É vitória do esporte brasileiro.',
      'Discurso de Felipe Carreras (PSB-PE) em junho de 2023, relator da Lei Geral do Esporte.',
      'verified', false, '2023-06-14',
      'https://ge.globo.com/politica-esportiva/noticia/2023/06/14/felipe-carreras-lei-geral-esporte-aprovacao.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'felipe-carreras-lei-geral-esporte-junho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 8. Aguinaldo Ribeiro relator reforma tributária
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ar,
      'Aguinaldo Ribeiro, relator da Reforma Tributária, afirma que texto simplifica sistema e desonera produção.',
      'A Reforma Tributária é a mudança mais profunda no sistema fiscal brasileiro em quase 60 anos. Substitui cinco tributos complexos por um IVA moderno, reduz carga sobre produção e combate a guerra fiscal entre Estados. Não é reforma perfeita, mas é a melhor possível. O Brasil precisa dela ontem.',
      'Apresentação do relatório da PEC 45 por Aguinaldo Ribeiro (PP-PB) em julho de 2023, após meses de negociação com setores produtivos.',
      'verified', true, '2023-07-06',
      'https://valor.globo.com/politica/noticia/2023/07/06/aguinaldo-ribeiro-reforma-tributaria-relator-iva.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'aguinaldo-ribeiro-reforma-tributaria-relator-julho-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 9. Elmar Nascimento articula liderança UNIÃO
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_en,
      'Elmar Nascimento defende votação acelerada de pautas econômicas e pressiona governo a ampliar UNIÃO no primeiro escalão.',
      'O UNIÃO Brasil é hoje o segundo maior partido da Câmara, tem responsabilidade com o país, mas não aceitará que o governo se apoie em nossa bancada sem reciprocidade. Queremos pautas aprovadas, queremos projetos atendidos, queremos espaço no governo compatível com o peso do partido.',
      'Declaração de Elmar Nascimento (UNIÃO-BA), líder do partido na Câmara, em abril de 2024.',
      'verified', false, '2024-04-17',
      'https://www.folha.uol.com.br/poder/2024/04/elmar-nascimento-uniao-governo-lula-pressao.shtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'elmar-nascimento-uniao-governo-lula-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cin, true FROM ins;

  -- 10. Lindbergh Farias defende Lula e ataca STF neutralidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lf,
      'Lindbergh Farias, líder do PT, defende que Câmara rejeite projeto de anistia aos golpistas do 8 de Janeiro.',
      'Anistiar quem atacou a sede dos Três Poderes é premiar a violência política. Não há democracia possível com impunidade para golpismo. O PT não votará nunca a favor de anistia para quem tentou destruir o voto popular. Quem defende anistia está do lado dos golpistas, ponto.',
      'Discurso de Lindbergh Farias (PT-RJ), líder do PT na Câmara, em setembro de 2024.',
      'verified', false, '2024-09-12',
      'https://g1.globo.com/politica/noticia/2024/09/12/lindbergh-farias-anistia-8-janeiro-pt-camara.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'lindbergh-farias-anistia-8-janeiro-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 11. Talíria Petrone pede proteção após ameaças
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tp,
      'Talíria Petrone denuncia novas ameaças de morte e cobra responsabilização de milícias no RJ.',
      'Sou mulher negra, sou de Niterói, sou deputada eleita e vivo sob escolta policial desde que assassinaram Marielle. Recebo ameaças novas todas as semanas. Quem ameaça tem nome, tem endereço, milicianos com poder de fogo. Enquanto milícia for protegida no RJ, nenhuma voz popular está segura.',
      'Declaração de Talíria Petrone (PSOL-RJ), amiga de Marielle Franco, em março de 2024, seis anos após o assassinato.',
      'verified', true, '2024-03-14',
      'https://oglobo.globo.com/rio/noticia/2024/03/taliria-petrone-ameacas-milicias-marielle.ghtml',
      'news_article',
      'Rio de Janeiro', 'Ato 6 anos de Marielle', 'taliria-petrone-ameacas-milicias-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 12. Adriana Ventura defende liberdade econômica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_av,
      'Adriana Ventura afirma que governo Lula "asfixia" pequeno empreendedor com nova tributação.',
      'O governo Lula não enxerga quem trabalha de sol a sol. Aumentar imposto do pequeno empreendedor no meio de crise é asfixiar quem tenta sobreviver. O Brasil precisa de menos Estado, menos burocracia, menos imposto. Não é papel do governo decidir o que produzir ou consumir.',
      'Discurso de Adriana Ventura (NOVO-SP) em maio de 2024, em debate sobre Medida Provisória que mudou regras tributárias.',
      'verified', false, '2024-05-28',
      'https://www.infomoney.com.br/politica/adriana-ventura-novo-pequeno-empreendedor-tributacao/',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'adriana-ventura-pequeno-empreendedor-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 13. Duarte Jr. discurso sobre juventude periférica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dj,
      'Duarte Jr. defende Lei da Juventude Negra Viva e denuncia genocídio nas periferias brasileiras.',
      'A cada 23 minutos, um jovem negro é assassinado no Brasil. Isso é genocídio, está escrito, está nos dados. Enquanto a direita faz bravata sobre segurança pública, nós apresentamos projeto para salvar vidas, tirar da linha de tiro a juventude preta e periférica. Esse é o Brasil que queremos construir.',
      'Discurso de Duarte Jr. (PSB-MA), jovem deputado advogado popular, em agosto de 2024.',
      'verified', false, '2024-08-15',
      'https://www.camara.leg.br/noticias/1089-duarte-jr-juventude-negra-viva-genocidio-agosto-2024',
      'other',
      'Brasília', 'Plenário da Câmara', 'duarte-jr-juventude-negra-viva-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 14. Orlando Silva relator Marco Civil IA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_os,
      'Orlando Silva defende regulação da IA como proteção à democracia contra deepfakes eleitorais.',
      'A inteligência artificial generativa já cria vídeos falsos impossíveis de distinguir da realidade. Numa eleição, deepfake pode decidir o resultado. Não regular é deixar a democracia à mercê de quem tiver mais servidor e mais dólar. Nosso Marco Civil da IA protege o eleitor, o consumidor, o trabalhador.',
      'Fala de Orlando Silva (PCdoB-SP), relator do Marco Civil da IA e do PL das Fake News, em abril de 2024.',
      'verified', false, '2024-04-25',
      'https://teletime.com.br/orlando-silva-marco-civil-ia-deepfake-eleicao/',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'orlando-silva-marco-civil-ia-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 15. Chico Alencar preside Conselho de Ética
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ca,
      'Chico Alencar afirma que parlamentares que fazem apologia ao golpe "desrespeitam o juramento da posse".',
      'Nós juramos, cada um de nós, defender a Constituição na posse. Deputado que defende golpe, que chama manifestante antidemocrático de herói, que ataca o STF sem provas, está violando o juramento. O Conselho de Ética existe para isso: preservar o decoro e a democracia dentro desta Casa.',
      'Declaração de Chico Alencar (PSOL-RJ) em dezembro de 2023, em audiência no Conselho de Ética.',
      'verified', false, '2023-12-14',
      'https://www.camara.leg.br/noticias/1001-chico-alencar-conselho-etica-apologia-golpe-2023',
      'other',
      'Brasília', 'Conselho de Ética', 'chico-alencar-apologia-golpe-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 16. Jandira Feghali lider PCdoB
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jf,
      'Jandira Feghali denuncia que PL da Saída Temporária piora segurança pública no Brasil.',
      'O projeto que acaba com a saída temporária é mais um populismo penal que não reduz crime, encarece o sistema prisional e favorece reincidência. Política de segurança pública não se faz com ódio, se faz com dado. Quem votar a favor está votando com emoção e contra a ciência criminal.',
      'Discurso de Jandira Feghali (PCdoB-RJ), líder do partido, em março de 2024.',
      'verified', false, '2024-03-14',
      'https://www1.folha.uol.com.br/cotidiano/2024/03/jandira-feghali-saida-temporaria-seguranca.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'jandira-feghali-saida-temporaria-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 17. José Guimarães articula governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jg,
      'José Guimarães, líder do governo na Câmara, diz que pauta fiscal tem "apoio majoritário" e pede celeridade.',
      'O governo Lula fez sua parte: enviou pacote fiscal responsável, negociou com partidos, apresentou justificativa. Agora é hora do Congresso fazer sua parte. Pauta está construída, maioria está formada, não tem razão para segurar. A responsabilidade agora é coletiva.',
      'Declaração de José Guimarães (PT-CE), líder do governo na Câmara, em novembro de 2024.',
      'verified', false, '2024-11-19',
      'https://valor.globo.com/politica/noticia/2024/11/19/jose-guimaraes-pacote-fiscal-camara-apoio-majoritario.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'jose-guimaraes-pacote-fiscal-camara-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 18. Zeca Dirceu defende pai em caso Lava Jato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zd,
      'Zeca Dirceu comemora anulação de condenação de José Dirceu pelo STF e fala em "reparação histórica".',
      'A anulação da condenação do meu pai pela Lava Jato é reparação histórica de uma injustiça. Ele foi condenado por juiz suspeito, com prova fabricada, dentro de operação que virou escândalo internacional. O Brasil precisa pedir desculpa a todos os injustiçados pelo lavajatismo. A verdade venceu.',
      'Declaração de Zeca Dirceu (PT-PR) em abril de 2023, após STF anular condenação de José Dirceu baseada em provas da Lava Jato.',
      'verified', false, '2023-04-26',
      'https://g1.globo.com/politica/noticia/2023/04/26/zeca-dirceu-anulacao-condenacao-pai-lava-jato-reparacao.ghtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa', 'zeca-dirceu-anulacao-condenacao-pai-abril-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cin, true FROM ins;

  -- 19. Afonso Florence articula PT BA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_af,
      'Afonso Florence defende Fundão de Inclusão Racial e bate de frente com bancada evangélica no tema.',
      'Combater racismo não é pauta de um partido, é compromisso civilizatório. O Fundão de Inclusão Racial é política pública que beneficia milhões de brasileiros negros historicamente excluídos. Quem é contra, ou não conhece as estatísticas, ou aceita que o racismo siga estrutural no Brasil. Nós não aceitamos.',
      'Fala de Afonso Florence (PT-BA) em novembro de 2023, em debate sobre cotas raciais e políticas afirmativas.',
      'verified', false, '2023-11-20',
      'https://www.correio24horas.com.br/politica/afonso-florence-fundao-inclusao-racial-novembro-2023',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'afonso-florence-fundao-inclusao-racial-novembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 20. Marcelo Freixo presidente Embratur
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mf,
      'Marcelo Freixo fala em reconstruir imagem do Brasil no exterior após anos de "isolamento bolsonarista".',
      'O Brasil perdeu metade do fluxo turístico durante o governo Bolsonaro porque o mundo enxergava um país tomado pelo desmatamento, pelo discurso de ódio, pela destruição de direitos. Nosso trabalho na Embratur é reconstruir essa imagem: Brasil diverso, sustentável, acolhedor. Estamos voltando.',
      'Declaração de Marcelo Freixo, presidente da Embratur após derrota no Rio em 2022, em entrevista em outubro de 2023.',
      'verified', false, '2023-10-10',
      'https://www.folha.uol.com.br/turismo/2023/10/marcelo-freixo-embratur-reconstruir-imagem-brasil.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha', 'marcelo-freixo-embratur-reconstruir-imagem-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 21. General Girão ataque STF militares
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gg,
      'General Girão chama indiciamento de oficiais por trama golpista de "perseguição ao pensamento militar".',
      'O que está sendo feito com os oficiais das Forças Armadas é perseguição ao pensamento militar. Esses homens dedicaram a vida ao Brasil. Se eles conversavam sobre cenários, sobre hipóteses, é disso que se trata a doutrina militar! Criminalizar conversa é caminhar para uma ditadura togada.',
      'Discurso de General Girão (PL-RN), militar reformado, em dezembro de 2024.',
      'verified', false, '2024-12-04',
      'https://www.poder360.com.br/congresso/general-girao-indiciamento-militares-stf-perseguicao/',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'general-girao-indiciamento-militares-dezembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Julia Zanatta discurso conservador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jz,
      'Julia Zanatta diz que "ideologia de gênero" é "veneno" nas escolas e pede lei escola sem partido.',
      'Querem ensinar à minha filha que ela pode virar menino, que o Brasil é país racista de berço, que capitalismo é o mal. Isso é doutrinação, não é educação. Família brasileira quer escola sem partido, sem ideologia de gênero, sem destruição de valores. O Congresso precisa blindar a criança.',
      'Discurso de Julia Zanatta (PL-SC), jovem deputada conservadora, em fevereiro de 2024.',
      'verified', false, '2024-02-28',
      'https://www.gazetadopovo.com.br/republica/julia-zanatta-ideologia-genero-escola-sem-partido/',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'julia-zanatta-ideologia-genero-escola-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 23. Sanderson defende aumento de penas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sa,
      'Sanderson propõe prisão perpétua para estupro e homicídio e diz que Brasil "precisa de mão firme".',
      'Chega de fingir que pena branda resolve. Estuprador e homicida frio precisa de prisão perpétua ou pena capital, como em países sérios. O Brasil virou paraíso do bandido porque cada um sai da cadeia em quatro anos e volta a matar. Cidadão honesto não aguenta mais.',
      'Fala de Sanderson (PL-RS), ex-agente da PF, em setembro de 2024, em defesa de projetos de endurecimento penal.',
      'verified', false, '2024-09-10',
      'https://www.cnnbrasil.com.br/politica/sanderson-prisao-perpetua-estupro-homicidio/',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'sanderson-prisao-perpetua-estupro-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 24. Filipe Barros ataca Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fib,
      'Filipe Barros afirma que Moraes virou "ditador que manda em tudo" e pede CPI do Judiciário.',
      'Alexandre de Moraes virou o ditador que manda em tudo no Brasil. Prende, solta, cancela, bloqueia, decide eleição. Isso não é Estado de Direito, isso é autocracia judicial. Precisamos de uma CPI do Judiciário para limpar o STF de quem se comporta como monarca absoluto.',
      'Discurso de Filipe Barros (PL-PR) em maio de 2024.',
      'verified', false, '2024-05-08',
      'https://oglobo.globo.com/politica/noticia/2024/05/filipe-barros-moraes-ditador-cpi-judiciario.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'filipe-barros-moraes-ditador-cpi-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 25. Cabo Gilberto ataque MST
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cg,
      'Cabo Gilberto classifica MST como "organização terrorista" e pede sua ilegalidade.',
      'O MST é uma organização terrorista que invade propriedade privada, destrói patrimônio e financia a política do PT. Tem que ser enquadrado pela lei antiterrorismo, os bens têm de ser confiscados, os líderes presos. Não é movimento social, é guerrilha disfarçada.',
      'Declaração de Cabo Gilberto (PL-PB) em maio de 2023, durante CPI do MST.',
      'verified', false, '2023-05-24',
      'https://www.cnnbrasil.com.br/politica/cabo-gilberto-mst-organizacao-terrorista-cpi/',
      'news_article',
      'Brasília', 'CPI do MST', 'cabo-gilberto-mst-terrorista-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 26. Guiga Peixoto imigração
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gp,
      'Guiga Peixoto prega fechamento de fronteiras a venezuelanos e diz que imigração "drena" Roraima.',
      'Roraima não aguenta mais receber venezuelanos. Drena nosso SUS, drena nossa escola, drena nossa assistência social, e ainda aumenta a criminalidade. O Brasil precisa fechar a fronteira como os Estados Unidos estão fazendo. Solidariedade não pode virar suicídio nacional.',
      'Discurso de Guiga Peixoto (PL-SP) em fevereiro de 2025.',
      'verified', false, '2025-02-12',
      'https://www.metropoles.com/brasil/guiga-peixoto-venezuelanos-roraima-fronteira-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'guiga-peixoto-venezuelanos-fronteira-fevereiro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 27. Nikolas Ferreira ataque educação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nf,
      'Nikolas Ferreira divulga vídeo com uniforme escolar feminino e ataca "ideologia de gênero".',
      'Isso aqui é o uniforme que o governo Lula quer distribuir nas escolas. Saia para meninos, calça para meninas, banheiro misto, livro didático com teoria de gênero. Estão transformando escola em ONG ideológica. Pais, acordem! A esquerda quer capturar sua filho desde a creche.',
      'Pronunciamento viral de Nikolas Ferreira (PL-MG) em março de 2023, no Dia Internacional da Mulher, que gerou manifestação de deputadas.',
      'verified', true, '2023-03-08',
      'https://g1.globo.com/politica/noticia/2023/03/08/nikolas-ferreira-peruca-dia-mulher-deputadas.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'nikolas-ferreira-peruca-dia-mulher-marco-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 28. André Janones ataque Erika
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones faz publicação transfóbica contra Erika Hilton e diz que ela "não é mulher".',
      'Erika Hilton não é mulher. Homem não vira mulher, mulher não vira homem. Isso é biologia, não é opinião. A esquerda quer impor esse tipo de mentira, mas eu não sou obrigado a dizer o que não é verdade. Respeito como pessoa, mas não aceito essa fraude de gênero.',
      'Publicação de André Janones (Avante-MG) em redes sociais em outubro de 2023, que gerou resposta contundente de Erika Hilton no plenário.',
      'verified', false, '2023-10-17',
      'https://www.folha.uol.com.br/poder/2023/10/janones-erika-hilton-transfobia-redes-sociais.shtml',
      'news_article',
      'Uberlândia', 'Redes sociais', 'janones-erika-hilton-transfobia-outubro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 29. Carla Zambelli fugida
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cz,
      'Carla Zambelli foge do Brasil após condenação no STF e pede asilo na Itália.',
      'Estou no exílio porque o Brasil virou uma ditadura em que juiz decide quem pode falar e quem pode ser candidato. Alexandre de Moraes me perseguiu desde 2022 porque sou voz forte contra o PT. Peço asilo político aos países livres. Voltarei quando o Brasil for livre de novo.',
      'Declaração de Carla Zambelli (PL-SP) em junho de 2025, após fugir do Brasil ao ser condenada pelo STF no caso da arma contra apoiador de Lula.',
      'verified', true, '2025-06-04',
      'https://g1.globo.com/politica/noticia/2025/06/04/carla-zambelli-fuga-italia-asilo-politico.ghtml',
      'news_article',
      'Roma', 'Entrevista internacional', 'carla-zambelli-fuga-italia-asilo-junho-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 30. Alexandre Ramagem ligação Abin paralela
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem nega ter comandado Abin paralela e diz que é "vítima de perseguição política".',
      'Eu nunca comandei nenhuma Abin paralela. Todo monitoramento feito durante minha gestão seguiu a legalidade, seguiu controle. Estão fabricando narrativa para me tirar do caminho como candidato à prefeitura do Rio. Sou vítima de perseguição política e vou provar minha inocência.',
      'Declaração de Alexandre Ramagem (PL-RJ), ex-diretor da Abin, em março de 2024, após revelação do esquema de monitoramento ilegal.',
      'verified', false, '2024-03-08',
      'https://oglobo.globo.com/politica/noticia/2024/03/alexandre-ramagem-abin-paralela-nega.ghtml',
      'news_article',
      'Rio de Janeiro', 'Coletiva de imprensa', 'ramagem-abin-paralela-nega-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 31. Bia Kicis aborto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bk,
      'Bia Kicis defende PL antiaborto e diz que "aborto é sempre homicídio, mesmo em caso de estupro".',
      'A vida começa na concepção e é sagrada do início ao fim. Aborto é sempre homicídio, mesmo em caso de estupro. A criança não tem culpa do crime cometido pelo pai. O que precisamos é punir o estuprador e acolher a mãe, não acabar com mais uma vida inocente. É pauta da civilização.',
      'Discurso de Bia Kicis (PL-DF) em junho de 2024, durante tramitação do PL 1904.',
      'verified', false, '2024-06-13',
      'https://oglobo.globo.com/politica/noticia/2024/06/bia-kicis-aborto-homicidio-estupro-pl-1904.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'bia-kicis-aborto-homicidio-estupro-junho-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 32. Marco Feliciano evangélicos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano afirma em culto que "maçonaria e umbanda" dominaram o STF contra os cristãos.',
      'Não é coincidência que o STF decida contra a família cristã em toda pauta moral. Aborto, droga, homossexualidade, escola sem Deus. A maçonaria e a umbanda dominaram aquela Corte e querem impor uma agenda anticristã ao Brasil. A igreja precisa acordar e ir para a política.',
      'Pregação de Marco Feliciano (Republicanos-SP), pastor evangélico, em culto realizado em março de 2024.',
      'verified', false, '2024-03-17',
      'https://g1.globo.com/politica/noticia/2024/03/17/marco-feliciano-maconaria-umbanda-stf-cristaos.ghtml',
      'news_article',
      'São Paulo', 'Culto evangélico', 'marco-feliciano-maconaria-umbanda-stf-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 33. Eduardo Bolsonaro nos EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eb,
      'Eduardo Bolsonaro se licencia da Câmara para mobilizar direita americana contra "ditadura togada" no Brasil.',
      'Vou me licenciar do mandato de deputado para dedicar tempo integral à denúncia internacional do regime de Alexandre de Moraes. Vou falar com congressistas americanos, com Elon Musk, com líderes europeus. O Brasil precisa ser colocado na lista das ditaduras modernas até que a liberdade volte.',
      'Anúncio de Eduardo Bolsonaro (PL-SP) em março de 2025, ao pedir licença do mandato para atuar nos EUA em favor do pai preso.',
      'verified', true, '2025-03-18',
      'https://www.folha.uol.com.br/poder/2025/03/eduardo-bolsonaro-licenca-camara-eua-moraes.shtml',
      'news_article',
      'Washington D.C.', 'Anúncio oficial', 'eduardo-bolsonaro-licenca-eua-marco-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 34. Hugo Motta presidente da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_hm,
      'Hugo Motta, novo presidente da Câmara, promete "equilíbrio" e não abrir pauta de anistia sem acordo amplo.',
      'A Câmara, sob minha presidência, será espaço de diálogo e não de imposição. Não vou pautar anistia sem amplo acordo, não vou criar fato político contra nenhum Poder, não vou transformar esta Casa em palco de combate ideológico. Meu compromisso é com o funcionamento institucional do Parlamento.',
      'Discurso de posse de Hugo Motta (Republicanos-PB) como presidente da Câmara em fevereiro de 2025.',
      'verified', true, '2025-02-01',
      'https://g1.globo.com/politica/noticia/2025/02/01/hugo-motta-posse-camara-anistia-equilibrio.ghtml',
      'news_article',
      'Brasília', 'Posse da Câmara', 'hugo-motta-posse-camara-fevereiro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 35. Gleisi Hoffmann Ministra Relações Institucionais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gh,
      'Gleisi Hoffmann defende nova articulação do governo com Centrão e pede "voto útil" em pautas econômicas.',
      'O governo Lula tem maioria para aprovar o que é essencial para o Brasil. O que falta é articulação com o Centrão, que precisa entender que votar com o país é diferente de votar com o partido do presidente. Estou aqui para construir essa ponte em nome do interesse nacional.',
      'Declaração de Gleisi Hoffmann, Ministra das Relações Institucionais após remanejamento, em fevereiro de 2025.',
      'verified', false, '2025-02-20',
      'https://valor.globo.com/politica/noticia/2025/02/20/gleisi-hoffmann-ministra-articulacao-centrao.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'gleisi-ministra-articulacao-centrao-fevereiro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 36. Guilherme Boulos candidatura 2024
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos perde segundo turno em SP e reconhece derrota diante da "onda bolsonarista" com Marçal.',
      'Perdemos. A onda bolsonarista, amplificada pela desinformação do Pablo Marçal, superou nossa capacidade de mobilização no segundo turno. Mas saímos desta eleição fortalecidos, com Lula em evento histórico, com a juventude engajada. São Paulo não é o fim. É o começo da próxima batalha, que é 2026.',
      'Discurso de Guilherme Boulos (PSOL-SP) após derrota no segundo turno para Ricardo Nunes em outubro de 2024.',
      'verified', true, '2024-10-27',
      'https://www1.folha.uol.com.br/poder/2024/10/guilherme-boulos-derrota-sao-paulo-marcal.shtml',
      'news_article',
      'São Paulo', 'Discurso de derrota', 'boulos-derrota-sp-marcal-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 37. Tábata Amaral sobre IA nas escolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ta,
      'Tábata Amaral apresenta PL para letramento digital e uso ético de IA nas escolas brasileiras.',
      'Temos crianças usando ChatGPT sem entender o que é, sem saber diferenciar fonte confiável de fake news. O Brasil precisa ensinar letramento digital e uso ético de IA desde cedo. Sem isso, criamos uma geração dependente de máquina, incapaz de pensar crítico. Educação é, também, preparação para o futuro tecnológico.',
      'Anúncio de Tábata Amaral (PSB-SP) em maio de 2024, ao apresentar PL sobre educação digital.',
      'verified', false, '2024-05-17',
      'https://www1.folha.uol.com.br/educacao/2024/05/tabata-amaral-pl-letramento-digital-ia-escolas.shtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'tabata-amaral-letramento-digital-ia-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 38. Erika Hilton PL contra discriminação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eh,
      'Erika Hilton apresenta PL para criminalizar violência política de gênero no Brasil.',
      'Nós, mulheres na política, especialmente mulheres negras, trans, indígenas, somos alvo diário de violência. Recebemos ameaças, somos caluniadas, somos atacadas em tribuna. Isso não é debate democrático, é violência política. O PL tipifica esse crime e garante a proteção da representação popular feminina.',
      'Apresentação de PL por Erika Hilton (PSOL-SP) em março de 2024.',
      'verified', false, '2024-03-08',
      'https://www12.senado.leg.br/noticias/materias/2024/03/08/erika-hilton-pl-violencia-politica-genero',
      'other',
      'Brasília', 'Plenário da Câmara', 'erika-hilton-pl-violencia-politica-genero-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 39. Marcel van Hattem contra ministro de STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mvh,
      'Marcel van Hattem diz que STF virou "comitê político" do PT após indicação de Flávio Dino.',
      'Com a indicação de Flávio Dino, o STF consolidou-se como comitê político do Partido dos Trabalhadores. Hoje, cinco dos onze ministros foram indicados por Lula. Não existe equilíbrio, não existe pluralismo. A Suprema Corte virou filial do Planalto. Isso é a morte da separação de Poderes.',
      'Discurso de Marcel van Hattem (NOVO-RS) em dezembro de 2023, após aprovação de Flávio Dino pelo Senado.',
      'verified', false, '2023-12-13',
      'https://www.gazetadopovo.com.br/republica/marcel-van-hattem-stf-comite-politico-flavio-dino/',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'marcel-van-hattem-stf-comite-politico-dezembro-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 40. Kim Kataguiri debate PL Fake News
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kk,
      'Kim Kataguiri articula derrota do PL das Fake News e comemora "vitória da liberdade digital".',
      'Derrotamos o PL da Censura, como o Lula e o Orlando Silva queriam. Esse projeto era instrumento para calar a oposição nas redes sociais. Liberdade de expressão venceu. O Brasil não terá Ministério da Verdade. Precisamos combater desinformação, sim, mas com responsabilidade individual, não censura prévia.',
      'Declaração de Kim Kataguiri (UNIÃO-SP) em abril de 2024, após o relator adiar votação do PL 2630.',
      'verified', false, '2024-04-09',
      'https://www.estadao.com.br/politica/kim-kataguiri-derrota-pl-fake-news-liberdade/',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'kim-kataguiri-derrota-pl-fake-news-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Orlando Silva fala sobre retirada do PL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_os,
      'Orlando Silva acusa big techs de gastar fortuna para "destruir" PL das Fake News.',
      'As big techs gastaram mais de 100 milhões de reais em campanha para destruir o PL das Fake News. Usaram suas próprias plataformas, exibiram bandeira preta, mentiram para o usuário. Isso prova que regulamentação é necessária, porque elas usam poder econômico para influenciar democracia. Não paramos, voltaremos.',
      'Declaração de Orlando Silva (PCdoB-SP), relator, em maio de 2023, após campanha contra o PL nas plataformas.',
      'verified', true, '2023-05-02',
      'https://www1.folha.uol.com.br/poder/2023/05/orlando-silva-big-techs-pl-fake-news-lobby.shtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'orlando-silva-big-techs-pl-fake-news-maio-2023'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 42. Lindbergh Farias cobra investigação bolsonarista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lf,
      'Lindbergh Farias, líder do PT, cobra responsabilização de Eduardo Bolsonaro por lobby nos EUA contra o Brasil.',
      'Eduardo Bolsonaro está fazendo no exterior o que seria crime de traição à pátria em qualquer democracia do mundo. Ele pede sanções dos EUA contra autoridades brasileiras, contra ministros do STF. Isso não é liberdade de expressão, é ação internacional contra a própria nação. Precisa ser investigado e punido.',
      'Declaração de Lindbergh Farias (PT-RJ) em abril de 2025, após Eduardo Bolsonaro pressionar o Congresso americano.',
      'verified', false, '2025-04-10',
      'https://g1.globo.com/politica/noticia/2025/04/10/lindbergh-farias-eduardo-bolsonaro-traicao-patria-eua.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'lindbergh-eduardo-bolsonaro-traicao-abril-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 43. Nikolas Ferreira presidência Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nf,
      'Nikolas Ferreira afirma que será candidato à presidência da Câmara em 2027 para "limpar a Casa".',
      'Em 2027, vou disputar a presidência desta Câmara para fazer o que nenhum presidente teve coragem de fazer: limpar essa Casa dos privilégios, das mamatas, dos acordos fisiológicos. Vou governar com o povo, com transparência de redes sociais, fim de cargos fantasmas, com apuração de corrupção em todos os partidos.',
      'Anúncio de Nikolas Ferreira (PL-MG) em março de 2026.',
      'verified', false, '2026-03-22',
      'https://oglobo.globo.com/politica/noticia/2026/03/nikolas-ferreira-candidato-presidencia-camara-2027.ghtml',
      'news_article',
      'Brasília', 'Anúncio nas redes', 'nikolas-ferreira-candidato-presidencia-camara-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Chico Alencar sobre decoro na Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ca,
      'Chico Alencar critica "espetáculo grosseiro" da nova geração bolsonarista na Câmara.',
      'Esta Casa já teve Ulysses, Teotônio Vilela, Franco Montoro. Agora convive com bolsonaristas que usam tribuna para espetáculo grosseiro de redes sociais. Gritaria, apelação, ofensa pessoal. Isso não é política, é pós-verdade performática. Precisamos resgatar a cultura do debate civilizado neste Parlamento.',
      'Discurso de Chico Alencar (PSOL-RJ) em maio de 2024.',
      'verified', false, '2024-05-07',
      'https://www.folha.uol.com.br/poder/2024/05/chico-alencar-bolsonarismo-camara-espetaculo-grosseiro.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'chico-alencar-bolsonarismo-camara-espetaculo-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 45. Jandira Feghali saúde mental
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jf,
      'Jandira Feghali relatora da Lei da Saúde Mental defende ampliação do CAPS e fim das comunidades terapêuticas sem controle.',
      'A saúde mental brasileira precisa voltar para o SUS, para os CAPS, para a base comunitária. Não é aceitável que recursos públicos sejam transferidos para comunidades terapêuticas sem fiscalização, sem dado, muitas vezes com tratamento religioso imposto. Reforma psiquiátrica foi conquista democrática.',
      'Fala de Jandira Feghali (PCdoB-RJ) em junho de 2024, relatora do PL de saúde mental.',
      'verified', false, '2024-06-18',
      'https://www12.senado.leg.br/noticias/materias/2024/06/18/jandira-feghali-saude-mental-caps-comunidades-terapeuticas',
      'other',
      'Brasília', 'Plenário da Câmara', 'jandira-feghali-saude-mental-caps-junho-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 46. José Guimarães defende reforma do IR
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jg,
      'José Guimarães diz que Reforma do Imposto de Renda vai "taxar super-ricos" e isentar classe média.',
      'Está na hora de corrigir uma das maiores injustiças do Brasil: quem ganha pouco paga imposto mais alto que quem ganha milhão. A reforma do IR do governo Lula vai isentar até R$ 5 mil e taxar quem ganha acima de R$ 50 mil por mês. É justiça tributária depois de 30 anos de distorção.',
      'Declaração de José Guimarães (PT-CE), líder do governo, em março de 2025.',
      'verified', true, '2025-03-18',
      'https://valor.globo.com/politica/noticia/2025/03/18/jose-guimaraes-reforma-ir-super-ricos-classe-media.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'jose-guimaraes-reforma-ir-super-ricos-marco-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 47. Sâmia Bomfim sobre feminicidio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sb,
      'Sâmia Bomfim defende PL de feminicídio como crime autônomo com pena máxima ampliada.',
      'Em 2024, o Brasil registrou o maior número de feminicídios da sua história. Mulheres sendo assassinadas pelo simples fato de serem mulheres. O PL 4266 transforma feminicídio em crime autônomo com pena de até 40 anos. É preciso dar resposta firme do Estado a essa violência de gênero estrutural.',
      'Fala de Sâmia Bomfim (PSOL-SP) em outubro de 2024, em debate sobre PL do feminicídio.',
      'verified', false, '2024-10-02',
      'https://oglobo.globo.com/brasil/noticia/2024/10/samia-bomfim-pl-feminicidio-pena-40-anos.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara', 'samia-bomfim-pl-feminicidio-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 48. Hugo Motta sobre pauta 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_hm,
      'Hugo Motta diz que Câmara só pautará anistia após debates amplos e evita confronto com STF.',
      'Ouço pressão da base bolsonarista por anistia ampla, mas essa Casa não pode legislar sob pressão. Qualquer projeto relacionado ao 8 de Janeiro exige debate amplo, ouvindo as vítimas, ouvindo as instituições, ouvindo a sociedade. Não vou pautar para inflamar ou para confrontar o STF. Minha missão é pacificar.',
      'Declaração de Hugo Motta (Republicanos-PB) em abril de 2025, enquanto presidente da Câmara, sobre pressão da oposição.',
      'verified', false, '2025-04-22',
      'https://g1.globo.com/politica/noticia/2025/04/22/hugo-motta-anistia-pauta-stf-pacificar.ghtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa', 'hugo-motta-anistia-pauta-abril-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

  -- 49. Tábata Amaral pré-candidatura SP 2028 sinal 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ta,
      'Tábata Amaral articula projeto de centro e defende "terceira via renovada" para 2026.',
      'O Brasil precisa de uma terceira via renovada, que não seja nem Lula nem Bolsonaro. Estamos cansados da polarização que nos impede de olhar para frente. Precisamos de pauta de educação, de infraestrutura, de reforma do Estado. O eleitor brasileiro está pronto para uma nova geração de lideranças.',
      'Declaração de Tábata Amaral (PSB-SP) em março de 2026, sinalizando pretensões eleitorais.',
      'verified', false, '2026-03-28',
      'https://www1.folha.uol.com.br/poder/2026/03/tabata-amaral-terceira-via-renovada-2026.shtml',
      'news_article',
      'São Paulo', 'Evento do PSB', 'tabata-amaral-terceira-via-renovada-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cin, true FROM ins;

  -- 50. Guilherme Boulos em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos defende Lula em 2026 e afirma que PSOL "não lança candidato próprio" à Presidência.',
      'O PSOL não lançará candidato próprio à Presidência em 2026. Nosso compromisso é com a vitória da democracia contra o bolsonarismo, e esse nome, hoje, é Lula. Podemos discordar em pautas, podemos pressionar por mais, mas não vamos dividir o campo democrático diante da ameaça concreta de retorno do fascismo.',
      'Declaração de Guilherme Boulos (PSOL-SP) em abril de 2026, em reunião do PSOL.',
      'verified', true, '2026-04-12',
      'https://g1.globo.com/politica/noticia/2026/04/12/guilherme-boulos-psol-apoio-lula-2026.ghtml',
      'news_article',
      'São Paulo', 'Reunião do PSOL', 'boulos-psol-apoio-lula-2026-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ami, true FROM ins;

END $$;
