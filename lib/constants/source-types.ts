import type { SourceType } from '@/types/database'

/** Human-readable labels for each source type */
export const SOURCE_TYPE_LABELS: Record<SourceType, string> = {
  youtube_video: 'Vídeo no YouTube',
  youtube_live_archive: 'Transmissão ao vivo (YouTube)',
  camara_tv: 'TV Câmara',
  senado_tv: 'TV Senado',
  diario_oficial: 'Diário Oficial da União',
  transcript_pdf: 'Transcrição oficial (PDF)',
  news_article: 'Reportagem jornalística',
  social_media_post: 'Publicação em rede social',
  other: 'Outra fonte',
}

/** Source types considered official/institutional */
export const OFFICIAL_SOURCE_TYPES: ReadonlySet<SourceType> = new Set([
  'camara_tv',
  'senado_tv',
  'diario_oficial',
  'transcript_pdf',
])

/** Source types that are video */
export const VIDEO_SOURCE_TYPES: ReadonlySet<SourceType> = new Set([
  'youtube_video',
  'youtube_live_archive',
  'camara_tv',
  'senado_tv',
])

export function isOfficialSource(type: SourceType): boolean {
  return OFFICIAL_SOURCE_TYPES.has(type)
}

export function isVideoSource(type: SourceType): boolean {
  return VIDEO_SOURCE_TYPES.has(type)
}
