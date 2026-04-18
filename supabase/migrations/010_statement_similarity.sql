-- Statement similarity via pg_trgm.
--
-- Previous in-memory O(n²) JS detector (lib/utils/duplicate-detection.ts)
-- only ran over the last 500 statements and burned CPU on every page
-- load. Trigram similarity in Postgres pushes the work to the DB where
-- a GIN index turns "statements like this one" into an index scan.
--
-- The SQL function `find_similar_statements` is the single source of
-- truth for similarity across:
--   - /admin/duplicatas (catalog-wide audit)
--   - /api/submissions (auto-flag on insert)
--   - /api/submissions/similar (live preview while user types in /sugerir)

CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE INDEX IF NOT EXISTS idx_statements_summary_trgm
  ON statements USING gin (summary gin_trgm_ops);

CREATE INDEX IF NOT EXISTS idx_submissions_summary_trgm
  ON statement_submissions USING gin (summary gin_trgm_ops);

-- `similar_submission_id` back-reference lets the admin queue show, for
-- each pending submission, which existing statement it most resembles.
ALTER TABLE statement_submissions
  ADD COLUMN IF NOT EXISTS similar_statement_id uuid REFERENCES statements(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS similarity_score real;

CREATE OR REPLACE FUNCTION find_similar_statements(
  query_text text,
  min_similarity real DEFAULT 0.4,
  result_limit int DEFAULT 10,
  filter_politician_id uuid DEFAULT NULL
)
RETURNS TABLE (
  id uuid,
  slug text,
  summary text,
  politician_id uuid,
  statement_date date,
  verification_status text,
  similarity real
)
LANGUAGE sql
STABLE
AS $$
  SELECT
    s.id,
    s.slug,
    s.summary,
    s.politician_id,
    s.statement_date,
    s.verification_status::text,
    similarity(s.summary, query_text) AS similarity
  FROM statements s
  WHERE s.verification_status <> 'removed'
    AND (filter_politician_id IS NULL OR s.politician_id = filter_politician_id)
    AND s.summary % query_text
    AND similarity(s.summary, query_text) >= min_similarity
  ORDER BY similarity DESC, s.statement_date DESC
  LIMIT result_limit;
$$;

-- Bulk variant for the admin duplicate audit: returns every PAIR above
-- the threshold across the whole corpus (or a date window) in a single
-- index-backed pass. `a.id < b.id` dedupes pair directionality.
CREATE OR REPLACE FUNCTION find_all_similar_pairs(
  min_similarity real DEFAULT 0.6,
  since_date date DEFAULT NULL,
  result_limit int DEFAULT 200
)
RETURNS TABLE (
  id_a uuid,
  id_b uuid,
  summary_a text,
  summary_b text,
  politician_id_a uuid,
  politician_id_b uuid,
  date_a date,
  date_b date,
  similarity real
)
LANGUAGE sql
STABLE
AS $$
  SELECT
    a.id,
    b.id,
    a.summary,
    b.summary,
    a.politician_id,
    b.politician_id,
    a.statement_date,
    b.statement_date,
    similarity(a.summary, b.summary) AS similarity
  FROM statements a
  JOIN statements b
    ON a.id < b.id
    AND a.summary % b.summary
  WHERE a.verification_status <> 'removed'
    AND b.verification_status <> 'removed'
    AND (since_date IS NULL OR (a.statement_date >= since_date AND b.statement_date >= since_date))
    AND similarity(a.summary, b.summary) >= min_similarity
  ORDER BY similarity DESC
  LIMIT result_limit;
$$;
