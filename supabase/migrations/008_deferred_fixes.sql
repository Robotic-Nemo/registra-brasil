-- Deferred-fix migration: missing tables + compliance columns.
--
-- 1. newsletter_subscribers did not exist in prod — the API was silently
--    failing. Adds table with double-opt-in fields (LGPD art. 8: explicit,
--    specific, informed consent). Subscribers are only `is_active` after
--    confirming via tokenized link emailed to them.
--
-- 2. webhooks table did not exist — POST/DELETE /api/webhooks 500'd. Adds
--    minimal schema compatible with existing dispatcher code.
--
-- 3. politicians.photo_source_url + photo_license: copyright provenance
--    for every photo shown. UI renders a credit badge when present.
--
-- 4. statements.minors_involved: editorial flag for ECA (Lei 8.069/1990)
--    art. 227 compliance. Triggers a UI warning + gates aggregation.
--
-- 5. politicians backfill: set photo_license = 'unknown' for existing rows
--    so the constraint below holds.

CREATE TABLE IF NOT EXISTS newsletter_subscribers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text NOT NULL UNIQUE,
  name text,
  preferences jsonb NOT NULL DEFAULT '{"weeklyDigest": true, "newStatements": false, "verificationUpdates": false}'::jsonb,
  is_active boolean NOT NULL DEFAULT false,
  confirmation_token text,
  confirmation_sent_at timestamptz,
  confirmed_at timestamptz,
  unsubscribed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CHECK (email = lower(email)),
  CHECK (length(email) <= 320),
  CHECK (
    (is_active = true AND confirmed_at IS NOT NULL)
    OR (is_active = false)
  )
);

CREATE INDEX IF NOT EXISTS idx_newsletter_subscribers_active
  ON newsletter_subscribers(is_active) WHERE is_active = true;

CREATE INDEX IF NOT EXISTS idx_newsletter_subscribers_confirmation
  ON newsletter_subscribers(confirmation_token)
  WHERE confirmation_token IS NOT NULL;

ALTER TABLE newsletter_subscribers ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS newsletter_service_only ON newsletter_subscribers;
CREATE POLICY newsletter_service_only ON newsletter_subscribers
  FOR ALL USING (false) WITH CHECK (false);

CREATE TABLE IF NOT EXISTS webhooks (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  url text NOT NULL,
  description text,
  events text[] NOT NULL DEFAULT '{}',
  secret text NOT NULL,
  is_active boolean NOT NULL DEFAULT true,
  last_delivery_at timestamptz,
  last_delivery_status int,
  failure_count int NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CHECK (length(url) <= 2048),
  CHECK (url ~ '^https?://')
);

CREATE INDEX IF NOT EXISTS idx_webhooks_active
  ON webhooks(is_active) WHERE is_active = true;

ALTER TABLE webhooks ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS webhooks_service_only ON webhooks;
CREATE POLICY webhooks_service_only ON webhooks
  FOR ALL USING (false) WITH CHECK (false);

-- Photo provenance on politicians
ALTER TABLE politicians
  ADD COLUMN IF NOT EXISTS photo_source_url text,
  ADD COLUMN IF NOT EXISTS photo_license text;

UPDATE politicians SET photo_license = 'unknown' WHERE photo_license IS NULL;

ALTER TABLE politicians
  DROP CONSTRAINT IF EXISTS politicians_photo_license_check;
ALTER TABLE politicians
  ADD CONSTRAINT politicians_photo_license_check
  CHECK (photo_license IS NULL OR photo_license IN (
    'cc0', 'cc-by', 'cc-by-sa', 'public-domain', 'government-work',
    'fair-use', 'wikimedia', 'unknown'
  ));

-- ECA compliance flag on statements
ALTER TABLE statements
  ADD COLUMN IF NOT EXISTS minors_involved boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_statements_minors_involved
  ON statements(minors_involved) WHERE minors_involved = true;
