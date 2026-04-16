/**
 * Political roles/positions in Brazil
 */

export const POLITICAL_ROLES = {
  presidente: 'Presidente da República',
  vice_presidente: 'Vice-Presidente',
  senador: 'Senador(a)',
  deputado_federal: 'Deputado(a) Federal',
  deputado_estadual: 'Deputado(a) Estadual',
  governador: 'Governador(a)',
  vice_governador: 'Vice-Governador(a)',
  prefeito: 'Prefeito(a)',
  vice_prefeito: 'Vice-Prefeito(a)',
  vereador: 'Vereador(a)',
  ministro: 'Ministro(a)',
  secretario: 'Secretário(a)',
} as const

export type PoliticalRole = keyof typeof POLITICAL_ROLES

export const FEDERAL_ROLES: PoliticalRole[] = [
  'presidente', 'vice_presidente', 'senador', 'deputado_federal', 'ministro',
]

export const STATE_ROLES: PoliticalRole[] = [
  'governador', 'vice_governador', 'deputado_estadual', 'secretario',
]

export const MUNICIPAL_ROLES: PoliticalRole[] = [
  'prefeito', 'vice_prefeito', 'vereador',
]

export function getRoleLabel(role: string): string {
  return POLITICAL_ROLES[role as PoliticalRole] ?? role
}
