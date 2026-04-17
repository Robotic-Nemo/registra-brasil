-- Backfills severity_score on every statement that doesn't have an editorial
-- override. The value is derived from the primary category's severity
-- (fallback: highest severity among linked categories).
--
-- Safe to re-run. Uses explicit WHERE severity_score IS NULL so existing
-- editorial overrides are preserved.
--
-- Categories store severity 1..4; statements allow 1..5. We map 1:1 and
-- let editors raise individual statements to 5 manually.

DO $$
DECLARE
  touched INT;
BEGIN
  -- Path 1: statement has a flagged primary category.
  WITH primary_sev AS (
    SELECT
      sc.statement_id,
      c.severity AS sev
    FROM statement_categories sc
    JOIN categories c ON c.id = sc.category_id
    WHERE sc.is_primary = true
  )
  UPDATE statements s
  SET severity_score = LEAST(5, GREATEST(1, ps.sev))::SMALLINT,
      updated_at = now()
  FROM primary_sev ps
  WHERE s.id = ps.statement_id
    AND s.severity_score IS NULL;

  GET DIAGNOSTICS touched = ROW_COUNT;
  RAISE NOTICE 'Backfilled % statements from primary category severity.', touched;

  -- Path 2: statement has categories but none is_primary — use max severity.
  WITH max_sev AS (
    SELECT
      sc.statement_id,
      MAX(c.severity) AS sev
    FROM statement_categories sc
    JOIN categories c ON c.id = sc.category_id
    GROUP BY sc.statement_id
  )
  UPDATE statements s
  SET severity_score = LEAST(5, GREATEST(1, ms.sev))::SMALLINT,
      updated_at = now()
  FROM max_sev ms
  WHERE s.id = ms.statement_id
    AND s.severity_score IS NULL;

  GET DIAGNOSTICS touched = ROW_COUNT;
  RAISE NOTICE 'Backfilled % statements from max category severity.', touched;

  -- Path 3: statement has no categories at all. Default to neutral 2.
  UPDATE statements
  SET severity_score = 2,
      updated_at = now()
  WHERE severity_score IS NULL;

  GET DIAGNOSTICS touched = ROW_COUNT;
  RAISE NOTICE 'Defaulted % statements to severity 2 (no linked categories).', touched;
END $$;
