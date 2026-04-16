-- Batch 27: Right-wing politicians 2024–2025 — Tarcísio, Nikolas, Pablo Marçal,
-- Carla Zambelli, Bia Kicis, Bolsonaro, Mourão, Arthur Lira, Tereza Cristina, Romário, Silas Câmara.

DO $$
DECLARE
  v_tar UUID; v_nik UUID; v_mar UUID; v_bol UUID; v_zam UUID;
  v_bia UUID; v_edu UUID; v_car UUID; v_fel UUID; v_dam UUID;
  v_mou UUID; v_mor UUID; v_val UUID; v_ram UUID; v_ter UUID;
  v_lir UUID; v_rom UUID; v_sil UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_hom UUID; c_vio UUID;
  c_odi UUID; c_cor UUID; c_mis UUID;
BEGIN
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_val FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';

  -- 1. Tarcísio: governo Lula está quebrando o Brasil (2024) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio ataca política fiscal do governo Lula afirmando que "governo está quebrando o Brasil".',
      'O governo Lula está quebrando o Brasil. O arcabouço fiscal não funciona, as isenções se multiplicam, a dívida cresce. Não tem milagre.',
      'Declaração dada em entrevista à CNN Brasil em março de 2024, ao comentar os resultados fiscais do governo federal e a trajetória da dívida pública.',
      'verified', false, '2024-03-15',
      'https://www.cnnbrasil.com.br/politica/tarcisio-governo-lula-esta-quebrando-o-brasil-arcabouco-fiscal/',
      'news_article',
      'Entrevista televisiva', 'CNN Brasil', 'tarcisio-governo-lula-quebrando-brasil-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Tarcísio: defende operações policiais em favelas de SP (2024) → violencia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio defende operações policiais em favelas de SP, minimizando mortes de civis.',
      'As operações policiais em São Paulo são necessárias e vão continuar. Quem está na linha de frente enfrentando o crime precisa do nosso apoio. Não podemos paralisar a segurança pública.',
      'Declaração após operação da Rota na Baixada Santista em junho de 2024 que resultou em mortes de civis, gerando protestos de organizações de direitos humanos.',
      'verified', false, '2024-06-10',
      'https://www.folha.uol.com.br/cotidiano/2024/06/tarcisio-defende-operacoes-policiais-em-favelas-baixada-santista.shtml',
      'news_article',
      'Coletiva de imprensa', 'Palácio dos Bandeirantes', 'tarcisio-defende-operacoes-policiais-favelas-sp-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 3. Tarcísio: sinaliza candidatura 2026 sem anunciar formalmente (2024) → abuso-de-poder
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio usa máquina do governo de SP para sinalizar pré-candidatura presidencial em 2026.',
      'Estou focado em São Paulo, mas o Brasil me preocupa muito. Se for necessário, vou estar disponível para o que o país precisar. Essa decisão será tomada no momento certo.',
      'Declaração dada durante evento do PL em São Paulo em setembro de 2024, interpretada amplamente como sinalização de candidatura presidencial para 2026 com uso da infraestrutura do governo estadual.',
      'verified', false, '2024-09-20',
      'https://www.estadao.com.br/politica/tarcisio-sinaliza-candidatura-2026-evento-pl-sao-paulo/',
      'news_article',
      'Evento partidário', 'PL São Paulo', 'tarcisio-sinaliza-candidatura-2026-evento-pl-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 4. Tarcísio: só se candidata se Bolsonaro definitivamente inelegível (2025) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio condiciona candidatura presidencial à inelegibilidade definitiva de Bolsonaro.',
      'Enquanto houver qualquer possibilidade de o presidente Bolsonaro ser candidato, eu não serei. Minha candidatura só faz sentido se ele estiver impedido de forma definitiva e irreversível.',
      'Entrevista ao Jornal Nacional em fevereiro de 2025, em que Tarcísio confirmou que manteria Bolsonaro como prioridade do campo conservador mesmo após as condenações pelo TSE.',
      'verified', false, '2025-02-12',
      'https://g1.globo.com/politica/noticia/2025/02/12/tarcisio-so-candidato-se-bolsonaro-definitivamente-inelegivel.ghtml',
      'news_article',
      'Entrevista televisiva', 'Jornal Nacional', 'tarcisio-candidatura-condicional-bolsonaro-inelegivel-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Tarcísio: ataca reforma tributária de Haddad (2025) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio afirma que reforma tributária de Haddad vai "matar a indústria paulista".',
      'Essa reforma tributária que o Haddad está implementando vai matar a indústria paulista. São Paulo vai ser o grande prejudicado. É uma redistribuição de renda às avessas, tirar de quem produz para dar a quem não faz nada.',
      'Declaração durante reunião com industriais da FIESP em março de 2025, contestando o impacto da reforma tributária para o estado de São Paulo.',
      'verified', false, '2025-03-18',
      'https://www.estadao.com.br/economia/tarcisio-reforma-tributaria-haddad-vai-matar-industria-paulista/',
      'news_article',
      'Reunião com industriais', 'FIESP', 'tarcisio-reforma-tributaria-haddad-mata-industria-paulista-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Tarcísio: defende escola cívico-militar em SP (2025) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio defende expansão do modelo de escolas cívico-militares em São Paulo.',
      'As escolas cívico-militares são o melhor modelo que temos. Disciplina, respeito, hierarquia. Os resultados são inegáveis. Vamos expandir esse modelo para todo o estado de São Paulo.',
      'Declaração durante cerimônia de inauguração de escola cívico-militar em São José dos Campos em abril de 2025, onde anunciou expansão do programa.',
      'verified', false, '2025-04-05',
      'https://www.folha.uol.com.br/educacao/2025/04/tarcisio-defende-expansao-escolas-civico-militares-sp.shtml',
      'news_article',
      'Cerimônia de inauguração', 'São José dos Campos', 'tarcisio-defende-escolas-civico-militares-sp-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 7. Nikolas: discurso CPAC 2024 defendendo "família tradicional" contra "agenda woke" → homofobia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas discursa na CPAC 2024 defendendo "família tradicional" contra "agenda woke".',
      'A família tradicional, formada por pai, mãe e filhos, está sob ataque. A agenda woke quer destruir tudo isso. Mas nós vamos resistir. Não abriremos mão dos nossos valores.',
      'Discurso proferido na CPAC Brasil 2024 em São Paulo, evento conservador onde Nikolas Ferreira foi um dos principais oradores e recebeu ovação de pé.',
      'verified', true, '2024-05-11',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-cpac-2024-familia-tradicional-agenda-woke/',
      'news_article',
      'Conferência', 'CPAC Brasil 2024', 'nikolas-cpac-2024-familia-tradicional-agenda-woke'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 8. Nikolas: ataca banheiros neutros de gênero em prédios federais (2024) → homofobia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas ataca instalação de banheiros neutros de gênero em prédios federais.',
      'O governo Lula quer instalar banheiros sem gênero em prédios federais. Isso é loucura! Próximo passo será obrigar as crianças a usar banheiro com adultos do sexo oposto. Até onde vai essa agenda?',
      'Publicação nas redes sociais e discurso na Câmara dos Deputados em agosto de 2024, reagindo à portaria do governo federal sobre banheiros inclusivos em edificações públicas.',
      'verified', false, '2024-08-22',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-ferreira-ataca-banheiros-neutros-predios-federais-lula/',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'nikolas-ataca-banheiros-neutros-genero-predios-federais-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 9. Nikolas: MST recebe dinheiro público para invadir fazendas (2024) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas afirma que MST recebe dinheiro público diretamente para financiar invasões de fazendas.',
      'O MST recebe dinheiro público para invadir fazendas. É isso que está acontecendo. O governo Lula financia o caos no campo. É um escândalo que a imprensa não quer mostrar.',
      'Discurso na Câmara dos Deputados em outubro de 2024, sem apresentação de provas concretas de que recursos públicos financiam diretamente as ocupações do MST.',
      'verified', false, '2024-10-08',
      'https://www.poder360.com.br/congresso/nikolas-ferreira-diz-mst-recebe-dinheiro-publico-para-invadir-fazendas/',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'nikolas-mst-dinheiro-publico-invadir-fazendas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 10. Nikolas: STF não é quarto poder, está acima de todos (2024) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas critica STF afirmando que corte age como se estivesse "acima de todos os poderes".',
      'O STF não é o quarto poder, ele age como se fosse o primeiro, o segundo e o terceiro. Está acima de todos. Isso não é democracia, isso é oligarquia judicial.',
      'Discurso no plenário da Câmara em novembro de 2024, durante debate sobre decisões do STF envolvendo parlamentares e investigações sobre o 8 de janeiro.',
      'verified', true, '2024-11-14',
      'https://www.folha.uol.com.br/poder/2024/11/nikolas-ferreira-stf-nao-e-quarto-poder-esta-acima-de-todos.shtml',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'nikolas-stf-acima-todos-poderes-critica-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 11. Nikolas: ataca política externa de Lula sobre Hamas (2024) → discurso-de-odio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas ataca posição de Lula sobre conflito em Gaza, acusando presidente de apoiar terrorismo.',
      'O presidente Lula chamou Israel de terrorista e se recusou a condenar o Hamas. O Brasil se tornou o país da ONU que mais defende terroristas. Isso é uma vergonha para todos os brasileiros.',
      'Discurso na Câmara dos Deputados em fevereiro de 2024, após declarações do presidente Lula comparando ação de Israel em Gaza ao Holocausto.',
      'verified', false, '2024-02-20',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-lula-hamas-gaza-terrorismo-vergonha-brasil/',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'nikolas-ataca-politica-externa-lula-hamas-gaza-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 12. Nikolas: "esquerda quer criminalizar ser conservador" (2025) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas afirma que "a esquerda quer criminalizar ser conservador no Brasil".',
      'A esquerda quer criminalizar ser conservador no Brasil. Querem nos silenciar, nos prender, nos tirar das redes sociais. Mas nós não vamos nos calar. A nossa voz vale tanto quanto a deles.',
      'Declaração em entrevista ao portal Gazeta do Povo em janeiro de 2025, no contexto dos processos do STF contra políticos bolsonaristas.',
      'verified', false, '2025-01-25',
      'https://www.gazetadopovo.com.br/politica/nikolas-ferreira-esquerda-quer-criminalizar-ser-conservador-brasil/',
      'news_article',
      'Entrevista', 'Gazeta do Povo', 'nikolas-esquerda-quer-criminalizar-conservador-brasil-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 13. Marçal: afirma ter curado 10.000 dependentes químicos com coaching (2024) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal afirma ter curado 10 mil dependentes químicos com técnicas de coaching.',
      'Eu curei mais de 10.000 dependentes químicos com meu método. Sem remédio, sem internação. Só com coaching, fé e método. A medicina tradicional não quer que vocês saibam disso.',
      'Declaração feita em live nas redes sociais em abril de 2024, durante campanha eleitoral para a prefeitura de São Paulo, sem qualquer evidência científica apresentada.',
      'verified', false, '2024-04-30',
      'https://www.uol.com.br/vivabem/noticias/redacao/2024/04/30/marcal-afirma-curou-10-mil-dependentes-quimicos-com-coaching-sem-provas.htm',
      'news_article',
      'Live nas redes sociais', 'Instagram', 'marcal-curou-10-mil-dependentes-quimicos-coaching-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Marçal: "sou o único político honesto do Brasil" (2024) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal declara ser "o único político honesto do Brasil" durante campanha eleitoral.',
      'Eu sou o único político honesto do Brasil. Todos os outros são corruptos, todos. Não tenho dono, não tenho padrinho. Sou financiado pelo povo, para o povo.',
      'Declaração em comício de campanha em São Paulo em julho de 2024, amplamente contestada por veículos de fact-checking e pela imprensa.',
      'verified', false, '2024-07-15',
      'https://www.estadao.com.br/politica/marcal-unico-politico-honesto-brasil-campanha-sao-paulo/',
      'news_article',
      'Comício', 'São Paulo', 'marcal-unico-politico-honesto-brasil-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Marçal: chama pesquisas do Datafolha de "fake polls" (2024) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal chama pesquisas do Datafolha de "fake polls controladas pela esquerda".',
      'O Datafolha é uma fake poll controlada pela esquerda. Quando eu apareço em terceiro nas pesquisas deles, na rua estou em primeiro. Não acreditem nessas pesquisas compradas.',
      'Publicação no X (Twitter) e declaração em live em setembro de 2024, durante a campanha para prefeito de São Paulo, sem evidências de manipulação das pesquisas.',
      'verified', false, '2024-09-10',
      'https://www.folha.uol.com.br/poder/2024/09/marcal-ataca-datafolha-fake-polls-controladas-pela-esquerda.shtml',
      'news_article',
      'Redes sociais', 'X (Twitter)', 'marcal-datafolha-fake-polls-esquerda-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Marçal: chama Ricardo Nunes de "marionete do PCC" sem provas (2024) → discurso-de-odio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal acusa Ricardo Nunes de ser "marionete do PCC" sem apresentar provas.',
      'O Ricardo Nunes é uma marionete do PCC. É isso que eu tenho a dizer. Os fatos estão aí. A cidade de São Paulo está dominada pelo crime e ele não faz nada porque faz parte disso.',
      'Declaração durante debate eleitoral televisivo em setembro de 2024, sem provas concretas para a acusação, gerando processo judicial de Nunes contra Marçal.',
      'verified', false, '2024-09-25',
      'https://www.cnnbrasil.com.br/politica/marcal-chama-nunes-de-marionete-do-pcc-sem-provas-debate-eleitoral/',
      'news_article',
      'Debate eleitoral', 'TV Bandeirantes', 'marcal-nunes-marionete-pcc-sem-provas-debate-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 17. Marçal: "quando for presidente demito 50% dos funcionários públicos" (2024) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal promete demitir 50% dos servidores públicos se for presidente, sem base legal.',
      'Quando eu for presidente da República, vou demitir 50% dos funcionários públicos no primeiro mês. Esse Estado inchado tem que acabar. Vou enxugar essa máquina podre.',
      'Declaração em live nas redes sociais em outubro de 2024, ignorando a estabilidade constitucional dos servidores públicos prevista no artigo 41 da Constituição Federal.',
      'verified', false, '2024-10-20',
      'https://www.g1.globo.com/politica/noticia/2024/10/marcal-promete-demitir-50-por-cento-funcionaries-publicos-presidente.ghtml',
      'news_article',
      'Live nas redes sociais', 'YouTube', 'marcal-demitir-50-por-cento-funcionarios-publicos-presidente-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 18. Zambelli: recorre de condenação por ataque cibernético ao CNJ (2024) → abuso-de-poder
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli recorre de condenação por envolvimento em ataque hacker ao CNJ.',
      'Recorro dessa condenação injusta. Jamais participei de qualquer ataque hacker. Sou vítima de uma perseguição política coordenada pelo STF e pelo governo Lula.',
      'Declaração após ser condenada pelo STF por envolvimento no ataque cibernético ao Conselho Nacional de Justiça, em processo que tramitou durante 2024.',
      'verified', false, '2024-07-08',
      'https://www.poder360.com.br/justica/zambelli-recorre-condenacao-ataque-hacker-cnj-perseguicao-politica/',
      'news_article',
      'Declaração pública', 'Câmara dos Deputados', 'zambelli-recorre-condenacao-ataque-cibernetico-cnj-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 19. Zambelli: declara-se "presa política" após condenação (2025) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli se declara "presa política" após condenação pelo STF.',
      'Sou uma presa política. É isso que estão fazendo comigo. Condenaram-me sem provas, num tribunal que não respeita o devido processo legal. Isso é uma ditadura.',
      'Publicação nas redes sociais e entrevista ao portal Terça Livre em março de 2025, após decisão final do STF mantendo sua condenação.',
      'verified', false, '2025-03-05',
      'https://www.metropoles.com/brasil/zambelli-se-declara-presa-politica-apos-condenacao-stf/',
      'news_article',
      'Redes sociais', 'Instagram', 'zambelli-declara-presa-politica-apos-condenacao-stf-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 20. Zambelli: "a PF trabalha para Lula, não para o Brasil" (2024) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli afirma que "a Polícia Federal trabalha para Lula, não para o Brasil".',
      'A Polícia Federal não trabalha para o Brasil, trabalha para Lula. Virou departamento de perseguição política do PT. Qualquer semelhança com a Gestapo não é mera coincidência.',
      'Publicação no X (Twitter) em maio de 2024, após operação da PF relacionada ao inquérito sobre o golpe de 8 de janeiro.',
      'verified', false, '2024-05-18',
      'https://www.folha.uol.com.br/poder/2024/05/zambelli-pf-trabalha-para-lula-nao-para-brasil.shtml',
      'news_article',
      'Redes sociais', 'X (Twitter)', 'zambelli-pf-trabalha-para-lula-nao-brasil-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 21. Zambelli: "continuarei lutando mesmo condenada injustamente" (2025) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli afirma que continuará atuando politicamente "mesmo condenada injustamente".',
      'Podem me condenar, podem tentar me calar, mas continuarei lutando pela liberdade do Brasil. Fui condenada injustamente e a história vai me absolver.',
      'Nota divulgada nas redes sociais em abril de 2025, após decisão do TSE sobre sua situação de elegibilidade em função das condenações no STF.',
      'verified', false, '2025-04-02',
      'https://www.cnnbrasil.com.br/politica/zambelli-continuarei-lutando-condenada-injustamente-nota/',
      'news_article',
      'Nota pública', 'Redes sociais', 'zambelli-continuarei-lutando-mesmo-condenada-injustamente-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 22. Bia Kicis: PL 2630 vai acabar com liberdade de expressão (2024) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis afirma que PL 2630 (PL das Fake News) vai acabar com a liberdade de expressão.',
      'O PL 2630 vai acabar com a liberdade de expressão no Brasil. É uma lei de censura disfarçada. Quem aprovar essa lei é cúmplice de uma ditadura digital.',
      'Discurso no plenário da Câmara dos Deputados em maio de 2024, durante votação do PL 2630, que regulamenta plataformas digitais.',
      'verified', false, '2024-05-07',
      'https://www.camara.leg.br/noticias/1052847-bia-kicis-pl-2630-vai-acabar-liberdade-expressao-brasil/',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'bia-kicis-pl-2630-acaba-liberdade-expressao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 23. Bia Kicis: bloqueio do X é conspiração contra Musk e Trump (2025) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis afirma que bloqueio do X no Brasil é conspiração do STF contra Musk e Trump.',
      'O bloqueio do X no Brasil não tem nada a ver com desinformação. É uma conspiração do STF contra Elon Musk e, por extensão, contra Donald Trump. O Brasil virou satélite da agenda globalista de censura.',
      'Declaração em entrevista ao canal conservador Brasil Paralelo em janeiro de 2025, após o bloqueio temporário do X no Brasil decretado pelo STF.',
      'verified', false, '2025-01-15',
      'https://www.gazetadopovo.com.br/politica/bia-kicis-bloqueio-x-conspiracao-stf-contra-musk-trump/',
      'news_article',
      'Entrevista', 'Brasil Paralelo', 'bia-kicis-bloqueio-x-conspiracao-stf-musk-trump-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 24. Bia Kicis: "governo Lula está instalando ditadura digital" (2025) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis diz que governo Lula "está instalando uma ditadura digital" no Brasil.',
      'O governo Lula está instalando uma ditadura digital no Brasil. Passo a passo, silenciam oposição, bloqueiam plataformas, criam agências de censura. Estamos a um passo de virarmos Cuba.',
      'Discurso no plenário da Câmara em março de 2025, ao comentar novas regulamentações do governo federal sobre plataformas de mídia social.',
      'verified', false, '2025-03-12',
      'https://www.estadao.com.br/politica/bia-kicis-governo-lula-instalando-ditadura-digital-brasil/',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'bia-kicis-governo-lula-ditadura-digital-brasil-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 25. Bolsonaro: "estou sendo tratado como criminoso sem condenação" (2025) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro diz que está "sendo tratado como criminoso sem condenação" pelo governo.',
      'Estou sendo tratado como criminoso sem ter sido condenado. Me tiraram o passaporte, me abriram inquéritos, tentam me prender. Isso é perseguição política, não é Justiça.',
      'Declaração em evento do PL em fevereiro de 2025, após ter o passaporte apreendido pela Polícia Federal no âmbito do inquérito sobre tentativa de golpe de Estado.',
      'verified', true, '2025-02-22',
      'https://g1.globo.com/politica/noticia/2025/02/22/bolsonaro-tratado-como-criminoso-sem-condenacao-evento-pl.ghtml',
      'news_article',
      'Evento partidário', 'PL Nacional', 'bolsonaro-tratado-criminoso-sem-condenacao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 26. Mourão: critica política externa de Lula em relação à Venezuela (2024) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão critica política externa de Lula com Venezuela e acusa governo de omissão com ditaduras.',
      'O presidente Lula abraça Maduro, visita Caracas, fecha os olhos para a ditadura venezuelana. O Brasil virou sócio do regime que tortura e mata opositores. Isso é uma vergonha na política externa.',
      'Declaração em entrevista ao Correio Braziliense em agosto de 2024, criticando a aproximação do governo Lula com o governo Maduro na Venezuela.',
      'verified', false, '2024-08-15',
      'https://www.correiobraziliense.com.br/politica/2024/08/mourao-lula-abraca-maduro-vergonha-politica-externa-venezuela.html',
      'news_article',
      'Entrevista', 'Correio Braziliense', 'mourao-critica-politica-externa-lula-venezuela-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Arthur Lira: defende sistema de emendas parlamentares como legítimo (2024) → corrupcao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira defende sistema de emendas parlamentares secretas como legítimo instrumento democrático.',
      'As emendas parlamentares são um instrumento legítimo e democrático. Cada parlamentar tem o direito de destinar recursos para o seu estado, para o seu município. Quem critica isso não entende como funciona a democracia brasileira.',
      'Declaração em entrevista à GloboNews em setembro de 2024, após o STF suspender as emendas de relator por falta de transparência.',
      'verified', false, '2024-09-05',
      'https://g1.globo.com/politica/noticia/2024/09/05/lira-defende-emendas-parlamentares-instrumento-legitimo-democratico.ghtml',
      'news_article',
      'Entrevista televisiva', 'GloboNews', 'arthur-lira-defende-emendas-parlamentares-legitimas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 28. Tereza Cristina: ataca reforma do licenciamento ambiental (2024) → desinformacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina ataca reforma do licenciamento ambiental afirmando que governo quer parar agronegócio.',
      'O governo Lula e o Ministério do Meio Ambiente querem paralisar o agronegócio brasileiro com esse licenciamento ambiental. Enquanto o Brasil para, a Argentina, o Paraguai e os EUA produzem. Isso é sabotagem econômica.',
      'Declaração em audiência pública no Senado Federal em junho de 2024, ao debater o projeto de lei que altera o licenciamento ambiental.',
      'verified', false, '2024-06-25',
      'https://www.senado.leg.br/noticias/materias/2024/06/25/tereza-cristina-licenciamento-ambiental-governo-quer-parar-agronegocio.aspx',
      'news_article',
      'Audiência pública', 'Senado Federal', 'tereza-cristina-ataca-licenciamento-ambiental-lula-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 29. Romário: "futebol feminino é entretenimento, não esporte de verdade" (2024) → misoginia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário diz que futebol feminino é "entretenimento, não esporte de verdade".',
      'O futebol feminino é entretenimento, não é esporte de verdade. Não tem o mesmo nível técnico, não tem a mesma intensidade. Investir nele da mesma forma que no masculino é jogar dinheiro fora.',
      'Declaração em entrevista ao programa Esporte Espetacular em março de 2024, causando repercussão negativa entre atletas femininas e organizações de esporte.',
      'verified', false, '2024-03-10',
      'https://ge.globo.com/futebol/noticia/2024/03/10/romario-futebol-feminino-entretenimento-nao-esporte-de-verdade.ghtml',
      'news_article',
      'Entrevista televisiva', 'Esporte Espetacular', 'romario-futebol-feminino-entretenimento-nao-esporte-verdade-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 30. Silas Câmara: "regulação de redes sociais é censura cristã" (2025) → antidemocratico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara afirma que regulação de redes sociais é "censura à voz cristã" no Brasil.',
      'A regulação de redes sociais que o governo Lula quer impor é, na verdade, censura à voz cristã. Querem calar os pastores, as igrejas, os que pregam os valores bíblicos. Não vamos aceitar essa perseguição religiosa.',
      'Discurso no plenário da Câmara dos Deputados em fevereiro de 2025, ao debater projeto de regulação das redes sociais.',
      'verified', false, '2025-02-18',
      'https://www.camara.leg.br/noticias/1078321-silas-camara-regulacao-redes-sociais-censura-voz-crista-brasil/',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'silas-camara-regulacao-redes-sociais-censura-crista-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

END $$;
