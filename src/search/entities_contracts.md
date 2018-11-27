## Entities contracts

```typescript
type Event = {
    id: string
    eventName: string
    entityType: number   
    leagueName: string
    sportId: string
    sportOrder: number
    leagueOrder: number
    isLive: boolean
    startEventDate: DateTime
}

type Sport = {
    id: string
    entityType: number
    name: string   
    sportOrder: number
    totalEventsCount: number
}

type League = {
    id: string
    entityType: number
    name: string
    sportOrder: number
    sportId: string
    sportName: string
    leagueOrder: number
    regionCode: string
    totalEventsCount: number
}
```
