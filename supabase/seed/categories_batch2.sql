-- Additional categories for broader political coverage (2025-2026)
INSERT INTO categories (slug, label_pt, label_en, color_hex, icon, severity, sort_order) VALUES
  ('autoritarismo',         'Autoritarismo',              'Authoritarianism',      '#4C1D95', 'shield-off',      4, 130),
  ('machismo',              'Machismo',                   'Sexism',                '#BE185D', 'alert-triangle',  3, 140),
  ('obstrucao-justica',     'Obstrução de Justiça',       'Obstruction of Justice','#7C2D12', 'shield-off',      4, 150),
  ('ameaca-instituicoes',   'Ameaça às Instituições',     'Threat to Institutions','#1E40AF', 'alert-triangle',  4, 160),
  ('negacionismo',          'Negacionismo',               'Denialism',             '#065F46', 'x-circle',        3, 170),
  ('irresponsabilidade',    'Irresponsabilidade Fiscal',  'Fiscal Irresponsibility','#92400E','dollar-sign',     3, 180),
  ('conflito-interesses',   'Conflito de Interesses',     'Conflict of Interest',  '#78350F', 'users',           3, 190),
  ('intimidacao',           'Intimidação',                'Intimidation',          '#991B1B', 'zap',             4, 200)
ON CONFLICT (slug) DO NOTHING;
