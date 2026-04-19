-- Party × category heatmap data.
--
-- Aggregates non-removed statements by (politician.party, category) so
-- the /analise/partidos-x-categorias page can render a matrix where
-- rows are the N largest parties by total activity and columns are
-- the M most-used categories. Totals for each axis come back in the
-- same rowset so the page can sort and compute shares without a
-- second round-trip.

CREATE OR REPLACE FUNCTION party_category_matrix(
  party_limit int DEFAULT 15,
  category_limit int DEFAULT 15
)
RETURNS TABLE (
  party text,
  party_total bigint,
  category_id uuid,
  category_slug text,
  category_label text,
  category_color text,
  category_total bigint,
  count bigint
)
LANGUAGE sql STABLE AS $$
  WITH party_totals AS (
    SELECT p.party, count(s.id)::bigint AS total
    FROM statements s
    JOIN politicians p ON p.id = s.politician_id
    WHERE s.verification_status <> 'removed'
      AND p.party IS NOT NULL
    GROUP BY p.party
  ),
  top_parties AS (
    SELECT party, total
    FROM party_totals
    ORDER BY total DESC
    LIMIT party_limit
  ),
  category_totals AS (
    SELECT c.id, c.slug, c.label_pt, c.color_hex, count(*)::bigint AS total
    FROM statement_categories sc
    JOIN statements s ON s.id = sc.statement_id
    JOIN categories c ON c.id = sc.category_id
    WHERE s.verification_status <> 'removed'
    GROUP BY c.id, c.slug, c.label_pt, c.color_hex
  ),
  top_categories AS (
    SELECT id, slug, label_pt, color_hex, total
    FROM category_totals
    ORDER BY total DESC
    LIMIT category_limit
  ),
  grid AS (
    SELECT p.party, p.total AS party_total,
           c.id, c.slug, c.label_pt, c.color_hex, c.total AS category_total
    FROM top_parties p CROSS JOIN top_categories c
  ),
  counts AS (
    SELECT p.party, sc.category_id, count(*)::bigint AS cnt
    FROM statements s
    JOIN politicians p ON p.id = s.politician_id
    JOIN statement_categories sc ON sc.statement_id = s.id
    WHERE s.verification_status <> 'removed'
    GROUP BY p.party, sc.category_id
  )
  SELECT
    g.party,
    g.party_total,
    g.id AS category_id,
    g.slug AS category_slug,
    g.label_pt AS category_label,
    g.color_hex AS category_color,
    g.category_total,
    coalesce(cn.cnt, 0) AS count
  FROM grid g
  LEFT JOIN counts cn ON cn.party = g.party AND cn.category_id = g.id
  ORDER BY g.party_total DESC, g.category_total DESC;
$$;

GRANT EXECUTE ON FUNCTION party_category_matrix(int, int) TO anon, authenticated;
