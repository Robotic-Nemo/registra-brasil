/** Brazilian states (UF codes) */
export const BRAZILIAN_STATES = [
  'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS',
  'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO',
] as const

export type BrazilianState = typeof BRAZILIAN_STATES[number]

/** Major political parties in Brazil (2024-2026) */
export const BRAZILIAN_PARTIES = [
  'PT', 'PL', 'UNIÃO', 'PP', 'REPUBLICANOS', 'MDB', 'PSD', 'PDT', 'PSDB',
  'PSB', 'PODE', 'NOVO', 'PSOL', 'SOLIDARIEDADE', 'AVANTE', 'PRD', 'DC',
  'PCdoB', 'REDE', 'CIDADANIA', 'PMB', 'PRTB', 'UP',
] as const

export type BrazilianParty = typeof BRAZILIAN_PARTIES[number]

/** Max query length for search inputs */
export const MAX_QUERY_LENGTH = 200
