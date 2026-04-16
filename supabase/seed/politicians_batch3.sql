INSERT INTO politicians (slug, full_name, common_name, party, state, role, wikipedia_url, camara_id, is_active) VALUES
  ('pablo-marcal',       'Pablo Marçal',                     'Pablo Marçal',       'Novo',          'SP', 'Ex-Candidato / Coach',        'https://pt.wikipedia.org/wiki/Pablo_Mar%C3%A7al',                 NULL,   false),
  ('carlos-bolsonaro',   'Carlos Bolsonaro',                  'Carlos Bolsonaro',   'PL',            'RJ', 'Vereador RJ / Deputado',      'https://pt.wikipedia.org/wiki/Carlos_Bolsonaro',                  NULL,   true),
  ('alexandre-ramagem',  'Alexandre Augusto Giordano Ramagem','Alexandre Ramagem',  'PL',            'RJ', 'Deputado Federal',            'https://pt.wikipedia.org/wiki/Alexandre_Ramagem',                 220464, true),
  ('hugo-motta',         'Hugo Leal Motta Neto',              'Hugo Motta',         'REPUBLICANOS',  'PB', 'Presidente da Câmara',        'https://pt.wikipedia.org/wiki/Hugo_Motta',                        220547, true),
  ('guilherme-boulos',   'Guilherme Castro Boulos',           'Guilherme Boulos',   'PSOL',          'SP', 'Deputado Federal',            'https://pt.wikipedia.org/wiki/Guilherme_Boulos',                  220431, true),
  ('flavio-dino',        'Cristóvam Buarque',                 'Flávio Dino',        'PT',            'MA', 'Ministro STF',                'https://pt.wikipedia.org/wiki/Fl%C3%A1vio_Dino',                  NULL,   true),
  ('filipe-martins',     'Filipe Garcia Martins',             'Filipe Martins',     'PL',            'GO', 'Ex-Assessor Presidencial',    'https://pt.wikipedia.org/wiki/Filipe_Martins_(pol%C3%ADtico)',    NULL,   false),
  ('mauro-cid',          'Mauro Cesar Cid',                   'Mauro Cid',          'PL',            'RJ', 'Ex-Ajudante de Ordens',       'https://pt.wikipedia.org/wiki/Mauro_Cid',                         NULL,   false),
  ('alan-lopes',         'Alan Rick Luis Silva Lopes',        'Alan Rick',          'UNIÃO',         'AC', 'Senador',                     'https://pt.wikipedia.org/wiki/Alan_Rick',                         NULL,   true),
  ('jorge-serrão',       'Jorge Serrão',                      'Jorge Serrão',       'PL',            'DF', 'Ex-Deputado',                 NULL,                                                              NULL,   false)
ON CONFLICT (slug) DO NOTHING;
