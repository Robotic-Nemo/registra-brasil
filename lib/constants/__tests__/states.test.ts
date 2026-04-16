import { describe, test, expect } from 'vitest'
import {
  BRAZILIAN_STATES, STATE_MAP, REGIONS,
  getStateName, getStatesByRegion, isValidUF,
} from '../states'

describe('BRAZILIAN_STATES', () => {
  test('contains 27 states', () => {
    expect(BRAZILIAN_STATES).toHaveLength(27)
  })

  test('each state has uf, name, and region', () => {
    for (const state of BRAZILIAN_STATES) {
      expect(state.uf).toBeTruthy()
      expect(state.name).toBeTruthy()
      expect(state.region).toBeTruthy()
    }
  })

  test('includes SP', () => {
    const sp = BRAZILIAN_STATES.find(s => s.uf === 'SP')
    expect(sp).toBeDefined()
    expect(sp?.name).toBe('São Paulo')
    expect(sp?.region).toBe('Sudeste')
  })
})

describe('STATE_MAP', () => {
  test('maps UF to state', () => {
    const rj = STATE_MAP.get('RJ')
    expect(rj?.name).toBe('Rio de Janeiro')
  })
})

describe('REGIONS', () => {
  test('contains 5 regions', () => {
    expect(REGIONS).toHaveLength(5)
  })
})

describe('getStateName', () => {
  test('returns state name for valid UF', () => {
    expect(getStateName('SP')).toBe('São Paulo')
    expect(getStateName('RJ')).toBe('Rio de Janeiro')
    expect(getStateName('MG')).toBe('Minas Gerais')
  })

  test('returns UF itself for unknown UF', () => {
    expect(getStateName('XX')).toBe('XX')
  })
})

describe('getStatesByRegion', () => {
  test('returns states for Sudeste', () => {
    const states = getStatesByRegion('Sudeste')
    expect(states.length).toBe(4)
    const ufs = states.map(s => s.uf)
    expect(ufs).toContain('SP')
    expect(ufs).toContain('RJ')
    expect(ufs).toContain('MG')
    expect(ufs).toContain('ES')
  })

  test('returns states for Sul', () => {
    const states = getStatesByRegion('Sul')
    expect(states.length).toBe(3)
  })
})

describe('isValidUF', () => {
  test('returns true for valid UF', () => {
    expect(isValidUF('SP')).toBe(true)
    expect(isValidUF('AC')).toBe(true)
  })

  test('returns true case-insensitive', () => {
    expect(isValidUF('sp')).toBe(true)
  })

  test('returns false for invalid UF', () => {
    expect(isValidUF('XX')).toBe(false)
    expect(isValidUF('')).toBe(false)
  })
})
