-- Performance indexes identified during deep audit.
--
-- idx_statement_categories_category: speeds up "statements in category X"
-- lookups. The table's primary key is (statement_id, category_id), which
-- doesn't help queries filtering by category_id alone.
--
-- idx_statement_categories_primary: partial index on is_primary = true so
-- the common join "pick the primary category for each statement" uses an
-- index scan instead of filtering the full table.
--
-- idx_statements_politician_date: composite index matching the most common
-- query shape on /politico/[slug] — list this politician's verified
-- statements newest-first. Partial on verification_status keeps it small.

CREATE INDEX IF NOT EXISTS idx_statement_categories_category
  ON statement_categories(category_id);

CREATE INDEX IF NOT EXISTS idx_statement_categories_primary
  ON statement_categories(statement_id)
  WHERE is_primary = true;

CREATE INDEX IF NOT EXISTS idx_statements_politician_date
  ON statements(politician_id, statement_date DESC)
  WHERE verification_status = 'verified';
