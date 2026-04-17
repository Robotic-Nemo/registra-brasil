-- Batch 151: Segurança pública, polícia, PCC e facções (2023-2026)
DO $$
DECLARE
  v_mucio UUID; v_lew UUID; v_rui UUID; v_lul UUID; v_cas UUID;
  v_tar UUID; v_cai UUID; v_wil UUID; v_lyr UUID; v_jer UUID;
  v_hel UUID; v_leite UUID; v_jai UUID; v_edu UUID; v_nik UUID;
  v_mvh UUID; v_gir UUID; v_jza UUID; v_san UUID; v_fbr UUID;
  v_cgi UUID; v_gpe UUID; v_jom UUID; v_amo UUID; v_din UUID;
  v_pad UUID; v_hug UUID; v_lir UUID; v_nun UUID; v_eri UUID;
  v_sam UUID; v_tal UUID; v_fme UUID; v_jan UUID; v_orl UUID;
  v_chi UUID; v_kim UUID; v_dam UUID; v_mfe UUID; v_bia UUID;
  v_sal UUID;
  c_vio UUID; c_odi UUID; c_abu UUID; c_aut UUID; c_rac UUID;
  c_xen UUID; c_con UUID; c_irr UUID; c_des UUID; c_neg UUID;
  c_int UUID;
