-- Category frequency trends over time.
--
-- Powers the /tendencias route: one sparkline per category showing
-- how its monthly share of the archive has moved. Computed on the
-- fly from a functional query, not materialized — category volume
-- is low-cardinality and the archive is only ~tens of thousands of
-- rows, so an indexed date_trunc() rollup is plenty fast.

CREATE OR REPLACE FUNCTION get_category_monthly_trends(months_back int DEFAULT 24)
RETURNS TABLE (
  category_id uuid,
  category_slug text,
  category_label text,
  category_color text,
  month date,
  statement_count bigint
)
LANGUAGE sql STABLE AS $$
  WITH window_months AS (
    SELECT generate_series(
      date_trunc('month', (current_date - make_interval(months => months_back - 1))),
      date_trunc('month', current_date),
      '1 month'::interval
    )::date AS month
  ),
  cats AS (
    SELECT id, slug, label_pt, color_hex FROM categories
  )
  SELECT
    c.id,
    c.slug,
    c.label_pt,
    c.color_hex,
    wm.month,
    coalesce(count(DISTINCT s.id), 0)::bigint AS statement_count
  FROM cats c
  CROSS JOIN window_months wm
  LEFT JOIN statement_categories sc ON sc.category_id = c.id
  LEFT JOIN statements s
    ON s.id = sc.statement_id
   AND s.verification_status <> 'removed'
   AND date_trunc('month', s.statement_date)::date = wm.month
  GROUP BY c.id, c.slug, c.label_pt, c.color_hex, wm.month
  ORDER BY c.label_pt, wm.month;
$$;

CREATE OR REPLACE FUNCTION get_archive_monthly_totals(months_back int DEFAULT 24)
RETURNS TABLE (month date, statement_count bigint)
LANGUAGE sql STABLE AS $$
  WITH window_months AS (
    SELECT generate_series(
      date_trunc('month', (current_date - make_interval(months => months_back - 1))),
      date_trunc('month', current_date),
      '1 month'::interval
    )::date AS month
  )
  SELECT
    wm.month,
    coalesce(count(s.id), 0)::bigint AS statement_count
  FROM window_months wm
  LEFT JOIN statements s
    ON date_trunc('month', s.statement_date)::date = wm.month
   AND s.verification_status <> 'removed'
  GROUP BY wm.month
  ORDER BY wm.month;
$$;
