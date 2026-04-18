-- Saved-search email alerts.
--
-- A subscriber binds an email to a search query (q + filters) and gets
-- notified when new statements match. Same double-opt-in pattern as
-- newsletter_subscribers — nothing is delivered until the address is
-- confirmed via tokenized link.
--
-- The `query` jsonb stores the normalized filter set (q, politico,
-- categoria[], partido, estado, status, de, ate). The `notifier` job
-- uses this same shape to reconstruct the search at run time.

CREATE TABLE IF NOT EXISTS saved_searches (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text NOT NULL,
  label text,

  -- Stored query params; normalized so equivalent filter sets share a
  -- canonical representation.
  query jsonb NOT NULL,
  query_hash text NOT NULL,

  -- Double-opt-in fields (same pattern as newsletter_subscribers).
  is_confirmed boolean NOT NULL DEFAULT false,
  confirmation_token text,
  confirmation_sent_at timestamptz,
  confirmed_at timestamptz,

  -- Last successful notification run marker — the notifier only
  -- considers statements created after this timestamp.
  last_notified_at timestamptz,

  -- Lifecycle
  unsubscribed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  CHECK (email = lower(email)),
  CHECK (length(email) <= 320),
  CHECK (email ~* '^[^[:space:]]+@[^[:space:]]+\.[^[:space:]]+$'),
  -- Same email can register multiple distinct queries; each pair is unique.
  UNIQUE (email, query_hash)
);

CREATE INDEX IF NOT EXISTS idx_saved_searches_active
  ON saved_searches(last_notified_at NULLS FIRST)
  WHERE is_confirmed = true AND unsubscribed_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_saved_searches_confirmation
  ON saved_searches(confirmation_token)
  WHERE confirmation_token IS NOT NULL;

ALTER TABLE saved_searches ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS saved_searches_service_only ON saved_searches;
CREATE POLICY saved_searches_service_only ON saved_searches
  FOR ALL USING (false) WITH CHECK (false);
