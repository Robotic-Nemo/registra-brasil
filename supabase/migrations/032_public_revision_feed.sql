-- Public moderation log.
--
-- statement_revisions records every edit an editor makes to a statement
-- along with `actor` (who) and `reason` (why). For reader-facing
-- transparency we don't expose the actor — but we do want readers to
-- see when a statement was edited, what broad fields moved, and the
-- sanitized reason.
--
-- `public_revision_feed` encapsulates that redaction and joins the
-- statement + politician so the SSR page doesn't need to.

CREATE OR REPLACE FUNCTION public_revision_feed(result_limit int DEFAULT 100)
RETURNS TABLE (
  revision_id uuid,
  statement_id uuid,
  statement_slug text,
  statement_summary text,
  politician_slug text,
  politician_name text,
  revision_number int,
  changed_keys text[],
  reason text,
  created_at timestamptz
)
LANGUAGE sql STABLE AS $$
  SELECT
    r.id AS revision_id,
    s.id AS statement_id,
    s.slug AS statement_slug,
    s.summary AS statement_summary,
    p.slug AS politician_slug,
    p.common_name AS politician_name,
    r.revision_number,
    CASE
      WHEN jsonb_typeof(r.changed_fields) = 'object'
        THEN ARRAY(SELECT jsonb_object_keys(r.changed_fields))
      ELSE ARRAY[]::text[]
    END AS changed_keys,
    -- Trim reason to 280 chars; strip anything that looks like an
    -- email/IP address to avoid leaking PII that an editor might
    -- have typed by mistake.
    left(
      regexp_replace(
        regexp_replace(coalesce(r.reason, ''),
          '[\w.+-]+@[\w-]+\.[\w.-]+', '[email]', 'g'),
        '(\d{1,3}\.){3}\d{1,3}', '[ip]', 'g'),
      280
    ) AS reason,
    r.created_at
  FROM statement_revisions r
  JOIN statements s ON s.id = r.statement_id
  JOIN politicians p ON p.id = s.politician_id
  WHERE s.verification_status <> 'removed'
  ORDER BY r.created_at DESC
  LIMIT result_limit;
$$;

GRANT EXECUTE ON FUNCTION public_revision_feed(int) TO anon, authenticated;
