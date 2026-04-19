-- Cost-optimizing RPCs for the all-time /top page.
--
-- The initial version of /top embedded a politicians → statements
-- count join that Supabase-PostgREST forced the server to stream as
-- one row per politician with an embedded `count`. That scales
-- poorly as the politicians table grows.
--
-- These two RPCs do the aggregation server-side and return small,
-- pre-sorted rowsets (≤N rows), keeping the page fast regardless
-- of the archive's size.

CREATE OR REPLACE FUNCTION top_politicians_all_time(result_limit int DEFAULT 20)
RETURNS TABLE (
  id uuid,
  slug text,
  common_name text,
  party text,
  state text,
  photo_url text,
  total bigint
)
LANGUAGE sql STABLE AS $$
  SELECT p.id, p.slug, p.common_name, p.party, p.state, p.photo_url,
         count(*)::bigint AS total
  FROM politicians p
  JOIN statements s ON s.politician_id = p.id
  WHERE p.is_active = true
    AND s.verification_status = 'verified'
  GROUP BY p.id, p.slug, p.common_name, p.party, p.state, p.photo_url
  ORDER BY total DESC
  LIMIT result_limit;
$$;

CREATE OR REPLACE FUNCTION top_categories_all_time(result_limit int DEFAULT 20)
RETURNS TABLE (
  id uuid,
  slug text,
  label_pt text,
  color_hex text,
  total bigint
)
LANGUAGE sql STABLE AS $$
  SELECT c.id, c.slug, c.label_pt, c.color_hex, count(*)::bigint AS total
  FROM categories c
  JOIN statement_categories sc ON sc.category_id = c.id
  JOIN statements s ON s.id = sc.statement_id
  WHERE s.verification_status <> 'removed'
  GROUP BY c.id, c.slug, c.label_pt, c.color_hex
  ORDER BY total DESC
  LIMIT result_limit;
$$;

GRANT EXECUTE ON FUNCTION top_politicians_all_time(int) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION top_categories_all_time(int) TO anon, authenticated;
