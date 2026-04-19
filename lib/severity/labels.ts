export interface SeverityDef {
  level: 1 | 2 | 3 | 4 | 5
  label: string
  short: string
  description: string
  tone: string
  ramp: string
}

export const SEVERITIES: SeverityDef[] = [
  {
    level: 1,
    label: 'Nível 1 — Leve',
    short: 'Leve',
    description: 'Declarações de baixo impacto factual, opinativas ou com evidência circunstancial.',
    tone: 'bg-gray-100 text-gray-800 border-gray-200 dark:bg-gray-800 dark:text-gray-200 dark:border-gray-700',
    ramp: '#e5e7eb',
  },
  {
    level: 2,
    label: 'Nível 2 — Média',
    short: 'Média',
    description: 'Afirmações com potencial de desinformação ou retórica relevante, mas sem dano direto aferido.',
    tone: 'bg-amber-100 text-amber-900 border-amber-200 dark:bg-amber-950/40 dark:text-amber-200 dark:border-amber-800',
    ramp: '#fde68a',
  },
  {
    level: 3,
    label: 'Nível 3 — Elevada',
    short: 'Elevada',
    description: 'Declarações que atacam instituições, espalham boatos verificáveis ou violam normas editoriais.',
    tone: 'bg-orange-100 text-orange-900 border-orange-200 dark:bg-orange-950/40 dark:text-orange-200 dark:border-orange-800',
    ramp: '#fb923c',
  },
  {
    level: 4,
    label: 'Nível 4 — Crítica',
    short: 'Crítica',
    description: 'Incitação, ameaça, ataque direto a grupos ou pessoas, ou ruptura explícita de regras democráticas.',
    tone: 'bg-rose-100 text-rose-900 border-rose-200 dark:bg-rose-950/40 dark:text-rose-200 dark:border-rose-800',
    ramp: '#ef4444',
  },
  {
    level: 5,
    label: 'Nível 5 — Extrema',
    short: 'Extrema',
    description: 'Conteúdo de extremo risco: ameaças de morte, apologia a crimes, ataques à ordem constitucional.',
    tone: 'bg-red-950/90 text-red-50 border-red-900 dark:bg-red-900 dark:text-red-50 dark:border-red-700',
    ramp: '#7f1d1d',
  },
]

export function severityDef(level: number): SeverityDef | null {
  return SEVERITIES.find((s) => s.level === level) ?? null
}
