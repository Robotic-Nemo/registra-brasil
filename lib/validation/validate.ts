/**
 * Lightweight schema validation library — no external dependencies.
 * Portuguese error messages by default.
 */

export type ValidationError = { path: string; message: string }
export type ValidationResult<T> = { ok: true; data: T } | { ok: false; errors: ValidationError[] }

// ---------------------------------------------------------------------------
// Core validator type
// ---------------------------------------------------------------------------

export interface Validator<T> {
  _parse(value: unknown, path: string): { ok: true; data: T } | { ok: false; errors: ValidationError[] }
  parse(value: unknown): ValidationResult<T>
  optional(): Validator<T | undefined>
}

function makeValidator<T>(
  parseFn: (value: unknown, path: string) => { ok: true; data: T } | { ok: false; errors: ValidationError[] }
): Validator<T> {
  const validator: Validator<T> = {
    _parse: parseFn,
    parse(value: unknown) {
      return parseFn(value, '')
    },
    optional() {
      return makeValidator<T | undefined>((val, path) => {
        if (val === undefined || val === null) return { ok: true, data: undefined }
        return parseFn(val, path)
      })
    },
  }
  return validator
}

// ---------------------------------------------------------------------------
// String validators
// ---------------------------------------------------------------------------

export interface StringValidator extends Validator<string> {
  min(n: number, msg?: string): StringValidator
  max(n: number, msg?: string): StringValidator
  minLength(n: number, msg?: string): StringValidator
  maxLength(n: number, msg?: string): StringValidator
  pattern(re: RegExp, msg?: string): StringValidator
  email(msg?: string): StringValidator
  url(msg?: string): StringValidator
  uuid(msg?: string): StringValidator
  slug(msg?: string): StringValidator
  date(msg?: string): StringValidator
  oneOf(values: string[], msg?: string): StringValidator
  trim(): StringValidator
}

function stringValidator(checks: Array<(val: string, path: string) => ValidationError | null> = []): StringValidator {
  const parseFn = (value: unknown, path: string) => {
    if (typeof value !== 'string') {
      return { ok: false as const, errors: [{ path, message: 'Deve ser um texto' }] }
    }
    let val = value
    const errors: ValidationError[] = []
    for (const check of checks) {
      const err = check(val, path)
      if (err) errors.push(err)
    }
    if (errors.length > 0) return { ok: false as const, errors }
    return { ok: true as const, data: val }
  }

  const base = makeValidator<string>(parseFn) as StringValidator & {
    _checks: typeof checks
  }

  const extend = (newCheck: (val: string, path: string) => ValidationError | null) =>
    stringValidator([...checks, newCheck])

  base.min = (n, msg) => extend((v, p) => v.length < n ? { path: p, message: msg ?? `Mínimo de ${n} caracteres` } : null)
  base.max = (n, msg) => extend((v, p) => v.length > n ? { path: p, message: msg ?? `Máximo de ${n} caracteres` } : null)
  base.minLength = base.min
  base.maxLength = base.max
  base.pattern = (re, msg) => extend((v, p) => !re.test(v) ? { path: p, message: msg ?? 'Formato inválido' } : null)
  base.email = (msg) => extend((v, p) => !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v) ? { path: p, message: msg ?? 'E-mail inválido' } : null)
  base.url = (msg) => extend((v, p) => {
    try { const u = new URL(v); return (u.protocol === 'http:' || u.protocol === 'https:') ? null : { path: p, message: msg ?? 'URL inválida' } }
    catch { return { path: p, message: msg ?? 'URL inválida' } }
  })
  base.uuid = (msg) => extend((v, p) =>
    !/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(v)
      ? { path: p, message: msg ?? 'UUID inválido' } : null
  )
  base.slug = (msg) => extend((v, p) =>
    !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(v) ? { path: p, message: msg ?? 'Slug inválido' } : null
  )
  base.date = (msg) => extend((v, p) => {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(v)) return { path: p, message: msg ?? 'Data inválida (use AAAA-MM-DD)' }
    const d = new Date(v + 'T00:00:00')
    if (isNaN(d.getTime()) || !d.toISOString().startsWith(v)) return { path: p, message: msg ?? 'Data inválida' }
    return null
  })
  base.oneOf = (values, msg) => extend((v, p) =>
    !values.includes(v) ? { path: p, message: msg ?? `Deve ser um de: ${values.join(', ')}` } : null
  )
  base.trim = () => {
    const newChecks = [...checks]
    return stringValidator(newChecks) // trim is applied at object-level parsing
  }

  return base
}

export function string(): StringValidator {
  return stringValidator()
}

// ---------------------------------------------------------------------------
// Number validator
// ---------------------------------------------------------------------------

export interface NumberValidator extends Validator<number> {
  min(n: number, msg?: string): NumberValidator
  max(n: number, msg?: string): NumberValidator
  int(msg?: string): NumberValidator
}

