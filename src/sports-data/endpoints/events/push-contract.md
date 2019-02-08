# Push contract
<br>
```json
{
    //The properties with value null are not returning in contract.
    id: string
    participants: Participant[]
    totalMarketsCount: number
    marketLinesCount: number
    status: string
    score: GameScore | null
    isLive: boolean
    liveGameState?: LiveGameState
    isSuspended: boolean
    metadata: Dictionary<any>
}
```
<br>
| Name | Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
| **id** | Specifies the identifier of the sports event. | string | Yes | query (using eq, ne, or, and, in) | $filter=Id eq '11754652' |
|type| Specifies the type of the sports event. Possible values are "Fixture" and "Outright" for most sports and "AntePostRace" and "DayOfEventRace" for racing sports. | string | No | query (using eq, ne, or, and, in) | $filter=type eq (ne) 'Fixture' |
|sportId| Specifies the identifier of the sport. | string | No | query (using eq, ne, or, and, in) | $filter=sportId eq (ne) '12' |
|sportName| Specifies the name of the sport (translated). | string | No | query (using eq, ne, or, and, in) | $filter=sportName eq 'Soccer' |
|sportOrder| Specifies the sorting order of the sport. | number | No | $orderby (only *asc*) | $orderby=sportOrder asc |
|regionId| Specifies the identifier of the region. | string | No | query (using eq, ne, or, and, in) | $filter=regionId eq '260' |
|regionCode| Specifies ISO country code or (for regions in country) region code. | string | No | query (using eq, ne, or, and, in) | $filter=regionCode eq 'EN' |
|regionName| Specifies the name of the region. | string | No | query (using eq, ne, or, and, in) | $filter=regionName eq 'England' |
|leagueId| Specifies the identifier of the league. | string | No | query (using eq, ne, or, and, in) | $filter=leagueId eq '36690' |
|leagueName| Specifies the name (translated) of the league. | string | No | query (using eq, ne, or, and, in) | $filter=leagueName eq 'English Football League Cup' |
|leagueOrder| Specifies the sorting order of the league. | number | No | (using eq, ne, or, and, in) | $filter=leagueOrder eq 580150 |
|isTopLeague| Specifies if the league is marked with a top flag. | Boolean | No | query (using eq, ne) | $filter=isTopLeague eq false |
|  **participants** | Specifies the participants in the event. Parameters of the Participant object are described in a separate table below. | Array | Yes | query (using lambda, eq, ne, or, and, in) | $filter=participants/any(p: p/id eq '357') |
|eventName| Specifies the name of the event. For events of type "Fixture" it is composed of participants name, e.g. "ParticipantHome vs ParticipantAway". Order of teams is reversed if `swapTeams: true`. If you want, you can ignore this value and compose it locally in a different format. | string | No | query (using eq, ne, or, and, in) | $filter=eventName eq 'Chelsea vs Bournemouth' |
|betslipLine| Specifies the presentation of the event in the bet slip in the context of each of its selections. To be used in conjunction with the respective `Market.selections[].betslipLine` and `Market.betslipLine` values.| string | No | query (using eq, ne, or, and, in) | $filter=betslipLine eq 'Clonmel: 12:15' |
|marketGroups| Specifies the market groups defined within the event. | MarketGroup | No | query (using lambda, eq, ne, or, and, in) 
Сan't query this together with marketTypes.| $filter=marketGroups/any(p: p/name eq 'Corners') |
| **totalMarketsCount** | Specifies the total markets count. Not affected by the IncludeMarkets filter, i.e. always returns the total count of available markets for the event. | number | Yes | $orderby (only desc) | $orderby=totalMarketsCount desc |
| **marketLinesCount** | Specifies the total number of markets, with point lines counted as separate markets. Not affected by the IncludeMarkets filter, i.e. always returns the total count of available markets for the event. | number | Yes | query (using lambda, eq, ne, or, and, in) | $filter=marketLinesCount eq 0 |
|totalBets| Number of bets placed for entity. | number | No | $orderby (only desc) | $orderby=totalBets desc |
|totalDeposit| Total deposit of all bets placed for entity. | number | No | $orderby (only asc) | $orderby=startEventDate asc |
|startEventDate| Specifies the date and time of the beginning of the event. | ISODateTimeString | No | $orderby (only asc) | $orderby=startEventDate asc |
| **status** | Specifies the status of the event. Possible values are "NotStarted", "InProgress" (for most sports), "RaceOff" (for racing sports), "Resulted" (supported only for racing sports got now; events from other sports will be removed before moving into this status). | string | Yes | query (using eq, ne, or, and, in) | $filter=status eq 'NotStarted' |
| **score** |	Specifies the current score of the event. | GameScore |	Yes | query (using lambda, eq, ne, or, and, in) | $filter=score/awayScore eq '0' |
| **isLive** | Specifies if the event is currently traded live. | Boolean | Yes | query (using eq, ne) | $filter=isLive eq false |
|isGoingLive| Specifies if the event is going live when started, can be true for pre-match events only. | Boolean | No | query (using eq, ne) | $filter=isGoingLive eq false |
| **liveGameState** |	Specifies additional information on the event such as status, score, current time. See all parameters in a table below. | LiveGameState | Yes | query (using lambda, eq, ne, or, and, in) | $filter=liveGameState/gamePart eq 'SecondHalf' |
|tags| Specifies additional information on the event. | string | No |	query (using lambda, eq, ne, or, and, in) | $filter=tags/any(s: s eq 'LiveStream') |
|media|	Specifies list of available mapping data to external media providers for the event, such us live streaming, statistics, match tracker widgets etc. | Media | No | query (using lambda, eq, ne, or, and, in) | $filter=media/any(p: p/mediaType eq 'LiveStreaming') |
| **metadata** | Specifies additional information on the event. | string | Yes | No | -- |
| **isSuspended** | Specifies if the event is suspended. | boolean | Yes | query (using eq, ne) | $filter=isSuspended eq false |
|isTeamSwap| Specifies if the suggested presentation of the event implies to show the away team first. Relevant only for Fixture events. | boolean | No | query (using eq, ne) | $filter=isTeamSwap eq false |
