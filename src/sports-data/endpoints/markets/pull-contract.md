# Markets Pull contract

## Market object
```typescript
type Market = {
    id: string
    name: string
    betslipLine: string
    marketType: MarketType // MarketType object described in a separate table below 
    sportId: string
    leagueId: string
    startDate: ISODateTimeString
    title: string
    groups: array
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
```

| Name | Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
|id| Specifies the identifier of the market. | string | Yes | query (using eq, ne, or, and, in) | $filter=id eq '129' |
|name| Specifies the name of the market. Intended to be displayed as the title (or header) of the market's presentation block. | string | Yes |	query (using eq, ne, or, and, in) | $filter=name eq 'FT Winner' |
|betslipLine| Specifies the presentation of the market in the bet slip in the context of each of its selections. To be used in conjunction with the respective `Market.selections[].betslipLine` and `Event.betslipLine` values. | string |	Yes | query (using eq, ne, or, and, in) | $filter=betslipLine eq 'FT Winner' |
|sportId| Specifies the identifier of the sport. | number | Yes | query (using eq, ne, or, and, in) | $filter=sportId eq '8' |
|leagueId| Specifies the identifier of the league. | number | Yes | query (using eq, ne, or, and, in) | $filter=leagueId eq '42133' |
|startDate| Specifies the start date and time of the event the market is referring to. Example: 2017-07-21T17:00:00Z, the format of the date and time is according to the International Organization for Standardisation (ISO). |	Date | Yes | No | -- |
|title| Specifies the title of the market. | string | Yes | query (using eq, ne, or, and, in) | $filter=title eq 'World Cup 2019 - Winner' |
|groups| List of groups (by ID) to which the market is included. See "Event # Market groups":https://github.com/WeKnowSports/SportsDataAPI/wiki/Events#marketgroup for details. Note that one market can belong to none, one, or more than one group. |	Array |	Yes | query (using lambda, eq, ne, or, and, in) | $filter=groups/any(s: s eq '1495') |
|inMarketGroups| List of groups (as objects) to which the market is included. | Array | Yes | query (using lambda, eq, ne, or, and, in) | $filter=inMarketGroups/any(s: s/id eq '1495') |
|participantMapping| Specifies a relation of the entire market (with all of its selection) to a specific participant in the parent event. The value matches `Event.participants.id`. | string | Yes | query (using eq, ne, or, and, in) | $filter=participantMapping eq '8400' |
|selections| Lists the selections in the market. | Selection[] | Yes | query (using lambda, eq, ne, or, and, in) | $filter=selections/any(s: s/id eq '0ML32475199_2') |
|eventId| Specifies the identifier of the event. | string | Yes | query (using eq, ne, or, and, in) | $filter=eventId eq '100' |
|entityType| Specifies the entity type. Always 1 for markets. |	ЕntityType | Yes | No | -- |
|isLive| Specifies if the market refers to a live event. | Boolean | Yes | query (using eq, ne) | $filter=isLive eq false |
|isSuspended| Specifies if the market is suspended. No bets are accepted for suspended markets, therefore interaction with them should be disabled or they should be removed from view altogether.	| Boolean | Yes | query (using eq, ne) | $filter=isSuspended eq false |
|tags| Specifies additional information on different aspects of the market. | array | Yes | query (using lambda, eq, ne, or, and, in) | $filter=tags/any(s: s eq 'Cashout') |
|marketType| Contains parameters for the market type. The marketType parameters are described in a separate table below. | MarketType | Yes | query (using lambda, eq, ne, or, and, in) | $filter=marketType/id eq '1_0' |
|liveData| Provides information on the score for the two teams and if the event is suspended. The LiveData parameters are described in a separate table. | LiveData | Yes | query (using lambda, eq, ne, or, and, in) | $filter=liveData/scoreHome eq '40' |
|castMarkets| List of IDs of markets which are cast into this market. Data provided only if this is a cast market. If selections from one listed market can be combined with other selections from the same market, the respective market ID is repeated for the corresponding number of times (e.g. twice for Forecast, thrice for Tricast). |	Array | Yes | query (using lambda, eq, ne, or, and, in) | $filter=castMarkets/any(s: s eq 44147679) |
|metadata| Dictionary of ad hoc parameters which are not part of the general object model. | Dictionary | Yes |	No | -- |


## Market Type

```typescript
type MarketType = {
    id: string
    name: string
    isCastMarket: boolean
}
```

| Name | Description | Format | Returnable | Queryable |
| --- | --- | --- | --- | --- |
|id| Specifies the identifier of the market type. | string | Yes | Yes |
|name| Specifies the name of the market type. | string | Yes | Yes |
|isCastMarket| Specifies is this is a cast market type (For now, only Forecast and Tricast markets for racing events are supported). | boolean |	Yes | Yes |

## Live Data 

```typescript
type LiveData = {
    scoreHome: number
    scoreAway: number
}
```

| Name | Description | Format | Queryable | Returnable |
| --- | --- | --- | --- | --- |
|scoreHome| Specifies the score for the home team. | number | Yes | Yes |
|scoreAway| Specifies the score for the away team. | number | Yes | Yes |


## InMarketGroups 

```typescript
type InMarketGroups = {
    id: string
    sortignKey: number
}
```

| Name | Description |	Format | Queryable | Returnable |
| --- | --- | --- | --- | --- |
|id| Specifies the id of the Event.MarketGroups object which includes this market. | string | Yes | Yes |
|sortingKey| Specifies a key to use for ordering the market in relation to other markets inside the market group. | number | Yes |	Yes |

## Selection 

This object is also specified on separate endpoint /selections. Its whole description you can see via this [link](https://weknowsports.github.io/sports-data/endpoints/selections/pull-contract.html).

## Market.tags
Possible Market.tags entries:
| Tag | Description |
| --- | --- |
|Default| Specifies markets which are always supposed to be one market per event. |
|Cashout| Cashout will be available for bets with selections from this market, under some additional conditions. |
|PulseMarket| For Pulse markets. |
|MBNX| Minimum number of combo selections for the market, where "X" should be replaced by 1, 2, 3 etc. |
|YourBetEligible| Specifies the ability to access Yourbet for the market. |

## Market.metadata
Possible Market.metadata dictionary entries:
| Parameter |	Description | Format | Returnable | Queryable |
| --- | --- | --- | --- | --- |
|oddsTermsId| Only served for markets in Outright events. Specifies the denominator of the each-way fraction of the each-way terms, when such bets are enabled. | number | Yes | No |
|placeTermsId| Only served for markets in Outright events. Specifies the number of places for the place part of the each-way bets, when such bets are enabled. | number | Yes | No |
|fastMarketMinutes| Specifies the minute's range of Soccer fast markets. Example value is "61:00 - 61:59" (to be interpreted as mm:ss - mm:ss). | string | Yes | No |
|fastMarketPeriod| Specifies the period length of Soccer fast markets. Example values are "1m" or "5m". | string | Yes | No |
|fastMarketSet| Specifies the set number in Tennis fast markets. | string | Yes | No |
|fastMarketGame| Specifies the game number in Tennis fast markets. | string | Yes | No |
|fastMarketPoint| Specifies the point number in Tennis fast markets, if relevant. | string | Yes | No |
|pulseLength| Specifies the period in Pulse markets. Possible values: 30s, 1m, 5m, 10m. | string | Yes | No |
