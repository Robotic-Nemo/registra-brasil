/**
 * Approximate brand colors for major Brazilian political parties.
 * Used for subtle UI accents, not political affiliation indicators.
 */
export const PARTY_COLORS: Record<string, string> = {
  PT: '#cc0000',
  PL: '#1a237e',
  UNIÃO: '#2196f3',
  PP: '#0d47a1',
  MDB: '#388e3c',
  PSD: '#f57f17',
  REPUBLICANOS: '#1565c0',
  PDT: '#d32f2f',
  PODE: '#ff6f00',
  PSOL: '#fdd835',
  PSB: '#f44336',
  PSDB: '#1976d2',
  CIDADANIA: '#7b1fa2',
  PCdoB: '#b71c1c',
  NOVO: '#ff5722',
  PV: '#4caf50',
  REDE: '#00bcd4',
  AVANTE: '#ff9800',
  SOLIDARIEDADE: '#e65100',
  PATRIOTA: '#1b5e20',
  PTB: '#000000',
  PROS: '#ff6f00',
}

export function getPartyColor(party: string): string {
  return PARTY_COLORS[party.toUpperCase()] ?? '#6b7280'
}
