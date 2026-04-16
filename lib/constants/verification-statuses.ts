import type { VerificationStatus } from '@/types/database'

export const VERIFICATION_STATUSES: VerificationStatus[] = [
  'verified',
  'unverified',
  'disputed',
  'removed',
]

export const VerificationStatusLabel: Record<VerificationStatus, string> = {
  verified: 'Verificado',
  unverified: 'Não verificado',
  disputed: 'Disputado',
  removed: 'Removido',
}