BEGIN
  SELECT id INTO v_mucio FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_lyr FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_jer FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_leite FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jza FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fbr FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpe FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_jom FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_amo FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_hug FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_nun FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fme FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';

  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro comemora operação com 28 mortos no Jacarezinho como vitória contra o tráfico.', 'Hoje a polícia do Rio deu uma resposta dura ao crime. Foi uma operação contra bandidos, não contra inocentes.', 'Declaração do governador após megaoperação da Polícia Civil no Complexo do Jacarezinho.', 'verified', true, '2023-05-06', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2023/05/06/castro-defende-operacao-jacarezinho.ghtml', 'news_article', 4, 'Palácio Guanabara', 'Coletiva', 'castro-jacarezinho-b151-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende PM após chacina no Guarujá com 16 mortos na Operação Escudo.', 'A polícia tem respaldo total. Bandido bom é bandido preso ou morto quando reage.', 'Coletiva do governador após denúncias de execuções por PMs na Baixada Santista.', 'verified', true, '2023-08-05', 'https://www1.folha.uol.com.br/cotidiano/2023/08/tarcisio-defende-pm-operacao-escudo-guaruja.shtml', 'news_article', 5, 'São Paulo', 'Coletiva Operação Escudo', 'tarcisio-operacao-escudo-b151-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia Operação Escudo como chacina orquestrada pelo governo de SP.', 'Isso não é segurança pública, é política de extermínio contra o povo preto e pobre.', 'Pronunciamento na Câmara após 28º morto da Operação Escudo no litoral paulista.', 'verified', true, '2023-08-10', 'https://www.camara.leg.br/noticias/erika-hilton-operacao-escudo-chacina', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'erika-escudo-chacina-b151-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia PEC da Segurança Pública como prioridade do governo Lula.', 'Precisamos de um novo pacto federativo de segurança. Nenhum estado vence o crime sozinho.', 'Primeira coletiva após assumir o Ministério da Justiça em substituição a Flávio Dino.', 'verified', true, '2024-02-01', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-pec-seguranca-publica', 'other', 1, 'MJSP', 'Posse e coletiva', 'lewandowski-pec-seguranca-b151-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica PEC da Segurança e acusa Lula de centralizar poder dos estados.', 'Não aceitaremos intervenção federal disfarçada. Segurança é competência dos estados.', 'Reação pública após Lewandowski apresentar minuta da PEC aos governadores.', 'verified', true, '2024-04-03', 'https://www.poder360.com.br/governo/tarcisio-rejeita-pec-seguranca-lula/', 'news_article', 2, 'São Paulo', 'Entrevista', 'tarcisio-rejeita-pec-seguranca-b151-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende endurecimento penal e ironiza direitos humanos após chacina em Goiânia.', 'Aqui em Goiás bandido não tem vez. Direitos humanos é para humanos direitos.', 'Coletiva após operação policial em Goiânia com 5 mortos em confronto.', 'verified', true, '2023-09-15', 'https://g1.globo.com/go/goias/noticia/2023/09/15/caiado-direitos-humanos-humanos-direitos.ghtml', 'news_article', 4, 'Palácio das Esmeraldas', 'Coletiva', 'caiado-humanos-direitos-b151-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima pede reforço do Exército no Amazonas após ataques do Comando Vermelho.', 'O CV declarou guerra ao Estado. Precisamos de tropa federal imediatamente.', 'Solicitação oficial após ataques coordenados de facção em Manaus.', 'verified', true, '2023-11-18', 'https://g1.globo.com/am/amazonas/noticia/2023/11/18/wilson-lima-pede-exercito-cv-manaus.ghtml', 'news_article', 3, 'Manaus', 'Coletiva', 'wilson-lima-exercito-cv-b151-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino cria Força Nacional permanente no Amazonas para combate a facções.', 'A União não vai se omitir. A Força Nacional fica no Amazonas pelo tempo necessário.', 'Anúncio feito após pedido de socorro do governador Wilson Lima.', 'verified', false, '2023-11-20', 'https://www.gov.br/mj/pt-br/assuntos/noticias/forca-nacional-amazonas-faccoes', 'other', 1, 'MJSP', 'Coletiva', 'dino-forca-nacional-am-b151-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lyr, 'Raquel Lyra admite crise de segurança em Pernambuco após recorde de homicídios.', 'Herdamos um caos. Mas não fujo da responsabilidade; vamos reverter com inteligência.', 'Coletiva após Pernambuco liderar ranking de homicídios do Nordeste em 2023.', 'verified', false, '2024-01-22', 'https://g1.globo.com/pe/pernambuco/noticia/2024/01/22/raquel-lyra-seguranca-pe.ghtml', 'news_article', 1, 'Palácio do Campo das Princesas', 'Coletiva', 'raquel-lyra-crise-seguranca-b151-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jerônimo Rodrigues nega omissão na Bahia em meio a recorde de mortes por policiais.', 'A Bahia investiga. Não há carta branca para excessos, mas não criminalizo o trabalho da PM.', 'Entrevista após relatório da Human Rights Watch apontar a PM baiana como a mais letal do país.', 'verified', false, '2024-03-10', 'https://www.correio24horas.com.br/bahia/jeronimo-pm-letalidade', 'news_article', 3, 'Salvador', 'Entrevista', 'jeronimo-pm-letalidade-b151-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho defende integração federal na Amazônia para combate ao crime ambiental e facções.', 'Não dá para separar crime ambiental de facção. É o mesmo ecossistema criminoso.', 'Declaração durante encontro de governadores da Amazônia Legal em Belém.', 'verified', false, '2024-05-12', 'https://www.agenciapara.com.br/noticia/helder-integracao-federal-faccoes', 'other', 1, 'Belém', 'Reunião governadores', 'helder-integracao-faccoes-b151-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leite, 'Eduardo Leite lança programa RS Seguro 2.0 após aumento de latrocínios.', 'Vamos dobrar os investimentos em inteligência e blindar fronteiras.', 'Anúncio em Porto Alegre do novo plano de segurança do governo estadual.', 'verified', false, '2024-06-20', 'https://www.estado.rs.gov.br/noticias/eduardo-leite-rs-seguro-2-0', 'other', 1, 'Porto Alegre', 'Lançamento', 'leite-rs-seguro-b151-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro volta a elogiar miliciano em evento e diz que milícia defende comunidades.', 'Milícia, em sua origem, é comunidade se defendendo do tráfico. Não é tudo que as pessoas falam.', 'Discurso em evento do PL em Ribeirão Preto com cerca de 5 mil apoiadores.', 'verified', true, '2023-07-08', 'https://www.uol.com.br/noticias/bolsonaro-milicia-defende-comunidade-rp', 'news_article', 4, 'Ribeirão Preto', 'Evento PL', 'bolsonaro-milicia-defende-b151-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton rebate Bolsonaro e chama milícia de braço armado do bolsonarismo.', 'Milícia é terror, é extorsão, é o que matou Marielle. E Bolsonaro defende isso porque milícia é dele.', 'Publicação no X em resposta ao discurso em Ribeirão Preto.', 'verified', true, '2023-07-09', 'https://www.metropoles.com/politica/erika-hilton-milicia-bolsonaro', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'erika-milicia-bolsonaro-b151-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira diz que PCC cresceu por causa de política petista de esvaziar presídios.', 'O PCC virou império sob governos do PT. É crime organizado com carteirinha de filiado.', 'Vídeo publicado no Instagram com 3 milhões de visualizações.', 'verified', true, '2024-08-03', 'https://www.oantagonista.com/politica/nikolas-pcc-pt-presidios', 'social_media_post', 4, 'Redes sociais', 'Vídeo Instagram', 'nikolas-pcc-pt-b151-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino rebate Nikolas e apresenta dados de encarceramento desde 2003.', 'A mentira tem perna curta. O sistema prisional dobrou com governos do PT.', 'Entrevista na TV Cultura rebatendo vídeo viral de Nikolas.', 'verified', false, '2024-08-05', 'https://tvcultura.com.br/noticias/dino-rebate-nikolas-pcc', 'news_article', 1, 'TV Cultura', 'Entrevista', 'dino-rebate-nikolas-pcc-b151-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende fim do desarmamento e armamento geral da população contra facções.', 'Povo armado é povo livre. Quem tem medo de cidadão armado é bandido.', 'Pronunciamento na Câmara em defesa do PL do armamento.', 'verified', false, '2024-09-10', 'https://www.camara.leg.br/noticias/sanderson-armamento-faccoes', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'sanderson-armamento-faccoes-b151-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem defende imunidade ampla a policiais em confronto.', 'Policial que atira em bandido deve ter imunidade total. Chega de criminalizar quem protege a gente.', 'Discurso em audiência pública na CCJ da Câmara.', 'verified', true, '2024-10-02', 'https://www.camara.leg.br/noticias/mvh-imunidade-policial', 'news_article', 4, 'Câmara dos Deputados', 'CCJ', 'mvh-imunidade-policial-b151-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia execuções sumárias em operação na Maré.', 'Não há operação, há massacre. 7 jovens negros executados em menos de 12 horas.', 'Pronunciamento após operação da PM no Complexo da Maré.', 'verified', false, '2024-11-14', 'https://www.camara.leg.br/noticias/taliria-petrone-mare-execucao', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-mare-execucao-b151-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro anuncia blindagem jurídica a policiais do Rio com defesa paga pelo estado.', 'Policial que cumpre a missão terá o Estado do Rio ao seu lado na Justiça. Sempre.', 'Assinatura de decreto criando procuradoria especializada para defesa de PMs.', 'verified', true, '2024-12-05', 'https://www.rj.gov.br/noticias/castro-blindagem-juridica-pm', 'other', 3, 'Palácio Guanabara', 'Assinatura decreto', 'castro-blindagem-pm-b151-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jza, 'Júlia Zanatta defende PL Antifacção com banimento de família de líderes faccionados.', 'Quem é família de chefe do PCC tem que ser expulso do Brasil. Não merecem cidadania.', 'Pronunciamento durante votação na Câmara.', 'verified', false, '2024-11-19', 'https://www.camara.leg.br/noticias/julia-zanatta-antifaccao', 'news_article', 4, 'Câmara dos Deputados', 'Votação PL Antifacção', 'zanatta-antifaccao-familia-b151-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão pede uso das Forças Armadas para ocupar favelas indefinidamente.', 'Forças Armadas na favela, com ordens de atirar. Só assim se resolve o problema.', 'Declaração em programa da Jovem Pan após ataques em Manaus.', 'verified', true, '2023-12-10', 'https://jovempan.com.br/programas/pingos-nos-is/general-girao-favela-exercito.html', 'news_article', 5, 'Jovem Pan', 'Entrevista', 'girao-favela-forcas-armadas-b151-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim critica militarização da segurança pública.', 'Favela não é inimiga. Colocar tropa na periferia é declarar guerra contra os pobres.', 'Pronunciamento em plenário após fala de Girão.', 'verified', false, '2023-12-12', 'https://www.camara.leg.br/noticias/samia-militarizacao-seguranca', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'samia-militarizacao-b151-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto pede "licença para matar" para policiais.', 'Policial precisa de licença para matar. É o que funciona em cidade com o caos que temos.', 'Discurso em evento com bolsonaristas em João Pessoa.', 'verified', true, '2024-02-18', 'https://www.paraibaonline.com.br/noticia/cabo-gilberto-licenca-matar', 'news_article', 5, 'João Pessoa', 'Evento', 'cabo-gilberto-licenca-matar-b151-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto compartilha vídeo de morte de suspeito e parabeniza PM.', 'Um a menos. Policial militar, parabéns. Esse é o tratamento correto.', 'Postagem no X sobre morte de suspeito em abordagem policial.', 'verified', false, '2024-04-22', 'https://www.cartacapital.com.br/politica/guiga-peixoto-vida-menos-pm', 'social_media_post', 5, 'Redes sociais', 'Postagem', 'guiga-um-a-menos-b151-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali pede apuração de execução na Maré e condena impunidade a PMs.', 'Cada execução sem punição é combustível para a próxima. Chega de tolerância.', 'Pronunciamento em plenário pedindo criação de CPI.', 'verified', false, '2024-11-18', 'https://www.camara.leg.br/noticias/jandira-execucao-mare-cpi', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-execucao-mare-b151-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbr, 'Filipe Barros defende inelegibilidade de quem defender direitos humanos de presos.', 'Defensor de bandido não pode ser candidato. É ofensa ao povo brasileiro.', 'Apresentação de PL na Câmara que ganhou repercussão e foi arquivado.', 'verified', false, '2024-05-20', 'https://www.camara.leg.br/noticias/filipe-barros-inelegibilidade-defensor', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação PL', 'filipe-barros-inelegibilidade-b151-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis propõe reclusão para quem filmar operação policial em favela.', 'Filmar policial em ação para viralizar é cumplicidade com bandido. Tem que ser crime.', 'Apresentação de PL e defesa em programa da Jovem Pan.', 'verified', true, '2024-06-30', 'https://jovempan.com.br/noticias/bia-kicis-pl-filmar-policia', 'news_article', 4, 'Jovem Pan', 'Entrevista', 'bia-kicis-filmar-policia-b151-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar classifica PL de Bia Kicis como mordaça contra controle social.', 'Quem filma uma violação policial é testemunha, não cúmplice. Querem calar vítimas.', 'Entrevista à GloboNews após repercussão do PL.', 'verified', false, '2024-07-02', 'https://g1.globo.com/politica/noticia/2024/07/02/chico-alencar-bia-kicis-mordaca.ghtml', 'news_article', 1, 'GloboNews', 'Entrevista', 'chico-alencar-mordaca-b151-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha sustenta que violência policial é problema de saúde pública.', 'Bala que entra na favela também mata nossa saúde coletiva. É epidemia de violência.', 'Fala em evento da Fiocruz sobre impacto da violência urbana.', 'verified', false, '2024-08-15', 'https://www.fiocruz.br/noticia/padilha-violencia-saude-publica', 'other', 1, 'Fiocruz', 'Seminário', 'padilha-violencia-saude-b151-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Ricardo Nunes defende fim do protocolo "não atirar contra quem foge" da PM-SP.', 'Bandido não tem hora para correr. Polícia tem que ter autonomia para agir.', 'Entrevista após mortes em operações no extremo sul de SP.', 'verified', true, '2024-09-25', 'https://www1.folha.uol.com.br/cotidiano/2024/09/nunes-pm-protocolo-fuga.shtml', 'news_article', 4, 'São Paulo', 'Entrevista', 'nunes-pm-fuga-protocolo-b151-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna exige câmeras corporais obrigatórias em todas as PMs do país.', 'Câmera na farda salva vidas, policiais inclusive. Quem se opõe tem o que esconder.', 'Pronunciamento durante votação do PL de câmeras corporais.', 'verified', false, '2024-10-14', 'https://www.camara.leg.br/noticias/melchionna-cameras-corporais', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'melchionna-cameras-pm-b151-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio suspende câmeras corporais em SP citando alto custo.', 'O contrato atual onera o estado. Vamos rever as regras.', 'Anúncio polêmico após SP registrar queda de letalidade com câmeras.', 'verified', true, '2024-11-08', 'https://www1.folha.uol.com.br/cotidiano/2024/11/tarcisio-suspende-cameras-pm.shtml', 'news_article', 4, 'Palácio dos Bandeirantes', 'Coletiva', 'tarcisio-suspende-cameras-b151-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Tarcísio por suspender câmeras e promete ação da União.', 'O governador que tira câmera da PM não quer transparência. Isso é muito grave.', 'Entrevista em Belém durante COP 30 climática.', 'verified', true, '2024-11-12', 'https://www.poder360.com.br/governo/lula-critica-tarcisio-cameras-pm/', 'news_article', 2, 'Belém', 'Entrevista', 'lula-tarcisio-cameras-b151-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva denuncia bancada bolsonarista como lobby armamentista.', 'Tem parlamentar que vive das clubes de tiro. É conflito de interesse escancarado.', 'Pronunciamento durante CPI da Abin Paralela na Câmara.', 'verified', false, '2024-09-03', 'https://www.camara.leg.br/noticias/orlando-silva-bancada-armamentista', 'news_article', 1, 'Câmara dos Deputados', 'CPI Abin', 'orlando-lobby-armamento-b151-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que facções brasileiras deviam ser classificadas como terroristas.', 'O PCC é o Hamas brasileiro. Tem que ser tratado como terrorista.', 'Discurso em audiência com parlamentares americanos em Washington.', 'verified', true, '2024-03-22', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-pcc-terrorista-washington/', 'news_article', 3, 'Washington D.C.', 'Audiência EUA', 'eduardo-pcc-hamas-b151-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica classificação do PCC como terrorista e cita riscos diplomáticos.', 'Classificar facção como terrorista expõe o Brasil a sanções internacionais. Não é solução mágica.', 'Artigo publicado na Folha de S.Paulo.', 'verified', false, '2024-04-03', 'https://www1.folha.uol.com.br/opiniao/2024/04/kim-kataguiri-pcc-terrorista.shtml', 'news_article', 1, 'Folha de S.Paulo', 'Artigo', 'kim-pcc-terrorista-b151-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles defende legalização do porte de arma sem registro.', 'Cidadão de bem não precisa pedir licença para se defender. Tem que ter arma como quiser.', 'Entrevista em podcast bolsonarista.', 'verified', false, '2024-05-15', 'https://www.youtube.com/watch?v=salles-arma-registro', 'social_media_post', 4, 'Podcast', 'Entrevista', 'salles-arma-sem-registro-b151-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves propõe castração química para estupradores como política de segurança.', 'Defendo castração química. É o que o povo quer e é justo com as vítimas.', 'Discurso em plenário do Senado em defesa de PL do tema.', 'verified', true, '2023-10-25', 'https://www12.senado.leg.br/noticias/damares-castracao-quimica-estupro', 'news_article', 3, 'Senado Federal', 'Pronunciamento', 'damares-castracao-quimica-b151-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano liga aumento de crimes à ausência de Deus nas escolas.', 'Sem Deus nas escolas, a geração se torna criminosa. É o que vemos nas facções.', 'Fala em culto político em São Paulo.', 'verified', false, '2024-02-08', 'https://www.metropoles.com/brasil/feliciano-deus-escolas-criminalidade', 'news_article', 3, 'São Paulo', 'Culto político', 'feliciano-deus-faccoes-b151-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia verba extra para estados fronteiriços combaterem facções.', 'Vamos liberar R$ 2 bilhões para estados da faixa de fronteira enfrentarem o crime organizado.', 'Coletiva no Planalto ao lado de governadores da Amazônia e do Sul.', 'verified', false, '2024-03-18', 'https://www.gov.br/casacivil/pt-br/noticias/rui-verba-faccoes-fronteira', 'other', 1, 'Palácio do Planalto', 'Coletiva', 'rui-verba-fronteira-b151-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mucio, 'José Múcio defende que Forças Armadas não devem atuar em segurança pública.', 'O Exército não é polícia. Usar tropa para caçar bandido desgasta a instituição.', 'Entrevista após pedidos de governadores por GLO em São Paulo e Rio.', 'verified', false, '2024-05-04', 'https://www.poder360.com.br/governo/mucio-exercito-seguranca-publica/', 'news_article', 1, 'Brasília', 'Entrevista', 'mucio-exercito-seguranca-b151-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro pede GLO permanente no Rio e ataca governo Lula.', 'O Rio precisa de GLO permanente. Lula abandonou o Rio à sua própria sorte.', 'Entrevista à CNN após novo ataque de facção contra BOPE na Vila Cruzeiro.', 'verified', true, '2024-06-11', 'https://www.cnnbrasil.com.br/politica/castro-glo-permanente-lula/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'castro-glo-permanente-b151-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rebate Castro e cobra plano antes de GLO.', 'Não mando tropa do Exército sem planejamento. Não quero outro Guarujá.', 'Entrevista após pedido de Castro.', 'verified', true, '2024-06-12', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/lula-glo-rio', 'other', 1, 'Brasília', 'Entrevista', 'lula-glo-planejamento-b151-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende transferência imediata de chefes do PCC para presídios federais.', 'Chefe de facção não pode continuar dando ordens de dentro da cadeia. Manda logo para o federal.', 'Coletiva de governadores do Consórcio Brasil Central.', 'verified', false, '2024-07-09', 'https://g1.globo.com/go/goias/noticia/2024/07/09/caiado-pcc-federal.ghtml', 'news_article', 2, 'Goiânia', 'Coletiva', 'caiado-pcc-federal-b151-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta promete pautar PL Antifacção como prioridade na Câmara.', 'O PL Antifacção será nossa prioridade. Não podemos conviver com o PCC tomando o país.', 'Primeira coletiva como presidente da Câmara.', 'verified', true, '2025-02-03', 'https://www.camara.leg.br/noticias/hugo-motta-pl-antifaccao-prioridade', 'other', 1, 'Câmara dos Deputados', 'Coletiva', 'hugo-motta-antifaccao-b151-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira defende PL Antifacção mesmo após deixar presidência da Câmara.', 'Esse é o projeto mais importante da legislatura. Quem for contra, é conivente com o crime.', 'Entrevista à Veja.', 'verified', false, '2025-03-10', 'https://veja.abril.com.br/politica/lira-pl-antifaccao-crime', 'news_article', 2, 'Brasília', 'Entrevista', 'lira-antifaccao-conivente-b151-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima culpa governo Lula por crise no Amazonas após fuga em presídio.', 'O governo federal cortou verba. Não tem tropa, não tem dinheiro, só tem ataque contra governadores.', 'Coletiva após fuga de 15 detentos em unidade federal em Manaus.', 'verified', true, '2025-04-15', 'https://g1.globo.com/am/amazonas/noticia/2025/04/15/wilson-lima-lula-fuga-presidio.ghtml', 'news_article', 3, 'Manaus', 'Coletiva', 'wilson-lima-lula-fuga-b151-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski rebate Wilson Lima com planilha de repasses do governo federal.', 'Os dados mostram: jamais faltou repasse ao Amazonas. Quem falta com a verdade é o governador.', 'Coletiva com slides no MJSP.', 'verified', false, '2025-04-16', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-rebate-wilson-lima', 'other', 1, 'MJSP', 'Coletiva', 'lewandowski-rebate-wilson-b151-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio anuncia envio de mil PMs de São Paulo ao Rio em apoio a Castro.', 'Em São Paulo há ordem. Vamos ajudar o Rio enquanto o governo federal não age.', 'Coletiva ao lado de Castro em Petrópolis.', 'verified', true, '2025-05-22', 'https://www1.folha.uol.com.br/cotidiano/2025/05/tarcisio-envia-pms-rj.shtml', 'news_article', 3, 'Petrópolis', 'Coletiva', 'tarcisio-envia-pms-rj-b151-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'AGU Messias defende constitucionalidade da PEC da Segurança no STF.', 'A PEC não invade competência estadual, reforça cooperação. Isso é ABC da Constituição.', 'Sustentação oral na ADI contra a PEC movida por governadores.', 'verified', false, '2025-06-10', 'https://www.gov.br/agu/pt-br/noticias/messias-sustentacao-pec-seguranca', 'other', 1, 'STF', 'Sustentação oral', 'messias-pec-seguranca-stf-b151-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes rejeita liminar e mantém validade da PEC da Segurança.', 'Não há usurpação de competência. Há cooperação federativa prevista no art. 23.', 'Decisão monocrática após ações de 12 estados.', 'verified', true, '2025-06-12', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idNoticia=moraes-pec-seguranca', 'other', 1, 'STF', 'Decisão ADI', 'moraes-pec-seguranca-b151-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira acusa Moraes de centralizar poder também em segurança pública.', 'Moraes virou ditador da segurança também. Tudo passa por ele. Isso não é democracia.', 'Vídeo no Instagram após decisão sobre PEC.', 'verified', true, '2025-06-13', 'https://www.oantagonista.com/politica/nikolas-moraes-pec-seguranca', 'social_media_post', 4, 'Redes sociais', 'Vídeo', 'nikolas-moraes-pec-b151-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Ministro Flávio Dino afirma que discurso de ódio à polícia e contra bandidos se retroalimenta.', 'Quem normaliza o ódio contra bandido abre caminho para o ódio contra policial. É círculo vicioso.', 'Voto em julgamento no STF sobre letalidade policial.', 'verified', false, '2025-07-02', 'https://portal.stf.jus.br/noticias/dino-odio-seguranca-circular', 'other', 1, 'STF', 'Julgamento', 'dino-odio-circular-b151-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jza, 'Júlia Zanatta defende revogação do Estatuto do Desarmamento.', 'Povo desarmado é povo submisso. Queremos revogar o Estatuto e devolver a liberdade ao cidadão.', 'Pronunciamento em plenário.', 'verified', false, '2025-07-15', 'https://www.camara.leg.br/noticias/zanatta-revogar-desarmamento', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'zanatta-revogar-desarmamento-b151-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro compara favelas a territórios palestinos em entrevista.', 'A favela tomada pelo tráfico é como a Faixa de Gaza. Precisamos tratar do mesmo jeito.', 'Entrevista ao jornal israelense Haaretz.', 'verified', true, '2024-10-02', 'https://www.haaretz.com/brazil-castro-favelas-gaza', 'news_article', 5, 'Israel', 'Entrevista imprensa internacional', 'castro-favela-gaza-b151-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone acusa Castro de racismo e incitação ao genocídio.', 'Chamar nossas favelas de Gaza é incitar o genocídio contra pretos e pobres do Rio.', 'Postagem e denúncia ao MP.', 'verified', true, '2024-10-03', 'https://www.metropoles.com/brasil/taliria-castro-favela-gaza-racismo', 'social_media_post', 1, 'Redes sociais', 'Postagem', 'taliria-castro-genocidio-b151-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende "bala nos bandidos" em áudio vazado.', 'Não tem essa de direitos humanos. Bandido é bala. Acabou.', 'Áudio vazado de grupo de WhatsApp com policiais militares.', 'verified', true, '2024-11-28', 'https://www.uol.com.br/noticias/sanderson-audio-bala-bandidos', 'news_article', 5, 'Redes sociais', 'Áudio vazado', 'sanderson-audio-bala-b151-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto diz em live que PCC faria falta "sem a direita no poder".', 'Sem direita forte, o PCC vira partido político. Já tem candidato laranja deles no PT.', 'Live com Nikolas Ferreira no YouTube.', 'verified', false, '2025-01-20', 'https://www.youtube.com/watch?v=guiga-nikolas-pcc-pt', 'social_media_post', 4, 'Redes sociais', 'Live', 'guiga-pcc-partido-pt-b151-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que solução para facções não é tanque, é investimento social.', 'Facção nasce da ausência do Estado. Se você não bota escola, entra o PCC.', 'Pronunciamento em inauguração de escola técnica em Alagoas.', 'verified', true, '2025-02-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/lula-faccao-escola-tanque', 'other', 1, 'Maceió', 'Inauguração', 'lula-faccao-escola-b151-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ironiza Lula e diz que solução para PCC é "bala em quem quer bala".', 'Lula quer escolinha para o PCC. Enquanto isso, o povo morre na rua. Bala neles!', 'Live após fala de Lula em Alagoas.', 'verified', true, '2025-02-15', 'https://www.poder360.com.br/governo/bolsonaro-lula-pcc-bala-escola/', 'social_media_post', 5, 'Redes sociais', 'Live', 'bolsonaro-bala-pcc-b151-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota pela inconstitucionalidade de lei que permite PM atirar em fuga.', 'Atirar contra quem foge sem representar risco é execução. A Constituição proíbe.', 'Voto vencedor em ADI contra lei do Rio de Janeiro.', 'verified', false, '2025-03-27', 'https://portal.stf.jus.br/noticias/dino-voto-pm-atirar-fuga', 'other', 1, 'STF', 'Julgamento ADI', 'dino-pm-fuga-inconstitucional-b151-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro critica STF por "amarrar" mão dos PMs.', 'O STF está amarrando a PM. Depois não pode reclamar do crime tomando conta.', 'Entrevista após decisão de Dino.', 'verified', true, '2025-03-28', 'https://www.cnnbrasil.com.br/politica/castro-stf-pm/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'castro-stf-amarrar-pm-b151-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima comemora prisão de chefe do CV e liga facção ao narcotráfico venezuelano.', 'O CV hoje é parceiro da Venezuela. Temos que falar sobre a fronteira com urgência.', 'Coletiva após captura de líder de facção em operação da PF em Tabatinga.', 'verified', false, '2025-04-30', 'https://g1.globo.com/am/amazonas/noticia/2025/04/30/wilson-lima-prisao-cv-venezuela.ghtml', 'news_article', 3, 'Manaus', 'Coletiva', 'wilson-lima-cv-venezuela-b151-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lyr, 'Raquel Lyra anuncia programa de prevenção à violência contra mulheres em PE.', 'Feminicídio cresce e precisamos enfrentar como política de Estado. Não é caso isolado.', 'Lançamento do programa Juntas por Elas no Recife.', 'verified', false, '2025-03-08', 'https://www.pe.gov.br/noticias/raquel-lyra-juntas-por-elas', 'other', 1, 'Recife', 'Lançamento', 'lyra-juntas-por-elas-b151-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho defende pacto amazônico contra garimpo ilegal e facções.', 'Garimpo ilegal banca facção. Acabar com o crime ambiental é acabar com financiamento do crime.', 'Discurso na Cúpula da Amazônia em Manaus.', 'verified', false, '2025-04-04', 'https://www.gov.br/mre/pt-br/cupula-amazonia-helder', 'other', 1, 'Manaus', 'Cúpula da Amazônia', 'helder-garimpo-faccao-b151-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jerônimo Rodrigues anuncia novo plano de redução de homicídios na Bahia.', 'O plano Paz nas Comunidades vai integrar PM, Guarda Municipal e assistência social.', 'Lançamento em Salvador com secretários de Segurança Pública.', 'verified', false, '2025-05-18', 'https://www.ba.gov.br/noticias/jeronimo-paz-comunidades', 'other', 1, 'Salvador', 'Lançamento', 'jeronimo-paz-comunidades-b151-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leite, 'Eduardo Leite reclama de ausência de apoio federal na crise após enchente.', 'Estão pedindo segurança para o RS, mas o governo federal abandonou quando a água baixou.', 'Coletiva em Porto Alegre um ano após enchentes de 2024.', 'verified', false, '2025-05-04', 'https://gauchazh.clicrbs.com.br/politica/leite-governo-federal-rs-enchente-seguranca', 'news_article', 2, 'Porto Alegre', 'Coletiva', 'leite-federal-rs-enchente-b151-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbr, 'Filipe Barros defende que a polícia ocupe academias de universidades.', 'Universidade virou refúgio de bandido e de esquerdista. Tem que ter PM dentro da USP, UFRJ, todas.', 'Entrevista à TV Câmara.', 'verified', false, '2025-06-18', 'https://www.camara.leg.br/tv/filipe-barros-pm-universidade', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista TV', 'filipe-barros-pm-universidade-b151-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim rebate Filipe Barros por propor PM em universidades.', 'Universidade se defende com ciência e liberdade, não com cassetete. Isso é sonho de ditador.', 'Postagem no X.', 'verified', false, '2025-06-19', 'https://www.metropoles.com/politica/samia-bomfim-pm-universidade', 'social_media_post', 1, 'Redes sociais', 'Postagem', 'samia-rebate-pm-universidade-b151-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto compartilha imagem de morte de suspeito com legenda "tirado de combate".', 'Mais um tirado de combate. Parabéns à tropa pela ação firme.', 'Postagem no X com imagem de corpo em operação policial.', 'verified', true, '2025-07-07', 'https://www.cartacapital.com.br/politica/cabo-gilberto-foto-morto', 'social_media_post', 5, 'Redes sociais', 'Postagem', 'cabo-gilberto-foto-morto-b151-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha alerta que crise de segurança afeta saúde mental de moradores de favelas.', 'Ter tiroteio toda semana é epidemia de trauma. O SUS precisa estar pronto para atender isso.', 'Discurso em evento da Abrasco.', 'verified', false, '2025-07-20', 'https://www.abrasco.org.br/noticias/padilha-saude-mental-favela', 'other', 1, 'Rio de Janeiro', 'Congresso Abrasco', 'padilha-saude-mental-favela-b151-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio proíbe coletes pretos de visitantes em presídios de SP por "exaltação ao PCC".', 'Não vamos deixar cor do PCC dentro de presídio. É sinalização velada, acabou.', 'Anúncio em coletiva sobre novas regras do sistema penitenciário.', 'verified', true, '2025-08-12', 'https://www1.folha.uol.com.br/cotidiano/2025/08/tarcisio-colete-preto-presidio-pcc.shtml', 'news_article', 2, 'São Paulo', 'Coletiva', 'tarcisio-colete-pcc-b151-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado anuncia candidatura à Presidência em 2026 com agenda de segurança pública.', 'Sou o homem da ordem. O Brasil precisa de segurança e do fim dessa bagunça.', 'Evento em Brasília com filiação ao União Brasil.', 'verified', true, '2025-09-01', 'https://www.poder360.com.br/eleicoes/caiado-candidato-presidencia-2026/', 'news_article', 2, 'Brasília', 'Evento filiação', 'caiado-candidatura-2026-b151-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton chama Caiado de "coronel do ódio" após candidatura.', 'Caiado fez carreira passando trator em direitos humanos. É o coronel do ódio do Brasil.', 'Pronunciamento e publicação no X.', 'verified', false, '2025-09-02', 'https://www.metropoles.com/politica/erika-caiado-coronel-odio', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'erika-caiado-coronel-b151-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'Girão defende dominação armada bolsonarista em resposta ao crime organizado.', 'Queremos povo armado e unificado. A direita só ganha se estiver preparada para o que vem.', 'Discurso em evento da ABIN com apoiadores em Natal.', 'verified', false, '2025-09-15', 'https://www.tribunadonorte.com.br/noticia/girao-povo-armado-evento', 'news_article', 4, 'Natal', 'Evento bolsonarista', 'girao-povo-armado-b151-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro defende execução sumária como "dano colateral necessário".', 'Quando a PM entra na favela, vai ter morte. É dano colateral necessário para salvar vidas.', 'Entrevista à Jovem Pan após operação com 14 mortos.', 'verified', true, '2025-10-22', 'https://jovempan.com.br/noticias/castro-dano-colateral-pm-favela', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'castro-dano-colateral-b151-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino classifica fala de Castro como "apologia ao extermínio".', '"Dano colateral necessário" é linguagem de guerra suja. A Constituição não admite.', 'Declaração ao SBT News.', 'verified', true, '2025-10-23', 'https://www.sbt.com.br/noticias/dino-castro-dano-colateral-extermínio', 'news_article', 1, 'SBT News', 'Entrevista', 'dino-castro-exterminio-b151-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio apoia fala de Castro e diz que "crítica vem de quem nunca pisou na favela".', 'Quem fala em desarmar a polícia de dentro de prédio em Brasília não conhece a realidade.', 'Declaração ao Valor Econômico.', 'verified', false, '2025-10-24', 'https://valor.globo.com/politica/noticia/2025/10/24/tarcisio-apoia-castro-favela.ghtml', 'news_article', 3, 'São Paulo', 'Entrevista', 'tarcisio-apoia-castro-b151-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Ricardo Nunes propõe revista em mochilas de alunos de escolas públicas.', 'Criança armada está virando rotina. Vamos revistar mochilas, sim, para proteger as escolas.', 'Coletiva na Prefeitura de São Paulo.', 'verified', true, '2025-11-03', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/11/03/nunes-revista-mochila-escola.ghtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'nunes-revista-mochila-b151-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia redução nacional de homicídios em 2025.', 'O Brasil teve a menor taxa de homicídios em duas décadas. O PEC funcionou.', 'Coletiva no MJSP com dados do Anuário da Segurança Pública.', 'verified', true, '2025-12-10', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-homicidios-2025', 'other', 1, 'MJSP', 'Coletiva', 'lewandowski-homicidios-queda-b151-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles acusa governo de maquiar números para esconder descontrole.', 'Os dados do governo são fraude. A gente vive na rua e sabe: está muito pior.', 'Entrevista à CNN Brasil.', 'verified', false, '2025-12-11', 'https://www.cnnbrasil.com.br/politica/salles-dados-homicidios-fraude/', 'news_article', 3, 'CNN Brasil', 'Entrevista', 'salles-dados-homicidios-fraude-b151-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Melchionna denuncia violência de policiais contra mulheres trans em SP.', 'Mulheres trans são alvo prioritário de PMs racistas. Não dá para normalizar isso.', 'Pronunciamento em plenário com dados da ANTRA.', 'verified', false, '2025-06-28', 'https://www.camara.leg.br/noticias/melchionna-violencia-trans-pm', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'melchionna-violencia-trans-pm-b151-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali reforça demanda por lei federal contra letalidade policial.', 'Não podemos ter uma chacina por mês. O Brasil tem que ter lei federal contra letalidade.', 'Audiência pública na CCJ.', 'verified', false, '2025-07-11', 'https://www.camara.leg.br/noticias/jandira-lei-letalidade-policial', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'jandira-lei-letalidade-b151-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva detalha PL de fiscalização civil sobre operações policiais.', 'Sociedade civil precisa fiscalizar operação policial. Não podemos ter Estado paralelo dentro da PM.', 'Apresentação em plenário.', 'verified', false, '2025-08-06', 'https://www.camara.leg.br/noticias/orlando-fiscalizacao-policial', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação PL', 'orlando-fiscalizacao-pm-b151-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar critica show de força e defende enxugar CVs armados.', 'Não é operação policial, é teatro armado. A imprensa aplaude e os mortos aumentam.', 'Pronunciamento em plenário.', 'verified', false, '2025-09-08', 'https://www.camara.leg.br/noticias/chico-alencar-operacao-teatro', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'chico-operacao-teatro-b151-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri propõe unificar polícias estaduais em ciclo completo.', 'PM e Polícia Civil disputando território é ineficiência que custa vidas. Temos que unificar.', 'Artigo no Estadão.', 'verified', false, '2025-10-05', 'https://www.estadao.com.br/opiniao/kim-kataguiri-ciclo-completo-policia', 'news_article', 1, 'Estadão', 'Artigo', 'kim-ciclo-completo-b151-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem compartilha vídeo e chama crianças de favela de "futuros bandidos".', 'Olha a criança da favela dançando funk com fuzil. É o futuro bandido do PCC.', 'Publicação no X que viralizou e foi amplamente criticada.', 'verified', true, '2025-10-28', 'https://www.oantagonista.com/politica/mvh-crianca-favela-bandido', 'social_media_post', 5, 'Redes sociais', 'Postagem', 'mvh-crianca-bandido-b151-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone aciona MPF contra Van Hattem por "racismo escancarado".', 'Van Hattem chamou criança preta de futuro bandido. Isso é racismo tipificado, criminoso.', 'Representação protocolada no MPF em Brasília.', 'verified', true, '2025-10-29', 'https://www.metropoles.com/politica/taliria-mpf-van-hattem-racismo', 'news_article', 1, 'MPF', 'Representação', 'taliria-mpf-mvh-b151-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mucio, 'José Múcio rejeita pedido de GLO em Niterói durante onda de ataques.', 'Antes de mandar tropa tem que ter inteligência, plano, objetivo. Não vamos repetir erros do passado.', 'Coletiva no Ministério da Defesa após ataques em Niterói.', 'verified', false, '2025-11-15', 'https://www.gov.br/defesa/pt-br/noticias/mucio-glo-niteroi-rejeita', 'other', 1, 'MD', 'Coletiva', 'mucio-glo-niteroi-b151-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro chama Múcio de "general de gabinete" após negativa de GLO.', 'O ministro da Defesa é general de gabinete. Não sabe o que é o Rio.', 'Entrevista indignada na Band News.', 'verified', true, '2025-11-16', 'https://www.band.com.br/politica/castro-mucio-general-gabinete', 'news_article', 3, 'Band News', 'Entrevista', 'castro-mucio-gabinete-b151-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa articula pacto pela paz entre governadores do Norte e Nordeste.', 'Não vamos deixar o crime se aproveitar da divisão federativa. Pacto pela paz, agora.', 'Reunião com 8 governadores em Brasília.', 'verified', false, '2025-11-25', 'https://www.gov.br/casacivil/pt-br/noticias/rui-pacto-paz-governadores', 'other', 1, 'Palácio do Planalto', 'Reunião', 'rui-pacto-paz-b151-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis ameaça "responsabilizar pessoalmente" juízes que soltam criminosos.', 'Juiz que solta bandido vai ter que explicar. Vamos responsabilizar pessoalmente.', 'Postagem no X com marcação de juiz criticado.', 'verified', true, '2026-01-14', 'https://www.metropoles.com/politica/bia-kicis-juiz-responsabilizar', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'bia-kicis-responsabilizar-juiz-b151-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes mantém decisão contra Bia Kicis por intimidação a juízes.', 'Não se pode tolerar que parlamentares ameacem a Magistratura.', 'Decisão em inquérito aberto a pedido da AMB.', 'verified', false, '2026-01-22', 'https://portal.stf.jus.br/noticias/moraes-bia-kicis-ameaca-juiz', 'other', 1, 'STF', 'Decisão', 'moraes-bia-kicis-juiz-b151-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira liga facções a ONGs "financiadas por Soros".', 'As facções e as ONGs globalistas trabalham juntas para destruir o Brasil. Soros está por trás.', 'Live com George Nikolas Ferreira e bolsonaristas.', 'verified', true, '2026-02-05', 'https://www.oantagonista.com/politica/nikolas-soros-ongs-faccoes', 'social_media_post', 4, 'Redes sociais', 'Live', 'nikolas-soros-faccoes-b151-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro elogia operação que matou 20 suspeitos em São Paulo.', 'Tarcísio tá fazendo o que o povo quer. Missão cumprida.', 'Postagem no Instagram após operação Verão da PM-SP.', 'verified', true, '2026-02-18', 'https://www.oantagonista.com/politica/bolsonaro-elogia-operacao-verao-sp', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'bolsonaro-elogia-verao-sp-b151-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia Operação Verão à Comissão Interamericana de DH.', 'Levamos o caso da Operação Verão à CIDH. O Brasil não pode naturalizar chacinas.', 'Coletiva após audiência na CIDH em Washington.', 'verified', false, '2026-03-02', 'https://www.camara.leg.br/noticias/erika-cidh-operacao-verao', 'other', 1, 'Washington D.C.', 'Audiência CIDH', 'erika-cidh-verao-b151-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se reúne com governadores de todos os partidos sobre segurança pública.', 'Hoje acabou o jogo de empurra. Todos os 27 governadores, do PT ao PL, pactuam.', 'Coletiva após reunião no Palácio do Planalto com os 27 governadores.', 'verified', true, '2026-03-15', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/lula-governadores-seguranca-pacto', 'other', 1, 'Palácio do Planalto', 'Reunião governadores', 'lula-27-governadores-b151-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia SUSP 2.0 com diretrizes unificadas de uso da força.', 'O Brasil terá uma diretriz nacional de uso da força. Protocolo igual de PM a BOPE.', 'Coletiva no MJSP com chefes de polícia dos 27 estados.', 'verified', true, '2026-03-30', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-susp-2-uso-forca', 'other', 1, 'MJSP', 'Coletiva', 'lewandowski-susp-forca-b151-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio recusa aderir ao SUSP 2.0 e desafia "modelo federal de algemar PM".', 'SP não entra em protocolo que amarre nossa polícia. Aqui quem decide é o governador, não o Lula.', 'Coletiva após reunião dos governadores com o MJSP.', 'verified', true, '2026-04-08', 'https://www1.folha.uol.com.br/cotidiano/2026/04/tarcisio-nao-adere-susp-2-uso-forca.shtml', 'news_article', 4, 'São Paulo', 'Coletiva', 'tarcisio-recusa-susp-b151-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

END $$;
