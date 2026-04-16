/**
 * Dev-only accessibility checker.
 * Scans the DOM for common accessibility issues.
 */

interface A11yIssue {
  type: 'error' | 'warning'
  element: string
  message: string
}

function describeElement(el: Element): string {
  const tag = el.tagName.toLowerCase()
  const id = el.id ? `#${el.id}` : ''
  const cls = el.className && typeof el.className === 'string'
    ? `.${el.className.split(' ').slice(0, 2).join('.')}`
    : ''
  return `${tag}${id}${cls}`
}

/** Check for missing alt attributes on images */
function checkImages(container: Element): A11yIssue[] {
  const issues: A11yIssue[] = []
  const images = container.querySelectorAll('img')
  images.forEach((img) => {
    if (!img.hasAttribute('alt')) {
      issues.push({
        type: 'error',
        element: describeElement(img),
        message: 'Imagem sem atributo alt',
      })
    }
  })
  return issues
}

/** Check for missing labels on form inputs */
function checkFormLabels(container: Element): A11yIssue[] {
  const issues: A11yIssue[] = []
  const inputs = container.querySelectorAll('input, select, textarea')
  inputs.forEach((input) => {
    const el = input as HTMLInputElement
    if (el.type === 'hidden' || el.type === 'submit' || el.type === 'button') return
    const hasLabel = el.id && container.querySelector(`label[for="${el.id}"]`)
    const hasAriaLabel = el.getAttribute('aria-label') || el.getAttribute('aria-labelledby')
    const wrappedInLabel = el.closest('label')
    if (!hasLabel && !hasAriaLabel && !wrappedInLabel) {
      issues.push({
        type: 'error',
        element: describeElement(el),
        message: 'Campo de formulario sem label associado',
      })
    }
  })
  return issues
}

/** Check for empty links and buttons */
function checkEmptyInteractives(container: Element): A11yIssue[] {
  const issues: A11yIssue[] = []
  const elements = container.querySelectorAll('a, button')
  elements.forEach((el) => {
    const text = el.textContent?.trim()
    const ariaLabel = el.getAttribute('aria-label')
    const ariaLabelledBy = el.getAttribute('aria-labelledby')
    if (!text && !ariaLabel && !ariaLabelledBy) {
      issues.push({
        type: 'warning',
        element: describeElement(el),
        message: `${el.tagName.toLowerCase()} sem texto acessivel`,
      })
    }
  })
  return issues
}

/** Check heading hierarchy */
function checkHeadingHierarchy(container: Element): A11yIssue[] {
  const issues: A11yIssue[] = []
  const headings = container.querySelectorAll('h1, h2, h3, h4, h5, h6')
  let lastLevel = 0
  headings.forEach((h) => {
    const level = parseInt(h.tagName[1])
    if (level > lastLevel + 1 && lastLevel > 0) {
      issues.push({
        type: 'warning',
        element: describeElement(h),
        message: `Nivel de titulo pulado: h${lastLevel} para h${level}`,
      })
    }
    lastLevel = level
  })
  return issues
}

/** Run all accessibility checks */
export function runA11yChecks(container?: Element): A11yIssue[] {
  if (typeof document === 'undefined') return []
  const root = container ?? document.body

  return [
    ...checkImages(root),
    ...checkFormLabels(root),
    ...checkEmptyInteractives(root),
    ...checkHeadingHierarchy(root),
  ]
}

/** Log accessibility issues to console (dev only) */
export function logA11yIssues(): void {
  if (process.env.NODE_ENV !== 'development') return
  const issues = runA11yChecks()
  if (issues.length === 0) {
    console.debug('[a11y] Nenhum problema encontrado')
    return
  }
  console.group(`[a11y] ${issues.length} problema(s) encontrado(s)`)
  issues.forEach((issue) => {
    const method = issue.type === 'error' ? 'error' : 'warn'
    console[method](`${issue.element}: ${issue.message}`)
  })
  console.groupEnd()
}
