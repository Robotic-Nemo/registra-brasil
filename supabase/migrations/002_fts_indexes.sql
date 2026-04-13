-- Full-text search
CREATE INDEX statements_search_idx ON statements USING GIN (search_vector);

CREATE OR REPLACE FUNCTION statements_search_vector_update()
RETURNS TRIGGER AS $$
BEGIN
  NEW.search_vector :=
    setweight(to_tsvector('portuguese', COALESCE(NEW.summary, '')), 'A') ||
    setweight(to_tsvector('portuguese', COALESCE(NEW.full_quote, '')), 'A') ||
    setweight(to_tsvector('portuguese', COALESCE(NEW.context, '')), 'B') ||
    setweight(to_tsvector('portuguese', COALESCE(NEW.transcript_excerpt, '')), 'B');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER statements_search_vector_trigger
  BEFORE INSERT OR UPDATE ON statements
  FOR EACH ROW EXECUTE FUNCTION statements_search_vector_update();

-- Performance indexes
CREATE INDEX statements_politician_id_idx ON statements (politician_id);
CREATE INDEX statements_date_idx ON statements (statement_date DESC);
CREATE INDEX statements_status_idx ON statements (verification_status);
CREATE INDEX statements_featured_idx ON statements (is_featured) WHERE is_featured = true;
CREATE INDEX statements_youtube_video_id_idx ON statements (youtube_video_id)
  WHERE youtube_video_id IS NOT NULL;

CREATE INDEX politicians_slug_idx ON politicians (slug);
CREATE INDEX politicians_party_idx ON politicians (party);
CREATE INDEX politicians_state_idx ON politicians (state);

CREATE INDEX youtube_cache_key_idx ON youtube_search_cache (cache_key);
CREATE INDEX youtube_cache_expires_idx ON youtube_search_cache (expires_at);
CREATE INDEX youtube_quota_date_idx ON youtube_quota_log (date);

-- Auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER politicians_updated_at
  BEFORE UPDATE ON politicians
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER statements_updated_at
  BEFORE UPDATE ON statements
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
