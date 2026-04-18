-- Politician bio excerpt.
--
-- Short 2-4 sentence excerpt pulled from the Portuguese Wikipedia
-- summary endpoint. Stored so the public profile page can render
-- context without a round-trip to Wikipedia per request. Kept short
-- (<=800 chars) to avoid mirroring long articles.

ALTER TABLE politicians
  ADD COLUMN IF NOT EXISTS bio_excerpt text,
  ADD COLUMN IF NOT EXISTS bio_source_url text,
  ADD COLUMN IF NOT EXISTS bio_checked_at timestamptz;

ALTER TABLE politicians
  DROP CONSTRAINT IF EXISTS politicians_bio_length;
ALTER TABLE politicians
  ADD CONSTRAINT politicians_bio_length
  CHECK (bio_excerpt IS NULL OR length(bio_excerpt) <= 1200);
