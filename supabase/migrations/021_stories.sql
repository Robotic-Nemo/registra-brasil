-- Editorial stories.
--
-- Distinct from `collections` (flat grouping): a story is a long-form
-- article with body copy interleaved with statement embeds + per-embed
-- commentary. Think "explainer": "We tracked 12 times X changed his
-- position on Y. Here's the timeline." Body is authored in Markdown;
-- statement embeds are referenced by `{{statement:<uuid>}}` tokens
-- substituted at render time (so moves of the statement slug don't
-- break stories).

CREATE TABLE IF NOT EXISTS stories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text NOT NULL UNIQUE,
  title text NOT NULL,
  subtitle text,
  author text,                       -- Free-text byline
  body_markdown text NOT NULL DEFAULT '',
  hero_statement_id uuid REFERENCES statements(id) ON DELETE SET NULL,
  cover_image_url text,
  reading_time_min int,
  is_published boolean NOT NULL DEFAULT false,
  published_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  CHECK (slug ~ '^[a-z0-9][a-z0-9-]*[a-z0-9]$'),
  CHECK (length(title) BETWEEN 3 AND 200),
  CHECK (subtitle IS NULL OR length(subtitle) <= 300),
  CHECK (length(body_markdown) <= 80000),
  CHECK (author IS NULL OR length(author) <= 200),
  CHECK (cover_image_url IS NULL OR cover_image_url ~ '^https?://')
);

CREATE INDEX IF NOT EXISTS idx_stories_published
  ON stories(published_at DESC)
  WHERE is_published = true;

-- Statements referenced by the story, with editor commentary shown
-- alongside the quote in the rendered article.
CREATE TABLE IF NOT EXISTS story_statements (
  story_id uuid NOT NULL REFERENCES stories(id) ON DELETE CASCADE,
  statement_id uuid NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  position int NOT NULL DEFAULT 0,
  commentary text,                   -- Editor's framing, shown above the quote
  PRIMARY KEY (story_id, statement_id),
  CHECK (commentary IS NULL OR length(commentary) <= 2000)
);

CREATE INDEX IF NOT EXISTS idx_story_statements_pos
  ON story_statements(story_id, position);

ALTER TABLE stories ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS stories_public_read ON stories;
CREATE POLICY stories_public_read ON stories
  FOR SELECT USING (is_published = true);
DROP POLICY IF EXISTS stories_no_public_write ON stories;
CREATE POLICY stories_no_public_write ON stories
  FOR ALL USING (false) WITH CHECK (false);

ALTER TABLE story_statements ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS story_statements_public_read ON story_statements;
CREATE POLICY story_statements_public_read ON story_statements
  FOR SELECT USING (
    EXISTS (SELECT 1 FROM stories s WHERE s.id = story_id AND s.is_published = true)
  );
DROP POLICY IF EXISTS story_statements_no_public_write ON story_statements;
CREATE POLICY story_statements_no_public_write ON story_statements
  FOR ALL USING (false) WITH CHECK (false);
