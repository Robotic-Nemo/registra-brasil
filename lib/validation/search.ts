/**
 * Search params validation schemas
 */
import { string, number, object } from './validate'

export const searchParamsSchema = object({
  q: string().min(2, 'Busca deve ter pelo menos 2 caracteres').max(200),
  type: string().oneOf(['all', 'statements', 'politicians']).optional(),
  limit: number().min(1).max(50).int().optional(),
})
