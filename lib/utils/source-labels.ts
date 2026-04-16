/** Human-readable labels for primary source types */
const SOURCE_LABELS: Record<string, string> = {
  youtube_video: 'Vídeo YouTube',
  youtube_live_archive: 'Transmissão YouTube',
  camara_tv: 'TV Câmara',
  senado_tv: 'TV Senado',
  diario_oficial: 'Diário Oficial',
  transcript_pdf: 'Transcrição PDF',
  news_article: 'Artigo de notícia',
  social_media_post: 'Post em rede social',
  other: 'Outro',
}

/** Official/institutional source types */
const OFFICIAL_TYPES = new Set([
  'camara_tv',
  'senado_tv',
  'diario_oficial',
  'transcript_pdf',
])

/** Video source types */
const VIDEO_TYPES = new Set([
  'youtube_video',
  'youtube_live_archive',
  'camara_tv',
  'senado_tv',
])

export function getSourceLabel(type: string): string {
  return SOURCE_LABELS[type] ?? type
}

export function isOfficialSourceType(type: string): boolean {
  return OFFICIAL_TYPES.has(type)
}

export function isVideoSourceType(type: string): boolean {
  return VIDEO_TYPES.has(type)
}
