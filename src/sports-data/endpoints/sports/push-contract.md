# Sports Push contract

```typescript
type Sport = {
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
| **id** | Specifies the identifier of the sport. | string | Yes | query (using eq, ne, or, and, in) | $filter=Id eq '1' |
|order|	Specifies the sorting order of the sport. | number | No | $orderby (only asc) | $orderby=order asc |
|name| Specifies the name of the sport and the required translations. | string | No | query (using eq, ne, or, and, in) | $filter=name eq 'Soccer' |
| **liveFixturesTotalCount** | Specifies the number of active live events. | number | Yes | $orderby (only desc), query (using eq, ne, or, and, in) | $orderby=liveFixturesTotalCount desc, $filter=liveFixturesTotalCount eq 0 |
| **fixturesTotalCount** | Specifies the total number of games, both live and pre-live. | number | Yes | $orderby (only desc), query (using eq, ne, or, and, in) | $orderby=fixturesTotalCount desc, $filter=fixturesTotalCount eq 1 |
| **fixturesCount** | Specifies the number of games, both live and pre-live, within the specific time range of a query. |	number. | Yes |	$orderby (only desc), query (using eq, ne, or, and, in) | $orderby=fixturesCount desc, $filter=fixturesCount eq 1 |
| **outrightsTotalCount** | Specifies the number of active outrights in a sport. | number | Yes | $orderby (only desc), query (using eq, ne, or, and, in) | $orderby=outrightsTotalCount desc, $filter=outrightsTotalCount eq 1 |
|tags| Specifies additional information for the sport. | array | No | query (using lambda, eq, ne, or, and, in) | $filter=tags/any(s: s eq 'LiveStream') |
