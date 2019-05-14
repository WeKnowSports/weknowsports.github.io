# Leagues Pull contract

## League object
```typescript
type League = {
    id: string
    name: string
    sportId: string
    sportName: string
    regionId: string
    regionCode: string
    defaultOrder: number
    isTopLeague: boolean
    masterLeagueId: string
    liveFixturesTotalCount: number
    fixturesTotalCount: number
    fixturesCount: number
    outrightsTotalCount: number
    entityType: EntityType
    tags: array
}
```

| Name | Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
|id| Specifies the Identifier of the league. | number |	Yes | query (using eq, ne, or, and, in) | $filter=id eq '46' |
|name| Specifies the name of the league in the particular translation. | string	| Yes |	query (using eq, ne, or, and, in) | $filter=name eq 'Bangor' |
|sportId| Specifies the identifier of the sport. | string | Yes | query (using eq, ne, or, and, in) | $filter=sportId eq '61' |
|sportName| Specifies the name of the sport. | number |	Yes | query (using eq, ne, or, and, in) | $filter=sportName eq 'Horse Racing'  |
|regionId| Specifies the identifier of the region. | number | Yes | query (using eq, ne, or, and, in) | $filter=regionId eq '225'  |
|regionCode| ISO country code or (for regions in country) region code. | number | Yes | query (using eq, ne, or, and, in) |$filter=regionId eq '225'  |
|order| Specifies the sorting order. | number | Yes | Yes |  |
|istopLeague| Specifies if the league is marked as top. | boolean | Yes | query (using eq, ne) | $filter=isTopLeague eq false |
|liveFixturesTotalCount| Specifies the number of in-play events. | number | Yes | $orderby (only desc) </br> query (using eq, ne, or, and, in) | $orderby=liveFixturesTotalCount desc </br> $filter=liveFixturesTotalCount eq 0 |
|fixturesTotalCount| Specifies the total number of games, both live and pre-live. |number| Yes | $orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=fixturesTotalCount desc </br>$filter=fixturesTotalCount eq 1 |
|fixturesCount|	Specifies the number of games, both live and pre-live, filtered by time range. | number	| Yes |	$orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=fixturesCount desc </br> $filter=fixturesCount eq 1 |
|outrightsTotalCount| Specifies the number of active outrights in a league. | number | Yes | $orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=outrightsTotalCount desc </br>$filter=outrightsTotalCount eq 1 |
|entityType| Specifies the entity type. Always 3 for leagues. |	entitytype | Yes | No | -- |
|defaultOrder| Specifies the sorting order. | number | Yes | $orderby (only asc) | $orderby=defaultOrder asc |
|masterLeagueId|  | string | Yes | query (using eq, ne, or, and, in) | $filter=masterLeagueId eq '10411' |
|tags| Specifies additional information on different aspects of the league. | array | Yes | query (using lambda, eq, ne, or, and, in) | $filter=tags/any(s: s eq 'LiveStream') |

## Tags

|Tag|Description|
| --- | --- |
|LiveStream|Integration with live streaming provider is available for at least one event belonging to this league.| 
