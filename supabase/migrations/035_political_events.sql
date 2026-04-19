-- Hand-curated political-events agenda.
--
-- Editors record upcoming/notable events (floor votes, CPI hearings,
-- debate schedules, presidential decrees, ministerial sittings) that
-- are worth following. No scraping — low-volume curation only. A
-- flagged `politician_id` lets events cross-link to /politico/[slug]
-- pages later if the UI wants to feature them.

CREATE TABLE IF NOT EXISTS political_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  summary text NOT NULL,
  body text,
  event_date timestamptz NOT NULL,
  event_end_date timestamptz,
  location text,
  source_url text,
  kind text NOT NULL DEFAULT 'other',
  politician_id uuid REFERENCES politicians(id) ON DELETE SET NULL,
  is_published boolean NOT NULL DEFAULT false,
  created_by text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT political_events_kind_check CHECK (
    kind IN (
      'votacao', 'cpi', 'debate', 'discurso', 'decreto',
      'audiencia', 'reuniao', 'comissao', 'agenda_oficial', 'other'
    )
  ),
  CONSTRAINT political_events_title_len CHECK (char_length(title) BETWEEN 4 AND 200),
  CONSTRAINT political_events_summary_len CHECK (char_length(summary) BETWEEN 4 AND 1000)
);

CREATE INDEX IF NOT EXISTS idx_political_events_date ON political_events(event_date);
CREATE INDEX IF NOT EXISTS idx_political_events_published
  ON political_events(is_published, event_date DESC);
CREATE INDEX IF NOT EXISTS idx_political_events_politician ON political_events(politician_id);

ALTER TABLE political_events ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS political_events_select_published ON political_events;
CREATE POLICY political_events_select_published ON political_events
  FOR SELECT USING (is_published = true);

CREATE OR REPLACE FUNCTION set_updated_at_events()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN NEW.updated_at := now(); RETURN NEW; END;
$$;

DROP TRIGGER IF EXISTS trg_events_updated_at ON political_events;
CREATE TRIGGER trg_events_updated_at
  BEFORE UPDATE ON political_events
  FOR EACH ROW EXECUTE FUNCTION set_updated_at_events();
