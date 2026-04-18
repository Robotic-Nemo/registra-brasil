-- Anonymous search-query analytics.
--
-- Aggregates non-empty queries by day + normalized form. No PII
-- (no IP, no session) — only the term + how many times it was run.
-- Editors use this to see what readers can't find (query terms
-- with zero results) and what topics drive traffic.

CREATE TABLE IF NOT EXISTS search_queries (
  day date NOT NULL,
  q_normalized text NOT NULL,
  hits int NOT NULL DEFAULT 1,
  last_result_count int,
  first_seen_at timestamptz NOT NULL DEFAULT now(),
  last_seen_at timestamptz NOT NULL DEFAULT now(),

  PRIMARY KEY (day, q_normalized),

  CHECK (length(q_normalized) BETWEEN 2 AND 200),
  CHECK (hits >= 1)
);

CREATE INDEX IF NOT EXISTS idx_search_queries_recent
  ON search_queries(day DESC, hits DESC);

-- Public writes are blocked: server-side beacon uses service role.
ALTER TABLE search_queries ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS search_queries_service_only ON search_queries;
CREATE POLICY search_queries_service_only ON search_queries
  FOR ALL USING (false) WITH CHECK (false);

-- Atomic upsert helper so the beacon endpoint stays one-shot.
CREATE OR REPLACE FUNCTION bump_search_query(
  qn text,
  result_count int DEFAULT NULL
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
BEGIN
  INSERT INTO search_queries (day, q_normalized, hits, last_result_count, last_seen_at)
  VALUES (current_date, left(qn, 200), 1, result_count, now())
  ON CONFLICT (day, q_normalized) DO UPDATE
  SET hits = search_queries.hits + 1,
      last_result_count = EXCLUDED.last_result_count,
      last_seen_at = now();
END;
$$;

REVOKE ALL ON FUNCTION bump_search_query(text, int) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION bump_search_query(text, int) TO service_role;
