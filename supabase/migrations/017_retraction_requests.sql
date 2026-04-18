-- Retraction / right-of-reply requests.
--
-- Anyone can petition for a correction, retraction, or right-of-reply
-- about a specific declaration. Public-facing form at /retratacoes/solicitar
-- lands rows here; editorial team reviews at /admin/retratacoes and
-- chooses: accept (commits a revision), reply (publishes a response),
-- or reject (closes with a reason).
--
-- Brazilian Constitution art. 5º V + Lei 13.188/2015 ("Lei do Direito
-- de Resposta") set the legal baseline. SLA in our Terms §6 is 10
-- business days.

CREATE TYPE retraction_kind AS ENUM (
  'correction',      -- Factual correction
  'retraction',      -- Remove entirely
  'right_of_reply',  -- Publish reply without altering original
  'clarification',   -- Add editorial note
  'takedown_privacy' -- LGPD / minors
);

CREATE TYPE retraction_status AS ENUM (
  'pending',
  'in_review',
  'accepted',
  'replied',
  'rejected',
  'withdrawn'
);

CREATE TABLE IF NOT EXISTS retraction_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  statement_id uuid REFERENCES statements(id) ON DELETE SET NULL,
  statement_url text,

  kind retraction_kind NOT NULL,
  status retraction_status NOT NULL DEFAULT 'pending',

  petitioner_name text NOT NULL,
  petitioner_email text NOT NULL,
  petitioner_role text,       -- "advogado do(a) X", "próprio citado", etc.
  represents_politician_id uuid REFERENCES politicians(id) ON DELETE SET NULL,

  -- What the petitioner claims is wrong and why.
  claim text NOT NULL,
  -- What they'd like done (proposed correction text or reply body).
  desired_remedy text,
  -- Evidence URL(s) backing the claim; comma- or newline-separated.
  evidence_urls text,

  -- Staff workflow
  reviewer_notes text,
  reviewed_at timestamptz,
  reviewed_by text,
  resulting_revision_id uuid REFERENCES statement_revisions(id) ON DELETE SET NULL,
  public_reply text,          -- When status=replied, what we published
  public_reply_published_at timestamptz,

  submitter_ip_hash text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  CHECK (length(petitioner_name) BETWEEN 2 AND 200),
  CHECK (petitioner_email ~* '^[^[:space:]]+@[^[:space:]]+\.[^[:space:]]+$'),
  CHECK (length(claim) BETWEEN 20 AND 5000),
  CHECK (desired_remedy IS NULL OR length(desired_remedy) <= 5000),
  CHECK (public_reply IS NULL OR length(public_reply) <= 5000),
  CHECK (statement_id IS NOT NULL OR (statement_url IS NOT NULL AND length(statement_url) <= 2048))
);

CREATE INDEX IF NOT EXISTS idx_retraction_requests_status
  ON retraction_requests(status, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_retraction_requests_pending
  ON retraction_requests(created_at DESC)
  WHERE status IN ('pending', 'in_review');

CREATE INDEX IF NOT EXISTS idx_retraction_requests_statement
  ON retraction_requests(statement_id)
  WHERE statement_id IS NOT NULL;

ALTER TABLE retraction_requests ENABLE ROW LEVEL SECURITY;

-- Public read ONLY for status='replied' — the published reply is
-- intentionally visible on the statement detail page. All other rows
-- include petitioner PII and stay service-only.
DROP POLICY IF EXISTS retractions_public_replied ON retraction_requests;
CREATE POLICY retractions_public_replied ON retraction_requests
  FOR SELECT USING (status = 'replied' AND public_reply IS NOT NULL);

DROP POLICY IF EXISTS retractions_no_public_write ON retraction_requests;
CREATE POLICY retractions_no_public_write ON retraction_requests
  FOR ALL USING (false) WITH CHECK (false);
