-- Statement revisions: full editorial audit trail.
--
-- Every mutation to a published statement leaves a row here — old vs
-- new values for changed fields only, plus reason + actor. Retraction
-- transparency (CF art. 220, our editorial policy §6) is meaningless
-- without an append-only log anyone can inspect. This table is that log.
--
-- Trigger-based capture means code paths that bypass the admin UI
-- (direct SQL, seed fixes, migrations) are still recorded — the only
-- way to write to `statements` without leaving a trail is to also
-- disable the trigger inside the same transaction.

CREATE TABLE IF NOT EXISTS statement_revisions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  statement_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  revision_number int NOT NULL,

  -- Only fields that actually changed. Keys are column names; values
  -- are { before, after } pairs. Null-valued columns are preserved as
  -- JSON null so diffs are lossless.
  changed_fields jsonb NOT NULL,

  -- Human-readable reason (optional; surfaced in public history).
  reason text,

  -- Free-text actor label: 'admin', 'trigger:migration', 'system:import'.
  -- Not an FK because we don't have a users table — editorial team
  -- authenticates via shared admin cookie, not per-identity.
  actor text,

  created_at timestamptz NOT NULL DEFAULT now(),

  UNIQUE (statement_id, revision_number)
);

CREATE INDEX IF NOT EXISTS idx_statement_revisions_statement
  ON statement_revisions(statement_id, revision_number DESC);

ALTER TABLE statement_revisions ENABLE ROW LEVEL SECURITY;

-- Public read: revisions are part of the editorial record (anyone can
-- see what changed and when). This matches the policy on `statements`.
DROP POLICY IF EXISTS statement_revisions_public_read ON statement_revisions;
CREATE POLICY statement_revisions_public_read ON statement_revisions
  FOR SELECT USING (true);

-- Only service role writes. Trigger runs with table-owner privileges
-- so it bypasses RLS regardless of this policy.
DROP POLICY IF EXISTS statement_revisions_no_write ON statement_revisions;
CREATE POLICY statement_revisions_no_write ON statement_revisions
  FOR INSERT WITH CHECK (false);

-- Tracked column list. Editing this list is the safe way to add/remove
-- fields from the audit trail (vs rewriting the trigger body).
CREATE OR REPLACE FUNCTION statement_revision_tracked_fields()
RETURNS text[] LANGUAGE sql IMMUTABLE AS $$
  SELECT ARRAY[
    'summary',
    'full_quote',
    'statement_date',
    'venue',
    'event_name',
    'verification_status',
    'primary_source_url',
    'primary_source_type',
    'editor_notes',
    'severity_score',
    'minors_involved',
    'slug'
  ]::text[];
$$;

CREATE OR REPLACE FUNCTION record_statement_revision()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  diff jsonb := '{}'::jsonb;
  tracked text[];
  col text;
  old_val jsonb;
  new_val jsonb;
  next_rev int;
  reason_text text;
  actor_text text;
BEGIN
  tracked := statement_revision_tracked_fields();

  FOR col IN SELECT unnest(tracked) LOOP
    EXECUTE format('SELECT to_jsonb($1.%1$I), to_jsonb($2.%1$I)', col)
      INTO old_val, new_val
      USING OLD, NEW;
    IF old_val IS DISTINCT FROM new_val THEN
      diff := diff || jsonb_build_object(col, jsonb_build_object('before', old_val, 'after', new_val));
    END IF;
  END LOOP;

  IF diff = '{}'::jsonb THEN
    RETURN NEW;
  END IF;

  -- Session-level hints: callers may set these before UPDATE to annotate
  -- the revision. Missing values are fine — defaults to 'admin'/null.
  BEGIN
    reason_text := current_setting('registra.revision_reason', true);
    actor_text := current_setting('registra.revision_actor', true);
  EXCEPTION WHEN OTHERS THEN
    reason_text := NULL;
    actor_text := NULL;
  END;

  SELECT COALESCE(MAX(revision_number), 0) + 1
    INTO next_rev
    FROM statement_revisions
    WHERE statement_id = NEW.id;

  INSERT INTO statement_revisions (statement_id, revision_number, changed_fields, reason, actor)
  VALUES (NEW.id, next_rev, diff, NULLIF(reason_text, ''), COALESCE(NULLIF(actor_text, ''), 'admin'));

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_record_statement_revision ON statements;
CREATE TRIGGER trg_record_statement_revision
  AFTER UPDATE ON statements
  FOR EACH ROW
  EXECUTE FUNCTION record_statement_revision();
