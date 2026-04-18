-- Anonymous statement reactions.
--
-- Readers flag statements as one of: importante (worth amplifying),
-- contestada (factually disputed), fora_de_contexto (missing context),
-- erro (reporting a typo/error).
--
-- Anonymity: we store a daily-salted SHA-256 truncated hash of the
-- submitter IP — enough to throttle (one reaction per IP per statement
-- per reaction type) without retaining raw IPs. Salt rotates daily so
-- yesterday's hashes can't be joined with today's.

CREATE TYPE reaction_type AS ENUM (
  'importante',
  'contestada',
  'fora_de_contexto',
  'erro'
);

CREATE TABLE IF NOT EXISTS statement_reactions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  statement_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  reaction reaction_type NOT NULL,
  submitter_ip_hash text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),

  UNIQUE (statement_id, submitter_ip_hash, reaction)
);

CREATE INDEX IF NOT EXISTS idx_statement_reactions_statement
  ON statement_reactions(statement_id, reaction);

-- Aggregated counts view: always fresh, cheap (index on statement_id).
CREATE OR REPLACE VIEW statement_reaction_counts AS
SELECT
  statement_id,
  COUNT(*) FILTER (WHERE reaction = 'importante')::int AS importante,
  COUNT(*) FILTER (WHERE reaction = 'contestada')::int AS contestada,
  COUNT(*) FILTER (WHERE reaction = 'fora_de_contexto')::int AS fora_de_contexto,
  COUNT(*) FILTER (WHERE reaction = 'erro')::int AS erro,
  COUNT(*)::int AS total,
  MAX(created_at) AS last_reacted_at
FROM statement_reactions
GROUP BY statement_id;

ALTER TABLE statement_reactions ENABLE ROW LEVEL SECURITY;

-- Public read: counts come from a view, but exposing per-reaction rows
-- is fine (no PII; hash is unlinkable after 24h due to rotating salt).
DROP POLICY IF EXISTS reactions_public_read ON statement_reactions;
CREATE POLICY reactions_public_read ON statement_reactions
  FOR SELECT USING (true);

DROP POLICY IF EXISTS reactions_no_public_write ON statement_reactions;
CREATE POLICY reactions_no_public_write ON statement_reactions
  FOR INSERT WITH CHECK (false);
