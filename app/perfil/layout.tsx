import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Meu perfil — Registra Brasil',
  description: 'Seus filtros salvos, favoritos e histórico de navegação (armazenados localmente no navegador).',
  robots: { index: false, follow: true },
  alternates: { canonical: '/perfil' },
}

export default function PerfilLayout({ children }: { children: React.ReactNode }) {
  return children
}
