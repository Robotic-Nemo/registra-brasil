-- Public statement submission queue.
--
-- Anyone on the public internet can propose a new statement for the
-- archive. Submissions land in a review queue and are triaged by the
-- editorial team. This widens the funnel without compromising the
-- editorial contract — nothing is published without a reviewer flipping
-- the row to 'approved' and converting it into a proper `statements` row.
--
-- Fields map 1:1 to the minimum data we need to make an editorial
-- decision (who said it, what, where the evidence lives). Optional email
-- lets us notify the submitter of outcome without requiring accounts.
--
-- RLS: denies direct reads + writes. All access goes via the service
-- role (insert from /api/submissions after server-side validation;
-- reads + mutations from /admin/submissions under the admin cookie).

CREATE TYPE submission_status AS ENUM ('pending', 'approved', 'rejected', 'duplicate');

CREATE TABLE IF NOT EXISTS statement_submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Either a known politician (FK) or a free-text name if the politician
  -- isn't in the archive yet — editorial decides whether to create them.
  politician_id uuid REFERENCES politicians(id) ON DELETE SET NULL,
  politician_name_raw text,

  summary text NOT NULL,
  full_quote text,
  statement_date date,
  venue text,
  primary_source_url text NOT NULL,
  context text,

  submitter_email text,
  submitter_name text,
  submitter_notes text,

  status submission_status NOT NULL DEFAULT 'pending',
  reviewer_notes text,
  reviewed_at timestamptz,
  reviewed_by text,

  -- When approved, the reviewer creates a canonical `statements` row and
  -- stores the FK here so we can trace provenance of every archive entry
  -- back to its submission.
  resulting_statement_id uuid REFERENCES statements(id) ON DELETE SET NULL,

  -- IP hash (SHA-256 of IP + daily salt) — never store raw IPs. Used
  -- only for abuse mitigation (rate-limit + ban hash if needed).
  submitter_ip_hash text,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  CHECK (length(summary) BETWEEN 10 AND 1000),
  CHECK (full_quote IS NULL OR length(full_quote) <= 5000),
  CHECK (length(primary_source_url) <= 2048),
  CHECK (primary_source_url ~ '^https?://'),
  CHECK (politician_id IS NOT NULL OR length(trim(politician_name_raw)) > 0),
  CHECK (submitter_email IS NULL OR submitter_email ~* '^[^[:space:]]+@[^[:space:]]+\.[^[:space:]]+$')
);

CREATE INDEX IF NOT EXISTS idx_statement_submissions_status
  ON statement_submissions(status, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_statement_submissions_pending
  ON statement_submissions(created_at DESC)
  WHERE status = 'pending';

CREATE INDEX IF NOT EXISTS idx_statement_submissions_politician
  ON statement_submissions(politician_id)
  WHERE politician_id IS NOT NULL;

ALTER TABLE statement_submissions ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS submissions_service_only ON statement_submissions;
CREATE POLICY submissions_service_only ON statement_submissions
  FOR ALL USING (false) WITH CHECK (false);
