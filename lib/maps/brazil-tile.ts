/**
 * Tile cartogram of Brazilian states: each UF lives on a grid cell
 * roughly preserving geography without trying to be a real map. This
 * intentional simplification gives every state equal visual weight —
 * good for a data-first choropleth where Rondônia's 242k km² doesn't
 * crowd out Alagoas.
 *
 * Coordinates are (col, row); (0,0) top-left. The grid is 7 cols × 8
 * rows, tuned so the overall shape evokes Brazil: North and Amazon in
 * the upper-left, Northeast protruding on the right, Southeast and
 * South stacking to the bottom.
 */

export interface TileUF {
  uf: string
  name: string
  region: 'Norte' | 'Nordeste' | 'Centro-Oeste' | 'Sudeste' | 'Sul'
  col: number
  row: number
}

export const BRAZIL_TILES: TileUF[] = [
  // Row 0 — Northern fringe
  { uf: 'RR', name: 'Roraima', region: 'Norte', col: 1, row: 0 },
  { uf: 'AP', name: 'Amapá', region: 'Norte', col: 3, row: 0 },
  // Row 1 — Amazônia + northeast coast
  { uf: 'AM', name: 'Amazonas', region: 'Norte', col: 1, row: 1 },
  { uf: 'PA', name: 'Pará', region: 'Norte', col: 2, row: 1 },
  { uf: 'MA', name: 'Maranhão', region: 'Nordeste', col: 3, row: 1 },
  { uf: 'CE', name: 'Ceará', region: 'Nordeste', col: 4, row: 1 },
  { uf: 'RN', name: 'Rio Grande do Norte', region: 'Nordeste', col: 5, row: 1 },
  // Row 2
  { uf: 'AC', name: 'Acre', region: 'Norte', col: 0, row: 2 },
  { uf: 'RO', name: 'Rondônia', region: 'Norte', col: 1, row: 2 },
  { uf: 'TO', name: 'Tocantins', region: 'Norte', col: 2, row: 2 },
  { uf: 'PI', name: 'Piauí', region: 'Nordeste', col: 3, row: 2 },
  { uf: 'PE', name: 'Pernambuco', region: 'Nordeste', col: 4, row: 2 },
  { uf: 'PB', name: 'Paraíba', region: 'Nordeste', col: 5, row: 2 },
  // Row 3
  { uf: 'MT', name: 'Mato Grosso', region: 'Centro-Oeste', col: 1, row: 3 },
  { uf: 'BA', name: 'Bahia', region: 'Nordeste', col: 3, row: 3 },
  { uf: 'AL', name: 'Alagoas', region: 'Nordeste', col: 4, row: 3 },
  { uf: 'SE', name: 'Sergipe', region: 'Nordeste', col: 5, row: 3 },
  // Row 4
  { uf: 'MS', name: 'Mato Grosso do Sul', region: 'Centro-Oeste', col: 1, row: 4 },
  { uf: 'GO', name: 'Goiás', region: 'Centro-Oeste', col: 2, row: 4 },
  { uf: 'DF', name: 'Distrito Federal', region: 'Centro-Oeste', col: 3, row: 4 },
  { uf: 'MG', name: 'Minas Gerais', region: 'Sudeste', col: 4, row: 4 },
  { uf: 'ES', name: 'Espírito Santo', region: 'Sudeste', col: 5, row: 4 },
  // Row 5
  { uf: 'SP', name: 'São Paulo', region: 'Sudeste', col: 3, row: 5 },
  { uf: 'RJ', name: 'Rio de Janeiro', region: 'Sudeste', col: 4, row: 5 },
  // Row 6
  { uf: 'PR', name: 'Paraná', region: 'Sul', col: 3, row: 6 },
  // Row 7
  { uf: 'SC', name: 'Santa Catarina', region: 'Sul', col: 3, row: 7 },
  { uf: 'RS', name: 'Rio Grande do Sul', region: 'Sul', col: 2, row: 7 },
]

export const REGION_COLORS: Record<TileUF['region'], string> = {
  Norte: '#0ea5e9',
  Nordeste: '#f59e0b',
  'Centro-Oeste': '#84cc16',
  Sudeste: '#8b5cf6',
  Sul: '#ef4444',
}

export const GRID_COLS = 7
export const GRID_ROWS = 8
