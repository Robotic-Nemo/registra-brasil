-- Weekly digest tracking.
--
-- The digest cron sends one email per week with the top N statements
-- of the prior 7 days. This table prevents double-sends (idempotency
-- by week_of) and lets the public `/boletim` page show past digests
-- for transparency — readers should see exactly what was emailed.

CREATE TABLE IF NOT EXISTS newsletter_digests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  week_of date NOT NULL UNIQUE,          -- Monday of the covered week (ISO)
  statement_ids uuid[] NOT NULL DEFAULT '{}',
  subject text NOT NULL,
  preview_text text,
  html text,                             -- Rendered HTML for historical lookup
  recipient_count int NOT NULL DEFAULT 0,
  sent_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_newsletter_digests_sent
  ON newsletter_digests(sent_at DESC)
  WHERE sent_at IS NOT NULL;

ALTER TABLE newsletter_digests ENABLE ROW LEVEL SECURITY;

-- Public can read sent digests (transparency).
DROP POLICY IF EXISTS newsletter_digests_public_read ON newsletter_digests;
CREATE POLICY newsletter_digests_public_read ON newsletter_digests
  FOR SELECT USING (sent_at IS NOT NULL);

DROP POLICY IF EXISTS newsletter_digests_no_public_write ON newsletter_digests;
CREATE POLICY newsletter_digests_no_public_write ON newsletter_digests
  FOR ALL USING (false) WITH CHECK (false);
