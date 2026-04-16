export interface FeedItem {
  id: string
  title: string
  description: string
  content?: string
  link: string
  pubDate: string
  author?: string
  categories?: string[]
  guid?: string
  enclosure?: {
    url: string
    type: string
    length?: number
  }
}

export interface FeedChannel {
  title: string
  description: string
  link: string
  language: string
  lastBuildDate: string
  generator: string
  ttl?: number
  image?: {
    url: string
    title: string
    link: string
    width?: number
    height?: number
  }
}

export interface AtomLink {
  href: string
  rel: 'self' | 'alternate' | 'hub'
  type?: string
}
