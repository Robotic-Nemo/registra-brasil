-- Estado × categoria heatmap data.
--
-- Mirrors `party_category_matrix` from migration 038 but joins on
-- politicians.state instead of party. Powers
-- /analise/estados-x-categorias.

CREATE OR REPLACE FUNCTION state_category_matrix(
  state_limit int DEFAULT 27,
  category_limit int DEFAULT 12
)
RETURNS TABLE (
  state text,
  state_total bigint,
  category_id uuid,
  category_slug text,
  category_label text,
  category_color text,
  category_total bigint,
  count bigint
)
LANGUAGE sql STABLE AS $$
  WITH state_totals AS (
    SELECT p.state, count(s.id)::bigint AS total
    FROM statements s
    JOIN politicians p ON p.id = s.politician_id
    WHERE s.verification_status <> 'removed'
      AND p.state IS NOT NULL
    GROUP BY p.state
  ),
  top_states AS (
    SELECT state, total FROM state_totals ORDER BY total DESC LIMIT state_limit
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
    SELECT id, slug, label_pt, color_hex, total FROM category_totals ORDER BY total DESC LIMIT category_limit
  ),
  grid AS (
    SELECT p.state, p.total AS state_total,
           c.id, c.slug, c.label_pt, c.color_hex, c.total AS category_total
    FROM top_states p CROSS JOIN top_categories c
  ),
  counts AS (
    SELECT p.state, sc.category_id, count(*)::bigint AS cnt
    FROM statements s
    JOIN politicians p ON p.id = s.politician_id
    JOIN statement_categories sc ON sc.statement_id = s.id
    WHERE s.verification_status <> 'removed'
    GROUP BY p.state, sc.category_id
  )
  SELECT
    g.state,
    g.state_total,
    g.id AS category_id,
    g.slug AS category_slug,
    g.label_pt AS category_label,
    g.color_hex AS category_color,
    g.category_total,
    coalesce(cn.cnt, 0) AS count
  FROM grid g
  LEFT JOIN counts cn ON cn.state = g.state AND cn.category_id = g.id
  ORDER BY g.state_total DESC, g.category_total DESC;
$$;

GRANT EXECUTE ON FUNCTION state_category_matrix(int, int) TO anon, authenticated;
