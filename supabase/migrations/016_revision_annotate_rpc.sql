-- Annotate revisions from the app layer.
--
-- The revision trigger (migration 011) reads session-level GUCs
-- `registra.revision_reason` and `registra.revision_actor` to attribute
-- each revision. Setting GUCs through PostgREST requires a SECURITY
-- DEFINER wrapper because supabase-js has no direct SET command.
--
-- Scope: `is_local=true` means the setting dies at transaction end,
-- which is safe for per-request mutations.

CREATE OR REPLACE FUNCTION set_revision_annotation(reason text, actor text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
BEGIN
  IF reason IS NOT NULL AND length(reason) > 0 THEN
    PERFORM set_config('registra.revision_reason', left(reason, 500), true);
  END IF;
  IF actor IS NOT NULL AND length(actor) > 0 THEN
    PERFORM set_config('registra.revision_actor', left(actor, 100), true);
  END IF;
END;
$$;

REVOKE ALL ON FUNCTION set_revision_annotation(text, text) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION set_revision_annotation(text, text) TO service_role;
