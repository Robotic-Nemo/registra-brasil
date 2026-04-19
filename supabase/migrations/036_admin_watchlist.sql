-- Admin editorial watchlist.
--
-- A small hand-curated list of politicians the editorial team is
-- paying extra attention to. Lets the admin dashboard surface recent
-- activity from watchlisted figures in a tighter feed than the
-- global submission queue.
--
-- Not user-facing: RLS denies public reads entirely. Writes go
-- through service-role server actions.

CREATE TABLE IF NOT EXISTS admin_watchlist (
  politician_id uuid PRIMARY KEY REFERENCES politicians(id) ON DELETE CASCADE,
  reason text,
  priority smallint NOT NULL DEFAULT 2 CHECK (priority BETWEEN 1 AND 4),
  added_by text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_admin_watchlist_priority
  ON admin_watchlist(priority, created_at DESC);

ALTER TABLE admin_watchlist ENABLE ROW LEVEL SECURITY;
-- No public policies — service role only.

/**
 * Recent activity from watchlisted politicians within the last
 * `window_days` days. Returns one row per statement, newest first,
 * with the watchlist metadata denormalized for convenience.
 */
CREATE OR REPLACE FUNCTION watchlist_recent_activity(
  window_days int DEFAULT 7,
  result_limit int DEFAULT 50
)
RETURNS TABLE (
  statement_id uuid,
  statement_slug text,
  summary text,
  statement_date date,
  verification_status text,
  politician_id uuid,
  politician_slug text,
  politician_name text,
  priority smallint,
  reason text
)
LANGUAGE sql STABLE AS $$
  SELECT
    s.id AS statement_id,
    s.slug AS statement_slug,
    s.summary,
    s.statement_date,
    s.verification_status,
    p.id AS politician_id,
    p.slug AS politician_slug,
    p.common_name AS politician_name,
    w.priority,
    w.reason
  FROM admin_watchlist w
  JOIN politicians p ON p.id = w.politician_id
  JOIN statements s ON s.politician_id = p.id
  WHERE s.verification_status <> 'removed'
    AND s.created_at >= (now() - make_interval(days => window_days))
  ORDER BY s.created_at DESC
  LIMIT result_limit;
$$;
