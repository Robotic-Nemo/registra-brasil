-- Contradiction pairs.
--
-- Editorial records of moments where a politician's own statements
-- contradict each other. Not automatic — these are hand-curated by
-- an editor who writes a short note explaining why the two records
-- read as a contradiction. The public /contradicoes page renders
-- only published pairs; drafts stay in admin.
--
-- Stored with a normalized ordering (statement_low_id < statement_high_id)
-- so the UNIQUE constraint catches duplicates regardless of the
-- order the editor picked the two statements.

CREATE TABLE IF NOT EXISTS contradiction_pairs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  politician_id uuid NOT NULL REFERENCES politicians(id) ON DELETE CASCADE,
  statement_low_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  statement_high_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  headline text NOT NULL,
  editor_note text NOT NULL,
  severity smallint NOT NULL DEFAULT 2 CHECK (severity BETWEEN 1 AND 4),
  is_published boolean NOT NULL DEFAULT false,
  created_by text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT contradiction_pairs_distinct CHECK (statement_low_id <> statement_high_id),
  CONSTRAINT contradiction_pairs_ordered CHECK (statement_low_id < statement_high_id),
  UNIQUE (statement_low_id, statement_high_id)
);

CREATE INDEX IF NOT EXISTS idx_contradictions_politician ON contradiction_pairs(politician_id);
CREATE INDEX IF NOT EXISTS idx_contradictions_low ON contradiction_pairs(statement_low_id);
CREATE INDEX IF NOT EXISTS idx_contradictions_high ON contradiction_pairs(statement_high_id);
CREATE INDEX IF NOT EXISTS idx_contradictions_published
  ON contradiction_pairs(is_published, created_at DESC);

ALTER TABLE contradiction_pairs ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS contradictions_select_published ON contradiction_pairs;
CREATE POLICY contradictions_select_published ON contradiction_pairs
  FOR SELECT USING (is_published = true);

-- Trigger to keep updated_at fresh on updates.
CREATE OR REPLACE FUNCTION set_updated_at_contradictions()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_contradictions_updated_at ON contradiction_pairs;
CREATE TRIGGER trg_contradictions_updated_at
  BEFORE UPDATE ON contradiction_pairs
  FOR EACH ROW EXECUTE FUNCTION set_updated_at_contradictions();

-- Return the count of published contradictions that reference a
-- particular statement — powers the "N contradições" badge on the
-- statement detail page.
CREATE OR REPLACE FUNCTION contradiction_count_for_statement(sid uuid)
RETURNS bigint LANGUAGE sql STABLE AS $$
  SELECT count(*)::bigint FROM contradiction_pairs
  WHERE is_published
    AND (statement_low_id = sid OR statement_high_id = sid);
$$;
