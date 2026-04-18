-- Wayback Machine archival URL fallback.
--
-- When `check-links` finds a 4xx/5xx, it also asks the Internet
-- Archive for the most-recent snapshot. Storing the archival URL on
-- the row means the public statement page can render a transparent
-- "fonte fora do ar — ver no Archive" banner without per-request
-- latency.

ALTER TABLE statements
  ADD COLUMN IF NOT EXISTS source_wayback_url text,
  ADD COLUMN IF NOT EXISTS source_wayback_checked_at timestamptz;

CREATE INDEX IF NOT EXISTS idx_statements_source_wayback
  ON statements(source_wayback_checked_at DESC NULLS LAST)
  WHERE source_wayback_url IS NOT NULL;
