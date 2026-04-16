export type VerificationStatus = 'verified' | 'unverified' | 'disputed' | 'removed'

export type SourceType =
  | 'youtube_video'
  | 'youtube_live_archive'
  | 'camara_tv'
  | 'senado_tv'
  | 'diario_oficial'
  | 'transcript_pdf'
  | 'news_article'
  | 'social_media_post'
  | 'other'

export interface Politician {
  id: string
  slug: string
  full_name: string
  common_name: string
  party: string
  party_history: { party: string; from: string; to?: string }[]
  state: string | null
  role: string | null
  role_history: { role: string; from: string; to?: string }[]
  photo_url: string | null
  tse_id: string | null
  camara_id: number | null
  senado_id: number | null
  wikipedia_url: string | null
  is_active: boolean
  created_at: string
  updated_at: string
}

export interface Category {
  id: string
  slug: string
  label_pt: string
  label_en: string | null
  description: string | null
  color_hex: string
  icon: string | null
  severity: 1 | 2 | 3 | 4
  parent_id: string | null
  sort_order: number
  created_at: string
}

export interface Statement {
  id: string
  politician_id: string
  summary: string
  full_quote: string | null
  context: string | null
  verification_status: VerificationStatus
  is_featured: boolean
  statement_date: string
  statement_date_approx: boolean
  primary_source_url: string
  primary_source_type: SourceType
  youtube_video_id: string | null
  youtube_timestamp_sec: number | null
  youtube_channel_id: string | null
  transcript_excerpt: string | null
  secondary_sources: SecondarySource[] | null
  venue: string | null
  event_name: string | null
  editor_notes: string | null
  submitted_by: string | null
  reviewed_by: string | null
  reviewed_at: string | null
  slug: string | null
  created_at: string
  updated_at: string
}

export interface SecondarySource {
  url: string
  type: SourceType
  title: string
  outlet?: string
  date?: string
}

export interface StatementWithRelations extends Statement {
  politicians: Pick<Politician, 'id' | 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>
  statement_categories: {
    is_primary: boolean
    categories: Category
  }[]
}
