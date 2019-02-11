# Markets Push contract
```typescript
type Market = {
    //The properties with value null are not returning in contract.
    id: string
    name: string
    betslipLine: string
    marketType: MarketType
    selections: Selection[] 
    eventId: string
    isSuspended: boolean
    liveData: LiveData
    metadata: Dictionary<string>
}

```

| Name | Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
| **id** | Specifies the identifier of the market. | string | Yes | query (using eq, ne, or, and, in) | $filter=id eq '129' |
| **name** | Specifies the name of the market. Intended to be displayed as the title (or header) of the market's presentation block. | string | Yes |	query (using eq, ne, or, and, in) | $filter=name eq 'FT Winner' |
| **betslipLine** | Specifies the presentation of the market in the bet slip in the context of each of its selections. To be used in conjunction with the respective `Market.selections[].betslipLine` and `Event.betslipLine` values. | string |	Yes | query (using eq, ne, or, and, in) | $filter=betslipLine eq 'FT Winner' |
|sportId| Specifies the identifier of the sport. | number | No | query (using eq, ne, or, and, in) | $filter=sportId eq '8' |
|leagueId| Specifies the identifier of the league. | number | No | query (using eq, ne, or, and, in) | $filter=leagueId eq '42133' |
|title| Specifies the title of the market. | string | No | query (using eq, ne, or, and, in) | $filter=title eq 'World Cup 2019 - Winner' |
|groups| List of groups (by ID) to which the market is included. See "Event # Market groups":https://github.com/WeKnowSports/SportsDataAPI/wiki/Events#marketgroup for details. Note that one market can belong to none, one, or more than one group. |	Array |	No | query (using lambda, eq, ne, or, and, in) | $filter=groups/any(s: s eq '1495') |
|inMarketGroups| List of groups (as objects) to which the market is included. | Array | No | query (using lambda, eq, ne, or, and, in) | $filter=inMarketGroups/any(s: s/id eq '1495') |
|participantMapping| Specifies a relation of the entire market (with all of its selection) to a specific participant in the parent event. The value matches `Event.participants.id`. | string | No | query (using eq, ne, or, and, in) | $filter=participantMapping eq '8400' |
| **selections** | Lists the selections in the market. | Selection[] | Yes | query (using lambda, eq, ne, or, and, in) | $filter=selections/any(s: s/id eq '0ML32475199_2') |
| **eventId** | Specifies the identifier of the event. | string | Yes | query (using eq, ne, or, and, in) | $filter=eventId eq '100' |
|isLive| Specifies if the market refers to a live event. | Boolean | No | query (using eq, ne) | $filter=isLive eq false |
| **isSuspended** | Specifies if the market is suspended. No bets are accepted for suspended markets, therefore interaction with them should be disabled or they should be removed from view altogether.	| Boolean | Yes | query (using eq, ne) | $filter=isSuspended eq false |
|tags| Specifies additional information on different aspects of the market. | array | No | query (using lambda, eq, ne, or, and, in) | $filter=tags/any(s: s eq 'Cashout') |
| **marketType** | Contains parameters for the market type. The marketType parameters are described in a separate table below. | MarketType | Yes | query (using lambda, eq, ne, or, and, in) | $filter=marketType/id eq '1_0' |
| **liveData** | Provides information on the score for the two teams and if the event is suspended. The LiveData parameters are described in a separate table. | LiveData | Yes | query (using lambda, eq, ne, or, and, in) | $filter=liveData/scoreHome eq '40' |
|castMarkets| List of IDs of markets which are cast into this market. Data provided only if this is a cast market. If selections from one listed market can be combined with other selections from the same market, the respective market ID is repeated for the corresponding number of times (e.g. twice for Forecast, thrice for Tricast). |	Array | No | query (using lambda, eq, ne, or, and, in) | $filter=castMarkets/any(s: s eq 44147679) |
|**metadata** | Dictionary of ad hoc parameters which are not part of the general object model. | Dictionary | Yes |	No | -- |
