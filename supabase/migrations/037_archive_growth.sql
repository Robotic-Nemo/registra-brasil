-- Cumulative archive-growth dashboard.
--
-- Single STABLE function returning month-over-month totals plus
-- cumulative running totals for declarations, unique politicians,
-- and unique categories. Drives the public /crescimento page.

CREATE OR REPLACE FUNCTION archive_growth_monthly(months_back int DEFAULT 36)
RETURNS TABLE (
  month date,
  new_statements bigint,
  cumulative_statements bigint,
  new_politicians bigint,
  cumulative_politicians bigint,
  new_categories bigint,
  cumulative_categories bigint
)
LANGUAGE sql STABLE AS $$
  WITH window_months AS (
    SELECT generate_series(
      date_trunc('month', (current_date - make_interval(months => months_back - 1))),
      date_trunc('month', current_date),
      '1 month'::interval
    )::date AS month
  ),
  per_statement AS (
    SELECT date_trunc('month', s.statement_date)::date AS month,
           count(*)::bigint AS new_stmts
    FROM statements s
    WHERE s.verification_status <> 'removed'
    GROUP BY 1
  ),
  pol_first_seen AS (
    SELECT politician_id, min(date_trunc('month', statement_date))::date AS first_month
    FROM statements
    WHERE verification_status <> 'removed'
    GROUP BY politician_id
  ),
  per_politician AS (
    SELECT first_month AS month, count(*)::bigint AS new_pols
    FROM pol_first_seen
    GROUP BY first_month
  ),
  cat_first_seen AS (
    SELECT sc.category_id,
           min(date_trunc('month', s.statement_date))::date AS first_month
    FROM statement_categories sc
    JOIN statements s ON s.id = sc.statement_id
    WHERE s.verification_status <> 'removed'
    GROUP BY sc.category_id
  ),
  per_category AS (
    SELECT first_month AS month, count(*)::bigint AS new_cats
    FROM cat_first_seen
    GROUP BY first_month
  )
  SELECT
    wm.month,
    coalesce(ps.new_stmts, 0) AS new_statements,
    sum(coalesce(ps.new_stmts, 0)) OVER (ORDER BY wm.month) AS cumulative_statements,
    coalesce(pp.new_pols, 0) AS new_politicians,
    sum(coalesce(pp.new_pols, 0)) OVER (ORDER BY wm.month) AS cumulative_politicians,
    coalesce(pc.new_cats, 0) AS new_categories,
    sum(coalesce(pc.new_cats, 0)) OVER (ORDER BY wm.month) AS cumulative_categories
  FROM window_months wm
  LEFT JOIN per_statement ps ON ps.month = wm.month
  LEFT JOIN per_politician pp ON pp.month = wm.month
  LEFT JOIN per_category pc ON pc.month = wm.month
  ORDER BY wm.month;
$$;

GRANT EXECUTE ON FUNCTION archive_growth_monthly(int) TO anon, authenticated;
