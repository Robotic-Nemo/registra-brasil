-- Adds a per-statement severity score (1=low, 5=critical).
--
-- Rationale: all statements share the category's base severity, but individual
-- occurrences can differ dramatically (a sitting president's anti-democratic
-- speech vs a deputy's offhand remark). When NULL, display logic falls back
-- to the primary category's severity — so existing rows keep working.

ALTER TABLE statements
  ADD COLUMN IF NOT EXISTS severity_score SMALLINT
    CHECK (severity_score IS NULL OR (severity_score BETWEEN 1 AND 5));

COMMENT ON COLUMN statements.severity_score IS
  'Optional editorial severity override (1=low … 5=critical). When NULL, the UI falls back to the primary category severity.';

-- Index to support severity sort/filter on the admin dashboard and the
-- public /ranking-by-severity view. Partial so it only stores rows with a
-- score set (keeps the index small).
CREATE INDEX IF NOT EXISTS idx_statements_severity
  ON statements (severity_score DESC NULLS LAST, statement_date DESC)
  WHERE severity_score IS NOT NULL;
