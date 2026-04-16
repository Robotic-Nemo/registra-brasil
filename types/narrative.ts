export interface NarrativeThread {
  id: string
  title: string
  description: string
  topic: string
  dateRange: {
    start: string
    end: string
  }
  statementCount: number
  politicians: {
    id: string
    slug: string
    name: string
    party: string
  }[]
  categories: {
    slug: string
    label: string
    color: string
  }[]
}

export interface NarrativeConnection {
  fromStatementId: string
  toStatementId: string
  type: 'same_topic' | 'same_politician' | 'contradiction' | 'continuation'
}

export interface NarrativeStoryline {
  thread: NarrativeThread
  statements: {
    id: string
    summary: string
    statement_date: string
    politician_name: string
    politician_party: string
  }[]
}
