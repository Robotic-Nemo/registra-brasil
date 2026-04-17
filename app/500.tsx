import Link from 'next/link'
import { ServerCrash, Home } from 'lucide-react'

/**
 * Custom 500 error page for internal server errors.
 * Note: In Next.js App Router, this may not be used directly;
 * the root error.tsx handles most runtime errors. Kept as a
 * fallback for pages/ compatibility or future use.
 */
export default function Custom500() {
  return (
    <main className="max-w-lg mx-auto px-4 py-24 text-center">
      <ServerCrash className="w-14 h-14 text-red-400 mx-auto mb-4" aria-hidden="true" />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Erro no servidor</h1>
      <p className="text-gray-500 text-sm mb-6">
        Ocorreu um erro interno no servidor. Nossa equipe foi notificada e estamos trabalhando
        para resolver o problema.
      </p>
      <div className="flex items-center justify-center gap-3 flex-wrap">
        <Link
          href="/"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <Home className="w-4 h-4" />
          Ir para o inicio
        </Link>
      </div>
      <div className="mt-8">
        <a
          href="https://github.com/Robotic-Nemo/registra-brasil/issues/new?labels=bug&title=Erro+500"
          rel="noopener noreferrer"
          target="_blank"
          className="text-xs text-gray-400 hover:text-gray-600 underline underline-offset-2 transition-colors"
        >
          Reportar problema
        </a>
      </div>
    </main>
  )
}
