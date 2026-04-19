-- Cost-optimizing partial indexes.
--
-- Almost every public query in the app filters
-- `verification_status <> 'removed'`. A partial index that excludes
-- removed rows makes scans over just the live archive materially
-- faster without bloating overall index size.
--
-- Also adds a politician_id composite so /politico/[slug] joins have
-- a covering path without falling back to the FK index alone.

CREATE INDEX IF NOT EXISTS idx_statements_live_date
  ON statements (statement_date DESC)
  WHERE verification_status <> 'removed';

CREATE INDEX IF NOT EXISTS idx_statements_live_politician_date
  ON statements (politician_id, statement_date DESC)
  WHERE verification_status <> 'removed';

CREATE INDEX IF NOT EXISTS idx_statements_live_created
  ON statements (created_at DESC)
  WHERE verification_status <> 'removed';

-- Frequently-grouped severity histograms.
CREATE INDEX IF NOT EXISTS idx_statements_severity_live
  ON statements (severity_score)
  WHERE verification_status <> 'removed';
