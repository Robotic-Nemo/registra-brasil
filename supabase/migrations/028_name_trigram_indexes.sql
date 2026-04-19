-- Trigram indexes on the two most-searched name fields.
--
-- The existing pg_trgm extension (migration 010) indexes statement
-- summaries; these cover the other two places a reader expects
-- fuzzy matching: politician names and category labels. Used by
-- `suggest_similar_politician` / `suggest_similar_category` when
-- /buscar returns zero results.

CREATE INDEX IF NOT EXISTS idx_politicians_name_trgm
  ON politicians USING gin (common_name gin_trgm_ops)
  WHERE is_active = true;

CREATE INDEX IF NOT EXISTS idx_categories_label_trgm
  ON categories USING gin (label_pt gin_trgm_ops);

CREATE OR REPLACE FUNCTION suggest_similar_politician(query_text text, result_limit int DEFAULT 3)
RETURNS TABLE (
  slug text,
  common_name text,
  party text,
  state text,
  photo_url text,
  similarity real
)
LANGUAGE sql
STABLE
AS $$
  SELECT p.slug, p.common_name, p.party, p.state, p.photo_url,
         similarity(p.common_name, query_text) AS similarity
  FROM politicians p
  WHERE p.is_active = true
    AND p.common_name % query_text
  ORDER BY similarity DESC
  LIMIT result_limit;
$$;

CREATE OR REPLACE FUNCTION suggest_similar_category(query_text text, result_limit int DEFAULT 3)
RETURNS TABLE (
  slug text,
  label_pt text,
  color_hex text,
  similarity real
)
LANGUAGE sql
STABLE
AS $$
  SELECT c.slug, c.label_pt, c.color_hex,
         similarity(c.label_pt, query_text) AS similarity
  FROM categories c
  WHERE c.label_pt % query_text
  ORDER BY similarity DESC
  LIMIT result_limit;
$$;
