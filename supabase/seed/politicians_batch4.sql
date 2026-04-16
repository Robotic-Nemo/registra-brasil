-- Additional politicians for 2025-2026 coverage
INSERT INTO politicians (slug, full_name, common_name, party, state, role, is_active) VALUES
  ('michelle-bolsonaro',   'Michelle de Paula Firmo Reinaldo Bolsonaro', 'Michelle Bolsonaro',  'PL',            'DF', 'Ex-Primeira-Dama / Pré-candidata', true),
  ('carlos-viana',         'Carlos Augusto Viana',                       'Carlos Viana',        'PODEMOS',       'MG', 'Senador',                          true),
  ('davi-alcolumbre',      'Davi Alcolumbre',                            'Davi Alcolumbre',     'UNIAO',         'AP', 'Presidente do Senado',             true),
  ('alexandre-de-moraes',  'Alexandre de Moraes',                        'Alexandre de Moraes', 'Indep.',        'SP', 'Ministro do STF',                  true),
  ('celso-sabino',         'Celso Sabino de Oliveira',                   'Celso Sabino',        'UNIAO',         'PA', 'Ministro do Turismo',              true),
  ('simone-tebet',         'Simone Nassar Tebet',                        'Simone Tebet',        'MDB',           'MS', 'Ministra do Planejamento',         true),
  ('carlos-lupi',          'Carlos Roberto Lupi',                        'Carlos Lupi',         'PDT',           'RJ', 'Ministro da Previdência',          true),
  ('ronaldo-caiado',       'Ronaldo Ramos Caiado',                       'Ronaldo Caiado',      'UNIAO',         'GO', 'Governador de Goiás',              true),
  ('ratinho-junior',       'Carlos Roberto Massa Ratinho Junior',        'Ratinho Junior',      'PSD',           'PR', 'Ex-Governador do Paraná',          true),
  ('zema',                 'Romeu Zema Neto',                            'Romeu Zema',          'NOVO',          'MG', 'Governador de Minas Gerais',       true)
ON CONFLICT (slug) DO NOTHING;
