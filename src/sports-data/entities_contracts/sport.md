## Sport

```typescript
export interface Sport {
    /** sport ID */
    id: string

    /** sorting order */
    order: number

    /** translated sport name */
    name: string

    /** number of live (in-game) active games */
    liveFixturesTotalCount: number

    /** total number of games, both live and pre-live */
    fixturesTotalCount: number

    /** number of games, both live and pre-live filtered by time range */
    fixturesCount: number

    /** number of active outrights league bound markets */
    outrightsTotalCount: number

    entityType: EntityType

    /** array based on tags of events belonging to sport*/
    tags: string[]
}

export interface SportChange {
    id: string,
    liveFixturesTotalCount: number,
    fixturesTotalCount: number,
    fixturesCount: number,
    outrightsTotalCount: number
}
```