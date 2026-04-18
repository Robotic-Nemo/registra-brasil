-- External fact-check cross-references.
--
-- Journalism in Brazil has a mature fact-checking ecosystem: Agência
-- Lupa, Aos Fatos, Estadão Verifica, G1 Fato ou Fake, Projeto
-- Comprova. When any of those outlets publishes a check about a
-- statement in the archive, the editorial team links it here. Readers
-- see the external checks inline on the declaração page.
--
-- We store only the URL + outlet + rating we're cross-referencing —
-- not a copy of the check itself. Copyright stays with the outlet;
-- the link lives as long as they publish it.

CREATE TYPE fact_check_rating AS ENUM (
  'true',          -- Verdadeiro
  'mostly_true',   -- Em parte verdadeiro
  'half_true',     -- Meia verdade
  'mostly_false',  -- Em parte falso
  'false',         -- Falso
  'misleading',    -- Enganoso / fora de contexto
  'unproven',      -- Sem comprovação
  'satire'         -- Sátira / humor
);

CREATE TABLE IF NOT EXISTS statement_fact_checks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  statement_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,

  outlet text NOT NULL,              -- 'agencia_lupa', 'aos_fatos', 'g1_fato_ou_fake', etc
  outlet_label text NOT NULL,        -- Display name
  url text NOT NULL,
  title text,
  rating fact_check_rating,
  rating_label text,                 -- Outlet's own rating text (may differ per outlet vocabulary)
  published_at date,
  added_by text,                     -- admin user marker
  created_at timestamptz NOT NULL DEFAULT now(),

  UNIQUE (statement_id, url),
  CHECK (length(url) <= 2048 AND url ~ '^https?://'),
  CHECK (length(outlet) BETWEEN 2 AND 60),
  CHECK (length(outlet_label) BETWEEN 2 AND 100),
  CHECK (title IS NULL OR length(title) <= 300)
);

CREATE INDEX IF NOT EXISTS idx_statement_fact_checks_statement
  ON statement_fact_checks(statement_id, published_at DESC NULLS LAST);

CREATE INDEX IF NOT EXISTS idx_statement_fact_checks_outlet
  ON statement_fact_checks(outlet, created_at DESC);

ALTER TABLE statement_fact_checks ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS fact_checks_public_read ON statement_fact_checks;
CREATE POLICY fact_checks_public_read ON statement_fact_checks
  FOR SELECT USING (true);

DROP POLICY IF EXISTS fact_checks_no_public_write ON statement_fact_checks;
CREATE POLICY fact_checks_no_public_write ON statement_fact_checks
  FOR ALL USING (false) WITH CHECK (false);
