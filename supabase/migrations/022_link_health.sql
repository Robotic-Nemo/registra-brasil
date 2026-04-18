-- Source-link health tracking.
--
-- Every statement promises a primary source URL as its editorial
-- anchor. Links rot: 40% of cited URLs on the open web die within
-- 5 years. These columns let an admin cron HEAD each URL and record
-- the latest status so editors can repair archival drift.

ALTER TABLE statements
  ADD COLUMN IF NOT EXISTS source_last_checked_at timestamptz,
  ADD COLUMN IF NOT EXISTS source_http_status int,
  ADD COLUMN IF NOT EXISTS source_check_error text;

CREATE INDEX IF NOT EXISTS idx_statements_source_unchecked
  ON statements(source_last_checked_at NULLS FIRST)
  WHERE verification_status <> 'removed';

CREATE INDEX IF NOT EXISTS idx_statements_source_broken
  ON statements(source_http_status, source_last_checked_at DESC)
  WHERE source_http_status IS NOT NULL AND source_http_status >= 400;
