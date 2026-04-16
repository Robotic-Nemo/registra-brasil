/**
 * Error message constants in Portuguese
 */

export const ERRORS = {
  // Generic
  GENERIC: 'Ocorreu um erro inesperado. Tente novamente.',
  NOT_FOUND: 'Recurso não encontrado.',
  UNAUTHORIZED: 'Acesso não autorizado.',
  FORBIDDEN: 'Acesso negado.',
  RATE_LIMITED: 'Muitas requisições. Aguarde antes de tentar novamente.',
  SERVER_ERROR: 'Erro interno do servidor.',
  TIMEOUT: 'A requisição demorou muito. Tente novamente.',
  NETWORK: 'Erro de conexão. Verifique sua internet.',

  // Form validation
  REQUIRED_FIELD: 'Este campo é obrigatório.',
  INVALID_EMAIL: 'E-mail inválido.',
  INVALID_URL: 'URL inválida.',
  INVALID_DATE: 'Data inválida.',
  INVALID_SLUG: 'Slug inválido. Use apenas letras minúsculas, números e hífens.',
  TOO_SHORT: 'Texto muito curto.',
  TOO_LONG: 'Texto muito longo.',
  FUTURE_DATE: 'A data não pode ser no futuro.',

  // Auth
  WRONG_PASSWORD: 'Senha incorreta.',
  SESSION_EXPIRED: 'Sessão expirada. Faça login novamente.',

  // Data
  POLITICIAN_NOT_FOUND: 'Político não encontrado.',
  STATEMENT_NOT_FOUND: 'Declaração não encontrada.',
  CATEGORY_NOT_FOUND: 'Categoria não encontrada.',
  DUPLICATE_ENTRY: 'Este registro já existe.',
  IMPORT_FAILED: 'Falha na importação dos dados.',
  EXPORT_FAILED: 'Falha na exportação dos dados.',

  // Search
  SEARCH_TOO_SHORT: 'Digite pelo menos 2 caracteres para buscar.',
  NO_RESULTS: 'Nenhum resultado encontrado.',
} as const

export type ErrorCode = keyof typeof ERRORS

export function getErrorMessage(code: ErrorCode): string {
  return ERRORS[code]
}

/**
 * Convert an unknown error into a user-friendly Portuguese message.
 */
export function toUserMessage(error: unknown): string {
  if (error instanceof Error) {
    if (error.message.includes('fetch') || error.message.includes('network'))
      return ERRORS.NETWORK
    if (error.message.includes('timeout') || error.message.includes('aborted'))
      return ERRORS.TIMEOUT
  }
  return ERRORS.GENERIC
}
