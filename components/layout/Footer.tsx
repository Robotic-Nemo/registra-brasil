import Link from 'next/link'
import { Archive, Rss } from 'lucide-react'

export function Footer() {
  const year = new Date().getFullYear()

  return (
    <footer role="contentinfo" className="border-t border-gray-200 mt-16 py-10 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 flex flex-col md:flex-row justify-between gap-6 text-sm text-gray-600">
        <div>
          <div className="flex items-center gap-2 font-bold text-gray-900 mb-1">
            <Archive className="w-4 h-4 text-blue-700" />
            Registra Brasil
          </div>
          <p className="text-xs max-w-xs mb-2">
            Arquivo de declarações de políticos brasileiros com ligação a fontes primárias.
            Transparência cívica, não partidarismo.
          </p>
          <p className="text-xs text-gray-600">&copy; {year} Registra Brasil</p>
        </div>

        <nav className="flex gap-8" aria-label="Rodapé">
          <div>
            <p className="font-semibold text-gray-900 mb-2">Navegar</p>
            <ul className="flex flex-col gap-1">
              <li><Link href="/buscar" className="hover:text-gray-900">Buscar</Link></li>
              <li><Link href="/politicos" className="hover:text-gray-900">Políticos</Link></li>
              <li><Link href="/categorias" className="hover:text-gray-900">Categorias</Link></li>
              <li><Link href="/comparar" className="hover:text-gray-900">Comparar</Link></li>
              <li><Link href="/analise" className="hover:text-gray-900">Análise comparativa</Link></li>
              <li><Link href="/colecoes" className="hover:text-gray-900">Coleções</Link></li>
              <li><Link href="/buscar?status=verified" className="hover:text-gray-900">Verificados</Link></li>
              <li><Link href="/estatisticas" className="hover:text-gray-900">Estatísticas</Link></li>
              <li><Link href="/declaracoes-recentes" className="hover:text-gray-900">Recentes</Link></li>
              <li><Link href="/linha-do-tempo" className="hover:text-gray-900">Linha do Tempo</Link></li>
              <li><Link href="/retrospectiva" className="hover:text-gray-900">Retrospectiva</Link></li>
              <li><Link href="/partidos" className="hover:text-gray-900">Partidos</Link></li>
              <li><Link href="/estados" className="hover:text-gray-900">Estados</Link></li>
              <li><Link href="/ranking" className="hover:text-gray-900">Ranking</Link></li>
            </ul>
          </div>
          <div>
            <p className="font-semibold text-gray-900 mb-2">Sobre</p>
            <ul className="flex flex-col gap-1">
              <li><Link href="/sobre" className="hover:text-gray-900">Metodologia</Link></li>
              <li><Link href="/sobre#fontes" className="hover:text-gray-900">Fontes aceitas</Link></li>
              <li><Link href="/fontes" className="hover:text-gray-900">Diretório de fontes</Link></li>
              <li><Link href="/tendencias" className="hover:text-gray-900">Tendências</Link></li>
              <li><Link href="/contradicoes" className="hover:text-gray-900">Contradições</Link></li>
              <li><Link href="/registro-editorial" className="hover:text-gray-900">Registro editorial</Link></li>
              <li><Link href="/comparar-declaracoes" className="hover:text-gray-900">Comparar declarações</Link></li>
              <li><Link href="/agenda" className="hover:text-gray-900">Agenda política</Link></li>
              <li><Link href="/esta-semana" className="hover:text-gray-900">Esta semana</Link></li>
              <li><Link href="/crescimento" className="hover:text-gray-900">Crescimento do arquivo</Link></li>
              <li><Link href="/analise/partidos-x-categorias" className="hover:text-gray-900">Partidos × categorias</Link></li>
              <li><Link href="/analise/estados-x-categorias" className="hover:text-gray-900">Estados × categorias</Link></li>
              <li><Link href="/aleatoria" className="hover:text-gray-900">Me surpreenda (aleatória)</Link></li>
              <li><Link href="/assinar" className="hover:text-gray-900">Assinar (todos os canais)</Link></li>
              <li><Link href="/contato" className="hover:text-gray-900">Contato</Link></li>
              <li><Link href="/imprensa" className="hover:text-gray-900">Imprensa</Link></li>
              <li><Link href="/dados" className="hover:text-gray-900">Dados abertos</Link></li>
              <li><Link href="/desenvolvedores" className="hover:text-gray-900">Para devs</Link></li>
              <li><Link href="/retratacoes" className="hover:text-gray-900">Retratações</Link></li>
              <li><Link href="/atualizacoes" className="hover:text-gray-900">Atualizações</Link></li>
              <li><Link href="/boletim" className="hover:text-gray-900">Boletim</Link></li>
              <li><Link href="/sugerir" className="hover:text-gray-900">Sugerir declaração</Link></li>
              <li><Link href="/meus-alertas" className="hover:text-gray-900">Meus alertas</Link></li>
              <li><Link href="/api-docs" className="hover:text-gray-900"><span lang="en">API</span></Link></li>
              <li>
                <a href="/feed.xml" rel="noopener noreferrer" type="application/rss+xml" className="inline-flex items-center gap-1 hover:text-gray-900">
                  <Rss className="w-3 h-3" aria-hidden="true" />
                  <span lang="en">RSS</span>
                </a>
              </li>
            </ul>
          </div>
          <div>
            <p className="font-semibold text-gray-900 mb-2">Legal</p>
            <ul className="flex flex-col gap-1">
              <li><Link href="/acessibilidade" className="hover:text-gray-900">Acessibilidade</Link></li>
              <li><Link href="/privacidade" className="hover:text-gray-900">Privacidade</Link></li>
              <li><Link href="/termos" className="hover:text-gray-900">Termos de Uso</Link></li>
              <li><Link href="/equipe" className="hover:text-gray-900">Equipe</Link></li>
              <li><Link href="/parceiros" className="hover:text-gray-900">Parceiros</Link></li>
              <li><Link href="/financiamento" className="hover:text-gray-900">Financiamento</Link></li>
              <li><Link href="/transparencia" className="hover:text-gray-900">Transparência</Link></li>
            </ul>
          </div>
        </nav>
      </div>
    </footer>
  )
}
