-- Bulk-import traceability.
--
-- Every CSV/JSON import through /admin/importar creates a row here
-- plus a backlink from each created statement via statements.import_batch_id.
-- Editors can audit who imported what and roll back a batch if needed.
--
-- `checksum` is a hash of the source payload — prevents accidentally
-- applying the same CSV twice.

CREATE TABLE IF NOT EXISTS import_batches (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_filename text,
  source_mime text,
  source_size int,
  checksum text UNIQUE,

  row_count_total int NOT NULL DEFAULT 0,
  row_count_created int NOT NULL DEFAULT 0,
  row_count_skipped int NOT NULL DEFAULT 0,
  row_count_errored int NOT NULL DEFAULT 0,

  status text NOT NULL DEFAULT 'committed',
  error_log jsonb,
  note text,

  created_at timestamptz NOT NULL DEFAULT now(),
  created_by text,

  CHECK (status IN ('committed', 'reverted'))
);

ALTER TABLE statements
  ADD COLUMN IF NOT EXISTS import_batch_id uuid REFERENCES import_batches(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_statements_import_batch
  ON statements(import_batch_id) WHERE import_batch_id IS NOT NULL;

ALTER TABLE import_batches ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS import_batches_service_only ON import_batches;
CREATE POLICY import_batches_service_only ON import_batches
  FOR ALL USING (false) WITH CHECK (false);
