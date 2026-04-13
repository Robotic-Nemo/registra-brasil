import Link from 'next/link'
import { Archive } from 'lucide-react'

export function Footer() {
  return (
    <footer className="border-t border-gray-200 mt-16 py-10 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 flex flex-col md:flex-row justify-between gap-6 text-sm text-gray-600">
        <div>
          <div className="flex items-center gap-2 font-bold text-gray-900 mb-1">
            <Archive className="w-4 h-4 text-blue-700" />
            Registra Brasil
          </div>
          <p className="text-xs max-w-xs">
            Arquivo de declarações de políticos brasileiros com ligação a fontes primárias.
            Transparência cívica, não partidarismo.
          </p>
        </div>

        <div className="flex gap-8">
          <div>
            <p className="font-semibold text-gray-900 mb-2">Navegar</p>
            <div className="flex flex-col gap-1">
              <Link href="/buscar" className="hover:text-gray-900">Buscar</Link>
              <Link href="/buscar?status=verified" className="hover:text-gray-900">Verificados</Link>
            </div>
          </div>
          <div>
            <p className="font-semibold text-gray-900 mb-2">Sobre</p>
            <div className="flex flex-col gap-1">
              <Link href="/sobre" className="hover:text-gray-900">Metodologia</Link>
              <Link href="/sobre#fontes" className="hover:text-gray-900">Fontes</Link>
            </div>
          </div>
        </div>
      </div>
    </footer>
  )
}
