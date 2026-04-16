/**
 * Common reusable validation schemas
 */
import { string, number, object, array } from './validate'

// ---------------------------------------------------------------------------
// Primitives
// ---------------------------------------------------------------------------

export const uuidSchema = string().uuid()
export const slugSchema = string().slug().min(2).max(200)
export const emailSchema = string().email()
export const urlSchema = string().url()
export const dateSchema = string().date()
export const nonEmptyString = string().min(1, 'Campo obrigatório')

// ---------------------------------------------------------------------------
// Pagination
// ---------------------------------------------------------------------------

export const paginationSchema = object({
  page: number().min(1).int().optional(),
  limit: number().min(1).max(100).int().optional(),
})

// ---------------------------------------------------------------------------
// Sort / Order
// ---------------------------------------------------------------------------

export const sortOrderSchema = object({
  sort: string().optional(),
  order: string().oneOf(['asc', 'desc']).optional(),
})

// ---------------------------------------------------------------------------
// Source types enum
// ---------------------------------------------------------------------------

export const SOURCE_TYPES = [
  'youtube_video',
  'youtube_live_archive',
  'camara_tv',
  'senado_tv',
  'diario_oficial',
  'transcript_pdf',
  'news_article',
  'social_media_post',
  'other',
] as const

export type SourceType = (typeof SOURCE_TYPES)[number]

export const sourceTypeSchema = string().oneOf([...SOURCE_TYPES])

// ---------------------------------------------------------------------------
// Verification statuses enum
// ---------------------------------------------------------------------------

export const VERIFICATION_STATUSES = [
  'unverified',
  'verified',
  'disputed',
  'retracted',
] as const

export type VerificationStatus = (typeof VERIFICATION_STATUSES)[number]

export const verificationStatusSchema = string().oneOf([...VERIFICATION_STATUSES])
