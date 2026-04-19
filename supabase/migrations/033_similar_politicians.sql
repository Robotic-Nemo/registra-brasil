-- Thematic politician similarity.
--
-- Computes the cosine similarity between a target politician and every
-- other active politician using each politician's distribution of
-- statements across editorial categories as the vector. Political-party
-- affiliation is intentionally excluded from the feature — the intent
-- is to surface rhetorical kinship even when the parties differ.

CREATE OR REPLACE FUNCTION similar_politicians(
  pid uuid,
  result_limit int DEFAULT 6
)
RETURNS TABLE (
  id uuid,
  slug text,
  common_name text,
  party text,
  state text,
  photo_url text,
  similarity real,
  shared_categories int
)
LANGUAGE sql STABLE AS $$
  WITH me AS (
    SELECT sc.category_id, count(*)::float AS cnt
    FROM statement_categories sc
    JOIN statements s ON s.id = sc.statement_id
    WHERE s.politician_id = pid
      AND s.verification_status <> 'removed'
    GROUP BY sc.category_id
  ),
  me_norm AS (
    SELECT sqrt(coalesce(sum(cnt * cnt), 0)) AS m FROM me
  ),
  peers AS (
    SELECT s.politician_id, sc.category_id, count(*)::float AS cnt
    FROM statement_categories sc
    JOIN statements s ON s.id = sc.statement_id
    WHERE s.politician_id <> pid
      AND s.verification_status <> 'removed'
    GROUP BY s.politician_id, sc.category_id
  ),
  peer_norms AS (
    SELECT politician_id, sqrt(sum(cnt * cnt)) AS n
    FROM peers GROUP BY politician_id
  ),
  dots AS (
    SELECT p.politician_id,
           sum(p.cnt * m.cnt) AS dot,
           count(*) AS shared_cats
    FROM peers p
    JOIN me m ON m.category_id = p.category_id
    GROUP BY p.politician_id
  )
  SELECT
    p.id, p.slug, p.common_name, p.party, p.state, p.photo_url,
    (d.dot / NULLIF((SELECT m FROM me_norm) * pn.n, 0))::real AS similarity,
    d.shared_cats::int AS shared_categories
  FROM politicians p
  JOIN peer_norms pn ON pn.politician_id = p.id
  JOIN dots d ON d.politician_id = p.id
  WHERE p.is_active = true
    AND (SELECT m FROM me_norm) > 0
    AND pn.n > 0
  ORDER BY similarity DESC NULLS LAST, d.shared_cats DESC
  LIMIT result_limit;
$$;

GRANT EXECUTE ON FUNCTION similar_politicians(uuid, int) TO anon, authenticated;
