-- Reader-submitted issue reports.
--
-- Any reader can flag a problem with any page on the site — a typo,
-- a broken link, a miscategorized statement, a politician photo
-- pointing to the wrong person, etc. Separate from /retratacoes
-- (formal legal/factual petitions) and /sugerir (new content
-- submissions) because the bar is much lower and the volume higher.
--
-- No PII is required. Email is optional, used only if the editor
-- needs to follow up. Unauthenticated INSERT is allowed; everyone
-- else sees nothing.

CREATE TABLE IF NOT EXISTS page_issues (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  url text NOT NULL,
  kind text NOT NULL,
  message text NOT NULL,
  email text,
  user_agent text,
  status text NOT NULL DEFAULT 'open',
  resolution_note text,
  resolved_at timestamptz,
  resolved_by text,
  created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT page_issues_kind_check
    CHECK (kind IN ('typo', 'broken_link', 'wrong_info', 'accessibility', 'other')),
  CONSTRAINT page_issues_status_check
    CHECK (status IN ('open', 'acknowledged', 'resolved', 'spam')),
  CONSTRAINT page_issues_message_len CHECK (char_length(message) BETWEEN 4 AND 4000),
  CONSTRAINT page_issues_url_len CHECK (char_length(url) <= 1024)
);

CREATE INDEX IF NOT EXISTS idx_page_issues_status_created
  ON page_issues(status, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_page_issues_kind ON page_issues(kind);

ALTER TABLE page_issues ENABLE ROW LEVEL SECURITY;

-- Anon insert (captcha/rate-limit enforced at the API layer). No
-- public SELECT — admins read via service role.
DROP POLICY IF EXISTS page_issues_insert_public ON page_issues;
CREATE POLICY page_issues_insert_public ON page_issues
  FOR INSERT TO anon, authenticated
  WITH CHECK (true);

-- Summary counters for the admin dashboard.
CREATE OR REPLACE FUNCTION page_issues_summary()
RETURNS TABLE (status text, total bigint)
LANGUAGE sql STABLE AS $$
  SELECT status, count(*)::bigint FROM page_issues GROUP BY status;
$$;
