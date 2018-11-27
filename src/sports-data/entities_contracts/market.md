## Market

```typescript
type Market = {
    id: string
    name: string
    betslipLine: string
    marketType: MarketType // MarketType object described in a separate table below 
    sportId: string
    leagueId: string
    startDate: ISODateTimeString
    title?: string
    inMarketGroups: InMarketGroups[] // InMarketGroups object described in a separate table below
    participantMapping?: string
    selections: Selection[] // Selection object described in a separate table below 
    eventId: string
    entityType: EntityType
    isLive: boolean
    isSuspended: boolean
    liveData: LiveData // LiveData object described in a separate table below
    metadata: Dictionary<string>
    castMarkets?: array
    tags: string[]
}

type MarketType = {
    id: string
    name: string
    isCastMarket: boolean
}

type LiveData = {
    scoreHome: number
    scoreAway: number
}

type InMarketGroups = {
    id: string
    sortignKey: number
}
```