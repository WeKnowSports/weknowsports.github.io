## Region

```typescript
type Region = {
    id: string
    code: string
    name: string
    liveFixturesTotalCount: number
    fixturesTotalCount: number
    fixturesCount: number
    outrightsTotalCount: number
    activeSports: array //list of strings referring to Sport.id values
    activeSportsCount: number
    entityType: EntityType
}
```