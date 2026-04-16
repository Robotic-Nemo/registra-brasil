/**
 * Politician validation schemas
 */
import { string, object } from './validate'
import { slugSchema } from './schemas'

export const createPoliticianSchema = object({
  slug: slugSchema,
  full_name: string().min(2, 'Nome completo é obrigatório').max(200),
  common_name: string().min(2, 'Nome comum é obrigatório').max(100),
  party: string().min(1, 'Partido é obrigatório').max(20),
  state: string().min(2).max(2).pattern(/^[A-Z]{2}$/, 'UF inválida'),
  role: string().min(1, 'Cargo é obrigatório').max(100),
  photo_url: string().url().optional(),
  wikipedia_url: string().url().optional(),
})

export const updatePoliticianSchema = object({
  full_name: string().min(2).max(200).optional(),
  common_name: string().min(2).max(100).optional(),
  party: string().min(1).max(20).optional(),
  state: string().min(2).max(2).pattern(/^[A-Z]{2}$/, 'UF inválida').optional(),
  role: string().min(1).max(100).optional(),
  photo_url: string().url().optional(),
  wikipedia_url: string().url().optional(),
})