function numberValidator(checks: Array<(val: number, path: string) => ValidationError | null> = []): NumberValidator {
  const parseFn = (value: unknown, path: string) => {
    const n = typeof value === 'string' ? Number(value) : value
    if (typeof n !== 'number' || isNaN(n)) {
      return { ok: false as const, errors: [{ path, message: 'Deve ser um número' }] }
    }
    const errors: ValidationError[] = []
    for (const check of checks) {
      const err = check(n, path)
      if (err) errors.push(err)
    }
    if (errors.length > 0) return { ok: false as const, errors }
    return { ok: true as const, data: n }
  }

  const base = makeValidator<number>(parseFn) as NumberValidator

  const extend = (newCheck: (val: number, path: string) => ValidationError | null) =>
    numberValidator([...checks, newCheck])

  base.min = (n, msg) => extend((v, p) => v < n ? { path: p, message: msg ?? `Mínimo: ${n}` } : null)
  base.max = (n, msg) => extend((v, p) => v > n ? { path: p, message: msg ?? `Máximo: ${n}` } : null)
  base.int = (msg) => extend((v, p) => !Number.isInteger(v) ? { path: p, message: msg ?? 'Deve ser um número inteiro' } : null)

  return base
}

export function number(): NumberValidator {
  return numberValidator()
}

// ---------------------------------------------------------------------------
// Boolean validator
// ---------------------------------------------------------------------------

export function boolean(): Validator<boolean> {
  return makeValidator<boolean>((value, path) => {
    if (typeof value === 'boolean') return { ok: true, data: value }
    if (value === 'true') return { ok: true, data: true }
    if (value === 'false') return { ok: true, data: false }
    return { ok: false, errors: [{ path, message: 'Deve ser verdadeiro ou falso' }] }
  })
}

// ---------------------------------------------------------------------------
// Object validator
// ---------------------------------------------------------------------------

type Shape = Record<string, Validator<unknown>>
type InferShape<S extends Shape> = {
  [K in keyof S]: S[K] extends Validator<infer T> ? T : never
}

export function object<S extends Shape>(shape: S): Validator<InferShape<S>> {
  return makeValidator<InferShape<S>>((value, path) => {
    if (typeof value !== 'object' || value === null || Array.isArray(value)) {
      return { ok: false, errors: [{ path, message: 'Deve ser um objeto' }] }
    }
    const obj = value as Record<string, unknown>
    const errors: ValidationError[] = []
    const result = {} as Record<string, unknown>

    for (const [key, validator] of Object.entries(shape)) {
      const fieldPath = path ? `${path}.${key}` : key
      const fieldResult = validator._parse(obj[key], fieldPath)
      if (fieldResult.ok) {
        result[key] = fieldResult.data
      } else {
        errors.push(...fieldResult.errors)
      }
    }

    if (errors.length > 0) return { ok: false, errors }
    return { ok: true, data: result as InferShape<S> }
  })
}

// ---------------------------------------------------------------------------
// Array validator
// ---------------------------------------------------------------------------

export function array<T>(itemValidator: Validator<T>): Validator<T[]> & { min(n: number, msg?: string): Validator<T[]>; max(n: number, msg?: string): Validator<T[]> } {
  const parseFn = (value: unknown, path: string) => {
    if (!Array.isArray(value)) {
      return { ok: false as const, errors: [{ path, message: 'Deve ser uma lista' }] }
    }
    const errors: ValidationError[] = []
    const results: T[] = []
    for (let i = 0; i < value.length; i++) {
      const itemPath = `${path}[${i}]`
      const itemResult = itemValidator._parse(value[i], itemPath)
      if (itemResult.ok) {
        results.push(itemResult.data)
      } else {
        errors.push(...itemResult.errors)
      }
    }
    if (errors.length > 0) return { ok: false as const, errors }
    return { ok: true as const, data: results }
  }

  const base = makeValidator<T[]>(parseFn) as Validator<T[]> & { min(n: number, msg?: string): Validator<T[]>; max(n: number, msg?: string): Validator<T[]> }
  base.min = (n, msg) => {
    return makeValidator<T[]>((value, path) => {
      const r = parseFn(value, path)
      if (!r.ok) return r
      if (r.data.length < n) return { ok: false, errors: [{ path, message: msg ?? `Deve ter pelo menos ${n} itens` }] }
      return r
    }) as typeof base
  }
  base.max = (n, msg) => {
    return makeValidator<T[]>((value, path) => {
      const r = parseFn(value, path)
      if (!r.ok) return r
      if (r.data.length > n) return { ok: false, errors: [{ path, message: msg ?? `Deve ter no máximo ${n} itens` }] }
      return r
    }) as typeof base
  }
  return base
}

// ---------------------------------------------------------------------------
// Utility: format errors as a flat object keyed by path
// ---------------------------------------------------------------------------

export function formatErrors(errors: ValidationError[]): Record<string, string> {
  const result: Record<string, string> = {}
  for (const e of errors) {
    if (!result[e.path]) result[e.path] = e.message
  }
  return result
}
