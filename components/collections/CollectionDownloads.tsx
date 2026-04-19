import { Download, FileJson, FileSpreadsheet, FileText } from 'lucide-react'

export function CollectionDownloads({ slug }: { slug: string }) {
  const base = `/api/colecao/${slug}/export`
  const items: Array<{
    href: string
    label: string
    Icon: typeof Download
    desc: string
  }> = [
    { href: `${base}?format=csv`, label: 'CSV', Icon: FileSpreadsheet, desc: 'Planilhas' },
    { href: `${base}?format=json`, label: 'JSON', Icon: FileJson, desc: 'Dev / script' },
    { href: `${base}?format=bibtex`, label: 'BibTeX', Icon: FileText, desc: 'LaTeX / citações' },
  ]
  return (
    <div className="mt-4 flex flex-wrap items-center gap-2 text-xs">
      <span className="inline-flex items-center gap-1 text-gray-500 dark:text-gray-400">
        <Download className="h-3.5 w-3.5" aria-hidden />
        Baixar coleção:
      </span>
      {items.map(({ href, label, Icon, desc }) => (
        <a
          key={label}
          href={href}
          className="inline-flex items-center gap-1 rounded-full border border-gray-300 bg-white px-2.5 py-1 font-medium text-gray-700 hover:border-indigo-400 hover:bg-indigo-50 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-200 dark:hover:border-indigo-500 dark:hover:bg-indigo-950/30"
          title={desc}
        >
          <Icon className="h-3 w-3" aria-hidden />
          {label}
        </a>
      ))}
    </div>
  )
}
