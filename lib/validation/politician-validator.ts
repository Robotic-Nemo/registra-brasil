/**
 * Politician validation before database write.
 */
import { sanitizeInput } from './sanitize'
import { isValidUF } from '@/lib/constants/states'

export interface PoliticianInput {
  slug: string
  full_name: string
  common_name: string
  party: string
  state: string
  role: string
  photo_url?: string | null
  wikipedia_url?: string | null
}

export interface ValidatedPolitician {
  slug: string
  full_name: string
  common_name: string
  party: string
  state: string
  role: string
  photo_url: string | null
  wikipedia_url: string | null
}

export type PoliticianValidationResult =
  | { ok: true; data: ValidatedPolitician }
  | { ok: false; message: string }

export function validatePolitician(input: PoliticianInput): PoliticianValidationResult {
  const slug = input.slug.trim().toLowerCase()
  const fullName = sanitizeInput(input.full_name).trim()
  const commonName = sanitizeInput(input.common_name).trim()
  const party = sanitizeInput(input.party).trim().toUpperCase()
  const state = input.state.trim().toUpperCase()
  const role = sanitizeInput(input.role).trim()
  const photoUrl = input.photo_url?.trim() || null
  const wikipediaUrl = input.wikipedia_url?.trim() || null

  // Slug validation
  if (!slug || !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(slug)) {
    return { ok: false, message: 'Slug inválido.' }
  }
  if (slug.length < 2 || slug.length > 200) {
    return { ok: false, message: 'Slug deve ter entre 2 e 200 caracteres.' }
  }

  // Required fields
  if (!fullName || fullName.length < 2) return { ok: false, message: 'Nome completo é obrigatório (mínimo 2 caracteres).' }
  if (fullName.length > 200) return { ok: false, message: 'Nome completo deve ter no máximo 200 caracteres.' }
  if (!commonName || commonName.length < 2) return { ok: false, message: 'Nome comum é obrigatório (mínimo 2 caracteres).' }
  if (commonName.length > 100) return { ok: false, message: 'Nome comum deve ter no máximo 100 caracteres.' }
  if (!party) return { ok: false, message: 'Partido é obrigatório.' }
  if (party.length > 20) return { ok: false, message: 'Sigla do partido deve ter no máximo 20 caracteres.' }
  if (!role) return { ok: false, message: 'Cargo é obrigatório.' }

  // State validation
  if (!isValidUF(state)) return { ok: false, message: 'UF inválida.' }

  // Optional URL validation
  if (photoUrl) {
    try { new URL(photoUrl) }
    catch { return { ok: false, message: 'URL da foto inválida.' } }
  }
  if (wikipediaUrl) {
    try { new URL(wikipediaUrl) }
    catch { return { ok: false, message: 'URL da Wikipedia inválida.' } }
  }

  return {
    ok: true,
    data: {
      slug,
      full_name: fullName,
      common_name: commonName,
      party,
      state,
      role,
      photo_url: photoUrl,
      wikipedia_url: wikipediaUrl,
    },
  }
}
