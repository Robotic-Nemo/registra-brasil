-- =============================================
-- ENUMS
-- =============================================

CREATE TYPE verification_status AS ENUM (
  'verified',
  'unverified',
  'disputed',
  'removed'
);

CREATE TYPE source_type AS ENUM (
  'youtube_video',
  'youtube_live_archive',
  'camara_tv',
  'senado_tv',
  'diario_oficial',
  'transcript_pdf',
  'news_article',
  'social_media_post',
  'other'
);

-- =============================================
-- POLITICIANS
-- =============================================

CREATE TABLE politicians (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug            TEXT NOT NULL UNIQUE,
  full_name       TEXT NOT NULL,
  common_name     TEXT NOT NULL,
  party           TEXT NOT NULL,
  party_history   JSONB DEFAULT '[]',
  state           CHAR(2),
  role            TEXT,
  role_history    JSONB DEFAULT '[]',
  photo_url       TEXT,
  tse_id          TEXT UNIQUE,
  camara_id       INTEGER UNIQUE,
  senado_id       INTEGER UNIQUE,
  wikipedia_url   TEXT,
  is_active       BOOLEAN NOT NULL DEFAULT true,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =============================================
-- CATEGORIES
-- =============================================

CREATE TABLE categories (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug        TEXT NOT NULL UNIQUE,
  label_pt    TEXT NOT NULL,
  label_en    TEXT,
  description TEXT,
  color_hex   TEXT NOT NULL DEFAULT '#6B7280',
  icon        TEXT,
  severity    SMALLINT NOT NULL DEFAULT 2 CHECK (severity BETWEEN 1 AND 4),
  parent_id   UUID REFERENCES categories(id),
  sort_order  SMALLINT NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =============================================
-- STATEMENTS
-- =============================================

CREATE TABLE statements (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  politician_id         UUID NOT NULL REFERENCES politicians(id) ON DELETE RESTRICT,

  summary               TEXT NOT NULL,
  full_quote            TEXT,
  context               TEXT,

  verification_status   verification_status NOT NULL DEFAULT 'unverified',
  is_featured           BOOLEAN NOT NULL DEFAULT false,

  statement_date        DATE NOT NULL,
  statement_date_approx BOOLEAN NOT NULL DEFAULT false,

  -- Primary source (required)
  primary_source_url    TEXT NOT NULL,
  primary_source_type   source_type NOT NULL,
  youtube_video_id      TEXT,
  youtube_timestamp_sec INTEGER,
  youtube_channel_id    TEXT,
  transcript_excerpt    TEXT,

  -- Secondary sources
  secondary_sources     JSONB DEFAULT '[]',

  venue                 TEXT,
  event_name            TEXT,

  editor_notes          TEXT,
  submitted_by          TEXT,
  reviewed_by           TEXT,
  reviewed_at           TIMESTAMPTZ,

  slug                  TEXT UNIQUE,

  search_vector         TSVECTOR,

  created_at            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at            TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =============================================
-- STATEMENT <-> CATEGORY
-- =============================================

CREATE TABLE statement_categories (
  statement_id  UUID NOT NULL REFERENCES statements(id) ON DELETE CASCADE,
  category_id   UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  is_primary    BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY (statement_id, category_id)
);

-- =============================================
-- YOUTUBE QUOTA TRACKING
-- =============================================

CREATE TABLE youtube_quota_log (
  id          BIGSERIAL PRIMARY KEY,
  date        DATE NOT NULL DEFAULT CURRENT_DATE,
  units_used  INTEGER NOT NULL DEFAULT 0,
  query       TEXT,
  endpoint    TEXT NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE youtube_search_cache (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  cache_key     TEXT NOT NULL UNIQUE,
  query         TEXT NOT NULL,
  results       JSONB NOT NULL,
  quota_cost    INTEGER NOT NULL DEFAULT 100,
  expires_at    TIMESTAMPTZ NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =============================================
-- POLITICIAN ALIASES
-- =============================================

CREATE TABLE politician_aliases (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  politician_id UUID NOT NULL REFERENCES politicians(id) ON DELETE CASCADE,
  alias         TEXT NOT NULL,
  UNIQUE (politician_id, alias)
);
