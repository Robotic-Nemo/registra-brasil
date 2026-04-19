-- Source-reputation aggregates powering /fontes (directory) and
-- /fontes/[domain] (detail). Lets readers see which outlets the
-- archive cites, how often, and which politicians they cover.

CREATE OR REPLACE FUNCTION extract_domain(u text) RETURNS text
LANGUAGE sql IMMUTABLE PARALLEL SAFE AS $$
  SELECT CASE
    WHEN u IS NULL OR u = '' THEN NULL
    ELSE lower(regexp_replace(u, '^(https?://)?(www\.)?([^/?#]+).*$', '\3'))
  END;
$$;

CREATE INDEX IF NOT EXISTS idx_statements_source_domain
  ON statements (extract_domain(primary_source_url))
  WHERE verification_status <> 'removed';

CREATE OR REPLACE FUNCTION get_source_domains(
  result_limit int DEFAULT 100,
  result_offset int DEFAULT 0
)
RETURNS TABLE (
  domain text,
  citation_count bigint,
  politician_count bigint,
  first_seen date,
  last_seen date
)
LANGUAGE sql STABLE AS $$
  SELECT
    extract_domain(s.primary_source_url) AS domain,
    count(*)::bigint AS citation_count,
    count(DISTINCT s.politician_id)::bigint AS politician_count,
    min(s.statement_date) AS first_seen,
    max(s.statement_date) AS last_seen
  FROM statements s
  WHERE s.verification_status <> 'removed'
    AND s.primary_source_url IS NOT NULL
    AND extract_domain(s.primary_source_url) IS NOT NULL
  GROUP BY 1
  ORDER BY citation_count DESC, last_seen DESC NULLS LAST
  LIMIT result_limit OFFSET result_offset;
$$;

CREATE OR REPLACE FUNCTION get_source_domain_detail(
  domain_name text,
  stmt_limit int DEFAULT 20
)
RETURNS TABLE (
  statement_id uuid,
  slug text,
  summary text,
  statement_date date,
  politician_slug text,
  politician_name text,
  primary_source_url text
)
LANGUAGE sql STABLE AS $$
  SELECT s.id, s.slug, s.summary, s.statement_date,
         p.slug, p.common_name, s.primary_source_url
  FROM statements s
  JOIN politicians p ON p.id = s.politician_id
  WHERE s.verification_status <> 'removed'
    AND extract_domain(s.primary_source_url) = lower(domain_name)
  ORDER BY s.statement_date DESC
  LIMIT stmt_limit;
$$;
