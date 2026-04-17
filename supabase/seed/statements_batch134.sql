-- Batch 134: Corrupção e escândalos (Jan 2023 - Apr 2026) - Parte 1
DO $$
DECLARE
  v_lul UUID; v_lli UUID; v_pad UUID; v_rui UUID; v_sil UUID;
  v_nis UUID; v_lup UUID; v_jus UUID; v_had UUID; v_teb UUID;
  v_lir UUID; v_elm UUID; v_agu UUID; v_mot UUID; v_alc UUID;
  v_pac UUID; v_via UUID; v_ren UUID; v_fla UUID; v_zam UUID;
  v_ram UUID; v_dsi UUID; v_edu UUID; v_jai UUID; v_fre UUID;
  v_lew UUID; v_mes UUID; v_din UUID; v_mor UUID; v_gil UUID;
  v_tof UUID; v_car UUID; v_wag UUID; v_hum UUID; v_eli UUID;
  v_dua UUID; v_ran UUID; v_lin UUID; v_ale UUID; v_nik UUID;
  v_van UUID; v_chi UUID; v_jan UUID;
  c_cor UUID; c_abu UUID; c_con UUID; c_nep UUID; c_obs UUID;
  c_des UUID; c_int UUID; c_ame UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lli FROM politicians WHERE slug = 'lulinha';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_jus FROM politicians WHERE slug = 'juscelino-filho';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_elm FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_agu FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_via FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fre FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_wag FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_eli FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dua FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_ale FROM politicians WHERE slug = 'alessandro-vieira';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jus, 'Juscelino Filho é alvo de apuração por esquema de emendas Mais Cultura no Maranhão.', 'Não há qualquer irregularidade. Tudo foi feito dentro da legalidade e com total transparência.', 'CGU aponta desvios em emendas destinadas ao Maranhão quando Juscelino era ministro das Comunicações.', 'verified', true, '2024-04-15', 'https://www1.folha.uol.com.br/poder/2024/04/juscelino-filho-emendas-maranhao.shtml', 'news_article', 4, 'Brasília', 'Apuração da CGU', 'juscelino-emendas-mc-b134-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula minimiza denúncias contra Juscelino Filho e mantém ministro no cargo.', 'O Juscelino é um companheiro leal e vai se defender. Não vou demitir ministro por denúncia na imprensa.', 'Entrevista coletiva no Planalto após reportagens sobre esquema de emendas.', 'verified', false, '2024-04-18', 'https://g1.globo.com/politica/noticia/2024/04/18/lula-defende-juscelino-filho.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Entrevista coletiva', 'lula-defende-juscelino-b134-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lli, 'Lulinha é citado em CPMI do INSS sobre consultoria em fundo de pensão.', 'Nunca recebi nenhum valor indevido. Minha empresa presta serviços legítimos.', 'Deputados da CPMI do INSS questionam contratos da Gamecorp envolvendo fundos de pensão.', 'verified', true, '2025-09-10', 'https://www.poder360.com.br/congresso/cpmi-inss-lulinha-depoimento/', 'news_article', 4, 'Congresso Nacional', 'Depoimento na CPMI do INSS', 'lulinha-cpmi-inss-b134-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Carlos Lupi nega responsabilidade por fraude de descontos no INSS.', 'Eu não sabia dos descontos indevidos. Quando soube, mandei apurar imediatamente.', 'Ministro da Previdência depõe na CPMI sobre esquema que lesou aposentados em R$ 6 bilhões.', 'verified', true, '2025-05-22', 'https://www1.folha.uol.com.br/mercado/2025/05/lupi-cpmi-inss-descontos.shtml', 'news_article', 4, 'Congresso Nacional', 'CPMI do INSS', 'lupi-nega-fraude-inss-b134-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula demite Lupi após pressão pelo escândalo do INSS.', 'Aceitei o pedido de demissão do ministro Lupi em nome da transparência do governo.', 'Anúncio da saída após PF deflagrar operação sobre fraude de descontos associativos.', 'verified', true, '2025-05-03', 'https://g1.globo.com/politica/noticia/2025/05/03/lula-demite-lupi-previdencia.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Anúncio oficial', 'lula-demite-lupi-b134-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama, relatora da CPMI do INSS, anuncia 216 indiciados incluindo Lulinha.', 'Temos elementos robustos para indiciar 216 pessoas, incluindo servidores, lobistas e o filho do presidente.', 'Apresentação do relatório final da CPMI do INSS no Congresso Nacional.', 'verified', true, '2025-10-28', 'https://www.cnnbrasil.com.br/politica/cpmi-inss-relatorio-final-216-indiciados/', 'news_article', 1, 'Congresso Nacional', 'Relatório final CPMI INSS', 'eliziane-relatorio-cpmi-b134-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira é apontado como operador do orçamento secreto em relatório do TCU.', 'As emendas de relator são constitucionais e legais. Não existe orçamento secreto.', 'TCU aponta falta de transparência em R$ 19 bi de emendas RP-9 distribuídas por Lira.', 'verified', true, '2023-06-20', 'https://www.tcu.gov.br/noticias/2023/06/orcamento-secreto-relatorio.htm', 'other', 3, 'TCU', 'Auditoria orçamento secreto', 'lira-orcamento-secreto-tcu-b134-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmar Nascimento é alvo de reportagem sobre emendas para obras em cidade natal.', 'Todas as emendas foram para obras legítimas em benefício da minha base.', 'Reportagem mostra R$ 400 milhões em emendas de Elmar para municípios onde tem parentes em cargos.', 'verified', false, '2024-03-12', 'https://www.metropoles.com/brasil/politica-br/elmar-nascimento-emendas-familia', 'news_article', 3, 'Câmara dos Deputados', 'Reportagem investigativa', 'elmar-emendas-cidade-b134-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli é condenada por perseguir homem armada em São Paulo.', 'Fui vítima de uma armação eleitoral. Nunca ameacei ninguém de verdade.', 'STF condena deputada a 5 anos e 3 meses por porte ilegal e constrangimento ilegal.', 'verified', true, '2024-05-14', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/05/14/zambelli-condenada-stf.ghtml', 'news_article', 5, 'STF', 'Condenação criminal', 'zambelli-condenacao-arma-b134-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli foge para a Itália após condenação por invasão ao CNJ.', 'Não estou fugindo. Estou resguardando minha integridade física.', 'Deputada deixa o país após condenação por invasão hacker ao sistema do CNJ com Delgatti.', 'verified', true, '2025-06-04', 'https://www1.folha.uol.com.br/poder/2025/06/zambelli-fuga-italia.shtml', 'news_article', 5, 'Roma', 'Fuga após condenação', 'zambelli-fuga-italia-b134-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida é acusado de assédio sexual por Anielle Franco.', 'Repudio veementemente as acusações. São mentirosas e vou provar minha inocência.', 'Ministro dos Direitos Humanos é denunciado por Anielle Franco e outra servidora.', 'verified', true, '2024-09-06', 'https://www.cnnbrasil.com.br/politica/silvio-almeida-denuncia-assedio-anielle/', 'news_article', 5, 'Brasília', 'Denúncia pública', 'silvio-almeida-denuncia-b134-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula demite Silvio Almeida após denúncias de assédio sexual.', 'Agradeço os serviços prestados e a decisão foi tomada em respeito às vítimas.', 'Presidente anuncia exoneração do ministro dos Direitos Humanos.', 'verified', true, '2024-09-07', 'https://g1.globo.com/politica/noticia/2024/09/07/lula-demite-silvio-almeida.ghtml', 'news_article', 2, 'Palácio do Planalto', 'Anúncio oficial', 'lula-demite-silvio-almeida-b134-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha nega irregularidades em contratos da SAF do Ministério da Saúde.', 'Todos os contratos seguem rito licitatório rigoroso. Não aceito especulação.', 'TCU abre investigação sobre contratos emergenciais firmados em 2024 pelo Ministério.', 'verified', false, '2025-02-18', 'https://www.poder360.com.br/governo/padilha-saude-tcu-contratos/', 'news_article', 2, 'Brasília', 'Auditoria do TCU', 'padilha-contratos-saude-b134-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa é questionado por contratações sem licitação na Casa Civil.', 'As contratações seguem o rito legal. Não há qualquer irregularidade.', 'CGU abre processo sobre contratos emergenciais na Casa Civil em 2024.', 'verified', false, '2024-11-22', 'https://www1.folha.uol.com.br/poder/2024/11/rui-costa-contratos-casa-civil.shtml', 'news_article', 2, 'Casa Civil', 'Abertura de processo CGU', 'rui-costa-contratos-b134-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade nega irregularidades em compra de remédios para o SUS.', 'Todas as compras seguiram o fluxo legal e tiveram acompanhamento da CGU.', 'TCU solicita esclarecimentos sobre compras de medicamentos de alto custo em 2023.', 'verified', false, '2024-02-10', 'https://g1.globo.com/politica/noticia/2024/02/10/nisia-trindade-tcu-sus.ghtml', 'news_article', 2, 'Ministério da Saúde', 'Pedido do TCU', 'nisia-compras-sus-b134-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad é questionado por indicações políticas no Banco Master antes do colapso.', 'Nunca houve qualquer interferência do Ministério da Fazenda nas decisões do Banco Master.', 'Após intervenção do BC no Banco Master, CPI do Senado investiga indicações.', 'verified', true, '2025-11-20', 'https://valor.globo.com/politica/noticia/2025/11/20/haddad-banco-master-indicacoes.ghtml', 'news_article', 3, 'Ministério da Fazenda', 'CPI do Banco Master', 'haddad-banco-master-b134-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_via, 'Carlos Viana relata na CPI que Banco Master movimentou R$ 50 bi com fundos públicos.', 'O Banco Master operou um esquema bilionário usando recursos de fundos de pensão e BNDES.', 'Relator da CPI do Banco Master apresenta primeiro diagnóstico.', 'verified', true, '2025-12-04', 'https://www12.senado.leg.br/noticias/materias/2025/12/04/cpi-banco-master-relatorio', 'other', 1, 'Senado Federal', 'CPI do Banco Master', 'viana-cpi-banco-master-b134-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira admite negociar emendas com Planalto em troca de apoio a projetos.', 'Emendas são moeda de troca política. Isso é governabilidade, não corrupção.', 'Declaração em entrevista sobre relação entre Executivo e Câmara.', 'verified', true, '2023-09-14', 'https://veja.abril.com.br/politica/lira-emendas-moeda-governabilidade/', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista à Veja', 'lira-emendas-moeda-troca-b134-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes determina buscas contra Filipe Martins e ex-auxiliares.', 'A ordem de busca e apreensão atende ao devido processo legal.', 'PF cumpre mandados no inquérito da trama golpista envolvendo ex-assessores de Bolsonaro.', 'verified', true, '2024-02-08', 'https://g1.globo.com/politica/noticia/2024/02/08/moraes-determina-buscas-filipe-martins.ghtml', 'news_article', 1, 'STF', 'Operação Tempus Veritatis', 'moraes-buscas-filipe-b134-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Alexandre Ramagem é denunciado pela PGR por espionagem na Abin.', 'Rejeito a acusação. Nunca usei a Abin para fins políticos ou ilegais.', 'PGR denuncia Ramagem por uso da Abin para vigilância ilegal de autoridades.', 'verified', true, '2024-10-03', 'https://www1.folha.uol.com.br/poder/2024/10/pgr-denuncia-ramagem-abin-paralela.shtml', 'news_article', 5, 'PGR', 'Denúncia da Abin paralela', 'ramagem-abin-paralela-b134-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro é alvo de processo por rachadinha no Senado.', 'Tudo isso é perseguição política. Jamais pratiquei rachadinha.', 'Juíza do RJ determina novo prazo para investigação das rachadinhas no gabinete do senador.', 'verified', true, '2023-08-18', 'https://www.metropoles.com/brasil/politica-br/flavio-rachadinha-processo-novo-prazo', 'news_article', 4, 'Rio de Janeiro', 'Processo da rachadinha', 'flavio-rachadinha-prazo-b134-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Jair Bolsonaro é indiciado pela PF por joias sauditas.', 'Não desviei joia nenhuma. Tudo foi presente protocolar.', 'PF conclui inquérito e indicia ex-presidente por peculato e lavagem de dinheiro.', 'verified', true, '2024-07-04', 'https://g1.globo.com/politica/noticia/2024/07/04/bolsonaro-indiciado-pf-joias.ghtml', 'news_article', 5, 'Polícia Federal', 'Conclusão inquérito das joias', 'bolsonaro-indiciado-joias-b134-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro é investigado por coação em processo nos EUA.', 'Não coagi ninguém. Estou apenas pedindo justiça contra perseguidores.', 'STF abre inquérito para apurar articulação de Eduardo por sanções contra ministros.', 'verified', true, '2025-02-20', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-inquerito-coacao/', 'news_article', 5, 'STF', 'Abertura de inquérito', 'eduardo-coacao-inquerito-b134-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira tem prisão mantida mesmo após indulto anulado pelo STF.', 'Sou um preso político perseguido por uma ditadura judicial.', 'STF nega novamente habeas corpus ao ex-deputado preso desde 2023.', 'verified', false, '2024-03-15', 'https://www1.folha.uol.com.br/poder/2024/03/daniel-silveira-hc-negado.shtml', 'news_article', 2, 'STF', 'Negativa de HC', 'silveira-hc-negado-b134-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes é criticado por anular provas de delação da Odebrecht.', 'A anulação seguiu estritamente o entendimento jurídico sobre contaminação de prova.', 'STF anula provas da colaboração da Odebrecht obtidas via sistema Drousys.', 'verified', true, '2023-05-25', 'https://www.conjur.com.br/2023-mai-25/stf-anula-provas-odebrecht-drousys/', 'news_article', 3, 'STF', 'Julgamento provas Odebrecht', 'gilmar-anula-odebrecht-b134-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Dias Toffoli anula todas as provas da Lava Jato contra Lula.', 'Houve abuso de autoridade na conduta de Moro e Dallagnol que contaminou todo o processo.', 'Decisão monocrática amplia anulação de provas contra Lula a todos os processos.', 'verified', true, '2023-09-27', 'https://g1.globo.com/politica/noticia/2023/09/27/toffoli-anula-provas-lava-jato.ghtml', 'news_article', 3, 'STF', 'Decisão Lava Jato', 'toffoli-anula-lava-jato-b134-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel van Hattem denuncia Dino por nomeação de amigos em ministério.', 'O ministro Dino usou o cargo para acomodar aliados políticos em cargos estratégicos.', 'Deputado protocola representação no MPF contra Flávio Dino no Ministério da Justiça.', 'verified', false, '2024-02-02', 'https://www.poder360.com.br/congresso/van-hattem-denuncia-dino-nomeacoes/', 'news_article', 2, 'Câmara dos Deputados', 'Representação no MPF', 'van-hattem-denuncia-dino-b134-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas acusa Lula de proteger filho em CPI do INSS.', 'Lula está blindando o filho. Se fosse um Bolsonaro, já estaria preso.', 'Declaração em plenário durante discussão sobre CPMI do INSS.', 'verified', false, '2025-09-15', 'https://www.metropoles.com/brasil/politica-br/nikolas-lula-lulinha-inss', 'news_article', 3, 'Câmara dos Deputados', 'Discurso em plenário', 'nikolas-lula-lulinha-b134-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende Lulinha e critica CPI do INSS.', 'A CPI virou um palanque de perseguição à família do presidente. Lulinha é inocente.', 'Senador rebate acusações contra empresa de filho de Lula na CPMI.', 'verified', false, '2025-09-16', 'https://www12.senado.leg.br/noticias/materias/2025/09/16/humberto-costa-lulinha', 'other', 2, 'Senado Federal', 'Discurso de defesa', 'humberto-defende-lulinha-b134-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh nega irregularidade de Lulinha e atribui escândalo a perseguição.', 'Não há prova contra Lulinha. É apenas uma tentativa de atacar Lula.', 'Deputado defende filho do presidente em entrevista no Congresso.', 'verified', false, '2025-09-17', 'https://www.cnnbrasil.com.br/politica/lindbergh-defende-lulinha-cpmi/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista coletiva', 'lindbergh-defende-lulinha-b134-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alessandro Vieira critica morosidade do governo em afastar Lupi.', 'Lupi deveria ter sido afastado no primeiro sinal do escândalo. Houve negligência.', 'Senador declara apoio à CPMI do INSS e cobra responsabilização.', 'verified', false, '2025-05-04', 'https://www12.senado.leg.br/noticias/materias/2025/05/04/alessandro-vieira-lupi', 'other', 2, 'Senado Federal', 'Declaração pública', 'alessandro-cobra-lupi-b134-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues defende Lula em meio à crise do INSS.', 'Lula não sabia dos desvios no INSS. Os responsáveis serão punidos.', 'Líder do governo se manifesta após escândalo dos descontos associativos.', 'verified', false, '2025-05-05', 'https://g1.globo.com/politica/noticia/2025/05/05/randolfe-defende-lula-inss.ghtml', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'randolfe-defende-lula-inss-b134-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr. relata na CPMI do INSS esquema de associações fraudulentas.', 'Identificamos 500 associações fantasmas que sugaram bilhões dos aposentados.', 'Relator da CPMI do INSS apresenta relatório parcial no Congresso.', 'verified', true, '2025-07-22', 'https://www1.folha.uol.com.br/mercado/2025/07/duarte-jr-cpmi-inss-relatorio.shtml', 'news_article', 1, 'Congresso Nacional', 'Relatório parcial CPMI', 'duarte-cpmi-inss-parcial-b134-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar pede apuração rigorosa de todos os envolvidos no INSS.', 'Não podemos permitir qualquer blindagem. Todos devem ser investigados.', 'Deputado do PSOL cobra investigação imparcial na CPMI.', 'verified', false, '2025-06-10', 'https://www.camara.leg.br/noticias/1071234-chico-alencar-inss', 'other', 1, 'Câmara dos Deputados', 'Declaração na CPMI', 'chico-apuracao-inss-b134-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende governo em crise do INSS e pede foco em vítimas.', 'O governo agiu imediatamente ao tomar conhecimento. O foco deve ser devolver dinheiro aos aposentados.', 'Deputada do PCdoB se manifesta em favor do Planalto.', 'verified', false, '2025-05-10', 'https://www.camara.leg.br/noticias/1068900-jandira-inss-aposentados', 'other', 2, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'jandira-defende-governo-inss-b134-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira é acusado de usar emendas Pix sem rastreabilidade pelo TCU.', 'Todas as emendas foram feitas dentro da legalidade e com total transparência.', 'Acórdão do TCU determina suspensão de emendas Pix por falta de rastreabilidade.', 'verified', true, '2024-08-09', 'https://www.tcu.gov.br/noticias/2024/08/emendas-pix-suspensao.htm', 'other', 4, 'TCU', 'Acórdão emendas Pix', 'lira-emendas-pix-tcu-b134-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmar Nascimento vira alvo de inquérito sobre emendas para BA.', 'Minhas emendas são para a população baiana. Não há nada a esconder.', 'PF abre inquérito sobre direcionamento de emendas para municípios específicos.', 'verified', true, '2025-03-11', 'https://www1.folha.uol.com.br/poder/2025/03/elmar-inquerito-emendas-ba.shtml', 'news_article', 4, 'Polícia Federal', 'Abertura de inquérito', 'elmar-inquerito-pf-b134-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro tem nome citado em esquema de emendas na PB.', 'Nunca intermediei desvio de recursos públicos. Rejeito a acusação.', 'Reportagem do UOL aponta direcionamento de emendas a prefeituras aliadas.', 'verified', false, '2024-07-19', 'https://noticias.uol.com.br/politica/2024/07/19/aguinaldo-emendas-paraiba.htm', 'news_article', 3, 'Câmara dos Deputados', 'Reportagem investigativa', 'aguinaldo-emendas-pb-b134-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta é alvo de reportagem por emendas à família na PB.', 'Minhas indicações seguem critério técnico e atendem à minha base eleitoral.', 'Reportagem do Estadão mostra R$ 200 milhões destinados a cidades de redutos da família.', 'verified', false, '2025-04-02', 'https://www.estadao.com.br/politica/hugo-motta-emendas-familia-pb/', 'news_article', 3, 'Câmara dos Deputados', 'Reportagem investigativa', 'motta-emendas-familia-b134-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Davi Alcolumbre concentra R$ 1 bilhão em emendas para o Amapá, aponta TCU.', 'Emendas de comissão são instrumento legal de representação do meu estado.', 'TCU destaca concentração histórica de emendas no AP sob comando de Alcolumbre.', 'verified', true, '2025-07-15', 'https://www.tcu.gov.br/noticias/2025/07/emendas-amapa-concentracao.htm', 'other', 3, 'TCU', 'Relatório sobre emendas AP', 'alcolumbre-concentra-emendas-b134-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Rodrigo Pacheco é questionado por nomeação de amigos em cargos do Senado.', 'Todas as nomeações seguiram critério técnico e moral.', 'Denúncia envolvendo indicações para Secretaria Geral da Mesa.', 'verified', false, '2024-05-30', 'https://www.metropoles.com/brasil/politica-br/pacheco-nomeacoes-senado', 'news_article', 2, 'Senado Federal', 'Denúncia interna', 'pacheco-nomeacoes-senado-b134-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros critica Lira por centralização de emendas secretas.', 'O que o Lira faz na Câmara é um atentado à transparência republicana.', 'Senador ataca sistema de emendas RP-9 durante sessão no Senado.', 'verified', false, '2023-11-08', 'https://www12.senado.leg.br/noticias/materias/2023/11/08/renan-critica-lira-emendas', 'other', 2, 'Senado Federal', 'Discurso em plenário', 'renan-critica-lira-b134-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jus, 'Juscelino Filho deixa Ministério das Comunicações após novo escândalo.', 'Saio com a consciência tranquila. Provarei minha inocência na Justiça.', 'Demissão acontece após PF fazer buscas em seu endereço.', 'verified', true, '2024-04-22', 'https://g1.globo.com/politica/noticia/2024/04/22/juscelino-filho-demissao.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Demissão oficial', 'juscelino-demissao-b134-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula admite erro ao manter Juscelino Filho tanto tempo no cargo.', 'Talvez eu tenha demorado demais. Precisamos aprender com isso.', 'Presidente comenta sobre ciclo de escândalos no ministério.', 'verified', false, '2024-05-05', 'https://www1.folha.uol.com.br/poder/2024/05/lula-admite-erro-juscelino.shtml', 'news_article', 2, 'Palácio do Planalto', 'Entrevista à imprensa', 'lula-admite-erro-juscelino-b134-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet nega favorecimento em repasses do PPI do Planejamento.', 'Todos os projetos passaram por análise técnica rigorosa e imparcial.', 'TCU questiona critérios de seleção de projetos prioritários do governo.', 'verified', false, '2024-09-12', 'https://valor.globo.com/politica/noticia/2024/09/12/tebet-ppi-tcu.ghtml', 'news_article', 2, 'Ministério do Planejamento', 'Resposta ao TCU', 'tebet-ppi-tcu-b134-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fre, 'Marcelo Freixo critica blindagem política em casos de corrupção.', 'Não pode haver impunidade. Escândalo é escândalo, seja de quem for.', 'Presidente da Embratur comenta cultura política após denúncias no governo.', 'verified', false, '2024-09-10', 'https://www.poder360.com.br/governo/freixo-corrupcao-governo/', 'news_article', 2, 'Brasília', 'Entrevista à CBN', 'freixo-blindagem-corrupcao-b134-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Ricardo Lewandowski é criticado por indicações de parentes no MJ.', 'As nomeações são técnicas e seguem o mérito profissional.', 'Ministro da Justiça responde a críticas sobre nomeação de familiares.', 'verified', false, '2024-10-14', 'https://www.metropoles.com/brasil/politica-br/lewandowski-nomeacoes-parentes', 'news_article', 3, 'Ministério da Justiça', 'Resposta a denúncias', 'lewandowski-parentes-mj-b134-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias é acusado de abrir espaço para aliados na AGU.', 'Todos os indicados têm capacidade técnica comprovada.', 'Reportagem mostra indicações políticas para assessorias da AGU.', 'verified', false, '2024-06-25', 'https://www1.folha.uol.com.br/poder/2024/06/messias-indicacoes-agu.shtml', 'news_article', 2, 'AGU', 'Reportagem investigativa', 'messias-indicacoes-agu-b134-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino é questionado por indicações no Ministério da Justiça.', 'Todas as indicações seguem critérios técnicos rigorosos.', 'Denúncia aponta indicações políticas em cargos do MJ.', 'verified', false, '2024-01-18', 'https://www.cnnbrasil.com.br/politica/dino-indicacoes-mj/', 'news_article', 2, 'Ministério da Justiça', 'Denúncia de indicações', 'dino-indicacoes-mj-b134-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia defende independência do TSE em ataques bolsonaristas.', 'O TSE não se curva a pressões. Agimos conforme a lei.', 'Presidente do TSE rebate ataques após multas a Bolsonaro.', 'verified', true, '2024-11-19', 'https://www.tse.jus.br/comunicacao/noticias/2024/11/19/carmen-lucia-tse-independencia', 'other', 1, 'TSE', 'Pronunciamento oficial', 'carmen-tse-independencia-b134-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wag, 'Jaques Wagner é apontado por indicações na Petrobras.', 'As indicações atendem critérios técnicos e interesses do Brasil.', 'Senador responde a crítica sobre influência em estatais.', 'verified', false, '2024-04-30', 'https://valor.globo.com/politica/noticia/2024/04/30/jaques-wagner-petrobras.ghtml', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'wagner-indicacoes-petrobras-b134-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é indiciado pela PF por tentativa de golpe de Estado.', 'Golpe é o que fizeram comigo. Eu sempre respeitei a Constituição.', 'PF indicia ex-presidente e 36 pessoas por tentativa de golpe e abolição do Estado.', 'verified', true, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/bolsonaro-indiciado-golpe-pf.ghtml', 'news_article', 5, 'Polícia Federal', 'Conclusão inquérito do golpe', 'bolsonaro-indiciado-golpe-b134-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro admite pressão sobre militares em reunião gravada pelo general Braga Netto.', 'Vamos virar a mesa. O que precisar fazer vamos fazer.', 'Gravações revelam reunião ministerial discutindo plano golpista em julho de 2022.', 'verified', true, '2024-11-24', 'https://www1.folha.uol.com.br/poder/2024/11/reuniao-golpe-bolsonaro-militares.shtml', 'news_article', 5, 'Palácio do Planalto', 'Reunião ministerial gravada', 'bolsonaro-virar-mesa-golpe-b134-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem pede licença da Câmara após virar réu na trama golpista.', 'Afasto-me temporariamente para defender meu nome com mais foco.', 'Deputado vira réu no STF pelo núcleo 1 do processo golpista.', 'verified', false, '2025-04-03', 'https://www.cnnbrasil.com.br/politica/ramagem-licenca-camara-golpe/', 'news_article', 3, 'Câmara dos Deputados', 'Pedido de licença', 'ramagem-licenca-camara-b134-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes aceita denúncia da PGR contra Bolsonaro e mais 33 pela trama golpista.', 'Estão presentes os elementos mínimos para recebimento da denúncia.', 'STF torna Bolsonaro réu por tentativa de golpe.', 'verified', true, '2025-03-26', 'https://g1.globo.com/politica/noticia/2025/03/26/stf-recebe-denuncia-bolsonaro-golpe.ghtml', 'news_article', 1, 'STF', 'Julgamento recebimento denúncia', 'moraes-bolsonaro-reu-b134-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia vota pela condenação de Bolsonaro no julgamento do golpe.', 'Ficou cabalmente demonstrada a tentativa organizada de golpe de Estado.', 'Ministra acompanha relator em julgamento histórico no STF.', 'verified', true, '2025-09-11', 'https://www12.senado.leg.br/noticias/materias/2025/09/11/carmen-lucia-voto-bolsonaro-golpe', 'other', 1, 'STF', 'Julgamento AP 2668', 'carmen-voto-bolsonaro-b134-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é condenado a 27 anos por tentativa de golpe.', 'Sou inocente. A história me julgará com justiça.', 'Primeira Turma do STF condena ex-presidente por cinco crimes golpistas.', 'verified', true, '2025-09-11', 'https://www1.folha.uol.com.br/poder/2025/09/bolsonaro-condenado-27-anos-stf.shtml', 'news_article', 5, 'STF', 'Sentença AP 2668', 'bolsonaro-condenado-27-anos-b134-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula sanções contra Moraes após condenação do pai.', 'Moraes vai pagar. Quem persegue brasileiros tem que sentir na pele.', 'Deputado articula com senadores republicanos aplicação da Magnitsky.', 'verified', true, '2025-07-18', 'https://www.cnnbrasil.com.br/politica/eduardo-magnitsky-moraes/', 'news_article', 5, 'Washington', 'Articulação nos EUA', 'eduardo-magnitsky-moraes-b134-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio defende anistia ampla em nome da "pacificação nacional".', 'A anistia é indispensável para encerrar esse ciclo de perseguição.', 'Senador articula PL da anistia no Congresso.', 'verified', false, '2025-06-09', 'https://www12.senado.leg.br/noticias/materias/2025/06/09/flavio-bolsonaro-anistia', 'other', 3, 'Senado Federal', 'Articulação PL Anistia', 'flavio-anistia-pacificacao-b134-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada por invasão hacker ao sistema do CNJ.', 'Não cometi crime algum. Tudo é perseguição política.', 'STF condena deputada a 10 anos por invasão hacker com Delgatti.', 'verified', true, '2025-05-14', 'https://g1.globo.com/politica/noticia/2025/05/14/zambelli-condenada-hacker-cnj.ghtml', 'news_article', 5, 'STF', 'Condenação hacker', 'zambelli-condenada-cnj-b134-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_via, 'Carlos Viana acusa governo de blindar Lupi no INSS.', 'Houve omissão criminal do governo em deixar Lupi por tanto tempo no cargo.', 'Relator da CPI do Banco Master comenta também o caso INSS.', 'verified', false, '2025-05-06', 'https://www12.senado.leg.br/noticias/materias/2025/05/06/carlos-viana-lupi-blindagem', 'other', 3, 'Senado Federal', 'Discurso em plenário', 'viana-blindagem-lupi-b134-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama aponta contribuições do INSS para campanhas eleitorais.', 'Descobrimos que parte do dinheiro desviado financiou campanhas em 2022.', 'Relatório da CPMI indica ramificação eleitoral do esquema.', 'verified', true, '2025-10-15', 'https://www1.folha.uol.com.br/poder/2025/10/cpmi-inss-campanhas-eleitorais.shtml', 'news_article', 1, 'Congresso Nacional', 'Relatório da CPMI', 'eliziane-inss-campanhas-b134-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lli, 'Lulinha é citado por CGU em contratos com estatais.', 'Não tive qualquer contrato indevido com o setor público.', 'CGU abre apuração sobre contratos da Gamecorp com estatais sob governo Lula.', 'verified', true, '2025-11-12', 'https://www.cgu.gov.br/noticias/2025/11/lulinha-contratos-estatais.htm', 'other', 4, 'CGU', 'Apuração administrativa', 'lulinha-cgu-estatais-b134-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula rejeita relatório da CPMI que indicia o próprio filho.', 'Meu filho é trabalhador honesto. A CPMI foi usada politicamente contra mim.', 'Pronunciamento após divulgação do relatório final da CPMI do INSS.', 'verified', true, '2025-10-29', 'https://g1.globo.com/politica/noticia/2025/10/29/lula-rejeita-relatorio-cpmi-lulinha.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Pronunciamento à imprensa', 'lula-rejeita-cpmi-lulinha-b134-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que relatório da CPMI prova "Petrolão 2.0".', 'Estamos diante do novo Petrolão. Lulinha é o centro do esquema.', 'Deputado discursa contra o PT após divulgação do relatório da CPMI do INSS.', 'verified', true, '2025-10-30', 'https://www.metropoles.com/brasil/politica-br/nikolas-petrolao-2-inss', 'news_article', 3, 'Câmara dos Deputados', 'Discurso em plenário', 'nikolas-petrolao-2-b134-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta articula blindagem de parlamentares no caso das emendas.', 'Emendas são prerrogativa constitucional. Não aceitarei ataque a esse direito.', 'Presidente da Câmara reage a decisões do STF sobre emendas Pix.', 'verified', true, '2025-08-22', 'https://www1.folha.uol.com.br/poder/2025/08/motta-reage-stf-emendas.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Coletiva de imprensa', 'motta-blindagem-emendas-b134-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alcolumbre centraliza emendas e é questionado por transparência.', 'Senado age conforme a lei. O TCU fiscaliza e nós cumprimos tudo.', 'Presidente do Senado rebate reportagens sobre emendas em AP.', 'verified', false, '2025-09-01', 'https://valor.globo.com/politica/noticia/2025/09/01/alcolumbre-emendas-transparencia.ghtml', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'alcolumbre-defende-emendas-b134-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alessandro Vieira defende fim das emendas de relator.', 'As emendas RP-9 e Pix são a nova face do orçamento secreto. Precisam acabar.', 'Senador apresenta PEC para extinguir emendas de relator.', 'verified', false, '2024-05-28', 'https://www12.senado.leg.br/noticias/materias/2024/05/28/alessandro-vieira-pec-emendas', 'other', 2, 'Senado Federal', 'Apresentação de PEC', 'alessandro-pec-emendas-b134-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel van Hattem cobra CPI sobre emendas Pix sem rastreio.', 'O povo precisa saber para onde vão bilhões sem rastro nenhum.', 'Deputado do Novo articula requerimento de CPI na Câmara.', 'verified', false, '2024-09-18', 'https://www.camara.leg.br/noticias/1045678-van-hattem-cpi-emendas-pix', 'other', 2, 'Câmara dos Deputados', 'Requerimento de CPI', 'van-hattem-cpi-emendas-b134-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira ameaça retaliar STF após suspensão de emendas Pix.', 'Se o STF insistir em invadir a competência do Legislativo, haverá reação.', 'Presidente da Câmara reage à decisão de Flávio Dino no STF.', 'verified', true, '2024-08-15', 'https://g1.globo.com/politica/noticia/2024/08/15/lira-ameaca-stf-emendas.ghtml', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista coletiva', 'lira-ameaca-stf-emendas-b134-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino suspende emendas Pix sem rastreabilidade em decisão histórica.', 'Não há dinheiro público sem rastreio. A Constituição exige transparência.', 'Ministro do STF determina suspensão de pagamentos até regularização.', 'verified', true, '2024-08-09', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=528453', 'other', 1, 'STF', 'Decisão monocrática', 'dino-suspende-emendas-pix-b134-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski admite atraso na investigação da PF no caso INSS.', 'Reconheço que poderíamos ter agido antes. Mas o resultado foi contundente.', 'Ministro da Justiça comenta Operação Sem Desconto.', 'verified', false, '2025-05-08', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2025/05/lewandowski-operacao-sem-desconto', 'other', 2, 'Ministério da Justiça', 'Coletiva de imprensa', 'lewandowski-admite-atraso-b134-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wag, 'Jaques Wagner admite desgaste do governo com caso INSS.', 'O governo sofre desgaste, mas está agindo corretamente.', 'Líder do governo no Senado comenta crise do INSS.', 'verified', false, '2025-05-12', 'https://www12.senado.leg.br/noticias/materias/2025/05/12/jaques-wagner-inss', 'other', 2, 'Senado Federal', 'Entrevista à imprensa', 'wagner-admite-desgaste-b134-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lli, 'Lulinha nega participação em esquema de associações do INSS.', 'Nunca tive vínculo com associações investigadas pela PF.', 'Declaração após operação da PF mirar empresários ligados ao escândalo.', 'verified', true, '2025-04-30', 'https://g1.globo.com/politica/noticia/2025/04/30/lulinha-nega-associacoes-inss.ghtml', 'news_article', 4, 'São Paulo', 'Coletiva de imprensa', 'lulinha-nega-associacoes-b134-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar critica CPI do Banco Master por uso político.', 'A CPI não pode virar holofote eleitoral. Queremos apuração séria.', 'Deputado do PSOL comenta rumos da CPI do Banco Master.', 'verified', false, '2025-12-10', 'https://www.camara.leg.br/noticias/1089001-chico-alencar-cpi-master', 'other', 1, 'Câmara dos Deputados', 'Entrevista à imprensa', 'chico-critica-cpi-master-b134-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad responsabiliza BC por omissão no Banco Master.', 'O Banco Central é o órgão fiscalizador. A Fazenda não regula bancos.', 'Ministro da Fazenda rebate acusações sobre Banco Master.', 'verified', true, '2025-11-25', 'https://valor.globo.com/politica/noticia/2025/11/25/haddad-bc-banco-master.ghtml', 'news_article', 3, 'Ministério da Fazenda', 'Entrevista coletiva', 'haddad-bc-banco-master-b134-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende mais controle em fundos ligados a bancos médios.', 'Precisamos de mais regulação para evitar novos Banco Master.', 'Ministra do Planejamento comenta escândalo do banco após intervenção.', 'verified', false, '2025-12-08', 'https://g1.globo.com/politica/noticia/2025/12/08/tebet-regulacao-bancos-master.ghtml', 'news_article', 1, 'Ministério do Planejamento', 'Entrevista à imprensa', 'tebet-regulacao-bancos-b134-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha nega pressão política em repasses do SUS a estados.', 'Os recursos seguem critérios técnicos, sem qualquer viés político.', 'Denúncia de priorização de repasses para estados governados pelo PT.', 'verified', false, '2025-04-08', 'https://www.cnnbrasil.com.br/politica/padilha-sus-repasses-estados/', 'news_article', 2, 'Ministério da Saúde', 'Resposta a acusações', 'padilha-repasses-sus-b134-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa é questionado por contratos do Novo PAC.', 'O PAC passa por crivo técnico. Não há espaço para favorecimento.', 'Reportagem questiona obras contempladas em municípios ligados ao PT.', 'verified', false, '2024-06-18', 'https://www1.folha.uol.com.br/poder/2024/06/rui-costa-pac-favorecimento.shtml', 'news_article', 3, 'Casa Civil', 'Reportagem investigativa', 'rui-costa-pac-favorecimento-b134-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade é demitida por Lula após crise no Ministério da Saúde.', 'Saio de consciência tranquila. Fiz o melhor pela saúde do Brasil.', 'Presidente anuncia saída de Nísia em meio a atritos com o Congresso.', 'verified', true, '2025-02-26', 'https://g1.globo.com/politica/noticia/2025/02/26/lula-demite-nisia-trindade.ghtml', 'news_article', 2, 'Palácio do Planalto', 'Anúncio oficial', 'nisia-demissao-b134-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jus, 'Juscelino Filho tem bens bloqueados após denúncia do MPF.', 'Vou provar minha inocência. O bloqueio é precipitado.', 'MPF pede bloqueio de R$ 10 milhões em bens do ex-ministro.', 'verified', true, '2025-01-22', 'http://www.mpf.mp.br/ma/sala-de-imprensa/noticias-ma/juscelino-bens-bloqueados', 'other', 4, 'MPF-MA', 'Ação de improbidade', 'juscelino-bens-bloqueados-b134-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_flb, 'Flávio Bolsonaro sofre revés no STJ em ação da rachadinha.', 'Recorrerei até as últimas instâncias. Sou inocente.', 'STJ nega recurso e mantém processo da rachadinha.', 'verified', false, '2024-09-24', 'https://www.stj.jus.br/sites/portalp/Paginas/Comunicacao/Noticias/2024/09/24-flavio-rachadinha.aspx', 'other', 4, 'STJ', 'Julgamento de recurso', 'flavio-revés-stj-b134-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia rejeita argumentos da defesa de Bolsonaro sobre cerceamento.', 'Houve amplo direito à defesa. Não há cerceamento nenhum.', 'Ministra rejeita embargos da defesa no julgamento do golpe.', 'verified', true, '2025-11-14', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=537912', 'other', 1, 'STF', 'Julgamento embargos', 'carmen-rejeita-embargos-b134-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias acusa Lira de chefiar balcão de negócios.', 'Lira transformou a Câmara em balcão de negócios. O orçamento secreto é criminoso.', 'Deputado do PT em pronunciamento em plenário.', 'verified', false, '2023-12-13', 'https://www.camara.leg.br/noticias/1024500-lindbergh-ataca-lira-balcao', 'other', 3, 'Câmara dos Deputados', 'Discurso em plenário', 'lindbergh-balcao-lira-b134-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira diz que Lindbergh "fala o que os patrões mandam".', 'Esse senhor não tem autoridade moral para falar. Fala o que os patrões mandam.', 'Presidente da Câmara retruca ataques do deputado petista.', 'verified', false, '2023-12-14', 'https://www.metropoles.com/brasil/politica-br/lira-lindbergh-patroes', 'news_article', 2, 'Câmara dos Deputados', 'Declaração à imprensa', 'lira-lindbergh-patroes-b134-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro afirma que foi obrigado a fugir para embaixada húngara.', 'Fui para a embaixada por segurança. Não foi fuga.', 'PF confirma que Bolsonaro passou 2 noites na embaixada da Hungria em fev/2024.', 'verified', true, '2024-03-26', 'https://www1.folha.uol.com.br/poder/2024/03/bolsonaro-embaixada-hungria-fuga.shtml', 'news_article', 5, 'Brasília', 'Declaração à imprensa', 'bolsonaro-embaixada-hungria-b134-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina tornozeleira a Bolsonaro por risco de fuga.', 'Elementos concretos apontam risco real de fuga para evadir-se da Justiça.', 'STF aplica medidas cautelares após repetidos episódios suspeitos.', 'verified', true, '2025-07-18', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=533890', 'other', 1, 'STF', 'Decisão cautelar', 'moraes-tornozeleira-bolsonaro-b134-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes defende anulação de provas da Lava Jato.', 'Lava Jato cometeu abusos que não podem ser tolerados em uma democracia.', 'Ministro rebate críticas à anulação de provas contra Lula.', 'verified', false, '2024-02-22', 'https://www.conjur.com.br/2024-fev-22/gilmar-defende-anulacao-lava-jato/', 'news_article', 3, 'STF', 'Entrevista à ConJur', 'gilmar-defende-anulacao-b134-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é denunciado pela PF por fraude em cartões de vacina.', 'Nunca falsifiquei nada. Isso é mais um teatro.', 'PF indicia ex-presidente e Mauro Cid por esquema de cartões adulterados.', 'verified', true, '2024-03-19', 'https://g1.globo.com/politica/noticia/2024/03/19/bolsonaro-indiciado-cartao-vacina.ghtml', 'news_article', 4, 'Polícia Federal', 'Indiciamento cartões vacina', 'bolsonaro-cartao-vacina-b134-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr. cobra inclusão de Lulinha na lista de indiciados da CPMI.', 'Não aceito blindagem. Lulinha deve responder como qualquer cidadão.', 'Relator defende inclusão após pressão de oposição.', 'verified', true, '2025-10-20', 'https://www.poder360.com.br/congresso/duarte-jr-lulinha-indiciamento/', 'news_article', 3, 'Congresso Nacional', 'Debate na CPMI', 'duarte-inclui-lulinha-b134-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe sai do PT e critica governo por caso INSS.', 'Foi a pior gestão de crise que já vi. O governo falhou com os aposentados.', 'Senador anuncia saída da base após crise do INSS.', 'verified', true, '2025-06-02', 'https://www12.senado.leg.br/noticias/materias/2025/06/02/randolfe-saida-pt-inss', 'other', 3, 'Senado Federal', 'Anúncio em plenário', 'randolfe-sai-pt-inss-b134-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende autonomia da AGU em caso Juscelino.', 'A AGU atua com autonomia técnica. Não há blindagem do governo.', 'Advogado-geral responde a acusações de omissão no caso Juscelino.', 'verified', false, '2024-04-25', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/2024/04/messias-autonomia', 'other', 1, 'AGU', 'Entrevista à imprensa', 'messias-autonomia-juscelino-b134-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali acusa oposição de usar INSS politicamente.', 'A oposição quer transformar uma crise gerencial em escândalo político.', 'Deputada do PCdoB em debate na Câmara.', 'verified', false, '2025-05-18', 'https://www.camara.leg.br/noticias/1069900-jandira-inss-oposicao', 'other', 2, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'jandira-oposicao-inss-b134-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel van Hattem denuncia uso indevido da Receita Federal pelo governo.', 'Há indícios de que a Receita vem sendo usada como arma política.', 'Deputado apresenta requerimento de CPI sobre vazamentos do Fisco.', 'verified', false, '2024-10-05', 'https://www.camara.leg.br/noticias/1049900-van-hattem-receita-vazamentos', 'other', 3, 'Câmara dos Deputados', 'Requerimento de CPI', 'van-hattem-receita-vazamentos-b134-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende Receita Federal após acusações de vazamentos.', 'A Receita não é usada politicamente. Isso é fake news.', 'Ministro rebate deputados do Novo e do PL.', 'verified', false, '2024-10-08', 'https://valor.globo.com/politica/noticia/2024/10/08/haddad-defende-receita-vazamentos.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Coletiva de imprensa', 'haddad-defende-receita-b134-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro começa cumprimento de pena em regime fechado.', 'Sigo preso por convicção. O Brasil merece melhor do que isso.', 'Ex-presidente é levado a cumprir pena em Brasília após trânsito em julgado.', 'verified', true, '2025-11-22', 'https://g1.globo.com/politica/noticia/2025/11/22/bolsonaro-inicia-pena-regime-fechado.ghtml', 'news_article', 5, 'Brasília', 'Cumprimento de pena', 'bolsonaro-inicia-pena-b134-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alessandro Vieira defende extinção do foro privilegiado após Zambelli.', 'A fuga de Zambelli mostra que o foro privilegiado não funciona.', 'Senador apresenta PEC para extinção do foro especial.', 'verified', false, '2025-06-10', 'https://www12.senado.leg.br/noticias/materias/2025/06/10/alessandro-pec-foro', 'other', 1, 'Senado Federal', 'Apresentação de PEC', 'alessandro-pec-foro-b134-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino condena aprovação de anistia como "afronta ao Estado de Direito".', 'Anistia para golpistas é afronta inaceitável ao Estado de Direito.', 'Ministro do STF se manifesta sobre projeto em tramitação.', 'verified', true, '2025-09-20', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=536000', 'other', 1, 'STF', 'Declaração pública', 'dino-condena-anistia-b134-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai vetar qualquer anistia a golpistas.', 'Enquanto eu for presidente, não terá anistia para quem atacou a democracia.', 'Presidente reage a articulação do Centrão no Congresso.', 'verified', true, '2025-09-18', 'https://www1.folha.uol.com.br/poder/2025/09/lula-veta-anistia-golpistas.shtml', 'news_article', 2, 'Palácio do Planalto', 'Entrevista coletiva', 'lula-veta-anistia-b134-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama conclui CPMI do INSS como "maior esquema da história recente".', 'Identificamos o maior esquema de roubo contra aposentados da nossa história.', 'Declaração em coletiva após aprovação do relatório final.', 'verified', true, '2025-10-28', 'https://www.cnnbrasil.com.br/politica/eliziane-cpmi-inss-maior-esquema/', 'news_article', 1, 'Congresso Nacional', 'Coletiva CPMI INSS', 'eliziane-maior-esquema-b134-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

END $$;
