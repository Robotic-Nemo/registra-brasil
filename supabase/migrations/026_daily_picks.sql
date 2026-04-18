-- "Declaração do dia" — editorial daily pick.
--
-- Either the editorial team schedules a pick for a given date, or the
-- homepage widget auto-selects the highest-severity verified statement
-- from the last 30 days as a fallback. Storing explicit picks here
-- makes the rotation predictable and archivable (/declaracao-do-dia
-- index shows historical picks).

CREATE TABLE IF NOT EXISTS daily_picks (
  pick_date date PRIMARY KEY,
  statement_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  curator_note text,
  created_at timestamptz NOT NULL DEFAULT now(),
  created_by text,

  CHECK (curator_note IS NULL OR length(curator_note) <= 500)
);

CREATE INDEX IF NOT EXISTS idx_daily_picks_statement
  ON daily_picks(statement_id);

ALTER TABLE daily_picks ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS daily_picks_public_read ON daily_picks;
CREATE POLICY daily_picks_public_read ON daily_picks
  FOR SELECT USING (true);

DROP POLICY IF EXISTS daily_picks_no_public_write ON daily_picks;
CREATE POLICY daily_picks_no_public_write ON daily_picks
  FOR ALL USING (false) WITH CHECK (false);
