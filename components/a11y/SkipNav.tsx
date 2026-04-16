'use client'

const targets = [
  { id: 'main-content', label: 'Pular para o conteudo principal' },
  { id: 'search-input', label: 'Pular para a busca' },
  { id: 'nav-menu', label: 'Pular para o menu' },
  { id: 'footer', label: 'Pular para o rodape' },
] as const

/**
 * Enhanced skip navigation with multiple targets.
 * Links are visually hidden until focused via keyboard.
 */
export function SkipNav() {
  return (
    <nav aria-label="Atalhos de navegacao" className="relative z-[70]">
      {targets.map(({ id, label }) => (
        <a
          key={id}
          href={`#${id}`}
          className="sr-only focus:not-sr-only focus:fixed focus:top-2 focus:left-2 focus:z-[70] focus:bg-blue-700 focus:text-white focus:px-4 focus:py-2 focus:rounded-lg focus:text-sm focus:font-medium focus:shadow-lg focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-offset-2"
        >
          {label}
        </a>
      ))}
    </nav>
  )
}
