-- "Hoje na história" — statements from the same month+day as the request,
-- across every year in the archive. Powers /hoje-na-historia.
--
-- Uses (month*100 + day) as a compact integer DoY key (MM*100+DD) that
-- is IMMUTABLE under PostgreSQL's rules, so we can build a real
-- functional index on it.

CREATE INDEX IF NOT EXISTS idx_statements_mmdd
  ON statements (
    (extract(month from statement_date)::int * 100 + extract(day from statement_date)::int)
  )
  WHERE verification_status <> 'removed';

CREATE OR REPLACE FUNCTION statements_on_day_of_year(
  mmdd int,
  result_limit int DEFAULT 200
)
RETURNS TABLE (
  id uuid,
  slug text,
  summary text,
  statement_date date,
  severity_score smallint,
  verification_status text,
  politician_slug text,
  politician_name text,
  politician_party text,
  politician_state text,
  politician_photo_url text
)
LANGUAGE sql STABLE AS $$
  SELECT
    s.id, s.slug, s.summary, s.statement_date, s.severity_score::smallint,
    s.verification_status, p.slug, p.common_name, p.party, p.state, p.photo_url
  FROM statements s
  JOIN politicians p ON p.id = s.politician_id
  WHERE s.verification_status <> 'removed'
    AND (extract(month from s.statement_date)::int * 100
         + extract(day from s.statement_date)::int) = mmdd
  ORDER BY s.statement_date DESC
  LIMIT result_limit;
$$;

GRANT EXECUTE ON FUNCTION statements_on_day_of_year(int, int) TO anon, authenticated;
