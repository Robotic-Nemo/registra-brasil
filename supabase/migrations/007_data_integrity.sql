-- Data integrity hardening identified in deeper audit.
--
-- 1. Primary source URL is the editorial contract with readers (every
--    statement traceable to a primary source). DB-level NOT NULL + CHECK
--    prevents future empty/whitespace-only values from slipping in via
--    seed or direct SQL.
--
-- 2. Duplicate removal + orphan politician cleanup were applied as one-off
--    SQL to prod before this migration existed; re-running is idempotent
--    (DELETE ... WHERE NOT EXISTS yields zero rows on clean state).

DELETE FROM statements s
USING (
  SELECT id, ROW_NUMBER() OVER (
    PARTITION BY politician_id, LOWER(TRIM(summary))
    ORDER BY created_at DESC, id
  ) AS rn
  FROM statements
) d
WHERE s.id = d.id AND d.rn > 1;

DELETE FROM politicians p
WHERE NOT EXISTS (SELECT 1 FROM statements s WHERE s.politician_id = p.id);

ALTER TABLE statements
  ALTER COLUMN primary_source_url SET NOT NULL;

ALTER TABLE statements
  DROP CONSTRAINT IF EXISTS statements_primary_source_url_nonempty;

ALTER TABLE statements
  ADD CONSTRAINT statements_primary_source_url_nonempty
  CHECK (length(trim(primary_source_url)) > 0);
