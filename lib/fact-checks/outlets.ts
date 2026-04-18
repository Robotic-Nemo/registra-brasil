/**
 * Canonical Brazilian fact-check outlets. Centralizing here means:
 * - Admin UI offers a consistent dropdown
 * - Public UI renders consistent labels + colors
 * - OG/JSON-LD can reference known ClaimReview authors
 */

export interface FactCheckOutlet {
  key: string
  label: string
  url: string
  color: string
}

export const FACT_CHECK_OUTLETS: FactCheckOutlet[] = [
  { key: 'agencia_lupa', label: 'Lupa', url: 'https://lupa.uol.com.br', color: '#e11d48' },
  { key: 'aos_fatos', label: 'Aos Fatos', url: 'https://www.aosfatos.org', color: '#0f766e' },
  { key: 'g1_fato_ou_fake', label: 'G1 Fato ou Fake', url: 'https://g1.globo.com/fato-ou-fake/', color: '#0050a0' },
  { key: 'estadao_verifica', label: 'Estadão Verifica', url: 'https://politica.estadao.com.br/blogs/estadao-verifica/', color: '#1b1b1b' },
  { key: 'comprova', label: 'Projeto Comprova', url: 'https://projetocomprova.com.br', color: '#7c3aed' },
  { key: 'afp_checamos', label: 'AFP Checamos', url: 'https://checamos.afp.com/afp-brasil', color: '#0055a4' },
  { key: 'boatos_org', label: 'Boatos.org', url: 'https://www.boatos.org', color: '#ea580c' },
  { key: 'reuters_fact_check', label: 'Reuters Fact Check', url: 'https://www.reuters.com/fact-check/', color: '#FF8000' },
  { key: 'outro', label: 'Outro', url: '', color: '#6b7280' },
]

export const RATING_LABELS: Record<string, string> = {
  true: 'Verdadeiro',
  mostly_true: 'Em parte verdadeiro',
  half_true: 'Meia verdade',
  mostly_false: 'Em parte falso',
  false: 'Falso',
  misleading: 'Enganoso',
  unproven: 'Sem comprovação',
  satire: 'Sátira',
}

export const RATING_CLASSES: Record<string, string> = {
  true: 'bg-green-100 text-green-800 border-green-300',
  mostly_true: 'bg-emerald-100 text-emerald-800 border-emerald-300',
  half_true: 'bg-yellow-100 text-yellow-800 border-yellow-300',
  mostly_false: 'bg-orange-100 text-orange-800 border-orange-300',
  false: 'bg-red-100 text-red-800 border-red-300',
  misleading: 'bg-amber-100 text-amber-900 border-amber-300',
  unproven: 'bg-gray-100 text-gray-800 border-gray-300',
  satire: 'bg-purple-100 text-purple-800 border-purple-300',
}

export function outletFor(key: string): FactCheckOutlet | undefined {
  return FACT_CHECK_OUTLETS.find((o) => o.key === key)
}
