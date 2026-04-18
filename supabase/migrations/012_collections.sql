-- Editorial collections.
--
-- Curated, themed groupings of statements with their own slug, title,
-- description and cover image. Distinct from categories (which are
-- topical taxonomy applied at statement-creation time) — collections
-- are editorial viewpoints like "Promessas de campanha 2022",
-- "Declarações sobre a Amazônia", "Contradições na pandemia".
--
-- Public read by default so collections show on /colecoes and RSS
-- readers can subscribe; writes reserved to service role.

CREATE TABLE IF NOT EXISTS collections (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text NOT NULL UNIQUE,
  title text NOT NULL,
  description text,
  -- Short one-liner for cards & meta descriptions (<= 200 chars).
  subtitle text,
  cover_image_url text,
  is_published boolean NOT NULL DEFAULT false,
  published_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  CHECK (slug ~ '^[a-z0-9][a-z0-9-]*[a-z0-9]$'),
  CHECK (length(title) BETWEEN 3 AND 200),
  CHECK (subtitle IS NULL OR length(subtitle) <= 200),
  CHECK (cover_image_url IS NULL OR cover_image_url ~ '^https?://')
);

CREATE INDEX IF NOT EXISTS idx_collections_published
  ON collections(published_at DESC)
  WHERE is_published = true;

-- Join: a statement can live in many collections; order matters per
-- collection (editors curate sequence).
CREATE TABLE IF NOT EXISTS collection_statements (
  collection_id uuid NOT NULL REFERENCES collections(id) ON DELETE CASCADE,
  statement_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  position int NOT NULL DEFAULT 0,
  editor_note text,
  added_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (collection_id, statement_id)
);

CREATE INDEX IF NOT EXISTS idx_collection_statements_position
  ON collection_statements(collection_id, position);

ALTER TABLE collections ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS collections_public_read ON collections;
CREATE POLICY collections_public_read ON collections
  FOR SELECT USING (is_published = true);
DROP POLICY IF EXISTS collections_no_public_write ON collections;
CREATE POLICY collections_no_public_write ON collections
  FOR ALL USING (false) WITH CHECK (false);

ALTER TABLE collection_statements ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS collection_statements_public_read ON collection_statements;
CREATE POLICY collection_statements_public_read ON collection_statements
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM collections c WHERE c.id = collection_id AND c.is_published = true)
  );
DROP POLICY IF EXISTS collection_statements_no_public_write ON collection_statements;
CREATE POLICY collection_statements_no_public_write ON collection_statements
  FOR ALL USING (false) WITH CHECK (false);
