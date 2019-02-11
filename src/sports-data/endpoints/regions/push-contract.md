# Regions Push contract

```typescript
type Region = {
    //The properties with value null are not returning in contract.
    id: string
    liveFixturesTotalCount: number
    fixturesTotalCount: number
    fixturesCount: number
    outrightsTotalCount: number
    activeSports: array //list of strings referring to Sport.id values
    activeSportsCount: number
}
```

| Name | Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
| **id** | Specifies the identifier of the region. | string |	Yes | query (using eq, ne, or, and, in) | $filter=id eq '46' |
|code| Specifies the country code or (for regions in the country) the region code, according to the International Organization for Standardization ( ISO). | string | No | query (using eq, ne, or, and, in) | $filter=code eq 'AU' |
|name| Specifies the name of the region. | string | No | query (using eq, ne, or, and, in) | $filter=name eq 'Australia' |
| **liveFixturesTotalCount** | Specifies the number of in-play events. | number | Yes | $orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=liveFixturesTotalCount desc </br> $filter=liveFixturesTotalCount eq 0 |
| **fixturesTotalCount** | Specifies the total number of games, both live and pre-live. | number | Yes | 	$orderby (only desc) </br> query (using eq, ne, or, and, in) | $orderby=fixturesTotalCount desc </br>$filter=fixturesTotalCount eq 1 |
| *fixturesCount* | Specifies the number of games, both live and pre-live, filtered by time range. | number	| Yes |	$orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=fixturesCount desc </br>$filter=fixturesCount eq 1 |
| *outrightsTotalCount* | Specifies the number of active outrights in a league. | number | Yes | $orderby (only desc) </br>query (using eq, ne, or, and, in) | $orderby=outrightsTotalCount desc </br>$filter=outrightsTotalCount eq 1 |
| *activeSports* | Specifies a list of sport IDs from which there are available events taking place in leagues from this region, filtered by time range. | array | Yes | query (using lambda, eq, ne, or, and, in) | $filter=activeSports/any(s: s eq '6') |
| *activeSportsCount* | Specifies the number of items returned in the `actriveSports` array. | number | Yes	| query (using eq, ne, or, and, in) | $filter=activeSportsCount eq 2 |
