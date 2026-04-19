-- Fix archive_growth_monthly: cumulative totals must include items that
-- first appeared before the window, otherwise politician/category curves
-- start at zero for archives with long history.

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
  WITH window_start AS (
    SELECT date_trunc('month', (current_date - make_interval(months => months_back - 1)))::date AS ws
  ),
  window_months AS (
    SELECT generate_series(
      (SELECT ws FROM window_start),
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
  ),
  -- Seed cumulative totals with everything that happened *before* the window.
  pre_window AS (
    SELECT
      (SELECT coalesce(sum(new_stmts), 0) FROM per_statement WHERE month < (SELECT ws FROM window_start))::bigint AS pre_s,
      (SELECT coalesce(sum(new_pols), 0) FROM per_politician WHERE month < (SELECT ws FROM window_start))::bigint AS pre_p,
      (SELECT coalesce(sum(new_cats), 0) FROM per_category WHERE month < (SELECT ws FROM window_start))::bigint AS pre_c
  ),
  joined AS (
    SELECT wm.month,
           coalesce(ps.new_stmts, 0) AS new_statements,
           coalesce(pp.new_pols, 0) AS new_politicians,
           coalesce(pc.new_cats, 0) AS new_categories
    FROM window_months wm
    LEFT JOIN per_statement ps ON ps.month = wm.month
    LEFT JOIN per_politician pp ON pp.month = wm.month
    LEFT JOIN per_category pc ON pc.month = wm.month
  )
  SELECT
    j.month,
    j.new_statements,
    (SELECT pre_s FROM pre_window) + sum(j.new_statements) OVER (ORDER BY j.month) AS cumulative_statements,
    j.new_politicians,
    (SELECT pre_p FROM pre_window) + sum(j.new_politicians) OVER (ORDER BY j.month) AS cumulative_politicians,
    j.new_categories,
    (SELECT pre_c FROM pre_window) + sum(j.new_categories) OVER (ORDER BY j.month) AS cumulative_categories
  FROM joined j
  ORDER BY j.month;
$$;
