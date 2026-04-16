/**
 * Statement validation schemas
 */
import { string, number, object, array } from './validate'
import { sourceTypeSchema, dateSchema, urlSchema, slugSchema } from './schemas'

export const createStatementSchema = object({
  politician_slug: string().min(1, 'Político é obrigatório'),
  summary: string().min(10, 'Resumo deve ter pelo menos 10 caracteres').max(500, 'Resumo deve ter no máximo 500 caracteres'),
  full_quote: string().max(5000).optional(),
  context: string().max(2000).optional(),
  statement_date: dateSchema,
  statement_date_approx: string().oneOf(['on', 'off']).optional(),
  primary_source_url: urlSchema,
  primary_source_type: sourceTypeSchema,
  youtube_timestamp_sec: number().min(0).max(86400).int().optional(),
  transcript_excerpt: string().max(5000).optional(),
  venue: string().max(300).optional(),
  event_name: string().max(300).optional(),
  editor_notes: string().max(2000).optional(),
  submitted_by: string().max(200).optional(),
  categories: array(string().min(1)).min(1, 'Selecione pelo menos uma categoria'),
})

export const updateStatementSchema = object({
  summary: string().min(10, 'Resumo deve ter pelo menos 10 caracteres').max(500),
  full_quote: string().max(5000).optional(),
  context: string().max(2000).optional(),
  statement_date: dateSchema,
  statement_date_approx: string().oneOf(['on', 'off']).optional(),
  primary_source_url: urlSchema,
  primary_source_type: sourceTypeSchema,
  youtube_timestamp_sec: number().min(0).max(86400).int().optional(),
  transcript_excerpt: string().max(5000).optional(),
  venue: string().max(300).optional(),
  event_name: string().max(300).optional(),
  editor_notes: string().max(2000).optional(),
  categories: array(string().min(1)).min(1, 'Selecione pelo menos uma categoria'),
})
