## Event

```typescript
type Event = {
    id: string
    type: string
    sportId: string
    sportName: string
    sportOrder: number
    regionId: string
    regionCode: string
    regionName: string
    leagueId: string
    leagueName: string
    leagueOrder: number
    isTopLeague: boolean
    participants: Participant[] // Described in a separate table below.
    eventName: string
    betslipLine: string
    totalMarketsCount: number
    marketLinesCount: number
    marketGroups: MarketGroup[] // Described in a separate table below.
    startEventDate: ISODateTimeString
    status: string
    score: GameScore | null // Described in a separate table below.
    isLive: boolean
    isGoingLive: boolean
    liveGameState?: LiveGameState // Described in a separate table below.
    isTeamSwap: boolean
    isSuspended: boolean
    tags: string[] // Described in a separate table below.
    entityType: EntityType
    media?: MediaProvider[] // Described in a separate table below.
    metadata: Dictionary<any> // Described in a separate table below.
}
```