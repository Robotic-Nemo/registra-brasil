ALTER TABLE statements ENABLE ROW LEVEL SECURITY;
ALTER TABLE politicians ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE statement_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE politician_aliases ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read non-removed statements"
  ON statements FOR SELECT
  USING (verification_status != 'removed');

CREATE POLICY "Public read politicians"
  ON politicians FOR SELECT USING (true);

CREATE POLICY "Public read categories"
  ON categories FOR SELECT USING (true);

CREATE POLICY "Public read statement_categories"
  ON statement_categories FOR SELECT USING (true);

CREATE POLICY "Public read politician_aliases"
  ON politician_aliases FOR SELECT USING (true);
