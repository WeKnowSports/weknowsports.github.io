# Leagues Push contract

```typescript
type League = {
    //The properties with value null are not returning in contract.
    id: string
    liveFixturesTotalCount: number
    fixturesTotalCount: number
    fixturesCount: number
    outrightsTotalCount: number
}
```

| Name | Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
| **id** | Specifies the Identifier of the league. | number |	Yes | query (using eq, ne, or, and, in) | $filter=id eq '46' |
|name| Specifies the name of the league in the particular translation. | string	| No |	query (using eq, ne, or, and, in) | $filter=name eq 'Bangor' |
|sportId| Specifies the identifier of the sport. | string | No | query (using eq, ne, or, and, in) | $filter=sportId eq '61' |
|sportName| Specifies the name of the sport. | string |	No | query (using eq, ne, or, and, in) | $filter=sportName eq 'Horse Racing'  |
|regionId| Specifies the identifier of the region. | string | No | query (using eq, ne, or, and, in) | $filter=regionId eq '225'  |
|regionCode| ISO country code or (for regions in country) region code. | string | No | query (using eq, ne, or, and, in) | $filter=regionId eq '225'  |
|istopLeague| Specifies if the league is marked as top. | boolean | No | query (using eq, ne) | $filter=isTopLeague eq false |
| **liveFixturesTotalCount** | Specifies the number of in-play events. | number | Yes | $orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=liveFixturesTotalCount desc </br>$filter=liveFixturesTotalCount eq 0 |
| **fixturesTotalCount** | Specifies the total number of games, both live and pre-live. |number| Yes | $orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=fixturesTotalCount desc </br>$filter=fixturesTotalCount eq 1 |
| **fixturesCount** | Specifies the number of games, both live and pre-live, filtered by time range. | number	| Yes |	$orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=fixturesCount desc </br>$filter=fixturesCount eq 1 |
| **outrightsTotalCount** | Specifies the number of active outrights in a league. | number | Yes | $orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=outrightsTotalCount desc </br>$filter=outrightsTotalCount eq 1 |
|defaultOrder| Specifies the sorting order. | number | No | $orderby (only asc) | $orderby=defaultOrder asc |
|masterLeagueId|  | string | No | query (using eq, ne, or, and, in) | $filter=masterLeagueId eq '10411' |
|tags| Specifies additional information on different aspects of the league. | array | No | query (using lambda, eq, ne, or, and, in) | $filter=tags/any(s: s eq 'LiveStream') |
