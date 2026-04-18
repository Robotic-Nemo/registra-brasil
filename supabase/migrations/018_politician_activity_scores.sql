-- Politician activity scores — severity-weighted, recency-decayed.
--
-- A flat statement count makes long-serving politicians look worse
-- simply because they've been in public life longer. The weighted
-- score discounts old statements exponentially (half-life 365 days)
-- and multiplies by a severity factor so a single high-severity
-- statement ranks higher than many low-severity ones.
--
-- Materialized view so the home page + /ranking can read in O(1)
-- instead of recomputing on every request. Refreshed hourly by
-- `refresh_politician_activity_scores()` — called from Vercel Cron
-- or manually from admin.

CREATE MATERIALIZED VIEW IF NOT EXISTS politician_activity_scores AS
WITH stmt AS (
  SELECT
    s.politician_id,
    s.statement_date,
    s.verification_status,
    s.severity_score,
    -- Exponential recency decay: weight = 0.5 ^ (age_years)
    -- `date - date` yields integer days; half-life 365 days.
    power(0.5, GREATEST(0, (now()::date - s.statement_date))::real / 365.0)::real AS recency_weight,
    -- Severity weight: 1..5 mapped to 0.6..1.4 (even ones below the default 3 still count).
    COALESCE(0.6 + (s.severity_score::real - 1) * 0.2, 1.0) AS severity_weight
  FROM statements s
  WHERE s.verification_status <> 'removed'
)
SELECT
  politician_id,
  COUNT(*)::int AS statements_count,
  COUNT(*) FILTER (WHERE verification_status = 'verified')::int AS verified_count,
  COUNT(*) FILTER (WHERE verification_status = 'disputed')::int AS disputed_count,
  COALESCE(SUM(severity_score), 0)::real AS severity_sum,
  SUM(recency_weight)::real AS recency_score,
  SUM(recency_weight * severity_weight)::real AS weighted_score,
  MAX(statement_date) AS last_statement_date,
  MIN(statement_date) AS first_statement_date
FROM stmt
GROUP BY politician_id;

CREATE UNIQUE INDEX IF NOT EXISTS idx_pas_politician
  ON politician_activity_scores(politician_id);

CREATE INDEX IF NOT EXISTS idx_pas_weighted
  ON politician_activity_scores(weighted_score DESC);

CREATE INDEX IF NOT EXISTS idx_pas_recency
  ON politician_activity_scores(recency_score DESC);

-- Refresh helper — CONCURRENTLY so readers aren't blocked (requires
-- the unique index above).
CREATE OR REPLACE FUNCTION refresh_politician_activity_scores()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY politician_activity_scores;
END;
$$;

REVOKE ALL ON FUNCTION refresh_politician_activity_scores() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION refresh_politician_activity_scores() TO service_role;
