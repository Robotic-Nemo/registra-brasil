-- Site-wide editable settings.
--
-- Not a kitchen-sink feature-flag system — just a small set of knobs
-- the editorial team wants to change without a deploy: maintenance
-- banner text, weekly-digest toggle, editorial SLAs. Each setting is
-- a row keyed by a well-known string, value as jsonb for flexibility.
--
-- Public read: yes, these values control the public UI; client code
-- fetches them server-side. Writes: service role only (admin UI).

CREATE TABLE IF NOT EXISTS site_settings (
  key text PRIMARY KEY,
  value jsonb NOT NULL,
  description text,
  updated_at timestamptz NOT NULL DEFAULT now(),
  updated_by text,

  CHECK (length(key) BETWEEN 2 AND 80),
  CHECK (description IS NULL OR length(description) <= 500)
);

ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS site_settings_public_read ON site_settings;
CREATE POLICY site_settings_public_read ON site_settings
  FOR SELECT USING (true);

DROP POLICY IF EXISTS site_settings_no_public_write ON site_settings;
CREATE POLICY site_settings_no_public_write ON site_settings
  FOR ALL USING (false) WITH CHECK (false);

-- Seed the known-good defaults. Idempotent via ON CONFLICT DO NOTHING
-- so re-applying this migration doesn't clobber editor changes.
INSERT INTO site_settings (key, value, description) VALUES
  ('maintenance_banner', '{"enabled": false, "text": "", "tone": "info"}',
   'Optional banner shown sitewide. tone: info | warn | critical'),
  ('weekly_digest_enabled', 'true',
   'Master switch for the Monday 13:37 weekly digest cron. Disable to pause sends.'),
  ('editorial_sla_days', '10',
   'SLA in business days for review of submissions and retraction requests.'),
  ('submissions_auto_close_days', '90',
   'Submissions with no action after this many days are auto-rejected.'),
  ('footer_message', '""',
   'Optional small text rendered below the footer legal block.')
ON CONFLICT (key) DO NOTHING;
